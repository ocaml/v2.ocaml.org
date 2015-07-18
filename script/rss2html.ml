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
  | Atom.Text s | Atom.Html(_,s) -> s
  | Atom.Xhtml(_, x) -> syndic_to_string x


let rec resolve ?xmlbase html =
  List.map (resolve_links_el ~xmlbase) html
and resolve_links_el ~xmlbase = function
  | Nethtml.Element("a", attrs, sub) ->
     let attrs = match List.partition (fun (t,_) -> t = "href") attrs with
       | [], _ -> attrs
       | (_, h) :: _, attrs ->
          let src = Uri.to_string(XML.resolve xmlbase (Uri.of_string h)) in
          ("href", src) :: attrs in
     Nethtml.Element("a", attrs, resolve ?xmlbase sub)
  | Nethtml.Element("img", attrs, sub) ->
     let attrs = match List.partition (fun (t,_) -> t = "src") attrs with
       | [], _ -> attrs
       | (_, src) :: _, attrs ->
          let src = Uri.to_string(XML.resolve xmlbase (Uri.of_string src)) in
          ("src", src) :: attrs in
     Nethtml.Element("img", attrs, sub)
  | Nethtml.Element(e, attrs, sub) ->
     Nethtml.Element(e, attrs, resolve ?xmlbase sub)
  | Data _ as d -> d


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

let html_of_text ?xmlbase s =
  try Nethtml.parse (new Netchannels.input_string s)
                    ~dtd:Utils.relaxed_html40_dtd
      |> resolve ?xmlbase
      |> remove_undesired_tags
  with _ ->
    [Nethtml.Data(encode_html s)]

(* Do not trust sites using XML for HTML content.  Convert to string
   and parse back.  (Does not always fix bad HTML unfortunately.) *)
let rec html_of_syndic =
  let ns_prefix _ = Some "" in
  fun ?xmlbase h ->
  html_of_text ?xmlbase
               (String.concat "" (List.map (XML.to_string ~ns_prefix) h))


(* Feeds
 ***********************************************************************)

(* Email on the forge contains the name in parenthesis *)
let email_name_re =
  Str.regexp " *\\([a-zA-Z.]+@[a-zA-Z.]+\\) *(\\([^()]*\\))"

let author_email_name (a: Atom.author) =
  let open Atom in
  if Str.string_match email_name_re a.name 0 then
    let name = String.trim(Str.matched_group 2 a.name) in
    let email = match a.email with
      | None -> Some(Str.matched_group 1 a.name)
      | Some _ -> a.email in
    { a with name; email }
  else a

let special_processing (e: Atom.entry) =
  let open Atom in
  let a0, a = e.authors in
  if a0.name = "OCaml Weekly News" then
    { e with title = Text "Weekly News" }
  else
    { e with authors = (author_email_name a0,
                        List.map author_email_name a) }

(* Atom feed (with no entries) representing a broken feed.  The title
   is the reason for the failure.  Since these feed contain no
   entries, the aggregation will remove them. *)
let broken_feed name url reason =
  let feed = Atom.feed ~id:(Uri.of_string(Digest.to_hex(Digest.string name)))
                       ~authors:[Atom.author name]
                       ~title:(Atom.Text reason)
                       ~updated:(CalendarLib.Calendar.now())
                       [] in
  (* See Syndic.Opml1.of_atom for the convention on the length. *)
  Atom.set_self_link feed url ~length:(-1)

