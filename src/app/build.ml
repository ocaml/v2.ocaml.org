open Printf
open Nethtml
module Path = Weberizer.Path


(* Settings common to all pages. *)
let tpl = OCamlOrg_Main.search_name OCamlOrg_Main.empty "Search"
let tpl = OCamlOrg_Main.shortcut_icon tpl
  "https://static.ocamlcore.org/official/images/favicon.ico"

let menu = Weberizer.body_of(Weberizer.read "src/html/menu.html")

let add_menu tpl p =
  if not(Path.in_base p && Path.filename p = "index.html") then
    let tpl = OCamlOrg_Main.main_width tpl "84%" in
    OCamlOrg_Main.menu tpl (Weberizer.relative_url_are_from_base p menu)
  else
    OCamlOrg_Main.main_width tpl "100%"


let () =
  let b = Weberizer.Binding.make() in

  let re_filter = Str.regexp "\\(menu\\|OCAML\\).*" in
  let filter p = not(Str.string_match re_filter (Path.filename p) 0) in

  let langs = ["en"] in
  Weberizer.iter_html ~filter ~langs "src/html" begin fun lang p ->
    printf "Processing %s\n" (Path.full p);
    let tpl = OCamlOrg_Main.url_base tpl (Weberizer.Path.to_base p) in
    let page = Weberizer.read (Path.full p) ~bindings:b in
    let tpl = OCamlOrg_Main.title tpl (Weberizer.title_of page) in
    let body = Weberizer.body_of page in
    let body = Weberizer.protect_emails body in
    let tpl = OCamlOrg_Main.main tpl body in

    let tpl = add_menu tpl p in

    let tpl = OCamlOrg_Main.navigation_of_path tpl p in

    OCamlOrg_Main.render tpl
  end
