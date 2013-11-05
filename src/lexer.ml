(** A Lexer for OCaml, capable of source to source *)
(* (c) 2013 Philippe Wang <philippe.wang@gmail.com> *)

type location = {
  sl : int; (* start line   *)
  sc : int; (* start column *)
  el : int; (* end   line   *)
  ec : int; (* end   column *)
}

let error loc m =
  Printf.printf "Characters %d:%d - %d:%d :\nError: %s\n"
    loc.sl loc.sc loc.el loc.ec m;
  exit 1

type t = {
    loc  : location;
    kind : kind;
  }
and kind =
  | Number   of number  * string
  | String   of string  * string
  | Char     of char    * string
  | Keyword  of keyword * string
  | Keyop    of keyop   * string
  | Upper    of string
  | Lower    of string
  | Infix    of string
  | Prefix   of string
  | Operator of string
  | Comment  of string
  | Spaces   of string

and number = Int of int | Float of float

and keyword =
  | And        | As       | Assert  | Begin    | Class       | Constraint
  | Do         | Done     | Downto  | Else     | End         | Exception
  | External   | False    | For     | Fun      | Function    | Functor
  | If         | In       | Include | Inherit  | Initializer | Lazy
  | Let        | Match    | Method  | Mod      | Module      | Mutable
  | New        | Object   | Of      | Open     | Private     | Rec
  | Sig        | Struct   | Then    | To       | True        | Try
  | Type       | Val      | Virtual | When     | While       | With
  | Parser

and keyop =
  | EpEq       | Sharp     | Amp        | AmpAmp    | Quote      | OpenP
  | CloseP     | Star      | Plus       | Coma      | Hyphen     | HyphenDot
  | HyphenGt   | Dot       | DotDot     | Colon     | ColonColon | ColonEq
  | ColonGt    | SemiColon | SemiColonSemiColon     | Lt         | LtHyphen
  | Eq         | Gt        | GtCloseSB  | GtCloseCB | Ip         | IpIp
  | OpenSB     | OpenSBLt  | OpenSBGt   | OpenSBVertLine         | CloseSB
  | Underscore | BackQuote | OpenCB     | OpenCBLt  | VertLine   | VertLineCloseSB
  | CloseCB    | Tild      | Lor        | Lsl       | Lsr        | Asr
  | Or         | Lxor      | Land

let keyops =
  [
    "!="   , EpEq               ;  "#"  , Sharp              ;
    "&"    , Amp                ;  "&&" , AmpAmp             ;
    "'"    , Quote              ;  "("  , OpenP              ;
    ")"    , CloseP             ;  "*"  , Star               ;
    "+"    , Plus               ;  ","  , Coma               ;
    "-"    , Hyphen             ;  "-." , HyphenDot          ;
    "->"   , HyphenGt           ;  "."  , Dot                ;
    ".."   , DotDot             ;  ":"  , Colon              ;
    "::"   , ColonColon         ;  ":=" , ColonEq            ;
    ":>"   , ColonGt            ;  ";"  , SemiColon          ;
    ";;"   , SemiColonSemiColon ;  "<"  , Lt                 ;
    "<-"   , LtHyphen           ;  "="  , Eq                 ;
    ">"    , Gt                 ;  ">]" , GtCloseSB          ;
    ">}"   , GtCloseCB          ;  "?"  , Ip                 ;
    "??"   , IpIp               ;  "["  , OpenSB             ;
    "[<"   , OpenSBLt           ;  "[>" , OpenSBGt           ;
    "[|"   , OpenSBVertLine     ;  "]"  , CloseSB            ;
    "_"    , Underscore         ;  "`"  , BackQuote          ;
    "{"    , OpenCB             ;  "{<" , OpenCBLt           ;
    "|"    , VertLine           ;  "|]" , VertLineCloseSB    ;
    "}"    , CloseCB            ;  "~"  , Tild               ;
    "land" , Land               ; "lor" , Lor                ;
    "lsl"  , Lsl                ; "lsr" , Lsr                ;
    "lxor" , Lxor               ; "asr" , Asr                ;
    "or"   , Or                 ;
  ]

