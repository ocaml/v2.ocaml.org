(* Convert absolute links to relative ones — the path to the root
   being taken from the path of the file if not set explicitly. *)
open Printf

let base_syntax =
  { (Hashtbl.find Neturl.common_url_syntax "http") with
    Neturl.url_enable_param = Neturl.Url_part_allowed;
    Neturl.url_enable_fragment = Neturl.Url_part_allowed; }

let make_relative to_base orig_url =
  let orig_url = String.trim orig_url in (* bypass bug in omd *)
  try
    let url = Neturl.parse_url ~base_syntax orig_url in
    if Neturl.url_provides url ~host:true then orig_url
    else match Neturl.url_path url with
    | "" :: rel_path -> (* absolute *)
      let path = Neturl.norm_path (to_base @ rel_path) in
      Neturl.string_of_url (Neturl.modify_url url ~path)
    | _ -> orig_url
  with Neturl.Malformed_URL -> orig_url

let revert_path =
  let rec remove_common_prefix p1 p2 =
    match p1, p2 with
    | d1 :: p1, d2 :: p2 when d1 = d2 -> remove_common_prefix p1 p2
    | _ -> p1, p2 in
  let rec revert filename =
    match filename with
    | [] | [ _ ]-> [] (* the last component is a filename or "" *)
    | _ :: tl -> ".." :: revert tl in
  fun to_base filename ->
    let filename = Neturl.norm_path (Neturl.split_path filename) in
    let to_base, filename = remove_common_prefix to_base filename in
    revert filename @ to_base

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
    let to_base = revert_path to_base file in
    try map_file (make_relative to_base) file file
    with (Unknown_file_type _) -> ()
  ) !files
