open Printf

(* Translate the language 2 letters to HTML if resired *)
let lang_to_html l =
  if l = "zh" then "中文"
  else l

let prefix_lang_ext_of_fname fn =
  try
    let i0 = String.rindex fn '.' in
    let ext = String.sub fn (i0 + 1) (String.length fn - i0 - 1) in
    try
      let i1 = String.rindex_from fn (i0 - 1) '.' in
      String.sub fn 0 i1, String.sub fn (i1 + 1) (i0 - i1 - 1), ext
    with Not_found ->
      String.sub fn 0 i0,  "en" (* default language *), ext
  with Not_found ->
    fn, "en", ""

let translations path =
  let p0, l0, e0 = prefix_lang_ext_of_fname (Filename.basename path) in
  let d = Sys.readdir (Filename.dirname path) in
  let t = ref [] in (* (lang, fname) *)
  Array.iter (fun fn ->
              let p, l, e = prefix_lang_ext_of_fname fn in
              if p = p0 && e = e0 then t := (l, fn) :: !t;
             ) d;
  let t = List.sort (fun (l1,_) (l2,_) -> String.compare l1 l2) !t in
  (* Convert to HTML *)
  let to_html (l, fn) =
    if l = l0 then sprintf "<li class=\"acrive\">%s</li>\n" (lang_to_html l)
    else sprintf "<li><a href=\"%s\">%s</a></li>\n" fn (lang_to_html l) in
  String.concat "" (List.map to_html t)


let () =
  (* Pass a filename relative to the root of the project.  Example:
     "site/learn/companies.md" *)
  let path_filename = Sys.argv.(1) in
  print_endline (translations path_filename)


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/translations" *)
(* End: *)
