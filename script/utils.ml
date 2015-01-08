
let is_lowercase c = 'a' <= c && c <= 'z'

(** Split a filename according to the conventions of the site
    regarding the language. *)
let prefix_lang_ext_of_filename fn =
  try
    let i0 = String.rindex fn '.' in
    let ext = String.sub fn (i0 + 1) (String.length fn - i0 - 1) in
    try
      let i1 = String.rindex_from fn (i0 - 1) '.' in
      (* Make sure the lang is made of 2 letters *)
      if 2 <> i0 - i1 - 1 (* = lang length *)
         || not(is_lowercase fn.[i1 + 1] && is_lowercase fn.[i1 + 2]) then
        raise Not_found; (* no language *)
      String.sub fn 0 i1, String.sub fn (i1 + 1) 2, ext
    with Not_found ->
      String.sub fn 0 i0,  "", ext
  with Not_found ->
    fn, "", ""


(** Return the ISO 639-1 language code of the filename. *)
let lang_of_filename fn =
  let _, lang, _ = prefix_lang_ext_of_filename (Filename.basename fn) in
  if lang = "" then "en" else lang


let relaxed_html40_dtd =
  (* Allow <font> inside <pre> because blogspot uses it! :-( *)
  let constr = `Sub_exclusions([ "img"; "object"; "applet"; "big"; "small";
                                 "sub"; "sup"; "basefont"],
                               `Inline) in
  let dtd = Nethtml.relaxed_html40_dtd in
  ("pre", (`Block, constr)) :: List.remove_assoc "pre" dtd


let string_of_file fname =
  let buf = Buffer.create 4096 in
  let fh = open_in fname in
  let s = String.create 1024 in
  let n = ref 1 in (* enter the loop *)
  while !n > 0 do
    n := input fh s 0 1024;
    if !n > 0 then Buffer.add_substring buf s 0 !n;
  done;
  close_in fh;
  Buffer.contents buf

let lines_of_file fname =
  let lines = ref [] in
  let fh = open_in fname in
  try
    while true do
      lines := input_line fh :: !lines
    done;
    assert false
  with End_of_file ->
    close_in fh;
    List.rev !lines

let rec filter_map l f =
  match l with
  | [] -> []
  | a :: tl -> match f a with
              | None -> filter_map tl f
              | Some a -> a :: filter_map tl f

(* Knuth-Morris-Pratt algorithm
 ***********************************************************************)

module KMP =
struct
  (* Preprocess the pattern *)
  let preprocess pat len =
    let b = Array.make (len + 1) (-1) in
    (* [b.(i)] = width of the widest border of [pat.[0 .. i-1]]. *)
    let j = ref(-1) in
    for i = 0 to len - 1 do
      while !j >= 0 && pat.[!j] <> pat.[i] do
        j := b.(!j)
      done;
      incr j;
      b.(i+1) <- !j
    done;
    b


  exception Found of int

  (** [search pat] define a search function [f] such that [f s i0
      i1] search the string [pat] in [s.[i0 .. i1-1]] and return the
      position of the first match.

      @raise Not_found if [pat] is not found.
      @raise Invalid_argument if [i0 < 0] or [i1 > String.length s].  *)
  let search pat =
    let m = String.length pat in
    let b = preprocess pat m in
    fun s i0 i1 -> (
      if i0 < 0 || i1 > String.length s then
        invalid_arg "Netcgi_common.KMP.search";
      let i = ref i0
      and j = ref 0 in
      try
        while !i < i1 do
          while !j >= 0 && s.[!i] <> pat.[!j] do
            j := b.(!j)
          done;
          incr i;
          incr j;
          if !j = m then raise(Found(!i - !j))
        done;
        raise Not_found
      with Found i -> i
    )

  let is_substring ~pat s =
    try ignore(search pat s 0 (String.length s)); true
    with Not_found -> false

  (** [search_case_fold] is the same as [search] except that the
      search is case insensitive.  *)
  let search_case_fold pat =
    let m = String.length pat in
    let pat = String.lowercase pat in
    let b = preprocess pat m in
    fun s i0 i1 -> (
      if i0 < 0 || i1 > String.length s then
        invalid_arg "Netcgi_common.KMP.search";
      let i = ref i0
      and j = ref 0 in
      try
        while !i < i1 do
          while !j >= 0 && Char.lowercase(s.[!i]) <> pat.[!j] do
            j := b.(!j)
          done;
          incr i;
          incr j;
          if !j = m then raise(Found(!i - !j))
        done;
        raise Not_found
      with Found i -> i
    )
end
