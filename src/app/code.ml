(* Syntax hightlight code and eval ocaml toplevel phrases *)

open Printf
open Scanf

(* To HTML, with syntax highlighting
 ***********************************************************************)

let html_encode = Netencoding.Html.encode ~in_enc:`Enc_utf8 ()

let highlight_ocaml =
  (* Simple minded engine to highlight OCaml code.  The [phrase] is supposed
     to be html encoded. *)
  let id = "\\b[a-z_][a-zA-Z0-9_']*" in
  (* Arguments to functions may pattern match. *)
  let args = "[^=<>]+" in
  let subst = [ (* regex, replacement *)
    (let cmt_txt = "\\([^()]\\|([^*][^()]*[^*])\\)*" in
     "\\((\\*\\((\\*" ^ cmt_txt ^ "\\*)\\|" ^ cmt_txt ^ "\\)+\\*)\\)",
     "<span class=\"ocaml-comment\">\\1</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ id ^ " +\\)\\("
     ^ args ^ "\\)= *function",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\2</span>\
      <span class=\"ocaml-variable\">\\3</span>= \
      <span class=\"kwb\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ id ^ " +\\)\\(" ^ args ^ "\\)=",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\2</span>\
      <span class=\"ocaml-variable\">\\3</span>=");
    ("\\b\\(let +\\(rec +\\)?\\|and +\\)\\(" ^ id ^ "\\) *=",
     "<span class=\"kwa\">\\1</span>\
      <span class=\"ocaml-variable\">\\3</span> =");
    ("type +\\(\\('[a-z_]+ +\\)*\\)\\(" ^ id ^ "\\) *=",
     "type \\1<span class=\"ocaml-mod\">\\3</span> =");
    ("\\b\\(type\\|in\\|begin\\|end\\|val\\)\\b",
     "<span class=\"kwa\">\\1</span>");
    ("\\b\\(fun\\|as\\|of\\|if\\|then\\|else\\|match\\|with\
      \\|for\\|to\\|do\\|done\\|failwith\\|assert\\)\\b",
     "<span class=\"kwb\">\\1</span>");
  ] in
  let subst = List.map (fun (re, t) -> (Str.regexp re, t)) subst in
  fun phrase -> (
    List.fold_left (fun h (re, t) -> Str.global_replace re t h) phrase subst
  )


let highlight ?(syntax="ocaml") phrase =
  if syntax = "ocaml" then highlight_ocaml phrase
  else html_encode phrase


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

let format_eval_input phrase =
  let open Nethtml in
  [Element("span", ["class", "ocamltop-prompt"], [Data "# "]);
   Element("span", ["class", "ocamltop-input"], [Data (highlight phrase)]);
   Element("span", ["class", "ocamltop-prompt"], [Data ";;"])]

let html_of_eval_silent phrase =
  begin match toploop_eval (phrase ^ ";;") with
    | Normal _ -> ()
    | Error s ->
       (* as no output shows in the rendered page,
          we deem it useful to have errors reported
          at least in the compilation buffer. *)
       eprintf "Error %S during silent evaluation of the phrase %S\n" s phrase
  end;
  format_eval_input phrase

let html_of_eval phrase =
  let phrase, cls, out = match toploop_eval (phrase ^ ";;") with
    | Normal s -> html_encode phrase, "ocamltop-output", s
    | Error s ->
       (* Process the error to see whether one needs to highlight part of
          the phrase. *)
       try
         let locate_error c1 c2 =
           let len = String.length phrase in
           if len = 0 then
             phrase, "ocamltop-error", s
           else
             let p1 = String.sub phrase 0 c1
             and p2 = String.sub phrase c1 (c2 - c1)
             and p3 = if c2 >= len then ""
                      else String.sub phrase c2 (len - c2) in
             let phrase = html_encode p1 ^ "<span class=\"ocamltop-error-loc\">"
                          ^ html_encode p2 ^ "</span>" ^ html_encode p3 in
             let nl = 1 + String.index s '\n' in
             let s = String.sub s nl (String.length s - nl) in
             phrase, "ocamltop-error", s in
         sscanf s "Characters %i-%i: " locate_error
       with Scan_failure _ ->
         html_encode phrase, "ocamltop-error", s in
  let open Nethtml in
   format_eval_input phrase
   @ [ Element("br", [], []);
       Element("span", ["class", cls], [Data (html_encode out)]) ]


(* Returns a string containing the data in [html]. *)
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


(* Include code from a file
 ***********************************************************************)

let lines_of_file fname l1 l2 =
  let buf = Buffer.create 1024 in
  let fh = open_in fname in
  let l = ref 1 in
  (try
      while !l < l1 do ignore(input_line fh); incr l done;
      while !l <= l2 do
        Buffer.add_string buf (input_line fh);
        Buffer.add_char buf '\n';
        incr l;
      done
    with End_of_file -> ());
  close_in fh;
  Buffer.contents buf


(* If option "silent" is passed, send the code to the toplevel but
   don't render the output in result -- just the beginning "#" and ending
   ";;" to remain coherent with other eval_ocaml phrases.

   If option "noeval" is passed, don't send the phrases to the toplevel
   at all, only highlight. This is useful for incomplete or
   purposedfully wrong code.
*)

let ocaml ctx args =
  let process_phrases f =
    let phrases = split_phrases (text_of_html ctx#content) in
    List.concat (List.map f phrases) in
  match args with
    | ["silent"] -> process_phrases html_of_eval_silent
    | ["noeval"] -> [Nethtml.Data (highlight_ocaml (text_of_html ctx#content))]
    | ["--inc"; fname; l1; l2]
    | ["--include"; fname; l1; l2] ->
       let l1 = int_of_string l1 and l2 = int_of_string l2 in
       let code = lines_of_file fname l1 l2 in
       [Nethtml.Data (highlight_ocaml (html_encode code))]

    | other ->
      if other <> [] then
        eprintf "unkonwn \"ocaml\" args %S\n" (String.concat " " args);
      process_phrases html_of_eval
