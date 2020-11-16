<!-- ((! set title Ocamlbuild !)) ((! set learn !)) -->

*Table of contents*

# Ocamlbuild
## Documentation

+ [User manual](https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc)
+ List and usage of [special files](Special_files.html).
+ List and usage of [built-in `tags`](Tags.html).
+ The [solver mechanism](Solver_mechanism.html): what are rules
  and tags?
+ [Using ocamlfind with
  ocamlbuild](Using_ocamlfind_with_ocamlbuild.html) (integrated
  since OCaml 3.12, plugin for earlier versions).
+ [Making plugins](Making_plugins.html).


## Plugin examples

+ ["Hello, world!" or how to output to the log
  file](Ocamlbuild__Hello__world___or_how_to_output_to_the_log_file.html)
+ [Using camlp4 syntax extensions
  (pa_openin)](A_plugin_for_camlp4_syntax_extension__pa_openin_.html)
+ [Basic example using ocamlbuild with
  macros](http://caml.inria.fr/mantis/bug_view_page.php?bug_id=5162).
  When the `INCLUDE`'d files are not in the root directory of the
  project, one has to take care to pass the correct `-I` option to
  camlp4 as [explained here](Ocamlbuild_macros.html).
+ [Compiling C with gcc](Compiling_C_with_gcc.html)
+ [Compiling LaTeX](A_plugin_example_for_compiling_LaTeX.html)
+ [Automatic generation of a "version.ml" file with the compile
  time](Automatic_Version_Generation.html)
+ [Generate JSON parser/printer from .atd
  files](A_plugin_example_for_compiling_Json_printer_parser_from__atd_file_with_atdgen.html)


## F.A.Q.
+ [Using an external library](Using_an_external_library.html)
+ [Using internal libraries](Using_internal_libraries.html)
+ [Using threads](Using_threads.html)
+ [Using module packs](Ocamlbuild_and_module_packs.html)
+ [Using alphaCaml with ocamlbuild](Using_alphaCaml_with_ocamlbuild.html)
  (can be useful as template for another simple package)
+ [Using an ocamlfind installation of
  sexplib](Using_an_ocamlfind_installation_of_sexplib.html)
+ [Working on dependent projects with
  ocamlbuild](Working_on_dependent_projects_with_ocamlbuild.html)
+ [New kinds of build errors](New_kinds_of_build_errors.html)
+ [Ocamlbuild example with C
  stubs](Ocamlbuild_example_with_C_stubs.html) and an
  [abstracted example](C_stub_functions.html)
+ [Projects using ocamlbuild](Projects_using_ocamlbuild.html)

