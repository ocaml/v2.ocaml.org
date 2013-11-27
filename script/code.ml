(* Syntax hightlight code and eval ocaml toplevel phrases *)

open Printf
open Scanf
open Code_types
open Utils

(* To HTML, with syntax highlighting
 ***********************************************************************)

let html_encode =
  let enc = Netencoding.Html.encode ~in_enc:`Enc_utf8 () in
  fun s ->
  try enc s
  with Netconversion.Malformed_code ->
    failwith(sprintf "Code.html_encode: \"%s\" cannot be encoded to HTML" s)

let html_decode =
  Netencoding.Html.decode ~in_enc:`Enc_utf8 ~out_enc:`Enc_utf8 ()

let highlight_ocaml =
  (* Simple minded engine to highlight OCaml code.  The [phrase] is supposed
     to be html encoded. *)
  let id = "\\b[a-z_][a-zA-Z0-9_']*" in
  let let_id = id ^ "\\|( +[!=+-*/^:]+ +)" in
  let uid = "\\b[A-Z][A-Za-z0-9_']*" in
  (* Arguments to functions may pattern match.  Final "\\." to allow
     "..." in argument (sometimes used for explanations). *)
  let args = "\\(\\?(" ^ id ^ " *=[^=()]+) +\\|[~?]" ^ id ^ "[ :]+\\|() *\\|"
             ^ id ^ " +\\|(" ^ id ^ "\\( *:[^)]+\\)?) +\\|\\.+ +\\)+" in
  let subst = [ (* regex, replacement *)
    (let cmt_txt = "\\([^()]\\|([^*][^()]*[^*])\\)*" in
     "\\((\\*\\((\\*" ^ cmt_txt ^ "\\*)\\|" ^ cmt_txt ^ "\\)+\\*)\\)",
     "<span class=\"comment\">\\1</span>");
    (";;", "<span class=\"ocaml-prompt\">;;</span>");
    ("\\blet +() *=", "<span class=\"governing\">let</span> () =");
    ("\\band +\\('[_a-z]+ +\\(" ^ let_id ^ "\\)\\) *= *",
     "<span class=\"governing\">and</span> \
      <span class=\"type\">\\1</span> = ");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) *= *function",
     "<span class=\"governing\">\\1</span> <span class=\"ocaml-function\">\
      \\2</span> = <span class=\"keyword\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) +\\("
     ^ args ^ "\\)= *function",
     "<span class=\"governing\">\\1</span> <span class=\"ocaml-function\">\
      \\2</span> <span class=\"ocaml-variable\">\\3</span>= \
      <span class=\"keyword\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) +: *\\([^=]+\\)"
     ^ "= *function",
     "<span class=\"governing\">\\1</span> <span class=\"ocaml-function\">\
      \\2</span> : <span class=\"type\">\\3</span>= \
      <span class=\"keyword\">function</span>");
    ("\\b\\(let +rec\\|let\\|and\\) +\\(" ^ let_id ^ "\\) +\\(" ^ args ^ "\\)=",
     "<span class=\"governing\">\\1</span> <span class=\"ocaml-function\">\
      \\2</span> <span class=\"ocaml-variable\">\\3</span>=");
    ("\\b\\(let +\\(rec +\\)?\\|and +\\)\\(" ^ let_id ^ "\\) *=",
     "<span class=\"governing\">\\1</span>\
      <span class=\"ocaml-variable\">\\3</span> =");
    ("\\bexternal +\\(" ^ let_id ^ "\\) +:",
     "<span class=\"governing\">external</span> \
      <span class=\"ocaml-function\">\\1</span>&nbsp;:");
    ("\\btype +\\(\\('[a-z_]+ +\\)*\\)\\(" ^ id ^ "\\)\\( *=\\| *$\\)",
     "type <span class=\"type\">\\1\\3</span>\\4");
    ("open +\\(\\(" ^ uid ^ "\\.\\)*\\)\\(" ^ uid ^ "\\)",
     "<span class=\"governing\">open</span> \\1\
      <span class=\"ocaml-module\">\\3</span>");
    ("\\(" ^ uid ^ "\\)\\.",
     "<span class=\"ocaml-module\">\\1</span>.");
    ("module +\\(" ^ uid ^ "\\) *= *\
                            \\(\\(" ^ uid ^ "\\.\\)*\\)\\(" ^ uid ^ "\\)",
     "<span class=\"governing\">module</span> \
      <span class=\"ocaml-module\">\\1</span> \
      = \\2<span class=\"ocaml-module\">\\4</span>");
    ("\\(module\\|module type\\) +\\(" ^ uid ^ "\\) *"
     ^ "\\(\\(([^)]+)\\)* *\\)=",
     "<span class=\"governing\">\\1</span> \
      <span class=\"ocaml-module\">\\2</span> \
      <span class=\"ocaml-variable\">\\3</span>=");
    ("module +\\(" ^ uid ^ "\\) *\\(\\(([^)]+)\\)* *\\): *\\(" ^ uid ^ "\\) *=",
     "<span class=\"governing\">module</span> \
      <span class=\"ocaml-module\">\\1</span> \
      <span class=\"ocaml-variable\">\\2</span>\
      : <span class=\"ocaml-module\">\\4</span> =");
    ("module +\\(" ^ uid ^ "\\) *\\(\\(([^)]+)\\)* *\\):",
     "<span class=\"governing\">module</span> \
      <span class=\"ocaml-module\">\\1</span> \
      <span class=\"ocaml-variable\">\\2</span>:");
    ("\\b\\(class\\( +virtual\\|\\)?\\) +\\(" ^ id ^
       "\\) +\\(\\(" ^ args ^ "\\)?\\)=",
     "<span class=\"governing\">\\1</span> \
      <span class=\"ocaml-function\">\\3</span> \
      <span class=\"ocaml-variable\">\\4</span>=");
    ("\\bval +\\(" ^ id ^ "\\) *=",
     "<span class=\"governing\">val</span> \
      <span class=\"ocaml-variable\">\\1</span> =");
    ("\\bval +\\(" ^ id ^ "\\) *:",
     "<span class=\"governing\">val</span> \
      <span class=\"ocaml-function\">\\1</span> :");
    ("\\bmethod +\\(" ^ id ^ "\\)\\(\\( *: *[^ =]+\\)?\\) *=",
     "<span class=\"governing\">method</span> <span class=\"ocaml-function\">\
      \\1</span><span class=\"type\">\\2</span> =");
    ("\\bmethod +\\(" ^ id ^ "\\) +\\(" ^ args ^ "\\) *=",
     "<span class=\"governing\">method</span> <span class=\"ocaml-function\">\
      \\1</span> <span class=\"ocaml-variable\">\\2</span>=");
    ("\\b\\(type\\|in\\|begin\\|end\\|struct\\|sig\\|val\\|\
      object\\|inherit\\|initializer\\|include\\)\\b\\([^\"]\\)",
     "<span class=\"governing\">\\1</span>\\2");
    ("\\b\\(end\\)$", "<span class=\"governing\">\\1</span>");
    ("\\b\\(fun\\|as\\|of\\|if\\|then\\|else\\|match\\|with\
      \\|for\\|to\\|do\\|downto\\|done\\|while\
      \\|raise\\|failwith\\|try\\|assert\
      \\|ref\\|mutable\\|new\\)\\b",
     "<span class=\"keyword\">\\1</span>");
  ] in
  let subst = List.map (fun (re, t) -> (Str.regexp re, t)) subst in
  let beg_quot = Str.regexp "&quot;" in
  let end_quot = Str.regexp "[^\\]&quot;" in
  let rec color_string s =
    try
      let i1 = Str.search_forward beg_quot s 0 in
      try
        let i2 = Str.search_forward end_quot s (i1 + 5) + 7 in
        let before = String.sub s 0 i1 in
        let qstring = String.sub s i1 (i2 - i1) in
        let tail = color_string (String.sub s i2 (String.length s - i2)) in
        before ^ "<span class=\"string\">" ^ qstring ^ "</span>" ^ tail
      with Not_found -> s (* quoted string not well terminated, bail out *)
    with Not_found -> s (* no quote *)
  in
  fun phrase -> (
    let phrase = color_string phrase in
    List.fold_left (fun h (re, t) -> Str.global_replace re t h) phrase subst
  )

let highlight ?(syntax="ocaml") phrase =
  if syntax = "ocaml" then highlight_ocaml (html_encode phrase)
  else html_encode phrase


(* Eval OCaml code — in the same way the toploop does
 ***********************************************************************)

type toplevel_ =
  | Sleep of string (* command to execute to start the toplevel *)
  | Run of (in_channel * out_channel)

type toplevel = toplevel_ ref

(* Store the information to start the toplevel — only start it if needed. *)
let toplevel ?(pgm="./script/code_top") () : toplevel =
  ref(Sleep pgm)

let get_toplevel (top: toplevel) =
  match !top with
  | Run t -> t
  | Sleep pgm ->
     let (from_top, _) as t = Unix.open_process pgm in
     top := Run t;
     t

let close_toplevel (top: toplevel) =
  match !top with
  | Sleep _ -> ()
  | Run((from_top, to_top) as top) ->
     (match Unix.close_process top with
      | Unix.WEXITED i -> if i <> 0 then eprintf "WEXITED %i\n%!" i
      | Unix.WSIGNALED i -> eprintf "WSIGNALED %i\n%!" i
      | Unix.WSTOPPED i -> eprintf "WSTOPPED %i\n%!" i)

let toploop_eval (top: toplevel) (phrase: string) : outcome =
  let (from_top, to_top) = get_toplevel top in
  output_string to_top phrase;
  output_string to_top "\n;;\n"; (* code_top excepts ";;" on its own line *)
  flush to_top;
  let o = get_outcome from_top in
  o


let nl_re = Str.regexp "[\n\r]"

let format_eval_input phrase =
  let open Nethtml in
  (* Due to the prompt, one must add 2 spaces at the beginnig of each line *)
  let phrase = Str.global_replace nl_re "\n  " phrase in
  [Element("span", ["class", "ocaml-prompt"], [Data "# "]);
   Element("span", ["class", "ocaml-input"], [Data(highlight_ocaml phrase)]);
   Element("span", ["class", "ocaml-prompt"], [Data ";;"])]

let html_of_eval_silent t phrase =
  begin match toploop_eval t phrase with
    | Normal _ -> ()
    | Error s ->
       (* as no output shows in the rendered page,
          we deem it useful to have errors reported
          at least in the compilation buffer. *)
       eprintf "Error %S during silent evaluation of the phrase %S\n" s phrase
  end;
  format_eval_input phrase


(* Insert the HTML code to highligh the error located in [phrase] at
   chars [c1 .. c2[.  Can raise [Netconversion.Malformed_code]. *)
let highlight_error_range phrase err_msg c1 c2 =
  let len = String.length phrase in
  if c1 >= len || c1 < 0 || c2 < 0 then
    html_encode phrase, err_msg
  else
    let p1 = String.sub phrase 0 c1
    and p2, p3 = if c2 >= len then (String.sub phrase c1 (len - c1), "")
                 else (String.sub phrase c1 (c2 - c1),
                       String.sub phrase c2 (len - c2)) in
    let phrase = html_encode p1 ^ "<span class=\"ocaml-error-loc\">"
                 ^ html_encode p2 ^ "</span>" ^ html_encode p3 in
    let nl = 1 + String.index err_msg '\n' in
    let err_msg = String.sub err_msg nl (String.length err_msg - nl) in
    phrase, err_msg


let error_re312 =
  Str.regexp ".*[Cc]haracters +\\([0-9]+\\)-\\([0-9]+\\)"

let error_re400 =
  Str.regexp ".*line +\\([0-9]+\\),.*\
              [Cc]haracters +\\([0-9]+\\)-\\([0-9]+\\)"

(* Process [err_msg] to see whether one needs to highlight part of the
   [phrase].  *)
let highlight_error phrase err_msg =
  if Str.string_match error_re400 err_msg 0 then (
    let l =  try int_of_string(Str.matched_group 1 err_msg) with _ -> 0 in
    let c1 = int_of_string(Str.matched_group 2 err_msg)
    and c2 = int_of_string(Str.matched_group 3 err_msg) in
    (* Convert the line [1 .. l-1] into character count. *)
    let c = ref 0 in
    for line = 1 to l - 1 do c := String.index_from phrase !c '\n' + 1 done;
    highlight_error_range phrase err_msg (c1 + !c) (c2 + !c)
  )
  else if Str.string_match error_re312 err_msg 0 then (
    let c1 = int_of_string(Str.matched_group 1 err_msg)
    and c2 = int_of_string(Str.matched_group 2 err_msg) in
    highlight_error_range phrase err_msg c1 c2
  )
  else
    html_encode phrase, err_msg

let html_of_eval t phrase =
  let phrase, cls, out = match toploop_eval t phrase with
    | Normal(s, out, err) ->
       let phrase, err = highlight_error phrase err in
       phrase, "ocaml-output",
       Nethtml.([Element("span", ["class", "ocaml-stdout"],
                         [Data(html_encode out)]);
                 Element("span", ["class", "ocaml-stderr"],
                         [Data(html_encode err)]);
                 Data(html_encode s)])
    | Error s ->
       let phrase, s = highlight_error phrase s in
       phrase, "ocaml-error", [Nethtml.Data(html_encode s)] in
  format_eval_input phrase
  @ Nethtml.([ Element("br", [], []);
               Element("span", ["class", cls], out) ])


(* FIXME: naive, ";;" can occur inside strings and one does not want
   to split it then.  Could be more efficient *)
let end_of_phrase = Str.regexp ";;[ \t\n]*"


let to_html t phrases =
  (* Split phrases *)
  let phrases = List.map String.trim (Str.split end_of_phrase phrases) in
  let html = List.concat (List.map (html_of_eval t) phrases) in
  let buf = Buffer.create 1024 in
  Nethtml.write (new Netchannels.output_buffer buf) html;
  Buffer.contents buf
