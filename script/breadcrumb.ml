(* Enable breadcrumb navigation on deeper level pages *)

open Printf
open Utils

let string_of_file fname =
  let buf = Buffer.create 4096 in
  let fh = open_in fname in
  let s = String.create 1024 in
  let n = ref 1 in (* enter the loop *)
  while !n > 0 do
    n := input fh s 0 1024;
    if !n > 0 then Buffer.add_substring buf s 0 !n;
  done;
  close_in fh;
  Buffer.contents buf


let title_re = Str.regexp "((! *set *title *\\([^ ][^!]*\\)!))"

let get_title lang path =
  let s = string_of_file path in
  try
    ignore(Str.search_forward title_re s 0); (* or Not_found *)
    String.trim (Str.matched_group 1 s)
  with Not_found ->
    String.capitalize(Filename.basename path)

let rec breadcrumb_of_path bc lang path =
  if path = "site" || path = "." then ("/", "Home") :: bc
  else (
    let index = ["", "index.md"; "", "index.html"] in
    let index = if lang = "" then index
                else (lang, "index." ^ lang ^ ".md")
                     :: (lang, "index." ^ lang ^ ".html") :: index in
    let index = List.map (fun (l,f) -> (l, Filename.concat path f)) index in
    let index_lang, index = List.find (fun (_,f) -> Sys.file_exists f) index in
    let title = get_title lang index in
    (* Remove the prefix "site". *)
    let link = String.sub path 4 (String.length path - 4) in
    let link = if index_lang = "" then link ^ "/"
               else link ^ "/index." ^ index_lang ^ ".html" in
    breadcrumb_of_path ((link, title) :: bc) lang (Filename.dirname path)
  )

let rec to_html bc =
  let b = Buffer.create 1024 in
  let rec add_component = function
    | [] -> assert false
    | [_, title] -> bprintf b "<li class=\"active\">%s</li>\n" title
    | (p, title) :: tl ->
       bprintf b "<li><a href=\"%s\">%s</a><span class=\"divider\">\
                  </span></li>\n" p title;
       add_component tl in
  add_component bc;
  Buffer.contents b

let () =
  (* Pass a filename relative to the root of the project.  Example:
     "site/learn/companies.md" *)
  let path_filename = Sys.argv.(1) in
  let prefix, lang, _ =
    prefix_lang_ext_of_filename (Filename.basename path_filename) in
  let title = get_title lang path_filename in
  let path = if prefix = "index" then
               Filename.dirname(Filename.dirname path_filename)
             else Filename.dirname path_filename in
  (* The current entry is not a link, leaves that part empty. *)
  let breadcrumb = breadcrumb_of_path [("", title)] lang path in
  print_endline (to_html breadcrumb)


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/breadcrumb" *)
(* End: *)
