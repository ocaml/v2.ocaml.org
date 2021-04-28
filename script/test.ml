#use "topfind";;
#thread;;
#require "lwt";;
#require "cohttp-lwt-unix";;
#require "ezjsonm";;

open Lwt
open Cohttp
open Cohttp_lwt_unix
open Printf

let uri = "https://api.stackshare.io/graphql"
let key = "hmTBPOT6qizPthv9BVFjFg"

let query = {| query {
leads(usingToolSlugs: ["ocaml"], toolMatch: "any",
after:""){
edges{
node{
companyId
companyName
domain
}
}
}
}|}

let send_graphql_query query =
let open Lwt.Infix in
let headers =
Cohttp.Header.of_list ["Content-type", "application/json"; "Accept", "application/json"; "x-api-key" , key]
in
let uri = Uri.of_string uri in
let body =
`O [("query", `String query)]
in
let serialized_body = Ezjsonm.to_string body in
Cohttp_lwt_unix.Client.post ~headers ~body:(`String serialized_body) uri >>= fun (_resp, body) ->
Cohttp_lwt.Body.to_string body >|= fun s ->
print_endline s

let () =
Lwt_main.run (send_graphql_query query)
