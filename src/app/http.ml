(* Download urls and cache them — especially during development, it
   slows down the rendering to download over and over again the same
   URL. *)

open Printf
open Http_client.Convenience

let get url =
  let md5 = Digest.to_hex(Digest.string url) in
  let fn = Filename.concat Filename.temp_dir_name ("ocamlorg-" ^ md5) in
  eprintf "Downloading %s... %!" url;
  if Sys.file_exists fn then (
    eprintf "done.\n  (using cache %s).\n%!" fn;
    let fh = open_in fn in
    let data = input_value fh in
    close_in fh;
    data
  )
  else (
    let data = http_get url in
    eprintf "done.\n%!";
    let fh = open_out fn in
    output_value fh data;
    close_out fh;
    data
  )
