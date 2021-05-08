<!-- ((! set title Installer OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Installer OCaml

La dernière version d'OCaml est la **{{! get LATEST_OCAML_VERSION !}}**.
Pour plus d'informations à propos de celle-ci, voir la page
[OCaml {{! get LATEST_OCAML_VERSION !}}](/releases/{{! get LATEST_OCAML_VERSION !}}.html) (en anglais).


Il y a plusieurs moyens pour installer OCaml :

* Utiliser [OPAM](#Installation-via-OPAM), un gestionnaire de paquet spécialisé pour OCaml
* Utiliser le gestionnaire de paquet de votre plateforme ([FreeBSD](#FreeBSD),
  [Linux](#Linux), [macOS](#macOS), [OpenBSD](#OpenBSD), [Windows](#Windows), [Mobile](#Mobile))
* Installer depuis [les sources](#Installation-depuis-les-sources)

Pour trouver ou installer des bibliothèques OCaml, voir [la page
dédiée aux bibliothèques](/learn/libraries.html). Vous trouverez plus
d'information sur les différentes versions d'OCaml sur [cette
page](/releases/).


## Installation via OPAM

[OPAM](http://opam.ocaml.org/) est le gestionnaire de paquet officiel
pour OCaml, il est recommandé de l'utiliser pour l'installation du
compilateur comme des bibliothèques. L'installation d'OPAM est décrite
sur [cette page](https://opam.ocaml.org/doc/Install.html).

Exemple d'utilisation d'OPAM sous bash:
```
# environment setup
opam init
eval `opam env`
# install given version of the compiler
opam switch create {{! get LATEST_OCAML_VERSION !}}
eval `opam env`
# check you got what you want
which ocaml
ocaml --version
```

## Linux

La plupart des distributions Linux permettent d'installer OCaml et/ou OPAM avec le gestionnaire de paquet système.

### [Debian](https://www.debian.org/index.fr.html) [![Debian Unstable](https://repology.org/badge/version-only-for-repo/debian_unstable/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
apt install ocaml-nox # Si vous ne voulez pas le support de X11
apt install ocaml
```
Les autres paquets Debian liés à OCaml sont
[listés ici](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all) (en Anglais).
Ils sont disponibles selon
[la politique de construction des paquets pour OCaml](http://pkg-ocaml-maint.alioth.debian.org/ocaml_packaging_policy.html/index.html) (en anglais) de Debian.

### [Ubuntu](https://www.ubuntu.com/) [![Ubuntu 20.04](https://repology.org/badge/version-only-for-repo/ubuntu_20_04/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
apt install ocaml # Avec le support de X11 (donc le module Graphics)

apt install ocaml-nox # Plus léger, si vous ne voulez pas le support de X11
```

Les autres paquets Unbuntu liés à OCaml sont
[listés ici](http://packages.ubuntu.com/search?keywords=ocaml) (en anglais).

### [Fedora](https://getfedora.org/) [![Fedora 32](https://repology.org/badge/version-only-for-repo/fedora_32/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
yum install ocaml
yum search ocaml   # Liste les paquets liés à OCaml
```

Les paquets OCaml sont construits selon cette
[politique](http://fedoraproject.org/wiki/Packaging/OCaml) (en anglais).
Il y a un
[Groupe d'intérêt spécial OCaml](http://fedoraproject.org/wiki/SIGs/OCaml) (en anglais)
et une
[mailing liste](https://lists.fedoraproject.org/archives/list/ocaml-devel@lists.fedoraproject.org/) (en anglais)
pour les individus intéressés par OCaml sur Fedora ou Red Hat Enterprise Linux.

### [Centos](https://www.centos.org/) / [Red Hat Enterprise Linux](http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) [![CentOS 8](https://repology.org/badge/version-only-for-repo/centos_8/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
yum install ocaml
yum search ocaml   # List packages related to OCaml
```

### [Gentoo](https://www.gentoo.org/) [![Gentoo](https://repology.org/badge/version-only-for-repo/gentoo/ocaml.svg)](https://repology.org/metapackage/ocaml)

Avec un utilisateur membre du `portage` groupe exécuter:

```bash
emerge dev-lang/ocaml
emerge -S ocaml # Liste les paquets liés à OCaml
```

### [SuSE](https://www.suse.com/) [![OpenSUSE](https://repology.org/badge/version-only-for-repo/opensuse_tumbleweed/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
zypper install ocaml
```

### [Mageia](https://www.mageia.org/) [![Mageia Cauldron](https://repology.org/badge/version-only-for-repo/mageia_cauldron/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
urpmi ocaml-compiler
urpmi ocaml-x11           # Pour installer le support pour X11
urpmq --list | grep ocaml # Liste les paquets liés à OCaml
```

La  [Politique de construction des paquets pour OCaml](https://wiki.mageia.org/en/OCaml_policy) (en anglais) de Mageia.

### [Arch Linux](http://www.archlinux.org/) [![Arch Linux](https://repology.org/badge/version-only-for-repo/arch/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
pacman -S ocaml
```

Les paquets d'Arch Linux pour OCaml sont
[énumérés ici](https://www.archlinux.org/packages/?q=ocaml).

## macOS

Sur macOS OCaml et/ou OPAM peuvent êtres installés grâce aux systèmes de gestion de paquets tiers.

### [Homebrew](http://brew.sh/) [![Homebrew](https://repology.org/badge/version-only-for-repo/homebrew/ocaml.svg)](https://repology.org/metapackage/ocaml)

```bash
brew install ocaml
brew install opam
```

###  [Fink](http://fink.sourceforge.net/)

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
pkg_add -r ocaml-nox11 # Si vous ne voulez pas le support de X11
pkg_add -r ocaml
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

Sous Windows, les solutions suivantes sont disponibles pour installer OCaml:

* [OCaml pour Windows](https://fdopen.github.io/opam-repository-mingw/)
  fournit une version expérimentale des dépôts d'OPAM et d'OPAM pour Windows.

Voici quelques alternatives :

* Utiliser [« le Sous-système Windows pour Linux »](https://docs.microsoft.com/fr-fr/windows/wsl/about) et installer OCaml comme sur Ubuntu.
  Les principales versions d'OCaml et d'OPAM fonctionnent.
  L'inconvénient de cette méthode est que vous ne créez pas des fichiers
  binaires natifs pour Windows mais des fichiers binaires pour Linux.

* Les sources d'OCaml supportent directement Windows. Vous devrez compilez
  [les source](#Installation depuis les sources). Voir le fichier
  [README.win32](https://github.com/ocaml/ocaml/blob/trunk/README.win32.adoc) (en anglais)
  dans la distribution pour plus de détails.

* [Cygwin](http://cygwin.com/) Avec Cygwin, vous pouvez l'installer avec l'outil `setup`.
   Les compileurs génèrent des exécutables qui requièrent Cygwin (`cygwin1.dll`).

## Mobile

* [OCaml: Learn & Code](https://apps.apple.com/app/ocaml-learn-code/id1547506826) met à disposition un éditeur et une console interactive pour iOS, iPadOS et macOS, avec une section d'apprentissage en pleine croissance.

## Installation depuis les sources

Télécharger une [version stable d'OCaml](/releases/) ou une
[version de développement](https://github.com/ocaml/ocaml) et suivez les instructions (en anglais) que vous y trouverez.


