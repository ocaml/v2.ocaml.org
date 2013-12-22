<!-- ((! set title 2009 !)) -->

*Table of contents*

# OCaml Users Meeting 2009

Location: **Grenoble, France**  
Date: Wednesday 4th February 2009

## Talks

### OCamlCore.org news and projects by Stefano Zacchiroli, Sylvain Le Gall and administration team

OCamlCore.org team is the group of people that take care of
administrative part of [OCamlCore.org](http://www.ocamlcore.org/).
OCamlCore.org is a set of resource provided to the OCaml community
like [a forge](http://forge.ocamlcore.org/) and a
[planet](http://planet.ocamlcore.org/).

This short talk will present what has been done during the last year
on OCamlCore.org. It will also give some possible direction on what
this platform can offer to the OCaml community in the next year.

[Slides](https://forge.ocamlcore.org/docman/view.php/77/33/OCamlCore.org%20presentation.pdf) | [Website](http://www.ocamlcore.org/)


### OCaml Batteries Included by David Teller

OCaml Batteries included (or simply "Batteries") is a community-driven
effort to standardize on an consistent, documented, and comprehensive
development platform for the OCaml programming language.

Batteries is meant to serve the following purposes:

- define a standard set of libraries which may be expected on every compliant installation of OCaml;
- organize these libraries into a hierarchy of modules, with one source of documentation;
- define a standard set of language extensions (based on CamlP4) which may be expected on every compliant installation of OCaml;
- provide consistent abstractions and APIs for otherwise independent libraries.

The project was started after last year's OCaml Meeting in Paris. With
this talk, we will show the current status of OCaml Batteries Included
and how it may be useful for you and for newbies — and we'll try to
convince you to switch to this foundation library.

[Slides](https://forge.ocamlcore.org/docman/view.php/77/36/batteries-included.pdf) | [Website](http://batteries.forge.ocamlcore.org/)


### Cameleon/Chamo by Maxence Guesdon

Cameleon is a set of tools put together to create an IDE for
OCaml. One of these tools is Chamo, a source code editor written in
ocaml, a kind of emacs but with ocaml instead of elisp to customize or
add features.

If people are interested, there can be a talk to introduce Chamo:

- usage
- internal architecture,
- how to customize it and add more features.

[Slides](https://forge.ocamlcore.org/docman/view.php/77/32/cameleon_chamo.pdf) | [Website](http://home.gna.org/cameleon/chamo.en.html)


### Delimited overloading by Christophe Troestler

Delimited overloading is a set of syntax extensions that allow

- to locally overload operators, possibly performing some optimizations at the same time;
- to change the priority and associativity of prefix, postfix and infix operators;
- to provide enhanced macros compatible with delimited overloading.

In this talk, we will demonstrate the possibilities of delimited
overloading, explain some of the problems and solutions that we found
while developing it, and show how you can use it for your own
purposes.

[Slides](https://forge.ocamlcore.org/docman/view.php/77/35/pa-do.pdf) | [Website](http://pa-do.forge.ocamlcore.org/)


### OCaml as fast as C! by Sylvain Le Gall

This talk will give some tips on how to achieve high performance using
OCaml. It is based on the building of STSort, a fast sorting GNU sort
like utilities. It will try to show how to go from specification of a
full project to achieving a high level of performance for it.

It will show how mixing functionnal and imperative style in an
application is one of the important feature of OCaml.

[Slides](http://forge.ocamlcore.org/docman/view.php/77/37/OCaml%20as%20fast%20as%20C.pdf)


### VHDL symbolic simulation in OCaml by Florent Ouchet

In the context of hardware design, current synthesis flows show an
increasing interest for formal methods applied on integrated circuits
descriptions. This dedicated application, written in OCaml, makes the
extraction of models easier and faster.

The author of the application will:

- shortly introduces the concept of hardware symbolic simulation;
- explains the reasons for advocating a strongly typed function language in this context;
- outlines application structure and provides evaluations of the efficiency of some language features;
- gives constructive feedback about the issues that were raised during this development.

[Slides](http://forge.ocamlcore.org/docman/view.php/77/34/VSYML-ocaml-meeting-2009.pdf)


### Parsing technology for OCaml: from stream matching to dypgen by Christophe Raffalli

We will give an overview of the various parsing technologies for
OCaml: stream parttern matching, ocamlyacc, camlp4, menhir and
dypgen. Then, we will focus on the powerful tools that dypgen (by
Emmanuel Onzon) uniquely introduces together in parsing technology
(not only for OCaml) and demonstrate them on a few examples (including
parsing for a small piece of french).

[Website](http://dypgen.free.fr/)


### OCaml Windows cross-compiler by Richard W.M. Jones.

10 minute talk given on the
[Windows cross-compiler work done at Red Hat](http://fedoraproject.org/wiki/MinGW),
and a demonstration of the OCaml cross-compiler.


## Participants

Participant should sign up directly using the subscription form
below. The subscription fees cover lunch and coffee pause. The
subscription will be closed on 25th January 2009.

As of 27th January 2009, the subscription is closed.

People, who whish to join at the restaurant, should add (R) just after
their name in the list. Organization team will use this list to book
the restaurant on Ferburay 3rd. You can update your entry until
February 2nd.

- Balat Vincent (R)
- Bonichon Richard
- Canou Benjamin (R)
- Chambart Pierre 
- Clement François
- Clerc Xavier
- Denielou Malo
- Doligez Damien
- Dubuguet Matthieu
- Fiorino Hulbert
- Gazagnaire Thomas (R)
- Glondu Stéphane 
- Gross Vincent (R)
- Guesdon Maxence
- Henry Grégoire (R)
- Hirschowitz Tom
- Hyvernat Pierre
- Jambon Martin 
- Jammes Fabrice
- Jones Richard (R)
- Koeck Jean-Denis (R)
- Le Gall Sylvain (R)
- Leblanc Serge
- Leroy Xavier
- Letouzey Pierre (R)
- Levy Michel
- Loddo Jean-Vincent
- Maingaud Séverine (R)
- Monat Christophe
- Ouchet Florent (R)
- Pouillard Nicolas (R)
- Puydt Julien
- Raffalli Christophe
- Ravet Vivien (R)
- Saiu Luca
- Schmitt Alan 
- Shinwell Mark (R)
- Signoles Julien (R)
- Smeding Gideon 
- Stentzel Cécile 
- Teller David
- Theyssier Guillaume
- Troestler Christophe (R)
- Wang Philippe (R)
- Weis Pierre
- Yziquel Guillaume 
- Zacchiroli Stefano
- Zigmann Renaud 

## Blogs talking about the meeting

- [Richard Jones](http://camltastic.blogspot.com/2009/02/photos-from-ocaml-users-meeting.html)
- [Snark](http://blogs.gnome.org/snark/2009/02/04/ocaml-meeting-in-grenoble/)
- Martin Jambon <!-- http://ocamlhackers.ning.com/profiles/blogs/2175650:BlogPost:241 -->
- [Sylvain Le Gall](http://le-gall.net/sylvain+violaine/blog/index.php?2008/12/19/48-ocaml-meeting-2009-in-grenoble-progress)

## Organization team

- Sylvain Le Gall, main contact (gildor @nospam@ ocamlcore.org, tel: +33 (0) 6 87 82 40 93)
- Alan Schmitt, local organizer (alan.schmitt @nospam@ polytechnique.org)
- Serge Leblanc, local volunteer (serge.leblanc @nospam@ wanadoo.fr)

[Organization details](http://mirror.ocamlcore.org/wiki.cocan.org/events/europe/ocamlmeetinggrenoble2009/organization.html)
