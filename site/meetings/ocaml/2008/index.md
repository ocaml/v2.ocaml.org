<!-- ((! set title 2008 !)) -->

*Table of contents*

# OCaml Users Meeting 2008

Location: **Paris, France**  
Date: Saturday 26th January 2008 

This event took place in Paris at ENST (Ecole Nationale Supérieure
des Télécommunications or Telecom ParisTech).

## Program

- 10:00–10:10: Word of welcome by organization team (S. Le Gall)
- 10:10–10:30: Introduction by X. Leroy
- 10:30–11:00: Ocsigen and Web programming with OCaml by V. Balat
- 11:00–11:30: GODI by G. Stolpmann
- 11:30–12:00: ocamlbuild by N. Pouillard
- 13:30–14:00: OCaml in Debian by S. Le Gall
- 14:00–14:30: OCaml on a JVM using OCaml-Java by X. Clerc

## Talks/Workshop

[Slides of the introduction](slides/Introduction.odp) and [video](https://www.youtube.com/watch?v=UZyvShyojWo).

### The core Caml system: status report and challenges, by Xavier Leroy

Xavier Leroy, senior research scientist at INRIA Paris-Rocquencourt,
leads the development team for the core Caml system.

This talk will briefly review ongoing work on the core Caml system and
discuss some medium to long-term challenges, both technical and
organizational.

[Slides](slides/cug2008.pdf) and [video](https://www.youtube.com/watch?v=YdAcmMLwd_U).


### Ocsigen: Exploiting the full power of OCaml in Web Programming, by Vincent Balat

Vincent Balat is "maître de conférences" (lecturer/assistant
professor) in Computer Science at Paris Diderot university (Paris 7).

Ocsigen is a research project of the PPS lab (Université Paris
Diderot) aiming at developing new programming techniques for the
Web. It concretized through the implementation of a full featured Web
server in Objective Caml, and a Web programming library called Eliom
introducing very new concepts for building dynamic Web sites. Ocsigen
is now very close to version 1. In this talk I will try to give an
overview of the project and to give an idea about what programming
with Eliom looks like.

[Slides](slides/ocsigen-ocamlmeeting.pdf) | [Full source code of the example](http://www.pps.jussieu.fr/~balat/ocsigen-ocamlmeeting.tar.gz) | [Ocsigen](http://www.ocsigen.org)
| [Video](https://www.youtube.com/watch?v=WnGbGq4ETj0)


### GODI, by Gerd Stolpmann

Gerd Stolpmann is an OCaml enthusiast since 1997, and works now as
consultant for various companies.

This talk gives an overview over the GODI project. The basic
mechanisms of GODI are explained, especially how to create new
packages, and what's generally happening behind the user interface.

[Slides](slides/godi-paris2008.odp) | [Video](https://www.youtube.com/watch?v=SiF9CD5CK_k) 

### ocamlbuild, by Nicolas Pouillard

Nicolas Pouillard is an OCaml developer, working for Gallium since
two years, he has made a renovation of Camlp4 and also developed
ocamlbuild with Berke Durak.

This talk presents ocamlbuild, a compilation manager that was added to
the OCaml distribution in the 3.10.0 release. It automates the
(re)compilation and dependency analysis for OCaml projects. It
implements the so-called "cut-off" strategy, reducing the amount of
recompilation performed. For simple projects, ocamlbuild's built-in
compilation rules entirely automate the build process: no "Makefile"
is needed. Variations on the built-in rules can be specified compactly
through a "tag" mechanism. For more advanced projects, ocamlbuild can
be extended through plug-ins written in OCaml itself.

[Slides](slides/ocamlbuild-ocamlmeeting08.pdf) | [Video](https://www.youtube.com/watch?v=4HPlX6wdmTI)

### OCaml in Debian, by Sylvain Le Gall

Sylvain Le Gall is a Debian Developer working on OCaml packages since
2003 and OCaml programmer since 2000.

This talk is about how OCaml is integrated into the Debian GNU/Linux
distribution. Through an historical point of view, we will see how the
packaging has evolve during years. It will also explain the challenge
that the OCaml packaging team still need to overcome to have a better
support of this programming language.

[Slides](slides/OCamlInDebian.odp) | [Video](https://www.youtube.com/watch?v=-kBprJFFfsc)


### OCaml on a JVM using OCaml-Java, by Xavier Clerc

Xavier Clerc is an OCaml enthusiast trying to enhance OCaml with Java
libraries.

This talk is about the OCaml-Java project and its subprojects. It will
show how it is possible to run OCaml programs on a Java platform (as
applications, applets, or servlets) and how Java libraries can then be
used from OCaml. It will discuss the present state of the project
(features, compatibility), as well as its future (enhancements,
roadmap).

[Slides](slides/ocamljave-OCamlMeetingParis2008.pdf) | [Video](https://www.youtube.com/watch?v=v0zBMVABYXo) 


## Participants

- Sylvain Le Gall
- Berke Durak
- Richard W.M. Jones
- Nicolas Pouillard
- Vincent Balat
- Olivier Grisel
- Mehdi Dogguy
- Gerd Stolpmann
- Martin Jambon
- Jaap Boender
- Xavier Clerc
- Stéphane Glondu
- Ralf Treinen
- Gabriel Kerneis
- David Teller
- Pierre Letouzey
- Cecile Stentzel
- Olivier Andrieu
- Pierre Chambart
- Jérémie Dimino
- Keiko Nakata
- Pietro Abate
- Benjamin Canou
- Christophe Troestler
- Philippe Wang
- Jean-Christophe Filliâtre
- Wolfgang Beck
- Luca Saiu
- Raja Boujbel
- Guillaume Bau
- Alain Frisch
- Pierre Magistry
- Tahina Ramananandro
- Romain Bardou
- Arnaud Spiwack
- Vincent Gross
- Virgile Prevosto
- Damien Doligez
- Louis Mandel
- Xavier Leroy
- Gabriel Scherer
- Jean-Vincent Loddo
- Jonathan Derque
- Vivien Ravet
- Zheng Li
- Pierre Clairambault
- Mattias Engdegård
- Mathias Kende
- Johannes Kanig
- Aurelien Gilles
- Alexandre Poirot
- Loïc Boisseau
- Glenn Rolland

## Organization team

Team list:

- Sylvain Le Gall, main contact
- Vincent Balat
- Gabriel Kerneis