(** Render a RSS flux to HTML. *)

open Printf
open Nethtml
open Http_client.Convenience

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


let html_of_desc d =
  (* [d] might be some text or HTML. *)
  [Data d]

let string_of_option = function None -> "" | Some s -> s

let span_class c html = Element("span", ["class", c], html)

(* Transform a RSS item (i.e. story) into HTML. *)
let html_of_item it =
  let open Rss in
  let title = string_of_option it.item_title in
  if title = "" then []                 (* no title => skip the story *)
  else (
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
    let email = string_of_option it.item_author in
    let date = match it.item_pubdate with
      | None -> ""
      | Some d -> Rss.string_of_date d in
    let sep = if author = "" && date = "" then ""
              else "&nbsp;&mdash;&nbsp;" in
    let desc = match it.item_desc with
      | None -> [Data ""]
      | Some d -> html_of_desc d in
    let html_title = if link = "" then Data title
                     else Element("a", ["href", link], [Data title]) in
    let html_author =
      if email = "" then Data author
      else Element("a", ["href", "mailto:" ^ email], [Data author]) in
    [span_class "rss-header"
                [span_class "rss-title" [html_title];
                 Data sep;
                 span_class "rss-author" [html_author];
                 Data(if author <> "" then ", " else "");
                 span_class "rss-date" [Data date];
                ];
     span_class "rss-description" desc;
     Data "\n"]
  )


let of_urls urls =
  let ch = channel_of_urls urls in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  List.concat(List.map html_of_item items)
