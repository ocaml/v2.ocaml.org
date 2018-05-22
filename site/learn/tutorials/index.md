<!-- ((! set title OCaml Tutorials !)) ((! set learn !)) -->
<!-- {{! input template/macros.mpp !}} -->

# OCaml tutorials

####  Your Help is Needed
Many of the tutorials below need updating and tutorials on many new
topics are needed. Please contribute by visiting this project's repo on
[GitHub](https://github.com/ocaml/ocaml.org); you may use the issue
tracker there to request or offer new tutorials. Thanks!

((! get begin_two_columns !))

### Getting Started

* [Basics](basics.html)
* [Structure of OCaml Programs](structure_of_ocaml_programs.html)
* [Modules](modules.html)
* [Filenames and Extensions](filenames.html)
* [OCaml Programming Guidelines](guidelines.html)

### Data Structures

* [Maps (Dictionaries)](map.html)
* [Sets](set.html)
* [Hash Tables](hashtbl.html)
* [Comparison of Standard
 Containers](comparison_of_standard_containers.html)

### Language Features

* [Data Types and Matching](data_types_and_matching.html)
* [Functional Programming](functional_programming.html)
* [If Statements, Loops, and
 Recursion](if_statements_loops_and_recursion.html)
* [Labels](labels.html)
* [Pointers in OCaml](pointers.html)
* [Null Pointers, Asserts, and
 Warnings](null_pointers_asserts_and_warnings.html)
* [Objects](objects.html)

### Errors

* [Error handling](error_handling.html)
* [Common Error Messages](common_error_messages.html)

((! get second_of_two_columns !))

### Interoperability

* [Calling C libraries](calling_c_libraries.html)
* [Calling Fortran libraries](calling_fortran_libraries.html)

### Build Systems

* [Compiling OCaml projects](compiling_ocaml_projects.html)
* [OCamlbuild](ocamlbuild/)
* [Setting up OCaml projects with OASIS](setting_up_with_oasis.html)

### Advanced Topics

* [Garbage Collection](garbage_collection.html)
* [Performance and Profiling](performance_and_profiling.html)

### Common Tasks

* [Formatting and Wrapping Text](format.html)
* [99 Problems (solved) in OCaml](99problems.html)
* [Introduction to Gtk](introduction_to_gtk.html)
* [Command-Line Arguments](command-line_arguments.html)
* [File manipulation](file_manipulation.html)

### Acknowledgements

* [_Acknowledgements_](../../contributors.html#Oldercontributorstothetutorials)

((! get end_two_columns !))


## External Links

###  Learn by Doing

* [Try OCaml Online](http://try.ocamlpro.com/) (by OCamlPro) allows
 you to immediately start learning OCaml in your browser, without
 installing it. Compiled as a single Javascript page, it gives you
 the full power of OCaml, even when your are disconnected from the
 network.
* [PLEAC-OCaml](http://pleac.sourceforge.net/pleac_ocaml/) provides
 OCaml solutions to the complete set of problems originally posed in
 the very successful Perl Cookbook. OCaml is one of only 3 languages
 for which the full set of solutions has been provided.
* [Rosetta](http://rosettacode.org/wiki/Category:OCaml) is a
 programming chrestomathy site. It provides solutions to the same
 task in many languages. Currently there are few tasks with OCaml
 solutions provided, but perhaps you would like to add new solutions.

###  Tutorials on OCaml

* [The OCaml System](http://caml.inria.fr/pub/docs/manual-ocaml/) (by
 Inria) is the official user's manual. The first part provides an
 introduction to the core language, objects and classes, and modules.
 Previous versions are [here](http://caml.inria.fr/pub/docs/).
* [How to wrap C functions to
  OCaml](http://www.linux-nantes.org/~fmonnier/OCaml/ocaml-wrapping-c.html)
  (by Florent Monnier) explains in an understandable way how to write C
  stubs to call C functions from OCaml and back. It features a lot of
  examples.
* [OCaml for scientific
 computation](http://www.southampton.ac.uk/~fangohr/software/ocamltutorial/)
 (by Thomas Fischbacher), covers a broad sample of OCaml, from the
 basics to the C API.

###  WikiBooks on OCaml

* [fr.wikibooks.org/wiki/OCaml](http://fr.wikibooks.org/wiki/OCaml)
 (in French):
 Introduction on functional programming using OCaml.
* [fr.wikiversity.org/wiki/Premiers_pas_en_OCaml](http://fr.wikiversity.org/wiki/Premiers_pas_en_OCaml)
 (in French):
 The basics of the OCaml language.

###  Tutorials on Tools
There are also tutorials that can be useful to learn how to use popular
tools and libraries.

* [Camlp4
 Tutorial](http://ambassadortothecomputers.blogspot.com/p/reading-camlp4.html)
 (by Jake Donham), to build syntax extensions for OCaml with Camlp4.
* [OCamllex
 Tutorial](http://plus.kaist.ac.kr/~shoh/ocaml/ocamllex-ocamlyacc/ocamllex-tutorial/)
 (by SooHyoung Oh), on how to create lexers using the `ocamllex` tool
 of the standard distribution.
* [OCamlyacc
 Tutorial](http://plus.kaist.ac.kr/~shoh/ocaml/ocamllex-ocamlyacc/ocamlyacc-tutorial/)
 (by SooHyoung Oh), on how to create parsers using the `ocamlyacc`
 tool of the standard distribution.
* [LablGTK 2.0
 Tutorial](http://plus.kaist.ac.kr/~shoh/ocaml/lablgtk2/lablgtk2-tutorial/)
 (by SooHyoung Oh), on how to create graphical applications with the
 LablGTK library.
* [Camlp5](camlp5.html)
* [A Guide to Extension Points in OCaml](http://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml/)
  (by whitequark), on using PPX, the syntax extensions API that superseded camlp4.

###  Coming From Another Language

These tutorials help learn OCaml from the perspective of being familiar
with another language.

* [Beyond functional programming in Haskell: an introduction to
 OCaml](http://www.cs.uu.nl/wiki/pub/Stc/BeyondFunctionalProgrammingInHaskell:AnIntroductionToOCaml/ocaml.pdf)
* [OCaml for Haskellers](http://blog.ezyang.com/2010/10/ocaml-for-haskellers/)

###  Advanced Tutorials & Articles

* [Manual](http://caml.inria.fr/pub/docs/manual-ocaml/)
* [Detecting use cases for GADTs in OCaml](http://mads-hartmann.com/ocaml/2015/01/05/gadt-ocaml.html),
  (by Mads Hartmann), on using generalized algebraic data types in writing interpreters.

###  Archived Tutorials
These tutorials are either obsolete, or describe obsolete technologies. They're preserved here just in case they're still useful to someone.

* [OCaml and the Web](ocaml_and_the_web.html) (Outdated, still uses CGI programming.)
* [Camlp4 3.10](camlp4_3.10/) (Replaced by PPX, see [the PPX blog post](https://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml/).)
* [Mega Crash course on OCaml ecosystem + code](get_up_and_running.html) (Too opinionated for a community document.)
* [Streams](streams.html) (Use stdlib's [Seq](https://github.com/ocaml/ocaml/blob/trunk/stdlib/seq.mli) introduced in 4.07 or the [compatibility opam package](https://github.com/c-cube/seq/).)
* [Stream Expressions](stream_expressions.html) (Using deprecated camlp4 syntax. See Seq.)
