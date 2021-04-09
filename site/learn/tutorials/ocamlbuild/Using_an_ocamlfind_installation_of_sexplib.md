<!-- ((! set title Using an ocamlfind installation of sexplib !)) ((! set learn !)) -->

# Using an ocamlfind installation of sexplib
Install type-conv and sexplib.

Define the following in your plugin :

```ocaml
let ocamlfind_query pkg =
  let cmd = Printf.sprintf "ocamlfind query %s" (Filename.quote pkg) in
  My_unix.run_and_open cmd (fun ic ->
      Log.dprintf 5 "Getting Ocaml directory from command %s" cmd;
      input_line ic
    )
```

Then, in `After_rules`:

```ocaml
let sexplib_dir = ocamlfind_query "sexplib" in
  let type_conv_dir = ocamlfind_query "type-conv" in
  ocaml_lib ~extern:true ~dir:sexplib_dir "sexplib";
  flag ["ocaml"; "pp"; "use_sexplib.syntax"]
  & S[A"-I"; A type_conv_dir; A"-I"; A sexplib_dir;
      A"pa_type_conv.cmo"; A"pa_sexp_conv.cmo"]
```

Ensure that each `.ml` file that will use the sexplib syntax (`type foo =
... with sexp`) is tagged with `camlp4o` and `use_sexplib.syntax`, as in:

```
<**/*.ml>: camlp4o, use_sexplib.syntax
```

Do not forget to add

```ocaml
open Sexplib
open Sexp
TYPE_CONV_PATH "Foo"
```

to your modules.

