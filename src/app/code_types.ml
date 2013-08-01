(* Types shared between the custom toplevel and the HTML rendering
   together with the marshalling functions. *)
open Printf
open Scanf

type outcome =
  | Normal of string * string * string (* exec output, stdout, stderr *)
  | Error of string

let send_outcome ch = function
  | Normal(ex, out, err) -> fprintf ch "N %S %S %S\n%!" ex out err
  | Error e -> fprintf ch "E %S\n%!" e

let get_outcome ch : outcome =
  let l = input_line ch in
  try sscanf l "N %S %S %S" (fun ex out err -> Normal(ex, out, err))
  with Scan_failure _ -> sscanf l "E %S" (fun err -> Error(err))
