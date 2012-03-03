(* @hide stylesheet *)
val stylesheet : t -> ?rel_base:bool -> string -> t
(** [stylesheet tpl url] add the CSS file given by [url] to the
    stylesheet declarations.  If [rel_base] is true (the default),
    interpret [url] as a path relative to the base URL (as set in
    [tpl]). *)

(* @hide javascript *)
val javascript : t -> ?rel_base:bool -> string -> t
(** [javascript tpl url] add the javascript file given by [url] to the
    headers of the page.  If [rel_base] is [true] (the default),
    interpret [url] as a path relative to the base URL (as set in
    [tpl]). *)

(* @hide navigation_bar *)
val navigation : t -> (string * string) list -> t
(** [navigation t nav] set the navigation bar from the information in
    [nav].  The couples of [nav] are of the form [(text, URL)]. *)

val navigation_of_path : t -> ?prefix:(string * string) list ->
  Weberizer.Path.t -> t
(** [navigation_of_path t path] add a navigation bar based on the
    [path]. *)

(* @hide languages *)
val languages : t -> (string * string) list -> t
(** [languages tpl langs] return (a copy of) the template [tpl] with
    the language links set according to [langs].  [langs] is a list
    of [(lang, url)] where [lang] is the name of the language and
    [url] is the (relative or absolute) URL where the page can be
    found ([""] if it is the current page). *)
