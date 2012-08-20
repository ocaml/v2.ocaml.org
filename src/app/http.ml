(* Download urls and cache them — especially during development, it
   slows down the rendering to download over and over again the same
   URL. *)

open Printf
open Http_client.Convenience

let not_too_old fn =
  let now = Unix.time () in (* in sec *)
  let modif = (Unix.stat fn).Unix.st_mtime in
  eprintf "*** Now: %f  %S: %f\n%!" now fn modif;
  now <= modif +. 86400. (* 60 * 60 * 24 = 24h *)

let get url =
  let md5 = Digest.to_hex(Digest.string url) in
  let fn = Filename.concat Filename.temp_dir_name ("ocamlorg-" ^ md5) in
  eprintf "Downloading %s... %!" url;
  if Sys.file_exists fn && not_too_old fn then (
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
