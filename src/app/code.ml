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
  let let_id = id ^ "\\|( +[!=+-*/^:]+ +)" in
  let uid = "\\b[A-Z][A-Za-z0-9_']*" in
  (* Arguments to functions may pattern match.  Final "\\." to allow
     "..." in argument (sometimes used for explanations). *)
  let args = "\\(\\?(" ^ id ^ " *=[^=()]+) +\\|[~?]" ^ id ^ "[ :]+\\|() *\\|"
             ^ id ^ " +\\|(" ^ id ^ ") +\\|\\.+ +\\)+" in
  let subst = [ (* regex, replacement *)
    (let cmt_txt = "\\([^()]\\|([^*][^()]*[^*])\\)*" in
     "\\((\\*\\((\\*" ^ cmt_txt ^ "\\*)\\|" ^ cmt_txt ^ "\\)+\\*)\\)",
     "<span class=\"ocaml-comment\">\\1</span>");
    ("\\blet +() *=", "<span class=\"kwa\">let</span> () =");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) *= *function",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\2</span> \
      = <span class=\"kwb\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) +\\("
     ^ args ^ "\\)= *function",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\2</span> \
      <span class=\"ocaml-variable\">\\3</span>= \
      <span class=\"kwb\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) +\\(" ^ args ^ "\\)=",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\2</span> \
      <span class=\"ocaml-variable\">\\3</span>=");
    ("\\b\\(let +\\(rec +\\)?\\|and +\\)\\(" ^ let_id ^ "\\) *=",
     "<span class=\"kwa\">\\1</span>\
      <span class=\"ocaml-variable\">\\3</span> =");
    ("\\bexternal +\\(" ^ let_id ^ "\\) +:",
     "<span class=\"kwa\">external</span> \
      <span class=\"ocaml-function\">\\1</span>&nbsp;:");
    ("type +\\(\\('[a-z_]+ +\\)*\\)\\(" ^ id ^ "\\) *=",
     "type \\1<span class=\"ocaml-mod\">\\3</span> =");
    ("\\(" ^ uid ^ "\\)\\.",
     "<span class=\"ocaml-mod\">\\1</span>.");
    ("open +\\(\\(" ^ uid ^ "\\.\\)*\\)\\(" ^ uid ^ "\\)",
     "<span class=\"kwa\">open</span> \\1<span class=\"ocaml-mod\">\\3</span>");
    ("module +\\(" ^ uid ^ "\\) *= *\
                            \\(\\(" ^ uid ^ "\\.\\)*\\)\\(" ^ uid ^ "\\)",
     "<span class=\"kwa\">module</span> <span class=\"ocaml-mod\">\\1</span> \
      = \\2<span class=\"ocaml-mod\">\\4</span>");
    ("module +\\(" ^ uid ^ "\\) *= *struct",
     "<span class=\"kwa\">module</span> <span class=\"ocaml-mod\">\\1</span> \
      = <span class=\"kwa\">struct</span>");
    ("\\b\\(class\\( +virtual\\|\\)?\\) +\\(" ^ id ^
       "\\) +\\(\\(" ^ args ^ "\\)?\\)=",
     "<span class=\"kwa\">\\1</span> <span class=\"ocaml-function\">\\3</span> \
      <span class=\"ocaml-variable\">\\4</span>=");
    ("\\bval +\\(" ^ id ^ "\\) *=",
     "<span class=\"kwa\">val</span> <span class=\"ocaml-variable\">\\1</span> \
      =");
    ("\\bmethod +\\(" ^ id ^ "\\) *=",
     "<span class=\"kwa\">method</span> <span class=\"ocaml-function\">\
      \\1</span> =");
    ("\\b\\(type\\|in\\|begin\\|end\\|val\\|\
      object\\|inherit\\|initializer\\)\\b",
     "<span class=\"kwa\">\\1</span>");
    ("\\b\\(fun\\|as\\|of\\|if\\|then\\|else\\|match\\|with\
      \\|for\\|to\\|do\\|downto\\|done\\|while\
      \\|raise\\|failwith\\|try\\|assert\
      \\|ref\\|mutable\\|new\\)\\b",
     "<span class=\"kwb\">\\1</span>");
  ] in
  let subst = List.map (fun (re, t) -> (Str.regexp re, t)) subst in
  fun phrase -> (
    List.fold_left (fun h (re, t) -> Str.global_replace re t h) phrase subst
  )


