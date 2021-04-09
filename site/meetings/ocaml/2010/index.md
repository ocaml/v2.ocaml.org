<!-- ((! set title 2010 !)) -->

*Table of contents*

# OCaml Users Meeting 2010

Location: **Paris, France**  
Date: Wednesday 4th February 2009

## Talks

[Video Playlist](https://www.youtube.com/playlist?list=PLbU5HH3lhSGYrfbHSwC7X5ZzDHddXHMM7)

* 09:30 - 10:30: Foreword by Xavier Leroy, [Video](https://youtu.be/2_eVOy8w1tc), [Slides](slides/leroy-cug2010.pdf)
* 10:30 - 10:45: OCamlCore.org news and projects by Sylvain Le Gall 
* 10:45 - 11:15: Enforcing Type-Safe Linking using Inter-Package Relationships for OCaml Debian packages by Stefano Zacchiroli 
* 11:30 - 12:00: OASIS, a Cabal like system for OCaml, by Sylvain Le Gall 
* 12:00 - 12:30: Cluster computing in Ocaml, by Gerd Stolpmann 
* 12:30 - 13:00: Ocaml in a web startup, by Dario Teixeira 
* 14:30 - 15:00: React, functional reactive programming for OCaml, by Daniel Bünzli
* 15:00 - 15:30: Ocamlviz by Sylvain Conchon 
* 15:30 - 16:00: OC4MC : Objective Caml for MultiCore, by Benjamin Canou [Video](https://youtu.be/soOaUFzbXyQ)
* 16:30 - 17:00: Cooperative Light-Weight Threads by Jérémie Dimino [Video](https://youtu.be/C7Z0HduWGx8),
  [Slides](slides/lwt-2010.pdf)
* 17:00 - 17:30: The collaborative rendering farm: a JoCaml-powered desktop grid by William Le Ferrand,
  [Slides](slides/naclgrid-ec2-overview.pdf), [Video](https://youtu.be/Iae81LS8sWY)
* 17:30 - 18:00: OCaml in the clouds, by Anil Madhavapeddy

### OCamlCore.org news and projects by a member of the administration team

OCamlCore.org team is the group of people that takes care of administrative part of OCamlCore.org which is a set of
resource provided to the OCaml community like a forge and a planet.

This short talk will present what has been done during the last year on OCamlCore.org. It will also give some possible
direction on what this platform can offer to the OCaml community in the next year.

[Video](https://youtu.be/jGkBLivoML0)
 
### Enforcing Type-Safe Linking using Inter-Package Relationships for OCaml Debian packages by Stefano Zacchiroli

OCaml (as other strongly-typed languages) relies on link-time checks to ensure that type safety is not violated at the
borders of compilation units (the infamous "inconsistent assumptions ..." error). Such checks entail very fine-grained
dependencies among OCaml objects, which are at odds with the implicit assumption of backward compatibility that is
relied upon by common library packaging techniques adopted by FOSS package-based distributions. As a consequence,
package managers are unable to prevent users to install a set of libraries which cannot be linked together; in practice,
 that happen quite often during transitions from one version of the compiler (or of some "core" library) to the next.

We discuss how to guarantee link-time compatibility using package dependencies; in doing so, we take into account
real-life maintainability problems such as support for automatic package rebuild and manageability of ABI (Application
Binary Interface) strings by humans. We present the dh_ocaml implementation of the proposed solution, which is currently
in use in Debian to manager more than 300 OCaml packages.

[Slides](slides/ocaml-metting-2010-dh-ocaml.pdf)
| [Video](https://youtu.be/9WOyYrMz3F0)

### Ocamlviz by Julien Robert, Guillaume Von Tokarski, Sylvain Conchon, Jean-Christophe Filliâtre, Fabrice Le Fessant

Ocamlviz was a 2009 Jane Street Summer Project, by the first two authors and supervized by the last three. Ocamlviz is
a tool for real-time monitoring of Ocaml programs. It can be used to debug and to profile Ocaml programs, including
memory profiling. The talk will include a short demo.

[Video](https://youtu.be/NOY5CyTteFc)

### Cluster computing in Ocaml, by Gerd Stolpmann

Since 2006 Ocaml is being used as the implementation language for the backend of a commercial people search engine
(mylife.com, in the ComScore 100 list). In this talk I'll pick some examples from both the query path and the web
crawler, and demonstrate why Ocaml was an excellent choice. The focus will be on the networking code, and on the
challenge of running a software 24/7 in an environment where hardware failures happen every day. Software needs to be
extremely reliable, and there must be strategies of coping with failing hardwares.

[Slides](slides/cluster-omeeting2010.pdf)
| [Video](https://youtu.be/XkBFZ1W89fs)

### Ocaml in a web startup, by Dario Teixeira

This talk describes the experiences of using Ocaml/Ocsigen in a web startup, and introduces some of the resulting
projects, made available to the community as open-source. Most of our attention will be focused on Lambdium and Lambdoc.
The former is a basic blogging engine, while the latter is a library offering support for parsing multiple markup
languages in Ocsigen applications. Lambdoc is a good example of how Ocaml's type system can be used to ensure that
semantically-rich and flexible markup does not produce pathological documents.

[Slides](slides/ocaml-web-startup.pdf)
| [Video](https://youtu.be/0r6Y-38lh1s)

### React, functional reactive programming for OCaml, by Daniel Bünzli

React is an OCaml module for functional reactive programming (FRP). It provides support to program with time varying
values : applicative events and signals.

This talk will briefly introduce you to the FRP model, show you how React supports it and why you may want to use it in
your code.

[Slides](slides/react-ocamlum-2010.pdf)
| [Video](https://youtu.be/0-tVf9BFTMY)

### OASIS, a Cabal like system for OCaml, by Sylvain Le Gall

OASIS, formerly OCamlAutobuild, is a tool inspired from Cabal to ease OCaml software and library distribution. The main
point is to be able to quickly write a small description of your project that can be translated to a build system. Then
third-parties use it to ease distribution of your library/software starting with this OASIS description:

* synchronizing GODI and Debian package
* generating META file
* creating small website for your project

This talk presents some features of OASIS and how an existing OCaml project can use it.

[Slides](slides/OCamlMeeting2010_OASIS_Slides.pdf)
| [Video](https://youtu.be/VHmMD2u9iRU)

## Participants

There were 75 participants during the meeting.