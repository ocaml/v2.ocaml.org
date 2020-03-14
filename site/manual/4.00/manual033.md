<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li class="active"><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc248"><span>Chapter 19</span></a>&nbsp;&nbsp;Interfacing<a name="c:intf-c"></a> C with OCaml</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Interfacing C with OCaml</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc142">Overview and compilation information</a>
</li><li><a href="#toc143">The <tt>value</tt> type</a>
</li><li><a href="#toc144">Representation of OCaml data types</a>
</li><li><a href="#toc145">Operations on values</a>
</li><li><a href="#toc146">Living in harmony with the garbage collector</a>
</li><li><a href="#toc147">A complete example</a>
</li><li><a href="#toc148">Advanced topic: callbacks from C to OCaml</a>
</li><li><a href="#toc149">Advanced example with callbacks</a>
</li><li><a href="#toc150">Advanced topic: custom blocks</a>
</li><li><a href="#toc151">Advanced topic: multithreading</a>
</li><li><a href="#toc152">Building mixed C/OCaml libraries: <tt>ocamlmklib</tt></a>
</li></ul></nav></header>
<p>This chapter describes how user-defined primitives, written in C, can
be linked with OCaml code and called from OCaml functions.</p><h2 class="section"><a name="toc142"></a><a name="htoc249">1</a>&nbsp;&nbsp;Overview and compilation information</h2><h3 class="subsection"><a name="htoc250">19.1.1</a>&nbsp;&nbsp;Declaring primitives</h3><p>
User primitives are declared in an implementation file or
<tt>struct</tt>…<tt>end</tt> module expression using the <tt>external</tt> keyword:
</p><pre>        external <i>name</i> : <i>type</i> = <i>C-function-name</i>
</pre><p>
This defines the value name <i>name</i> as a function with type
<i>type</i> that executes by calling the given C function.
For instance, here is how the <tt>input</tt> primitive is declared in the
standard library module <tt>Pervasives</tt>:
</p><pre>        external input : in_channel -&gt; string -&gt; int -&gt; int -&gt; int
                       = "input"
</pre><p>Primitives with several arguments are always curried. The C function
does not necessarily have the same name as the ML function.</p><p>External functions thus defined can be specified in interface files or
<tt>sig</tt>…<tt>end</tt> signatures either as regular values
</p><pre>        val <i>name</i> : <i>type</i>
</pre><p>
thus hiding their implementation as a C function, or explicitly as
“manifest” external functions
</p><pre>        external <i>name</i> : <i>type</i> = <i>C-function-name</i>
</pre><p>
The latter is slightly more efficient, as it allows clients of the
module to call directly the C function instead of going through the
corresponding OCaml function.</p><p>The arity (number of arguments) of a primitive is automatically
determined from its OCaml type in the <tt>external</tt> declaration, by
counting the number of function arrows in the type. For instance,
<tt>input</tt> above has arity 4, and the <tt>input</tt> C function is called with
four arguments. Similarly,
</p><pre>    external input2 : in_channel * string * int * int -&gt; int = "input2"
</pre><p>has arity 1, and the <tt>input2</tt> C function receives one argument (which
is a quadruple of OCaml values).</p><p>Type abbreviations are not expanded when determining the arity of a
primitive. For instance,
</p><pre>        type int_endo = int -&gt; int
        external f : int_endo -&gt; int_endo = "f"
        external g : (int -&gt; int) -&gt; (int -&gt; int) = "f"
</pre><p><tt>f</tt> has arity 1, but <tt>g</tt> has arity 2. This allows a primitive to
return a functional value (as in the <tt>f</tt> example above): just remember
to name the functional return type in a type abbreviation.</p><h3 class="subsection"><a name="htoc251">19.1.2</a>&nbsp;&nbsp;Implementing primitives</h3><p>User primitives with arity <i>n</i> ≤ 5 are implemented by C functions
that take <i>n</i> arguments of type <tt>value</tt>, and return a result of type
<tt>value</tt>. The type <tt>value</tt> is the type of the representations for OCaml
values. It encodes objects of several base types (integers,
floating-point numbers, strings, …), as well as OCaml data
structures. The type <tt>value</tt> and the associated conversion
functions and macros are described in details below. For instance,
here is the declaration for the C function implementing the <tt>input</tt>
primitive:
</p><pre>CAMLprim value input(value channel, value buffer, value offset, value length)
{
  ...
}
</pre><p>When the primitive function is applied in an OCaml program, the C
function is called with the values of the expressions to which the
primitive is applied as arguments. The value returned by the function is
passed back to the OCaml program as the result of the function
application.</p><p>User primitives with arity greater than 5 should be implemented by two
C functions. The first function, to be used in conjunction with the
bytecode compiler <tt>ocamlc</tt>, receives two arguments: a pointer to an
array of OCaml values (the values for the arguments), and an
integer which is the number of arguments provided. The other function,
to be used in conjunction with the native-code compiler <tt>ocamlopt</tt>,
takes its arguments directly. For instance, here are the two C
functions for the 7-argument primitive <tt>Nat.add_nat</tt>:
</p><pre>CAMLprim value add_nat_native(value nat1, value ofs1, value len1,
                              value nat2, value ofs2, value len2,
                              value carry_in)
{
  ...
}
CAMLprim value add_nat_bytecode(value * argv, int argn)
{
  return add_nat_native(argv[0], argv[1], argv[2], argv[3],
                        argv[4], argv[5], argv[6]);
}
</pre><p>The names of the two C functions must be given in the primitive
declaration, as follows:
</p><pre>        external <i>name</i> : <i>type</i> =
                 <i>bytecode-C-function-name native-code-C-function-name</i>
</pre><p>
For instance, in the case of <tt>add_nat</tt>, the declaration is:
</p><pre>        external add_nat: nat -&gt; int -&gt; int -&gt; nat -&gt; int -&gt; int -&gt; int -&gt; int
                        = "add_nat_bytecode" "add_nat_native"
</pre><p>
Implementing a user primitive is actually two separate tasks: on the
one hand, decoding the arguments to extract C values from the given
OCaml values, and encoding the return value as an OCaml
value; on the other hand, actually computing the result from the arguments.
Except for very simple primitives, it is often preferable to have two
distinct C functions to implement these two tasks. The first function
actually implements the primitive, taking native C values as
arguments and returning a native C value. The second function,
often called the “stub code”, is a simple wrapper around the first
function that converts its arguments from OCaml values to C values,
call the first function, and convert the returned C value to OCaml
value. For instance, here is the stub code for the <tt>input</tt>
primitive:
</p><pre>CAMLprim value input(value channel, value buffer, value offset, value length)
{
  return Val_long(getblock((struct channel *) channel,
                           &amp;Byte(buffer, Long_val(offset)),
                           Long_val(length)));
}
</pre><p>(Here, <tt>Val_long</tt>, <tt>Long_val</tt> and so on are conversion macros for the
type <tt>value</tt>, that will be described later. The <tt>CAMLprim</tt> macro
expands to the required compiler directives to ensure that the
function following it is exported and accessible from OCaml.)
The hard work is performed by the function <tt>getblock</tt>, which is
declared as:
</p><pre>long getblock(struct channel * channel, char * p, long n)
{
  ...
}
</pre><p>
To write C code that operates on OCaml values, the following
include files are provided:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Include file</b></td><td align="center" nowrap=""><b>Provides</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
<tt>caml/mlvalues.h</tt></td><td valign="top" align="left">definition of the <tt>value</tt> type, and conversion macros</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/alloc.h</tt></td><td valign="top" align="left">allocation functions (to create structured OCaml
objects)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/memory.h</tt></td><td valign="top" align="left">miscellaneous memory-related functions
and macros (for GC interface, in-place modification of structures, etc).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/fail.h</tt></td><td valign="top" align="left">functions for raising exceptions
(see section&nbsp;<a href="#s:c-exceptions">19.4.5</a>)</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/callback.h</tt></td><td valign="top" align="left">callback from C to OCaml (see
section&nbsp;<a href="#s:callback">19.7</a>).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/custom.h</tt></td><td valign="top" align="left">operations on custom blocks (see
section&nbsp;<a href="#s:custom">19.9</a>).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/intext.h</tt></td><td valign="top" align="left">operations for writing user-defined
serialization and deserialization functions for custom blocks
(see section&nbsp;<a href="#s:custom">19.9</a>).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml/threads.h</tt></td><td valign="top" align="left">operations for interfacing in the presence
of multiple threads (see section&nbsp;<a href="#s:C-multithreading">19.10</a>).</td></tr>
</tbody></table></div><p>
These files reside in the <tt>caml/</tt> subdirectory of the OCaml
standard library directory (usually <tt>/usr/local/lib/ocaml</tt>).</p><h3 class="subsection"><a name="htoc252">19.1.3</a>&nbsp;&nbsp;Statically linking C code with OCaml code</h3><p>
<a name="staticlink-c-code"></a></p><p>The OCaml runtime system comprises three main parts: the bytecode
interpreter, the memory manager, and a set of C functions that
implement the primitive operations. Some bytecode instructions are
provided to call these C functions, designated by their offset in a
table of functions (the table of primitives).</p><p>In the default mode, the OCaml linker produces bytecode for the
standard runtime system, with a standard set of primitives. References
to primitives that are not in this standard set result in the
“unavailable C primitive” error. (Unless dynamic loading of C
libraries is supported – see section&nbsp;<a href="#dynlink-c-code">19.1.4</a> below.)</p><p>In the “custom runtime” mode, the OCaml linker scans the
object files and determines the set of required primitives. Then, it
builds a suitable runtime system, by calling the native code linker with:
</p><ul class="itemize"><li class="li-itemize">
the table of the required primitives;
</li><li class="li-itemize">a library that provides the bytecode interpreter, the
memory manager, and the standard primitives;
</li><li class="li-itemize">libraries and object code files (<tt>.o</tt> files) mentioned on the
command line for the OCaml linker, that provide implementations
for the user’s primitives.
</li></ul><p>
This builds a runtime system with the required primitives. The OCaml
linker generates bytecode for this custom runtime system. The
bytecode is appended to the end of the custom runtime system, so that
it will be automatically executed when the output file (custom
runtime + bytecode) is launched.</p><p>To link in “custom runtime” mode, execute the <tt>ocamlc</tt> command with:
</p><ul class="itemize"><li class="li-itemize">
the <tt>-custom</tt> option;
</li><li class="li-itemize">the names of the desired OCaml object files (<tt>.cmo</tt> and <tt>.cma</tt> files) ;
</li><li class="li-itemize">the names of the C object files and libraries (<tt>.o</tt> and <tt>.a</tt>
files) that implement the required primitives. Under Unix and Windows,
a library named <tt>lib</tt><i>name</i><tt>.a</tt> (respectively, <tt>.lib</tt>) residing in one of the standard library directories can also be specified as <tt>-cclib -l</tt><i>name</i>.
</li></ul><p>If you are using the native-code compiler <tt>ocamlopt</tt>, the <tt>-custom</tt>
flag is not needed, as the final linking phase of <tt>ocamlopt</tt> always
builds a standalone executable. To build a mixed OCaml/C executable,
execute the <tt>ocamlopt</tt> command with:
</p><ul class="itemize"><li class="li-itemize">
the names of the desired OCaml native object files (<tt>.cmx</tt> and
<tt>.cmxa</tt> files);
</li><li class="li-itemize">the names of the C object files and libraries (<tt>.o</tt>, <tt>.a</tt>,
<tt>.so</tt> or <tt>.dll</tt> files) that implement the required primitives.
</li></ul><p>Starting with Objective Caml 3.00, it is possible to record the
<tt>-custom</tt> option as well as the names of C libraries in an OCaml
library file <tt>.cma</tt> or <tt>.cmxa</tt>. For instance, consider an OCaml library
<tt>mylib.cma</tt>, built from the OCaml object files <tt>a.cmo</tt> and <tt>b.cmo</tt>,
which reference C code in <tt>libmylib.a</tt>. If the library is
built as follows:
</p><pre>        ocamlc -a -o mylib.cma -custom a.cmo b.cmo -cclib -lmylib
</pre><p>
users of the library can simply link with <tt>mylib.cma</tt>:
</p><pre>        ocamlc -o myprog mylib.cma ...
</pre><p>
and the system will automatically add the <tt>-custom</tt> and <tt>-cclib -lmylib</tt> options, achieving the same effect as
</p><pre>        ocamlc -o myprog -custom a.cmo b.cmo ... -cclib -lmylib
</pre><p>
The alternative, of course, is to build the library without extra
options:
</p><pre>        ocamlc -a -o mylib.cma a.cmo b.cmo
</pre><p>
and then ask users to provide the <tt>-custom</tt> and <tt>-cclib -lmylib</tt>
options themselves at link-time:
</p><pre>        ocamlc -o myprog -custom mylib.cma ... -cclib -lmylib
</pre><p>
The former alternative is more convenient for the final users of the
library, however.</p><h3 class="subsection"><a name="htoc253">19.1.4</a>&nbsp;&nbsp;Dynamically linking C code with OCaml code</h3><p>
<a name="dynlink-c-code"></a></p><p>Starting with Objective Caml 3.03, an alternative to static linking of C code
using the <tt>-custom</tt> code is provided. In this mode, the OCaml linker
generates a pure bytecode executable (no embedded custom runtime
system) that simply records the names of dynamically-loaded libraries
containing the C code. The standard OCaml runtime system <tt>ocamlrun</tt>
then loads dynamically these libraries, and resolves references to the
required primitives, before executing the bytecode.</p><p>This facility is currently supported and known to work well under
Linux, MacOS&nbsp;X, and Windows. It is supported, but not
fully tested yet, under FreeBSD, Tru64, Solaris and Irix. It is not
supported yet under other Unixes.</p><p>To dynamically link C code with OCaml code, the C code must first be
compiled into a shared library (under Unix) or DLL (under Windows).
This involves 1- compiling the C files with appropriate C compiler
flags for producing position-independent code (when required by the
operating system), and 2- building a
shared library from the resulting object files. The resulting shared
library or DLL file must be installed in a place where <tt>ocamlrun</tt> can
find it later at program start-up time (see
section&nbsp;<a href="manual024.html#s-ocamlrun-dllpath">10.3</a>).
Finally (step 3), execute the <tt>ocamlc</tt> command with
</p><ul class="itemize"><li class="li-itemize">
the names of the desired OCaml object files (<tt>.cmo</tt> and <tt>.cma</tt> files) ;
</li><li class="li-itemize">the names of the C shared libraries (<tt>.so</tt> or <tt>.dll</tt> files) that
implement the required primitives. Under Unix and Windows,
a library named <tt>dll</tt><i>name</i><tt>.so</tt> (respectively, <tt>.dll</tt>) residing
in one of the standard library directories can also be specified as
<tt>-dllib -l</tt><i>name</i>.
</li></ul><p>
Do <em>not</em> set the <tt>-custom</tt> flag, otherwise you’re back to static linking
as described in section&nbsp;<a href="#staticlink-c-code">19.1.3</a>.
The <tt>ocamlmklib</tt> tool (see section&nbsp;<a href="#s-ocamlmklib">19.11</a>)
automates steps 2 and 3.</p><p>As in the case of static linking, it is possible (and recommended) to
record the names of C libraries in an OCaml <tt>.cma</tt> library archive.
Consider again an OCaml library
<tt>mylib.cma</tt>, built from the OCaml object files <tt>a.cmo</tt> and <tt>b.cmo</tt>,
which reference C code in <tt>dllmylib.so</tt>. If the library is
built as follows:
</p><pre>        ocamlc -a -o mylib.cma a.cmo b.cmo -dllib -lmylib
</pre><p>
users of the library can simply link with <tt>mylib.cma</tt>:
</p><pre>        ocamlc -o myprog mylib.cma ...
</pre><p>
and the system will automatically add the <tt>-dllib -lmylib</tt> option,
achieving the same effect as
</p><pre>        ocamlc -o myprog a.cmo b.cmo ... -dllib -lmylib
</pre><p>
Using this mechanism, users of the library <tt>mylib.cma</tt> do not need to
known that it references C code, nor whether this C code must be
statically linked (using <tt>-custom</tt>) or dynamically linked.</p><h3 class="subsection"><a name="htoc254">19.1.5</a>&nbsp;&nbsp;Choosing between static linking and dynamic linking</h3><p>After having described two different ways of linking C code with OCaml
code, we now review the pros and cons of each, to help developers of
mixed OCaml/C libraries decide.</p><p>The main advantage of dynamic linking is that it preserves the
platform-independence of bytecode executables. That is, the bytecode
executable contains no machine code, and can therefore be compiled on
platform <i>A</i> and executed on other platforms <i>B</i>, <i>C</i>, …, as long
as the required shared libraries are available on all these
platforms. In contrast, executables generated by <tt>ocamlc -custom</tt> run
only on the platform on which they were created, because they embark a
custom-tailored runtime system specific to that platform. In
addition, dynamic linking results in smaller executables.</p><p>Another advantage of dynamic linking is that the final users of the
library do not need to have a C compiler, C linker, and C runtime
libraries installed on their machines. This is no big deal under
Unix and Cygwin, but many Windows users are reluctant to install
Microsoft Visual C just to be able to do <tt>ocamlc -custom</tt>.</p><p>There are two drawbacks to dynamic linking. The first is that the
resulting executable is not stand-alone: it requires the shared
libraries, as well as <tt>ocamlrun</tt>, to be installed on the machine
executing the code. If you wish to distribute a stand-alone
executable, it is better to link it statically, using <tt>ocamlc -custom -ccopt -static</tt> or <tt>ocamlopt -ccopt -static</tt>. Dynamic linking also
raises the “DLL hell” problem: some care must be taken to ensure
that the right versions of the shared libraries are found at start-up
time.</p><p>The second drawback of dynamic linking is that it complicates the
construction of the library. The C compiler and linker flags to
compile to position-independent code and build a shared library vary
wildly between different Unix systems. Also, dynamic linking is not
supported on all Unix systems, requiring a fall-back case to static
linking in the Makefile for the library. The <tt>ocamlmklib</tt> command
(see section&nbsp;<a href="#s-ocamlmklib">19.11</a>) tries to hide some of these system
dependencies.</p><p>In conclusion: dynamic linking is highly recommended under the native
Windows port, because there are no portability problems and it is much
more convenient for the end users. Under Unix, dynamic linking should
be considered for mature, frequently used libraries because it
enhances platform-independence of bytecode executables. For new or
rarely-used libraries, static linking is much simpler to set up in a
portable way.</p><h3 class="subsection"><a name="htoc255">19.1.6</a>&nbsp;&nbsp;Building standalone custom runtime systems</h3><p>
<a name="s:custom-runtime"></a></p><p>It is sometimes inconvenient to build a custom runtime system each
time OCaml code is linked with C libraries, like <tt>ocamlc -custom</tt> does.
For one thing, the building of the runtime system is slow on some
systems (that have bad linkers or slow remote file systems); for
another thing, the platform-independence of bytecode files is lost,
forcing to perform one <tt>ocamlc -custom</tt> link per platform of interest.</p><p>An alternative to <tt>ocamlc -custom</tt> is to build separately a custom
runtime system integrating the desired C libraries, then generate
“pure” bytecode executables (not containing their own runtime
system) that can run on this custom runtime. This is achieved by the
<tt>-make_runtime</tt> and <tt>-use_runtime</tt> flags to <tt>ocamlc</tt>. For example,
to build a custom runtime system integrating the C parts of the
“Unix” and “Threads” libraries, do:
</p><pre>        ocamlc -make-runtime -o /home/me/ocamlunixrun unix.cma threads.cma
</pre><p>To generate a bytecode executable that runs on this runtime system,
do:
</p><pre>        ocamlc -use-runtime /home/me/ocamlunixrun -o myprog \
                unix.cma threads.cma <i>your .cmo and .cma files</i>
