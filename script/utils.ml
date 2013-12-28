
(* Split a filename accoreding to the conventions of the site
   regarding the language. *)
let prefix_lang_ext_of_filename fn =
  try
    let i0 = String.rindex fn '.' in
    let ext = String.sub fn (i0 + 1) (String.length fn - i0 - 1) in
    try
      let i1 = String.rindex_from fn (i0 - 1) '.' in
      String.sub fn 0 i1, String.sub fn (i1 + 1) (i0 - i1 - 1), ext
    with Not_found ->
      String.sub fn 0 i0,  "", ext
  with Not_found ->
    fn, "", ""



let relaxed_html40_dtd =
  (* Allow <font> inside <pre> because blogspot uses it! :-( *)
  let constr = `Sub_exclusions([ "img"; "object"; "applet"; "big"; "small";
                                 "sub"; "sup"; "basefont"],
                               `Inline) in
  let dtd = Nethtml.relaxed_html40_dtd in
  ("pre", (`Block, constr)) :: List.remove_assoc "pre" dtd


module String = struct
  include String

  (* FIXME: Remove when 4.00.0 is spread enough. *)
  let is_space = function
    | ' ' | '\012' | '\n' | '\r' | '\t' -> true
    | _ -> false

  let trim s =
    let len = String.length s in
    let i = ref 0 in
    while !i < len && is_space (String.unsafe_get s !i) do
      incr i
    done;
    let j = ref (len - 1) in
    while !j >= !i && is_space (String.unsafe_get s !j) do
      decr j
    done;
    if !i = 0 && !j = len - 1 then
      s
    else if !j >= !i then
      String.sub s !i (!j - !i + 1)
    else
      ""
end