let feed_of_url ~name url =
  try
    let xml = `String(0, Http.get(Uri.to_string url)) in
    let feed =
      try Atom.parse ~self:url ~xmlbase:url (Xmlm.make_input xml)
      with Atom.Error.Error _ ->
        Rss2.parse ~xmlbase:url (Xmlm.make_input xml)
        |> Rss2.to_atom ~self:url in
    let feed = Atom.set_main_author feed (Atom.author name) in
    { feed with Atom.entries = List.map special_processing feed.Atom.entries }
  with
  | Rss2.Error.Error _ ->
      broken_feed name url "Neither an Atom nor a RSS2 feed"
  | Nethttp_client.Http_protocol(Nethttp_client.Timeout s)
  | Nethttp_client.Http_protocol(Nethttp_client.Name_resolution_error s) ->
     broken_feed name url s
  | Nethttp_client.Http_protocol Nethttp_client.Too_many_redirections ->
     broken_feed name url "Too many redirections"
  | Nethttp_client.Http_protocol e ->
     broken_feed name url (Printexc.to_string e)
  | Nethttp_client.Http_error(err, _) ->
     let msg = Nethttp.(string_of_http_status (http_status_of_int err)) in
     broken_feed name url msg

let planet_feeds =
  let add_feed acc line =
    try
      let i = String.index line '|' in
      let name = String.sub line 0 i in
      let url = String.sub line (i+1) (String.length line - i - 1) in
      feed_of_url ~name (Uri.of_string url) :: acc
    with Not_found -> acc in
  lazy(List.fold_left add_feed [] (Utils.lines_of_file planet_feeds_file))

let get_opml () =
  let feeds = Lazy.force planet_feeds in
  let date_modified =
    List.fold_left (fun d f -> Date.max d f.Atom.updated) Date.epoch feeds in
  let head = Syndic.Opml1.head ~date_modified
                               ~owner_name:"ocaml.org"
                               ~owner_email:"infrastructure@lists.ocaml.org"
                               "OCaml Planet" in
  (* Broken feeds will be marked with [is_comment = true]. *)
  let opml = Opml1.of_atom ~head feeds in
  (* Sort by name.  (FIXME: one may want to ignore spaces.) *)
  let by_name o1 o2 = String.compare o1.Opml1.text o2.Opml1.text in
  { opml with Opml1.body = List.sort by_name opml.Opml1.body }

let opml fname =
  Opml1.write (get_opml()) fname

let html_contributors () =
  let open Opml1 in
  let contrib_html (o: Opml1.outline) =
    match o.xml_url with
    | Some xml_url ->
       let attrs = ("href", Uri.to_string xml_url)
                   :: List.map (fun ((_,n), v) -> (n,v)) o.attrs in
       let attrs = if o.is_comment then ("class", "broken") :: attrs
                   else attrs in
       Element("li", [], [Element("a", attrs, [Data o.text])])
    | None -> Element("li", [], [Data o.text]) in
  [Element("ul", [], List.map contrib_html (get_opml()).body)]



(* Blog feed
 ***********************************************************************)

let digest_post (e: Atom.entry) =
  Digest.to_hex (Digest.string (Uri.to_string e.Atom.id))

let get_alternate_link (e: Atom.entry) =
  let open Atom in
  try Some (List.find (fun l -> l.rel = Alternate) e.links).href
  with Not_found -> match e.links with
                   | l :: _ -> Some l.href
                   | [] -> None

let get_feed_url (e: Atom.entry) =
  let open Atom in
  match e.source with
  | None -> None
  | Some s ->
     try Some(List.find (fun l -> l.rel = Self) s.links).href
     with Not_found -> None

let get_date (e: Atom.entry) =
  match e.Atom.published with
  | Some _ -> e.Atom.published
  | None -> Some e.Atom.updated

let get_story (e: Atom.entry) : html =
  let open Atom in
  match e.content with
  | Some(Text s) -> html_of_text s
  | Some(Html(xmlbase, s)) -> html_of_text ?xmlbase s
  | Some(Xhtml(xmlbase, h)) -> html_of_syndic ?xmlbase h
  | Some(Mime _) | Some(Src _)
  | None ->
     match e.summary with
     | Some(Text s) -> html_of_text s
     | Some(Html(xmlbase, s)) -> html_of_text ?xmlbase s
     | Some(Xhtml(xmlbase, h)) -> html_of_syndic ?xmlbase h
     | None -> []


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


let html_of_author (a: Atom.author) =
  let open Atom in
  match a.email with
  | None | Some "" -> Data a.name
  | Some email -> Element("a", ["href", "mailto:" ^ email], [Data a.name])

let rec html_of_authors = function
  | [] -> []
  | [a] -> [html_of_author a]
  | a :: tl -> html_of_author a :: Data ", " :: html_of_authors tl

(* In addition to the feed name, print the author name (general feed
   used by several authors). *)
let keep_entry_author feed_author (a: Atom.author) =
  let open Atom in
  a.name <> "" && a.name <> feed_author
  (* FIXME: maybe we want to be more subtle by checking for word boundaries: *)
  && not(Utils.KMP.is_substring ~pat:a.name feed_author)
  && not(Utils.KMP.is_substring ~pat:feed_author a.name)

let html_author_of_post (e: Atom.entry) =
  let open Atom in
  (* Only use the first source author (the one we set), the
     subsequent feed authors will be basically duplicates. *)
  let feed_author = match e.source with
    | Some s -> (match s.authors with a0 :: _ -> Some a0
                                   | [] -> None)
    | None -> None in
  let a0, a = e.authors in
  let authors = match feed_author with
    | Some feed_a -> List.filter (keep_entry_author feed_a.name) (a0 :: a)
    | None -> a0 :: a in
  match authors, feed_author with
  | _ :: _, Some feed_author ->
     html_of_author feed_author
     :: Data " (" :: html_of_authors authors @ [Data ")" ]
  | _ :: _, None -> html_of_authors authors
  | [], Some feed_author -> [html_of_author feed_author]
  | [], None -> []


let html_date_of_post e =
  match get_date e with
  | None -> []
  | Some d ->
     let date =
       let open Syndic.Date in
       sprintf "%s %02d, %d" (string_of_month(month d)) (day d) (year d) in
     [Data date]

(* Transform a post [p] (i.e. story) into HTML. *)
let html_of_post e =
  let title_anchor = digest_post e in
  let title = string_of_text_construct e.Atom.title in
  let html_title, share = match get_alternate_link e with
    | None -> [Data title], []
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
                         ^ "&amp;t=" ^ (Netencoding.Url.encode title);
                 "target", "_blank"; "title", "Share on Facebook"] in
       let tw = ["href", "https://twitter.com/intent/tweet?url=" ^ post
                         ^ "&text=" ^ (Netencoding.Url.encode title);
                 "target", "_blank"; "title", "Share on Twitter"] in
       let rss =
         match get_feed_url e with
         | Some feed ->
           [Element("a", ["class", "rss";  "target", "_blank";
                          "title", "Original RSS feed";
                          "href", Uri.to_string feed],
                    [Element("img", ["src", "/img/rss.svg"; "alt", "RSS";
                                     "class", "svg"], []);
                     Element("img", ["src", "/img/rss.png"; "alt", "RSS";
                                     "class", "png"], [])] )]
         | None -> [] in
       [Element("a", a_args, [Data(string_of_text_construct e.Atom.title)]) ],
       [Element("span", ["class", "share"],
                Element("a", a_args,
                        [Element("img", ["src", "/img/chain-link-icon.png";
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
  let sep = Data " — " in
  let additional_info = match html_author_of_post e, html_date_of_post e with
    | [], [] -> []
    | html_author, [] -> sep :: html_author
    | [], date -> sep :: date
    | html_author, date -> sep :: (html_author @ (Data ", " :: date)) in
  let additional_info =
    [Element("span", ["class", "additional-info"], additional_info)] in
  let story = get_story e in
  let story =
    if length_html story < 500 then story
    else toggle (prefix_of_html story 500) story ~anchor:title_anchor
  in
  [Data "\n";
   Element("a", ["name", title_anchor], []);
   Element("section", ["style", "clear: both"],
           [Element("h1", ["class", "ruled planet"],
                    share @ html_title @ additional_info);
            Element("div", ["class", "planet-post"], story)]);
   Data "\n"]


let li_of_post (e: Atom.entry) =
  let sep = Data " — " in
  let title = string_of_text_construct e.Atom.title in
  let title = match get_alternate_link e with
    | None -> [Data title]
    | Some u -> [Element("a", ["href", Uri.to_string u; "target", "_blank";
                              "title", "Go to the original post"],
                        [Data title]) ] in
  let line = match html_author_of_post e, html_date_of_post e with
    | [], [] -> title
    | html_author, [] -> title @ (sep :: html_author)
    | [], date -> date @ (Data "," :: title)
    | html_author, date ->
       date @ (Data ", " :: title @ (sep :: html_author)) in
  Element("li", [], line)

let netdate_of_calendar d =
  let month =
    let open Syndic.Date in
    match month d with
    | Jan -> 1 | Feb -> 2 | Mar -> 3 | Apr -> 4 | May -> 5 | Jun -> 6
    | Jul -> 7 | Aug -> 8 | Sep -> 9 | Oct -> 10 | Nov -> 11 | Dec -> 12 in
  { Netdate.year = Syndic.Date.year d;
    month;
    day = Syndic.Date.day d;
    hour = Syndic.Date.hour d;
    minute = Syndic.Date.minute d;
    second = truncate(Syndic.Date.second d);
    nanos = 0;  zone = 0;  week_day = -1 }

(* Similar to [html_of_post] but tailored to be shown in a list of
   news (only titles are shown, linked to the page with the full story). *)
let headline_of_post ?(planet=false) ?(img_alt="") ~l9n ~img e =
  let link =
    if planet then planet_url ^ "#" ^ digest_post e
    else match get_alternate_link e with
         | Some l -> Uri.to_string l
         | None -> "" in
  let html_icon =
    [Element("a", ["href", link],
             [Element("img", ["src", img ^ ".svg"; "class", "svg";
                              "alt", img_alt], []);
              Element("img", ["src", img ^ ".png"; "class", "png";
                              "alt", img_alt], [])])] in
  let html_date = match get_date e with
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
  let title = string_of_text_construct e.Atom.title in
  let html_title =
    Element("h1", [],
            if link = "" then [Data title]
            else [Element("a", ["href", link; "title", title],
                          [Data title])] )in
  [Element("li", [], [Element("article", [], html_title :: html_date)]);
   Data "\n"]

let rec remove n l =
  if n <= 0 then l
  else match l with [] -> []
                  | _ :: tl -> remove (n - 1) tl

let rec take n = function
  | [] -> []
  | e :: tl -> if n > 0 then e :: take (n-1) tl else []

let aggregated_feed =
  lazy(Atom.aggregate (Lazy.force planet_feeds)
                      ~sort:`Newest_first
                      ~title:(Atom.Text "OCaml Planet"))

