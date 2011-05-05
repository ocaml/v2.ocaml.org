open Printf
open Nethtml
module Path = Template.Path


(* Settings common to all pages. *)
let tpl = OCAML.search_name OCAML.empty "Search"
let tpl = OCAML.shortcut_icon tpl
  "https://static.ocamlcore.org/official/images/favicon.ico"

let () =
  let b = Template.Binding.make() in

  let re_filter = Str.regexp "\\(menu\\|OCAML\\).*" in
  let filter p = not(Str.string_match re_filter (Path.filename p) 0) in

  let is_index = Str.regexp "index\\..+" in

  let langs = ["en"] in
  Template.iter_html ~filter ~langs "." begin fun lang p ->
    printf "Processing %s\n" (Path.full p);
    let tpl = OCAML.url_base tpl (Template.Path.to_base p) in
    let page = Template.read (Path.full p) ~bindings:b in
    let tpl = OCAML.title tpl (Template.title_of page) in
    let body = Template.body_of page in
    let body = Template.protect_emails body in
    let tpl = OCAML.main tpl body in

    (* let tpl = add_menu tpl lang p in *)

    let tpl = OCAML.navigation_of_path tpl p in

    OCAML.render tpl
  end
