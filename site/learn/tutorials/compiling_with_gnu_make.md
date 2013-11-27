<!-- ((! set title Compiling with GNU make !)) ((! set learn !)) -->

# Compiling with GNU make

*Table of contents*

## Using GNU make with OCamlMakefile
[OCamlMakefile](http://omake.metaprl.org/index.html "OCamlMakefile") is
a generic Makefile that greatly facilitates the process of compiling
complex OCaml projects.

For a basic OCaml program or library that doesn't use any library
besides the standard library, just copy OCamlMakefile to the current
directory and create the following Makefile:

```makefile
RESULT = myprogram
SOURCES = \
  mymodule1.mli mymodule1.ml \
  myparser.mli myparser.mly mylexer.mll mymodule2.ml \
  mymainprogram.ml

OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
```
This is already a fairly complex program which has 5 compilation units
and uses ocamlyacc and ocamllex. Only the source files must be given,
except for the .mli files that are produced by ocamlyacc, myparser.mli
in the example.

The included OCamlMakefile provides a variety of targets. For details
please refer to the documentation of OCamlMakefile, but here are the
main ones:

```text
nc     make a native code executable
bc     make a bytecode executable
ncl    make a native code library
bcl    make a bytecode library
libinstall    install library with ocamlfind
libuninstall  uninstall library with ocamlfind
top    make a custom toplevel from all your modules
clean  remove everything that matches one of the files that could have been
       automatically created by OCamlMakefile
```

## OCamlMakefile + libraries + Camlp4 parsing
The recommended tool for installing OCaml libraries is
[Findlib](http://www.camlcity.org/archive/programming/findlib.html "Findlib")
(ocamlfind command) since it knows where packages are installed, loads
their dependencies and knows which file should be used in a given
situation.

If you do not use Findlib, loading a regular runtime library can be done
by setting the LIBS and INCDIRS variable. LIBS is the list of the name
of the library files (xxx.cma or xxx.cmxa) without the .cma or .cmxa
extension:

```makefile
LIBS = str unix
```
If you use non-standard libraries that are not installed in the same
directory as the standard library, the INCDIRS variable must contain the
list of these directories:

```makefile
INCDIRS = /path/to/somelibdirectory/
```
Usually this requires some preliminary configuration as it is
traditionally performed with a configure script since the path can vary
from one installation to another. An exception is when using standard
directories which are not included in the search path by default such as
/path/to/stdlib/camlp4. In this case, this should be enough and
portable:

```makefile
INCDIRS = +camlp4
```
OK, but we prefer libraries that are installed with ocamlfind. To use
them with OCamlMakefile, the PACKS variable must be set:

```makefile
PACKS = netstring num
```
Note that libraries that not part of the standard library but are
shipped with any standard OCaml installation such as unix, str or
bigarray are automatically considered as Findlib packages. Any package
which is required by a given package (e.g. netstring requires unix and
pcre) is automatically loaded.

How about Camlp4 syntax extensions? Some packages may define syntax
extensions, which are bytecode units that are loaded by the
preprocessor. With OCamlMakefile, a preprocessor to be used can be
defined in the first line of the file:

```ocaml
(*pp ...
```
So it could be something like:

```ocaml
(*pp camlp4o -I /path/to/pa_infix pa_infix.cmo *)
```
Well, this form is not very convenient, so we will use the same
preprocessor for each file and store its value in the PP variable of the
Makefile:

```makefile
PP = camlp4o -I /path/to/pa_infix pa_infix.cmo
export PP
```
So each OCaml file will start with:

```ocaml
(*pp $PP *)
```
This way of defining the preprocessor is still not satisfying: we would
like to take advantage of ocamlfind to load the appropriate syntax
extension files. For this, we will use the [camlp4find
script](http://martin.jambon.free.fr/ocaml.html "camlp4find script").
Every package which we use will listed as usual in the PACKS variable,
and camlp4find will call ocamlfind to know which syntax extensions to
load:

```makefile
PACKS = unix micmatch_pcre \
   pa_tryfinally pa_lettry pa_forin pa_forstep pa_repeat pa_arg
PP = camlp4find $(PACKS)
export PP
```

## Summary

You need:

* GNU make
* OCamlMakefile (copied to the project's main directory)
* Findlib (ocamlfind)
* camlp4find (copied to the project's main directory)
* Camlp4 packages installed with ocamlfind
* write a small Makefile according to the template below
* add a constant magic line at the beginning of your source files

Full example using ocamllex and the unix and micmatch_pcre libraries.
The Makefile file would be:

```makefile
RESULT = myprogram
SOURCES = mymodule1.mll mymodule2.mli mymodule2.ml mymainmodule.ml
PACKS = unix micmatch_pcre
PP = camlp4find $(PACKS)
export PP
CREATE_LIB = yes # ???
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)
```
And each .ml or .mli file starts with:

```ocaml
(*pp $PP *)
```
