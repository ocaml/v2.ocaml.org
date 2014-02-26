open Printf
open Utils

(* Translate the language to HTML.  [l] is a 2 letter code:
   https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes *)
let lang_to_html l =
  if l = "" then "en" (* default language *)
  else if l = "zh" then "中文"
  else l

let translations path =
  let p0, l0, e0 = prefix_lang_ext_of_filename (Filename.basename path) in
  let d = Sys.readdir (Filename.dirname path) in
  let t = ref [] in (* (lang, fname) *)
  Array.iter (fun fn ->
              let p, l, e = prefix_lang_ext_of_filename fn in
              if p = p0 && e = e0 then
                let fhtml = if l = "" then
                              if p = "index" then "." else p ^ ".html"
                            else p ^ "." ^ l ^ ".html" in
                t := (l, fhtml) :: !t
             ) d;
  let t = List.sort (fun (l1,_) (l2,_) -> String.compare l1 l2) !t in
  (* Convert to HTML *)
  let to_html (l, fn) =
    let html =
      let l = if l = "" then "en" (* default language *) else l in
      if Sys.file_exists (Printf.sprintf "site/img/flag_%s.png" l) then
        sprintf "<img src=\"/img/flag_%s.png\"/>" l
      else
        lang_to_html l in
    if l = l0 then sprintf "<li class=\"active\">%s</li>\n" html
    else sprintf "<li><a href=\"%s\">%s</a></li>\n" fn html in
  String.concat "" (List.map to_html t)


let () =
  (* Pass a filename relative to the root of the project.  Example:
     "site/learn/companies.md" *)
  let path_filename = Sys.argv.(1) in
  print_endline (translations path_filename)


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/translations" *)
(* End: *)
