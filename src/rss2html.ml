(** This file is based on a fork of https://github.com/ocaml/ocaml.org/blob/7ba052e8f750de872dbd993fa70f8744414b3d44/src/app/render_rss.ml
    Important note: This file needs to be cleaned or to be replaced.
*)

(** Render an RSS feed to HTML. *)

open Printf
open Nethtml

module Rss = struct
  include Rss

  let aug = Str.regexp_string "AUg"
  (* Temporary fix until a new version of OCamlnet is released. *)
  let string_of_date d =
    let s = string_of_date d in
    Str.replace_first aug "Aug" s
end

let text_description = []

let stdin_to_channel () : Rss.channel =
  let cat i =
    let b = Buffer.create 42 in
    begin try while true do
          Buffer.add_char b (input_char stdin)
        done
      with End_of_file -> ()
    end;
    Buffer.contents b
  in
  let ch, err = Rss.channel_of_string(cat stdin) in
  ch 

(* Our representation of a "post". *)
type post = {
  title  : string;
  link   : Rss.url option;   (* url of the original post *)
  date   : Rss.date option;
  author : string;
  email  : string;    (* the author email, "" if none *)
  desc   : string;
}

let digest_post p = match p.link with
  | None -> Digest.to_hex (Digest.string (p.title))
  | Some u -> Digest.to_hex (Digest.string (p.title ^ Neturl.string_of_url u))

let html_title p = match p.link with
  | None -> Data p.title
  | Some u -> Element("a", ["href", Neturl.string_of_url u], [Data p.title])

let html_author p =
  if p.email = "" then Data p.author
  else Element("a", ["href", "mailto:" ^ p.email], [Data p.author])

let string_of_option = function None -> "" | Some s -> s

(* Transform an RSS item into a [post]. *)
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
  let link = match it.item_guid, it.item_link with
    | Some(Guid_permalink u), _ -> Some u
    | _, Some _ -> it.item_link
    | Some(Guid_name u), _ ->
       (* Sometimes the guid is indicated with isPermaLink="false" but
          is nonetheless the only URL we get (e.g. ocamlpro). *)
       (try Some(Neturl.parse_url u) with _ -> it.item_link)
    | None, None -> None in
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

let rec string_of_html html =
  String.concat "" (List.map string_of_el html)
and string_of_el = function
  | Element(tagname, attributes, content) ->
    Printf.sprintf
      "<%s%s>%s</%s>"
      tagname
      (String.concat ""
         (List.map (fun (a,v) -> Printf.sprintf " %s=%S" a v) attributes))
      (string_of_html content)
      tagname
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

(* [toggle html1 html2] return some piece of html with buttons to pass
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
  let title_anchor = digest_post p in
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
      if length_html desc < 1200 then desc
      else toggle (prefix_of_html desc 1200) desc ~anchor:title_anchor
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
   news (only titles are shown, linked to the page with the full story). *)
let news_of_post ?(len=400) p =
  let date = match p.date with
    | None -> ""
    | Some d -> Rss.string_of_date d in
  let span_class c html = Element("span", ["class", c], html) in
  let link = "planet#" ^ digest_post p in
  let html_title = Element("a", ["href", link], [Data p.title]) in
  [Element("li", [],
           [span_class "rss-title" [html_title];
            Data(if date = "" then "" else "&nbsp;&mdash;&nbsp;");
            span_class "rss-date" [Data date] ])]

(* ************************************************** *)
let news () =
  let ch = stdin_to_channel() in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  let posts = List.map parse_item items in
  [Element("ul", [], List.concat(List.map news_of_post posts))]

let posts () =
  let ch = stdin_to_channel() in
  let items = Rss.sort_items_by_date ch.Rss.ch_items in
  let posts = List.map parse_item items in
  [Element("div", [], List.concat(List.map html_of_post posts))]
(* ************************************************** *)



(* OPML -- subscriber list
 ***********************************************************************)

module OPML = struct
  type contributor = {
    name  : string;
    title : string;
    url   : string;
  }

  (* Use Xmlm for the parsing, mostly because it is already needed by
     the [Rss] module => no additional dep. *)

  let contributors () =
    let fh = Xmlm.make_input (`Channel(stdin)) in
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
      let cs =
        List.sort (fun c1 c2 -> String.compare c1.name c2.name) !contrib
      in
      let contrib_html c =
        Element("li", [], [Element("a", ["href", c.url], [Data c.name])])
      in
      [Element("ul", [], List.map contrib_html cs)]
end


let _ =
  if Array.length Sys.argv = 1 then
    print_endline(string_of_html(toggle_script@posts()))
  else
    let open Arg in
    parse
      (align[
        "-summary",
        Unit(fun () -> print_endline(string_of_html(news()))),
        " RSS feed to feed summary (in HTML)";

        "-subscribers", 
        Unit(fun () -> print_endline(string_of_html(OPML.contributors()))),
        " OPML feed to list of subscribers (in HTML)";

        "-tohtml", 
        Unit(fun () -> print_endline(string_of_html(toggle_script@posts()))),
        " RSS feed to HTML";
      ] )
      (fun s -> Printf.eprintf "don't know what to do with %s" s; exit 1)
      ("Giving no option is equivalent to -tohtml")
    

