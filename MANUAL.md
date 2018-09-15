# How to Add a New Version of the Manual

1. We do not use the sources of the manual, but rather check in the
   built html. Why?
    1. Building is relatively heavyweight and only needs to
       be done when new releases happen.
    2. The prerequisites sometimes change between versions so
       hand-intervention can be required.
    3. We wish to have the manuals for multiple different versions of
       OCaml online, and would have to check out each of those
       versions separately, construct the manual, and install it,
       every single time the web site is updated, even though the manual
       for that version will never change post-release.
2. Therefore, to add a new version of the manual, the maintainer
   builds the HTML for that version and checks it in.
3. Building the HTML for the manual:
    1. Building the manual for a new OCaml release requires the entire
       source be built, so first, clone the appropriate branch from
       https://www.github.com/ocaml/ocaml
       For example, you might:
       ```
       git clone -b 4.08 https://github.com/ocaml/ocaml.git
       ```
    2. Building the manual requires binaries from inside the build, so
       you must follow the directions in the checked-out INSTALL.md,
       which typically are:
       ```
       ./configure && make world.opt
       ```
    3. Two additional tools, a full TeX distribution, and HeVeA, must
       also be installed on your machine. HeVeA is in OPAM. Install a
       very recent TeX by whatever means seem appropriate for your OS.
    4. Then do `make` in `manual/`. The output of interest will
       be the contents of `manual/manual/htmlman`.
4. Each version of the manual goes into a subdirectory named after its
   version number. For example, 4.08 would go into a directory named
   (logically enough) `manual/4.08`. So, recursively copy `htmlman`
   into the proper subdir, say `site/manual/4.08`, and commit it.
5. The top-level `Makefile` is in charge of copying the directories
   for the provided versions of the manual to the appropriate places
   in `ocaml.org/manual` and symlinking the latest version from
   `manual/latest`, but it will need the variable `LATEST` to be
   updated so that it will symlink the correct version of the manual
   to `LATEST`.
