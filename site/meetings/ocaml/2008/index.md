<!-- ((! set title 2008 !)) -->

*Table of contents*

# OCaml Users Meeting 2008

Location: **Paris, France**  
Date: Saturday 26th January 2008 

This event takes place in Paris at ENST (Ecole Nationale Supérieure
des Télécommunications or Telecom ParisTech).

For some years now, there has been an increasing number of OCaml
developers, but no developers conference in Europe. This first meeting
should be considered as a way to meet other OCaml developers
face-to-face. It should be also a way to share and discuss
distribution, building, packaging and other issues.

This meeting should be divided in two parts: short talks and a
workshop.

<!-- The talks have been recorded: -->
<!-- [part 1](http://dl.free.fr/nRrhOjNgx/ocaml-meeting-part-1.mp3) -->
<!-- (morning) and -->
<!-- [part 2](http://dl.free.fr/iMNmUNYxs/ocaml-meeting-part-2.mp3) -->
<!-- (afternoon) (temporary files). -->

<!-- IRC transcript: http://tunes.org/~nef/logs/ocaml/08.01.26 -->

## Program

- 09:30–10:00: Coffee and arrival of participants.
- 10:00–10:10: Word of welcome by organization team (S. Le Gall)
- 10:10–10:30: Introduction by X. Leroy
- 10:30–11:00: Ocsigen and Web programming with OCaml by V. Balat
- 11:00–11:30: GODI by G. Stolpmann
- 11:30–12:00: ocamlbuild by N. Pouillard
- 12:00–13:15: Lunch (outside)
- 13:15–13:30: Coffee
- 13:30–14:00: OCaml in Debian by S. Le Gall
- 14:00–14:30: OCaml on a JVM using OCaml-Java by X. Clerc
- 14:30–16:00: Workshop part 1
- 16:00–16:15: Coffee
- 16:15–18:00: Workshop part 2
- 18:00–20:00: free time (maybe it will be possible to stay longer at ENST)
- 20:00: Dinner

During the free time between 18:00 and 20:00, it should be possible to
find some place to have a beer...


## Talks/Workshop

[Slides of the introduction](http://le-gall.net/sylvain+violaine/download/OCaml%20Meeting%20Introduction.odp)
<!-- and [video](http://video.google.com/videoplay?docid=-6044863576176502716&hl=en). -->

### The core Caml system: status report and challenges, by Xavier Leroy

Xavier Leroy, senior research scientist at INRIA Paris-Rocquencourt,
leads the development team for the core Caml system.

This talk will briefly review ongoing work on the core Caml system and
discuss some medium to long-term challenges, both technical and
organizational.

[Slides](http://gallium.inria.fr/~xleroy/talks/cug2008.pdf)
<!-- | [Video](http://video.google.com/videoplay?docid=1704671501085578312&hl=en) -->


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

[Slides](http://www.pps.jussieu.fr/~balat/ocsigen-ocamlmeeting.pdf) | [Full source code of the example](http://www.pps.jussieu.fr/~balat/ocsigen-ocamlmeeting.tar.gz) | [Ocsigen](http://www.ocsigen.org)
<!-- | [Video](http://video.google.com/videoplay?docid=2390257148319051941&hl=en) -->


### GODI, by Gerd Stolpmann

Gerd Stolpmann is an OCaml enthusiast since 1997, and works now as
consultant for various companies.

This talk gives an overview over the GODI project. The basic
mechanisms of GODI are explained, especially how to create new
packages, and what's generally happening behind the user interface.

[Slides](http://le-gall.net/sylvain+violaine/download/godi-paris2008.odp)
<!-- | [Video](http://video.google.com/videoplay?docid=-6322912779839034322&hl=en) -->

### ocamlbuild, by Nicolas Pouillard

Nicolas Pouillard is an OCaml developper, working for Gallium since
two years, he has made a renovation of Camlp4 and also developped
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

[Slides](http://gallium.inria.fr/~pouillar/ocamlbuild/ocamlbuild-ocamlmeeting08.pdf)
<!-- | [Video](http://video.google.com/videoplay?docid=-3355441923262964027) -->

### OCaml in Debian, by Sylvain Le Gall

Sylvain Le Gall is a Debian Developper working on OCaml packages since
2003 and OCaml programmer since 2000.

This talk is about how OCaml is integrated into the Debian GNU/Linux
distribution. Through an historical point of view, we will see how the
packaging has evolve during years. It will also explain the challenge
that the OCaml packaging team still need to overcome to have a better
support of this programming language.

[Slides](http://le-gall.net/sylvain+violaine/download/OCaml%20In%20Debian.odp)
<!-- | [Video](http://video.google.com/videoplay?docid=9059445347619191305&hl=en) -->


### OCaml on a JVM using OCaml-Java, by Xavier Clerc

Xavier Clerc is an OCaml enthusiast trying to enhance OCaml with Java
libraries.

This talk is about the OCaml-Java project and its subprojects. It will
show how it is possible to run OCaml programs on a Java platform (as
applications, applets, or servlets) and how Java libraries can then be
used from OCaml. It will discuss the present state of the project
(features, compatibility), as well as its future (enhancements,
roadmap).

[Slides](http://le-gall.net/sylvain+violaine/download/ocamljave-OCamlMeetingParis2008.pdf)
<!-- | [Video](http://video.google.com/videoplay?docid=5330077842972768634&hl=en) -->


## Ideas discussed in the workshop

- sorting out the Unicode situation (vote: 7)
- the lack of sufficient documentation for the new Camlp4. Is this something where the community at large could help the devs? (vote: 5)
- integration of ocamlfind in ocamlbuild (vote: 5)
- making things easier to use ocamlbuild and produce GODI packages (vote: 4)
- improve the feedback from the Gallium group to the community, particularly in what concerns future language developments (vote: 3)
- some companies (well, one in fact) have run their own Summer of Code programmes for Ocaml. Perhaps the community should get itself organised to provide mentors for students who wish to hack in Ocaml for Google's Summer of Code. There could be a discussion concerning suitable SoC projects to implement bits and pieces needed by the Ocaml community (vote: 3)
- common lexer interface, making it easier to just plug in a lexer of choice (or at least the possibility to use ulex+Ocamlyacc/Menhir) (vote: 2)
- do we need common interfaces, so that a program can easily choose between several implementations of a library (e.g. XML parsing, HTTP client, character set converter, database connectivity etc.)? Can the OCaml users implement a process for developing such interfaces and porting existing libraries so they support the interfaces? (vote: 1)
- organization of the next year European OCaml Meeting (vote: 1)

If you wish to add some ideas for the workshop, edit this page. Feel
free to vote for ideas to be discussed during the workshop by adding 1
to the vote field. Only the most popular ideas will be discussed (due
to limited time).

The list of ideas will be sorted using the vote and presented in this
order during the meeting. If there is enough time, every ideas could
be discussed.

Speakers should provide a short description of the talks, slides and
notes that they will use during the talk. This data will be made
available after/during the meeting. This data should have an OSS
compliant licence (such as GPL) and be in an open format
(OpenDocument, PDF, PS... everything which is not Word/Powerpoint).

A computer connected to a video projector will be available for the
talks session. This computer will run Debian Etch 4.0. Speakers are
invited to send a draft of their slides/demonstration the day before
their talk to test it on this computer (contact Sylvain Le
Gall). Speaker are also invited to explain what software do they need
to be able to run their presentation. Speaker will be allowed to plug
their own laptop to do the presentation, but should be sure that they
can connect to a video projector.


## Location/Date

The meeting will take place 2008/01/26 from 10am to 6pm at ENST Paris
site Barrault.

To go to ENST, you can consult the
[access](http://www.enst.fr/outils/adresse/) page or
[Google maps](http://maps.google.com/maps?f=q&hl=en&geocode=&time=&date=&ttype=&q=rue+vergniaud,+75013+Paris&sll=48.830893,2.336706&sspn=0.102832,0.2314&num=10&iwloc=addr&iwstate1=saveplace).

The main entrance (rue Barrault) is closed on Saturday. The entrance for the meeting will be at 49 rue Vergniaud, Paris 13. You will need to take a badge at this entrance and follow the direction to the amphitheatre Emeraude, where the meeting will take place.

You must have an identity document (French ID card, passport). You will have to let it at the entrance and will get it back when you leave.

## Lunch/Dinner

There are several places around ENST where people can have
lunch. There will be a break from 12:00 to 13:15.

Unfortunately, participants will have to pay for dinner and lunch.

Lunch at "Café les funambules", next to ENST. It will cost 17€ for the
menu of the day and everyone will have to take the same menu (except
for dessert). We need to arrive before 12:15 and give the precise
number of people before thursday. Menu:

- Entrée du jour
- Plat du jour
- Dessert au choix 

Between the end of the workshop and the beginning of the dinner, we
could meet at Frog and british library for a beer and to end the
different lengthy discussions that the workshop won't have dig
enough. This pub is near the restaurant of the dinner.

Dinner at Café Mk2. It will cost 35€ for a complete menu. We need to
be there at 20:00, it 3 subway station away from ENST. We also need to
have the precise number of guest. Menu:

- Tartare de tomate et guacamole, queues d’écrevisses
- Pavé de saumon à la plancha, Courgettes sautées
- Tiramisu
- Wine, water and coffee included

## Payment

Organization team will collect money during the coffee and before the
lunch for the whole day (dinner and lunch). You must come with either
cash or bank check. This way is easier, since we will be able to pay
for all participants at once for dinner and lunch.

Participants will have to pay for transportation between ENST and
restaurant/pub (located at station Line 6 - Quai de la Gare) and for
the beer they wish to have at the pub.

## Hotels

ENST has a list of some place where you can book a room:

- Ibis (**), 177 rue de Tolbiac 75013 Paris, tel. +33(0)1.45.80.16.60, ~89€
- Verlaine (**), 51 rue Bobillot 75013 Paris, tel. +33(0)1.45.89.56.14, ~51-75€ — no room left
- Timhôtel (**), 22 rue Barrault 75013 Paris, tel. +33(0)1.45.80.67.67, ~95€
- Saint-Charles (***), 6 rue de l'Espérance 75013 Paris, tel. +33(0)1.43.59.12.12, ~98€
- Hotel de la Manufacture (***), 8 rue Philippe de Champagne 75013 Paris, ~145€

Prices are from 2006, so they should have changed. It doesn't include
breakfast.

<!-- [More information](http://www.enst.fr/outils/adresse/hotels-proches-barrault.php) -->

## Network/Laptop

During the conference, you can use your laptop and internet through
ENST network. In order to do this, you will have two ways to connect:

- ethernet cable
- WIFI

The wifi configuration is quite tricky and will need to install some
additional tools to connect using Linux.

- Package needed to use WIFI at ENST: pptp (install it before the meeting !).
- HOWTO: `http://www.pps.jussieu.fr/~kerneis/pptp-enst.tar.gz`
  (download it before the meeting!).

Connecting through ethernet cable will be possible and will give you a
better connectivity. Since the number of ethernet plug is limited
people are invited to come with some ethernet switches to be able to
offer more plugs.

Type E (French) Power plug will also be available, if your laptop
doesn't have enough power to stay on battery a whole day. Just as for
ethernet plug, people are invited to come with their national adapter
for type E power plug and with power strip to be able to offer more
plugs.


## Participants

This is a list of participants. To be able to contact you, you must write down your email address replacing "@" by "on-the-server" (anti spam measure):

The format of entry is:

- name
- email (with @ replace by on-the-server)
- if you want to come to the lunch (yes or no, see common lunch in the section Lunch/Dinner)
- if you want to come to the dinner (yes or no)

Participants:

- Sylvain Le Gall, sylvain on-the-server le-gall.net, yes, yes
- Berke Durak, obdurak on-the-server free.fr, no, yes
- Richard W.M. Jones, rich on-the-server annexia.org, no, no (arriving 2pm)
- Nicolas Pouillard, nicolas.pouillard on-the-server inria.fr, yes, no
- Vincent Balat, balat on-the-server pps.jussieu.fr, yes, yes
- Olivier Grisel, olivier.grisel on-the-server ensta.org, yes, yes (probably)
- Mehdi Dogguy, dogguy on-the-server pps.jussieu.fr, yes, no
- Gerd Stolpmann, gerd on-the-server gerd-stolpmann.de, yes, yes
- Martin Jambon, martin_jambon on-the-server emailuser.net, yes, no
- Jaap Boender, boender on-the-server pps.jussieu.fr, yes, yes
- Xavier Clerc, forum on-the-server x9c.fr, yes, no
- Stéphane Glondu, glondu on-the-server pps.jussieu.fr, yes, no
- Ralf Treinen, treinen on-the-server pps.jussieu.fr, yes, yes
- Gabriel Kerneis, kerneis on-the-server enst.fr, yes, no
- David Teller, David.Teller on-the-server univ-orleans.fr, yes, yes
- Pierre Letouzey, letouzey on-the-server pps.jussieu.fr, yes, no
- Cecile Stentzel, cecile.stentzel on-the-server inria.fr, no, no
- Olivier Andrieu, oandrieu on-the-server gmail.com, yes, no
- Pierre Chambart, chambart on-the-server crans.org, no, yes
- Jérémie Dimino, dimino on-the-server crans.org, no, yes
- Keiko Nakata, keiko on-the-server kurims.kyoto-u.ac.jp, yes, no
- Pietro Abate, abate on-the-server pps.jussieu.fr, yes, yes (probably)
- Benjamin Canou, benjamin.canou on-the-server lip6.fr, yes, no
- Christophe Troestler, Christophe.Troestler on-the-server umh.ac.be, yes, yes
- Philippe Wang, philippe.wang on-the-server lip6.fr, yes, no
- Jean-Christophe Filliâtre, filliatr on-the-server lri.fr, no, no (probably)
- Wolfgang Beck, wolfgang.beck01 on-the-server gmail.com, yes, yes
- Luca Saiu, saiu on-the-server lipn.univ-paris13.fr, no, no
- Raja Boujbel, boujbel.raja on-the-server gmail.com, no, no
- Guillaume Bau, guillaume.bau on-the-server gmail.com, no, no
- Alain Frisch, alain on-the-server frisch.fr, yes, no
- Pierre Magistry, pmagistry on-the-server gmail.com, no, no
- Tahina Ramananandro, Tahina.Ramananandro on-the-server normalesup.org, no, no
- Romain Bardou, bardou on-the-server lri.fr, no, no
- Arnaud Spiwack, Arnaud.Spiwack on-the-server lix.polytechnique.fr, yes, yes
- Vincent Gross, vincent.gross on-the-server etudiant.univ-rennes1.fr, yes, no
- Virgile Prevosto, virgile.prevosto on-the-server m4x.org, yes, no (probably)
- Damien Doligez, damien.doligez on-the-server inria.fr, yes, no
- Louis Mandel, louis.mandel on-the-server lri.fr, yes, no
- Xavier Leroy, xavier.leroy on-the-server inria.fr, yes, no
- Gabriel Scherer, bluestorm.dylc on-the-server gmail.com, no, no (probably)
- Jean-Vincent Loddo, loddo on-the-server lipn.univ-paris13.fr, no, no
- Jonathan Derque, jderque on-the-server libertysurf.fr, yes, no
- Vivien Ravet, vivien.ravet on-the-server lip6.fr, no, no
- Zheng Li, li on-the-server pps.jussieu.fr, no, no
- Pierre Clairambault, pierre.clairambault on-the-server pps.jussieu.fr, no, no
- Mattias Engdegård, mattias on-the-server virtutech.se, yes, yes
- Mathias Kende, mathias.kende on-the-server ens.fr, yes, no
- Johannes Kanig, johannes.kanig on-the-server lri.fr, no, no
- Aurelien Gilles, aurelien.gilles on-the-server gmail.com, yes, no
- Alexandre Poirot, poirot.alex on-the-server gmail.com, yes, no
- Loïc Boisseau, boisseaul on-the-server yahoo.fr, no, no
- Glenn Rolland, glenn.rolland on-the-server bewan.com, yes, no


## Organization team

Team list:

- Sylvain Le Gall, main contact
- Vincent Balat
- Gabriel Kerneis

If you wish to help add your name to the list.

[Organization details](http://mirror.ocamlcore.org/wiki.cocan.org/events/europe/ocamlmeetingparis2008/organization.html)
