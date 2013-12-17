<!-- ((! set title Development Tools !)) ((! set learn !)) -->

*Table of contents*

# Development Tools
![Under Construction](img/under_construction_icon.gif "")

## Editor modes
###  Emacs
###  vi
###  Acme
[Acme](https://en.wikipedia.org/wiki/Acme_(text_editor)) is a
minimalistic text editor from plan9. While there are no
language-specific features to the editor, there are a few tricks one can
use to make it friendlier:

####  Plumbimg
To allow plumbing of OCaml error messages, add the following to your
plumbing rules:

```ocamltop
type is text
data matches 'File "([.a-zA-Z¡-<U+FFFF>0-9_/\-]*[a-zA-Z¡-<U+FFFF>0-9_/\-])", line ([0-9]+), characters ([0-9]+)-([0-9]+):'
arg isfile      $1
data set        $file
attr add        addr=$2-#0+#$3,$2-#0+#$4
plumb to edit
plumb client $editor
```
####  OCaml top-level
Simply execute `win` to get a shell and run `ocaml` from within this
shell.

####  Commenting
The following `Edit` command will comment your selection.

```ocamltop
Edit .{i/(*
a/*)
}
```
####  Indenting
You can pipe your selection (or the whole file) through an external
indenter such as [<code>ocp-indent</code>](https://github.com/OCamlPro/ocp-indent)
middle-clicking on the command `|ocp-indent`.

## Compilation tools
###  Findlib/ocamlfind
[<code>ocamlfind</code>](http://projects.camlcity.org/projects/findlib.html/) is
`pkg-config` for OCaml.

###  ocamlbuild
###  oasis
###  OCamlMakefile
###  OMake
[OMake](http://omake.metaprl.org/index.html) is a build system designed
for scalability and portability. It uses a syntax similar to make
utilities you may have used, but it features many additional
enhancements.

See the [guide](http://omake.metaprl.org/manual/omake.html).

## Distributing libraries
* Oasis oasis-db
* godi
* [Yypkg](http://yypkg.forge.ocamlcore.org)

## Debugging
Debugging facilities are described [here](debug.html).


