(* Convert absolute links to relative ones — the path to the root
   being taken from the path of the file if not set explicitly. *)
let make_relative to_base orig_url =
  let orig_url = String.trim orig_url in (* bypass bug in omd *)
  let url = Uri.of_string orig_url in
  match Uri.host url with
  | Some _ -> orig_url
  | None -> match Uri.path url with
    | "" -> orig_url
    | path ->
      if path.[0] = '/'
      then
        let path = String.sub path 1 (String.length path - 1) in
        Uri.to_string (Uri.with_path url (to_base ^ path))
      else orig_url

let () =
  let files = ref [] in
  let path_to_base = ref "" in
  let specs = [
    ("--path", Arg.Set_string path_to_base,
     "path path to the root of the site (default: \".\")") ] in
  let anon_arg a = files := a :: !files in
  Arg.parse (Arg.align specs) anon_arg "relative_urls [<filename> ..]";
  let to_base =
    if !path_to_base <> ""
    then Neturl.split_path !path_to_base
    else []
  in
  List.iter Urlfun.(fun file ->
    let to_base = match revert_path to_base file with
      | [] -> ""
      | ss -> String.concat "" (List.map (fun s -> s ^ "/") ss)
    in
    try map_file (make_relative to_base) file file
    with (Unknown_file_type _) -> ()
  ) !files
