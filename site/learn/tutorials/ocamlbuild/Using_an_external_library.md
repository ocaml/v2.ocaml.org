# Using an external library
Imagine you want to use lablgl and lablglut in your OCaml project. These
libraries are not currently directly known by ocamlbuild so you have to
declare them. To do so you have to write a plugin.

`$ cat myocamlbuild.ml`<br />`open Ocamlbuild_plugin;;`<br />`open Command;;`

`dispatch begin function`<br />`| After_rules ->`<br />`    ocaml_lib ~extern:true ~dir:"+lablGL" "lablgl";`<br />`    ocaml_lib ~extern:true ~dir:"+lablGL" "lablglut";`<br />`| _ -> ()`<br />`end;;`

The ocaml*lib declarations are the important part of this plugin. You
can reach some documentation about this function in the
[API](http://gallium.inria.fr/~pouillar/ocamlbuild/html/Signatures.PLUGIN.html)
documentation. This declaration inform ocamlbuild and produce tags to
use the library, they are named use*\#{library_name}.

Note that the order of ocaml_lib calls determine the order in which
they are linked by the C compiler. In the above example, if tag
"use_lablgl" and "use_lablglut" are both used, ocamlc and ocamlopt are
linked first with -llalblgl, then with -llalblglut.

Then you have to specify programs which use these libraries, you can do
so using the _tags file.

`$ cat _tags`<br />`# Tag things that are linked with external libraries`<br /><main.{byte,native}\>`: use_lablgl, use_lablglut`

`# Tag also sources that use these libraries.`<br />`# This will add -I +lablGL.`<br />`# You can specify something more precise than **/*.ml`<br />`<**/*.ml>: use_lablgl`

`$ ocamlbuild main.byte main.native`

That's it!

Note: that's also the case when [Using internal
libraries](Using_internal_libraries.html).

