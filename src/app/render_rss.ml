(** Render a RSS flux to HTML. *)

open Printf
open Nethtml

(** List of "authors" that send text descriptions (as opposed to
    HTML).  The formatting of the description must then be respected. *)
let text_description =
  ["OCamlCore Forge News"]

let channel_of_urls urls =
  let download_and_parse url = Rss.channel_of_string(Http.get url) in
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

let html_title p =
  if p.link = "" then Data p.title
  else Element("a", ["href", p.link], [Data p.title])

let html_author p =
  if p.email = "" then Data p.author
  else Element("a", ["href", "mailto:" ^ p.email], [Data p.author])

let string_of_option = function None -> "" | Some s -> s

(* Transform a RSS item into a [post]. *)
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


(* Limit the length of the description presented to the reader. *)

let rec length_html html =
  List.fold_left (fun l h -> l + length_html_el h) 0 html
and length_html_el = function
  | Element(_, _, content) -> length_html content
  | Data d -> String.length d

let rec text_of_html html =
  String.concat "" (List.map text_of_el html)
and text_of_el = function
  | Element(_, _, content) -> text_of_html content
  | Data d -> d

let rec prefix_of_html html len = match html with
  | [] -> []
  | el :: tl ->
     let l = length_html_el el in
     if l < len then el :: prefix_of_html tl (len - l)
     else [] (* FIXME: naive, descend into el *)


let new_id =
  let id = ref 0 in
  fun () -> incr id; sprintf "post%i" !id

(* [toggle html1 html2] return some piece oh html with buttons to pass
   from [html1] to [html2] and vice versa. *)
let toggle ?(anchor="") html1 html2 =
  let button id1 id2 text =
    Element("a", ["onclick", sprintf "switchContent('%s','%s')" id1 id2;
                  "class", "btn";
                  "href", "#" ^ anchor],
            [Data text])
  in
  let id1 = new_id() and id2 = new_id() in
  [Element("div", ["id", id1],
           html1 @ [button id1 id2 "Read more..."]);
   Element("div", ["id", id2; "style", "display: none"],
           html2 @ [button id2 id1 "Hide"])]

let toggle_script =
  let script =
    "function switchContent(id1,id2) {
     // Get the DOM reference
     var contentId1 = document.getElementById(id1);
     var contentId2 = document.getElementById(id2);
     // Toggle
     contentId1.style.display = \"none\";
     contentId2.style.display = \"block\";
     }" in
  [Element("script", ["type", "text/javascript"], [Data script])]


(* Transform a post [p] (i.e. story) into HTML. *)
let html_of_post p =
  let title_anchor = new_id() in
  let date = match p.date with
    | None -> ""
    | Some d -> Rss.string_of_date d in
  let sep = if p.author = "" && date = "" then ""
            else "&nbsp;&mdash;&nbsp;" in
  let desc =
    if List.mem p.author text_description then
      [Element("pre", ["class", "rss-text"], [Data p.desc])]
    else
      let desc = Nethtml.parse (new Netchannels.input_string p.desc) in
      if length_html desc < 1000 then desc
      else toggle (prefix_of_html desc 1000) desc ~anchor:title_anchor
  in
  let span_class c html = Element("span", ["class", c], html) in
  [Element("a", ["name", title_anchor], []);
   span_class "rss-header"
              [span_class "rss-title" [html_title p];
               Data sep;
               span_class "rss-author" [html_author p];
               Data(if p.author <> "" then ", " else "");
               span_class "rss-date" [Data date];
              ];
   span_class "rss-description" desc;
   Data "\n"]

(* Similar to [html_of_post] but tailored to be shown in a list of
   news (e.g. needs to be more condensed). *)
let news_of_post ?(len=400) p =
  let date = match p.date with
    | None -> ""
    | Some d -> Rss.string_of_date d in
  let desc = Nethtml.parse (new Netchannels.input_string p.desc) in
  let span_class c html = Element("span", ["class", c], html) in
  let more = Element("a", ["href", p.link], [Data "&nbsp;[...]"]) in
  let desc_of_txt txt =
    let len_txt = String.length txt in
    if len_txt <= len || p.link = "" then [Data txt]
    else [Data(String.sub txt 0 (min len len_txt)); more] in
  let desc =
    if List.mem p.author text_description then desc_of_txt p.desc
    else
      let d = prefix_of_html desc len in
      if length_html d > 0 then d @ [more]
      else desc_of_txt (text_of_html desc) in
  [Element("li", [],
           [span_class "rss-title" [html_title p];
            Data(if date = "" then "" else "&nbsp;&mdash;&nbsp;");
            span_class "rss-date" [Data date];
            span_class "rss-description" desc; ])]

let of_urls urls =
  let ch = channel_of_urls urls in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  let posts = List.map parse_item items in
  List.concat(List.map html_of_post posts)
  @ toggle_script

let news urls =
  let ch = channel_of_urls urls in
  let ch = Rss.keep_n_items 5 ch in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  let posts = List.map parse_item items in
  [Element("ul", [], List.concat(List.map news_of_post posts))]


(* OPML -- subscriber list
 ***********************************************************************)

module OPML = struct
  type contributor = {
    name : string;
    title : string;
    url : string;
  }

  (* Use Xmlm for the parsing, mostly because it is already needed by
     the [Rss] module => no additional dep. *)

  let contributors_of_url url =
    let fh = Xmlm.make_input (`String(0, Http.get url))  in
    let contrib = ref [] in
    try
      while true do
        match Xmlm.input fh with
        | `El_start((_, "outline"), args) ->
           contrib := { name = List.assoc ("", "text") args;
                        title = List.assoc ("", "text") args;
                        url = List.assoc ("", "xmlUrl") args;
                      } :: !contrib
        | _ -> ()
      done;
      assert false
    with Xmlm.Error(_, `Unexpected_eoi) ->
      !contrib

  let of_urls urls =
    let cs = List.concat (List.map (fun u -> contributors_of_url u) urls) in
    let cs = List.sort (fun c1 c2 -> String.compare c1.name c2.name) cs in
    let contrib_html c =
      Element("li", [], [Element("a", ["href", c.url], [Data c.name])]) in
    [Element("ul", [], List.map contrib_html cs)]
end
