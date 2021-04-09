(* file: meetings.ml
   author: Philippe Wang <philippe.wang@gmail.com>
   licence: ISC
   date: 2014
   about: This small program was designed for the ocaml.org website.
   depends on glical 0.0.3 (later versions might work)
   glical: https://github.com/pw374/glical
*)

let debug = false

open Printf
open Glical
open Ical


let print_announcement out long_title href short_title date =
  fprintf out
    "
<li>
 <article>
  <h1><a title='%s' href='%s'>%s</a></h1>
  <p>%s</p>
  <a title='%s'href='%s'><img alt='' src='/img/announcement.png' /></a>
 </article>
</li>"
    long_title
    href
    short_title
    date
    long_title
    href

let print_news out long_title href short_title date =
  fprintf out
    "
<li>
 <article>
  <h1><a title='%s' href='%s'>%s</a></h1>
  <p>%s</p>
  <a title='%s' href='%s'><img alt='News' src='/img/news.png' /></a>
 </article>
</li>"
    long_title
    href
    short_title
    date
    long_title
    href


let ( |> ) x f = f x

let rec extract_vevents ical =
  List.fold_left
    (fun accu -> function
       | Block (loc, "VEVENT", b) as e
         when
           (try
              ignore
                (List.find
                   (function
                     | Assoc(_, ("DTSTAMP"|"DTSTART"), _, _) -> true
                     | _ -> false)
                   b);
              true
            with Not_found -> false)
         -> e::accu
       | Block (_, _, b) -> extract_vevents b @ accu
       | _ -> accu)
    []
    ical


let sort_by_date ical =
  let compare a b = match a, b with
    | Assoc(_, _, _, v1), Assoc(_, _, _, v2) ->
      begin match v1#value, v2#value with
        | `Datetime d1, `Datetime d2 ->
          Pervasives.compare d1 d2
        | _, `Datetime _ -> 1
        | `Datetime _, _ -> -1
        | _ -> compare a b
      end
    | _ -> compare a b
  in
  let module S =
    Set.Make(
    struct
      type t =
        [`Text of string list
        | `Raw of string
        | `Datetime of Datetime.t
        ] Ical.element
      let compare = compare
    end)
  in
  let ls ical =
    List.fold_left (fun accu e -> S.add e accu) S.empty ical
    |> S.elements
  in
  let rec sort = function
  | Block(loc, s, v)::tl ->
    ls (Block(loc, s, sort v)::(sort tl))
  | (Assoc(loc, s, p, r) as e)::tl ->
    ls (e::sort tl)
  | [] -> []
  in sort ical

let eprint_size ical =
  if debug then eprintf "ical size: %d\n%!" (List.length ical);
  ical

let ical :
  [`Datetime of Glical.Datetime.t
  | `Raw of string
  | `Text of string list ] Ical.t
  =
  channel_contents stdin
  |> lex_ical
  |> parse_ical |> eprint_size
  |> extract_vevents |> eprint_size
  |> Datetime.parse_datetime |> eprint_size
  |> sort_by_date |> eprint_size




let htmlentities s =
  let b = Buffer.create (String.length s * 2) in
  let rec loop i =
    if i = String.length s then
      ()
    else
      let () =
      match s.[i] with
        | ( '0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' ) as c -> Buffer.add_char b c
        | '"' -> Buffer.add_string b "&quot;"
        | '\'' -> Buffer.add_string b "&#39;"
        | '&' ->  Buffer.add_string b "&amp;"
        | '<' -> Buffer.add_string b "&lt;"
        | '>' -> Buffer.add_string b "&gt;"
        | c -> Buffer.add_char b c
      in loop (succ i)
  in
  loop 0;
  Buffer.contents b


let () =
  List.iter
    (function
      | Block(_, _, e) ->
        let summary =
          try
            match
              List.find
                (function
                  | Assoc(_, "SUMMARY", _, x) -> true
                  | _ -> false)
                e
            with
            | Assoc(_, _, _, x) ->
              String.concat " " (text_of_raw x#location x#to_string)
              |> htmlentities
            | _ -> failwith "SUMMARY"
          with Not_found -> "summary missing"
        in
        let description =
          try
            match
              List.find
                (function
                  | Assoc(_, "DESCRIPTION", _, x) -> true
                  | _ -> false)
                e
            with
            | Assoc(_, _, _, x) ->
              String.concat " " (text_of_raw x#location x#to_string)
              |> htmlentities
            | _ -> failwith "DESCRIPTION"
          with Not_found -> "description missing"
        in
        let url =
          try
            match
              List.find
                (function
                  | Assoc(_, "URL", _, x) -> true
                  | _ -> false)
                e
            with
            | Assoc(_, _, _, x) ->
              String.concat " " (text_of_raw x#location x#to_string)
              |> htmlentities
            | _ -> failwith "URL"
          with Not_found -> "url missing"
        in
        let dtstamp =
          try
            match
              List.find
                (function
                  | Assoc(_, ("DTSTAMP"|"DTSTART"), _, x) -> true
                  | _ -> false)
                e
            with
            | Assoc(_, _, _, dt) ->
              begin let open Datetime in
                match dt#value with
                | `Datetime dt ->
                  sprintf "%s %d, %d"
                    (match dt.month with
                     | 1 -> "January"
                     | 2 -> "February"
                     | 3 -> "March"
                     | 4 -> "April"
                     | 5 -> "May"
                     | 6 -> "June"
                     | 7 -> "July"
                     | 8 -> "August"
                     | 9 -> "September"
                     | 10 -> "October"
                     | 11 -> "November"
                     | 12 -> "December"
                     | _ -> assert false
                    )
                    dt.day
                    dt.year
                | _ -> failwith "DTSTAMP|DTSTART"
              end
            | _ -> failwith "DTSTAMP|DTSTART"
          with Not_found -> "date (DTSTAMP|DTSTART) missing"
        in
        print_news
          stdout
          description
          url
          summary
          dtstamp
      | _ -> ()
    )
    ical
