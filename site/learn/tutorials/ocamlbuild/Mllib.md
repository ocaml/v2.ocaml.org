<!-- ((! set title Mllib !)) ((! set learn !)) -->

# Mllib
A .cma or .cmxa file is an archive of .cmo or .cmx files. It can contain
any list of .cmo or .cmx, with or without their dependencies. This is
needed because <Ocamlbuild\> cannot guess which files you want in your
library. To make <Ocamlbuild\> build .cma or .cmxa files, simply write a
.mllib file with the list of Modules to link. For instance: \\$ cat
parse.mllib

`Parser`<br />`Lexer`
`Now, if you call `[`Ocamlbuild`]` using the following command:`<br />`ocamlbuild parse.cma`
`It will generate a parse.cma file that includes the Parser and Lexer modules (from parser.cmo and lexer.cmo).  The parse.cma file will be in the "_build/" directory and a link will be created to it from your main directory.`

If you want to use your library inside your project with one single call
to <Ocamlbuild\>, you have to make a plugin. See [using internal
libraries](Using_internal_libraries.html).

