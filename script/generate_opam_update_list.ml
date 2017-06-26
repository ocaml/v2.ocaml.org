module H = Cow.Html

let packages_base = "https://opam.ocaml.org/packages/"

let staging = try ignore(Sys.getenv "SET_STAGING"); true
              with _ -> false

let top_packages () =
  let u = O2wUniverse.of_repositories ~preds:[] OpamfUniverse.Index_all
                                      [`opam] in
  let dates_fn pkg =
    try OpamPackage.Map.find pkg u.OpamfUniverse.pkgs_dates
    with Not_found -> 0. in
  O2wStatistics.top_packages
    ~reverse:true ~ntop:6 dates_fn u.OpamfUniverse.max_packages

let () =
  let to_row (pkg, update_tm) =
    let open OpamPackage in
    let name = name pkg in
    let version = version pkg in
    let pkg_name = Name.to_string name in
    let pkg_version = Version.to_string version in
    let pkg_href =
      OpamfUniverse.Pkg.href ~href_base:Uri.(of_string packages_base)
        name version in
    let pkg_date = O2wMisc.string_of_timestamp update_tm in
    H.tag "tr"
      (H.list [H.tag "td" (H.a ~href:pkg_href (H.string pkg_name));
               H.tag "td" (H.a ~href:pkg_href (H.string pkg_version));
               H.tag "td" (H.string pkg_date)])
  in

  let opam_update_list = open_out "opam_update_list" in
  try
    let rows = List.map to_row (top_packages ()) in
    let ch = `Channel opam_update_list in
    let xml_out = Cow.Xml.make_output ~decl:false ch in
    List.iter (fun row ->
        List.iter (Cow.Xml.output xml_out)
          (`Dtd None :: Template.serialize row)) rows;
    close_out opam_update_list
  with e ->
    if staging then (
      Printf.fprintf opam_update_list "<tr><td colspan=\"3\">%s %b</td></tr>"
        (Printexc.to_string e) staging;
      close_out opam_update_list
    )
    else (
      close_out opam_update_list;
      raise e
    )


;;
(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/generate_opam_update_list" *)
(* End: *)
