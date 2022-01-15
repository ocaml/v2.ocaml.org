<!-- ((! set title Up and Running with OCaml !)) ((! set learn !)) -->

*Table of contents*

# Up and Running with OCaml

This page will help you install OCaml, the Dune build system, and support for
your favourite text editor or IDE. These instructions work on Windows, Unix
systems like Linux, and macOS.

## Installing OCaml

There are two procedures: one for Unix-like systems, and one for Windows.

### For Linux and macOS

We will install OCaml using opam, the OCaml package manager.  We will also use
opam when we wish to install third-party OCaml libraries.

**For macOS**

```
# Homebrew
brew install opam

# MacPort
port install opam
```

**For Linux** the preferred way is to use your system's package manager on
Linux (e.g `apt-get install opam` or similar). [Details of all installation
methods.](https://opam.ocaml.org/doc/Install.html)

Then, we install an OCaml compiler and some basic dev tools:

```
# environment setup
opam init
eval `opam env`

# install given version of the compiler
opam switch create 4.11.1
eval `opam env`
# install dev tools
opam install dune utop ocaml-lsp-server
```

Now, OCaml is up and running:

```
$ which ocaml
/Users/frank/.opam/4.11.1/bin/ocaml

$ ocaml -version
The OCaml toplevel, version 4.11.1
```

**For either Linux or macOS** as an alternative, a binary distribution of opam is
available:

```
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
```

### For Windows

OCaml on Windows is still a work in progress. In the meantime, if you only
need to *run* OCaml programs on a Windows machine, then the simplest solution
is to use the Windows Subsystem for Linux 2 (WSL2). WSL2 is a feature that
allows Linux programs to run directly on Windows. WSL2 is substantially easier
and faster to use than WSL1. Microsoft have comprehensive installation steps
for [setting up WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

On the other hand, if you need Windows binaries then you will have to use the
[OCaml for Windows](https://fdopen.github.io/opam-repository-mingw/) installer
which comes in 32bit and 64bit versions. This installer gives you opam and
OCaml installations all in one go. It is used from within a Cygwin environment,
but the executables produced have no dependency on Cygwin at all. For a more
comprehensive update on the state of OCaml on Windows, see the 
[OCaml on Windows](/platform/ocaml_on_windows.html) page.

## The OCaml top level (REPL)

OCaml comes with two compilers: for native code, and for byte code. We shall
use one of those in a moment. But first, let's use OCaml's top level (known as a
REPL in other languages), which we installed above:

```
$ utop
────────────────────────────────┬─────────────────────────────────────────────────────────────────────┬─────────────────────────────────
                                │ Welcome to utop version 2.8.0 (using OCaml version 4.11.1!          │                                 
                                └─────────────────────────────────────────────────────────────────────┘                                 
Findlib has been successfully loaded. Additional directives:
  #require "package";;      to load a package
  #list;;                   to list the available packages
  #camlp4o;;                to load camlp4 (standard syntax)
  #camlp4r;;                to load camlp4 (revised syntax)
  #predicates "p,q,...";;   to set these predicates
  Topfind.reset();;         to force that packages will be reloaded
  #thread;;                 to enable threads


Type #utop_help for help about using utop.

─( 12:12:45 )─< command 0 >──────────────────────────────────────────────────────────────────────────────────────────────{ counter: 0 }─
utop # 1 + 2 * 3;;
- : int = 7
```

We typed the phrase `1 + 2 * 3` and then signalled to OCaml that we had
finished by typing `;;` followed by the Enter key. OCaml calculated the
result, `7` and its type `int` and showed them to us. We exit by running the
built-in `exit` function with exit code 0:

```
─( 12:12:45 )─< command 1 >──────────────────────────────────────────────────────────────────────────────────────────────{ counter: 0 }─
utop # exit 0;;
$
```

Note that OCaml also has an older REPL, using the `ocaml` command. However, this
REPL does not have history or tab-completion, so we recommend always using utop.

## Using the Dune build system

Dune is a build system for OCaml. It takes care of all the low-level details of
OCaml compilation. We installed it with opam, above.

## A first project

Let's begin the simplest project with Dune and OCaml. We create a new directory
and ask `dune` to initialise a new project:

```
$ mkdir helloworld
$ cd helloworld/
$ dune init exe helloworld
Success: initialized executable component named helloworld
```

Building our program is as simple as typing `dune build`:

```
$ dune build
Info: Creating file dune-project with this contents:
| (lang dune 2.7)
Done: 8/11 (jobs: 1)
```

When we change our program, we type `dune build` again to make a new
executable. We can run the executable with `dune exec` (it's called
`helloworld.exe` even when we're not using Windows):

```
$ dune exec ./helloworld.exe
Hello, World!        
```

Let's look at the contents of our new directory. Dune has added the
`helloworld.ml` file, which is our OCaml program. It has also added our `dune`
file, which tells dune how to build the program, and a `_build` subdirectory,
which is dune's working space.

```
$ ls
_build		dune		helloworld.ml
```

The `helloworld.exe` executable is stored inside the `_build/default` subdirectory, so
it's easier to run with `dune exec`. To ship the executable, we can just copy
it from inside `_build/default` to somewhere else.

Here is the contents of the automatically-generated `dune` file. When we want
to add components to your project, such as third-party libraries, we edit this
file.

```
(executable
 (name helloworld))
```

## Editor support for OCaml

We installed the OCaml Language Server above with opam. With this tool, we get
editor support in **Visual Studio Code** and other editors which support the
Language Server Protocol.

Now, we will install the OCaml Platform Visual Studio Code extension from the
Visual Studio Marketplace.

Upon first loading an OCaml source file, you may be prompted to select the
toolchain in use: pick OCaml the version of OCaml you are using, e.g. 4.11.1
from the list. Now, help is available by hovering over symbols in your program:

![Visual Studio Code](/img/vscode.png "")

**On Windows using WSL2** you will remotely connect to your WSL2 instance from
Visual Studio Code. Microsoft have a [useful blog post](https://code.visualstudio.com/blogs/2019/09/03/wsl2)
covering getting WSL2 and Visual Studio Code connected.

**On Windows**, we must launch Visual Studio Code from within the Cygwin window,
rather than by clicking on its icon (otherwise, the language server will not be
found):

```
$ /cygdrive/c/Users/Frank\ Smith/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe
```

**For Vim and Emacs**, install the [Merlin](https://github.com/ocaml/merlin)
system using opam:

```
$ opam install merlin
```

The installation procedure will print instructions on how to link Merlin with
your editor.

**On Windows**, when using Vim, the default cygwin Vim will not work with
Merlin. You will need install Vim separately. In addition to the usual
instructions printed when installing Merlin, you may need to set the PATH in
Vim:

```
let $PATH .= ";".substitute(system('opam config var bin'),'\n$','','''')
```
