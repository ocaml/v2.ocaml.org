(* Small utility to extract the language of the filename. *)

open Utils

let lexer = Genlex.make_lexer [ "->" ]
exception Found of string

let () =
  let filename = Sys.argv.(1) in
  let to_translate = Sys.argv.(2) in
  let lang =
    let _, lang, _ = prefix_lang_ext_of_filename (Filename.basename filename) in
    if lang = "" then "en" else lang
  in
  let translation =
    try
      let filename = Printf.sprintf "translations/en_to_%s.txt" lang in
      let ic = open_in filename in
      try
        let stream = lexer (Stream.of_channel ic) in
        let tokens = ref [] in
        Stream.iter (fun token ->
          match token :: !tokens with
          | Genlex.String translated :: Genlex.Kwd "->" ::
              Genlex.String english :: _ when english = to_translate ->
            raise (Found translated)
          | x :: y :: _ -> tokens := [x;y]
          | _ -> tokens := token :: !tokens
        ) stream;
        raise Not_found
      with exn -> close_in ic; raise exn
    with Found translated ->
      translated
    | _ -> to_translate
  in
  Printf.printf "%s%!" translation

(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/lang_of_filename" *)
(* End: *)
