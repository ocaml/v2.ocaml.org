# Odocl
<Ocamlbuild\> can build the ocamldoc documentation of your project for
you. Just write an ".odocl" file with the list of modules you want. For
instance: \\$ cat project.odocl

`Main`<br />`Parser`<br />`Lexer`<br />`Misc`
`Now, if you call `[`Ocamlbuild`]` using the following command:`<br />`ocamlbuild project.docdir/index.html`
`You will get the documentation for modules Main, Parser, Lexer and Misc in the "_build/project.docdir" directory. The index of the documentation is "_build/project.docdir/index.html".`

Unless you are using the "-build-dir" or the "-no-links" options, you
will get a link to "project.docdir" in your main directory, so you can
also access your documentation using "project.docdir/index.html".

