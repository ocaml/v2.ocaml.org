# Dependencies

  * rsync
  * mpp >= 0.1.1 (available as an opam package)
  * omd >= 0.6.1 (available as an opam package)
  * gnu make
  * bash
  * ocamlopt
  * ocamlfind
  * rss2html.ml needs packages {bigarray,unix,str,netsys,xmlm,netclient,rss} to compile (packages available in opam)

If opam is installed, you may run: `opam install ocamlfind mpp omd ocamlnet xmlm ocamlrss`.

# How to build the web site

Once you have the dependencies, the following command should build a
directory called `src/ocaml.org`, which would contain the generated
website. `cd src && make`

If the command fails, check your dependencies. And of course, if you
have contributed, check your contributions. 
Otherwise, please file a bug report.

# How to contribute

Files that should end up on the web site are in `src/site`, they
include markdown files, pictures, JS files, CSS, etc.
Files that are used to build the web site, which are more "software"
than contents are in `src/` (e.g., Makefiles) and `src/tpl` (i.e.,
template files).

When using a template in a file in `src/site`, one should always refer
to it as `tpl/template-file-name` as the building script runs from
`src`. Also, having `tpl/` in the filename means you don't need to
have any `tpl` prefix or suffix in your template filename.

