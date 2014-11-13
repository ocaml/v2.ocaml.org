<!-- ((! set title Ocamlbuild log output !)) ((! set learn !)) -->

# Ocamlbuild "Hello, world!" or how to output to the log file
## Hello, world!
Put the following in the file myocamlbuild.ml in the root of your
project tree:

` (* Ocamlbuild plugin *)`<br />` open Ocamlbuild_pack`<br />` open Ocamlbuild_plugin`<br />` let _ =`<br />`   dispatch & function`<br />`   | After_options -> Log.dprintf 0 "Hello, world!"`<br />`   | _ -> ()`

Invoke ocamlbuild. In _build/_log, you can see:

` ### Starting build.`<br />` Hello, world!`<br />` # Compilation successful.`

The integer argument to Log.dprinf is the minimum level at which the
message will be logged. The ampersand \(&amp;\) is commonly defined in Ocaml
programs by

` let ( & ) f x = f x`

and serves as a low-precedence operator for reducing the number of
parentheses required.

