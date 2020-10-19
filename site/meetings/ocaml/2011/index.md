<!-- ((! set title 2011 !)) -->

*Table of contents*

# OCaml Users Meeting 2011

__Date: Friday 15th April 2011__
Location: Telecom ParisTech, Paris, France

This event will take place in Paris. The venue is in Telecom ParisTech
(former ENST, the place of the first OCaml Meeting).

The OCaml Meeting is the a place where OCaml enthusiasts can meet and
discuss various subjects ranging from webservers to parser/lexer of
natural languages in OCaml. Most of the topics focus on practical
OCaml subjects (libraries or applications) but broadening the field is
allowed.

The meeting is kindly sponsored by the
[CAML consortium](/consortium/), so the lunch and
the coffee breaks are free.

## Schedule

[Video Playlist](https://www.youtube.com/playlist?list=PLbU5HH3lhSGa0GLMqynyZmrixpO9gU_go)

- 09:30–09:45: OCamlCore.org news and projects by Sylvain Le Gall
- 09:45–10:15: `js_of_ocaml`: Compiling Ocaml bytecode to Javascript, by Jérôme Vouillon
- 10:15–10:45: OCAPIC: programming PIC microcontrollers with Objective Caml
- 10:45–11:15: Developing Frama-C Plug-ins in OCaml, by Julien Signoles
- 11:30–12:00: Client/server Web applications with Eliom, by Vincent Balat
- 12:00–12:30: MirageOS, by Anil Madhavapeddy
- 12:30–13:00: Using OCaml to generate 198,278 lines of C, by Richard Jones
- 14:30–15:30: OCaml annual report by Xavier Leroy
- 15:30–16:00: JoCaml, by Luc Maranget
- 16:30–17:00: The Eternal Solution for Memoisation: Ephemerons, by François Bobot
- 17:00–17:30: OASIS-DB: a CPAN for OCaml, by Sylvain Le Gall
- 17:30–18:00: Ideas for a Modern OCaml Web Portal by Ashish Agarwal
- 18:00–19:00: *Demonstration and discussion time*

### Intro (bits from OCamlCore.org)

[Slides](slides/OCamlCore.org_presentation_2011.pdf)
| [Video](https://www.youtube.com/watch?v=6eOE1KP-4ao)

### The core Caml system: status report and challenges, by Xavier Leroy

Xavier Leroy, senior research scientist at INRIA Paris-Rocquencourt,
leads the development team for the core Caml system.

This talk will briefly review ongoing work on the core Caml system and
discuss some medium to long-term challenges, both technical and
organizational.

[Slides](slides/xleroy-cug2011-2.pdf) | [Video](https://youtu.be/lnyaI275erg)

### OASIS-DB: a CPAN for OCaml, by Sylvain Le Gall

OASIS-DB is a set of tools and a webserver that helps to manage OASIS
enabled softwares and libraries to live together. It uses OASIS data
to build a database and to understand the link between each
packages. It also provides a backup site for tarball. The webserver is
built on top of Ocsigen and Lwt.

This talk will show the architecture of OASIS and OASIS-DB and
demonstrate some of its low paperwork publication scheme: upload your
tarball to the website and let all others download, compile and
install it using only 2 commands.

Sylvain Le Gall is an OCaml consultant working at OCamlCore SARL.

[Website](http://oasis.forge.ocamlcore.org/)
| [Slides](slide/OCamlMeeting2011_OASIS_Slides.pdf)
| [Video](https://youtu.be/njkP5EZ8uAo)

### js_of_ocaml: Compiling Ocaml bytecode to Javascript, by Jérôme Vouillon

[Js_of_ocaml](http://ocsigen.org/js_of_ocaml) is a compiler of OCaml
bytecode to Javascript. It makes it possible to run Ocaml programs in
a Web browser. Its key features are the following:

- The whole language, and most of the standard library are supported.
- The generated code runs very fast
- The compiler is easy to install: it only depends on Findlib and Lwt.
- The generated code is independent of Eliom and the Ocsigen server. You can use it with any Web server.
- You can use a standard installation of OCaml to compile your programs. In particular, you do not have to recompile a library to use it with Js_of_ocaml. You just have to link your program with a specific library to interface with the browser APIs.
- Binding Javascript libraries is very easy

In this talk we will show you the main features and some examples.

Jérôme Vouillon is a computer science researcher at
[PPS](http://www.pps.jussieu.fr/) and [IRILL](http://www.irill.org/)
(CNRS), member of the [Ocsigen](http://ocsigen.org/) team.

[Video](https://youtu.be/rJNCUFZokNI) 

### Client/server Web applications with Eliom, by Vincent Balat

Ocsigen Eliom is an extension for the Web server of the Ocsigen
project allowing to write Web applications in Ocaml. Eliom 1 made very
easy to write reliable Web sites where pages are computed on server
side. Thanks to the js_of_ocaml compiler, it is now possible to run
OCaml programs in a browser. Eliom 2.0, that will be released in very
few weeks, will make possible to mix both, and write client/server Web
applications fully in OCaml, in very few lines of code. A
client/server program is written as a single OCaml application. Eliom
handles the communication between the client and the server
automatically in both directions, and your application is fully
integrated in your Web site, that is: you keep the usual Web
interaction (with links, forms, and URLs) during the execution of the
client side program!

In this talk I will show how to write an example application.

Vincent Balat is a computer science researcher at
[PPS](http://www.pps.jussieu.fr/) and [IRILL](http://www.irill.org/)
(Université Paris Diderot/INRIA), member of the
[Ocsigen](http://ocsigen.org/) team.

[Video](https://youtu.be/yLh45IyAuZI)

### Using OCaml to generate 198,278 lines of C, by Richard Jones

We use OCaml in the [libguestfs project](http://libguestfs.org/) to
generate large amounts of boilerplate C code. This short talk (10
mins) will explain what the problem that existing projects such as
[libvirt](http://libvirt.org/) suffered from and how we successfully
solved it, and what difficulties remain.

[Video](https://youtu.be/FbgRsFpfHJI)

### MirageOS, by Anil Madhavapeddy

Mirage is an open-source operating system for constructing secure,
high-performance, reliable network applications across a variety of
cloud computing platforms. OCaml code can be developed on a normal OS
such as Linux and then compiled into a fully-standalone, specialised
OS kernel that runs under the Xen hypervisor (and in the future, KVM
or VMWare). Mirage is based around the OCaml language, with syntax
extensions and libraries that are easy to use during development, and
map directly into operating system constructs when being compiled for
production deployment.

[Slides](slides/mirage-ocaml-users-2011.ppt)
| [Video](https://youtu.be/GEkxyA2FwW0)

### Developing Frama-C Plug-ins in OCaml, by Julien Signoles

[Frama-C](http://frama-c.com/) is an extensible and collaborative
platform dedicated to source-code analysis of C software. It is fully
developed in OCaml. Any OCaml developer can extend the platform with a
new plug-in in order to add new analyzers or functionalities. This
talk will give a survey of Frama-C and show how to implement a new
plug-in in OCaml.

[Slides](slides/framac2011.pdf)
| [Video](https://youtu.be/TgaWYzHW33s)

### JoCaml, by Luc Maranget

[JoCaml](http://jocaml.inria.fr/) is an extension of Objective Caml
for concurrent and distributed programming. The last released version
of JoCaml features an extended library intended to facilitate the
programming of master/slave distributed applications aware of failures
and machine heterogeneity, and the control of forked programs. I'll
illustrate this new functionalities by the means of simple examples,
where JoCaml acts as a coordination language.

[Slides](slides/jocaml2011.pdf)
| [Video](https://youtu.be/dQl0BUE1WGw)

### The Eternal Solution for Memoisation: Ephemerons, by François Bobot

Memoization is a powerful tool for writing neat programs but yet
efficient ones. It stores previous function results for latter use. To
avoid memory leaks, a perfect memoization technique would let a
function result be reclaimed as soon as the function argument is
reclaimed. It can be proved that a perfect solution cannot be
implemented with the current Ocaml runtime. We propose a modification
to the Ocaml runtime which provides Hayes's ephemerons. It is then
possible to implement perfect memoization tables.

[Slides](slides/memoization2011.pdf)
| [Video](https://youtu.be/i8U3Y7C6eIs)

### OCAPIC: programming PIC microcontrollers with Objective Caml, by Benoît Vaugon and Philippe Wang

OCAPIC provides means to program PIC microcontrollers with Objective
Caml (with no language restrictions, only library changes). Very tight
PIC µC resources (only 4KB of volatile memory, at most) made this task
a great challenge that has been successfully addressed.

OCAPIC includes OCamlClean, a tool to reduce bytecode binaries by
eliminating dead code (works with any binary produced by compiler
ocamlc).

[OCAPIC's website](http://www.algo-prog.info/ocaml_for_pic/)
| [Slides](slides/ocapic-ocamlmeeting-2011.pdf)
| [Video](https://youtu.be/ZLTWLrTCd4s)

### Ideas for a Modern OCaml Web Portal by Ashish Agarwal

OCaml lacks the web presence it deserves. The purpose of this talk is
to foster discussion of what we as a community want from a modern web
portal for OCaml, and how we can begin implementing it. The discussion
will be guided by a presentation covering: desired content and design,
technological implementation choices, and management of such an
effort.

Ashish Agarwal is a Research Scientist at New York University, where
he uses OCaml to build bioinformatics software.

[Slides](slides/ocaml-website-2011.pdf)
| [Video](https://youtu.be/W7_wIjvg_is)

## List of participants

1. Adrien Guatto,	UPMC & LIENS
2. Alain Frisch, 	LexiFi
3. Alessandro Strada
4. Anil Madhavapeddy, 	University of Cambridge
5. Anton Kolotaev, 	INRIA
6. Ashish Agarwal, 	New York University
7. Benjamin Canou, 	UPMC
8. Benoît Vaugon, 	Université Pierre et Marie Curie
9. Boris Yakobowski, 	CEA LIST
10. Christophe Troestler, 	Université de Mons
11. Cécile Stentzel, 	INRIA
12. Cédric Pasteur, 	LIENS
13. Damien Doligez, 	INRIA
14. Dana Xu, 	INRIA
15. Daniel Bünzli
16. Dario Teixeir
17. David Teller, 	MLstate
18. Dmitry Bely
19. Esther Baruk, 	Université Paris 7 / LexiFi
20. Fabrice Le Fessant, 	INRIA -- OCamlPro
21. François Bobot, 	Paris XI -- INRIA
22. Gabriel de Perthuis
23. Gabriel Kerneis, 	Laboratoire PPS, Paris
24. Grégoire Henry, 	IRILL
25. Jaap Boender, 	IRILL
26. Jacques Le Normand, 	LexiFi
27. Jean-Vincent Loddo, 	LIPN, Université Paris 13
28. Jonathan Derque
29. Jonathan Protzenko
30. Julien Signoles, 	CEA LIST
31. Jérémie Dimino
32. Kaustuv Chaudhuri, 	INRIA
33. Kim Nguyen, 	LRI, Université Paris-Sud 11
34. Laurent Carrié, 	Thales
35. Leonard Gerard, 	Université Paris-Sud 11 / LIENS
36. Louis Mandel, 	Université Paris-Sud 11
37. Luc Maranget, 	INRIA
38. Luca Saiu, 	LIPN, Université Paris 13
39. Markus Weißmann, 	TUM
40. Mathias Kende, 	PPS
41. Mehdi Dogguy
42. Meriem Zidouni, 	Inria rocquencourt
43. Mikolaj Konarski, 	funktory.com
44. Nicolas Pouillard, 	INRIA
45. Olivier Andrieu, 	Esterel Technologies
46. Paolo Donadeo, 	Studio Associato 4Sigma
47. Paolo Herms, 	CEA LIST — INRIA
48. Philippe Cantin
49. Philippe Veber, 	INRA
50. Philippe Wang, 	Université Pierre et Marie Curie / LIP6
51. Pierre Chambart, 	Irill
52. Raphael Proust, 	ENS Cachan (student)
53. Richard Jones, 	Red Hat
54. Roberto Di Cosmo, 	IRILL
55. Samuel Mimram, 	CEA, LIST
56. Stéphane Glondu
57. Sylvain Le Gall, 	OCamlCore SARL
58. Thomas Gazagnaire, 	INRIA / OcamlPro
59. Tiphaine Turpin
60. Victor Nicollet, 	RunOrg
61. Vincent Balat, 	IRILL Université Paris Diderot
62. Vivien Ravet, 	LIP6
63. Xavier Leroy, 	INRIA Paris-Rocquencourt
64. Yann Regis-Gianas, 	PPS - Paris 7 - INRIA pi.r2


## Hacking day

Like last year, a Hacking day ( or week-end if you are motivated
enough ) will be organised. It will hosted by IRILL,
[http://www.irill.org/about/access](http://www.irill.org/about/access).
Access to the building is restricted, more information will be given
at the meeting.

For more information, contact Pierre Chambart (chambart `AT`
crans.org) which is kindly organizing this hacking day.

## Organization team

Team list:

- Sylvain Le Gall
- Dario Teixeira who has contributed a large part of the registration website
- Pierre Chambart (chambart `AT` crans.org) for the hacking day
- Paolo Herms who will handle the welcome stand 
