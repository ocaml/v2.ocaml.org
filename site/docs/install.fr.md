<!-- ((! set title Installer OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Installer OCaml

La dernière version d'OCaml est la **{{! get LATEST_OCAML_VERSION !}}**.
Pour plus d'informations à propos de celle-ci, voir la page
[OCaml {{! get LATEST_OCAML_VERSION !}}](/releases/{{! get LATEST_OCAML_VERSION !}}.html) (en anglais).


Il y a plusieurs moyens pour installer OCaml :

* Utiliser [OPAM](#Installation-via-OPAM), un gestionnaire de paquet spécialisé pour OCaml
* Utiliser le gestionnaire de paquet de votre plateforme ([FreeBSD](#FreeBSD),
  [Linux](#Linux), [macOS](#macOS), [OpenBSD](#OpenBSD), [Windows](#Windows))
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
opam switch create 4.06.1
eval `opam env`
# check you got what you want
which ocaml
ocaml --version
```

## Linux

La plupart des distributions Linux permettent d'installer OCaml et/ou OPAM avec le gestionnaire de paquet système.

### [Debian](https://www.debian.org/index.fr.html)

```bash
apt install ocaml-nox # Si vous ne voulez pas le support de X11 
apt install ocaml
```
Les autres paquets Debian liés à OCaml sont
[listés ici](http://packages.debian.org/search?keywords=ocaml&searchon=all&suite=testing&section=all) (en Anglais).
Ils sont disponibles selon
[la politique de construction des paquets pour OCaml](http://pkg-ocaml-maint.alioth.debian.org/ocaml_packaging_policy.html/index.html) (en anglais) de Debian.

### [Ubuntu](https://www.ubuntu.com/)

```bash
apt install ocaml # Avec le support de X11 (donc le module Graphics)

apt install ocaml-nox # Plus léger, si vous ne voulez pas le support de X11 
```

Les autres paquets Unbuntu liés à OCaml sont
[listés ici](http://packages.ubuntu.com/search?keywords=ocaml) (en anglais).

### [Fedora](https://getfedora.org/)

```bash
yum install ocaml
yum search ocaml   # Liste les paquets liés à OCaml
```

Les paquets OCaml sont construits selon cette
[politique](http://fedoraproject.org/wiki/Packaging/OCaml) (en anglais).
Il y a un
[Groupe d'intérêt spécial OCaml](http://fedoraproject.org/wiki/SIGs/OCaml) (en anglais)
et une
[mailing liste](https://lists.fedoraproject.org/mailman/listinfo/Ocaml-devel) (en anglais)
pour les individus intéressés par OCaml sur Fedora ou Red Hat Enterprise Linux.

### [Gentoo](https://www.gentoo.org/)

Avec un utilisateur membre du `portage` groupe exécuter:

```bash
emerge dev-lang/ocaml
emerge -S ocaml # Liste les paquets liés à OCaml
```

### [SuSE](https://www.suse.com/)

```bash
zypper install ocaml
```

### [Mageia](https://www.mageia.org/)

```bash
urpmi ocaml-compiler
urpmi ocaml-x11           # Pour installer le support pour X11
urpmq --list | grep ocaml # Liste les paquets liés à OCaml
```

La  [Politique de construction des paquets pour OCaml](https://wiki.mageia.org/en/OCaml_policy) (en anglais) de Mageia.

## macOS

Sur macOS OCaml et/ou OPAM peuvent êtres installés grâce aux systèmes de gestion de paquets tiers.

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

## [FreeBSD](https://www.freebsd.org/)

```bash
pkg_add -r ocaml-nox11 # Si vous ne voulez pas le support de X11 
pkg_add -r ocaml
```

## [OpenBSD](https://www.openbsd.org/)

```
pkg_add ocaml
pkg_add opam
```

## Windows

Sous Windows, les solutions suivantes sont disponibles pour installer OCaml:

* [Distribution OCaml officielle](http://protz.github.io/ocaml-installer/).
  Un auto-installeur avec une version préliminaire d'OPAM pour Windows.

* [OCPWin](http://www.typerex.org/ocpwin.html) est un fichier binaire contenant la
  distribution d'OCaml pour Windows. Quelques fonctionnalités supplémentaires
  ont été ajoutés à OCaml pour mieux supporter Windows, telles que l'auto-détection
  de MSVC et le support de MSVC 9.0, 10.0, 11.0, 12.0 and 14.0 (VS2015).

* [OCaml pour Windows](https://fdopen.github.io/opam-repository-mingw/)
  fournit une version expérimentale des dépôts d'OPAM et d'OPAM pour Windows.
  
Voici quelques alternatives :

* Les sources d'OCaml supportent directement Windows. Vous devrez compilez
  [les source](#Installation depuis les sources). Voir le fichier 
  [README.win32](https://github.com/ocaml/ocaml/blob/trunk/README.win32.adoc) (en anglais)
  dans la distribution pour plus de détails.

* Utiliser « Bash on Windows » et installer OCaml comme sur Ubuntu.
  L'inconvénient de cette méthode est que vous ne créez pas 
   des fichiers binaires natifs pour Windows mais des fichiers binaires pour Linux.

* [Cygwin](http://cygwin.com/) Avec Cygwin, vous pouvez l'installer avec l'outil `setup`. 
   Les compileurs génèrent des exécutables qui requièrent Cygwin (`cygwin1.dll`).


## Installation depuis les sources

Télécharger une [version stable d'OCaml](/releases/) ou une
[version de développement](https://github.com/ocaml/ocaml) et suivez les instructions (en anglais) que vous y trouverez.


