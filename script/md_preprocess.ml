(* Script preprocessing Markdown to enable special conventions. *)

open Printf

(* Code evaluation
 ***********************************************************************)

let toplevel = Code.toplevel()

(* FIXME: Once evaluated, the code blocks are rendered to HTML <pre>.
   These must necessarily start at the beginning of lines and thus
   cannot be, say, in blockquotes (this does not seem to be a problem
   with omd though). *)
let rec eval_code_blocks md =
  let open Omd in
  match md with
  | Code_block("tryocaml", code) :: tl
  | Code_block("ocamltop", code) :: tl ->
     let html = Code.to_html toplevel code in
     Html_block("<pre><code class=\"ocamltop\">" ^ html ^ "</code></pre>")
     :: eval_code_blocks tl
  | Code_block("ocaml", code) :: tl ->
     let html = Code.highlight code in
     Html_block("<pre><code class=\"ocaml\">" ^ html ^ "</code></pre>")
     :: eval_code_blocks tl
  | Blockquote t :: tl ->
     (* Order of evaluation is important: the code in [Blockquote] may
        be needed by later blocks. *)
     let t = eval_code_blocks t in
     Blockquote t :: eval_code_blocks tl
  | e :: tl ->
     (* FIXME: do we want to recurse in other tags? *)
     e :: eval_code_blocks tl
  | [] -> []


(* Solutions toggle
 ***********************************************************************)

let toggle_js =
  Omd.Html "<script type=\"text/javascript\">
function toggleContent(id) {
  // Get the DOM reference
  var el = document.getElementById(id);
  // Toggle
  el.style.display == \"block\" ? el.style.display = \"none\"
                                : el.style.display = \"block\";
}
</script>\n"

let n_button = ref 0

let make_toggle_button title html =
  incr n_button;
  let h = sprintf "<button onclick=\"toggleContent('ocamlorg%i')\" \
                   class=\"solution\">%s</button>\n<div class=\"solution\" \
                   id=\"ocamlorg%i\">%s</div>"
                  !n_button title !n_button html in
  Omd.Html h

(** Finds "SOLUTION" directly followed by a Blockquote and transform
    those to HTML. *)
let rec toggle_solutions any_change md =
  let open Omd in
  match md with
  | Text "SOLUTION" :: NL :: Blockquote sol :: md
  | Text "SOLUTION" :: NL :: NL :: Blockquote sol :: md
  | Paragraph [Omd.Text "SOLUTION"] :: Blockquote sol :: md
  | Paragraph [Omd.Text "SOLUTION"] :: NL :: Blockquote sol :: md ->
     any_change := true;
     (* FIXME: must colorize the code and execute it. *)
     let html = Omd.to_html sol in
     make_toggle_button "Solution" html :: toggle_solutions any_change md
  | e :: md ->

     e :: toggle_solutions any_change md
  | [] -> []


let () =
  let ch = new Netchannels.input_channel stdin in
  let md = Netchannels.string_of_in_obj_channel ch in
  let md = Omd.of_string md in
  (* Enable custom transformations. *)
  let md = eval_code_blocks md in
  let any_change = ref false in
  let md = toggle_solutions any_change md in
  let md = if !any_change then toggle_js :: md else md in
  print_string(Omd.to_markdown md)


(* Local Variables: *)
(* compile-command: "make -k -C .. script/md_preprocess" *)
(* End: *)
