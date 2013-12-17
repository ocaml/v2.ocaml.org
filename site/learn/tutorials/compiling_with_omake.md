<!-- ((! set title Compiling with OMake !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Compiling with OMake

Here is the summary on how to compile an OCaml program with
[OMake](http://omake.metaprl.org/ "OMake"). It produces a native code
executable or a bytecode executable if ocamlopt is not available, using
ocamllex, ocamlyacc and regular ocaml files that use camlp4 syntax
libraries as well as regular libraries, all managed by
findlib/ocamlfind:

1. Do `omake --install`: it creates a template OMakefile and OMakeroot
 in the current directory. The OMakeroot file is left unchanged. The
 OMakefile template doesn't show options for using ocamlfind, so we
 will basically rewrite it, and grab some of the additional options
 that are shown in the file.
1. Our source files are `parser.mly`, `lexer.mll` and `main.ml`. Delete
 or comment out the content of the automatically generated OMakefile,
 and put the following:

```
# Program name (without extension)
PROGRAM = myprog

# Source files without extension. One item per line, no trailing spaces.
FILES[] =
   parser
   lexer
   main
# Another syntax for the same thing:
# FILES = parser lexer \
#         main

# We use ocamlfind
USE_OCAMLFIND = true
# All ocamlfind packages that we use
OCAMLPACKS[] =
   unix
   micmatch_pcre
   labltk
# We need to tell omake that we want camlp4 preprocessing
OCAMLFINDFLAGS = -syntax camlp4o

# We need to tell OMake that these files need to be created
# before it attempts to run ocamldep.
# (OMake knows that ocamllex and ocamlyacc should be used)
OCamlGeneratedFiles(lexer.ml parser.mli parser.ml)

# Compile into an executable
OCamlProgram($(PROGRAM), $(FILES))

# Default target: compile into bytecode or native code, or both
.DEFAULT: $(if $(BYTE_ENABLED), $(PROGRAM).run) \
          $(if $(NATIVE_ENABLED), $(PROGRAM).opt)

# Cleanup
.PHONY: clean
clean:
  rm -f \
     $(filter-proper-targets $(glob $(addsuffix .*, $(FILES)))) \
     $(PROGRAM).run $(PROGRAM).opt
```
Adapt your OMakefile to suit your needs in terms of source files, result
files, libraries and options. Now you can run omake, it should compile
an executable named either myprog.run (bytecode) or myprog.opt (native
code), or whatever you chose to call it. The omake clean command removes
files that were produced by the compilation.

Go to [OMake&#39;s official
site](http://omake.metaprl.org/ "OMake's official site") for more
information.