let highlight ?(syntax="ocaml") phrase =
  if syntax = "ocaml" then highlight_ocaml (html_encode phrase)
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
  Toploop.max_printer_steps := 20;
  (* Add #load and #install_printer *)
  let load cma =
    Dynlink.allow_unsafe_modules true;
    let cma = Filename.(if is_relative cma then concat Conf.standard_library cma
                        else cma) in
    try Dynlink.loadfile (Dynlink.adapt_filename cma)
    with Dynlink.Error e ->
      eprintf "#load %S: %s\n" cma (Dynlink.error_message e) in
  Toploop.(Hashtbl.add directive_table "load" (Directive_string load))

type outcome =
  | Normal of string * string * string (* exec output, stdout, stderr *)
  | Error of string

let is_ready_for_read fd =
  let fd_for_read, _, _ = Unix.select [fd] [] [] 0.001 in
  fd_for_read <> []

let string_of_fd fd =
  let buf = Buffer.create 1024 in
  let s = String.create 256 in
  while is_ready_for_read fd do
    let r = Unix.read fd s 0 256 in
    Buffer.add_substring buf s 0 r
  done;
  Buffer.contents buf

let init_stdout = Unix.dup Unix.stdout
let init_stderr = Unix.dup Unix.stderr

let toploop_eval phrase =
  flush stderr;
  let (out_in, out_out) = Unix.pipe() in
  Unix.dup2 out_out Unix.stdout; (* Unix.stdout → out_out *)
  let (err_in, err_out) = Unix.pipe() in
  Unix.dup2 err_out Unix.stderr; (* Unix.stderr → err_out *)
  let get_stdout_stderr_and_restore () =
    flush stdout;
    let out = string_of_fd out_in in
    Unix.close out_in;
    Unix.close out_out;
    Unix.dup2 init_stdout Unix.stdout; (* restore initial stdout *)
    flush stderr;
    let err = string_of_fd err_in in
    Unix.close err_in;
    Unix.close err_out;
    Unix.dup2 init_stderr Unix.stderr; (* restore initial stderr *)
    (out, err) in
  try
    let lexbuf = Lexing.from_string phrase in
    let phrase = !Toploop.parse_toplevel_phrase lexbuf in
    ignore(Toploop.execute_phrase true Format.str_formatter phrase);
    let exec_output = Format.flush_str_formatter () in
    let out, err = get_stdout_stderr_and_restore () in
    Normal(exec_output, out, err)
  with
  | e ->
     let out, err = get_stdout_stderr_and_restore () in
     print_string out;
     prerr_string err;
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
   Element("span", ["class", "ocamltop-input"], [Data(highlight_ocaml phrase)]);
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

(* Process [err_msg] to see whether one needs to highlight part of the
   [phrase].  *)
let highlight_error phrase err_msg =
  (* The indices of the error are [c1, c2[. *)
  let locate_error c1 c2 =
    let len = String.length phrase in
    if c1 >= len || c1 < 0 || c2 < 0 then
      html_encode phrase, err_msg
    else
      let p1 = String.sub phrase 0 c1
      and p2, p3 = if c2 >= len then (String.sub phrase c1 (len - c1), "")
                   else (String.sub phrase c1 (c2 - c1),
                         String.sub phrase c2 (len - c2)) in
      let phrase = html_encode p1 ^ "<span class=\"ocamltop-error-loc\">"
                   ^ html_encode p2 ^ "</span>" ^ html_encode p3 in
      let nl = 1 + String.index err_msg '\n' in
      let err_msg = String.sub err_msg nl (String.length err_msg - nl) in
      phrase, err_msg in
  try  sscanf err_msg "Characters %i-%i: " locate_error
  with Scan_failure _ | End_of_file -> html_encode phrase, err_msg

let html_of_eval phrase =
  let phrase, cls, out = match toploop_eval (phrase ^ ";;") with
    | Normal(s, out, err) ->
       let phrase, err = highlight_error phrase err in
       phrase, "ocamltop-output",
       Nethtml.([Element("span", ["class", "ocamltop-stdout"],
                         [Data(html_encode out)]);
                 Element("span", ["class", "ocamltop-stderr"],
                         [Data(html_encode err)]);
                 Data(html_encode s)])
    | Error s ->
       let phrase, s = highlight_error phrase s in
       phrase, "ocamltop-error", [Nethtml.Data(html_encode s)] in
  format_eval_input phrase
  @ Nethtml.([ Element("br", [], []);
               Element("span", ["class", cls], out) ])


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


(* If option "silent" is passed, send the code to the toplevel but
   don't render the output in result -- just the beginning "#" and ending
   ";;" to remain coherent with other eval_ocaml phrases.

   If option "noeval" is passed, don't send the phrases to the toplevel
   at all, only highlight. This is useful for incomplete or
   purposedfully wrong code.
*)

let ocaml path_from_base ctx args =
  let process_phrases f =
    let phrases = split_phrases (text_of_html ctx#content) in
    List.concat (List.map f phrases) in
  match args with
    | ["silent"] -> process_phrases html_of_eval_silent
    | ["noeval"] ->
       let code = html_encode (trim (text_of_html ctx#content)) in
       let open Nethtml in
       [Element("span", ["class", "listing"], [Data(highlight_ocaml code)])]

    | other ->
      if other <> [] then
        eprintf "unkonwn \"ocaml\" args %S\n" (String.concat " " args);
      process_phrases html_of_eval
