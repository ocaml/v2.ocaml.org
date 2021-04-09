
exception Unknown_file_type of string

val map_html_hrefs :
  (string -> string) -> Nethtml.document list -> Nethtml.document list

val map_html_element_hrefs :
  (string -> string) -> Nethtml.document -> Nethtml.document

val map_html_file : (string -> string) -> string -> string -> unit

val map_css_file : (string -> string) -> string -> string -> unit

(** [map_file fn in_file out_file] reads [in_file] for URLs, applies
    [fn] to them as strings, and writes [in_file] with the results in
    place to [out_file]. The whole of [in_file] is read into memory so
    [in_file] and [out_file] can be the same name. Raises
    [Unknown_file_type filename] when no map function exists for the
    given file type. *)
val map_file : (string -> string) -> string -> string -> unit

val remove_common_prefix :
  string list -> string list -> (string list * string list)

val revert_path : string list -> string -> string list
