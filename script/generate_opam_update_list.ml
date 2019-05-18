module H = Cow.Html

(* See https://github.com/ocaml/opam2web/pull/171 *)

let packages_base = "https://opam.ocaml.org/packages"

let staging = try ignore(Sys.getenv "SET_STAGING"); true
              with _ -> false

let rec take n = function
  | [] -> []
  | x :: tl -> if n <= 0 then [] else x :: take (n - 1) tl

(* Get the string associated to the key in an associative JSON list. *)
let get_string key l =
  match List.assoc key l with
  | `String s -> s
  | _ -> raise Not_found

let last10 =
  let fh = open_in "last10_updates.json" in
  let json = Cow.Json.value_from_channel fh in
  close_in fh;
  match json with
  | `A pkgs ->
     let add_pkg l = function
       | `O pkg ->
          let package = get_string "package" pkg in
          let pkg_date = get_string "date" pkg in
          (match String.index_opt package '.' with
           | Some i ->
              let j = i + 1 in
              let pkg_version =
                if j < String.length package then
                  String.sub package j (String.length package - j)
                else "" in
              (String.sub package 0 i, pkg_version, pkg_date) :: l
           | None -> (package, "", pkg_date) :: l)
       | _ -> l in
     List.rev(List.fold_left add_pkg [] pkgs)
  | _ -> []

let () =
  let to_row (pkg_name, pkg_version, pkg_date) =
    let pkg_href = packages_base ^ "/" ^ pkg_name in
    let ver_href = pkg_href ^ "/" ^ pkg_name ^ "." ^ pkg_version in
    let cols = [
        H.tag "td" (H.a ~href:(Uri.of_string pkg_href) (H.string pkg_name));
        H.tag "td" (H.a ~href:(Uri.of_string ver_href) (H.string pkg_version));
        H.tag "td" (H.string pkg_date)] in
    H.tag "tr" (H.list cols)
  in
  let opam_update_list = open_out "opam_update_list" in
  try
    let rows = H.list(List.map to_row (take 6 last10)) in
    H.output (`Channel opam_update_list) rows;
    close_out opam_update_list
  with e ->
    close_out opam_update_list;
    if staging then (
      let err = H.tag ~attrs:["colspan", "3"] "td"
                  (H.list [H.string (Printexc.to_string e);
                           H.string " (staging)"]) in
      H.output (`Channel opam_update_list) (H.tag "tr" err);
    )
    else
      raise e

;;
(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/generate_opam_update_list" *)
(* End: *)
