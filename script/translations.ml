open Printf
open Utils

(* Translate the language to HTML.  [l] is a 2 letter code:
   https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes *)
let lang_to_html l =
  if l = "" then "en" (* default language *)
  else if l = "zh" then "中文"
  else if l = "ja" then "日本語"
  else if l = "ko" then "한국어"
  else l

let translations path =
  let p0, l0, e0 = prefix_lang_ext_of_filename (Filename.basename path) in
  let d = Sys.readdir (Filename.dirname path) in
  let t = ref [] in (* (lang, fname) *)
  Array.iter (fun fn ->
              let p, l, e = prefix_lang_ext_of_filename fn in
              if p = p0 && e = e0 then
                let fhtml = if l = "" then
                              if p = "index" then "." else p ^ ".html"
                            else p ^ "." ^ l ^ ".html" in
                t := ((if l = "" then "en" else l), fhtml, l = l0) :: !t
             ) d;
  List.sort (fun (l1,_,_) (l2,_,_) -> String.compare l1 l2) !t

(* Convert to HTML *)
let print_html t =
  let to_html (l, fn, current) =
    if current then printf "<li class=\"active\">%s</li>\n" (lang_to_html l)
    else printf "<li><a href=\"%s\">%s</a></li>\n" fn (lang_to_html l) in
  List.iter to_html t

let print_hreflang t =
  let to_link (l, fn, _) =
    printf "<link rel=\"alternate\" hreflang=%S href=\"%s\" />\n"
           l (Netencoding.Url.encode fn) in
  List.iter to_link t


let () =
  (* Pass a filename relative to the root of the project.  Example:
     "site/learn/companies.md" *)
  let path_filename = ref "" in
  let hreflang = ref false in
  let specs =
    Arg.align [
        "--hreflang", Arg.Set hreflang,
        " output <link> to indicate translations in the header";
      ] in
  let msg = "translations <filename>" in
  Arg.parse specs (fun f -> path_filename := f) msg;
  if !path_filename = "" then
    eprintf "You must provide a filename. More info: \"translations -h\".\n";
  let t = translations !path_filename in
  if !hreflang then
    print_hreflang t
  else
     print_html t


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/translations" *)
(* End: *)
