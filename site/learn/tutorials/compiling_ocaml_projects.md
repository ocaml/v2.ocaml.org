<!-- ((! set title Compiling OCaml Projects !)) ((! set learn !)) -->

*Table of contents*

# Compiling OCaml projects

This tutorial explains how to compile your OCaml programs into executable form.
It addresses, in turn:

1. The compilation commands `ocamlc` and `ocamlopt` provided with OCaml. It is
   useful to learn these commands to understand OCaml's compilation model.

1. The `ocamlfind` front-end to the compiler, which saves you from worrying
   about where libraries have been installed on your particular system. 

1. Automatic build systems for OCaml, such as `dune`, which release us from
   details of compiler command invocation, so we never touch `ocamlc`,
   `ocamlopt`, or even `ocamlfind`.

In our [up and running tutorial](up_and_running.html) we jumped straight to using
the automated build system `dune`. Now we shall look under the hood.

## Compilation basics

In this section, we will first see how to compile a simple program using
only `ocamlc` or `ocamlopt`. Then we will see how to use libraries and how
to take advantage of the
[findlib](http://projects.camlcity.org/projects/findlib.html)
system, which provides the `ocamlfind` command.

### The ocamlc and ocamlopt compilers

OCaml comes with two compilers: `ocamlc` is the bytecode compiler, and
`ocamlopt` is the native code compiler. If you don't know which one to use, use
`ocamlopt` since it provides executables that are faster than bytecode.

Let's assume that our program `program` has two source files,
`module1.ml` and `module2.ml`. We will compile them to native code,
using `ocamlopt`. For now, we also assume that they do not use any other
library than the standard library, which is automatically loaded. You
can compile the program in one single step:

```shell
ocamlopt -o program module1.ml module2.ml
```

The compiler produces an executable named `program` or `program.exe`. The order
of the source files matters, and so `module1.ml` cannot depend upon things that
are defined in `module2.ml`.

The OCaml distribution is shipped with the standard library, plus several other
libraries. There are also a large number of third-party libraries, for a wide
range of applications, from networking to graphics. You should understand the
following:

1. The OCaml compilers know where the standard library is and use it
   systematically (try: `ocamlc -where`). You don't have to worry much about
   it.

1. The other libraries that ship with the OCaml distribution (str, unix, etc.)
   are installed in the same directory as the standard library.

1. Third-party libraries may be installed in various places, and even a given
   library can be installed in different places from one system to another.

If your program uses the unix library in addition to the standard library, for
example, the command line would be:

```shell
ocamlopt -o program unix.cmxa module1.ml module2.ml
```

Note that `.cmxa` is the extension of native code libraries, while `.cma` is
the extension of bytecode libraries. The file `unix.cmxa` is found because it
is always installed at the same place as the standard library, and this
directory is in the library search path.

If your program depends upon third-party libraries, you must pass them on the
command line. You must also indicate the libraries on which these libraries
depend. You must also pass the -I option to `ocamlopt` for each directory where
they may be found. This becomes complicated, and this information is
installation dependent. So we will use `ocamlfind` instead, which does these
jobs for us.

###  Using the ocamlfind front-end

Using `ocamlfind` is often used for compiling any program or library that uses
third-party OCaml libraries. Library authors themselves make their library
installable with `ocamlfind` as well. You can install `ocamlfind` using the
opam package manager, by typing `opam install ocamlfind`.

Let's assume that all the libraries you want to use have been installed
properly with ocamlfind. You can see which libraries are available in your
system by typing:

```shell
ocamlfind list
```

This shows the list of package names, with their versions. Note that most
opam packages install software using ocamlfind, so your list of ocamlfind
libraries will be somewhat similar to your list of installed opam packages
obtained by `opam list`.

The command for compiling our program using package `package` will be:

```shell
ocamlfind ocamlopt -o program -linkpkg -package package module1.ml module2.ml
```

Multiple packages can be specified using commas e.g `package1,package2`. This
command will work regardless of the location of the libraries, as long as they
are known by `ocamlfind`.

Note that you can compile the files separately. This is useful if
you want to recompile only some parts of the programs. Here are the
equivalent commands that perform a separate compilation of the source
files and link them together in a final step:

```shell
ocamlfind ocamlopt -c -package package module1.ml
ocamlfind ocamlopt -c -package package module2.ml
ocamlfind ocamlopt -o program -linkpkg -package package module1.cmx module2.cmx
```

Separate compilation (one command for `module1.ml`, another for `module2.ml`
and another to link the final output) is usually not performed manually but
only when using an automated build system that will take care of recompiling
only what it necessary.

## Interlude: making a custom toplevel

OCaml provides another tool `ocamlmktop` to make an interactive toplevel with
libraries accessible. For example:

```shell
ocamlmktop -o toplevel unix.cma module1.ml module2.ml
```

We run `toplevel` and get an OCaml toplevel with modules `Unix`, `Module1`, and
`Module2` all available, allowing us to experiment interactively with our
program.

OCamlfind also supports `ocamlmktop`:

```shell
ocamlfind ocamlmktop -o toplevel unix.cma -package package module1.ml module2.ml
```

## Dune: an automated build system

The most popular modern system for building OCaml projects is
[dune](https://dune.readthedocs.io/en/stable/) which may be installed with
`opam install dune`. It allows one to build OCaml projects from a simple
description of their elements. For example, the dune file for our project might
look like this:

```shell
;; our example project
(executable
  (name program)
  (libraries unix package))
```

The dune [quick-start
guide](https://dune.readthedocs.io/en/latest/quick-start.html) shows you how to
write such description files for more complicated situations, and how to
structure, build, and run dune projects. 

## Other build systems

- [OMake](https://github.com/ocaml-omake/omake) Another OCaml build system.
- [GNU make](https://www.gnu.org/software/make/) GNU make can build anything, including OCaml. May be used in conjunction with [OCamlmakefile](https://github.com/mmottl/ocaml-makefile)
- [Oasis](https://github.com/ocaml/oasis) Generates a configure, build, and install system from a specification.
