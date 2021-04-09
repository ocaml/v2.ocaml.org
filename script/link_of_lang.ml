(* Small utility to extract the language of the filename. *)

open Printf

let () =
  let filename = Sys.argv.(1) in
  let link = Sys.argv.(2) in
  let lang = Utils.lang_of_filename filename in
(*  eprintf "Link = %S\n%!" link; *)
  let dirname,basename =
    if Filename.check_suffix link ".html" then
      Filename.dirname link,
      Filename.chop_suffix (Filename.basename link) ".html"
    else
    if link = "/" then
      "/",
      "index"
    else
    if Filename.check_suffix link "/" then
      Filename.chop_suffix link "/",
      "index"
    else
      link,
      "index"
  in
(*  eprintf "Checking for 'site%s/%s.%s.md'\n%!" dirname basename lang; *)
  let translation =
    let fn_trans = Filename.concat dirname (sprintf "%s.%s.md" basename lang) in
    if Sys.file_exists (Filename.concat "site" fn_trans) then
      Filename.concat dirname (sprintf "%s.%s.html" basename lang)
    else link (* English file *)
  in
(*  eprintf "Returning %S\n%!" translation; *)
  printf "%s%!" translation



(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/link_of_lang" *)
(* End: *)
