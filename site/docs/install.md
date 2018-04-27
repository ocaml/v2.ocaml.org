<!-- ((! set title Install OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Install OCaml

The latest version of OCaml is **{{! get LATEST_OCAML_VERSION !}}**.
For more information about this release, see the
[{{! get LATEST_OCAML_VERSION !}} page](/releases/{{! get LATEST_OCAML_VERSION !}}.html).

The OCaml compiler and libraries can be installed in several ways:

* With [OPAM](#OPAM), the OCaml package manager (recommended).
* With a system package manager supported by your platform
  ([FreeBSD](#FreeBSD), [Linux](#Linux), [macOS](#macOS),
   [OpenBSD](#OpenBSD), [Windows](#Windows))
* In your [browser](#Browser).
* By compiling [the source](#From-Source).

For finding and installing OCaml libraries, see the
[libraries page](/learn/libraries.html). Information about the
different versions of OCaml is available on the [releases](/releases/)
page.

## OPAM

[OPAM](https://opam.ocaml.org/) is the package manager for OCaml. It is
the recommended way to install the OCaml compiler and OCaml
packages. Simply follow the
[OPAM install instructions](https://opam.ocaml.org/doc/Install.html).

## [FreeBSD](https://www.freebsd.org/)

```bash
pkg_add -r ocaml-nox11 # If you don't want X11 support 
pkg_add -r ocaml
```

## Linux

Most Linux distributions allow OCaml and/or OPAM to be installed
directly through the system package manager.

### [Debian](https://www.debian.org/)

```bash
apt install ocaml-nox # If you don't want X11 support
apt install ocaml
```

Other Debian packages related to OCaml are
[listed here](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all).
They are made available through
[The Debian OCaml Packaging Policy](http://pkg-ocaml-maint.alioth.debian.org/ocaml_packaging_policy.html/index.html).

### [Ubuntu](https://www.ubuntu.com/)

```bash
apt install ocaml-nox # If you don't want X11 support.
apt install ocaml
```

Other Ubuntu packages related to OCaml are
[listed here](http://packages.ubuntu.com/search?keywords=ocaml).

### [Fedora](https://getfedora.org/)

```bash
dnf install ocaml
dnf search ocaml   # List packages related to OCaml
```

OCaml packages are packaged according to this
[policy](http://fedoraproject.org/wiki/Packaging/OCaml).
There is an
[OCaml Special Interest Group](http://fedoraproject.org/wiki/SIGs/OCaml)
and a
[mailing list](https://lists.fedoraproject.org/mailman/listinfo/Ocaml-devel)
for people interested in OCaml on Fedora or Red Hat Enterprise Linux.


### [Centos](https://www.centos.org/) / [Red Hat Enterprise Linux](http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux)

```bash
yum install ocaml
yum search ocaml   # List packages related to OCaml
```

### [Gentoo](https://www.gentoo.org/)

With a user that is a member of the `portage` group do:

```bash
emerge dev-lang/ocaml
emerge -S ocaml # List packages related to OCaml
```

### [SuSE](https://www.suse.com/)

```bash
zypper install ocaml
```

### [Mageia](https://www.mageia.org/)

```bash
urpmi ocaml-compiler
urpmi ocaml-x11           # To install X11 support
urpmq --list | grep ocaml # List OCaml packages
```

The Mageia [OCaml packaging policy](https://wiki.mageia.org/en/OCaml_policy).

### [Arch Linux](http://www.archlinux.org/)

```bash
pacman -S ocaml
```

Other Arch Linux packages related to OCaml are
[listed here](https://www.archlinux.org/packages/?q=ocaml).

## macOS

On macOS OCaml and/or OPAM can be installed via the existing third-party
package systems.

### [Homebrew](http://brew.sh/)

```bash
brew install ocaml
brew install opam 
```

###  [Fink](http://fink.sourceforge.net/)

```bash
apt install ocaml
```

### [MacPorts](http://www.macports.org/)

```
port install ocaml
port install opam
```

## [OpenBSD](https://www.openbsd.org/)

```
pkg_add ocaml
pkg_add opam
```

## Windows

Under Windows, the following direct solutions are available to use OCaml:

* [OCaml for Windows](https://fdopen.github.io/opam-repository-mingw/)
  provides an experimental OPAM repository and opam build for Windows.

* [OCPWin](http://www.typerex.org/ocpwin.html) is a self-contained binary
  distribution of OCaml for Windows. Some additional features have
  been added to OCaml for better support of Windows, such as auto-detection
  of MSVC and support for MSVC 9.0, 10.0, 11.0, 12.0 and 14.0 (VS2015).
 
Here are a few other alternatives:

* The OCaml source distribution directly supports many different Windows
  ports. You will have to compile
  [from source](#FromSource). See the
  [README.win32](https://github.com/ocaml/ocaml/blob/trunk/README.win32.adoc)
  file included in the distribution for details.

* Use « Bash on Windows » and install OCaml as on Ubuntu. Main OCaml versions
  and OPAM work. The disadvantage of this method is that you don't build native
  Windows binaries but Linux binaries. [See tutorial.](http://themargin.io/2017/02/02/OCaml_on_win/)

* [Cygwin](http://cygwin.com/)-based port. Requires Cygwin, you can
  install them using the `setup` tool. The compilers generate executables
  that do require Cygwin (`cygwin1.dll`).

## Browser

The following pages allow to directly try snippets of
OCaml in your browser:

* [Try OCaml](https://try.ocamlpro.com/) by OCamlPRO.
* An
  [OCaml toplevel](http://ocsigen.org/js_of_ocaml/dev/files/toplevel/index.html)
  compiled by the [`js_of_ocaml`](http://ocsigen.org/js_of_ocaml/)
  project.
* [IOCamlJS](https://andrewray.github.io/iocamljs/) has OCaml toplevels
  with interactive notebook functionality.

## From Source

Download [an OCaml release](/releases/) or the
[development version](https://github.com/ocaml/ocaml) and follow the
instructions included therein.




