<head>
<title>Compiling with GNU make</title>
</head>
<body>
<h1><span>Compiling with GNU make</span></h1>

<h2><a name="using_gnu_make_with_ocamlmakefile">Using GNU make with OCamlMakefile</a></h2>


<p><a href="http://omake.metaprl.org/index.html" class="external" title="OCamlMakefile">OCamlMakefile</a> is a generic Makefile that greatly facilitates the process of compiling complex OCaml projects.</p>

<p>For a basic OCaml program or library that doesn't use any library besides the standard library, just copy OCamlMakefile to the current directory and create the following Makefile:</p>

<pre>RESULT = myprogram
SOURCES = \
  mymodule1.mli mymodule1.ml \
  myparser.mli myparser.mly mylexer.mll mymodule2.ml \
  mymainprogram.ml

OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)</pre>

<p>This is already a fairly complex program which has 5 compilation units and uses ocamlyacc and ocamllex. Only the source files must be given, except for the .mli files that are produced by ocamlyacc, myparser.mli in the example.</p>

<p>The included OCamlMakefile provides a variety of targets. For details please refer to the documentation of OCamlMakefile, but here are the main ones:
</p>

<pre>nc     make a native code executable
bc     make a bytecode executable
ncl    make a native code library
bcl    make a bytecode library
libinstall    install library with ocamlfind
libuninstall  uninstall library with ocamlfind
top    make a custom toplevel from all your modules
clean  remove everything that matches one of the files that could have been
       automatically created by OCamlMakefile</pre>

<h2><a name="ocamlmakefile_plus_libraries">OCamlMakefile + libraries + Camlp4 parsing</a></h2>

<p>The recommended tool for installing OCaml libraries is <a href="http://www.camlcity.org/archive/programming/findlib.html" class="external" title="Findlib">Findlib</a> (ocamlfind command) since it knows where packages are installed, loads their dependencies and knows which file should be used in a given situation.</p>

<p>If you do not use Findlib, loading a regular runtime library can be done by setting the LIBS and INCDIRS variable. LIBS is the list of the name of the library files (xxx.cma or xxx.cmxa) without the .cma or .cmxa extension:</p>

<pre>LIBS = str unix</pre>

<p>If you use non-standard libraries that are not installed in the same directory as the standard library, the INCDIRS variable must contain the list of these directories:</p>

<pre>INCDIRS = /path/to/somelibdirectory/</pre>

<p>Usually this requires some preliminary configuration as it is traditionally performed with a configure script since the path can vary from one installation to another. An exception is when using standard directories which are not included in the search path by default such as /path/to/stdlib/camlp4. In this case, this should be enough and portable:</p>

<pre>INCDIRS = +camlp4</pre>

<p>OK, but we prefer libraries that are installed with ocamlfind. To use them with OCamlMakefile, the PACKS variable must be set:</p>

<pre>PACKS = netstring num</pre>
<p>Note that libraries that not part of the standard library but are shipped with any standard OCaml installation such as unix, str or bigarray are automatically considered as Findlib packages. Any package which is required by a given package (e.g. netstring requires unix and pcre) is automatically loaded.</p>

<p>How about Camlp4 syntax extensions? Some packages may define syntax extensions, which are bytecode units that are loaded by the preprocessor. With OCamlMakefile, a preprocessor to be used can be defined in the first line of the file:</p>

<pre>(*pp ...</pre>
<p>So it could be something like:</p>

<pre>(*pp camlp4o -I /path/to/pa_infix pa_infix.cmo *)</pre>
<p>Well, this form is not very convenient, so we will use the same preprocessor for each file and store its value in the PP variable of the Makefile:</p>

<pre>PP = camlp4o -I /path/to/pa_infix pa_infix.cmo
export PP</pre>

<p>So each OCaml file will start with:</p>

<pre>(*pp $PP *)</pre>
<p>This way of defining the preprocessor is still not satisfying: we would like to take advantage of ocamlfind to load the appropriate syntax extension files. For this, we will use the <a href="http://martin.jambon.free.fr/ocaml.html" class="external" title="camlp4find script">camlp4find script</a>. Every package which we use will listed as usual in the PACKS variable, and camlp4find will call ocamlfind to know which syntax extensions to load:</p>

<pre>PACKS = unix micmatch_pcre \
   pa_tryfinally pa_lettry pa_forin pa_forstep pa_repeat pa_arg
PP = camlp4find $(PACKS)
export PP</pre>

<p><strong>Summary:</strong></p>

<p>You need:</p>

<ul>
	<li>GNU make</li>
  <li>OCamlMakefile (copied to the project's main directory)</li>
  <li>Findlib (ocamlfind)</li>
  <li>camlp4find (copied to the project's main directory)</li>
  <li>Camlp4 packages installed with ocamlfind</li>
  <li>write a small Makefile according to the template below</li>
  <li>add a constant magic line at the beginning of your source files</li>
</ul>

<p>Full example using ocamllex and the unix and micmatch_pcre libraries. The Makefile file would be:</p>

<pre>RESULT = myprogram
SOURCES = mymodule1.mll mymodule2.mli mymodule2.ml mymainmodule.ml
PACKS = unix micmatch_pcre
PP = camlp4find $(PACKS)
export PP
CREATE_LIB = yes # ???
OCAMLMAKEFILE = OCamlMakefile
include $(OCAMLMAKEFILE)</pre>

<p>And each .ml or .mli file starts with:</p>

<pre>(*pp $PP *)</pre>