<!-- ((! set title Cross-compiling !)) ((! set learn !)) -->

# CrossCompiler
## Overview
Cross-compiling is compiling on a *host* machine a binary executable to
be executed on a *target* machine, where *host* and *target* are of
different architectures and/or OSes. A short introduction on the subject
can be found on
[Wikipedia](http://en.wikipedia.org/wiki/Cross_compiler).

As of today, cross-compilation is not supported by OCaml *out of the
box*. However, it possible to build OCaml cross-compilers fairly easy.
This page aims at explaining how to do so.

#### What you will need
To engage in the build of an OCaml cross-compiler, you will need:

- a working `ocamlrun` executable for the *host* machine in your path;
- a full-blown C cross-toolchain;
- a full-blown shell;
- all the dependencies you would need to build OCaml in a *classical*
 way;
- some time;
- a peaceful mind.

#### What you will get
Upon successful build and installation, the following directories are
created:

- *BINDIR* with two executables:
    - the newly-created `ocamlopt`, producing on the *host* executable
 to be run on the *target*;
    - a copy of the `ocamlrun` used to execute OCaml bytecode
 executables on the *host* machine.

- *LIBDIR* with:
    - the `mli`, and `ml` files corresponding to the sources of the
 libraries;
    - the `cmi`, `cmx`, `cmxa`, and `a` files corresponding to the
 libraries compiled for the *target* machine;
    - the `o` files needed to produce the executables for the *target*
 machine;


where *BINDIR* and *LIBDIR* are chosen at the configuration step.

## Building a C cross-compiler and related tools
Building a C cross-compiler is not an easy task. First, one will need to
build some cross-assembler, cross-linker and other *base* tools. Then,
the C cross-compiler can be built but this often implies some more or
less complicated bootstrap. Finally, it is also necessary to cross-build
the standard library \(*e. g.* libc\) needed to run executables on the
target architecture.

To overcome this tedious process, one is advised to resort to either a
prepackaged C cross-compiler \(from binaries, from a packaging system,
whatever\). If this option is not available, another great time saver is
the excellent [crosstool](http://www.kegel.com/crosstool/).

Before building the corresponding OCaml cross-compiler, one is strongly
advised to check that its C cross-compiler is actually operating as
expected.

## Building an OCaml cross-compiler
Building an OCaml cross-compiler is fairly easy \(at least compared to
the burden of getting a C one up and running\). However, the sources and
Makefiles of the standard distribution need to be slightly patched. Such
a patch is provided here and is based on the sources of the release
numbered *3.11.0*.

### First step: getting the sources
In order to get the sources of the cross-compiler, it is necessaty to:

1. get the sources of the release numbered **3.11.0**<br /> the tarball of this release can be downloaded by following [this
 link](http://caml.inria.fr/pub/distrib/ocaml-3.11/ocaml-3.11.0.tar.gz);
2. get the cross-compiler patch from <CrossCompilerPatch\>;
3. apply the aforementioned patch<br /> this is usually done by copying the patch to the top directory
 where sources are unarchived and running
 `patch -p1 < cross-caml.patch`.

### Second step: configuring
For the configuration part, as one cannot rely upon the `./configure`
magic, it is necessary generate its output by hand. Hopefully, this is
easier than it may sound. The `./configure` produces three files:

- `config/m.h` \(information about the target machine\);
- `config/s.h` \(information about the target system\);
- `config/Makefile` \(information about the toolchain to use\).

To create `config/m.h` and `config/s.h`, just start by copying
respectively `config/m-templ.h` and `config/s-templ.h` and use the C
`#define` and `#undef` directives to describe the target architecture.

Alternatively, if a working shell, C compiler and libraries are already
installed on your target system, you could copy the `./configure` script
and the `config` directory to the target system, run `./configure` on
it, and copy the generated `config/m.h` and `config/s.h` back to the
host system.

To create `config/Makefile`, just start by copying
`config/Makefile-templ` \(**alert:** be sure to use the *patched*
`config/Makefile-templ`\). Then, by reading the comments, one should be
able to set the values of the various variables. Most notably, one
should carefully set the following:

- *BINDIR* and *LIBDIR* that should be distinct from those of any
 existing OCaml install;
- *ARCH*, *MODEL*, and *SYSTEM* that should describe the target
 machine;
- *TARGETRANLIB*, *TARGETAR*, *ASM*, *ASPP*, *NATIVECC*, and
 *PARTIALLD* that should point to the various tools of the C
 cross-toolchain;
- *MKEXE* \(respectively *TARGETMKEXE*\), *MKDLL* \(respectively
 *TARGETMKDLL*\), and *MKMAINDLL* \(respectively *TARGETMKMAINDLL*\)
 that should point to the C compilers used to build executable and
 dynamic libraries for the host machine \(respectively for the target
 machine\).

Finally, a bit of black magic is needed to complete the Makefile. The
following lines should be added: MKLIB=\\$\(TARGETAR\) rc \\$\(1\) \\$\(2\);
\\$\(TARGETRANLIB\) \\$\(1\) #ml let syslib x = "-l"\\^x;; #ml let mklib
out files opts = Printf.sprintf "targetar rc %s %s %s; targetranlib %s"
out opts files out;; The first line indicates how a static library
should be built.<br />The second line defines an OCaml function that maps a library identifier
to the command-line flag that should be passed to the compiler to link
with that library.<br />The third line defines an OCaml function indicating how a static library
should be built.<br />**alert:** on this last line, *targetar* and *targetranlib* should be
replaced respectively by the values of \\$\(TARGETAR\) and
\\$\(TARGETRANLIB\). It is not possible to use the Makefile variables there
because we are inside a comment.

### Third step: building
If everything has been accurately set up, building the cross-compiler
should be as smooth as:

1. `make cross`;
2. `make installcross` \(possibly requiring *root* privileges\).

### Fourth step: testing
To test the newly-created toolchain, one is advised to compile on the
host machine a program that links to some library \(besides the standard
library\). As an example, the following one allows to test that the
*Unix* library has been flawlessly compiled:

`let () =`<br />`  print_string "Hello, the path is ";`<br />`  print_endline (try Unix.getenv "PATH" with Not_found -> "`<unset\>`")`

Checking that the correct assembler, linker and the like are actually
called can be made by compiling in verbose mode: *BINDIR*/ocamlopt -o
./cross-compiled -verbose unix.cmxa source.ml It should show that the C
cross-toolchain is used. The *file* utility can be run to examine the
actual architecture of the produced executable.

When this is done, the final test is of course to copy the resulting
executable to the target machine and to launch it.

## Reporting success or failure
To date, this process has been used to successfully build a MacOS X to
Linux cross-compiler, based on a C cross-toolchain obtained from
crosstool.

In order to improve the patch, as well as this page, I would like to
hear about both successful and unsuccessful uses of them. Please send a
mail to [xavier.clerc@inria.fr](mailto:xavier.clerc@inria.fr) to report.

## Related resources
This section is probably not exhaustive. Feel free to add links to
resources.

- cross-compiling from Fedora to MinGW
 [1](http://camltastic.blogspot.com/2008/10/mingw-compile-software-for-windows.html)
 [2](http://camltastic.blogspot.com/2008/10/mingw-inkscape-cross-compiled-from.html)
 [3](http://camltastic.blogspot.com/2008/11/common-mistakes-cross-compiling-mingw.html)
 [<http://hg.et.redhat.com/misc/fedora-mingw>--devel/]
- cross-compiling to \(jailbroken\) iPhone
 [4](http://yl.is.s.u-tokyo.ac.jp/~tosh/ocaml-on-iphone/)
- wish on the bugtracker
 [5](http://caml.inria.fr/mantis/view.php?id=4303)


