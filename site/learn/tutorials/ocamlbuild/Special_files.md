<!-- ((! set title Special files !)) ((! set learn !)) -->

# Special files
General files:

+ `_tags`: specify the tags of your files
+ `.itarget`: pack of targets
+ [myocamlbuild.ml](Making_plugins.html): `ocamlbuild` plugin.
  Unlike other files, this one must be at the root of your project.

Ocaml-specific files:

- `.mllib`: Ocaml library (cma and cmxa)
- [`.mlpack`](Ocamlbuild_and_module_packs.html): Ocaml package
  (cmo built with `-pack`)
- `.mltop`: Ocaml [interactive toplevel](../basics.html)
- `.odocl`: Ocaml documentation
- `.mldylib`: Ocaml plugin (cma and cmxs)


