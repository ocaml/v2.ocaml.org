<!-- ((! set title Installer OCaml !)) ((! set documentation !)) -->

*Table of contents*

# Installer OCaml

La dernière version d'OCaml est **OCaml 4.01.0**, publiée en juillet 2013.

Il y a plusieurs moyens d'installer OCaml sur un ordinateur :

* Utiliser OPAM, un gestionnaire de paquets spécialisé pour OCaml
* Utiliser le gestionnaire de paquets de votre plateforme, dans lequel une
   version récente d'OCaml  est le plus souvent disponible
* Installer depuis les sources

## Installation via OPAM


[OPAM](http://opam.ocaml.org/) est un gestionnaire de paquet développé
 pour OCaml, basé sur la bibliothèque CUDF de l'équipe Mancoosi
 (IRILL/Univ Paris 7), bibliothèque aussi utilisée par Debian pour
 gérer les dépendances de ses paquets. OPAM fonctionne très bien sous
 Unix, Linux, et Mac OS X. Le support pour Windows est en cours de
 développement.

  OPAM a été développé et est toujours maintenu par
[OCamlPro](http://www.ocamlpro.com/), tandis que le dépôt de paquets
est maintenu par [OCaml
Labs](http://www.cl.cam.ac.uk/projects/ocamllabs/). OPAM est un
logiciel libre, sur lequet du ([support commercial](http://www.ocamlpro.com/) est disponible.

Pour commencer, visitez la page [Télécharger et installer
OPAM](http://opam.ocaml.org/) et suivez les instructions.

Pour les plus impatients, il existe un installeur binaire :

```bash
$ wget http://www.ocamlpro.com/pub/opam_installer.sh
$ sh ./opam_installer.sh /usr/local/bin  # You can change the path to install it in an other place.
```
Ou depuis les sources:

```bash
$ git clone https://github.com/ocaml/opam
$ cd opam
$ ./configure # (or ./configure --prefix=$HOME if you want to install under your $HOME)
$ make
$ make install
$ opam init
$ eval `opam config -env`
$ opam switch 4.01.0
```

## Utilisation d'un autre gestionnaire de paquets

Voir la page anglaise.

## Installation depuis les sources

Voir la page anglaise.