</pre><p>
The bytecode executable <tt>myprog</tt> can then be launched as usual:
<tt>myprog</tt> <i>args</i> or <tt>/home/me/ocamlunixrun myprog</tt> <i>args</i>.</p><p>Notice that the bytecode libraries <tt>unix.cma</tt> and <tt>threads.cma</tt> must
be given twice: when building the runtime system (so that <tt>ocamlc</tt>
knows which C primitives are required) and also when building the
bytecode executable (so that the bytecode from <tt>unix.cma</tt> and
<tt>threads.cma</tt> is actually linked in).</p><h2 class="section"><a name="toc143"></a><a name="htoc256">2</a>&nbsp;&nbsp;The <tt>value</tt> type</h2><p>All OCaml objects are represented by the C type <tt>value</tt>,
defined in the include file <tt>caml/mlvalues.h</tt>, along with macros to
manipulate values of that type. An object of type <tt>value</tt> is either:
</p><ul class="itemize"><li class="li-itemize">
an unboxed integer;
</li><li class="li-itemize">a pointer to a block inside the heap (such as the blocks
allocated through one of the <code>caml_alloc_*</code> functions below);
</li><li class="li-itemize">a pointer to an object outside the heap (e.g., a pointer to a block
allocated by <tt>malloc</tt>, or to a C variable).
</li></ul><h3 class="subsection"><a name="htoc257">19.2.1</a>&nbsp;&nbsp;Integer values</h3><p>Integer values encode 31-bit signed integers (63-bit on 64-bit
architectures). They are unboxed (unallocated).</p><h3 class="subsection"><a name="htoc258">19.2.2</a>&nbsp;&nbsp;Blocks</h3><p>Blocks in the heap are garbage-collected, and therefore have strict
structure constraints. Each block includes a header containing the
size of the block (in words), and the tag of the block.
The tag governs how the contents of the blocks are structured. A tag
lower than <tt>No_scan_tag</tt> indicates a structured block, containing
well-formed values, which is recursively traversed by the garbage
collector. A tag greater than or equal to <tt>No_scan_tag</tt> indicates a
raw block, whose contents are not scanned by the garbage collector.
For the benefits of ad-hoc polymorphic primitives such as equality and
structured input-output, structured and raw blocks are further
classified according to their tags as follows:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Tag</b></td><td align="center" nowrap=""><b>Contents of the block</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
0 to <tt>No_scan_tag</tt>−1</td><td valign="top" align="left">A structured block (an array of
OCaml objects). Each field is a <tt>value</tt>.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>Closure_tag</tt></td><td valign="top" align="left">A closure representing a functional value. The first
word is a pointer to a piece of code, the remaining words are
<tt>value</tt> containing the environment.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>String_tag</tt></td><td valign="top" align="left">A character string.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>Double_tag</tt></td><td valign="top" align="left">A double-precision floating-point number.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>Double_array_tag</tt></td><td valign="top" align="left">An array or record of double-precision
floating-point numbers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>Abstract_tag</tt></td><td valign="top" align="left">A block representing an abstract datatype.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>Custom_tag</tt></td><td valign="top" align="left">A block representing an abstract datatype
with user-defined finalization, comparison, hashing,
serialization and deserialization functions atttached.</td></tr>
</tbody></table></div><h3 class="subsection"><a name="htoc259">19.2.3</a>&nbsp;&nbsp;Pointers outside the heap</h3><p>Any word-aligned pointer to an address outside the heap can be safely
cast to and from the type <tt>value</tt>. This includes pointers returned by
<tt>malloc</tt>, and pointers to C variables (of size at least one word)
obtained with the <code>&amp;</code> operator.</p><p>Caution: if a pointer returned by <tt>malloc</tt> is cast to the type <tt>value</tt>
and returned to OCaml, explicit deallocation of the pointer using
<tt>free</tt> is potentially dangerous, because the pointer may still be
accessible from the OCaml world. Worse, the memory space deallocated
by <tt>free</tt> can later be reallocated as part of the OCaml heap; the
pointer, formerly pointing outside the OCaml heap, now points inside
the OCaml heap, and this can confuse the garbage collector. To avoid
these problems, it is preferable to wrap the pointer in a OCaml block
with tag <tt>Abstract_tag</tt> or <tt>Custom_tag</tt>.</p><h2 class="section"><a name="toc144"></a><a name="htoc260">3</a>&nbsp;&nbsp;Representation of OCaml data types</h2><p>This section describes how OCaml data types are encoded in the
<tt>value</tt> type.</p><h3 class="subsection"><a name="htoc261">19.3.1</a>&nbsp;&nbsp;Atomic types</h3><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>OCaml type</b></td><td align="center" nowrap=""><b>Encoding</b></td></tr>
<tr><td align="left" nowrap="">
<tt>int</tt></td><td align="left" nowrap="">Unboxed integer values.</td></tr>
<tr><td align="left" nowrap=""><tt>char</tt></td><td align="left" nowrap="">Unboxed integer values (ASCII code).</td></tr>
<tr><td align="left" nowrap=""><tt>float</tt></td><td align="left" nowrap="">Blocks with tag <tt>Double_tag</tt>.</td></tr>
<tr><td align="left" nowrap=""><tt>string</tt></td><td align="left" nowrap="">Blocks with tag <tt>String_tag</tt>.</td></tr>
<tr><td align="left" nowrap=""><tt>int32</tt></td><td align="left" nowrap="">Blocks with tag <tt>Custom_tag</tt>.</td></tr>
<tr><td align="left" nowrap=""><tt>int64</tt></td><td align="left" nowrap="">Blocks with tag <tt>Custom_tag</tt>.</td></tr>
<tr><td align="left" nowrap=""><tt>nativeint</tt></td><td align="left" nowrap="">Blocks with tag <tt>Custom_tag</tt>.</td></tr>
</tbody></table></div><h3 class="subsection"><a name="htoc262">19.3.2</a>&nbsp;&nbsp;Tuples and records</h3><p>Tuples are represented by pointers to blocks, with tag&nbsp;0.</p><p>Records are also represented by zero-tagged blocks. The ordering of
labels in the record type declaration determines the layout of
the record fields: the value associated to the label
declared first is stored in field&nbsp;0 of the block, the value associated
to the label declared next goes in field&nbsp;1, and so on.</p><p>As an optimization, records whose fields all have static type <tt>float</tt>
are represented as arrays of floating-point numbers, with tag
<tt>Double_array_tag</tt>. (See the section below on arrays.)</p><h3 class="subsection"><a name="htoc263">19.3.3</a>&nbsp;&nbsp;Arrays</h3><p>Arrays of integers and pointers are represented like tuples,
that is, as pointers to blocks tagged&nbsp;0. They are accessed with the
<tt>Field</tt> macro for reading and the <tt>caml_modify</tt> function for writing.</p><p>Arrays of floating-point numbers (type <tt>float array</tt>)
have a special, unboxed, more efficient representation.
These arrays are represented by pointers to blocks with tag
<tt>Double_array_tag</tt>. They should be accessed with the <tt>Double_field</tt>
and <tt>Store_double_field</tt> macros.</p><h3 class="subsection"><a name="htoc264">19.3.4</a>&nbsp;&nbsp;Concrete data types</h3><p>Constructed terms are represented either by unboxed integers (for
constant constructors) or by blocks whose tag encode the constructor
(for non-constant constructors). The constant constructors and the
non-constant constructors for a given concrete type are numbered
separately, starting from 0, in the order in which they appear in the
concrete type declaration. Constant constructors are represented by
unboxed integers equal to the constructor number. A non-constant
constructors declared with <i>n</i> arguments is represented by
a block of size <i>n</i>, tagged with the constructor number; the <i>n</i>
fields contain its arguments. Example:</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Constructed term</b></td><td align="center" nowrap=""><b>Representation</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
<tt>()</tt></td><td valign="top" align="left"><tt>Val_int(0)</tt></td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>false</tt></td><td valign="top" align="left"><tt>Val_int(0)</tt></td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>true</tt></td><td valign="top" align="left"><tt>Val_int(1)</tt></td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>[]</tt></td><td valign="top" align="left"><tt>Val_int(0)</tt>.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>h::t</tt></td><td valign="top" align="left">Block with size = 2 and tag = 0; first field
contains <tt>h</tt>, second field <tt>t</tt>.</td></tr>
</tbody></table></div><p>As a convenience, <tt>caml/mlvalues.h</tt> defines the macros <tt>Val_unit</tt>,
<tt>Val_false</tt> and <tt>Val_true</tt> to refer to <tt>()</tt>, <tt>false</tt> and <tt>true</tt>.</p><p>The following artificial example illustrates the assignment of
integers and block tags to constructors:
</p><pre>type t =
  | A             (* First constant constructor -&gt; integer "Val_int(0)" *)
  | B of string   (* First non-constant constructor -&gt; block with tag 0 *)
  | C             (* Second constant constructor -&gt; integer "Val_int(1)" *)
  | D of bool     (* Second non-constant constructor -&gt; block with tag 1 *)
  | E of t * t    (* Third non-constant constructor -&gt; block with tag 2 *)
