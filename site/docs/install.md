<!-- ((! set title Install OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Install OCaml
The OCaml compiler and libraries can be installed in several
ways. Broadly, the options are:

* use OPAM, a source package manager specific to OCaml, or
* use a package manager supported by your platform (Windows, Linux,
  Mac OS X,...), or
* install from source code.

The different options are detailed below. You can also find more
packages [here](/learn/libraries.html).



## OPAM

[OPAM](http://opam.ocaml.org/) is a package manager for OCaml, based
on the CUDF library developped by the Mancoosi project, which is,
among other things, used by Debian to manage their packages. It works
well on Unix, Linux, and Mac OS X systems. Windows support is comming
soon.
OPAM is written and maintained by [OCamlPro](http://www.ocamlpro.com/) and
[OCaml Labs](http://www.cl.cam.ac.uk/projects/ocamllabs/), and is free software
([commercial support](opam.ocamlpro.com) is available).

To get started, see
[Download and install OPAM](http://opam.ocaml.org/) and follow the
instructions.

For the impatient, do the following

Quick install:

```bash
$ wget http://www.ocamlpro.com/pub/opam_installer.sh
$ sh ./opam_installer.sh /usr/local/bin  # You can change the path to install it in an other place.
```
From source:

```bash
$ git clone https://github.com/OCamlPro/opam
$ cd opam
$ ./configure # (or ./configure --prefix=$HOME if you want to install under your $HOME)
$ make
$ make install
$ opam init
$ eval `opam config -env`
$ opam switch 4.00.1
```


## Debian
OCaml is very easy to install under [Debian](http://www.debian.org). We
recommend you install `ocaml-nox` to develop applications not needing
the graphics library or `ocaml` if you need the
[<code> Graphics</code>](http://caml.inria.fr/pub/docs/manual-ocaml/libref/Graphics.html)
module. We also recommend you install

* `ocaml-native-compilers` to be able to compile your program the
 native code (this is not available on some more obscure
 architectures).
* `ocaml-doc` to have the reference manual.
* `tuareg-mode`, a Emacs mode for OCaml.
* `ocaml-findlib` and `oasis` to install and use libraries (and their
 dependencies) easily.
* `libpcre-ocaml-dev` which is a binding to PCRE.

Check the [packages available in
Debian](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all).

## Ubuntu
[Ubuntu](http://www.ubuntu.com/) being a derivative of Debian, it
inherits its ease of install of [OCaml
packages](http://packages.ubuntu.com/search?keywords=ocaml). The same
recommendations as for Debian hold.

## Fedora
Since [Fedora 8](http://fedoraproject.org/), Fedora has excellent
support for OCaml in the basic distribution. There is an active group of
maintainers who keep up to date with the latest OCaml, and there is a
wide range of packages available.

To install the OCaml compiler just do:

```bash
yum install ocaml
```
To install an OCaml library called '`foo`', and any dependencies it
needs, you would do:

```bash
yum install ocaml-foo-devel
```
A good set of basic development libraries can be installed by doing:

```bash
yum install ocaml-camlp4-devel ocaml-ocamldoc ocaml-findlib-devel \
   ocaml-extlib-devel ocaml-calendar-devel
```
To list all OCaml packages use:

```bash
yum search ocaml
```
**Packaging policy and mailing lists**

* [OCaml packaging
 policy](http://fedoraproject.org/wiki/Packaging/OCaml) in Fedora.
 All Fedora OCaml packages have to obey this policy, ensuring a
 minimum standard for all OCaml packages we ship.
* [OCaml Special Interest
 Group](http://fedoraproject.org/wiki/SIGs/OCaml).
* [fedora-ocaml-list](https://www.redhat.com/mailman/listinfo/fedora-ocaml-list):
 mailing list for people interested in OCaml on Fedora or Red Hat
 Enterprise Linux.

## FreeBSD
[FreeBSD](http://www.freebsd.org/) had a great support for OCaml
development for a long time. There are easy to use packages available
for most popular platforms (i386, amd64, powerpc, sparc64) for both the
core languages and supplimentary libraries, documentation, examples and
development tools. There is a framework available to make adding new
ocaml application and libraries easy.

To install the OCaml compiler using packages do:

```bash
pkg_add -r ocaml
```
or

```bash
pkg_add -r ocaml-nox11
```
to install OCaml without X11-dependent libraries (e.g. to deploy on a
headless server).

To install the developer documentation, examples and emacs editing
macros use the `ocaml-doc`, `ocaml-examples` and `ocaml-mode.el`
packages.

The same packages can be installed via the port system. There is a a
large set of libraries available in the `devel` category of the ports
system as well as in the specific topic-related categories.

## Gentoo
In order to get the basic tools under
[Gentoo](http://gentoo-portage.com/dev-ml/), execute:

```bash
emerge ocaml  
```
while being logged in as a user that is a member of the `portage` group
(e.g. root). If you want to see what other related packages are
available execute

```bash
emerge -S ocaml 
```
## SuSE
Getting Started with OCaml on [SuSE](http://www.suse.com/) is part in
the standard distribution. In openSuse 12.1, the package name is
`ocaml-3.12.0-11.1.2` (outdated).

## Mageia
[Mageia](http://www.mageia.org/) has some support for OCaml in the
distribution.

To install the OCaml compilers just do:

```bash
urpmi ocaml-compiler
```
ocaml-compiler has no dependency on X11 libs, to install the libs that
have some (for example the module Graphics):

```bash
urpmi ocaml-x11
```
To install camlp4:

```bash
urpmi camlp4
```
To install an OCaml library called '`foo`', and any dependencies it
needs, you would do:

```bash
urpmi ocaml-foo-devel
```
A good set of basic development libraries can be installed by doing:

```bash
urpmi camlp4-devel ocaml-doc ocaml-findlib-devel \
  ocaml-extlib-devel ocaml-extlib-doc ocaml-batteries-devel \
  ocaml-ounit-devel ocaml-sexplib-devel ocaml-xml-light-devel \
  ocamlmakefile
```
To list OCaml packages use:

```bash
urpmq --list | grep ocaml
```
**Packaging policy**

* [OCaml packaging policy](https://wiki.mageia.org/en/OCaml_policy) in
 Mageia. All Mageia OCaml packages have to obey this policy, ensuring
 a minimum standard for all OCaml packages we ship.

## Windows
Four ports of OCaml for Microsoft Windows are currently available. For
additional information, please consult the list of [portability
issues](/learn/portability.html) or the [Windows release
notes](http://caml.inria.fr/pub/distrib/ocaml-4.00/notes/README.win32).

* [Cygwin-based native Win32 port
 (4.00.1)](http://protz.github.com/ocaml-installer/). A self
 installer. The interactive loop comes with a simple graphical user
 interface. Some features require the Cygwin environment, which the
 installer can fetch for you. However, the compilers are, and
 generate true Win32 executables, which do not require Cygwin to run.
* Microsoft-based native Win32 port. No binary distribution available
 yet; download the source distribution and compile it.
* [Cygwin](http://cygwin.com/)-based port. Requires Cygwin. No
 graphical user interface is provided. The compilers generate
 executables that do require Cygwin. The precompiled binaries are
 part of the Cygwin distribution; you can install them using the
 Cygwin `setup` tool. Alternatively, download the source distribution
 and compile it under Cygwin.
* Microsoft-based native Win64 port Same features as the
 Microsoft-based native Win32 port, but generates 64-bit code. No
 binary distribution available yet; download the source distribution
 and compile it.

To install libraries, you may use
[Wodi](http://wodi.forge.ocamlcore.org/) or OPAM.

## Mac OS X
Under Mac OS X, there are, at least for the base package, a few different
ways to go: Use OPAM; Install the binary package from Inria; Install via Fink;
Install via MacPorts; or build it manually from
sources. For each of these approaches, you will need to have at least
the OS X developer tools installed — any other requirements will be
discussed below.

###  Inria's binary package
This is the easiest way to set up a basic OCaml installation for OS X.
For 10.4 (Tiger), simply [download](../releases/) Intel disk image, mount
the disk image, double-click on the ocaml.pkg file contained within, and
follow the instructions from there. Requirements for this package are OS
X 10.4.x (Tiger), with X11 and the XCode tools (v2.4) installed. It
appears that that this installation was built with the TCL/TK interface.
Also, X11 is not needed to compile code.

Also available as a binary package, and usable with any of the OCaml
installations described on this page is
[CocOCaml](http://www.cs.unm.edu/~wneumann/cococaml/), a Cocoa
application allowing for easy interaction with the OCaml toplevel
environment.

###  Fink
[Fink](http://fink.sourceforge.net/ "Fink") is the most prevalent
package management system for OS X, and is based on Debian's package
management system. Fink can be installed by downloading and building the
[source
release](http://fink.sourceforge.net/download/srcdist.php?phpLang=en)
(you will need to have the OS X Developer Tools installed before
building Fink). After Fink is installed, it must be [configured to use
the unstable
branch](http://fink.sourceforge.net/faq/usage-fink.php#unstable) of the
distribution tree -- this is where the OCaml packages reside.

Once Fink is installed, you can [use it to
install](http://fink.sourceforge.net/doc/users-guide/index.php) the
following packages:

* `ocaml` The basic installation of the ocaml tools including labltk.
* `lablgl` The OCaml interface to OpenGL
* `lablgtk` The OCaml interface to gtk+
* `ledit` An optional line editor for OCaml to make it easier to work
 with the interactive toplevel in the terminal.

It is likely that Fink will need to download and install a number of
other packages required to build the OCaml packages, but this will occur
mostly automatically.

### MacPorts
[MacPorts](http://www.macports.org/), formerly known as DarwinPorts, is
a package management system for Mac OS X based on the BSD ports system.
You will need to have the OS X Developer Tools installed before
[installing](http://www.macports.org/?page_id=48) MacPorts. MacPorts can
be used to download and build the following packages:

* `ocaml` The basic installation of the ocaml tools including labltk.
* `lablgl` The OCaml interface to OpenGL
* `lablgtk` The OCaml interface to gtk+
* `lablgtk2` The OCaml interface to gtk+ 2.x
* `cryptokit` An OCaml interface to several cryptographic functions.
* `ocaml-mode.el` An EMACS major mode for editing OCaml programs.
* `tuareg-mode.el` A GNU Emacs/XEmacs major mode for editing OCaml
 programs.



### Building from sources
Unfortunately, the packages available for both Fink and DarwinPorts
don't yet include some of the more useful additions to the OCaml
collection, such as Markus Mottl's PCRE-Ocaml library or Stolpmann's
findlib system. In order to get those packages, one must currently build
them from source.

The following packages are the most beneficial to install:

* [The OCaml source distribution.](../releases/)
* [Findlib](http://www.ocaml-programming.de/programming/findlib.html),
 an OCaml library management system.
* [Batteries](http://batteries.forge.ocamlcore.org/), a collection of
 libraries that extend and improve upon the OCaml Standard Library
* [PCRE-OCaml](http://www.ocaml.info/home/ocaml_sources.html), a
 library for working with Perl Compatible Regular Expressions in
 OCaml (this will require you to build [the PCRE
 library](http://www.pcre.org/) as well).
* [OCamlMakefile](http://www.ocaml.info/home/ocaml_sources.html) which
 makes it easy to create makefiles for OCaml projects.

If additional components, such as OpenGL and Gtk+ or Gtk+2 have already
been installed, packages such as
[lablgl](http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgl.html),
[lablgtk](http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgtk.html),
etc. can be built as well. The most flexible solution for doing this is
often using Fink to install the required dependencies, and build the
OCaml packages from source distributions.

###  Using Xcode for writing OCaml programs
There exists an Xcode plugin integrating OCaml developement in Xcode.
This plugin is always under development and still lacks of features,
however it gives useful features for developing applications:

* create a OCaml projet or target with Xcode
* add files to this target like you do for a C program
* modify the OCaml compiler or linker settings through the Xcode's
 build-in build setting GUI.
* adding a library in library build phase of a OCaml target
* syntax higlighting
* use ocamllex and ocamlyacc
* use of the native compiler (select architecture "ppc" instead of the
 default "ocaml")
* dependance between source files
* mixing OCaml and C code

Still being in beta it does not yet support the following:

* better dependance between source files (you must put them manually
 in the good order in the target build phase)
* targeting the intel procs (only bytecode &amp; ppc support at this time)
* ocamlp4 preprocessor
* debugging from Xcode (but possible with direct use of ocamldebug)

[Download and information](http://maxao.free.fr/xcode-ocaml-plugin/).

###  Using labltk with OS X
There are a couple of different ways one can go if they wish to use
labltk with OS X. One could download and build the Tcl/Tk libraries
themselves and use those libraries. However, there are two easier ways
to proceed, using [Fink](http://fink.sourceforge.net/) to install
Tcl/Tk, or using the [Tcl/Tk Aqua](http://tcltkaqua.sourceforge.net/)
Framework. There are two very important distinction between the two that
one needs to consider before installing OCaml and labltk:

1. The fink libraries require X11 to be running when any program using
 labltk is executed, while the Tcl/Tk Aqua libraries will execute
 (and look and feel) like a native OS X application
1. As of the time of writing this, it appears as if labltk applications
 built with the Tcl/Tk Aqua libraries *must* be built as native OS X
 applications (and require an extra step at build time). If one
 requires the portability of bytecode, or needs the interactive
 environment of a labltk enabled toplevel, then they *must* use the
 fink libraries.

####  Installing the fink libraries
Once Fink is [installed and
configured](http://fink.sourceforge.net/doc/index.php?phpLang=en),
install the Tcl/Tk libraries with the command
`fink install tcltk tcltk-dev     tcltk-shlibs` and wait for the build
and install process to compete. Once this is done, OCaml's configure
script should be able to locate the libraries and header files required
to build labltk (provided fink is set up to install its packages in the
/sw directory). Running the standard OCaml build will also build labltk.

#####  Installing the Tcl/Tk Aqua libraries
This framework comes with OS X 10.4 and later. Configure the OCaml build
by using the following flags:

```bash
./configure -tkdefs \
  "-I/Library/Frameworks/Tcl.framework/Headers \
  -I/Library/Frameworks/Tk.framework/Headers" \
  -tklibs "-framework Tcl -framework Tk" 
```
Now building OCaml will also build labltk using the Tcl/Tk Aqua
libraries.

As mentioned above, any programs using labltk must be compiled using
`ocamlopt`, and an additional step must be performed before the
application can be used. For example, with the simple program,
`hello.ml`:

```ocaml
open Tk;;
let hello () =
  print_endline "Hello!"; flush stdout in
let top = openTk () in
let hb =
Button.create ~text:"Hello" ~command:hello top in
pack [hb];
mainLoop ()       
```
One would compile this program with the command
`ocamlopt -o hello -I +labltk labltk.cmxa     hello.ml`

Now, to make the program work properly, one must perform one of two
additional steps: adding a resource fork to the executable, or building
a Mac OS X .app structure.

To add a resource fork, one needs to use the program `Rez`, included in
the OS X Developer tools. This can be done with the following command:

```bash
/Developer/Tools/Rez -t APPL -o hello ~/dev/mac.r \
  -i /Library/Frameworks/Tcl.framework/Headers \
  -i /Library/Frameworks/Tk.framework/Headers   
```
Where mac.r is a Rez source file. It is part of the
[FLTK](http://www.fltk.org/) distribution. This will add the required
resource fork to the hello application. The program can be run either by
typing `hello` at the command line or by double-clicking the app's icon
(note that if it is launched by double-clicking, hello will send its
output to the OS X console rather than the terminal).

Unfortunately, files with resource forks can present a problem in that
utilities like `cp, mv, tar`, etc. will strip the resource fork from the
file, breaking the application. To aleviate this problem, one can build
an OS X application bundle to wrap the compiled executable.

To do this, after compiling with
`ocamlopt -o hello -I     +labltk labltk.cmxa hello.ml`, the following
steps will build the bundle:

```bash
mkdir hello.app
mkdir hello.app/Contents
mkdir hello.app/Contents/MacOS
mv hello hello.app/Contents/MacOS  
```
Next, create a file `hello.app/Contents/Info.plist` with the following
contents:

```
<?xml version="1.0" encoding="UTF-8"?>
<plist version="1.0">
 <dict>
   <key>CFBundleExecutable</key>
   <string>hello</string>
 </dict>
</plist>        
```
The hello application can now be run from the command line by typing
`open hello.app`, or by double-clicking on the app's icon (again, this
will send hello.app's output to the console).

###  Tips
**Documentation.** To get quick access to the documentation of a module
(whatever the editor you use) use
[Quicksilver](http://quicksilver.blacktree.com/) to index the libref/
directory of ocaml's documentation. Since ocamldoc generates the
documentation of a module M in a file M.html, you can access it by
invoking Quicksilver, type an abbreviation of the module's name you want
and hit return to get its html file loaded in your preferred browser.

**Profiling.** To profile native-code programs *do not* compile them
with the option -p (this is unsupported) simply use Shark. Shark can be
invoked directly from the command line as follows :

```bash
shark -i -1 -q myprogram.opt args   
```
This will write a .mshark file in the directory that you can open with
Shark.app.

```bash
open *.mshark  
```
Note that if your executable doesn't run for long enough Shark won't be
able to take any samples and won't report any statistics. More function
names will show up in the profiles if you compile with `-g`.

## Oasis-DB
See [here](http://oasis.ocamlcore.org/).

## ODB
See [here](https://github.com/thelema/odb).

## ocamlbrew
See [here](https://github.com/hcarty/ocamlbrew).


## From Source
Download the [latest development version](/releases/svn.html) using
subversion and follow the instructions included therein. This is
unlikely the method you want to use unless you are a developer of the
OCaml compiler itself or trying to install on some esoteric platforms.
