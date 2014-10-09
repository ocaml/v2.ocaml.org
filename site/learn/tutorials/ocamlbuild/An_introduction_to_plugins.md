# An introduction to plugins
Warning this page came from an explanation on the mailing-list. Feel
free to help us improving it.

Roughly an ocamlbuild plugin is an OCaml module called Myocamlbuild that
should take place a the root of your project \(myocamlbuild.ml\).
Automatically ocamlbuild will take care of it by compiling it and by
making a myocamlbuild binary that is the classical ocamlbuild plus your
module.

With this module you can make effects on the ocamlbuild engine by
extending rules, flag injectors, dependencies injectors, libraries
declarations... You can also change default options of ocamlbuild to
avoid giving flags to ocamlbuild itself.

In order to properly sequence your effects ocamlbuild tells you to
register your effects using the \`dispatch' function that you will found
in every ocamlbuild plugin. This function receive an argument that is an
event, like After_rules that means that rules of the standard library
have been setup.

