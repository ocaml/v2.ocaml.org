OCAML.ORG PROJECT
=================
This is the source code implementing the ocaml.org
website. Information here is relevant only to developers and content
contributors. End-users of the website should simply visit the
website, which is hosted at http://ocaml.org.


DEPENDENCIES
============
Building the html pages requires:

* bash
* curl
* rsync
* GNU make
* ocaml >= 3.12.0 (the presence of ocamlopt is required)
* ocamlfind
* mpp >= 0.1.2
* omd >= 0.7.0
* netstring, netclient, and rss (for rss2html.ml)

If you use opam, the OCaml packages above can be installed by running:

    opam install ocamlfind mpp omd ocamlnet ocamlrss


BUILD
=====
The site consists only of static pages, so can be built and run
entirely on a local machine without dependencies on external file or
database servers. Simply run:

    make

This will generate a new folder `ocaml.org` that contains the full
website.  If you want to be able to point your browser to `ocaml.org`,
run instead `make preview` which will ensure that the links work
locally (and not only on the server).

DIRECTORY STRUCTURE
===================
`site` - Main content of the site. Most files are in Markdown syntax
         and converted to HTML by the build scripts.

`template` - Templates governing the overall look and feel of the
             site. These are applied to the pages within site/ when
             the site is built. References to templates within site
             pages should be of the form `template/template-file-name`
             because the build script assumes this directory
             structure.

`script` - Scripts used to build the site.


CONTACTS
========
For general discussion about the site's implementation, you can post
to the
[infrastructure](http://lists.ocaml.org/listinfo/infrastructure)
mailing list.

For a specific bug report, content suggestion, or feature request,
please create an issue on
[GitHub](https://github.com/ocaml/ocaml.org). Or best of all, fork the
repo, make changes to your copy, and submit pull requests. It's that
easy!
