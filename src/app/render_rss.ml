(** Render a RSS flux to HTML. *)

open Printf
open Nethtml
open Http_client.Convenience

(** List of "authors" that send text descriptions (as opposed to
    HTML).  The formatting of the description must then be respected. *)
let text_description =
  ["OCamlCore Forge News"]

let channel_of_urls urls =
  let download_and_parse url =
    printf "Downloading %s... " url;
    let ch = Rss.channel_of_string(http_get url) in
    printf "done.\n";
    ch in
  let channels = List.map download_and_parse urls in
  match channels with
  | [] -> Rss.channel ~title:"No channel given" ~link:"" ~desc:"" []
  | [c] -> c
  | c :: tl -> List.fold_left Rss.merge_channels c tl


(* Our representation of a "post". *)
type post = {
  title : string;
  link : string;     (* url of the original post *)
  date : Rss.date option;
  author : string;
  email : string;    (* the author email, "" if none *)
  desc : string;
}

let string_of_option = function None -> "" | Some s -> s

let parse_item it =
  let open Rss in
  let title = string_of_option it.item_title in
  let author, title =
    (* The author name is often put before the title, separated by ':'. *)
    try
      let i = String.index title ':' in
      let i1 = i + 1 in
      (String.sub title 0 i,
       String.sub title i1 (String.length title - i1))
    with Not_found -> "", title in
  let link = string_of_option it.item_link in
  let link = match it.item_guid with
    | None -> link
    | Some e ->
       (* Prefer [link], sometimes the guid is garbled (e.g. Coq) *)
       if link = "" then e.guid_name else link in
  { title; link; author;
    email = string_of_option it.item_author;
    desc = string_of_option it.item_desc;
    date = it.item_pubdate }


let span_class c html = Element("span", ["class", c], html)

(* Transform a RSS item (i.e. story) into HTML. *)
let html_of_post p =
  let date = match p.date with
    | None -> ""
    | Some d -> Rss.string_of_date d in
  let sep = if p.author = "" && date = "" then ""
            else "&nbsp;&mdash;&nbsp;" in
  let html_title = if p.link = "" then Data p.title
                   else Element("a", ["href", p.link], [Data p.title]) in
  let html_author =
    if p.email = "" then Data p.author
    else Element("a", ["href", "mailto:" ^ p.email], [Data p.author]) in
  let desc =
    if List.mem p.author text_description then
      [Element("pre", ["class", "rss-text"], [Data p.desc])]
    else [Data p.desc]   (* FIXME: folding if too long *)
  in
  [span_class "rss-header"
              [span_class "rss-title" [html_title];
               Data sep;
               span_class "rss-author" [html_author];
               Data(if p.author <> "" then ", " else "");
               span_class "rss-date" [Data date];
              ];
   span_class "rss-description" desc;
   Data "\n"]



(* FIXME: do we want to build a TOC? *)

let of_urls urls =
  let ch = channel_of_urls urls in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  let posts = List.map parse_item items in
  List.concat(List.map html_of_post posts)
