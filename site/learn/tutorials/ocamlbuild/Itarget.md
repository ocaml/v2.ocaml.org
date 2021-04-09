<!-- ((! set title Itarget !)) ((! set learn !)) -->

# Itarget
An .itarget file allows you to build several targets just by asking
<Ocamlbuild\> to build one target \(the .otarget file\). For instance: \\$
cat all.itarget

`doc.docdir/index.html`<br />`main.byte`<br />`main.native` `If you run:`<br />`ocamlbuild all.otarget`
[`Ocamlbuild`]` will build your project, bytecode and native, and its documentation.`

No links will be created in your main directory though.

