(* Small utility to extract the language of the filename. *)

open Utils

let () =
  let filename = Sys.argv.(1) in
  let to_translate = Sys.argv.(2) in
  let lang =
    let _, lang, _ = prefix_lang_ext_of_filename (Filename.basename filename) in
    if lang = "" then "en" else lang
  in
  let translation =
    match lang with
    | "fr" ->
      begin
        match to_translate with
        | "Learn" -> "Apprendre"
        | "Documentation" -> "Documentation"
        | "Packages" -> "Contributions"
        | "Community" -> "Communauté"
        | "Feedback" -> "Suggestions"
        | "About This Site" -> "A propos de ce site"
        | "Find Us on GitHub" -> "Dépôt GitHub"
        | _ -> to_translate
      end
    | _ -> to_translate
  in
  Printf.printf "%s%!" translation

(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/lang_of_filename" *)
(* End: *)
