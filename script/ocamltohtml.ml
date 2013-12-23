open Lexer

let html_escape s =
  let b = Buffer.create 42 in
  for i = 0 to String.length s - 1 do
    match s.[i] with
    | '&' | '<' | '>' | '\'' | '"' as c ->
      Printf.bprintf b "&#%d;" (int_of_char c);
    | c ->
      Buffer.add_char b c
  done;
  Buffer.contents b

let governing_keywords = [
  "external"; "open"; "include"; "sig"; "struct"; "module"; "functor";
  "type"; "virtual"; "constraint"; "class"; "in"; "inherit";
  "initializer"; "let"; "rec"; "object"; "and"; "begin"; "end" ]

let to_html t =
  let open Printf in
  let open Buffer in
  let b = Buffer.create 42 in
  begin
    match t.kind with
    | String (_, s) ->
      bprintf b "<span class='string'>%s</span>" (html_escape s)
    | Char (_, s) ->
      bprintf b "<span class='string'>%s</span>" (html_escape s)
    | Keyword (_, s) ->
       if List.mem s governing_keywords then
         bprintf b "<span class='governing'>%s</span>" (html_escape s)
       else
         bprintf b "<span class='keyword'>%s</span>" (html_escape s)
    | Keyop (_, s) ->
      bprintf b "<span class='keywordsign'>%s</span>" (html_escape s)
    | Number (_, s) ->
      bprintf b "<span class='number'>%s</span>" (html_escape s)
    | Upper s ->
      bprintf b "<span class='constructor module'>%s</span>" (html_escape s)
    | Lower s ->
      bprintf b "<span class='lower'>%s</span>" (html_escape s)
    | Infix s ->
      bprintf b "<span class='keywordsign infix'>%s</span>" (html_escape s)
    | Prefix s ->
      bprintf b "<span class='keywordsign prefix'>%s</span>" (html_escape s)
    | Operator s ->
      bprintf b "<span class='keywordsign operator'>%s</span>" (html_escape s)
    | Comment s ->
      bprintf b "<span class='comment'>%s</span>" (html_escape s)
    | Spaces s -> Buffer.add_string b s
  end;
  Buffer.contents b


let html_of_tl l =
  let b = Buffer.create 42 in
  List.iter (fun t -> Buffer.add_string b (to_html t)) l;
  Buffer.contents b

let _ =
  print_string (html_of_tl (read (stream_of_inchannel stdin)))
