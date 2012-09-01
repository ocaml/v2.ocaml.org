open Printf
open Nethtml
module Path = Weberizer.Path


(* Settings common to all pages. *)
let tpl = OCamlWeb_Main.shortcut_icon OCamlWeb_Main.empty
  "https://static.ocamlcore.org/official/images/favicon.ico"

(* more = <li class="active"><a href="#">Tutorial</a></li>
   for and additional menu. *)
let add_menu ?(more=[]) tpl lang p =
  let menu =
    if lang = "en" then "src/html/menu.html"
    else "src/html/menu." ^ lang ^ ".html" in
  let m = Weberizer.body_of(Weberizer.read menu) @ more in
  let m = Weberizer.relative_url_are_from_base p m in
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

(* [img_dir]: path to images from the location [p] points to. *)
let modify_img_path ~img_dir p ((src, url) as arg) =
  let url = Neturl.split_path url in
  let path = Neturl.norm_path(dir_from_base p @ url) in
  match path with
  | "img" :: sub_path ->
     let url' = img_dir ^ Neturl.join_path sub_path in
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


module Toc = struct
  type entry = {
    title : string;
    anchor: string;
    level: int;
  }

  let rec text_of_html html =
    String.concat "" (List.map text_of_el html)
  and text_of_el = function
    | Element(_, _, content) -> text_of_html content
    | Data d -> d

  let rec get_anchor = function
    | [] -> ""
    | e :: tl ->
       let a = get_anchor_el e in
       if a = "" then get_anchor tl else a
  and get_anchor_el = function
    | Element("a", args, content) ->
       (try List.assoc "name" args
        with Not_found -> get_anchor content)
    | Element(_, _, content) -> get_anchor content
    | Data _ -> ""

  let rec collect_toc html =
    List.concat (List.map collect_toc_el html)
  and collect_toc_el = function
    | Element(("h1" | "h2" | "h3" | "h4" | "h5" | "h6") as e, args, content) ->
       let level = int_of_string(String.sub e 1 1) in
       let title = text_of_html content
       and anchor = get_anchor content in
       [{ title; anchor; level }]
    | Element(_, _, content) -> collect_toc content
    | Data _ -> []

  let html_of_entry e =
    let h = if e.anchor = "" then Data e.title
            else Element("a", ["href", "#" ^ e.anchor], [Data e.title]) in
    Element("li", ["class", "toc-entry"], [h])

  let ul_of_entries html =
    Element("ul", ["class", "toc-sub"], List.rev html)

  let rec to_html_sub level html toc =
    match toc with
    | [] -> ul_of_entries html, [] (* no toc entries, return html we got *)
    | e :: tl ->
       if e.level = level then
         to_html_sub level (html_of_entry e :: html) tl
       else if e.level > level then (* Sub-entry *)
         let h, toc = to_html_sub e.level [] toc in
         to_html_sub level (h :: html) toc
       else (* e.level < level; return to higher level *)
         ul_of_entries html, toc

  let to_html ~level toc =
    let html, _ = to_html_sub level [] toc in
    [Element("div", ["class", "toc"], [html])]

  let make args ~content html =
    let entries = collect_toc html in
    let entries, level =
      try
        match args with
        | [low] ->
           let low = int_of_string low in
           List.filter (fun e -> e.level >= low) entries, low
        | [low; hi] ->
           let low = int_of_string low and hi = int_of_string hi in
           List.filter (fun e -> e.level >= low && e.level <= hi) entries, low
        | _ ->
           (* By default, <h1> is the main title of the page. *)
           List.filter (fun e -> e.level >= 2) entries, 2
      with Failure _ ->
        invalid_arg "[toc ?low ?hi] and bound must be integers."
    in
    to_html ~level entries

end

let () =
  let b = Weberizer.Binding.make() in
  Weberizer.Binding.fun_html b "rss" Render_rss.of_urls;
  Weberizer.Binding.fun_html b "news" Render_rss.news;
  Weberizer.Binding.fun_html b "opml" Render_rss.OPML.of_urls;
  Weberizer.Binding.fun_html b "toc" Toc.make;
  Weberizer.Binding.fun_html b "ocaml" Code.eval_ocaml;

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

    let tpl = add_menu tpl lang p in

    let tpl = OCamlWeb_Main.navigation_of_path tpl p in
    let tpl = OCamlWeb_Main.languages tpl
                                      (Path.translations p ~langs ~rel_dir) in
    OCamlWeb_Main.render tpl
  in
  Weberizer.iter_html ~filter ~langs "src/html" ~out_dir process_html
                      ~perm:0o755
