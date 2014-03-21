let packages_base = "https://opam.ocaml.org/packages/" in
let u = O2wUniverse.of_repositories ~preds:[] OpamfUniverse.Index_all [`opam] in
let dates_fn pkg =
  try OpamPackage.Map.find pkg u.OpamfUniverse.pkgs_dates
  with Not_found -> 0.
in
let updates = O2wStatistics.top_packages
  ~reverse:true ~ntop:6 dates_fn u.OpamfUniverse.max_packages
in
let rows = List.map
  (fun (pkg, update_tm) ->
    let open OpamPackage in
    let name = name pkg in
    let version = version pkg in
    let pkg_name = Name.to_string name in
    let pkg_version = Version.to_string version in
    let pkg_href =
      OpamfUniverse.Pkg.href ~href_base:Uri.(of_string packages_base)
        name version
    in
    let pkg_date = O2wMisc.string_of_timestamp update_tm in
    <:html<<tr>
      <td><a href=$uri: pkg_href$>$str: pkg_name$</a></td>
      <td><a href=$uri: pkg_href$>$str: pkg_version$</a></td>
      <td>$str: pkg_date$</td>
    </tr>&>>
  ) updates
in
let opam_update_list = open_out "opam_update_list" in
List.iter (fun xml ->
  let xml_out = Cow.Xml.make_output ~decl:false (`Channel opam_update_list) in
  List.iter (Cow.Xml.output xml_out) ((`Dtd None)::(Template.serialize xml))
) rows;
close_out opam_update_list

(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/generate_opam_update_list" *)
(* End: *)
