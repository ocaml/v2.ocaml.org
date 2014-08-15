(** Render an RSS feed to HTML, for the headlines or the actual posts. *)

open Printf
open Nethtml
open Syndic

let planet_url = "/community/planet/"
let planet_full_url = "http://ocaml.org/community/planet/"

let planet_feeds_file = "planet_feeds.txt"

(* Utils
 ***********************************************************************)

type html = Nethtml.document list

let encode_html =
  Netencoding.Html.encode ~prefer_name:false ~in_enc:`Enc_utf8 ()

let decode_document html = Nethtml.decode ~enc:`Enc_utf8 html

let encode_document html = Nethtml.encode ~enc:`Enc_utf8 html

(* Remove all tags *)
let rec syndic_to_buffer b = function
  | XML.Node (_, _, subs) -> List.iter (syndic_to_buffer b) subs
  | XML.Data (_, d) -> Buffer.add_string b d

let syndic_to_string x =
  let b = Buffer.create 1024 in
  List.iter (syndic_to_buffer b) x;
  Buffer.contents b

let string_of_text_construct : Atom.text_construct -> string = function
  (* FIXME: we probably would like to parse the HTML and remove the tags *)
  | Atom.Text s | Atom.Html s -> s
  | Atom.Xhtml x -> syndic_to_string x

(* Feeds
 ***********************************************************************)

type feed =
  | Atom of Atom.feed
  | Rss2 of Rss2.channel
  | Broken of string (* the argument gives the reason *)

let classify_feed (xml: string) =
  try Atom(Atom.parse (Xmlm.make_input (`String(0, xml))))
  with Atom.Error.Error _ ->
          try Rss2(Rss2.parse (Xmlm.make_input (`String(0, xml))))
          with Rss2.Error.Error _ ->
                Broken "Neither Atom nor RSS2 feed"

type contributor = {
    name  : string;
    title : string;
    url   : string;
    feed  : feed;
  }

let feed_of_url ~name url =
  try
    let feed = classify_feed (Http.get url) in
    let title = match feed with
      | Atom atom -> string_of_text_construct atom.Atom.title
      | Rss2 ch -> ch.Rss2.title
      | Broken _ -> "" in
    { name;  title;  url;  feed }
  with
  | Http_client.Http_protocol(Http_client.Timeout s)
  | Http_client.Http_protocol(Http_client.Name_resolution_error s) ->
     { name;  title = "";  url;  feed = Broken s }
  | Http_client.Http_protocol Http_client.Too_many_redirections ->
     { name;  title = "";  url;  feed = Broken "Too many redirections" }
  | Http_client.Http_error(err, _) ->
     let msg = Nethttp.(string_of_http_status (http_status_of_int err)) in
     { name;  title = "";  url;  feed = Broken msg }

let planet_feeds() =
  let add_feed acc line =
    try
      let i = String.index line '|' in
      let name = String.sub line 0 i in
      let url = String.sub line (i+1) (String.length line - i - 1) in
      feed_of_url ~name url :: acc
    with Not_found -> acc in
  List.fold_left add_feed [] (Utils.lines_of_file planet_feeds_file)

let html_contributors () =
  let contributors =
    List.sort (fun c1 c2 -> String.compare c1.name c2.name) (planet_feeds()) in
  let contrib_html c =
    let attr = match c.feed with
      | Broken s -> ["class", "broken";  "title", encode_html s]
      | _ -> [] in
    Element("li", [], [Element("a", ("href", c.url) :: attr, [Data c.name])]) in
  [Element("ul", [], List.map contrib_html contributors)]

(** Output the list of feeds to [fname] using OMPL syntax.
    Bsed on http://dev.opml.org/spec2.html *)
let opml fname =
  let fh = open_out fname in
  let today =
    let open CalendarLib in
    Printer.Calendar.sprint "%a, %0d %b %Y %T %:z" (Calendar.now()) in
  fprintf fh
          "<?xml version=\"1.0\"?>\n<opml version=\"1.1\">\n\
           <head>\n\
           <title>OCaml Planet</title>\n\
           <dateModified>%s</dateModified>\n\
           <ownerName>ocaml.org</ownerName>\n\
           <ownerEmail>infrastructure@lists.ocaml.org</ownerEmail>\n\
           </head>\n<body>\n" today;
  let output_feed c =
    fprintf fh "<outline type=\"rss\" text=\"%s\" \
                title=\"%s\" xmlUrl=\"%s\"/>\n"
            (encode_html c.name) (encode_html c.title) (encode_html c.url) in
  List.iter output_feed (planet_feeds());
  fprintf fh "</body>\n</opml>\n";
  close_out fh



(* Blog feed
 ***********************************************************************)

(* Things that posts should not contain *)
let undesired_tags = ["style"; "script"]
let undesired_attr = ["id"]

let remove_undesired_attr =
  List.filter (fun (a,_) -> not(List.mem a undesired_attr))

let rec remove_undesired_tags html =
  Utils.filter_map html remove_undesired_tags_el
and remove_undesired_tags_el = function
  | Nethtml.Element(t, a, sub) ->
     if List.mem t undesired_tags then None
     else Some(Nethtml.Element(t, remove_undesired_attr a,
                               remove_undesired_tags sub))
  | Data _ as d -> Some d

let html_of_text s =
  try Nethtml.parse (new Netchannels.input_string s)
                    ~dtd:Utils.relaxed_html40_dtd
      |> decode_document |> remove_undesired_tags
  with _ ->
    [Nethtml.Data(encode_html s)]

(* Do not trust sites using XML for HTML content.  Convert to string
   and parse back.  (Does not always fix bad HTML unfortunately.) *)
let rec html_of_syndic =
  let ns_prefix _ = Some "" in
  fun h ->
  html_of_text(String.concat "" (List.map (XML.to_string ~ns_prefix) h))


(** Our representation of a "post". *)
type post = {
  title  : string;
  link   : Uri.t option;   (* url of the original post *)
  date   : CalendarLib.Calendar.t option;
  author : contributor;
  email  : string;    (* the author email, "" if none *)
  desc   : html;
}

let post_compare p1 p2 =
  (* Most recent posts first.  Posts with no date are always last *)
  match p1.date, p2.date with
  | Some d1, Some d2 -> CalendarLib.Calendar.compare d2 d1
  | None, Some _ -> 1
  | Some _, None -> -1
  | None, None -> 1

let digest_post p = match p.link with
  | None -> Digest.to_hex (Digest.string (p.title))
  | Some u -> Digest.to_hex (Digest.string (p.title ^ Uri.to_string u))

let string_of_option = function None -> "" | Some s -> s

let post_of_atom ~author (entry: Atom.entry) =
  let open Atom in
  let link = try Some (List.find (fun l -> l.rel = Alternate) entry.links).href
             with Not_found -> match entry.links with
                              | l :: _ -> Some l.href
                              | [] -> None in
  let date = match entry.published with
    | Some _ -> entry.published
    | None -> Some entry.updated in
  let desc = match entry.content with
    | Some(Text s) | Some(Html s) -> html_of_text s
    | Some(Xhtml h) -> html_of_syndic h
    | Some(Mime _) | Some(Src _)
    | None ->
       match entry.summary with
       | Some(Text s) | Some(Html s) -> html_of_text s
       | Some(Xhtml h) -> html_of_syndic h
       | None -> [] in
  { title = string_of_text_construct entry.title;
    link;  date;
    author = author;
    email = (fst entry.authors).name;
    desc }

let post_of_rss2 ~author it =
  let open Syndic.Rss2 in
  let title, desc = match it.story with
    | All (t, d) -> t, html_of_text d
    | Title t -> t, []
    | Description d -> "", html_of_text d in
  let link = match it.guid, it.link with
    | Some u, _ when u.permalink -> Some u.data
    | _, Some _ -> it.link
    | Some u, _ ->
       (* Sometimes the guid is indicated with isPermaLink="false" but
          is nonetheless the only URL we get (e.g. ocamlpro). *)
       Some u.data
    | None, None -> None in
  { title; link; author;
    email = string_of_option it.author;
    desc;
    date = it.pubDate }

let posts_of_contributor c =
  match c.feed with
  | Atom f -> List.map (post_of_atom ~author:c) f.Atom.entries
  | Rss2 ch -> List.map (post_of_rss2 ~author:c) ch.Rss2.items
  | Broken _ -> []


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

let rec len_prefix_of_html html len =
  if len <= 0 then 0, []
  else match html with
       | [] -> len, []
       | el :: tl -> let len, prefix_el = len_prefix_of_el el len in
                    let len, prefix_tl = len_prefix_of_html tl len in
                    len, prefix_el :: prefix_tl
and len_prefix_of_el el len =
  match el with
  | Data d ->
     let len' = len - String.length d in
     len', (if len' >= 0 then el else Data(String.sub d 0 len ^ "…"))
  | Element(tag, args, content) ->
     (* Remove "id" and "name" to avoid duplicate anchors with the
        whole post. *)
     let args = List.filter (fun (n,_) -> n <> "id" && n <> "name") args in
     let len, prefix_content = len_prefix_of_html content len in
     len, Element(tag, args, prefix_content)

let rec prefix_of_html html len =
  snd(len_prefix_of_html html len)


let new_id =
  let id = ref 0 in
  fun () -> incr id; sprintf "ocamlorg-post%i" !id

(* [toggle html1 html2] return some piece of html with buttons to pass
   from [html1] to [html2] and vice versa. *)
let toggle ?(anchor="") html1 html2 =
  let button id1 id2 text =
    Element("a", ["onclick", sprintf "switchContent('%s','%s')" id1 id2;
                  "class", "btn planet-toggle";
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
     }\n" in
  [Element("script", ["type", "text/javascript"], [Data script])]


(* Transform a post [p] (i.e. story) into HTML. *)
let html_of_post p =
  let title_anchor = digest_post p in
  let html_title, share = match p.link with
    | None -> [Data p.title], []
    | Some u ->
       let url_orig = Uri.to_string u in
       let a_args = ["href", url_orig; "target", "_blank";
                     "title", "Go to the original post"] in
       let post =
         Netencoding.Url.encode (planet_full_url ^ "#" ^ title_anchor) in
       let google = ["href", "https://plus.google.com/share?url="
                             ^ (Netencoding.Url.encode url_orig);
                     "target", "_blank"; "title", "Share on Google+"] in
       let fb = ["href", "https://www.facebook.com/share.php?u=" ^ post
                         ^ "&amp;t=" ^ (Netencoding.Url.encode p.title);
                 "target", "_blank"; "title", "Share on Facebook"] in
       let tw = ["href", "https://twitter.com/intent/tweet?url=" ^ post
                         ^ "&text=" ^ (Netencoding.Url.encode p.title);
                 "target", "_blank"; "title", "Share on Twitter"] in
       let feed = p.author.url in
       let rss =
         if feed <> "" then
           [Element("a", ["class", "rss";  "target", "_blank";
                          "title", "Original RSS feed"; "href", feed],
                    [Element("img", ["src", "/img/rss.svg"; "alt", "RSS";
                                     "class", "svg"], []);
                     Element("img", ["src", "/img/rss.png"; "alt", "RSS";
                                     "class", "png"], [])] )]
         else [] in
       [Element("a", a_args, [Data p.title]) ],
       [Element("span", ["class", "share"],
                Element("a", a_args,
                        [Element("img", ["src", "/img/chain-link-icon.png ";
                                         "alt", ""], []) ])
                :: Element("a", ("class", "googleplus") :: google,
                           [Element("img", ["src", "/img/googleplus.png";
                                            "alt", "Google+"], []) ])
                :: Element("a", ("class", "facebook") :: fb,
                           [Element("img", ["src", "/img/facebook.png";
                                            "alt", "FB"], []) ])
                :: Element("a", ("class", "twitter") :: tw,
                           [Element("img", ["src", "/img/twitter.png";
                                            "alt", "Twitter"], []) ])
                :: rss) ] in
  let html_author =
    if p.email = "" then Data p.author.name
    else Element("a", ["href", "mailto:" ^ p.email], [Data p.author.name]) in
  let sep = Data " — " in
  let additional_info = match p.date with
    | None ->
       if p.author.name = "" then [] else [sep; html_author]
    | Some d ->
       let date = CalendarLib.Printer.Calendar.sprint "%b %d, %Y" d in
       if p.author.name = "" then [sep; Data date]
       else [sep; html_author; Data ", "; Data date] in
  let additional_info =
    [Element("span", ["class", "additional-info"], additional_info)] in
  let desc =
    if length_html p.desc < 500 then p.desc
    else toggle (prefix_of_html p.desc 500) p.desc ~anchor:title_anchor
  in
  [Data "\n";
   Element("a", ["name", title_anchor], []);
   Element("section", ["style", "clear: both"],
           [Element("h1", ["class", "ruled planet"],
                    share @ html_title @ additional_info);
            Element("div", ["class", "planet-post"], desc)]);
   Data "\n"]


let netdate_of_calendar d =
  let open CalendarLib in
  let month =
    let open Calendar in
    match Calendar.month d with
    | Jan -> 1 | Feb -> 2 | Mar -> 3 | Apr -> 4 | May -> 5 | Jun -> 6
    | Jul -> 7 | Aug -> 8 | Sep -> 9 | Oct -> 10 | Nov -> 11 | Dec -> 12 in
  { Netdate.year = Calendar.year d;
    month;
    day = Calendar.day_of_month d;
    hour = Calendar.hour d;
    minute = Calendar.minute d;
    second = Calendar.second d;
    nanos = 0;  zone = 0;  week_day = -1 }

(* Similar to [html_of_post] but tailored to be shown in a list of
   news (only titles are shown, linked to the page with the full story). *)
let headline_of_post ?(planet=false) ?(img_alt="") ~l9n ~img p =
  let link =
    if planet then planet_url ^ "#" ^ digest_post p
    else match p.link with
         | Some l -> Uri.to_string l
         | None -> "" in
  let html_icon =
    [Element("a", ["href", link],
             [Element("img", ["src", img ^ ".svg"; "class", "svg";
                              "alt", img_alt], []);
              Element("img", ["src", img ^ ".png"; "class", "png";
                              "alt", img_alt], [])])] in
  let html_date = match p.date with
    | None -> html_icon
    | Some d ->
       (* Netdate internationalization functions are more developed. *)
       let d =
         let d = netdate_of_calendar d in
         if Netdate.format ~fmt:"%x" d = Netdate.format ~fmt:"%x" d ~l9n then
           (* English style *)
           Netdate.format ~fmt:"%B %e, %Y" d ~l9n
         else
           Netdate.format ~fmt:"%e %B %Y" d ~l9n in
       Element("p", [], [Data d]) :: html_icon in
  let html_title =
    Element("h1", [],
            if link = "" then [Data p.title]
            else [Element("a", ["href", link; "title", p.title],
                          [Data p.title])] )in
  [Element("li", [], [Element("article", [], html_title :: html_date)]);
   Data "\n"]

let rec take n = function
  | [] -> []
  | e :: tl -> if n > 0 then e :: take (n-1) tl else []

let get_posts ?n () =
  let posts = List.concat (List.map posts_of_contributor (planet_feeds())) in
  let posts = List.sort post_compare posts in
  match n with
  | None -> posts
  | Some n -> take n posts

let headlines ?n ?planet ~l9n () =
  let posts = get_posts ?n () in
  let img = "/img/news" in
  [Element("ul", ["class", "news-feed"],
           List.concat(List.map (headline_of_post ?planet ~l9n ~img) posts))]

let posts ?n () =
  let posts = get_posts ?n () in
  [Element("div", [], List.concat(List.map html_of_post posts))]

let nposts () = List.length (get_posts ())

(* Aggregation of posts
 ***********************************************************************)

let aggregate ?n fname =
  let feeds = planet_feeds () in
  let to_atom (c: contributor) =
    match c.feed with
    | Atom a -> Some(Some (Uri.of_string c.url), a)
    | Rss2 ch -> Some(Some (Uri.of_string c.url), Rss2.to_atom ch)
    | Broken _ -> None in
  let atoms = Utils.filter_map feeds to_atom in
  let feed = Atom.aggregate atoms
                            ~title:(Atom.Text "OCaml Planet") in
  let feed = match n with
    | Some n ->
       (* Sort the entries by date and the the [n] most recent ones. *)
       let open Atom in
       let by_date (e1: entry) (e2: entry) =
         CalendarLib.Calendar.compare e2.updated e1.updated in
       let entries = List.sort by_date feed.entries in
       { feed with entries = take n entries }
    | None -> feed in
  let fh = open_out fname in
  Atom.output feed (`Channel fh);
  close_out fh


(* Email threads
 ***********************************************************************)

(* The author is put at the end of the title: " - author name".
   Beware that the name may contain "-" (assumed without spaces
   around). *)
let delete_author title =
  let rec seek_dash pos =
  try
    let i = String.rindex_from title pos '-' in
    if i > 0 && i < pos then
      if title.[i-1] = ' ' && title.[i+1] = ' ' then
        String.trim(String.sub title 0 i)
      else (* maybe a correct dash before ? *)
        seek_dash (i-1)
    else title
  with Not_found -> title in
  seek_dash (String.length title - 1)

(* Remove the "[Caml-list]" and possible "Re:". *)
let caml_list_re =
  Str.regexp_case_fold "^\\(Re: *\\)*\\(\\[[a-zA-Z0-9-]+\\] *\\)*"

(** [email_threads] does basically the same as [headlines] but filter
    the posts to have repeated subjects.  It also presents the subject
    better. *)
let email_threads ?n ~l9n url =
  (* Do not use [n] yet because posts are filtered. *)
  let posts = posts_of_contributor (feed_of_url ~name:"" url) in
  let posts = List.sort post_compare posts in
  let normalize_title p =
    let title = Str.replace_first caml_list_re "" p.title in
    let title = delete_author title in
    { p with title } in
  let posts = List.map normalize_title posts in
  (* Keep only the more recent post of redundant subjects. *)
  let module S = Set.Make(String) in
  let seen = ref S.empty in
  let must_keep p =
    if S.mem p.title !seen then false
    else (seen := S.add p.title !seen;  true) in
  let posts = List.filter must_keep posts in
  let posts = (match n with
               | Some n -> take n posts
               | None -> posts) in
  let img = "/img/mail-icon" in
  [Element("ul", ["class", "news-feed"],
           List.concat(List.map (fun p -> headline_of_post ~l9n ~img p) posts))]


(* Main
 ***********************************************************************)

let () =
  let url = ref "" in
  let action = ref `Posts in
  let n_posts = ref None in (* means unlimited *)
  let l9n = ref Netdate.posix_l9n in
  let specs = [
    ("--headlines", Arg.Unit(fun () -> action := `Headlines),
     " RSS feed to feed summary (in HTML)");
    ("--emails", Arg.Unit(fun () -> action := `Emails),
     " RSS feed of email threads to HTML");
    ("--subscribers", Arg.Unit(fun () -> action := `Subscribers),
     " list of subscribers (rendered to HTML if alone)");
    ("--posts", Arg.Unit(fun () -> action := `Posts),
     " RSS feed to HTML (default action)");
    ("--nposts", Arg.Unit(fun () -> action := `NPosts),
     " number of posts in the RSS feed");
    ("--opml", Arg.String(fun fn -> action := `Opml fn),
     "fname write an OMPL document to the given file");
    ("--aggregate", Arg.String(fun fn -> action := `Aggregate fn),
     "fname write the aggregated feed to the given file");
    ("-n", Arg.Int(fun n -> n_posts := Some n),
     "n limit the number of posts to n (default: all of them)");
    ("--locale",
     Arg.String(fun l -> l9n := Netdate.(l9n_from_locale l)),
     "l Translate dates for the locale l")  ] in
  let anon_arg s = url := s in
  Arg.parse (Arg.align specs) anon_arg "rss2html <URL>";
  let l9n = Netdate.compile_l9n !l9n in
  let out = new Netchannels.output_channel stdout in
  (match !action with
   | `Headlines ->
      Nethtml.write out (headlines ~planet:true ?n:!n_posts ~l9n ())
   | `Emails -> Nethtml.write out (email_threads ?n:!n_posts ~l9n !url)
   | `Posts -> Nethtml.write out (toggle_script @ posts ?n:!n_posts ())
   | `NPosts -> printf "%i" (nposts())
   | `Subscribers -> Nethtml.write out (html_contributors())
   | `Opml fn -> opml fn
   | `Aggregate fn -> aggregate fn ?n:!n_posts
  );
  out#close_out()


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/rss2html" *)
(* End: *)