let keywords =
  [ "and"       , And        ; "as"           , As             ;
    "assert"    , Assert     ; "lazy"         , Lazy           ;
    "begin"     , Begin      ; "class"        , Class          ;
    "constraint", Constraint ; "do"           , Do             ;
    "done"      , Done       ; "downto"       , Downto         ;
    "else"      , Else       ; "end"          , End            ;
    "exception" , Exception  ; "external"     , External       ;
    "false"     , False      ; "for"          , For            ;
    "fun"       , Fun        ; "function"     , Function       ;
    "functor"   , Functor    ; "if"           , If             ;
    "in"        , In         ; "include"      , Include        ;
    "inherit"   , Inherit    ; "initializer"  , Initializer    ;
    "let"       , Let        ; "match"        , Match          ;
    "method"    , Method     ; "mod"          , Mod            ;
    "module"    , Module     ; "mutable"      , Mutable        ;
    "new"       , New        ; "object"       , Object         ;
    "of"        , Of         ; "open"         , Open           ;
    "private"   , Private    ; "rec"          , Rec            ;
    "sig"       , Sig        ; "struct"       , Struct         ;
    "then"      , Then       ; "to"           , To             ;
    "true"      , True       ; "try"          , Try            ;
    "type"      , Type       ; "val"          , Val            ;
    "virtual"   , Virtual    ; "when"         , When           ;
    "while"     , While      ; "with"         , With           ;
    "parser"    , Parser
  ]

(** (side-effect-style) stream to which we may put back *)
type stream = <
  line   : int;
  column : int;
  get_c   : char option;
  put_c   : char -> unit;
>

(** stream_of_inchannel from a value of type [Pervasives.in_channel] *)
let stream_of_inchannel inchan : stream =
  object
    val mutable buffer = []
    val mutable line   = 1
    val mutable column = 1
    method line = line
    method column = column
    method get_c =
      match buffer with
      | [] ->
        (try match input_char inchan with
         | '\n' as c ->
           line <- line + 1;
           column <- 0; Some c
         | c -> column <- column + 1; Some c
         with End_of_file -> None)
      | c::tl ->
        match c with
        | '\n' -> line <- line+1; column <- 0; buffer <- tl; Some c
        | _ -> column <- column + 1; buffer <- tl; Some c
    method put_c c =
      match buffer with
      | [] ->
        (match c with '\n' ->  line <- line - 1
                    | _ -> column <- column - 1);
        buffer <- [c]
      | l -> buffer <- c::l
  end

(** stream_of_string from a value of type [Pervasives.in_channel] *)
let stream_of_string s : stream =
  object
    val mutable buffer = []
    val mutable line   = 1
    val mutable column = 1
    val mutable index = -1
    val length = String.length s
    method line = line
    method column = column
    method get_c =
      match buffer with
      | [] ->
        index<-index+1;
        if index < length then
          match s.[index] with
          | '\n' as c ->
            line <- line + 1;
            column <- 0; Some c
          | c -> column <- column + 1; Some c
        else
          None
      | c::tl ->
        match c with
        | '\n' -> line <- line + 1; column <- 0; buffer <- tl; Some c
        | _ -> column <- column + 1; buffer <- tl; Some c
    method put_c c =
      if index >= 0 && index <= String.length s && c = s.[index] && buffer = [] then
        index <- index - 1
      else
        match buffer with
        | [] ->
          (match c with
           | '\n' -> line <- line - 1
           | _ -> column <- column - 1);
          buffer <- [c]
        | l -> buffer <- c::l
  end

exception Lexical_error of location

