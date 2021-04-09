<!-- ((! set title A camlp4 plugin !)) ((! set learn !)) -->

# A plugin for camlp4 syntax extension \(pa openin\)
If you just want to use a syntax extension included in an installed
package, see [Using ocamlfind with
ocamlbuild](Using_ocamlfind_with_ocamlbuild.html).

Suppose you have some Camlp4 OCaml syntax extension and that you
want to compile them with Ocamlbuild.

Let start by adding an Ocamlbuild plugin (required to be in a file
named `myocamlbuild.ml` at the root of your project).

```ocaml
(* Open the ocamlbuild world... *)
open Ocamlbuild_plugin

(* We work with commands so often... *)
open Command

(* This dispatch call allows to control the execution order of your
   directives. *)
let () =
  dispatch begin function
    (* Add our rules after the standard ones. *)
  | After_rules ->
     (* Add pa_openin.cmo to the ocaml pre-processor when use_opening is set *)
     flag ["ocaml"; "pp"; "use_openin"] (A"pa_openin.cmo");
 
     (* Running ocamldep on ocaml code that is tagged with use_openin
        will require the cmo.  Note that you only need this
        declaration when the syntax extension is part of the sources
        to be compiled with ocamlbuild. *)
     dep ["ocaml"; "ocamldep"; "use_openin"] ["pa_openin.cmo"];
  | _ -> ()
  end
```
  
Then one can tag our files that use pa_openin:

```shell
$ cat _tags
"bar.ml": camlp4o, use_openin
<foo/*.ml> or <baz/**/*.ml>: camlp4r, use_openin
"pa_openin.ml": use_camlp4, camlp4of
```

Now we can compile:

```shell
$ ocamlbuild bar.byte
```

This will build the `pa_openin.cmo` and use it.

