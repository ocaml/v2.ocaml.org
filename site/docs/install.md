<!-- ((! set title Install OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Install OCaml

The latest version of OCaml is **{{! get LATEST_OCAML_VERSION !}}**.
For more information about this release, see the
[{{! get LATEST_OCAML_VERSION !}} page](/releases/{{! get LATEST_OCAML_VERSION !}}.html).

The OCaml compiler and libraries can be installed in several ways:

* With [OPAM](#OPAM), the OCaml package manager (recommended).
* With a system package manager supported by your platform
  ([Linux](#Linux), [macOS](#macOS), [FreeBSD](#FreeBSD),
   [OpenBSD](#OpenBSD), [NetBSD](#NetBSD), [Windows](#Windows))
* In your [browser](#Browser).
* On your [mobile device](#Mobile).
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

Then, use opam to install an ocaml compiler.
Example using the Bash shell and opam-2.0:
```
# environment setup
opam init
eval $(opam env)
# install given version of the compiler
opam switch create {{! get LATEST_OCAML_VERSION !}}
eval $(opam env)
# check you got what you want
which ocaml
ocaml -version
```

## Linux

Most Linux distributions allow OCaml and/or OPAM to be installed
directly through the system package manager.

### [Debian](https://www.debian.org/) [![Debian Unstable](https://repology.org/badge/version-only-for-repo/debian_unstable/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
apt install ocaml-nox # If you don't want X11 support
apt install ocaml
```

Other Debian packages related to OCaml are
[listed here](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all).
They are made available through
[The Debian OCaml Taskforce](https://wiki.debian.org/Teams/OCamlTaskForce/).

### [Ubuntu](https://www.ubuntu.com/) [![Ubuntu 20.04](https://repology.org/badge/version-only-for-repo/ubuntu_20_04/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
apt install ocaml-nox # If you don't want X11 support.
apt install ocaml
```

Other Ubuntu packages related to OCaml are
[listed here](http://packages.ubuntu.com/search?keywords=ocaml).

### [Fedora](https://getfedora.org/) [![Fedora 32](https://repology.org/badge/version-only-for-repo/fedora_32/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
dnf install ocaml
dnf search ocaml   # List packages related to OCaml
```

OCaml packages are packaged according to this
[policy](http://fedoraproject.org/wiki/Packaging/OCaml).
There is an
[OCaml Special Interest Group](http://fedoraproject.org/wiki/SIGs/OCaml)
and a
[mailing list](https://lists.fedoraproject.org/archives/list/ocaml-devel@lists.fedoraproject.org/)
for people interested in OCaml on Fedora or Red Hat Enterprise Linux.


### [Centos](https://www.centos.org/) / [Red Hat Enterprise Linux](http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) [![CentOS 8](https://repology.org/badge/version-only-for-repo/centos_8/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
yum install ocaml
yum search ocaml   # List packages related to OCaml
```

### [Gentoo](https://www.gentoo.org/) [![Gentoo](https://repology.org/badge/version-only-for-repo/gentoo/ocaml.svg)](https://repology.org/metapackage/ocaml)


With a user that is a member of the `portage` group do:

```bash
emerge dev-lang/ocaml
emerge -S ocaml # List packages related to OCaml
```

### [SuSE](https://www.suse.com/) [![OpenSUSE](https://repology.org/badge/version-only-for-repo/opensuse_tumbleweed/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
zypper install ocaml
```

### [Mageia](https://www.mageia.org/) [![Mageia Cauldron](https://repology.org/badge/version-only-for-repo/mageia_cauldron/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
urpmi ocaml-compiler
urpmi ocaml-x11           # To install X11 support
urpmq --list | grep ocaml # List OCaml packages
```

The Mageia [OCaml packaging policy](https://wiki.mageia.org/en/OCaml_policy).

### [Arch Linux](http://www.archlinux.org/) [![Arch Linux](https://repology.org/badge/version-only-for-repo/arch/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
pacman -S ocaml
```

Other Arch Linux packages related to OCaml are
[listed here](https://www.archlinux.org/packages/?q=ocaml).

## macOS

On macOS OCaml and/or OPAM can be installed via the existing third-party
package systems.

### [Homebrew](http://brew.sh/) [![Homebrew](https://repology.org/badge/version-only-for-repo/homebrew/ocaml.svg)](https://repology.org/metapackage/ocaml)


```bash
brew install ocaml
brew install opam
```

###  [Fink](http://www.finkproject.org/)

```bash
apt install ocaml
```

### [MacPorts](http://www.macports.org/) [![MacPorts](https://repology.org/badge/version-only-for-repo/macports/ocaml.svg)](https://repology.org/metapackage/ocaml)


```
port install ocaml
port install opam
```

## [FreeBSD](https://www.freebsd.org/) [![FreeBSD port](https://repology.org/badge/version-only-for-repo/freebsd/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
pkg install ocaml-nox11 # If you don't want X11 support
pkg install ocaml
pkg install ocaml-opam
```

## [OpenBSD](https://www.openbsd.org/) [![OpenBSD port](https://repology.org/badge/version-only-for-repo/openbsd/ocaml.svg)](https://repology.org/metapackage/ocaml)

```
pkg_add ocaml
pkg_add opam
```

## [NetBSD](https://www.netbsd.org/) [![NetBSD port](https://repology.org/badge/version-only-for-repo/pkgsrc_current/ocaml.svg)](https://repology.org/metapackage/ocaml)

```
pkg_add ocaml
pkg_add opam
```

## Windows

Under Windows, the following direct solutions are available to use OCaml:

* [OCaml for Windows](https://fdopen.github.io/opam-repository-mingw/)
  provides an experimental OPAM repository and opam build for Windows.

Here are a few other alternatives:

* Use the *[Windows Subsystem for
  Linux](https://docs.microsoft.com/en-us/windows/wsl/about)* and install OCaml
  as on the chosen Linux distribution. Main OCaml versions and OPAM work.  The
  disadvantage of this method is that you don't build native Windows binaries
  but Linux binaries.

* The OCaml source distribution directly supports many different Windows
  ports. You will have to compile
  [from source](#From-Source). See the
  [README.win32](https://github.com/ocaml/ocaml/blob/trunk/README.win32.adoc)
  file included in the distribution for details.

* [Cygwin](http://cygwin.com/)-based port. Requires Cygwin, you can
  install them using the `setup` tool. The compilers generate executables
  that do require Cygwin (`cygwin1.dll`).
  
## Mobile

* [OCaml: Learn & Code](https://apps.apple.com/app/ocaml-learn-code/id1547506826) provides an editor and an interactive toplevel for iOS, iPadOS and macOS, with a growing learn section.

## Browser

The following pages allow to directly try snippets of
OCaml in your browser:

* [Try OCaml](https://try.ocamlpro.com/) by OCamlPRO.
* An
  [OCaml toplevel](http://ocsigen.org/js_of_ocaml/dev/manual/files/toplevel/index.html)
  compiled by the [`js_of_ocaml`](http://ocsigen.org/js_of_ocaml/)
  project.
* [IOCamlJS](https://andrewray.github.io/iocamljs/) has OCaml toplevels
  with interactive notebook functionality.

## From Source

Download [an OCaml release](/releases/) or the
[development version](https://github.com/ocaml/ocaml) and follow the
instructions included therein.

## Available versions

Here is the list of available versions across different Linux and UNIX distributions:

[![Packaging status](https://repology.org/badge/vertical-allrepos/ocaml.svg)](https://repology.org/metapackage/ocaml)

