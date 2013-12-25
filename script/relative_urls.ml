(* Convert absolute links to relative ones — the path to the root
   being taken from the path of the file if not set explicitly. *)
open Printf
open Utils

let base_syntax =
  { (Hashtbl.find Neturl.common_url_syntax "http") with
    Neturl.url_enable_param = Neturl.Url_part_allowed;
    Neturl.url_enable_fragment = Neturl.Url_part_allowed; }

let make_relative to_base orig_url =
  let orig_url = String.trim orig_url in (* bypass bug in omd *)
  try
    let url = Neturl.parse_url ~base_syntax orig_url in
    let path = Neturl.url_path url in
    match path with
    | "" :: rel_path -> (* absolute *)
       if Neturl.url_provides url ~scheme:true then orig_url
       else
         let path = Neturl.norm_path(to_base @ rel_path) in
         (try Neturl.string_of_url (Neturl.modify_url url ~path)
          with Neturl.Malformed_URL -> orig_url)
    | _ -> orig_url
  with Neturl.Malformed_URL ->
    orig_url


let rec make_local_links_relative to_base html =
  List.map (make_local_links_relative_element to_base) html
and make_local_links_relative_element to_base = function
  | Nethtml.Data _ as d -> d
  | Nethtml.Element(("a" | "link") as e, args, sub) ->
     let href, args = List.partition (fun (a, _) -> a = "href") args in
     (match href with
      | [] -> (* no href (maybe an anchor); nothing to do *)
         Nethtml.Element(e, args, sub)
      | (_, url) :: _ ->
         let args = ("href", make_relative to_base url) :: args in
         Nethtml.Element(e, args, make_local_links_relative to_base sub))
  | Nethtml.Element(("img" | "script") as e, args, sub) ->
     let src, args = List.partition (fun (a, _) -> a = "src") args in
     (match src with
      | [] -> Nethtml.Element(e, args, sub)
      | (_, url) :: _ ->
         let args = ("src", make_relative to_base url) :: args in
         Nethtml.Element(e, args, sub))
  | Nethtml.Element(e, args, sub) ->
     Nethtml.Element(e, args, make_local_links_relative to_base sub)

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

let process_html to_base filename =
  let fh = open_in filename in
  let html = Nethtml.parse_document (Lexing.from_channel fh)
                                    ~dtd:Utils.relaxed_html40_dtd in
  close_in fh;
  let to_base = revert_path to_base filename in
  let html = make_local_links_relative to_base html in
  let fh = open_out filename in
  let out = new Netchannels.output_channel fh in
  Nethtml.write out html;
  out#close_out()

let process_css to_base filename =
  let ch = new Netchannels.input_channel (open_in filename) in
  let css = Netchannels.string_of_in_obj_channel ch in
  (* URLs need to be a full path on the system: *)
  let p = Filename.concat (Sys.getcwd()) (Neturl.join_path to_base) in
  let url_re = Str.regexp "url(/\\([^()]*\\))" in
  let css = Str.global_replace url_re ("url(" ^ p ^ "/\\1)") css in
  let out = new Netchannels.output_channel (open_out filename) in
  out#output_string css;
  out#close_out()


let process to_base filename =
  if Filename.check_suffix filename ".html" then
    process_html to_base filename
  else if Filename.check_suffix filename ".css" then
    process_css to_base filename
  else ()

let () =
  let files = ref [] in
  let path_to_base = ref "" in
  let specs = [
    ("--path", Arg.Set_string path_to_base,
     "path path to the root of the site (default: \".\")") ] in
  let anon_arg a = files := a :: !files in
  Arg.parse (Arg.align specs) anon_arg "relative_urls <filename>";
  let to_base = if !path_to_base <> "" then Neturl.split_path !path_to_base
                else [] in
  List.iter (process to_base) !files
