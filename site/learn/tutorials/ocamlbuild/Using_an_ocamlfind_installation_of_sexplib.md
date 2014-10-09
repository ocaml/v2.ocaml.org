# Using an ocamlfind installation of sexplib
Install type-conv and sexplib according to the instructions given at
[ocaml.info](http://www.ocaml.info/home/ocaml_sources.html) using
ocamlfind.

Define the following in your plugin :

` let ocamlfind_query pkg =`<br />`   let cmd = Printf.sprintf "ocamlfind query %s" (Filename.quote pkg) in`<br />`   My_unix.run_and_open cmd (fun ic ->`<br />`     Log.dprintf 5 "Getting Ocaml directory from command %s" cmd;`<br />`     input_line ic)`

Then, in After_rules:

` let sexplib_dir = ocamlfind_query "sexplib" in`<br />` let type_conv_dir = ocamlfind_query "type-conv" in`<br />` ocaml_lib ~extern:true ~dir:sexplib_dir "sexplib";`<br />` flag ["ocaml"; "pp"; "use_sexplib.syntax"] & S[A"-I"; A type_conv_dir; A"-I"; A sexplib_dir; A"pa_type_conv.cmo"; A"pa_sexp_conv.cmo"]`

Ensure that each .ml file that will use the sexplib syntax \(type foo =
... with sexp\) is tagged with camlp4o and use_sexplib.syntax, as in:

` <**/*.ml>: camlp4o, use_sexplib.syntax`

Do not forget to add

` open Sexplib`<br />` open Sexp`<br />` TYPE_CONV_PATH "Foo"`

to your modules.

