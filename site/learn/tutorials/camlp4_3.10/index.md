<!-- ((! set title Camlp4 3.10 !)) ((! set learn !)) -->

*Table of contents*

# Camlp4 3.10

**Camlp4**, the OCaml "pre-processor pretty printer" is an advanced
macro system which allows complex abstract syntax tree transformations
on ocaml programs, and on other recursive decent grammars.

**Warning** this page contains advanced material.

Camlp4 underwent a major revision between the version included in ocaml
3.09 and 3.10. The supplied documentation as of this pages' creation is
very small. This page is experimental and user supported content.

## External Documents
The semi-official documentation:
[http://brion.inria.fr/gallium/index.php/Camlp4](http://brion.inria.fr/gallium/index.php/Camlp4 "http://brion.inria.fr/gallium/index.php/Camlp4")

The ocaml beta announcement:
[camlp4-changes](http://nicolaspouillard.fr/camlp4-changes.html)

## The examples
An example written for Camlp4 3.10:

* [Camlp4 3.10/Foreach
 Tutorial](foreach_tutorial.html "Camlp4 3.10/Foreach Tutorial")

These examples are from the camlp4 beta announcement:

* [Camlp4
 3.10/dynamic_old_syntax.ml](dynamic_old_syntax.html "Camlp4 3.10/dynamic_old_syntax.ml")
* [Camlp4
 3.10/static_old_syntax.ml](static_old_syntax.html "Camlp4 3.10/static_old_syntax.ml")
* [Camlp4
 3.10/quick_non_extensible_example.ml](quick_non_extensible_example.html "Camlp4 3.10/quick_non_extensible_example.ml")
* [Camlp4
 3.10/dynamic_functor_example.ml](dynamic_functor_example.html "Camlp4 3.10/dynamic_functor_example.ml")
* [Camlp4
 3.10/static_functor_example.ml](static_functor_example.html "Camlp4 3.10/static_functor_example.ml")

This is a translation of M. Jambon's json_static to Camlp4 3.10 by N.
Poulliard.

The patch:

[pa_json_static.patch](http://nicolaspouillard.fr/pub/camlp4/rosetta/pa_json_static/pa_json_static.patch)

The new version (compiles with camlp4orf):

[pa_json_static.ml](http://nicolaspouillard.fr/pub/camlp4/rosetta/pa_json_static/pa_json_static.ml)


## The command line
In the beta announcement, there was mention of new binaries camlp4xxx
that come preloaded with selections of new and old syntaxes

New commands:

* **camlp4orf**: camlp4o + Grammar, macro and revised quotation
 syntaxes.
* **camlp4oof**: camlp4o + Grammar, macro and the same syntax for
 quotations.
* **camlp4rf**: camlp4r + Grammar, macro and the same syntax for
 quotations.

It is not necessary to use a `.cma` file to create a regular camlp4
extension. The `.cmi` libraries are for creating standalone executables.
Only the `.cmi` files from the include path are needed.

So as an example:

```
$ ocamlc -I +camlp4 -pp camlp4orf -c dynamic_functor_example3.ml
```
## The .cma files
From N. Poulliard
[http://caml.inria.fr/pub/ml-archives/caml-list/2007/04/47c5c935136351afaefee6a0aa9cc506.en.html](http://caml.inria.fr/pub/ml-archives/caml-list/2007/04/47c5c935136351afaefee6a0aa9cc506.en.html)

There is a list of libraries provided with camlp4:

camlp4{o,of,orf,r,rf}.cma are toplevel libs there are only made to be
loaded in the ocaml toplevel

camlp4lib.cma contains the Camlp4 module which holds the camlp4 kernel.

camlp4fullilb.cma contains modules of camlp4lib.cma plus all parsers and
filters.


