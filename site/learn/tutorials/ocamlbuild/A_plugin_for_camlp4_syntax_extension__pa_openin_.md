<!-- ((! set title A camlp4 plugin !)) ((! set learn !)) -->

# A plugin for camlp4 syntax extension \(pa openin\)
If you just want to use a syntax extension included in an installed
package, see [Using ocamlfind with
ocamlbuild](Using_ocamlfind_with_ocamlbuild.html).

Suppose you have some Camlp4 OCaml syntax extension and that you
want to compile them with <Ocamlbuild\>.

Let start by adding an <Ocamlbuild\> plugin.

` $ cat myocamlbuild.ml`<br />` (* Open the ocamlbuild world... *)`<br />` open Ocamlbuild_plugin;;`<br />` `<br />` (* We work with commands so often... *)`<br />` open Command;;`<br />` `<br />` (* This dispatch call allows to control the execution order of your`<br />`    directives. *)`<br />` dispatch begin function`<br />`   (* Add our rules after the standard ones. *)`<br />` | After_rules ->`<br />` `<br />`     (* Add pa_openin.cmo to the ocaml pre-processor when use_opening is set *)`<br />`     flag ["ocaml"; "pp"; "use_openin"] (A"pa_openin.cmo");`<br />` `<br />`     (* Running ocamldep on ocaml code that is tagged with use_openin will require the cmo.`<br />`        Note that you only need this declaration when the syntax extension is part of the`<br />`        sources to be compiled with ocamlbuild. *)`<br />`     dep ["ocaml"; "ocamldep"; "use_openin"] ["pa_openin.cmo"];`<br />` | _ -> ()`<br />` end;;`

Then one can tag our files that use pa_openin:

` $ cat _tags`<br />` "bar.ml": camlp4o, use_openin`<br />` `<foo/*.ml\>` or `<baz/\*\*/*.ml\>`: camlp4r, use_openin`<br />` "pa_openin.ml": use_camlp4, camlp4of`

Now we can compile:

` $ ocamlbuild bar.byte`

This will build the pa_openin.cmo and use it.

