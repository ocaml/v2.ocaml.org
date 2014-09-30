<!-- ((! set title Install OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Install OCaml
The OCaml compiler and libraries can be installed in several
ways. Broadly, the options are:

* use OPAM, a package manager specific to OCaml
* use a package manager supported by your platform (Windows, Linux,
  Mac OS X, ...)
* install from source code.

The following sections explain how to use each of these methods.
For additional information about finding and installing OCaml libraries,
see the [libraries](/learn/libraries.html) page.

## OPAM

[OPAM](http://opam.ocaml.org/) is a package manager for OCaml. It is the recommended method to install the OCaml compiler and OCaml
packages. The default OPAM
[repository](http://opam.ocaml.org/packages/) is actively maintained
and serves as the de facto master set of OCaml packages. OPAM also
provides features that would be unavailable with the other methods,
such as the ability to have multiple versions of OCaml installed at
the same time, or have multiple universes of packages for different
projects with conflicting package dependencies.

Note that there is a bootstrapping issue, since OPAM is itself
implemented in OCaml. To address this, binary OPAM packages are made
available on many platforms. See
[here](http://software.opensuse.org/download.html?project=home%3Aocaml&package=opam)
and below, in the platform specific sections, for installation
instructions. Alternatively, you can compile from source by grabbing
one of the recent
[releases](https://github.com/ocaml/opam/releases). More information
is available in the [Quick
Install](http://opam.ocaml.org/doc/Quick_Install.html) and [Advanced
Install](http://opam.ocaml.org/doc/Advanced_Install.html) pages.

Once you have OPAM installed, the `switch` and `install` commands are
the ones you're likely to need first. For example:

```
opam switch 4.02.0
eval `opam config env`
```

will compile OCaml 4.02.0 and install it in a location managed by
OPAM. The second line assures you are now using this version of the
compiler. You can skip this step if you're happy with the version of
OCaml available on your system , but this lags substantially on many
platforms.

Next you can install packages, e.g.

```
opam install batteries core
```

will install Batteries and Core, two widely used standard
libraries. See the main [repository](http://opam.ocaml.org/packages/)
to find hundreds more, and visit [OPAM's main
page](http://opam.ocaml.org/) to learn about many additional features.

OPAM is based
on the CUDF library developed by the Mancoosi project, which is,
among other things, used by Debian to manage their packages. It works
well on Unix, Linux, and Mac OS X systems. Windows support is comming
soon.
OPAM is written and maintained by [OCamlPro](http://www.ocamlpro.com/) and
[OCaml Labs](http://www.cl.cam.ac.uk/projects/ocamllabs/), and is free software
([commercial support](http://www.ocamlpro.com/) is available).


## Debian
OCaml is very easy to install on [Debian](http://www.debian.org).

```
apt-get install ocaml
```

If you are not going to develop graphical applications, you may want
to install `ocaml-nox`; otherwise install the `ocaml` package.

We also recommend you to install the following packages:

* `ocaml-native-compilers` to be able to compile native binaries
 (this is not available on some more obscure
 architectures).
* `ocaml-doc` to have the reference manual.
* `tuareg-mode`, an Emacs mode for OCaml.
* `ocaml-findlib` and `oasis` to install and use libraries (and their
 dependencies) easily.
* `libpcre-ocaml-dev` which is a binding to PCRE.

Check the [packages available in
Debian](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all).

## Ubuntu
[Ubuntu](http://www.ubuntu.com/) is a Debian derivative and uses the same package 
manager, so Debian instructions are applicable to it too.

You can view the list of OCaml packages in Ubuntu repositories
[here](http://packages.ubuntu.com/search?keywords=ocaml).

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
* [fedora-ocaml-list](https://lists.fedoraproject.org/mailman/listinfo/Ocaml-devel):
 mailing list for people interested in OCaml on Fedora or Red Hat
 Enterprise Linux.

## FreeBSD
[FreeBSD](http://www.freebsd.org/) had a great support for OCaml
development for a long time. There are easy to use packages available
for most popular platforms (i386, amd64, powerpc, sparc64) for both the
core languages and supplimentary libraries, documentation, examples and
development tools. There is a framework available to make adding new
ocaml application and libraries easy.

To install the OCaml compiler from packages, do:

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

The same packages can be installed via the port system. There is a
large set of libraries available in the `devel` category of the ports
system as well as in the specific topic-related categories.

## Gentoo
In order to get the basic tools under
[Gentoo](http://www.gentoo.org/), execute:

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
OCaml can be installed from the repositories on both OpenSuSE and SLES:

```
zypper install ocaml
```

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
To list OCaml packages, use:

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
 (4.00.1)](http://protz.github.io/ocaml-installer/). A self
 installer. The interactive loop comes with a simple graphical user
 interface. Some features require the Cygwin environment, which the
 installer can fetch for you. However, the compilers are true Win32 executables,
 and binaries they generate do not require Cygwin to run too.
* Microsoft-based native Win32 ports. No binary distributions
 available yet; download the source distribution and compile it. Build
 instructions including required tools (Cygwin required) and download
 links in the source distribution (README.win32).
  - Configurations supported include 32-bit/64-bit;
  - Microsoft toolset support provided by Windows 7 SDK;
  - Tested with XP/Windows 7/Windows 8.1.
  - On Windows 8.1
    - Cygwin chmod 0600 appears broken : comment L367 of Makefile.nt
       (@chmod -w utils/config.ml);
    - This same problem with Cygwin chmod also affects ssh
      configuration setup (may affect interaction with github
      projects). See [this page](http://superuser.com/questions/397288/using-cygwin-in-windows-8-chmod-600-does-not-work-as-expected)
      for a suggested workaround.
* [Cygwin](http://cygwin.com/)-based port. Requires Cygwin. No
 graphical user interface is provided. The compilers generate
 executables that do require Cygwin. The precompiled binaries are
 part of the Cygwin distribution; you can install them using the
 Cygwin `setup` tool. Alternatively, download the source distribution
 and compile it under Cygwin.

To install libraries, you may use
[Wodi](http://wodi.forge.ocamlcore.org/) or OPAM.

## Mac OS X
On Mac OS X, there are, at least for the base package, a few different
ways to go: Use OPAM; Install the binary package from Inria; Install via Fink;
Install via MacPorts; or build it manually from
sources. For each of these approaches, you will need to have at least
the OS X developer tools installed — any other requirements will be
discussed below.

If you want a graphical interface for the interactive interpreter,
you may use [CocOCaml](http://www.cs.unm.edu/~wneumann/cococaml/).
It will work with any OCaml installation, regardless of the installation
method you choose.

###  Inria's binary package
This is the easiest way to set up a basic OCaml installation for OS X.
For 10.4 (Tiger), simply [download](../releases/) Intel disk image, mount
the disk image, double-click on the ocaml.pkg file contained within, and
follow the instructions from there. Requirements for this package are OS
X 10.4.x (Tiger), with X11 and the XCode tools (v2.4) installed. It
appears that that this installation was built with the TCL/TK interface.
Also, X11 is not needed to compile code.

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

### Homebrew
[Homebrew](http://brew.sh/) is a new and upcoming package management
system for Mac OS X and has a very large community.
Homebrew requires the command line tools for Xcode and either bash or zsh to
[install](https://github.com/Homebrew/homebrew/wiki/Installation).

After installing Homebrew, you can install OCaml by issuing the following
command:

```bash
brew install ocaml
```

You can then install [OPAM](http://opam.ocaml.org/), the
OCaml package manager, which will give you access to all its
[packages](http://opam.ocaml.org/packages/) by running:

```bash
brew install opam
```


### Building from sources
Unfortunately, the packages available for both Fink and DarwinPorts
don't yet include some of the more useful additions to the OCaml
collection, such as Markus Mottl's PCRE-Ocaml library or Stolpmann's
findlib system. In order to get those packages, one must currently build
them from source.

The following packages are the most beneficial to install:

* [The OCaml source distribution.](../releases/)
* [Findlib](http://www.camlcity.org/archive/programming/findlib.html),
 an OCaml library management system.
* [Batteries](http://batteries.forge.ocamlcore.org/), a collection of
 libraries that extend and improve upon the OCaml Standard Library
* [PCRE-OCaml](https://bitbucket.org/mmottl/pcre-ocaml), a
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

* create an OCaml project or target with Xcode
* add files to this target like you do for a C program
* modify the OCaml compiler or linker settings through the Xcode's
 build-in build setting GUI.
* add a library in library build phase of an OCaml target
* syntax higlighting
* use ocamllex and ocamlyacc
* use of the native compiler (select architecture "ppc" instead of the
 default "ocaml")
* dependance between source files
* mixing OCaml and C code

Still being in beta, it does not yet support the following:

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
(whatever the editor you use), use
[Quicksilver](http://qsapp.com/) to index the libref/
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

Download the [source for your preferred OCaml release](/releases/)
(or take the [development version](/releases/svn.html) using
Subversion or Git) and follow the instructions included therein.
