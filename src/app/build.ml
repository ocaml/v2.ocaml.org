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

(* To avoid symlinks for the images but still share them accross the
   various translations of the website, one need to change the paths
   of the images of translated sites. *)

let rec drop_last = function
  | [] | [_] -> []
  | a :: tl -> a :: drop_last tl

let dir_from_base p =
  let path = Path.from_base_split p in
  if Path.filename p = "" then path else drop_last path

let modify_img_path ~img_dir p ((src, url) as arg) =
  let url = Neturl.split_path url in
  let path = Neturl.norm_path(dir_from_base p @ url) in
  match path with
  | "img" :: sub_path ->
     let url' = Path.to_base p ^ img_dir ^ Neturl.join_path sub_path in
     (src, url')
  | _ -> arg

let rec img_path_translations ~img_dir p html =
  List.map (modify_img_path_element ~img_dir p) html

and modify_img_path_element ~img_dir p = function
  | Nethtml.Element("img", args, content) ->
     let src, args = List.partition (fun (a,_) -> a = "src") args in
     let src = List.map (modify_img_path ~img_dir p) src in
     Nethtml.Element("img", src @ args, content)
  | Nethtml.Element(e, args, content) ->
     Nethtml.Element(e, args, img_path_translations ~img_dir p content)
  | Nethtml.Data _ as e -> e



let () =
  let b = Weberizer.Binding.make() in

  let re_filter = Str.regexp "\\(menu\\|OCAML\\).*" in
  let filter p = not(Str.string_match re_filter (Path.filename p) 0) in

  let langs = ["en"; "fr"; "de"; "es"; "it"; "ja"] in
  let out_dir lang =
    if lang = "en" then "www" else Filename.concat "www" lang in
  let rel_dir l1 l2 =
    (* Path to go from the base directory for language [l1] to the one
       for [l2]. *)
    if l1 = "en" then l2
    else if l2 = "en" then ".."
    else "../" ^ l2 in
  let process_html lang p =
    printf "Processing %s\n" (Path.full p);
    let tpl = OCamlWeb_Main.lang tpl lang in
    let tpl = OCamlWeb_Main.url_base tpl (Weberizer.Path.to_base p) in
    let url_base = if Path.in_base p then "" else Path.to_base p in
    Weberizer.Binding.string b "url_base" url_base;
    let page = Weberizer.read (Path.full p) ~bindings:b in
    let tpl = OCamlWeb_Main.title tpl (Weberizer.title_of page) in
    let prefix = if lang = "en" then "" else "../" in
    let img_dir = url_base ^ prefix ^ "img/" in
    let tpl = OCamlWeb_Main.img_dir tpl img_dir in
    let tpl = OCamlWeb_Main.css_dir tpl (url_base ^ prefix ^ "css/") in
    let tpl = OCamlWeb_Main.javascript_dir tpl (url_base ^ prefix ^ "js/") in
    let body = Weberizer.body_of page in
    let body = Weberizer.protect_emails body in
    let body = img_path_translations p body ~img_dir in
    let tpl = OCamlWeb_Main.main tpl body in

    let tpl = add_menu tpl lang in

    let tpl = OCamlWeb_Main.navigation_of_path tpl p in
    let tpl = OCamlWeb_Main.languages tpl
                                      (Path.translations p ~langs ~rel_dir) in
    OCamlWeb_Main.render tpl
  in
  Weberizer.iter_html ~filter ~langs "src/html" ~out_dir process_html
                      ~perm:0o755
