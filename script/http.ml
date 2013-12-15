(* Download urls and cache them — especially during development, it
   slows down the rendering to download over and over again the same
   URL. *)

open Printf
open Http_client.Convenience

let () =
  Ssl.init();
  Http_client.Convenience.configure_pipeline
    (fun p ->
     let ctx = Ssl.create_context Ssl.TLSv1 Ssl.Client_context in
     let tct = Https_client.https_transport_channel_type ctx in
     p # configure_transport Http_client.https_cb_id tct;
     p#set_options { p#get_options with Http_client.connection_timeout = 5. }
    )


let age fn =
  let now = Unix.time () in (* in sec *)
  let modif = (Unix.stat fn).Unix.st_mtime in
  now -. modif

let time_of_secs s =
  let s = truncate s in
  let m = s / 60 and s = s mod 60 in
  let h = m / 60 and m = m mod 60 in
  sprintf "%i:%02im%is" h m s

let cache_secs = 3600. (* 1h *)
let get ?(cache_secs=cache_secs) url =
  let md5 = Digest.to_hex(Digest.string url) in
  let fn = Filename.concat Filename.temp_dir_name ("ocamlorg-" ^ md5) in
  eprintf "Downloading %s... %!" url;
  let get_from_cache () =
    let fh = open_in fn in
    let data = input_value fh in
    close_in fh;
    eprintf "done.\n  (using cache %s, updated %s ago).\n%!"
            fn (time_of_secs(age fn));
    data in
  if Sys.file_exists fn && age fn <= cache_secs then get_from_cache()
  else (
    try
      let data = http_get url in
      eprintf "done %!";
      let fh = open_out fn in
      output_value fh data;
      close_out fh;
      eprintf "(cached).\n%!";
      data
    with Http_client.Http_protocol(Http_client.Timeout _) ->
      get_from_cache()
  )
