# Using internal libraries
Using internal libraries is almost the same thing that [Using an
external library](Using_an_external_library.html).

`+-+- A/`<br />`| +- a.mllib`<br />`| +- a1.ml`<br />`| +- ...`<br />`| +- aN.ml`<br />`|`<br />`+-+- B/`<br />`| +- b.mllib`<br />`| +- b1.ml`<br />`| +- ...`<br />`| +- bN.ml`<br />`|`<br />`+-+- Main/`<br />`  +- main.ml (depending on a.cma and b.cma)`

The simplest thing to do is to let ocamlbuild build things without using
libraries:

`ocamlbuild -Is A,B Main/main.byte`

But here your mllib's are not used.

If you want to use them as libraries you need a small myocamlbuild.ml
like:

`$ cat myocamlbuild.ml`<br />`open Ocamlbuild_plugin;;`<br />`dispatch begin function`<br />`| After_rules ->`<br />`    ocaml_lib "A/a";`<br />`    ocaml_lib "B/b"`<br />`| _ -> ()`<br />`end`

And to tag your files:

`$ cat _tags`<br />`# tells that main use a and b libs`<br /><Main/main.{byte,native}\>`: use_a, use_b`<br />`# this will avoid the need of command line options to ocamlbuild`<br />`"A" or "B": include`

Finally just run:

`$ ocamlbuild Main/main.byte`

