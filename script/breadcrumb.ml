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

let get_title path =
  let fname =
    if Sys.is_directory path then Filename.concat path "index.md"
    else path in
  let s = string_of_file fname in
  try
    ignore(Str.search_forward title_re s 0); (* or Not_found *)
    String.trim (Str.matched_group 1 s)
  with Not_found ->
    String.capitalize(Filename.basename path) ^ "XX"


let rec breadcrumb_of_path path =
  if path = "site" || path = "." then
    "<li><a href='/'>Home</a><span class=\"divider\"></span></li>\n"
  else (
    let title = get_title path in
    let fname = Filename.basename path in
    let dir, entry =
      if fname = "index.md" || fname = "index.html" then
        (* Equivalent to the dir, only one entry for both *)
        let dir = Filename.dirname (Filename.dirname path) in
        dir, sprintf "<li class=\"active\">%s</li>" title
      else if Filename.check_suffix path ".md"
         || Filename.check_suffix path ".html" then
        (* If there is a suffix, this is the final file => no link. *)
        Filename.dirname path, sprintf "<li class=\"active\">%s</li>" title
      else
        (* Remove the prefix "site". *)
        let link = String.sub path 4 (String.length path - 4) in
        let li = sprintf "<li><a href=\"%s\">%s</a><span class=\"divider\">\
                          </span></li>\n" link title in
        Filename.dirname path, li in
    breadcrumb_of_path dir ^ entry
  )

let () =
  (* Pass a filename relative to the root of the project.  Example:
     "site/learn/companies.md" *)
  let path_filename = Sys.argv.(1) in
  let breadcrumb = breadcrumb_of_path path_filename in
  print_endline breadcrumb


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/breadcrumb" *)
(* End: *)
