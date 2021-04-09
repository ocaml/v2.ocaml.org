<!-- ((! set title Setting up with OASIS !)) ((! set learn !)) -->

*Table of contents*

# Setting up an OCaml project with OASIS

[OASIS](https://github.com/ocaml/oasis) allows to give a high level description of your project and will generate a build system and packaging information for you. It allows to set up a project in a quick and simple way. The goal of this tutorial is not to explain all the details of OASIS, but to provide the necessary information to setup a project.

## Getting started

You first need to install OASIS. The preferred way is with opam:

```
opam install oasis
```

You can also install it under debian-based system.

```
sudo apt-get install oasis
```

Finally, installation instructions are available on [OASIS's main page](https://github.com/ocaml/oasis).

### What is your project ?

Your project description is going to be located in an `_oasis` file, at the root of your project. Let's start by a general description of your project!

```oasis
Name: FooBar
Version: 0.1
Synopsis: A library about Foo and Bar.
Authors: Me <me@myhost.com>
License: LGPL with OCaml linking exception

Description: FooBar allows to combine foo and bar efficiently. It also allows to interface with baz.
Homepage: http://foobar.org
```

This description might seem unnecessary at first, but will be mandatory if you want to package and distribute your library later on. It's also a nice source of information for the interested user.

Only the first set of field is mandatory. You can find a list of all the available licenses [here](https://github.com/ocaml/oasis/blob/master/doc/MANUAL.mkdl#license).

### A little bit of OASIS boilerplate

OASIS needs some information to proceed. We will come back and explain the details [later on](#PluginsandFeatures). Just copy this part to your `_oasis` for now.

```oasis
OASISFormat: 0.4
BuildTools: ocamlbuild
Plugins: META (0.4), DevFiles (0.4)
```

From now on, we will assume that the `_oasis` contains everything described previously.


## The meat of your project

### An executable

An `_oasis` file is organized in sections, each section defining a small part of your project. `_oasis` files are white-space sensitive, fields in a section must be properly indented.

We will start by defining an executable `foo` with sources located in an `src` directory.

```oasis
Executable "foo"
  Path: src
  MainIs: foo.ml
```

Now that the `_oasis` file is defined, we can generate a build system. At the root of your project, run the following command:

```
oasis setup -setup-update dynamic
```

This will produce the following files : `setup.ml`, `configure` and a `Makefile`.
These files are the only one necessary for OASIS to work, and you should put only those in a version control system. OASIS will produce some other files during building that you can safely ignore. More details about the various OASIS files are given [here](#Theoasisfiles).

You can now build your project by running:

```
make
```

It will produce the `foo.byte` file than you can execute.

To produce native executables and use external libraries, we add some fields to the section:

```oasis
Executable "foo"
  Path: src
  MainIs: foo.ml
  CompiledObject: best
  BuildDepends:
    some_lib,
    some_other_lib
```

`CompiledObject` can take the values `byte`, `native` or `best`. `best` is equal to `native` if it is available or `byte` otherwise. When the compilation is native, the produced binary is called `foo.native`.
`BuildDepends` is a comma separated list of ocamlfind packages. [ocamlfind](//ocaml.org/learn/tutorials/dev_tools.html#Findlibocamlfind) handles packages locally in your system and is used by opam. You can list ocamlfind packages with `ocamlfind list`.

### Defining libraries

To define a library, we use the `Library` section. Here we will define two libraries with some inter dependencies.

```oasis
Library "foo"
  Path: foo_src
  Modules: Foo
  InternalModules: InternalFoo

Library "bar"
  Path: bar_src
  Modules: Bar
  InternalModules:
    InternalBar, InternalFooBar
  BuildDepends: foo, unix
```

As you can see, `BuildDepends` is also used for intra-project dependencies: the bar library is dependent on the foo
library. `Modules` and `InternalModules` are comma separated list of modules. They should contain only capitalized name
with no file extensions. They can include module provided by any type of file, being `.ml`, `.mli`, `.mll` or `.mly`
(for [ocamllex, ocamlyacc](/releases/{{! get LATEST_OCAML_VERSION_MAIN !}}/htmlman/lexyacc.html) and
[menhir](http://cristal.inria.fr/~fpottier/menhir/)). `InternalModules` is used to list modules that are part of the
library but should be kept hidden and not be part of the public interface of the library.

`make` builds the various libraries and `make install` installs them. OASIS handles the installation using ocamlfind.

### Other optional sections

Executable and Library are enough to create a basic project. The following sections allow to provide more information
and build extra things to distribute your project.

#### Documentation

Documentation is a very important part of a library. OASIS allows to build an
[ocamldoc](/releases/{{! get LATEST_OCAML_VERSION_MAIN !}}/htmlman/ocamldoc.html)-powered HTML documentation for the
complete project quite easily.

```oasis
AlphaFeatures: ocamlbuild_more_args
Document "foobar_api"
  Type: ocamlbuild (0.4)
  BuildTools: ocamldoc

  Title: API reference for FooBar
  XOCamlbuildPath: .
  XOCamlbuildExtraArgs:
    "-docflags '-colorize-code -short-functors -charset utf-8'"
  XOCamlbuildLibraries: foo, bar
```

The important part is the `XOCamlbuildLibraries` field, which is a list of ocamlfind libraries defined in the `_oasis`
file. `XOCamlbuildExtraArgs` allows to give some ocamldoc command line flags. Those presented here are considered
essential. Running `make doc` will create a folder `foobar_api.docdir` which contains the documentation as HTML files.

#### SourceRepository and `.gitignore`

As meta-data, OASIS also allows to define the address of the source repository. This can be used by packaging tools.

```oasis
SourceRepository master
  Type: git
  Location: https://my_git_host.org/foobar.git
  Branch: master
  Browser: https://my_git_host.org/foobar
```

While we are on the subject of version control system, here is an example of `.gitignore` file that will ignore just the
right file for your project using OASIS.

```.gitignore
_build
*.native
*.byte
*.docdir

setup.data
setup.log
```

## Going further

You now should be able to build simple projects with OASIS.
You should also know enough to browse the
[The official OASIS documentation](https://github.com/ocaml/oasis/blob/master/doc/MANUAL.mkd) and look at
[some examples](#Examples) to find out the various fields you can put in an `_oasis` file.

However, OASIS has more features!

### Sub libraries and OCamlfind manipulations

OCamlfind allows to organize libraries into hierarchies, for example let's look at some of lwt's ocamlfind libraries:
```
lwt
lwt.extra
lwt.glib
lwt.preemptive
lwt.syntax
lwt.syntax.log
lwt.syntax.options
```

It is possible to define such hierarchy in OASIS using two additional fields: `FindLibName` and `FindLibParent`.
Let say we want to isolate the core of `foo` in a library `foo.core`:

```oasis
Library "foo_core"
  FindLibName: core
  FindLibParent: foo
  Path: foo
  Modules: Foo

Library "foo"
  Path: foo
  Modules: FooMore
  BuildDepends: foo.core
```

### Flags and conditional compilation

OASIS allows to define a set of flags that can be activated by the user or by a package manager like opam.

```oasis
Flag "with-baz"
  Description: Build baz support for bar
  Default: false
```

`configure --enable-with-baz` will turn this flag on. Be careful that `_` will be turned into `-` in the command line option.

You can then condition the build of some library or executable by this flag.

```oasis
Library "bar_with_baz"
  Build$: flag(baz)
  FindLibName: baz
  FindLibParent: bar
  Path: bar
  Modules: BarBaz
  BuildDepends: bar, baz
```

Notice the `$:` which is specific for boolean fields.
Conditional values are explained in details [here](https://github.com/ocaml/oasis/blob/master/doc/MANUAL.mkd#conditional-value).

### Tests

OASIS can also handle tests, be them unit tests or not. First we want to test our `foo` executable defined earlier.

```oasis
Test "test_foo"
  TestTools: foo
  Command: $foo test/some_test_input
```

`TestTools` allows to give the dependency.
To enable and run the tests, run `configure --enable-tests` and `make test`. Tests are disabled by default.

For unit testing, we can declare an executable only for tests, using the [oUnit](https://github.com/gildor478/ounit)
testing framework for example, and a test using it. For this, we use the predefined flag `tests`.

```oasis
Executable "test_bar_and_baz"
  Path: test
  MainIs: test_bar.ml
  Build$: flag(tests) && flag(baz)
  CompiledObject: best
  Install: false
  BuildDepends: bar, baz, bar.baz, oUnit

Test "test_bar_and_baz"
  Run$: flag(tests) && flag(baz)
  TestTools: test_bar_and_baz
  Command: $test_bar_and_baz
  WorkingDirectory: test
```

### Syntax extensions

#### Using a syntax extension

Camlp4 syntax extensions are almost always bundled as ocamlfind subpackages finishing in `.syntax`. When this is the case, we can just add the name of the package as a dependency:

```oasis
Library "foo"
  Path: foo
  Modules: FooMore
  BuildDepends: foo.core, lwt, lwt.syntax
```

OASIS will deduce that camlp4 must be used.

If the package's name doesn't end by `.syntax` (which is pretty unlikely), you can add this to the `_tags` file, outside of the OASIS section (`OASIS_START`/`OASIS_STOP`):
```
true: syntax(camlp4o)
```
See [this section](#Ocamlbuild) for details about the `_tags` file.

#### Creating a syntax extension

To define a syntax extension, we must define the special properties `XMETAType`:

```oasis
Library "foo_syntax"
  Path: foo_syntax
  FindLibName: syntax
  FindLibParent: foo
  Modules: Pa_foo
  BuildDepends: campl4
  XMETAType: syntax
```

This will ensure that this library is properly packaged by ocamlfind as a syntax extension.


### Interfacing with C code

To build a joint library with OCaml and C code, we can use the `CSources` field.
The `CCLib` allows to link against C libraries and the `CCOpt` field allows to pass options to the C compiler.

```oasis
Library "foo-with-C"
  Path: lib
  Modules: FooC
  CSources: fooC_stubs.c, fooC_stubs.h
  BuildDepends: foo
  CCLib: -lfoo
  CCOpt: -O2 -Wall -Wextra -Wno-unused-parameter # Better safe than sorry.
```

You should be careful not to call your C files the same as your OCaml files, in order to avoid clashes between `.so` generated files. The usual idiom is to append `_stubs` to the name.

For details about C bindings, you can consult [this tutorial](calling_c_libraries.html).

## Wrapping up a package

Earlier, we generated the build system with the command line `oasis setup -setup-update dynamic`. This `dynamic` feature means that OASIS will be called to regenerate the build system when the `_oasis` file changes. It also produces very few and small files. This means that it's very convenient for the developer. However, it makes the build system dependent on OASIS, which is not acceptable for releases.
In order to generate an OASIS independent build system, you can simply run `oasis setup`. You can learn more about this [here](#Setupoptions).

The OASIS description file can be used to generate packages. Two tools are available for that:
[oasis2opam](https://github.com/ocaml/oasis2opam) will generate an opam descriptions and
[oasis2debian](https://github.com/ocaml/oasis2debian) for `.deb` packages. Of course, don't forget to use the
_non dynamic_ setup before packaging, as describe earlier, or the package will need OASIS to be build.


## Examples

OASIS is better learned by examples `_oasis` files you can copy and tweak. OASIS sources contain a gallery of [very instructive examples](https://github.com/ocaml/oasis/tree/master/examples).

However, nothing is better than real world examples:
- [ocaml-inotify](https://github.com/whitequark/ocaml-inotify/blob/master/_oasis) contains a very simple yet feature-full `_oasis` file that will showcase all the various elements explained in this tutorial.
- [batteries](https://github.com/ocaml-batteries-team/batteries-included) uses OASIS for meta-data only and handles the build system separately using the `XCustom` fields.
- [Some other examples](https://github.com/ocaml/oasis/tree/master/examples).


## Under the hood

This section aims to explain in slightly greater depth some of the technical details behind OASIS.

### Ocamlbuild

OASIS uses [ocamlbuild](//ocaml.org/learn/tutorials/dev_tools.html#ocamlbuild) as underlying build system. This has several consequences.
- Compilation is done in the `_build` directory, not in the sources itself. binaries and documentations target are symlinked to the root directory of the project, in order to be accessible directly.
- Some options and customization of the build system are only available by modifying the `myocamlbuild.ml` and `_tags` files.
Those files are partially generated by OASIS so, if you modify them, you should keep the OASIS section. If the setup was dynamic, this files are not present at all, you should then add the section yourself.


For `myocamlbuild`:
```ocaml
(* OASIS_START *)
(* OASIS_STOP *)
```
For `_tags`:
```conf
# OASIS_START
# OASIS_STOP
```

### The OASIS files

OASIS generates all the file needed by an OCaml installation, which is quite an important amount. In this section, we will give a detailed description of each files.

All these files will contain an OASIS section that should not be modified.

- OASIS
 - `setup.ml` contains the logic of the build system.
 - `Makefile` and `configure` are convenient files produced by the plugin `DevFiles`. They call `setup.ml`.
 - `setup.log` is produced by the configure step.
 - `setup.data` is produced during the build process.

- OCamlbuild
 - `_tags` allows to give specific options to the various file in your project.
 - `myocamlbuild.ml` allows to customize the build system by using Ocamlbuild's library.
 - `*.mllib`, `*.mldylib` and `*.clib` are targets that indicate how to build the various sub libraries.

- OCamlfind
 - `META` is the library specification for ocamlfind.

### Setup options

`oasis setup` accepts an option `-setup-update` defined in the help as:

```
  -setup-update {none|weak|dynamic}  Define the way `setup.ml` should update
                                     when `_oasis` change.
```

This option allows to adapt the way OASIS will generate the build system according to your needs.
- `none`, the normal mode, will generate all the files presented in the previous section and their content. The build system generated will be independent of OASIS and will only need Ocamlbuild.

- `dynamic` will only generate three files : `setup.ml`, `configure` and `Makefile`.
Other files are dynamically created when building.
These three files are quite small (especially `setup.ml`) and are not going to be modified. Hence they can be safely pushed into a repository.
If you want to include some code in `_tags` for example, just put an empty OASIS section, as described [here](#Ocamlbuild), and OASIS will dynamically populate it at runtime.
This allows to push only the minimum amount of generated file in the repository and is very convenient for developing. The downside is that this setup need OASIS to be installed.

### Plugins and Features

We used during this tutorial some plugins without explaining exactly what they do. We will give here a brief description of each of these plugins, plus some other potentially useful ones.

- [Plugins](https://github.com/ocaml/oasis/blob/master/doc/MANUAL.mkd#plugins) (the `Plugins` field):
 - `META` makes OASIS generates the `META` file used by ocamlfind.
 - `DevFiles` makes OASIS generates `configure` and `Makefile`.
 - `StdFiles` makes OASIS generates `README.txt`, `INSTALL.txt` and `AUTHORS.txt` using the metadatas contained in `_oasis`.

- [Features](https://github.com/ocaml/oasis/blob/master/doc/MANUAL.mkd#features) (`AlphaFeatures` and `BetaFeatures` fields) are various recent additions to OASIS that are not completely battle-tested.
We give here only those that are stable enough to be used.
Note that they will be integrated into OASIS properly in a short to mid term.
 - `ocamlbuild_more_args` (alpha) enables the `XOCamlbuildExtraArgs` field that allows to provide arguments to Ocamlbuild directly. It's a way to internalize in `_oasis` some information that would be in `_tags` otherwise.
 - `compiled_setup_ml` (alpha) will make OASIS compiles the `setup.ml` file instead of interpreting it, giving a significant speed up.
 - `pure_interface` (alpha) is necessary to be able to compile standalone `.mli` files (without any `.ml`). This feature is used in tyxml for example.
 - `stdfiles_markdown` (alpha) makes OASIS generate StdFiles in markdown format.
