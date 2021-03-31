(* Download urls and cache them — especially during development, it
   slows down the rendering to download over and over again the same
   URL. *)

open Printf

exception Error of string

let error fmt = Format.kasprintf (fun s -> raise (Error s)) fmt

let make_uri request_uri uri =
  let set_host uri =
    match Uri.host uri with
    | Some _ -> uri
    | None ->
    let request_host = Option.get (Uri.host request_uri) in
    Uri.with_host uri (Some request_host)
  in
  let set_scheme uri =
    match Uri.scheme uri with
    | Some _ -> uri
    | None ->
    let request_scheme = Option.get (Uri.scheme request_uri) in
    Uri.with_scheme uri (Some request_scheme)
  in
  Uri.of_string uri
  |> set_host
  |> set_scheme

let rec http_get_and_follow ~max_redirects uri =
  let open Lwt in
  Cohttp_lwt_unix.Client.get uri >>= follow_redirect ~max_redirects uri

and follow_redirect ~max_redirects request_uri (response, body) =
  let open Lwt in
  let status = Cohttp.Response.status response in
  (* The uncosumed body would otherwise leak memory *)
  if status <> `OK then Lwt.ignore_result (Cohttp_lwt.Body.drain_body body);
  match status with
  | `OK -> Lwt.return (response, body)
  | `Permanent_redirect
  | `Moved_permanently ->
     handle_redirect ~permanent:true ~max_redirects request_uri response
  | `Found
  | `Temporary_redirect ->
     handle_redirect ~permanent:false ~max_redirects request_uri response
  | `Not_found | `Gone -> error "Not found"
  | status -> error "Unhandled status: %s" (Cohttp.Code.string_of_status status)

and handle_redirect ~permanent ~max_redirects request_uri response =
  if max_redirects <= 0 then
    error "Too many redirects"
  else
    let headers = Cohttp.Response.headers response in
    let location = Cohttp.Header.get headers "location" in
    match location with
    | None -> error "Redirection without Location header"
    | Some url ->
      let uri = make_uri request_uri url in
      if permanent then
        Format.eprintf "Warning: permanent redirection from %a to %a\n"
          Uri.pp_hum request_uri Uri.pp_hum uri;
      http_get_and_follow uri ~max_redirects:(max_redirects - 1)

let http_get url =
  let max_redirects = 10 in
  let timeout = 5. in
  try
    Lwt_main.run (
      Lwt_unix.with_timeout timeout (fun () ->
        let open Lwt in
        let uri = Uri.of_string url in
        http_get_and_follow ~max_redirects uri >>= fun (_response, body) ->
        Cohttp_lwt.Body.to_string body)
    )
  with
  | Lwt_unix.Timeout -> error "Timeout"
  | Unix.Unix_error _ as e -> error "Unknown (%s)" (Printexc.to_string e)
  | Ssl.Connection_error _ as e ->
      error "SSL connection error (%s)" (Printexc.to_string e)

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
  let fn = Filename.concat (Filename.get_temp_dir_name ()) ("ocamlorg-" ^ md5) in
  eprintf "Downloading %s ... %!" url;
  let get_from_cache () =
    let fh = open_in_bin fn in
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
      let fh = open_out_bin fn in
      output_value fh data;
      close_out fh;
      eprintf "(cached).\n%!";
      data
    with Error msg as e ->
      if Sys.file_exists fn then get_from_cache()
      else (
        eprintf "FAILED! (%s)\n%!" msg;
        raise e
      )
  )