</pre><h3 class="subsection"><a name="htoc265">19.3.5</a>&nbsp;&nbsp;Objects</h3><p>Objects are represented as blocks with tag <tt>Object_tag</tt>. The first
field of the block refers to the object class and associated method
suite, in a format that cannot easily be exploited from C. The second
field contains a unique object ID, used for comparisons. The remaining
fields of the object contain the values of the instance variables of
the object. It is unsafe to access directly instance variables, as the
type system provides no guaranteee about the instance variables
contained by an object.
</p><p>One may extract a public method from an object using the C function
<tt>caml_get_public_method</tt> (declared in <tt>&lt;caml/mlvalues.h&gt;</tt>.)
Since public method tags are hashed in the same way as variant tags,
and methods are functions taking self as first argument, if you want
to do the method call <tt>foo#bar</tt> from the C side, you should call:
</p><pre>  callback(caml_get_public_method(foo, hash_variant("bar")), foo);
</pre><h3 class="subsection"><a name="htoc266">19.3.6</a>&nbsp;&nbsp;Polymorphic variants</h3><p>Like constructed terms, polymorphic variant values are represented either
as integers (for polymorphic variants without arguments), or as blocks
(for polymorphic variants with an argument). Unlike constructed
terms, variant constructors are not numbered starting from 0, but
identified by a hash value (an OCaml integer), as computed by the C function
<tt>hash_variant</tt> (declared in <tt>&lt;caml/mlvalues.h&gt;</tt>):
the hash value for a variant constructor named, say, <tt>VConstr</tt>
is <tt>hash_variant("VConstr")</tt>.</p><p>The variant value <tt>`VConstr</tt> is represented by
<tt>hash_variant("VConstr")</tt>. The variant value <tt>`VConstr(</tt><i>v</i><tt>)</tt> is
represented by a block of size 2 and tag 0, with field number 0
containing <tt>hash_variant("VConstr")</tt> and field number 1 containing
<i>v</i>.</p><p>Unlike constructed values, polymorphic variant values taking several
arguments are not flattened.
That is, <tt>`VConstr(</tt><i>v</i><tt>, </tt><i>w</i><tt>)</tt> is represented by a block
of size 2, whose field number 1 contains the representation of the
pair <tt>(</tt><i>v</i><tt>, </tt><i>w</i><tt>)</tt>, rather than a block of size 3
containing <i>v</i> and <i>w</i> in fields 1 and 2.</p><h2 class="section"><a name="toc145"></a><a name="htoc267">4</a>&nbsp;&nbsp;Operations on values</h2><h3 class="subsection"><a name="htoc268">19.4.1</a>&nbsp;&nbsp;Kind tests</h3><ul class="itemize"><li class="li-itemize">
<tt>Is_long(</tt><i>v</i><tt>)</tt> is true if value <i>v</i> is an immediate integer,
false otherwise
</li><li class="li-itemize"><tt>Is_block(</tt><i>v</i><tt>)</tt> is true if value <i>v</i> is a pointer to a block,
and false if it is an immediate integer.
</li></ul><h3 class="subsection"><a name="htoc269">19.4.2</a>&nbsp;&nbsp;Operations on integers</h3><ul class="itemize"><li class="li-itemize">
<tt>Val_long(</tt><i>l</i><tt>)</tt> returns the value encoding the <tt>long int</tt> <i>l</i>.
</li><li class="li-itemize"><tt>Long_val(</tt><i>v</i><tt>)</tt> returns the <tt>long int</tt> encoded in value <i>v</i>.
</li><li class="li-itemize"><tt>Val_int(</tt><i>i</i><tt>)</tt> returns the value encoding the <tt>int</tt> <i>i</i>.
</li><li class="li-itemize"><tt>Int_val(</tt><i>v</i><tt>)</tt> returns the <tt>int</tt> encoded in value <i>v</i>.
</li><li class="li-itemize"><tt>Val_bool(</tt><i>x</i><tt>)</tt> returns the OCaml boolean representing the
truth value of the C integer <i>x</i>.
</li><li class="li-itemize"><tt>Bool_val(</tt><i>v</i><tt>)</tt> returns 0 if <i>v</i> is the OCaml boolean
<tt>false</tt>, 1 if <i>v</i> is <tt>true</tt>.
</li><li class="li-itemize"><tt>Val_true</tt>, <tt>Val_false</tt> represent the OCaml booleans <tt>true</tt> and <tt>false</tt>.
</li></ul><h3 class="subsection"><a name="htoc270">19.4.3</a>&nbsp;&nbsp;Accessing blocks</h3><ul class="itemize"><li class="li-itemize">
<tt>Wosize_val(</tt><i>v</i><tt>)</tt> returns the size of the block <i>v</i>, in words,
excluding the header.
</li><li class="li-itemize"><tt>Tag_val(</tt><i>v</i><tt>)</tt> returns the tag of the block <i>v</i>.
</li><li class="li-itemize"><tt>Field(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> returns the value contained in the
<i>n</i><font size="2"><sup>th</sup></font> field of the structured block <i>v</i>. Fields are numbered from 0 to
<tt>Wosize_val</tt>(<i>v</i>)−1.
</li><li class="li-itemize"><tt>Store_field(</tt><i>b</i><tt>, </tt><i>n</i><tt>, </tt><i>v</i><tt>)</tt> stores the value
<i>v</i> in the field number <i>n</i> of value <i>b</i>, which must be a
structured block.
</li><li class="li-itemize"><tt>Code_val(</tt><i>v</i><tt>)</tt> returns the code part of the closure <i>v</i>.
</li><li class="li-itemize"><tt>caml_string_length(</tt><i>v</i><tt>)</tt> returns the length (number of characters)
of the string <i>v</i>.
</li><li class="li-itemize"><tt>Byte(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> returns the <i>n</i><font size="2"><sup>th</sup></font> character of the string
<i>v</i>, with type <tt>char</tt>. Characters are numbered from 0 to
<tt>string_length</tt>(<i>v</i>)−1.
</li><li class="li-itemize"><tt>Byte_u(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> returns the <i>n</i><font size="2"><sup>th</sup></font> character of the string
<i>v</i>, with type <tt>unsigned char</tt>. Characters are numbered from 0 to
<tt>string_length</tt>(<i>v</i>)−1.
</li><li class="li-itemize"><tt>String_val(</tt><i>v</i><tt>)</tt> returns a pointer to the first byte of the string
<i>v</i>, with type <tt>char *</tt>. This pointer is a valid C string: there is a
null character after the last character in the string. However, OCaml
strings can contain embedded null characters, that will confuse
the usual C functions over strings.
</li><li class="li-itemize"><tt>Double_val(</tt><i>v</i><tt>)</tt> returns the floating-point number contained in
value <i>v</i>, with type <tt>double</tt>.
</li><li class="li-itemize"><tt>Double_field(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> returns
the <i>n</i><font size="2"><sup>th</sup></font> element of the array of floating-point numbers <i>v</i> (a
block tagged <tt>Double_array_tag</tt>).
</li><li class="li-itemize"><tt>Store_double_field(</tt><i>v</i><tt>, </tt><i>n</i><tt>, </tt><i>d</i><tt>)</tt> stores the double precision floating-point number <i>d</i>
in the <i>n</i><font size="2"><sup>th</sup></font> element of the array of floating-point numbers <i>v</i>.
</li><li class="li-itemize"><tt>Data_custom_val(</tt><i>v</i><tt>)</tt> returns a pointer to the data part
of the custom block <i>v</i>. This pointer has type <tt>void *</tt> and must
be cast to the type of the data contained in the custom block.
</li><li class="li-itemize"><tt>Int32_val(</tt><i>v</i><tt>)</tt> returns the 32-bit integer contained
in the <tt>int32</tt> <i>v</i>.
</li><li class="li-itemize"><tt>Int64_val(</tt><i>v</i><tt>)</tt> returns the 64-bit integer contained
in the <tt>int64</tt> <i>v</i>.
</li><li class="li-itemize"><tt>Nativeint_val(</tt><i>v</i><tt>)</tt> returns the long integer contained
in the <tt>nativeint</tt> <i>v</i>.
</li></ul><p>
The expressions <tt>Field(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt>,
<tt>Byte(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> and
<tt>Byte_u(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt>
are valid l-values. Hence, they can be assigned to, resulting in an
in-place modification of value <i>v</i>.
Assigning directly to <tt>Field(</tt><i>v</i><tt>, </tt><i>n</i><tt>)</tt> must
be done with care to avoid confusing the garbage collector (see
below).</p><h3 class="subsection"><a name="htoc271">19.4.4</a>&nbsp;&nbsp;Allocating blocks</h3><h4 class="subsubsection">Simple interface</h4><ul class="itemize"><li class="li-itemize">
<tt>Atom(</tt><i>t</i><tt>)</tt> returns an “atom” (zero-sized block) with tag <i>t</i>.
Zero-sized blocks are preallocated outside of the heap. It is
incorrect to try and allocate a zero-sized block using the functions below.
For instance, <tt>Atom(0)</tt> represents the empty array.
</li><li class="li-itemize"><tt>caml_alloc(</tt><i>n</i><tt>, </tt><i>t</i><tt>)</tt> returns a fresh block of size <i>n</i>
with tag <i>t</i>. If <i>t</i> is less than <tt>No_scan_tag</tt>, then the
fields of the block are initialized with a valid value in order to
satisfy the GC constraints.
</li><li class="li-itemize"><tt>caml_alloc_tuple(</tt><i>n</i><tt>)</tt> returns a fresh block of size
<i>n</i> words, with tag 0.
</li><li class="li-itemize"><tt>caml_alloc_string(</tt><i>n</i><tt>)</tt> returns a string value of length <i>n</i> characters.
The string initially contains garbage.
</li><li class="li-itemize"><tt>caml_copy_string(</tt><i>s</i><tt>)</tt> returns a string value containing a copy of
the null-terminated C string <i>s</i> (a <tt>char *</tt>).
</li><li class="li-itemize"><tt>caml_copy_double(</tt><i>d</i><tt>)</tt> returns a floating-point value initialized
with the <tt>double</tt> <i>d</i>.
</li><li class="li-itemize"><tt>caml_copy_int32(</tt><i>i</i><tt>)</tt>, <tt>copy_int64(</tt><i>i</i><tt>)</tt> and
<tt>caml_copy_nativeint(</tt><i>i</i><tt>)</tt> return a value of OCaml type <tt>int32</tt>,
<tt>int64</tt> and <tt>nativeint</tt>, respectively, initialized with the integer
<i>i</i>.
</li><li class="li-itemize"><tt>caml_alloc_array(</tt><i>f</i><tt>, </tt><i>a</i><tt>)</tt> allocates an array of values, calling
function <i>f</i> over each element of the input array <i>a</i> to transform it
into a value. The array <i>a</i> is an array of pointers terminated by the
null pointer. The function <i>f</i> receives each pointer as argument, and
returns a value. The zero-tagged block returned by
<tt>alloc_array(</tt><i>f</i><tt>, </tt><i>a</i><tt>)</tt> is filled with the values returned by the
successive calls to <i>f</i>. (This function must not be used to build
an array of floating-point numbers.)
</li><li class="li-itemize"><tt>caml_copy_string_array(</tt><i>p</i><tt>)</tt> allocates an array of strings, copied from
the pointer to a string array <i>p</i> (a <code>char **</code>). <i>p</i> must
be NULL-terminated.
</li></ul><h4 class="subsubsection">Low-level interface</h4><p>The following functions are slightly more efficient than <tt>caml_alloc</tt>, but
also much more difficult to use.</p><p>From the standpoint of the allocation functions, blocks are divided
according to their size as zero-sized blocks, small blocks (with size
less than or equal to <code>Max_young_wosize</code>), and large blocks (with
size greater than <code>Max_young_wosize</code>). The constant
<code>Max_young_wosize</code> is declared in the include file <tt>mlvalues.h</tt>. It
is guaranteed to be at least 64 (words), so that any block with
constant size less than or equal to 64 can be assumed to be small. For
blocks whose size is computed at run-time, the size must be compared
against <code>Max_young_wosize</code> to determine the correct allocation procedure.</p><ul class="itemize"><li class="li-itemize">
<tt>caml_alloc_small(</tt><i>n</i><tt>, </tt><i>t</i><tt>)</tt> returns a fresh small block of size
<i>n</i> ≤ <tt>Max_young_wosize</tt> words, with tag <i>t</i>.
If this block is a structured block (i.e. if <i>t</i> &lt; <tt>No_scan_tag</tt>), then
the fields of the block (initially containing garbage) must be initialized
with legal values (using direct assignment to the fields of the block)
before the next allocation.
</li><li class="li-itemize"><tt>caml_alloc_shr(</tt><i>n</i><tt>, </tt><i>t</i><tt>)</tt> returns a fresh block of size
<i>n</i>, with tag <i>t</i>.
The size of the block can be greater than <code>Max_young_wosize</code>. (It
can also be smaller, but in this case it is more efficient to call
<tt>caml_alloc_small</tt> instead of <tt>caml_alloc_shr</tt>.)
If this block is a structured block (i.e. if <i>t</i> &lt; <tt>No_scan_tag</tt>), then
the fields of the block (initially containing garbage) must be initialized
with legal values (using the <tt>caml_initialize</tt> function described below)
before the next allocation.
</li></ul><h3 class="subsection"><a name="htoc272">19.4.5</a>&nbsp;&nbsp;Raising exceptions</h3><p> <a name="s:c-exceptions"></a></p><p>Two functions are provided to raise two standard exceptions:
</p><ul class="itemize"><li class="li-itemize">
<tt>caml_failwith(</tt><i>s</i><tt>)</tt>, where <i>s</i> is a null-terminated C string (with
type <code>char *</code>), raises exception <tt>Failure</tt> with argument <i>s</i>.
</li><li class="li-itemize"><tt>caml_invalid_argument(</tt><i>s</i><tt>)</tt>, where <i>s</i> is a null-terminated C
string (with type <code>char *</code>), raises exception <tt>Invalid_argument</tt>
with argument <i>s</i>.
</li></ul><p>Raising arbitrary exceptions from C is more delicate: the
exception identifier is dynamically allocated by the OCaml program, and
therefore must be communicated to the C function using the
registration facility described below in section&nbsp;<a href="#s:register-exn">19.7.3</a>.
Once the exception identifier is recovered in C, the following
functions actually raise the exception:
</p><ul class="itemize"><li class="li-itemize">
<tt>caml_raise_constant(</tt><i>id</i><tt>)</tt> raises the exception <i>id</i> with
no argument;
</li><li class="li-itemize"><tt>caml_raise_with_arg(</tt><i>id</i><tt>, </tt><i>v</i><tt>)</tt> raises the exception
<i>id</i> with the OCaml value <i>v</i> as argument;
</li><li class="li-itemize"><tt>caml_raise_with_args(</tt><i>id</i><tt>, </tt><i>n</i><tt>, </tt><i>v</i><tt>)</tt>
raises the exception <i>id</i> with the OCaml values
<i>v</i><tt>[0]</tt>, …, <i>v</i><tt>[</tt><i>n</i><tt>-1]</tt> as arguments;
</li><li class="li-itemize"><tt>caml_raise_with_string(</tt><i>id</i><tt>, </tt><i>s</i><tt>)</tt>, where <i>s</i> is a
null-terminated C string, raises the exception <i>id</i> with a copy of
the C string <i>s</i> as argument.
</li></ul><h2 class="section"><a name="toc146"></a><a name="htoc273">5</a>&nbsp;&nbsp;Living in harmony with the garbage collector</h2><p>Unused blocks in the heap are automatically reclaimed by the garbage
collector. This requires some cooperation from C code that
manipulates heap-allocated blocks.</p><h3 class="subsection"><a name="htoc274">19.5.1</a>&nbsp;&nbsp;Simple interface</h3><p>All the macros described in this section are declared in the
<tt>memory.h</tt> header file.</p><div class="theorem"><b>Rule&nbsp;1</b>&nbsp;&nbsp;<em>
A function that has parameters or local variables of type <tt>value</tt> must
begin with a call to one of the <tt>CAMLparam</tt> macros and return with
<tt>CAMLreturn</tt>, <tt>CAMLreturn0</tt>, or <tt>CAMLreturnT</tt>.
</em></div><p>There are six <tt>CAMLparam</tt> macros: <tt>CAMLparam0</tt> to <tt>CAMLparam5</tt>, which
take zero to five arguments respectively. If your function has fewer
than 5 parameters of type <tt>value</tt>, use the corresponding macros
with these parameters as arguments. If your function has more than 5
parameters of type <tt>value</tt>, use <tt>CAMLparam5</tt> with five of these
parameters, and use one or more calls to the <tt>CAMLxparam</tt> macros for
the remaining parameters (<tt>CAMLxparam1</tt> to <tt>CAMLxparam5</tt>).</p><p>The macros <tt>CAMLreturn</tt>, <tt>CAMLreturn0</tt>, and <tt>CAMLreturnT</tt> are used to
replace the C
keyword <tt>return</tt>. Every occurence of <tt>return x</tt> must be replaced by
<tt>CAMLreturn (x)</tt> if <tt>x</tt> has type <tt>value</tt>, or <tt>CAMLreturnT (t, x)</tt>
(where <tt>t</tt> is the type of <tt>x</tt>); every occurence of <tt>return</tt> without
argument must be
replaced by <tt>CAMLreturn0</tt>. If your C function is a procedure (i.e. if
it returns void), you must insert <tt>CAMLreturn0</tt> at the end (to replace
C’s implicit <tt>return</tt>).</p><h5 class="paragraph">Note:</h5><p> some C compilers give bogus warnings about unused
variables <tt>caml__dummy_xxx</tt> at each use of <tt>CAMLparam</tt> and
<tt>CAMLlocal</tt>. You should ignore them.</p><p><br>
</p><p>Example:
</p><pre>void foo (value v1, value v2, value v3)
{
  CAMLparam3 (v1, v2, v3);
  ...
  CAMLreturn0;
}
</pre><h5 class="paragraph">Note:</h5><p> if your function is a primitive with more than 5 arguments
for use with the byte-code runtime, its arguments are not <tt>value</tt>s and
must not be declared (they have types <tt>value *</tt> and <tt>int</tt>).</p><div class="theorem"><b>Rule&nbsp;2</b>&nbsp;&nbsp;<em>
Local variables of type <tt>value</tt> must be declared with one of the
<tt>CAMLlocal</tt> macros. Arrays of <tt>value</tt>s are declared with
<tt>CAMLlocalN</tt>. These macros must be used at the beginning of the
function, not in a nested block.
</em></div><p>The macros <tt>CAMLlocal1</tt> to <tt>CAMLlocal5</tt> declare and initialize one to
five local variables of type <tt>value</tt>. The variable names are given as
arguments to the macros. <tt>CAMLlocalN(</tt><i>x</i><tt>, </tt><i>n</i><tt>)</tt> declares
and initializes a local variable of type <tt>value [</tt><i>n</i><tt>]</tt>. You can
use several calls to these macros if you have more than 5 local
variables.</p><p>Example:
</p><pre>value bar (value v1, value v2, value v3)
{
  CAMLparam3 (v1, v2, v3);
  CAMLlocal1 (result);
  result = caml_alloc (3, 0);
  ...
  CAMLreturn (result);
}
</pre><div class="theorem"><b>Rule&nbsp;3</b>&nbsp;&nbsp;<em>
Assignments to the fields of structured blocks must be done with the
<tt>Store_field</tt> macro (for normal blocks) or <tt>Store_double_field</tt> macro
(for arrays and records of floating-point numbers). Other assignments
must not use <tt>Store_field</tt> nor <tt>Store_double_field</tt>.
</em></div><p><tt>Store_field (</tt><i>b</i><tt>, </tt><i>n</i><tt>, </tt><i>v</i><tt>)</tt> stores the value
<i>v</i> in the field number <i>n</i> of value <i>b</i>, which must be a
block (i.e. <tt>Is_block(</tt><i>b</i><tt>)</tt> must be true).</p><p>Example:
</p><pre>value bar (value v1, value v2, value v3)
{
  CAMLparam3 (v1, v2, v3);
  CAMLlocal1 (result);
  result = caml_alloc (3, 0);
  Store_field (result, 0, v1);
  Store_field (result, 1, v2);
  Store_field (result, 2, v3);
  CAMLreturn (result);
}
</pre><h5 class="paragraph">Warning:</h5><p> The first argument of <tt>Store_field</tt> and
<tt>Store_double_field</tt> must be a variable declared by <tt>CAMLparam*</tt> or
a parameter declared by <tt>CAMLlocal*</tt> to ensure that a garbage
collection triggered by the evaluation of the other arguments will not
invalidate the first argument after it is computed.</p><div class="theorem"><b>Rule&nbsp;4</b>&nbsp;&nbsp;<em> Global variables containing values must be registered
with the garbage collector using the <tt>caml_register_global_root</tt> function.
</em></div><p>Registration of a global variable <tt>v</tt> is achieved by calling
<tt>caml_register_global_root(&amp;v)</tt> just before or just after a valid
value is stored in <tt>v</tt> for the first time. You must not call any
of the OCaml runtime functions or macros between registering and
storing the value.</p><p>A registered global variable <tt>v</tt> can be un-registered by calling
<tt>caml_remove_global_root(&amp;v)</tt>.</p><p>If the contents of the global variable <tt>v</tt> are not modified after
registration, better performance can be achieved by calling
<tt>caml_register_generational_global_root(&amp;v)</tt> to register <tt>v</tt>,
and <tt>caml_remove_generational_global_root(&amp;v)</tt> to un-register it.
The garbage collector takes advantage of the guarantee that <tt>v</tt> is not
modified to scan it less often. This improves performance if many
global variables need to be registered.</p><h5 class="paragraph">Note:</h5><p> The <tt>CAML</tt> macros use identifiers (local variables, type
identifiers, structure tags) that start with <tt>caml__</tt>. Do not use any
identifier starting with <tt>caml__</tt> in your programs.</p><h3 class="subsection"><a name="htoc275">19.5.2</a>&nbsp;&nbsp;Low-level interface</h3><p>We now give the GC rules corresponding to the low-level allocation
functions <tt>caml_alloc_small</tt> and <tt>caml_alloc_shr</tt>. You can ignore those rules
if you stick to the simplified allocation function <tt>caml_alloc</tt>.</p><div class="theorem"><b>Rule&nbsp;5</b>&nbsp;&nbsp;<em> After a structured block (a block with tag less than
<tt>No_scan_tag</tt>) is allocated with the low-level functions, all fields
of this block must be filled with well-formed values before the next
allocation operation. If the block has been allocated with
<tt>caml_alloc_small</tt>, filling is performed by direct assignment to the fields
of the block:
</em><pre><em>
        Field(<i>v</i>, <i>n</i>) = <i>v<sub>n</sub></i>;
</em></pre><em>
If the block has been allocated with <tt>caml_alloc_shr</tt>, filling is performed
through the <tt>caml_initialize</tt> function:
</em><pre><em>
        caml_initialize(&amp;Field(<i>v</i>, <i>n</i>), <i>v<sub>n</sub></i>);
</em></pre>
</div><p>The next allocation can trigger a garbage collection. The garbage
collector assumes that all structured blocks contain well-formed
values. Newly created blocks contain random data, which generally do
not represent well-formed values.</p><p>If you really need to allocate before the fields can receive their
final value, first initialize with a constant value (e.g.
<tt>Val_unit</tt>), then allocate, then modify the fields with the correct
value (see rule&nbsp;6).</p><div class="theorem"><b>Rule&nbsp;6</b>&nbsp;&nbsp;<em> Direct assignment to a field of a block, as in
</em><pre><em>
        Field(<i>v</i>, <i>n</i>) = <i>w</i>;
</em></pre><em>
is safe only if <i>v</i> is a block newly allocated by <tt>caml_alloc_small</tt>;
that is, if no allocation took place between the
allocation of <i>v</i> and the assignment to the field. In all other cases,
never assign directly. If the block has just been allocated by <tt>caml_alloc_shr</tt>,
use <tt>caml_initialize</tt> to assign a value to a field for the first time:
</em><pre><em>
        caml_initialize(&amp;Field(<i>v</i>, <i>n</i>), <i>w</i>);
</em></pre><em>
Otherwise, you are updating a field that previously contained a
well-formed value; then, call the <tt>caml_modify</tt> function:
</em><pre><em>
        caml_modify(&amp;Field(<i>v</i>, <i>n</i>), <i>w</i>);
</em></pre>
</div><p>To illustrate the rules above, here is a C function that builds and
returns a list containing the two integers given as parameters.
First, we write it using the simplified allocation functions:
</p><pre>value alloc_list_int(int i1, int i2)
{
  CAMLparam0 ();
  CAMLlocal2 (result, r);

  r = caml_alloc(2, 0);                   /* Allocate a cons cell */
  Store_field(r, 0, Val_int(i2));         /* car = the integer i2 */
  Store_field(r, 1, Val_int(0));          /* cdr = the empty list [] */
  result = caml_alloc(2, 0);              /* Allocate the other cons cell */
  Store_field(result, 0, Val_int(i1));    /* car = the integer i1 */
  Store_field(result, 1, r);              /* cdr = the first cons cell */
  CAMLreturn (result);
}
</pre><p>Here, the registering of <tt>result</tt> is not strictly needed, because no
allocation takes place after it gets its value, but it’s easier and
safer to simply register all the local variables that have type <tt>value</tt>.</p><p>Here is the same function written using the low-level allocation
functions. We notice that the cons cells are small blocks and can be
allocated with <tt>caml_alloc_small</tt>, and filled by direct assignments on
their fields.
</p><pre>value alloc_list_int(int i1, int i2)
{
  CAMLparam0 ();
  CAMLlocal2 (result, r);

  r = caml_alloc_small(2, 0);             /* Allocate a cons cell */
  Field(r, 0) = Val_int(i2);              /* car = the integer i2 */
  Field(r, 1) = Val_int(0);               /* cdr = the empty list [] */
  result = caml_alloc_small(2, 0);        /* Allocate the other cons cell */
  Field(result, 0) = Val_int(i1);         /* car = the integer i1 */
  Field(result, 1) = r;                   /* cdr = the first cons cell */
  CAMLreturn (result);
}
</pre><p>In the two examples above, the list is built bottom-up. Here is an
alternate way, that proceeds top-down. It is less efficient, but
illustrates the use of <tt>caml_modify</tt>.
</p><pre>value alloc_list_int(int i1, int i2)
{
  CAMLparam0 ();
  CAMLlocal2 (tail, r);

  r = caml_alloc_small(2, 0);             /* Allocate a cons cell */
  Field(r, 0) = Val_int(i1);              /* car = the integer i1 */
  Field(r, 1) = Val_int(0);               /* A dummy value
  tail = caml_alloc_small(2, 0);          /* Allocate the other cons cell */
  Field(tail, 0) = Val_int(i2);           /* car = the integer i2 */
  Field(tail, 1) = Val_int(0);            /* cdr = the empty list [] */
  caml_modify(&amp;Field(r, 1), tail);        /* cdr of the result = tail */
  CAMLreturn (r);
}
</pre><p>It would be incorrect to perform
<tt>Field(r, 1) = tail</tt> directly, because the allocation of <tt>tail</tt>
has taken place since <tt>r</tt> was allocated.</p><h2 class="section"><a name="toc147"></a><a name="htoc276">6</a>&nbsp;&nbsp;A complete example</h2><p>This section outlines how the functions from the Unix <tt>curses</tt> library
can be made available to OCaml programs. First of all, here is
the interface <tt>curses.mli</tt> that declares the <tt>curses</tt> primitives and
data types:
</p><pre>type window                   (* The type "window" remains abstract *)
external initscr: unit -&gt; window = "curses_initscr"
external endwin: unit -&gt; unit = "curses_endwin"
external refresh: unit -&gt; unit = "curses_refresh"
external wrefresh : window -&gt; unit = "curses_wrefresh"
external newwin: int -&gt; int -&gt; int -&gt; int -&gt; window = "curses_newwin"
external addch: char -&gt; unit = "curses_addch"
external mvwaddch: window -&gt; int -&gt; int -&gt; char -&gt; unit = "curses_mvwaddch"
external addstr: string -&gt; unit = "curses_addstr"
external mvwaddstr: window -&gt; int -&gt; int -&gt; string -&gt; unit = "curses_mvwaddstr"
(* lots more omitted *)
</pre><p>To compile this interface:
</p><pre>        ocamlc -c curses.mli
</pre><p>
To implement these functions, we just have to provide the stub code;
the core functions are already implemented in the <tt>curses</tt> library.
The stub code file, <tt>curses_stubs.c</tt>, looks like this:
</p><pre>#include &lt;curses.h&gt;
#include &lt;caml/mlvalues.h&gt;
#include &lt;caml/memory.h&gt;
#include &lt;caml/alloc.h&gt;
#include &lt;caml/custom.h&gt;

/* Encapsulation of opaque window handles (of type WINDOW *)
   as OCaml custom blocks. */

static struct custom_operations curses_window_ops = {
  "fr.inria.caml.curses_windows",
  custom_finalize_default,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default
};

/* Accessing the WINDOW * part of an OCaml custom block */
#define Window_val(v) (*((WINDOW **) Data_custom_val(v)))

/* Allocating an OCaml custom block to hold the given WINDOW * */
static value alloc_window(WINDOW * w)
{
  value v = alloc_custom(&amp;curses_window_ops, sizeof(WINDOW *), 0, 1);
  Window_val(v) = w;
  return v;
}

value caml_curses_initscr(value unit)
{
  CAMLparam1 (unit);
  CAMLreturn (alloc_window(initscr()));
}

value caml_curses_endwin(value unit)
{
  CAMLparam1 (unit);
  endwin();
  CAMLreturn (Val_unit);
}

value caml_curses_refresh(value unit)
{
  CAMLparam1 (unit);
  refresh();
  CAMLreturn (Val_unit);
}

value caml_curses_wrefresh(value win)
{
  CAMLparam1 (win);
  wrefresh(Window_val(win));
  CAMLreturn (Val_unit);
}

value caml_curses_newwin(value nlines, value ncols, value x0, value y0)
{
  CAMLparam4 (nlines, ncols, x0, y0);
  CAMLreturn (alloc_window(newwin(Int_val(nlines), Int_val(ncols),
                                  Int_val(x0), Int_val(y0))));
}

value caml_curses_addch(value c)
{
  CAMLparam1 (c);
  addch(Int_val(c));            /* Characters are encoded like integers */
  CAMLreturn (Val_unit);
}

value caml_curses_mvwaddch(value win, value x, value y, value c)
{
  CAMLparam4 (win, x, y, c);
  mvwaddch(Window_val(win), Int_val(x), Int_val(y), Int_val(c));
  CAMLreturn (Val_unit);
}

value caml_curses_addstr(value s)
{
  CAMLparam1 (s);
  addstr(String_val(s));
  CAMLreturn (Val_unit);
}

value caml_curses_mvwaddstr(value win, value x, value y, value s)
{
  CAMLparam4 (win, x, y, s);
  mvwaddstr(Window_val(win), Int_val(x), Int_val(y), String_val(s));
  CAMLreturn (Val_unit);
}

/* This goes on for pages. */
</pre><p>
The file <tt>curses_stubs.c</tt> can be compiled with:
</p><pre>        cc -c -I`ocamlc -where` curses.c
</pre><p>or, even simpler,
</p><pre>        ocamlc -c curses.c
</pre><p>(When passed a <tt>.c</tt> file, the <tt>ocamlc</tt> command simply calls the C
compiler on that file, with the right <tt>-I</tt> option.)</p><p>Now, here is a sample OCaml program <tt>test.ml</tt> that uses the <tt>curses</tt>
module:
</p><pre>open Curses
let main_window = initscr () in
let small_window = newwin 10 5 20 10 in
  mvwaddstr main_window 10 2 "Hello";
  mvwaddstr small_window 4 3 "world";
  refresh();
  Unix.sleep 5;
  endwin()
</pre><p>To compile and link this program, run:
</p><pre>        ocamlc -custom -o test unix.cma test.ml curses_stubs.o -cclib -lcurses
</pre><p>(On some machines, you may need to put
<tt>-cclib -lcurses -cclib -ltermcap</tt> or <tt>-cclib -ltermcap</tt>
instead of <tt>-cclib -lcurses</tt>.)</p><h2 class="section"><a name="toc148"></a><a name="htoc277">7</a>&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</h2><p> <a name="s:callback"></a>
</p><p>So far, we have described how to call C functions from OCaml. In this
section, we show how C functions can call OCaml functions, either as
callbacks (OCaml calls C which calls OCaml), or because the main program
is written in C.</p><h3 class="subsection"><a name="htoc278">19.7.1</a>&nbsp;&nbsp;Applying OCaml closures from C</h3><p> <a name="s:callbacks"></a></p><p>C functions can apply OCaml function values (closures) to OCaml values.
The following functions are provided to perform the applications:
</p><ul class="itemize"><li class="li-itemize">
<tt>caml_callback(</tt><i>f, a</i><tt>)</tt> applies the functional value <i>f</i> to
the value <i>a</i> and return the value returned by&nbsp;<i>f</i>.
</li><li class="li-itemize"><tt>caml_callback2(</tt><i>f, a, b</i><tt>)</tt> applies the functional value <i>f</i>
(which is assumed to be a curried OCaml function with two arguments) to
<i>a</i> and <i>b</i>.
</li><li class="li-itemize"><tt>caml_callback3(</tt><i>f, a, b, c</i><tt>)</tt> applies the functional value <i>f</i>
(a curried OCaml function with three arguments) to <i>a</i>, <i>b</i> and <i>c</i>.
</li><li class="li-itemize"><tt>caml_callbackN(</tt><i>f, n, args</i><tt>)</tt> applies the functional value <i>f</i>
to the <i>n</i> arguments contained in the array of values <i>args</i>.
</li></ul><p>
If the function <i>f</i> does not return, but raises an exception that
escapes the scope of the application, then this exception is
propagated to the next enclosing OCaml code, skipping over the C
code. That is, if an OCaml function <i>f</i> calls a C function <i>g</i> that
calls back an OCaml function <i>h</i> that raises a stray exception, then the
execution of <i>g</i> is interrupted and the exception is propagated back
into <i>f</i>.</p><p>If the C code wishes to catch exceptions escaping the OCaml function,
it can use the functions <tt>caml_callback_exn</tt>, <tt>caml_callback2_exn</tt>,
<tt>caml_callback3_exn</tt>, <tt>caml_callbackN_exn</tt>. These functions take the same
arguments as their non-<tt>_exn</tt> counterparts, but catch escaping
exceptions and return them to the C code. The return value <i>v</i> of the
<tt>caml_callback*_exn</tt> functions must be tested with the macro
<tt>Is_exception_result(</tt><i>v</i><tt>)</tt>. If the macro returns “false”, no
exception occured, and <i>v</i> is the value returned by the OCaml
function. If <tt>Is_exception_result(</tt><i>v</i><tt>)</tt> returns “true”,
an exception escaped, and its value (the exception descriptor) can be
recovered using <tt>Extract_exception(</tt><i>v</i><tt>)</tt>.</p><h5 class="paragraph">Warning:</h5><p> If the OCaml function returned with an exception,
<tt>Extract_exception</tt> should be applied to the exception result prior
to calling a function that may trigger garbage collection.
Otherwise, if <i>v</i> is reachable during garbage collection, the runtime
can crash since <i>v</i> does not contain a valid value.</p><p>Example:
</p><pre>    value call_caml_f_ex(value closure, value arg)
    {
      CAMLparam2(closure, arg);
      CAMLlocal2(res, tmp);
      res = caml_callback_exn(closure, arg);
      if(Is_exception_result(res)) {
        res = Extract_exception(res);
        tmp = caml_alloc(3, 0); /* Safe to allocate: res contains valid value. */
        ...
      }
      CAMLreturn (res);
    }
</pre><h3 class="subsection"><a name="htoc279">19.7.2</a>&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</h3><p>There are two ways to obtain OCaml function values (closures) to
be passed to the <tt>callback</tt> functions described above. One way is to
pass the OCaml function as an argument to a primitive function. For
example, if the OCaml code contains the declaration
</p><pre>    external apply : ('a -&gt; 'b) -&gt; 'a -&gt; 'b = "caml_apply"
</pre><p>the corresponding C stub can be written as follows:
</p><pre>    CAMLprim value caml_apply(value vf, value vx)
    {
      CAMLparam2(vf, vx);
      CAMLlocal1(vy);
      vy = caml_callback(vf, vx);
      CAMLreturn(vy);
    }
</pre><p>
Another possibility is to use the registration mechanism provided by
OCaml. This registration mechanism enables OCaml code to register
OCaml functions under some global name, and C code to retrieve the
corresponding closure by this global name.</p><p>On the OCaml side, registration is performed by evaluating
<tt>Callback.register</tt> <i>n v</i>. Here, <i>n</i> is the global name
(an arbitrary string) and <i>v</i> the OCaml value. For instance:
</p><pre>    let f x = print_string "f is applied to "; print_int x; print_newline()
    let _ = Callback.register "test function" f
</pre><p>
On the C side, a pointer to the value registered under name <i>n</i> is
obtained by calling <tt>caml_named_value(</tt><i>n</i><tt>)</tt>. The returned
pointer must then be dereferenced to recover the actual OCaml value.
If no value is registered under the name <i>n</i>, the null pointer is
returned. For example, here is a C wrapper that calls the OCaml function <tt>f</tt>
above:
</p><pre>    void call_caml_f(int arg)
    {
        caml_callback(*caml_named_value("test function"), Val_int(arg));
    }
</pre><p>
The pointer returned by <tt>caml_named_value</tt> is constant and can safely
be cached in a C variable to avoid repeated name lookups. On the other
hand, the value pointed to can change during garbage collection and
must always be recomputed at the point of use. Here is a more
efficient variant of <tt>call_caml_f</tt> above that calls <tt>caml_named_value</tt>
only once:
</p><pre>    void call_caml_f(int arg)
    {
        static value * closure_f = NULL;
        if (closure_f == NULL) {
            /* First time around, look up by name */
            closure_f = caml_named_value("test function");
        }
        caml_callback(*closure_f, Val_int(arg));
    }
</pre><h3 class="subsection"><a name="htoc280">19.7.3</a>&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</h3><p> <a name="s:register-exn"></a></p><p>The registration mechanism described above can also be used to
communicate exception identifiers from OCaml to C. The OCaml code
registers the exception by evaluating
<tt>Callback.register_exception</tt> <i>n exn</i>, where <i>n</i> is an
arbitrary name and <i>exn</i> is an exception value of the
exception to register. For example:
</p><pre>    exception Error of string
    let _ = Callback.register_exception "test exception" (Error "any string")
</pre><p>The C code can then recover the exception identifier using
<tt>caml_named_value</tt> and pass it as first argument to the functions
<tt>raise_constant</tt>, <tt>raise_with_arg</tt>, and <tt>raise_with_string</tt> (described
in section&nbsp;<a href="#s:c-exceptions">19.4.5</a>) to actually raise the exception. For
example, here is a C function that raises the <tt>Error</tt> exception with
the given argument:
</p><pre>    void raise_error(char * msg)
    {
        caml_raise_with_string(*caml_named_value("test exception"), msg);
    }
</pre><h3 class="subsection"><a name="htoc281">19.7.4</a>&nbsp;&nbsp;Main program in C</h3><p> <a name="s:main-c"></a></p><p>In normal operation, a mixed OCaml/C program starts by executing the
OCaml initialization code, which then may proceed to call C
functions. We say that the main program is the OCaml code. In some
applications, it is desirable that the C code plays the role of the
main program, calling OCaml functions when needed. This can be achieved as
follows:
</p><ul class="itemize"><li class="li-itemize">
The C part of the program must provide a <tt>main</tt> function,
which will override the default <tt>main</tt> function provided by the OCaml
runtime system. Execution will start in the user-defined <tt>main</tt> function
just like for a regular C program.</li><li class="li-itemize">At some point, the C code must call <tt>caml_main(argv)</tt> to
initialize the OCaml code. The <tt>argv</tt> argument is a C array of strings
(type <tt>char **</tt>), terminated with a <tt>NULL</tt> pointer,
which represents the command-line arguments, as
passed as second argument to <tt>main</tt>. The OCaml array <tt>Sys.argv</tt> will
be initialized from this parameter. For the bytecode compiler,
<tt>argv[0]</tt> and <tt>argv[1]</tt> are also consulted to find the file containing
the bytecode.</li><li class="li-itemize">The call to <tt>caml_main</tt> initializes the OCaml runtime system,
loads the bytecode (in the case of the bytecode compiler), and
executes the initialization code of the OCaml program. Typically, this
initialization code registers callback functions using <tt>Callback.register</tt>.
Once the OCaml initialization code is complete, control returns to the
C code that called <tt>caml_main</tt>.</li><li class="li-itemize">The C code can then invoke OCaml functions using the callback
mechanism (see section&nbsp;<a href="#s:callbacks">19.7.1</a>).
</li></ul><h3 class="subsection"><a name="htoc282">19.7.5</a>&nbsp;&nbsp;Embedding the OCaml code in the C code</h3><p> <a name="s:embedded-code"></a></p><p>The bytecode compiler in custom runtime mode (<tt>ocamlc -custom</tt>)
normally appends the bytecode to the executable file containing the
custom runtime. This has two consequences. First, the final linking
step must be performed by <tt>ocamlc</tt>. Second, the OCaml runtime library
must be able to find the name of the executable file from the
command-line arguments. When using <tt>caml_main(argv)</tt> as in
section&nbsp;<a href="#s:main-c">19.7.4</a>, this means that <tt>argv[0]</tt> or <tt>argv[1]</tt> must
contain the executable file name.</p><p>An alternative is to embed the bytecode in the C code. The
<tt>-output-obj</tt> option to <tt>ocamlc</tt> is provided for this purpose. It
causes the <tt>ocamlc</tt> compiler to output a C object file (<tt>.o</tt> file,
<tt>.obj</tt> under Windows) containing the bytecode for the OCaml part of the
program, as well as a <tt>caml_startup</tt> function. The C object file
produced by <tt>ocamlc -output-obj</tt> can then be linked with C code using
the standard C compiler, or stored in a C library.</p><p>The <tt>caml_startup</tt> function must be called from the main C program in
order to initialize the OCaml runtime and execute the OCaml
initialization code. Just like <tt>caml_main</tt>, it takes one <tt>argv</tt>
parameter containing the command-line parameters. Unlike <tt>caml_main</tt>,
this <tt>argv</tt> parameter is used only to initialize <tt>Sys.argv</tt>, but not
for finding the name of the executable file.</p><p>The <tt>-output-obj</tt> option can also be used to obtain the C source file.
More interestingly, the same option can also produce directly a shared
library (<tt>.so</tt> file, <tt>.dll</tt> under Windows) that contains the OCaml
code, the OCaml runtime system and any other static C code given to
<tt>ocamlc</tt> (<tt>.o</tt>, <tt>.a</tt>, respectively, <tt>.obj</tt>, <tt>.lib</tt>). This use of
<tt>-output-obj</tt> is very similar to a normal linking step, but instead of
producing a main program that automatically runs the OCaml code, it
produces a shared library that can run the OCaml code on demand. The
three possible behaviors of <tt>-output-obj</tt> are selected according
to the extension of the resulting file (given with <tt>-o</tt>).</p><p>The native-code compiler <tt>ocamlopt</tt> also supports the <tt>-output-obj</tt>
option, causing it to output a C object file or a shared library
containing the native code for all OCaml modules on the command-line,
as well as the OCaml startup code. Initialization is performed by
calling <tt>caml_startup</tt> as in the case of the bytecode compiler.</p><p>For the final linking phase, in addition to the object file produced
by <tt>-output-obj</tt>, you will have to provide the OCaml runtime
library (<tt>libcamlrun.a</tt> for bytecode, <tt>libasmrun.a</tt> for native-code),
as well as all C libraries that are required by the OCaml libraries
used. For instance, assume the OCaml part of your program uses the
Unix library. With <tt>ocamlc</tt>, you should do:
</p><pre>        ocamlc -output-obj -o camlcode.o unix.cma <i>other</i> .cmo <i>and</i> .cma <i>files</i>
        cc -o myprog <i>C objects and libraries</i> \
           camlcode.o -L/usr/local/lib/ocaml -lunix -lcamlrun
</pre><p>
With <tt>ocamlopt</tt>, you should do:
</p><pre>        ocamlopt -output-obj -o camlcode.o unix.cmxa <i>other</i> .cmx <i>and</i> .cmxa <i>files</i>
        cc -o myprog <i>C objects and libraries</i> \
           camlcode.o -L/usr/local/lib/ocaml -lunix -lasmrun
</pre><p>The shared libraries produced by <tt>ocamlc -output-obj</tt> or by <tt>ocamlopt -output-obj</tt> already contains the OCaml runtime library as
well as all the needed C libraries.</p><h5 class="paragraph">Warning:</h5><p> On some ports, special options are required on the final
linking phase that links together the object file produced by the
<tt>-output-obj</tt> option and the remainder of the program. Those options
are shown in the configuration file <tt>config/Makefile</tt> generated during
compilation of OCaml, as the variables <tt>BYTECCLINKOPTS</tt>
(for object files produced by <tt>ocamlc -output-obj</tt>) and
<tt>NATIVECCLINKOPTS</tt> (for object files produced by <tt>ocamlopt -output-obj</tt>). Currently, the only ports that require special
attention are:
</p><ul class="itemize"><li class="li-itemize">
Windows with the MSVC compiler: the object file produced by
OCaml have been compiled with the <tt>/MD</tt> flag, and therefore
all other object files linked with it should also be compiled with
<tt>/MD</tt>.
</li></ul><h5 class="paragraph">Stack backtraces.</h5><p> When OCaml bytecode produced by
<tt>ocamlc -g</tt> is embedded in a C program, no debugging information is
included, and therefore it is impossible to print stack backtraces on
uncaught exceptions. This is not the case when native code produced
by <tt>ocamlopt -g</tt> is embedded in a C program: stack backtrace
information is available, but the backtrace mechanism needs to be
turned on programmatically. This can be achieved from the OCaml side
by calling <tt>Printexc.record_backtrace true</tt> in the initialization of
one of the OCaml modules. This can also be achieved from the C side
by calling <tt>caml_record_backtrace(Val_int(1));</tt> in the OCaml-C glue code.</p><h2 class="section"><a name="toc149"></a><a name="htoc283">8</a>&nbsp;&nbsp;Advanced example with callbacks</h2><p>This section illustrates the callback facilities described in
section&nbsp;<a href="#s:callback">19.7</a>. We are going to package some OCaml functions
in such a way that they can be linked with C code and called from C
just like any C functions. The OCaml functions are defined in the
following <tt>mod.ml</tt> OCaml source:</p><pre>(* File mod.ml – some "useful" OCaml functions *)

let rec fib n = if n &lt; 2 then 1 else fib(n-1) + fib(n-2)

let format_result n = Printf.sprintf "Result is: %d\n" n

(* Export those two functions to C *)

let _ = Callback.register "fib" fib
let _ = Callback.register "format_result" format_result
</pre><p>
Here is the C stub code for calling these functions from C:</p><pre>/* File modwrap.c – wrappers around the OCaml functions */

#include &lt;stdio.h&gt;
#include &lt;string.h&gt;
#include &lt;caml/mlvalues.h&gt;
#include &lt;caml/callback.h&gt;

int fib(int n)
{
  static value * fib_closure = NULL;
  if (fib_closure == NULL) fib_closure = caml_named_value("fib");
  return Int_val(caml_callback(*fib_closure, Val_int(n)));
}

char * format_result(int n)
{
  static value * format_result_closure = NULL;
  if (format_result_closure == NULL)
    format_result_closure = caml_named_value("format_result");
  return strdup(String_val(caml_callback(*format_result_closure, Val_int(n))));
  /* We copy the C string returned by String_val to the C heap
     so that it remains valid after garbage collection. */
}
</pre><p>
We now compile the OCaml code to a C object file and put it in a C
library along with the stub code in <tt>modwrap.c</tt> and the OCaml runtime system:
</p><pre>        ocamlc -custom -output-obj -o modcaml.o mod.ml
        ocamlc -c modwrap.c
        cp /usr/local/lib/ocaml/libcamlrun.a mod.a
        ar r mod.a modcaml.o modwrap.o
</pre><p>(One can also use <tt>ocamlopt -output-obj</tt> instead of <tt>ocamlc -custom -output-obj</tt>. In this case, replace <tt>libcamlrun.a</tt> (the bytecode
runtime library) by <tt>libasmrun.a</tt> (the native-code runtime library).)</p><p>Now, we can use the two functions <tt>fib</tt> and <tt>format_result</tt> in any C
program, just like regular C functions. Just remember to call
<tt>caml_startup</tt> once before.</p><pre>/* File main.c – a sample client for the OCaml functions */

#include &lt;stdio.h&gt;

int main(int argc, char ** argv)
{
  int result;

  /* Initialize OCaml code */
  caml_startup(argv);
  /* Do some computation */
  result = fib(10);
  printf("fib(10) = %s\n", format_result(result));
  return 0;
}
</pre><p>
To build the whole program, just invoke the C compiler as follows:
</p><pre>        cc -o prog main.c mod.a -lcurses
</pre><p>(On some machines, you may need to put <tt>-ltermcap</tt> or
<tt>-lcurses -ltermcap</tt> instead of <tt>-lcurses</tt>.)</p><h2 class="section"><a name="toc150"></a><a name="htoc284">9</a>&nbsp;&nbsp;Advanced topic: custom blocks</h2><p> <a name="s:custom"></a>
</p><p>Blocks with tag <tt>Custom_tag</tt> contain both arbitrary user data and a
pointer to a C struct, with type <tt>struct custom_operations</tt>, that
associates user-provided finalization, comparison, hashing,
serialization and deserialization functions to this block.</p><h3 class="subsection"><a name="htoc285">19.9.1</a>&nbsp;&nbsp;The <tt>struct custom_operations</tt></h3><p>The <tt>struct custom_operations</tt> is defined in <tt>&lt;caml/custom.h&gt;</tt> and
contains the following fields:
</p><ul class="itemize"><li class="li-itemize">
<tt>char *identifier</tt><br>
A zero-terminated character string serving as an identifier for
serialization and deserialization operations.</li><li class="li-itemize"><tt>void  (*finalize)(value v)</tt><br>
The <tt>finalize</tt> field contains a pointer to a C function that is called
when the block becomes unreachable and is about to be reclaimed.
The block is passed as first argument to the function.
The <tt>finalize</tt> field can also be <tt>custom_finalize_default</tt> to indicate that no
finalization function is associated with the block.</li><li class="li-itemize"><tt>int (*compare)(value v1, value v2)</tt><br>
The <tt>compare</tt> field contains a pointer to a C function that is
called whenever two custom blocks are compared using OCaml’s generic
comparison operators (<tt>=</tt>, <tt>&lt;&gt;</tt>, <tt>&lt;=</tt>, <tt>&gt;=</tt>, <tt>&lt;</tt>, <tt>&gt;</tt> and
<tt>compare</tt>). The C function should return 0 if the data contained in
the two blocks are structurally equal, a negative integer if the data
from the first block is less than the data from the second block, and
a positive integer if the data from the first block is greater than
the data from the second block.<p>The <tt>compare</tt> field can be set to <tt>custom_compare_default</tt>; this
default comparison function simply raises <tt>Failure</tt>.</p></li><li class="li-itemize"><tt>int (*compare_ext)(value v1, value v2)</tt><br>
(Since 3.12.1.) 
The <tt>compare_ext</tt> field contains a pointer to a C function that is
called whenever one custom block and one unboxed integer are compared using OCaml’s generic
comparison operators (<tt>=</tt>, <tt>&lt;&gt;</tt>, <tt>&lt;=</tt>, <tt>&gt;=</tt>, <tt>&lt;</tt>, <tt>&gt;</tt> and
<tt>compare</tt>). As in the case of the <tt>compare</tt> field, the C function
should return 0 if the two arguments are structurally equal, a
negative integer if the first argument compares less than the second
argument, and a positive integer if the first argument compares
greater than the second argument.<p>The <tt>compare_ext</tt> field can be set to <tt>custom_compare_ext_default</tt>; this
default comparison function simply raises <tt>Failure</tt>.</p></li><li class="li-itemize"><tt>long (*hash)(value v)</tt><br>
The <tt>hash</tt> field contains a pointer to a C function that is called
whenever OCaml’s generic hash operator (see module <tt>Hashtbl</tt>) is
applied to a custom block. The C function can return an arbitrary
long integer representing the hash value of the data contained in the
given custom block. The hash value must be compatible with the
<tt>compare</tt> function, in the sense that two structurally equal data
(that is, two custom blocks for which <tt>compare</tt> returns 0) must have
the same hash value.<p>The <tt>hash</tt> field can be set to <tt>custom_hash_default</tt>, in which case
the custom block is ignored during hash computation.</p></li><li class="li-itemize"><tt>void (*serialize)(value v, unsigned long * wsize_32, unsigned long * wsize_64)</tt><br>
The <tt>serialize</tt> field contains a pointer to a C function that is
called whenever the custom block needs to be serialized (marshaled)
using the OCaml functions <tt>output_value</tt> or <tt>Marshal.to_...</tt>.
For a custom block, those functions first write the identifier of the
block (as given by the <tt>identifier</tt> field) to the output stream,
then call the user-provided <tt>serialize</tt> function. That function is
responsible for writing the data contained in the custom block, using
the <tt>serialize_...</tt> functions defined in <tt>&lt;caml/intext.h&gt;</tt> and listed
below. The user-provided <tt>serialize</tt> function must then store in its
<tt>wsize_32</tt> and <tt>wsize_64</tt> parameters the sizes in bytes of the data
part of the custom block on a 32-bit architecture and on a 64-bit
architecture, respectively.<p>The <tt>serialize</tt> field can be set to <tt>custom_serialize_default</tt>,
in which case the <tt>Failure</tt> exception is raised when attempting to
serialize the custom block.</p></li><li class="li-itemize"><tt>unsigned long (*deserialize)(void * dst)</tt><br>
The <tt>deserialize</tt> field contains a pointer to a C function that is
called whenever a custom block with identifier <tt>identifier</tt> needs to
be deserialized (un-marshaled) using the OCaml functions <tt>input_value</tt>
or <tt>Marshal.from_...</tt>. This user-provided function is responsible for
reading back the data written by the <tt>serialize</tt> operation, using the
<tt>deserialize_...</tt> functions defined in <tt>&lt;caml/intext.h&gt;</tt> and listed
below. It must then rebuild the data part of the custom block
and store it at the pointer given as the <tt>dst</tt> argument. Finally, it
returns the size in bytes of the data part of the custom block.
This size must be identical to the <tt>wsize_32</tt> result of
the <tt>serialize</tt> operation if the architecture is 32 bits, or
<tt>wsize_64</tt> if the architecture is 64 bits.<p>The <tt>deserialize</tt> field can be set to <tt>custom_deserialize_default</tt>
to indicate that deserialization is not supported. In this case,
do not register the <tt>struct custom_operations</tt> with the deserializer
using <tt>register_custom_operations</tt> (see below).
</p></li></ul><p>Note: the <tt>finalize</tt>, <tt>compare</tt>, <tt>hash</tt>, <tt>serialize</tt> and <tt>deserialize</tt>
functions attached to custom block descriptors must never trigger a
garbage collection. Within these functions, do not call any of the
OCaml allocation functions, and do not perform a callback into OCaml
code. Do not use <tt>CAMLparam</tt> to register the parameters to these
functions, and do not use <tt>CAMLreturn</tt> to return the result.</p><h3 class="subsection"><a name="htoc286">19.9.2</a>&nbsp;&nbsp;Allocating custom blocks</h3><p>Custom blocks must be allocated via the <tt>caml_alloc_custom</tt> function:
</p><div class="center">
<tt>caml_alloc_custom(</tt><i>ops</i><tt>, </tt><i>size</i><tt>, </tt><i>used</i><tt>, </tt><i>max</i><tt>)</tt>
</div><p>
returns a fresh custom block, with room for <i>size</i> bytes of user
data, and whose associated operations are given by <i>ops</i> (a
pointer to a <tt>struct custom_operations</tt>, usually statically allocated
as a C global variable).</p><p>The two parameters <i>used</i> and <i>max</i> are used to control the
speed of garbage collection when the finalized object contains
pointers to out-of-heap resources. Generally speaking, the
OCaml incremental major collector adjusts its speed relative to the
allocation rate of the program. The faster the program allocates, the
harder the GC works in order to reclaim quickly unreachable blocks
and avoid having large amount of “floating garbage” (unreferenced
objects that the GC has not yet collected).</p><p>Normally, the allocation rate is measured by counting the in-heap size
of allocated blocks. However, it often happens that finalized
objects contain pointers to out-of-heap memory blocks and other resources
(such as file descriptors, X Windows bitmaps, etc.). For those
blocks, the in-heap size of blocks is not a good measure of the
quantity of resources allocated by the program.</p><p>The two arguments <i>used</i> and <i>max</i> give the GC an idea of how
much out-of-heap resources are consumed by the finalized block
being allocated: you give the amount of resources allocated to this
object as parameter <i>used</i>, and the maximum amount that you want
to see in floating garbage as parameter <i>max</i>. The units are
arbitrary: the GC cares only about the ratio <i>used</i> / <i>max</i>.</p><p>For instance, if you are allocating a finalized block holding an X
Windows bitmap of <i>w</i> by <i>h</i> pixels, and you’d rather not
have more than 1 mega-pixels of unreclaimed bitmaps, specify
<i>used</i> = <i>w</i> * <i>h</i> and <i>max</i> = 1000000.</p><p>Another way to describe the effect of the <i>used</i> and <i>max</i>
parameters is in terms of full GC cycles. If you allocate many custom
blocks with <i>used</i> / <i>max</i> = 1 / <i>N</i>, the GC will then do one
full cycle (examining every object in the heap and calling
finalization functions on those that are unreachable) every <i>N</i>
allocations. For instance, if <i>used</i> = 1 and <i>max</i> = 1000,
the GC will do one full cycle at least every 1000 allocations of
custom blocks.</p><p>If your finalized blocks contain no pointers to out-of-heap resources,
or if the previous discussion made little sense to you, just take
<i>used</i> = 0 and <i>max</i> = 1. But if you later find that the
finalization functions are not called “often enough”, consider
increasing the <i>used</i> / <i>max</i> ratio.</p><h3 class="subsection"><a name="htoc287">19.9.3</a>&nbsp;&nbsp;Accessing custom blocks</h3><p>The data part of a custom block <i>v</i> can be
accessed via the pointer <tt>Data_custom_val(</tt><i>v</i><tt>)</tt>. This pointer
has type <tt>void *</tt> and should be cast to the actual type of the data
stored in the custom block.</p><p>The contents of custom blocks are not scanned by the garbage
collector, and must therefore not contain any pointer inside the OCaml
heap. In other terms, never store an OCaml <tt>value</tt> in a custom block,
and do not use <tt>Field</tt>, <tt>Store_field</tt> nor <tt>caml_modify</tt> to access the data
part of a custom block. Conversely, any C data structure (not
containing heap pointers) can be stored in a custom block.</p><h3 class="subsection"><a name="htoc288">19.9.4</a>&nbsp;&nbsp;Writing custom serialization and deserialization functions</h3><p>The following functions, defined in <tt>&lt;caml/intext.h&gt;</tt>, are provided to
write and read back the contents of custom blocks in a portable way.
Those functions handle endianness conversions when e.g. data is
written on a little-endian machine and read back on a big-endian machine.</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Function</b></td><td align="center" nowrap=""><b>Action</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
<tt>caml_serialize_int_1</tt></td><td valign="top" align="left">Write a 1-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_int_2</tt></td><td valign="top" align="left">Write a 2-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_int_4</tt></td><td valign="top" align="left">Write a 4-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_int_8</tt></td><td valign="top" align="left">Write a 8-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_float_4</tt></td><td valign="top" align="left">Write a 4-byte float</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_float_8</tt></td><td valign="top" align="left">Write a 8-byte float</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_block_1</tt></td><td valign="top" align="left">Write an array of 1-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_block_2</tt></td><td valign="top" align="left">Write an array of 2-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_block_4</tt></td><td valign="top" align="left">Write an array of 4-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_serialize_block_8</tt></td><td valign="top" align="left">Write an array of 8-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_uint_1</tt></td><td valign="top" align="left">Read an unsigned 1-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_sint_1</tt></td><td valign="top" align="left">Read a signed 1-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_uint_2</tt></td><td valign="top" align="left">Read an unsigned 2-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_sint_2</tt></td><td valign="top" align="left">Read a signed 2-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_uint_4</tt></td><td valign="top" align="left">Read an unsigned 4-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_sint_4</tt></td><td valign="top" align="left">Read a signed 4-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_uint_8</tt></td><td valign="top" align="left">Read an unsigned 8-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_sint_8</tt></td><td valign="top" align="left">Read a signed 8-byte integer</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_float_4</tt></td><td valign="top" align="left">Read a 4-byte float</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_float_8</tt></td><td valign="top" align="left">Read an 8-byte float</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_block_1</tt></td><td valign="top" align="left">Read an array of 1-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_block_2</tt></td><td valign="top" align="left">Read an array of 2-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_block_4</tt></td><td valign="top" align="left">Read an array of 4-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_block_8</tt></td><td valign="top" align="left">Read an array of 8-byte quantities</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>caml_deserialize_error</tt></td><td valign="top" align="left">Signal an error during deserialization;
<tt>input_value</tt> or <tt>Marshal.from_...</tt> raise a <tt>Failure</tt> exception after
cleaning up their internal data structures</td></tr>
</tbody></table></div><p>Serialization functions are attached to the custom blocks to which
they apply. Obviously, deserialization functions cannot be attached
this way, since the custom block does not exist yet when
deserialization begins! Thus, the <tt>struct custom_operations</tt> that
contain deserialization functions must be registered with the
deserializer in advance, using the <tt>register_custom_operations</tt>
function declared in <tt>&lt;caml/custom.h&gt;</tt>. Deserialization proceeds by
reading the identifier off the input stream, allocating a custom block
of the size specified in the input stream, searching the registered
<tt>struct custom_operation</tt> blocks for one with the same identifier, and
calling its <tt>deserialize</tt> function to fill the data part of the custom block.</p><h3 class="subsection"><a name="htoc289">19.9.5</a>&nbsp;&nbsp;Choosing identifiers</h3><p>Identifiers in <tt>struct custom_operations</tt> must be chosen carefully,
since they must identify uniquely the data structure for serialization
and deserialization operations. In particular, consider including a
version number in the identifier; this way, the format of the data can
be changed later, yet backward-compatible deserialisation functions
can be provided.</p><p>Identifiers starting with <tt>_</tt> (an underscore character) are reserved
for the OCaml runtime system; do not use them for your custom
data. We recommend to use a URL
(<tt>http://mymachine.mydomain.com/mylibrary/version-number</tt>)
or a Java-style package name
(<tt>com.mydomain.mymachine.mylibrary.version-number</tt>)
as identifiers, to minimize the risk of identifier collision.</p><h3 class="subsection"><a name="htoc290">19.9.6</a>&nbsp;&nbsp;Finalized blocks</h3><p>Custom blocks generalize the finalized blocks that were present in
OCaml prior to version 3.00. For backward compatibility, the
format of custom blocks is compatible with that of finalized blocks,
and the <tt>alloc_final</tt> function is still available to allocate a custom
block with a given finalization function, but default comparison,
hashing and serialization functions. <tt>caml_alloc_final(</tt><i>n</i><tt>, </tt><i>f</i><tt>, </tt><i>used</i><tt>, </tt><i>max</i><tt>)</tt> returns a fresh custom block of
size <i>n</i> words, with finalization function <i>f</i>. The first
word is reserved for storing the custom operations; the other
<i>n</i>-1 words are available for your data. The two parameters
<i>used</i> and <i>max</i> are used to control the speed of garbage
collection, as described for <tt>caml_alloc_custom</tt>.</p><h2 class="section"><a name="toc151"></a><a name="htoc291">10</a>&nbsp;&nbsp;Advanced topic: multithreading</h2><p>
<a name="s:C-multithreading"></a></p><p>Using multiple threads (shared-memory concurrency) in a mixed OCaml/C
application requires special precautions, which are described in this
section.</p><h3 class="subsection"><a name="htoc292">19.10.1</a>&nbsp;&nbsp;Registering threads created from C</h3><p>Callbacks from C to OCaml are possible only if the calling thread is
known to the OCaml run-time system. Threads created from OCaml (through
the <tt>Thread.create</tt> function of the system threads library) are
automatically known to the run-time system. If the application
creates additional threads from C and wishes to callback into OCaml
code from these threads, it must first register them with the run-time
system. The following functions are declared in the include file
<tt>&lt;caml/threads.h&gt;</tt>.</p><ul class="itemize"><li class="li-itemize">
<tt>caml_c_thread_register()</tt> registers the calling thread with the OCaml
run-time system. Returns 1 on success, 0 on error. Registering an
already-register thread does nothing and returns 0.
</li><li class="li-itemize"><tt>caml_c_thread_unregister()</tt> must be called before the thread
terminates, to unregister it from the OCaml run-time system.
Returns 1 on success, 0 on error. If the calling thread was not
previously registered, does nothing and returns 0.
</li></ul><h3 class="subsection"><a name="htoc293">19.10.2</a>&nbsp;&nbsp;Parallel execution of long-running C code</h3><p>The OCaml run-time system is not reentrant: at any time, at most one
thread can be executing OCaml code or C code that uses the OCaml
run-time system. Technically, this is enforced by a “master lock”
that any thread must hold while executing such code.</p><p>When OCaml calls the C code implementing a primitive, the master lock
is held, therefore the C code has full access to the facilities of the
run-time system. However, no other thread can execute OCaml code
concurrently with the C code of the primitive.</p><p>If a C primitive runs for a long time or performs potentially blocking
input-output operations, it can explicitly release the master lock,
enabling other OCaml threads to run concurrently with its operations.
The C code must re-acquire the master lock before returning to OCaml.
This is achieved with the following functions, declared in
the include file <tt>&lt;caml/threads.h&gt;</tt>.</p><ul class="itemize"><li class="li-itemize">
<tt>caml_release_runtime_system()</tt>
The calling thread releases the master lock and other OCaml resources,
enabling other threads to run OCaml code in parallel with the execution
of the calling thread.
</li><li class="li-itemize"><tt>caml_acquire_runtime_system()</tt>
The calling thread re-acquires the master lock and other OCaml
resources. It may block until no other thread uses the OCaml run-time
system.
</li></ul><p>After <tt>caml_release_runtime_system()</tt> was called and until
<tt>caml_acquire_runtime_system()</tt> is called, the C code must not access
any OCaml data, nor call any function of the run-time system, nor call
back into OCaml code. Consequently, arguments provided by OCaml to the
C primitive must be copied into C data structures before calling
<tt>caml_release_runtime_system()</tt>, and results to be returned to OCaml
must be encoded as OCaml values after <tt>caml_acquire_runtime_system()</tt>
returns.</p><p>Example: the following C primitive invokes <tt>gethostbyname</tt> to find the
IP address of a host name. The <tt>gethostbyname</tt> function can block for
a long time, so we choose to release the OCaml run-time system while it
is running.
</p><pre>CAMLprim stub_gethostbyname(value vname)
{
  CAMLparam1 (vname);
  CAMLlocal1 (vres);
  struct hostent * h;

  /* Copy the string argument to a C string, allocated outside the
     OCaml heap. */
  name = stat_alloc(caml_string_length(vname) + 1);
  strcpy(name, String_val(vname));
  /* Release the OCaml run-time system */
  caml_release_runtime_system();
  /* Resolve the name */
  h = gethostbyname(name);
  /* Re-acquire the OCaml run-time system */
  caml_acquire_runtime_system();
  /* Encode the relevant fields of h as the OCaml value vres */
  ... /* Omitted */
  /* Return to OCaml */
  CAMLreturn (vres);
}
</pre><p>
Callbacks from C to OCaml must be performed while holding the master
lock to the OCaml run-time system. This is naturally the case if the
callback is performed by a C primitive that did not release the
run-time system. If the C primitive released the run-time system
previously, or the callback is performed from other C code that was
not invoked from OCaml (e.g. an event loop in a GUI application), the
run-time system must be acquired before the callback and released
after:
</p><pre>  caml_acquire_runtime_system();
  /* Resolve OCaml function vfun to be invoked */
  /* Build OCaml argument varg to the callback */
  vres = callback(vfun, varg);
  /* Copy relevant parts of result vres to C data structures */
  caml_release_runtime_system();
</pre><p>
Note: the <tt>acquire</tt> and <tt>release</tt> functions described above were
introduced in OCaml 3.12. Older code uses the following historical
names, declared in <tt>&lt;caml/signals.h&gt;</tt>:
</p><ul class="itemize"><li class="li-itemize">
<tt>caml_enter_blocking_section</tt> as an alias for
<tt>caml_release_runtime_system</tt>
</li><li class="li-itemize"><tt>caml_leave_blocking_section</tt> as an alias for
<tt>caml_acquire_runtime_system</tt>
</li></ul><p>
Intuition: a “blocking section” is a piece of C code that does not
use the OCaml run-time system, typically a blocking input/output operation.</p><h2 class="section"><a name="toc152"></a><a name="htoc294">11</a>&nbsp;&nbsp;Building mixed C/OCaml libraries: <tt>ocamlmklib</tt></h2><p>
<a name="s-ocamlmklib"></a></p><p>The <tt>ocamlmklib</tt> command facilitates the construction of libraries
containing both OCaml code and C code, and usable both in static
linking and dynamic linking modes. This command is available under
Windows since Objective Caml 3.11 and under other operating systems since
Objective Caml 3.03.</p><p>The <tt>ocamlmklib</tt> command takes three kinds of arguments:
</p><ul class="itemize"><li class="li-itemize">
OCaml source files and object files (<tt>.cmo</tt>, <tt>.cmx</tt>, <tt>.ml</tt>)
comprising the OCaml part of the library;
</li><li class="li-itemize">C object files (<tt>.o</tt>, <tt>.a</tt>, respectively, <tt>.obj</tt>, <tt>.lib</tt>)
comprising the C part of the library;
</li><li class="li-itemize">Support libraries for the C part (<tt>-l</tt><i>lib</i>).
</li></ul><p>
It generates the following outputs:
</p><ul class="itemize"><li class="li-itemize">
An OCaml bytecode library <tt>.cma</tt> incorporating the <tt>.cmo</tt> and
<tt>.ml</tt> OCaml files given as arguments, and automatically referencing the
C library generated with the C object files.
</li><li class="li-itemize">An OCaml native-code library <tt>.cmxa</tt> incorporating the <tt>.cmx</tt> and
<tt>.ml</tt> OCaml files given as arguments, and automatically referencing the
C library generated with the C object files.
</li><li class="li-itemize">If dynamic linking is supported on the target platform, a
<tt>.so</tt> (respectively, <tt>.dll</tt>) shared library built from the C object files given as arguments,
and automatically referencing the support libraries.
</li><li class="li-itemize">A C static library <tt>.a</tt>(respectively, <tt>.lib</tt>) built from the C object files.
</li></ul><p>
In addition, the following options are recognized:
</p><dl class="description"><dt class="dt-description">
<b><tt>-cclib</tt>, <tt>-ccopt</tt>, <tt>-I</tt>, <tt>-linkall</tt></b></dt><dd class="dd-description">
These options are passed as is to <tt>ocamlc</tt> or <tt>ocamlopt</tt>.
See the documentation of these commands.
</dd><dt class="dt-description"><b><tt>-rpath</tt>, <tt>-R</tt>, <tt>-Wl,-rpath</tt>, <tt>-Wl,-R</tt></b></dt><dd class="dd-description">
These options are passed as is to the C compiler. Refer to the
documentation of the C compiler.
</dd><dt class="dt-description"><tt><b>-custom</b></tt></dt><dd class="dd-description"> Force the construction of a statically linked library
only, even if dynamic linking is supported.
</dd><dt class="dt-description"><tt><b>-failsafe</b></tt></dt><dd class="dd-description"> Fall back to building a statically linked library
if a problem occurs while building the shared library (e.g. some of
the support libraries are not available as shared libraries).
</dd><dt class="dt-description"><b><tt>-L</tt><i>dir</i></b></dt><dd class="dd-description"> Add <i>dir</i> to the search path for support
libraries (<tt>-l</tt><i>lib</i>).
</dd><dt class="dt-description"><b><tt>-ocamlc</tt> <i>cmd</i></b></dt><dd class="dd-description"> Use <i>cmd</i> instead of <tt>ocamlc</tt> to call
the bytecode compiler.
</dd><dt class="dt-description"><b><tt>-ocamlopt</tt> <i>cmd</i></b></dt><dd class="dd-description"> Use <i>cmd</i> instead of <tt>ocamlopt</tt> to call
the native-code compiler.
</dd><dt class="dt-description"><b><tt>-o</tt> <i>output</i></b></dt><dd class="dd-description"> Set the name of the generated OCaml library.
<tt>ocamlmklib</tt> will generate <i>output</i><tt>.cma</tt> and/or <i>output</i><tt>.cmxa</tt>.
If not specified, defaults to <tt>a</tt>.
</dd><dt class="dt-description"><b><tt>-oc</tt> <i>outputc</i></b></dt><dd class="dd-description"> Set the name of the generated C library.
<tt>ocamlmklib</tt> will generate <tt>lib</tt><i>outputc</i><tt>.so</tt> (if shared
libraries are supported) and <tt>lib</tt><i>outputc</i><tt>.a</tt>.
If not specified, defaults to the output name given with <tt>-o</tt>.
</dd></dl><h5 class="paragraph">Example</h5><p> Consider an OCaml interface to the standard <tt>libz</tt>
C library for reading and writing compressed files. Assume this
library resides in <tt>/usr/local/zlib</tt>. This interface is
composed of an OCaml part <tt>zip.cmo</tt>/<tt>zip.cmx</tt> and a C part <tt>zipstubs.o</tt>
containing the stub code around the <tt>libz</tt> entry points. The
following command builds the OCaml libraries <tt>zip.cma</tt> and <tt>zip.cmxa</tt>,
as well as the companion C libraries <tt>dllzip.so</tt> and <tt>libzip.a</tt>:
</p><pre>ocamlmklib -o zip zip.cmo zip.cmx zipstubs.o -lz -L/usr/local/zlib
</pre><p>If shared libraries are supported, this performs the following
commands:
</p><pre>ocamlc -a -o zip.cma zip.cmo -dllib -lzip \
        -cclib -lzip -cclib -lz -ccopt -L/usr/local/zlib
ocamlopt -a -o zip.cmxa zip.cmx -cclib -lzip \
        -cclib -lzip -cclib -lz -ccopt -L/usr/local/zlib
gcc -shared -o dllzip.so zipstubs.o -lz -L/usr/local/zlib
ar rc libzip.a zipstubs.o
</pre><p>If shared libraries are not supported, the following commands are
performed instead:
</p><pre>ocamlc -a -custom -o zip.cma zip.cmo -cclib -lzip \
        -cclib -lz -ccopt -L/usr/local/zlib
ocamlopt -a -o zip.cmxa zip.cmx -lzip \
        -cclib -lz -ccopt -L/usr/local/zlib
ar rc libzip.a zipstubs.o
</pre><p>Instead of building simultaneously the bytecode library, the
native-code library and the C libraries, <tt>ocamlmklib</tt> can be called
three times to build each separately. Thus,
</p><pre>ocamlmklib -o zip zip.cmo -lz -L/usr/local/zlib
</pre><p>builds the bytecode library <tt>zip.cma</tt>, and
</p><pre>ocamlmklib -o zip zip.cmx -lz -L/usr/local/zlib
</pre><p>builds the native-code library <tt>zip.cmxa</tt>, and
</p><pre>ocamlmklib -o zip zipstubs.o -lz -L/usr/local/zlib
</pre><p>builds the C libraries <tt>dllzip.so</tt> and <tt>libzip.a</tt>. Notice that the
support libraries (<tt>-lz</tt>) and the corresponding options
(<tt>-L/usr/local/zlib</tt>) must be given on all three invocations of <tt>ocamlmklib</tt>,
because they are needed at different times depending on whether shared
libraries are supported.</p><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>