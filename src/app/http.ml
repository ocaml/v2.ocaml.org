(* Download urls and cache them — especially during development, it
   slows down the rendering to download over and over again the same
   URL. *)

open Printf
open Http_client.Convenience

let age fn =
  let now = Unix.time () in (* in sec *)
  let modif = (Unix.stat fn).Unix.st_mtime in
  now -. modif

let time_of_secs s =
  let s = truncate s in
  let m = s / 60 and s = s mod 60 in
  let h = m / 60 and m = m mod 60 in
  sprintf "%i:%02im%is" h m s

(* let cache_secs = 60. *. 60. *. 24. (\* 24h *\) *)
let cache_secs = 60. *. 55.
let get ?(cache_secs=cache_secs) url =
  let md5 = Digest.to_hex(Digest.string url) in
  let fn = Filename.concat Filename.temp_dir_name ("ocamlorg-" ^ md5) in
  eprintf "Downloading %s... " url;
  if Sys.file_exists fn && age fn <= cache_secs then (
    let fh = open_in fn in
    let data = input_value fh in
    close_in fh;
    eprintf "done.\n  (using cache %s, updated %s ago).\n"
            fn (time_of_secs(age fn));
    data
  )
  else (
    flush stderr;
    let data = http_get url in
    eprintf "done %!";
    let fh = open_out fn in
    output_value fh data;
    close_out fh;
    eprintf "(cached).\n%!";
    data
  )
