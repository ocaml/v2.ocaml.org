<head>
<title>Compiling with OMake</title>
</head>
<body>
<h1><span>Compiling with OMake</span></h1>

<p class="first_para">Here is the summary on how to compile an OCaml program with <a href="http://omake.metaprl.org/" class="external" title="OMake">OMake</a>. It produces a native code executable or a bytecode executable if ocamlopt is not available, using ocamllex, ocamlyacc and regular ocaml files that use camlp4 syntax libraries as well as regular libraries, all managed by findlib/ocamlfind:</p>

<ol>
	<li>Do <code>omake --install</code>: it creates a template OMakefile and OMakeroot in the current directory. The OMakeroot file is left unchanged. The OMakefile template doesn't show options for using ocamlfind, so we will basically rewrite it, and grab some of the additional options that are shown in the file.</li>
	<li>Our source files are <code>parser.mly</code>, <code>lexer.mll</code> and <code>main.ml</code>. Delete or comment out the content of the automatically generated OMakefile, and put the following:</li>
</ol>



<pre>
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
# before it attempts to run <code>ocamldep</code>.
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
</pre>

<p>Adapt your OMakefile to suit your needs in terms of source files, result files, libraries and options. Now you can run omake, it should compile an executable named either myprog.run (bytecode) or myprog.opt (native code), or whatever you chose to call it. The omake clean command removes files that were produced by the compilation.</p>

<p>Go to <a href="http://omake.metaprl.org/" class="external" title="OMake's official site">OMake's official site</a> for more information.</p>
