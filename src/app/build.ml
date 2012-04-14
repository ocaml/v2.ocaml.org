open Printf
open Nethtml
module Path = Weberizer.Path


(* Settings common to all pages. *)
let tpl = OCamlWeb_Main.shortcut_icon OCamlWeb_Main.empty
  "https://static.ocamlcore.org/official/images/favicon.ico"

(* more = <li class="active"><a href="#">Tutorial</a></li>
   for and additional menu. *)
let add_menu ?(more=[]) tpl lang =
  let menu =
    if lang = "en" then "src/html/menu.html"
    else "src/html/menu." ^ lang ^ ".html" in
  let m = Weberizer.body_of(Weberizer.read menu) @ more in
  OCamlWeb_Main.menu tpl m


let () =
  let b = Weberizer.Binding.make() in

  let re_filter = Str.regexp "\\(menu\\|OCAML\\).*" in
  let filter p = not(Str.string_match re_filter (Path.filename p) 0) in

  let langs = ["en"; "fr"; "de"; "es"; "it"; "ja"] in
  let out_dir lang =
    if lang = "en" then "www" else Filename.concat "www" lang in
  let rel_dir l1 l2 =
    if l1 = "en" then l2
    else if l2 = "en" then ".."
    else "../" ^ l2 in
  let process_html lang p =
    printf "Processing %s\n" (Path.full p);
    let tpl = OCamlWeb_Main.lang tpl lang in
    let tpl = OCamlWeb_Main.url_base tpl (Weberizer.Path.to_base p) in
    let page = Weberizer.read (Path.full p) ~bindings:b in
    let tpl = OCamlWeb_Main.title tpl (Weberizer.title_of page) in
    let body = Weberizer.body_of page in
    let body = Weberizer.protect_emails body in
    let tpl = OCamlWeb_Main.main tpl body in

    let tpl = add_menu tpl lang in

    let tpl = OCamlWeb_Main.navigation_of_path tpl p in
    let tpl = OCamlWeb_Main.languages tpl
                                      (Path.translations p ~langs ~rel_dir) in
    OCamlWeb_Main.render tpl
  in
  Weberizer.iter_html ~filter ~langs "src/html" ~out_dir process_html
