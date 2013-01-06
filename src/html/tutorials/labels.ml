let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)

let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)

let rec odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)

let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)


let begin_page cgi title =
  let out = cgi # output # output_string in
  out "<html>\n";
  out "<head>\n";
  out ("<title>" ^ text title ^ "</title>\n");
  out ("<style type=\"text/css\">\n");
  out "body { background: white; color: black; }\n";
  out "</style>\n";
  out "</head>\n";
  out "<body>\n";
  out ("<h1>" ^ text title ^ "</h1>\n")

out "<html>\n";

cgi # output # output_string "<html>\n";

let print_string = output_string stdout