let get_posts ?n ?(ofs=0) () =
  let feed = Lazy.force aggregated_feed in
  let entries = remove ofs feed.Atom.entries in
  let entries = match n with
    | None -> entries
    | Some n -> take n entries in
  { feed with Atom.entries = entries }

let headlines ?n ?ofs ?planet ~l9n () =
  let posts = (get_posts ?n ?ofs ()).Atom.entries in
  let img = "/img/news" in
  [Element("ul", ["class", "news-feed"],
           List.concat(List.map (headline_of_post ?planet ~l9n ~img) posts))]

let posts ?n ?ofs () =
  let posts = (get_posts ?n ?ofs ()).Atom.entries in
  [Element("div", [], List.concat(List.map html_of_post posts))]

let nposts () = List.length (get_posts ()).Atom.entries


let en_string_of_month =
  let open Syndic.Date in
  function
  | Jan -> "January"
  | Feb -> "February"
  | Mar -> "March"
  | Apr -> "April"
  | May -> "May"
  | Jun -> "June"
  | Jul -> "July"
  | Aug -> "August"
  | Sep -> "September"
  | Oct -> "October"
  | Nov -> "November"
  | Dec -> "December"

module Year_Month = struct
  type t = int * Syndic.Date.month (* year, month *)

  let compare ((y1, m1): t) ((y2, m2): t) =
    let dy = compare y1 y2 in
    if dy = 0 then compare m1 m2 else dy
