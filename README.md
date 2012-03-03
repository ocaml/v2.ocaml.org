THE OCAML.ORG PROJECT
=====================
(This README assumes the domain ocaml.org has been obtained by this
project, but that is not yet currently the case. For now, the site is
visible only locally when you run 'make'.)

This is the source code implementing http://ocaml.org. Information
here is relevant only to developers and content
contributors. End-users of the website should simply visit
http://ocaml.org.


DEPENDENCIES
============
Building the html pages requires:
* ocaml
* oasis
* [weberizer](https://github.com/Chris00/weberizer)

Weberizer is Christophe Troestler's templating tool. It allows us to
easily provide a consistent design to multiple pages. You will only
need to understand this tool if you are contributing design
changes. Content contributors can focus on the pure html source within
src/html/.


BUILD
=====
Currently the site consists only of static html pages, and so can be
built and run entirely on a local machine without dependencies on
external file or database servers. Simply run:

    oasis setup
    make

This will generate a new folder 'en' that contains the full website.


PUBLISH
=======
Changes can be published by running:

    make publish

Of course, this is only allowed by the project lead that has write
permission to the production server. Other contributors should send a
message to the mailing list.


CONTACTS
========
You can reach the development team by posting to the [mailing
list](https://lists.forge.ocamlcore.org/cgi-bin/listinfo/ocamlweb-devel).

To begin contributing, visit the [master
repo](https://github.com/agarwal/ocamlorg) on github, click the Fork
button, make changes to your copy, and submit pull requests. It's that
easy!
