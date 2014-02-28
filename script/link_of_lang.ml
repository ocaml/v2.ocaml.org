(* Small utility to extract the language of the filename. *)

open Utils

let lexer = Genlex.make_lexer [ "->" ]
exception Found of string

let () =
  let filename = Sys.argv.(1) in
  let link = Sys.argv.(2) in
  let lang =
    let _, lang, _ = prefix_lang_ext_of_filename (Filename.basename filename) in
    if lang = "" then "en" else lang
  in
(*  Printf.eprintf "Link = %S\n%!" link; *)
  let dirname,basename =
    if Filename.check_suffix link ".html" then
      Filename.dirname link,
      Filename.chop_suffix (Filename.basename link) ".html"
    else
    if Filename.check_suffix link "/" then
      Filename.chop_suffix link "/",
      "index"
    else
      link,
      "index"
  in
(*  Printf.eprintf "Checking for 'site%s/%s.%s.md'\n%!" dirname basename lang; *)
  let translation =
    if Sys.file_exists (Printf.sprintf "site%s/%s.%s.md"
          dirname basename lang) then
      Printf.sprintf "%s/%s.%s.html" dirname basename lang
    else
      link
  in
(*  Printf.eprintf "Returning %S\n%!" translation; *)
  Printf.printf "%s%!" translation

(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/lang_of_filename" *)
(* End: *)
