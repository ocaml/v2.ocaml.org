(* Copied from the standard OCaml distribution driver/errors.mli to
   enable access to the error reporting. *)

open Format

val report_error: formatter -> exn -> unit