end
module DMap = Map.Make(Year_Month)

let list_of_posts ?n ?ofs () =
  let posts = (get_posts ?n ?ofs ()).Atom.entries in
  (* Split posts per year/month *)
  let classify m e =
    match get_date e with
    | None -> m (* drop *)
    | Some d ->
       let key = (Syndic.Date.year d, Syndic.Date.month d) in
       let posts = try e :: DMap.find key m with Not_found -> [e] in
       DMap.add key posts m in
  let m = List.fold_left classify DMap.empty posts in
  let add_html (year, month) posts html =
    let title = en_string_of_month month ^ " " ^ string_of_int year in
    let posts = List.rev posts in (* posts originally sorted by date *)
    Element("h2", ["id", title], [Data title])
    :: Element("ul", [], List.map li_of_post posts)
    :: html in
  (* Older date considered first => final HTML has more recent dates first *)
  DMap.fold add_html m []


(* Aggregation of posts
 ***********************************************************************)

let aggregate ?n fname =
  Atom.write (get_posts ?n ()) fname


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
  let posts = (feed_of_url ~name:"" url).Atom.entries in
  let posts = List.sort Atom.descending posts in
  let normalize_title (e: Atom.entry) =
    let title = string_of_text_construct e.Atom.title in
    let title = Str.replace_first caml_list_re "" title in
    let title = delete_author title in
    { e with Atom.title = Atom.Text title } in
  let posts = List.map normalize_title posts in
  (* Keep only the more recent post of redundant subjects. *)
  let module S = Set.Make(String) in
  let seen = ref S.empty in
  let must_keep (e: Atom.entry) =
    let title = string_of_text_construct e.Atom.title in
    if S.mem title !seen then false
    else (seen := S.add title !seen;  true) in
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
  let ofs_posts = ref 0 in
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
    ("--list", Arg.Unit(fun () -> action := `List),
     " RSS feed to a single HTML");
    ("--nposts", Arg.Unit(fun () -> action := `NPosts),
     " number of posts in the RSS feed");
    ("--opml", Arg.String(fun fn -> action := `Opml fn),
     "fname write an OMPL document to the given file");
    ("--aggregate", Arg.String(fun fn -> action := `Aggregate fn),
     "fname write the aggregated feed to the given file");
    ("-n", Arg.Int(fun n -> n_posts := Some n),
     "n limit the number of posts to n (default: all of them)");
    ("--ofs", Arg.Set_int ofs_posts,
     "n start at the n th post (first is numbered 0)");
    ("--locale",
     Arg.String(fun l -> l9n := Netdate.(l9n_from_locale l)),
     "l Translate dates for the locale l")  ] in
  let anon_arg s = url := s in
  Arg.parse (Arg.align specs) anon_arg "rss2html <URL>";
  let url = Uri.of_string !url in
  let l9n = Netdate.compile_l9n !l9n in
  let out = new Netchannels.output_channel stdout in
  (match !action with
   | `Headlines ->
      Nethtml.write out (headlines ~planet:true ?n:!n_posts ~ofs:!ofs_posts
                                   ~l9n ())
   | `Emails -> Nethtml.write out (email_threads ?n:!n_posts ~l9n url)
   | `Posts -> Nethtml.write out (toggle_script
                                 @ posts ?n:!n_posts ~ofs:!ofs_posts ())
   | `List ->  Nethtml.write out (list_of_posts ?n:!n_posts ~ofs:!ofs_posts ())
   | `NPosts -> printf "%i" (nposts())
   | `Subscribers -> Nethtml.write out (html_contributors())
   | `Opml fn -> opml fn
   | `Aggregate fn -> aggregate fn ?n:!n_posts
  );
  out#close_out()


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/rss2html" *)
(* End: *)
