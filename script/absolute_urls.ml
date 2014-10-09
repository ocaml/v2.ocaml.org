(* Convert relative links to absolute ones *)
open Printf

let make_absolute base orig_url =
  let orig_url = String.trim orig_url in (* bypass bug in omd *)
  Uri.(to_string (resolve "http" base (of_string orig_url)))

let () =
  let files = ref [] in
  let base = ref "//ocaml.org/" in
  let to_base = ref "" in
  let specs = [
    ("--base", Arg.Set_string base,
     "base the base URL to use for resolution (default to \"//ocaml.org/\")");
    ("--path", Arg.Set_string to_base,
     "path path to the root of the site (default \"\")");
  ] in
  let anon_arg a = files := a :: !files in
  Arg.parse (Arg.align specs) anon_arg "absolute_urls [<filename> ..]";
  let to_base = if !to_base = "" then [] else Neturl.split_path !to_base in
  List.iter Urlfun.(fun file ->
    let split_file = Neturl.split_path file in
    let (_, from_base) = remove_common_prefix to_base split_file in
    let from_base = String.concat "/" from_base in
    let base = Uri.(resolve "http" (of_string !base) (of_string from_base)) in
    try map_file (make_absolute base) file file
    with (Unknown_file_type _) -> ()
  ) !files
