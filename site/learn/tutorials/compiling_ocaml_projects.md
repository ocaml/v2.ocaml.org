<!-- ((! set title Compiling OCaml projects !)) ((! set learn !)) -->

# Compiling OCaml projects

This tutorial describes the base compilation commands provided with
OCaml. It is useful to learn these commands to understand OCaml's
compilation model. However, eventually you will want to use a build tool
that automatically calls these commands internally. See [Compilation
Tools](dev_tools.html#compilation_tools) for more information on the
available options.

## Compilation basics
The core OCaml distribution provides the `ocamlc` and `ocamlopt`
compilers. Using them directly is fine, but if you are using third party
libraries, you should use the `ocamlfind` front-end, since it saves you
from worrying about where libraries have been installed on your
particular system. You can even skip to the next section "Automated
build systems", where you will find how to do things even more
automatically.

In this section, we will first see how to compile a simple program using
only ocamlc or ocamlopt. Then we will see how to use libraries and how
to take advantage of the
[findlib](http://www.ocaml-programming.de/programming/findlib.html "http://www.ocaml-programming.de/programming/findlib.html")
system, which provides the `ocamlfind` command.

###  `ocamlc` and `ocamlopt`
`ocamlc` is the bytecode compiler, and `ocamlopt` is the native code
compiler. If you don't know which one to use, use `ocamlopt` since it
provides standalone executables that are normally faster than bytecode.

Let's assume that your program `progprog` has two source files,
`module1.ml` and `module2.ml`. We will compile them to native code,
using `ocamlopt`. For now, we also assume that they do not use any other
library than the standard library, which is automatically loaded. You
can compile the program in one single step:

```
ocamlopt -o progprog module1.ml module2.ml
```
That's it. The compiler produced an executable named `progprog` or
`progprog.exe`. If you are wondering how to write a program in multiple
files, see our [Modules](modules.html "Modules") tutorial. Don't forget
that the order of the source files matters, and that `module1.ml` cannot
depend on things that are defined in `module2.ml`, unless `module2.ml`
comes earlier on the command line.

Let's use libraries other than the standard library. The OCaml
distribution is shipped with the standard library, plus several other
libraries that you can use as well. There is also a large number of
third-party libraries, for a wide range of applications, from networking
to 3D graphics. You must understand the following:

1. The OCaml compilers know where the standard library is and uses it
 systematically (try: `ocamlc -where`). You don't have to worry much
 about it.
1. The other libraries that ship with the OCaml distribution from Inria
 (str, unix, bigarray, etc.) are installed in the same directory as
 the standard library.
1. Third-party libraries may be installed in various places, and even a
 given library can be installed in different places from one system
 to another.

If your program uses only the unix library (provides system calls not
only for Unix systems), the command line would be:

```
ocamlopt -o progprog unix.cmxa module1.ml module2.ml
```
`.cmxa` is the extension of native code libraries, while `.cma` is the
extension of bytecode libraries. The file `unix.cmxa` is found because
it is always installed at the same place as the standard library, and
this directory is in the library search path.

If your program is a video game that uses openGL with SDL, you will need
to tell the compiler which library files must be used, and where to find
them. It means you will be using lablGL and OCamlSDL, the OCaml
interfaces to your local implementation of openGL and SDL. LablGL
provides one OCaml library file `lablgl.cmxa`, while OCamlSDL provides
one core library file `sdl.cmxa`, and 3 optional files `sdlloader.cmxa`,
`sdlmixer.cmxa` and `sdlttf.cmxa`. If you want to use those files, you
must pass them on the command line. You must also indicate the libraries
on which these libraries depend. Here, the bigarray library is needed by
OCamlSDL. You must also pass the -I option to `ocamlopt` for each
directory where they should be looked for. Since this information
installation-dependent, we will use ocamlfind instead.

###  Using the `ocamlfind` front-end
Using `ocamlfind` is highly recommended for compiling any program or
library that uses third-party OCaml libraries. Library authors
themselves should make their library installable with `ocamlfind` as
well. If they don't, you may have to do it yourself, which is not very
difficult, but hopefully you won't have to. OK, let's assume that all
the libraries you want to use have been installed properly with
ocamlfind.

You can see which packages and subpackages are available in your system
by typing:

```
ocamlfind list
```
This shows the list of package names, with their version ID.

For our example using LablGL and OCamlSDL, we are going to use the
following packages: lablGL, sdl, sdl.sdlimage, sdl.sdlmixer, sdl.sdlttf.
The bigarray package is needed by the sdl package, but we don't need to
worry about that since `ocamlfind` knows it.

The command for compiling our program will be:

```
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml module2.ml
```
And it will work regardless of the location of the libraries, as long as
they are known by `ocamlfind`.

Note that you can compile the files separately. This is mostly useful if
you want to recompile only some parts of the programs. Here are the
equivalent commands that perform a separate compilation of the source
files and link them together in a final step:

```
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.ml
ocamlfind ocamlopt -c \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module2.ml
ocamlfind ocamlopt -o progprog -linkpkg \
  -package lablGL,sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf \
  module1.cmx module2.cmx
```
Separate compilation is usually not performed manually but only when
using a Makefile that will take care of recompiling only what it
necessary. See next section.

<!-- ## Automated build systems -->
