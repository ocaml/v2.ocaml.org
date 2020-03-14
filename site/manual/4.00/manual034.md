<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul>




<h1 class="chapter"><a name="htoc296"><span>Chapter 20</span></a>&nbsp;&nbsp;The core library</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The core library</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc153">Conventions</a>
</li><li><a href="#toc154">Built-in types and predefined exceptions</a>
</li><li><a href="#toc155">Module <tt>Pervasives</tt>: the initially opened module</a>
</li></ul></nav></header>
<p> <a name="c:corelib"></a>
</p><p>This chapter describes the OCaml core library, which is
composed of declarations for built-in types and exceptions, plus
the module <tt>Pervasives</tt> that provides basic operations on these
built-in types. The <tt>Pervasives</tt> module is special in two
ways:
</p><ul class="itemize"><li class="li-itemize">
It is automatically linked with the user’s object code files by
the <tt>ocamlc</tt> command (chapter&nbsp;<a href="manual022.html#c:camlc">8</a>).</li><li class="li-itemize">It is automatically “opened” when a compilation starts, or
when the toplevel system is launched. Hence, it is possible to use
unqualified identifiers to refer to the functions provided by the
<tt>Pervasives</tt> module, without adding a <tt>open Pervasives</tt> directive.
</li></ul><h2 class="section"><a name="toc153"></a>Conventions</h2><p>The declarations of the built-in types and the components of module
<tt>Pervasives</tt> are printed one by one in typewriter font, followed by a
short comment. All library modules and the components they provide are
indexed at the end of this report.</p><h2 class="section"><a name="toc154"></a><a name="htoc297">1</a>&nbsp;&nbsp;Built-in types and predefined exceptions</h2><p>The following built-in types and predefined exceptions are always
defined in the
compilation environment, but are not part of any module. As a
consequence, they can only be referred by their short names.</p><h3 class="subsection">Built-in types</h3><pre> type int
</pre><p><a name="@manual9"></a>
</p><blockquote class="quote">
The type of integer numbers.
</blockquote><pre> type char
</pre><p><a name="@manual10"></a>
</p><blockquote class="quote">
The type of characters.
</blockquote><pre> type string
</pre><p><a name="@manual11"></a>
</p><blockquote class="quote">
The type of character strings.
</blockquote><pre> type float
</pre><p><a name="@manual12"></a>
</p><blockquote class="quote">
The type of floating-point numbers.
</blockquote><pre> type bool = false | true
</pre><p><a name="@manual13"></a>
</p><blockquote class="quote">
The type of booleans (truth values).
</blockquote><pre> type unit = ()
</pre><p><a name="@manual14"></a>
</p><blockquote class="quote">
The type of the unit value.
</blockquote><pre> type exn
</pre><p><a name="@manual15"></a>
</p><blockquote class="quote">
The type of exception values.
</blockquote><pre> type 'a array
</pre><p><a name="@manual16"></a>
</p><blockquote class="quote">
The type of arrays whose elements have type <tt>'a</tt>.
</blockquote><pre> type 'a list = [] | :: of 'a * 'a list
</pre><p><a name="@manual17"></a>
</p><blockquote class="quote">
The type of lists whose elements have type <tt>'a</tt>.
</blockquote><pre>type 'a option = None | Some of 'a
</pre><p><a name="@manual18"></a>
</p><blockquote class="quote">
The type of optional values of type <tt>'a</tt>.
</blockquote><pre>type int32
</pre><p><a name="@manual19"></a>
</p><blockquote class="quote">
The type of signed 32-bit integers.
See the <tt>Int32</tt>[<tt><a href="../../api/4.00/Int32.html">Int32</a></tt>] module.
</blockquote><pre>type int64
</pre><p><a name="@manual20"></a>
</p><blockquote class="quote">
The type of signed 64-bit integers.
See the <tt>Int64</tt>[<tt><a href="../../api/4.00/Int64.html">Int64</a></tt>] module.
</blockquote><pre>type nativeint
</pre><p><a name="@manual21"></a>
</p><blockquote class="quote">
The type of signed, platform-native integers (32 bits on 32-bit
processors, 64 bits on 64-bit processors).
See the <tt>Nativeint</tt>[<tt><a href="../../api/4.00/Nativeint.html">Nativeint</a></tt>] module.
</blockquote><pre>type ('a, 'b, 'c, 'd, 'e, 'f) format6
</pre><p><a name="@manual22"></a>
</p><blockquote class="quote">
The type of format strings. <tt>'a</tt> is the type of the parameters of
the format, <tt>'f</tt> is the result type for the <tt>printf</tt>-style
functions, <tt>'b</tt> is the type of the first argument given to <tt>%a</tt> and
<tt>%t</tt> printing functions (see module <tt>Printf</tt>[<tt><a href="../../api/4.00/Printf.html">Printf</a></tt>]),
<tt>'c</tt> is the result type of these functions, and also the type of the
argument transmitted to the first argument of <tt>kprintf</tt>-style
functions, <tt>'d</tt> is the result type for the <tt>scanf</tt>-style functions
(see module <tt>Scanf</tt>[<tt><a href="../../api/4.00/Scanf.html">Scanf</a></tt>]),
and <tt>'e</tt> is the type of the receiver function for the <tt>scanf</tt>-style
functions.
</blockquote><pre>type 'a lazy_t
</pre><p><a name="@manual23"></a>
</p><blockquote class="quote">
This type is used to implement the <tt>Lazy</tt>[<tt><a href="../../api/4.00/Lazy.html">Lazy</a></tt>] module.
It should not be used directly.
</blockquote><h3 class="subsection">Predefined exceptions</h3><pre>exception Match_failure of (string * int * int)
</pre><p><a name="@manual24"></a>
</p><blockquote class="quote">
Exception raised when none of the cases of a pattern-matching
apply. The arguments are the location of the <tt>match</tt> keyword
in the source code (file name, line number, column number).
</blockquote><pre>exception Assert_failure of (string * int * int)
</pre><p><a name="@manual25"></a>
</p><blockquote class="quote">
Exception raised when an assertion fails. The arguments are
the location of the <tt>assert</tt> keyword in the source code
(file name, line number, column number).
</blockquote><pre>exception Invalid_argument of string
</pre><p><a name="@manual26"></a>
</p><blockquote class="quote">
Exception raised by library functions to signal that the given
arguments do not make sense.
</blockquote><pre>exception Failure of string
</pre><p><a name="@manual27"></a>
</p><blockquote class="quote">
Exception raised by library functions to signal that they are
undefined on the given arguments.
</blockquote><pre>exception Not_found
</pre><p><a name="@manual28"></a>
</p><blockquote class="quote">
Exception raised by search functions when the desired object
could not be found.
</blockquote><pre>exception Out_of_memory
</pre><p><a name="@manual29"></a>
</p><blockquote class="quote">
Exception raised by the garbage collector
when there is insufficient memory to complete the computation.
</blockquote><pre>exception Stack_overflow
</pre><p><a name="@manual30"></a>
</p><blockquote class="quote">
Exception raised by the bytecode interpreter when the evaluation
stack reaches its maximal size. This often indicates infinite
or excessively deep recursion in the user’s program.
(Not fully implemented by the native-code compiler;
see section&nbsp;<a href="manual025.html#s:compat-native-bytecode">11.5</a>.)
</blockquote><pre>exception Sys_error of string
</pre><p><a name="@manual31"></a>
</p><blockquote class="quote">
Exception raised by the input/output functions to report
an operating system error.
</blockquote><pre>exception End_of_file
</pre><p><a name="@manual32"></a>
</p><blockquote class="quote">
Exception raised by input functions to signal that the
end of file has been reached.
</blockquote><pre>exception Division_by_zero
</pre><p><a name="@manual33"></a>
</p><blockquote class="quote">
Exception raised by integer division and remainder operations
when their second argument is zero.
</blockquote><pre>exception Sys_blocked_io
</pre><p><a name="@manual34"></a>
</p><blockquote class="quote">
A special case of <tt>Sys_error</tt> raised when no I/O is possible
on a non-blocking I/O channel.
</blockquote><pre>exception Undefined_recursive_module of (string * int * int)
</pre><p><a name="@manual35"></a>
</p><blockquote class="quote">
Exception raised when an ill-founded recursive module definition
is evaluated. (See section&nbsp;<a href="manual021.html#s-recursive-modules">7.8</a>.)
The arguments are the location of the definition in the source code
(file name, line number, column number).
</blockquote><h2 class="section"><a name="toc155"></a><a name="htoc298">2</a>&nbsp;&nbsp;Module <tt>Pervasives</tt>: the initially opened module</h2><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Pervasives.html">Module <tt>Pervasives</tt>: the initially opened module</a>
</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>