<!-- ((! set title Automatic version generation !)) ((! set learn !)) -->

# Automatic Version Generation
The following plugin produces a file `version.ml` looking like this:

```ocaml
let version = "1.4.2+dev"
let compile_time = "03/01/2010 12:55:22 UTC"
```
The "compile_time" variable is the date when the project was compiled.
More precisely, it is the last time Ocamlbuild was run to build the
project.

The trick is: if the command which produces `version.ml` changes,
Ocamlbuild rebuilds the file. So we write the generation of `version.ml`
as a shell command. The command will naturally change automatically
every second.

Warning: because we use a shell command, this plugin might not work on
all operating systems.

```ocaml
open Ocamlbuild_plugin
open Unix

let version = "1.4.2+dev"

let time =
  let tm = Unix.gmtime (Unix.time ()) in
  Printf.sprintf "%02d/%02d/%04d %02d:%02d:%02d UTC"
    (tm.tm_mon + 1) tm.tm_mday (tm.tm_year + 1900)
    tm.tm_hour tm.tm_min tm.tm_sec

let make_version _ _ =
  let cmd =
    Printf.sprintf "let version = %S\n\
                    let compile_time = %S\n"
                   version time
  in
  Cmd (S [ A "echo"; Quote (Sh cmd); Sh ">"; P "version.ml" ])

let () =
  dispatch begin function
  | After_rules ->
      rule "version.ml" ~prod: "version.ml" make_version
  | _ -> ()
  end
```