let read_number (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let res = Buffer.create 42 in
  let float = ref false in
  let int = ref false in
  let dot = ref false in
  let rec f () =
    match stream#get_c with
    | Some '0' ->
      (match stream#get_c with
       | None -> Buffer.add_char res '0'
       | Some ('O' | 'o' | 'x' | 'X' | 'b' | 'B' as c) ->
         if Buffer.length res = 0 || !float || !int then
           error
	     {loc with el = stream#line; ec = stream#column}
	     "Lexical error: you gave a weird number"
         else int := true;
         Buffer.add_char res '0';
         Buffer.add_char res c;
         f()
       | Some('0' .. '9' as c) ->
         Buffer.add_char res '0';
         Buffer.add_char res c;
         f()
       | Some(c) -> stream#put_c c; Buffer.add_char res '0')
    | Some('1' .. '9' as c) ->
      Buffer.add_char res c;
      f ()
    | Some('E' | 'e' as e) ->
      if Buffer.length res = 0 || !float || !int then
        stream#put_c e
      else
        (float := true;
         match stream#get_c with
         | None -> stream#put_c e
         | Some('0' .. '9' as c) -> 
           Buffer.add_char res e;
           Buffer.add_char res c;
           f()
         | Some(c) -> stream#put_c c; stream#put_c e)
    | Some('.' as c) ->
      if Buffer.length res = 0 || !float || !int then
	error
	  {loc with el = stream#line; ec = stream#column}
	  "Lexical error: you gave a weird number"
      else
        dot := true;
      Buffer.add_char res c;
      f()
    | Some('_') -> Buffer.add_char res '_'; f ()
    | Some(c) -> stream#put_c c
    | None -> ()
  in
  let r = f (); Buffer.contents res in
  let n =
    if !float || !dot
    then
      Float
        (try float_of_string r
         with _ ->
           error loc "Lexical error while trying to read a float")
    else
      Int
        (try int_of_string r
         with _ ->
           Printf.printf "2(%d:%d) <%s>\n"
             stream#line
             stream#column r;
           error loc "Lexical error while trying to read an integer")
  in
  { kind = Number (n, r); loc = {loc with el = stream#line; ec = stream#column} }


let read_upper (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let res = Buffer.create 42 in
  let rec f () =
    match stream#get_c with
    | Some('A' .. 'Z' as c) -> Buffer.add_char res c; f ()
    | Some('a' .. 'z' | '0' .. '9' | '_' | '\'' as c) ->
      if Buffer.length res = 0 then failwith "bad use of lexer (read_upper)";
      Buffer.add_char res c;
      f ()
    | Some(c) -> stream#put_c c
    | None -> ()
  in
  let res = f(); Buffer.contents res in
  { kind = Upper res; loc = {loc with el = stream#line; ec = stream#column} }

let read_lower (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let string_of_char c = String.make 1 c in
  let rec f res =
    match stream#get_c with
    | Some('a' .. 'z' | '_' as c) -> f (res ^ (string_of_char c))
    | Some('A' .. 'Z' | '0' .. '9' | '\'' as c) ->
      if res = "" then failwith "bad use of lexer (read_lower)";
      f (res ^ (string_of_char c))
    | Some(c) -> stream#put_c c; res
    | None -> res
  in
  let res = f "" in
  try { kind = Keyword (List.assoc res keywords, res);
        loc = {loc with el = stream#line; ec = stream#column}}
  with Not_found ->
    try { kind = Keyop (List.assoc res keyops, res);
          loc = {loc with el = stream#line; ec = stream#column}}
    with Not_found ->
      { kind = Lower res;
        loc = {loc with el = stream#line; ec = stream#column}}

let read_infix (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let string_of_char c = String.make 1 c in
  let rec f res =
    match stream#get_c with
    | Some('!' | '?' | '~' as c) ->
      if res = "" then failwith "bad use of lexer (read_infix)";
      f (res ^ (string_of_char c))
    | Some('$' | '%' | '&' | '*' | '+' | '-' | '.' | '/' | ':' | '<' | '=' | '>'
          | '@' | '^' | '|' as c) ->
      f (res ^ (string_of_char c))
    | Some(c) -> stream#put_c c; res
    | None -> res
  in
  let res = f "" in
  try { kind = Keyop (List.assoc res keyops, res);
        loc = {loc with el = stream#line; ec = stream#column}}
  with Not_found ->
    { kind = Infix res; loc = {loc with el = stream#line; ec = stream#column}}

let read_prefix (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let string_of_char c = let s = " " in s.[0] <- c; s  in
  let rec f res =
    match stream#get_c with
    | Some('!' | '?' | '~' as c) ->
      f (res ^ (string_of_char c))
    | Some('$' | '%' | '&' | '*' | '+' | '-' | '.' | '/' | ':' | '<' | '=' | '>'
          | '@' | '^' | '|' as c) ->
      if res = "" then failwith "bad use of lexer (read_prefix)";
      f (res ^ (string_of_char c))
    | Some(c) -> stream#put_c c; res
    | None -> res
  in
  let res = f "" in
  try { kind = Keyop (List.assoc res keyops, res);
        loc = {loc with el = stream#line; ec = stream#column}}
  with Not_found ->
    { kind = Prefix res;
      loc = {loc with el = stream#line; ec = stream#column}}

let read_char (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let buffer = Buffer.create 10 in
  let rec int i =
    match stream#get_c with
    | Some c ->
      begin match c with
        | '0' as c -> Buffer.add_char buffer c; int (i*10)
        | '1' as c -> Buffer.add_char buffer c; int (i*10 + 1)
        | '2' as c -> Buffer.add_char buffer c; int (i*10 + 2)
        | '3' as c -> Buffer.add_char buffer c; int (i*10 + 3)
        | '4' as c -> Buffer.add_char buffer c; int (i*10 + 4)
        | '5' as c -> Buffer.add_char buffer c; int (i*10 + 5)
        | '6' as c -> Buffer.add_char buffer c; int (i*10 + 6)
        | '7' as c -> Buffer.add_char buffer c; int (i*10 + 7)
        | '8' as c -> Buffer.add_char buffer c; int (i*10 + 8)
        | '9' as c -> Buffer.add_char buffer c; int (i*10 + 9)
        | '\'' ->
          if i > 255 then
            error
	      { loc with el = stream#line; ec = stream#column }
              "Lexical error while trying to read a char"
          else
            { kind = Char (char_of_int i, "'"^Buffer.contents buffer^"'");
              loc  = {loc with el = stream#line; ec = stream#column}}
        | _ ->
          error
	    { loc with el = stream#line; ec = stream#column }
            "Lexical error while trying to read a char"
      end
    | None ->
      error
	{ loc with el = stream#line; ec = stream#column }
        "Lexical error while trying to read a char"      
  in
  let rec hex i =
    match stream#get_c with
    | Some c ->
      begin match c with
        | '0' as c -> Buffer.add_char buffer c; hex (i*16)
        | '1' as c -> Buffer.add_char buffer c; hex (i*16 + 1)
        | '2' as c -> Buffer.add_char buffer c; hex (i*16 + 2)
        | '3' as c -> Buffer.add_char buffer c; hex (i*16 + 3)
        | '4' as c -> Buffer.add_char buffer c; hex (i*16 + 4)
        | '5' as c -> Buffer.add_char buffer c; hex (i*16 + 5)
        | '6' as c -> Buffer.add_char buffer c; hex (i*16 + 6)
        | '7' as c -> Buffer.add_char buffer c; hex (i*16 + 7)
        | '8' as c -> Buffer.add_char buffer c; hex (i*16 + 8)
        | '9' as c -> Buffer.add_char buffer c; hex (i*16 + 9)
        | 'A' | 'a' as c -> Buffer.add_char buffer c; hex (i*16 + 10)
        | 'B' | 'b' as c -> Buffer.add_char buffer c; hex (i*16 + 11)
        | 'C' | 'c' as c -> Buffer.add_char buffer c; hex (i*16 + 12)
        | 'D' | 'd' as c -> Buffer.add_char buffer c; hex (i*16 + 13)
        | 'E' | 'e' as c -> Buffer.add_char buffer c; hex (i*16 + 14)
        | 'F' | 'f' as c -> Buffer.add_char buffer c; hex (i*16 + 15)
        | '\'' ->
          if i > 255 then
            error
	      { loc with el = stream#line; ec = stream#column }
              "Lexical error while trying to read a char"
          else
          { kind = Char (char_of_int i, "'"^Buffer.contents buffer^"'");
            loc  = {loc with el = stream#line; ec = stream#column}}
        | _ ->
          error
	    { loc with el = stream#line; ec = stream#column }
            "Lexical error while trying to read a char"
      end
    | None ->
      error
	{ loc with el = stream#line; ec = stream#column }
        "Lexical error while trying to read a char"      
  in
  match stream#get_c with
  | Some('\'') ->
    (match stream#get_c with
     | Some('\\' as c) -> Buffer.add_char buffer c;
       (match stream#get_c with
        | Some('\'' as c) -> Buffer.add_char buffer c;
          if stream#get_c = Some '\'' then
            { kind = Char ('\'', "'\\''");
              loc = {loc with el = stream#line; ec = stream#column}}
          else
            error
	      {loc with el = stream#line; ec = stream#column}
	      "Lexical error: Illegal backslash escape in character"
        | Some('n' as c) -> Buffer.add_char buffer c;
          if stream#get_c = Some '\'' then
            { kind = Char ('\n', "'\\n'");
              loc = {loc with el = stream#line; ec = stream#column}}
          else
            error
	      {loc with el = stream#line; ec = stream#column}
	      "Lexical error: Illegal backslash escape in character"
        | Some('r' as c) -> Buffer.add_char buffer c;
          if stream#get_c = Some '\'' then
            { kind = Char ('\r',"'\\r'");
              loc = {loc with el = stream#line; ec = stream#column}}
          else
            error
	      {loc with el = stream#line; ec = stream#column}
	      "Lexical error: Illegal backslash escape in character"
        | Some('t' as c) -> Buffer.add_char buffer c;
          if stream#get_c = Some '\'' then
            { kind = Char ('\t', "'\\t'");
              loc = {loc with el = stream#line; ec = stream#column}}
          else
            error
	      {loc with el = stream#line; ec = stream#column}
	      "Lexical error: Illegal backslash escape in character"
        | Some('0' .. '9' as c) -> Buffer.add_char buffer c; int 0
        | Some('x'|'X' as c) -> Buffer.add_char buffer c; hex 0
        | Some('\\' as c) -> Buffer.add_char buffer c;
          if stream#get_c = Some '\'' then
            { kind = Char ('\\', "'\\\\'");
              loc = {loc with el = stream#line; ec = stream#column}}
          else
            error
	      {loc with el = stream#line; ec = stream#column}
	      "Lexical error: Illegal backslash escape in character"
        | Some _ | None ->
          error
	    {loc with el = stream#line; ec = stream#column}
	    "Lexical error: Illegal backslash escape in character"
       )
     | Some(c) -> Buffer.add_char buffer c;
       if stream#get_c = Some '\''
       then
         { kind = Char (c, "'"^String.make 1 c^"'");
           loc = {loc with el = stream#line; ec = stream#column}}
       else
         (stream#put_c c;
          { kind = Keyop (Quote, "'");
            loc = {loc with el = stream#line; ec = stream#column}})
     | None -> 
       error
	 {loc with el = stream#line; ec = stream#column}
	 "Lexical error: Illegal backslash escape in character"
    )
  | _ -> assert false

let read_string (stream:stream) =
  let b = Buffer.create 42 in
  let () = Buffer.add_char b '"' in
  let res =
    let loc = { sl = stream#line; sc = stream#column;
                el = stream#line; ec = stream#column; } in
    let string_of_char c = String.make 1 c in
    let rec f res =
      match stream#get_c with
      | Some('"') -> res
      | Some('\\' as c) -> Buffer.add_char b c;
        (match stream#get_c with
         | Some('"' as c) -> Buffer.add_char b c; f (res ^ "\"")
         | Some('n' as c) -> Buffer.add_char b c; f (res ^ "\n")
         | Some('r' as c) -> Buffer.add_char b c; f (res ^ "\r")
         | Some('t' as c) -> Buffer.add_char b c; f (res ^ "\t")
         | Some('\\' as c) -> Buffer.add_char b c; f (res ^ "\\")
         | _   ->
           error
	     {loc with el = stream#line; ec = stream#column}
	     "Lexical error: Illegal backslash escape in string")
      | Some(c) -> Buffer.add_char b c; f (res ^ (string_of_char c))
      | None ->
          error
	    {loc with el = stream#line; ec = stream#column}
	    "Lexical error: Incomplete string"
    in
    match stream#get_c with
    | Some('"') ->
      let r = f "" in
      let () = Buffer.add_char b '"' in
      { kind = String (r, Buffer.contents b);
        loc = {loc with el = stream#line; ec = stream#column}}
    | _ -> assert false
  in res

let read_comment (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let string_of_char c = String.make 1 c in
  let rec f res level =
    match stream#get_c with
    | None ->
      error
	{loc with el = stream#line; ec = stream#column}
	"Lexical error: Incomplete comment"
    | Some('(') ->
      (match stream#get_c with
       | None ->
         error
	   {loc with el = stream#line; ec = stream#column}
	   "Lexical error: Incomplete comment"
       | Some('*') -> f (res ^ "(*") (level+1)
       | Some(c) -> f (res ^ "(" ^(string_of_char c)) level)
    | Some('*') ->
      (match stream#get_c with
       | None ->
          error
	    {loc with el = stream#line; ec = stream#column}
	    "Lexical error: Incomplete comment"
       | Some(')') ->
         if level = 1 then res ^ "*)"
         else f (res ^ "*)") (level-1)
       | Some('*') -> stream#put_c '*'; f (res ^ "*") level
       | Some(c) -> f (res ^ "*" ^(string_of_char c)) level)
    | Some(c) -> f (res ^ (string_of_char c)) level
  in
  { kind = Comment ( f "" 0);
    loc = {loc with el = stream#line; ec = stream#column}}

let read_op (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let string_of_char c = String.make 1 c in
  let rec f res =
    match stream#get_c with
    | Some('!' | '&' | '*' | '+' | '-' | '.' | ':'
          | '<' | '=' | '>' | '?'
          | '[' | ']' | '`' | '{' | '|' | '}'
          | '~' as c) -> f (res ^ (string_of_char c))
    | Some('(') -> if res = "" then "(" else (stream#put_c '('; res)
    | Some(')') -> if res = "" then ")" else (stream#put_c ')'; res)
    | Some('#') -> if res = "" then "#" else (stream#put_c '#'; res)
    | Some('_') -> if res = "" then "_" else
	error
	  {loc with el = stream#line; ec = stream#column}
	  "Lexical error while reading an operator"
    | Some(',') -> if res = "" then "," else  (stream#put_c ','; res)
    | Some(';') ->
      if res = "" then
        (match stream#get_c with
         | None -> ";"
         | Some(';') -> ";;"
         | Some(c) -> stream#put_c c; ";")
      else (stream#put_c ';'; res)
    | Some(c) -> stream#put_c c; res
    | None -> assert(res<>""); res
  in
  let res = f "" in
  try { kind = Keyop (List.assoc res keyops, res);
        loc = {loc with el = stream#line; ec = stream#column}}
  with Not_found ->
    { kind = Operator res;
      loc = {loc with el = stream#line; ec = stream#column}}

let read_spaces (stream:stream) =
  let loc = { sl = stream#line; sc = stream#column;
              el = stream#line; ec = stream#column; } in
  let res = Buffer.create 42 in
  let rec f () =
    match stream#get_c with
    | Some(' ' | '\t' | '\n' | '\r' as c) -> Buffer.add_char res c; f ()
    | Some(c) -> stream#put_c c; Spaces (Buffer.contents res)
    | None -> Spaces (Buffer.contents res)
  in
  let k = f() in
  { kind = k;
    loc = {loc with el = stream#line; ec = stream#column} }

let read (stream:stream) =
  let rec f res =
    let loc = { sl = stream#line; sc = stream#column;
                el = stream#line; ec = stream#column; } in
    match stream#get_c with
    | Some('0' .. '9' as c) -> stream#put_c c; f ((read_number stream)::res)
    | Some('A' .. 'Z' as c) -> stream#put_c c; f ((read_upper  stream)::res)
    | Some('a' .. 'z' | '_' as c) -> stream#put_c c; f ((read_lower  stream)::res)
    | Some(' ' | '\t' | '\n' | '\r' as c) -> stream#put_c c; f ((read_spaces stream)::res)
    | Some('!' | '?'  | '~' as c) ->
      stream#put_c c; f ((read_prefix stream)::res)
    | Some('=' | '<' | '>' | '@' | '^' | '|' | '&' | '+' | '-' | '*' | '/'
          | '$' | '%' as c) ->
      stream#put_c c; f ((read_infix stream)::res)
    | Some('(') ->
      (match stream#get_c with
       | None ->
         error
	   {loc with el = stream#line; ec = stream#column}
           "Lexical error: Unclosed parenthesis"
       | Some('*') ->
	 stream#put_c '*'; stream#put_c '(';
	 f ((read_comment stream)::res)
       | Some c ->
	 stream#put_c c; stream#put_c '(';
         f ((read_op stream)::res))
    | Some('\'' as c) ->
      stream#put_c c; f ((read_char stream)::res)
    | Some('"' as c) ->
      stream#put_c c; f ((read_string stream)::res)
    | Some('\\') ->
      error
	{ sl = stream#line; sc = stream#column - 1;
	  el = stream#line; ec = stream#column}
	"Lexical error: unexpected presence of a backslash"
    | Some('{'|'}'|')'|'['|']'|'#'|','|'.'|':'|';'|'`' as c) ->
      stream#put_c c;
      f ((read_op stream)::res)
    | Some(c) ->
      error
	{ sl = stream#line; sc = stream#column - 1;
          el = stream#line; ec = stream#column}
        (Printf.sprintf "Lexical error: don't know what to do with character %C" c)
    | None -> List.rev res
  in f []

let revert_assoc e l =
  let rec loop = function
    | (x, k)::tl -> if k = e then x else loop tl
    | [] -> raise Not_found
  in loop l

let string_of_keyop k =
  revert_assoc k keyops

let string_of_keyword k =
  revert_assoc k keywords

let to_string t =
  let b = Buffer.create 42 in
  begin
    match t.kind with
    | Keyword (_, s)
    | Keyop (_, s)
    | String (_, s)
    | Char (_, s)
    | Number (_, s)
    | Upper s
    | Lower s
    | Infix s
    | Prefix s
    | Operator s
    | Comment s
    | Spaces s -> Buffer.add_string b s
  end;
  Buffer.contents b

let string_of_tl l =
  let b = Buffer.create 42 in
  List.iter (fun t -> Buffer.add_string b (to_string t)) l;
  Buffer.contents b


(*
let _ =
  print_string (string_of_tl (read (stream_of_inchannel stdin)))
*)

(* 
let _ =
 (read (stream_of_inchannel (open_in "lexer.ml")))

let _ =
 (read (stream_of_inchannel (open_in "test.ml")))

let _ =
 (read (stream_of_string "\"plop\""))
*)
