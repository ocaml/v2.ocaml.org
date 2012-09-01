(* Syntax hightlight code and eval ocaml toplevel phrases *)

open Printf


(* To HTML, with syntax highlighting
 ***********************************************************************)

let html_encode = Netencoding.Html.encode ~in_enc:`Enc_utf8 ()

let input_all fh =
  let len = 256 in
  let buf = Buffer.create len in
  let s = String.create len in
  let read = ref 1 in (* enter the loop *)
  while !read > 0 do
    read := input fh s 0 len;
    Buffer.add_substring buf s 0 !read;
  done;
  Buffer.contents buf


let highlight ?(syntax="ocaml") phrase =
  let pgm = sprintf "highlight --syntax=%s --out-format=xhtml --fragment"
                    syntax in
  let o, i = Unix.open_process pgm in
  output_string i phrase;
  close_out i;            (* No output is performed before *)
  let html = input_all o in
  match Unix.close_process (o, i) with
  | Unix.WEXITED st ->
     if st = 0 then
       (* Strip final \n *)
       if html <> "" && html.[String.length html - 1] = '\n' then
         String.sub html 0 (String.length html - 1)
       else
         html
     else
       (* Program not found or problem *)
       html_encode phrase
  | Unix.WSIGNALED _ | Unix.WSTOPPED _ -> assert false



(* Eval OCaml code — in the same way the toploop does
 ***********************************************************************)

let () =
  Toploop.set_paths ();
  Toploop.initialize_toplevel_env();
  (* (match Hashtbl.find Toploop.directive_table "rectypes" with *)
  (*  | Toploop.Directive_none f -> f () *)
  (*  | _ -> assert false); *)
  Toploop.input_name := ""; (* no filename *)
  Toploop.max_printer_steps := 20

type outcome =
  | Normal of string
  | Error of string

let toploop_eval phrase =
  (* Inspired by Stog. *)
  try
    let lexbuf = Lexing.from_string phrase in
    let phrase = !Toploop.parse_toplevel_phrase lexbuf in
    ignore(Toploop.execute_phrase true Format.str_formatter phrase);
    let exec_output = Format.flush_str_formatter () in
    (* FIXME: capture also stdout and stderr but only during the
       execution of this function. *)
    Normal exec_output
  with
  | e ->
     let backtrace_enabled = Printexc.backtrace_status () in
     if not backtrace_enabled then Printexc.record_backtrace true;
     (try Errors.report_error Format.str_formatter e
      with exn ->
        printf "Code.eval: the following error was raised during phrase \
                error reporting:\n%s\nError backtrace:\n%s\n%!"
               (Printexc.to_string exn) (Printexc.get_backtrace ());
     );
     if not backtrace_enabled then Printexc.record_backtrace false;
     Error(Format.flush_str_formatter ())


let html_of_eval phrase =
  let cls, out = match toploop_eval (phrase ^ ";;") with
    | Normal s -> "ocamltop-output", s
    | Error s ->  "ocamltop-error", s in
  let open Nethtml in
  [Element("span", ["class", "ocamltop-prompt"], [Data "# "]);
   Element("span", ["class", "ocamltop-input"], [Data (highlight phrase)]);
   Element("span", ["class", "ocamltop-prompt"], [Data ";;"]);
   Element("br", [], []);
   Element("span", ["class", cls], [Data (highlight out)]) ]


let rec text_of_html html =
  String.concat "" (List.map text_of_el html)
and text_of_el = function
  | Nethtml.Element(_, _, content) -> text_of_html content
  | Nethtml.Data d -> d

(* FIXME: Use String.trim when 4.00.0 is spead enough. *)
let is_space = function
  | ' ' | '\012' | '\n' | '\r' | '\t' -> true
  | _ -> false

let trim s =
  let len = String.length s in
  let i = ref 0 in
  while !i < len && is_space (String.unsafe_get s !i) do
    incr i
  done;
  let j = ref (len - 1) in
  while !j >= !i && is_space (String.unsafe_get s !j) do
    decr j
  done;
  if !i = 0 && !j = len - 1 then
    s
  else if !j >= !i then
    String.sub s !i (!j - !i + 1)
  else
    ""

(* FIXME: naive, ";;" can occur inside strings and one does not want
   to split it then.  Could be more efficient *)
let end_of_phrase = Str.regexp ";;[ \t\n]*"

let split_phrases text =
  List.map trim (Str.split end_of_phrase text)

let rec concat_html_phrases = function
  | [] -> []
  | p :: tl ->
     p @ (Nethtml.Element("br", [], []) :: concat_html_phrases tl)

let eval_ocaml args ~content _page =
  let phrases = split_phrases(text_of_html content) in
  concat_html_phrases (List.map html_of_eval phrases)

