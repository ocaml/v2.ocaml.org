(* Small utility to extract the language of the filename. *)

let lexer = Genlex.make_lexer [ "->" ]
exception Found of string

let () =
  let filename = Sys.argv.(1) in
  let to_translate = Sys.argv.(2) in
  let lang = Utils.lang_of_filename filename in
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
