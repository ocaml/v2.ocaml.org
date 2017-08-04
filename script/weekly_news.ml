(* Read the weekly news and display them on the site. *)

open Syndic
open Printf

let cwn_base_url = "http://alan.petitepomme.net/cwn/"

(* More recent first *)
let compare_date (i1: Rss2.item) (i2: Rss2.item) =
  let open Rss2 in
  match i1.pubDate, i2.pubDate with
  | Some d1, Some d2 -> Syndic.Date.compare d2 d1
  | None, Some _ -> 1
  | Some _, None -> -1
  | None, None -> 0

let post =
  lazy (
      let xml = `String(0, Http.get (cwn_base_url ^ "cwn.rss")) in
      let feed = Syndic.Rss2.parse (Xmlm.make_input xml) in
      let posts = List.sort compare_date feed.Rss2.items in
      match posts with p :: _ -> p
                     | [] -> failwith "weekly_news: empty feed!"
    )

let cwn_date =
  lazy (match (Lazy.force post).Rss2.pubDate with
        | Some d -> d
        | None -> failwith "cwn_date")

(* FIXME: shared with rss2html *)
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

let cwn_html_date () =
  let d = Lazy.force cwn_date in
  [Nethtml.Data(sprintf "%s %d, %d" (en_string_of_month(Date.month d))
                  (Date.day d) (Date.year d))]

(* FIXME: shared with rss2html *)
let int_of_month =
  let open Date in
  function
  | Jan -> 1 | Feb -> 2 | Mar -> 3 | Apr -> 4 | May -> 5 | Jun -> 6
  | Jul -> 7 | Aug -> 8 | Sep -> 9 | Oct -> 10 | Nov -> 11 | Dec -> 12


let rec get_elements tag = function
  | [] -> []
  | Nethtml.Data _ :: tl -> get_elements tag tl
  | Nethtml.Element(t, _, c) :: tl ->
     let e = if t = tag then c else get_elements tag c in
     e @ get_elements tag tl

let rec list_rm n = function
  | [] -> []
  | (_ :: tl) as l -> if n <= 0 then l else list_rm (n - 1) tl

let cwn_html_page () =
  let d = Lazy.force cwn_date in
  let url = cwn_base_url ^ sprintf "%d.%02d.%02d.html" (Date.year d)
                             (int_of_month (Date.month d)) (Date.day d) in
  let content = Http.get url in
  let html = Nethtml.parse (new Netchannels.input_string content)
               ~dtd:Utils.relaxed_html40_dtd in
  let html = get_elements "body" html in
  list_rm 7 html


let cwn_html_summary() =
  match (Lazy.force post).Rss2.story with
  | Rss2.All(_, _, content) ->
     let open Nethtml in
     Nethtml.parse (new Netchannels.input_string content)
       ~dtd:Utils.relaxed_html40_dtd
  | Rss2.Title _ | Rss2.Description _ -> failwith "cwn_page"



let () =
  let contents = ref false in
  let date = ref false in
  let specs = [
      ("--contents", Arg.Set contents,
       " output the contents of the latest CWN");
      ("--date", Arg.Set date, " output the date of the lastest CWN");
    ] in
  let usage = "weekly_news <option>" in
  Arg.parse (Arg.align specs) (fun _ -> raise(Arg.Bad "no anomynous argument"))
    usage;
  if !contents then
    let out = new Netchannels.output_channel stdout in
    Nethtml.write out (cwn_html_page());
    out#close_out()
  else if !date then
    let out = new Netchannels.output_channel stdout in
    Nethtml.write out (cwn_html_date());
    out#close_out()
  else (
    Arg.usage specs usage;
    exit 1
  )






(* Local Variables: *)
(* compile-command: "make -k --no-print-directory -C .. -f Makefile.common script/weekly_news" *)
(* End: *)
