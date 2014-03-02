<!-- ((! set title Contributors !)) -->

Contributors
============

The contributors to this site, extracted from the
[Git log](https://github.com/ocaml/ocaml.org/commits/master), are:

<ul>
((! cmd git log --format="%aN" | sort -k 2 | uniq | sed -e "/^[^ ]*$/ d" -e "s|\(.*\)|<li>\1</li>|" !))
</ul>


Older contributors to the tutorials
-----------------------------------

Many of tutorials on this site originate from `ocaml-tutorial.org`.  Here are
the people who contributed to them:

* Doug Bagley
* Nicolas Cannasse
* Eric C. Cooper
* Richard Donkin
* Jim Farrand
* Fabrice Le Fessant
* Jacques Garrigue
* Stephen Gilmore
* Flavio Grossi
* Damien Guichard
* Brian Hurt
* Neel Krishnaswami
* Michel Levy
* Sven Luther
* John Gerard Malecki
* Luc Maranget
* Jean-Francois Monin
* Markus Mottl
* Thomas Mraz
* Wolfgang Mueller
* Lars Nilsson
* Jose Manuel Nunes
* Frederic van der Plancke
* Paul Steckler
* Fabian Sturm
* Ryan Tarpine
* Remi Vanicat
* Yamagata Yoriyuki
* Stefano Zacchiroli

