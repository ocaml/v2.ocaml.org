(* Small utility to extract the language of the filename. *)

open Printf
open Utils

let language_of_ISO639 = function
  | "en" -> "English"
  | "de" -> "German"
  | "el" -> "Greek"
  | "fr" -> "French"
  | "it" -> "Italian"
  | "ja" -> "Japanese"
  | "ko" -> "Korean"
  | "zh" -> "Chinese"
  | l -> failwith(sprintf "Add the full language name for %S" l)

let () =
  let filenames = ref [] in
  let long = ref false in
  let specs = [
    "--long", Arg.Set long,
    " Return the full language name instead of ISO 639-1";
  ] in
  Arg.parse specs (fun f -> filenames := f :: !filenames)
            "script/lang_of_filename [options] <filenames>";
  let langs = List.map Utils.lang_of_filename !filenames in
  (* Always compute full language names to avoid surprises of the
     build failing when "staging" is enabled (the only place where the
     full language is used so far). *)
  let languages = List.map language_of_ISO639 langs in

  print_string (String.concat ", " (if !long then languages else langs))


(* Local Variables: *)
(* compile-command: "make --no-print-directory -k -C .. script/lang_of_filename" *)
(* End: *)
