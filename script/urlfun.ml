(* Higher order functions over all URL references in web files. *)

exception Unknown_file_type of string

let rec map_html_hrefs f html =
  List.(rev (rev_map (map_html_element_hrefs f) html))
and map_html_element_hrefs f = function
  | Nethtml.Data _ as d -> d
  | Nethtml.Element(("a" | "link") as e, args, sub) ->
    let href, args = List.partition (fun (a, _) -> a = "href") args in
    begin match href with
    | [] -> (* no href (maybe an anchor); nothing to do *)
      Nethtml.Element(e, args, sub)
    | (_, url) :: _ ->
      let args = ("href", f url) :: args in
      Nethtml.Element(e, args, map_html_hrefs f sub)
    end
  | Nethtml.Element(("img" | "script") as e, args, sub) ->
    let src, args = List.partition (fun (a, _) -> a = "src") args in
    begin match src with
    | [] -> Nethtml.Element(e, args, sub)
    | (_, url) :: _ ->
      let args = ("src", f url) :: args in
      Nethtml.Element(e, args, sub)
    end
  | Nethtml.Element(e, args, sub) ->
     Nethtml.Element(e, args, map_html_hrefs f sub)

let map_html_file f in_file out_file =
  let fh = open_in in_file in
  let html = Nethtml.parse_document (Lexing.from_channel fh)
                                    ~dtd:Utils.relaxed_html40_dtd in
  close_in fh;
  let html = map_html_hrefs f html in
  let fh = open_out out_file in
  let out = new Netchannels.output_channel fh in
  (* Nethtml does not represent <!DOCTYPE HTML>, add it. *)
  out#output_string "<!DOCTYPE HTML>\n";
  Nethtml.write out html;
  out#close_out()

let map_css_file f in_file out_file =
  let fh = open_in in_file in
  let ch = new Netchannels.input_channel fh in
  let css = Netchannels.string_of_in_obj_channel ch in
  close_in fh;
  let url_re = Str.regexp "url(\\([^()]*\\))" in
  let css = Str.global_substitute url_re (fun css ->
    Printf.sprintf "url(%s)" (f (Str.matched_group 1 css))
  ) css in
  let out = new Netchannels.output_channel (open_out out_file) in
  out#output_string css;
  out#close_out()

let map_file f in_file out_file =
  if   Filename.check_suffix in_file ".html"
    || Filename.check_suffix in_file ".xhtml"
  then map_html_file f in_file out_file
  else if Filename.check_suffix in_file ".css"
  then map_css_file f in_file out_file
  else raise (Unknown_file_type in_file)

let rec remove_common_prefix p1 p2 =
  match p1, p2 with
  | d1 :: p1, d2 :: p2 when d1 = d2 -> remove_common_prefix p1 p2
  | _ -> p1, p2

let revert_path =
  let rec revert filename =
    match filename with
    | [] | [ _ ]-> [] (* the last component is a filename or "" *)
    | _ :: tl -> ".." :: revert tl in
  fun to_base filename ->
    let filename = Neturl.norm_path (Neturl.split_path filename) in
    let to_base, filename = remove_common_prefix to_base filename in
    revert filename @ to_base
