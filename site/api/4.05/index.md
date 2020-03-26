<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><h1>The OCaml API</h1><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(true);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(true)"><span class="search_comment">(search values, type signatures, and descriptions - case sensitive)</span></div>
<div id="search_results"></div><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><div class="toc_title"><a href="#top"></a></div><ul>
<li><a href="index_types.html">Index of types</a></li>
<li><a href="index_exceptions.html">Index of exceptions</a></li>
<li><a href="index_values.html">Index of values</a></li>
<li><a href="index_modules.html">Index of modules</a></li>
<li><a href="index_module_types.html">Index of module types</a></li>
</ul></nav></header>
<h1></h1>

<br><br>
<table class="indextable">
<tbody><tr><td class="module"><a href="Arg.html">Arg</a></td><td><div class="info">
Parsing of command line arguments.
</div>
</td></tr>
<tr><td class="module"><a href="Arg_helper.html">Arg_helper</a></td><td><div class="info">
Decipher command line arguments of the form
        &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code class="code">,...</code>
    (as used for example for the specification of inlining parameters
    varying by simplification round).
</div>
</td></tr>
<tr><td class="module"><a href="Arith_status.html">Arith_status</a></td><td><div class="info">
Flags that control rational arithmetic.
</div>
</td></tr>
<tr><td class="module"><a href="Array.html">Array</a></td><td><div class="info">
Array operations.
</div>
</td></tr>
<tr><td class="module"><a href="ArrayLabels.html">ArrayLabels</a></td><td><div class="info">
Array operations.
</div>
</td></tr>
<tr><td class="module"><a href="Ast_helper.html">Ast_helper</a></td><td><div class="info">
Helpers to produce Parsetree fragments
</div>
</td></tr>
<tr><td class="module"><a href="Ast_invariants.html">Ast_invariants</a></td><td><div class="info">
Check AST invariants
</div>
</td></tr>
<tr><td class="module"><a href="Ast_iterator.html">Ast_iterator</a></td><td><div class="info">
<a href="Ast_iterator.html#TYPEiterator"><code class="code"><span class="constructor">Ast_iterator</span>.iterator</code></a> allows to implement AST inspection using open recursion.
</div>
</td></tr>
<tr><td class="module"><a href="Ast_mapper.html">Ast_mapper</a></td><td><div class="info">
The interface of a -ppx rewriter
</div>
</td></tr>
<tr><td class="module"><a href="Asttypes.html">Asttypes</a></td><td><div class="info">
Auxiliary AST types used by parsetree and typedtree.
</div>
</td></tr>
<tr><td class="module"><a href="Attr_helper.html">Attr_helper</a></td><td><div class="info">
Helpers for attributes
</div>
</td></tr>
<tr><td class="module"><a href="Big_int.html">Big_int</a></td><td><div class="info">
Operations on arbitrary-precision integers.
</div>
</td></tr>
<tr><td class="module"><a href="Bigarray.html">Bigarray</a></td><td><div class="info">
Large, multi-dimensional, numerical arrays.
</div>
</td></tr>
<tr><td class="module"><a href="Buffer.html">Buffer</a></td><td><div class="info">
Extensible buffers.
</div>
</td></tr>
<tr><td class="module"><a href="Builtin_attributes.html">Builtin_attributes</a></td><td></td></tr>
<tr><td class="module"><a href="Bytes.html">Bytes</a></td><td><div class="info">
Byte sequence operations.
</div>
</td></tr>
<tr><td class="module"><a href="BytesLabels.html">BytesLabels</a></td><td><div class="info">
Byte sequence operations.
</div>
</td></tr>
<tr><td class="module"><a href="Callback.html">Callback</a></td><td><div class="info">
Registering OCaml values with the C runtime.
</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalFormat.html">CamlinternalFormat</a></td><td></td></tr>
<tr><td class="module"><a href="CamlinternalFormatBasics.html">CamlinternalFormatBasics</a></td><td><div class="info">
</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalLazy.html">CamlinternalLazy</a></td><td><div class="info">
Run-time support for lazy values.
</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalMod.html">CamlinternalMod</a></td><td><div class="info">
Run-time support for recursive modules.
</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalOO.html">CamlinternalOO</a></td><td><div class="info">
Run-time support for objects and classes.
</div>
</td></tr>
<tr><td class="module"><a href="Ccomp.html">Ccomp</a></td><td></td></tr>
<tr><td class="module"><a href="Char.html">Char</a></td><td><div class="info">
Character operations.
</div>
</td></tr>
<tr><td class="module"><a href="Clflags.html">Clflags</a></td><td><div class="info">
Optimization parameters represented as ints indexed by round number.
</div>
</td></tr>
<tr><td class="module"><a href="Complex.html">Complex</a></td><td><div class="info">
Complex numbers.
</div>
</td></tr>
<tr><td class="module"><a href="Condition.html">Condition</a></td><td><div class="info">
Condition variables to synchronize between threads.
</div>
</td></tr>
<tr><td class="module"><a href="Config.html">Config</a></td><td></td></tr>
<tr><td class="module"><a href="Consistbl.html">Consistbl</a></td><td></td></tr>
<tr><td class="module"><a href="Depend.html">Depend</a></td><td><div class="info">
Module dependencies.
</div>
</td></tr>
<tr><td class="module"><a href="Digest.html">Digest</a></td><td><div class="info">
MD5 message digest.
</div>
</td></tr>
<tr><td class="module"><a href="Docstrings.html">Docstrings</a></td><td><div class="info">
Documentation comments
</div>
</td></tr>
<tr><td class="module"><a href="Dynlink.html">Dynlink</a></td><td><div class="info">
Dynamic loading of object files.
</div>
</td></tr>
<tr><td class="module"><a href="Ephemeron.html">Ephemeron</a></td><td><div class="info">
Ephemerons and weak hash table
</div>
</td></tr>
<tr><td class="module"><a href="Event.html">Event</a></td><td><div class="info">
First-class synchronous communication.
</div>
</td></tr>
<tr><td class="module"><a href="Filename.html">Filename</a></td><td><div class="info">
Operations on file names.
</div>
</td></tr>
<tr><td class="module"><a href="Format.html">Format</a></td><td><div class="info">
Pretty printing.
</div>
</td></tr>
<tr><td class="module"><a href="Gc.html">Gc</a></td><td><div class="info">
Memory management control and statistics; finalised values.
</div>
</td></tr>
<tr><td class="module"><a href="Genlex.html">Genlex</a></td><td><div class="info">
A generic lexical analyzer.
</div>
</td></tr>
<tr><td class="module"><a href="Graphics.html">Graphics</a></td><td><div class="info">
Machine-independent graphics primitives.
</div>
</td></tr>
<tr><td class="module"><a href="GraphicsX11.html">GraphicsX11</a></td><td><div class="info">
Additional graphics primitives for the X Windows system.
</div>
</td></tr>
<tr><td class="module"><a href="Hashtbl.html">Hashtbl</a></td><td><div class="info">
Hash tables and hash functions.
</div>
</td></tr>
<tr><td class="module"><a href="Identifiable.html">Identifiable</a></td><td><div class="info">
Uniform interface for common data structures over various things.
</div>
</td></tr>
<tr><td class="module"><a href="Int32.html">Int32</a></td><td><div class="info">
32-bit integers.
</div>
</td></tr>
<tr><td class="module"><a href="Int64.html">Int64</a></td><td><div class="info">
64-bit integers.
</div>
</td></tr>
<tr><td class="module"><a href="Lazy.html">Lazy</a></td><td><div class="info">
Deferred computations.
</div>
</td></tr>
<tr><td class="module"><a href="Lexer.html">Lexer</a></td><td></td></tr>
<tr><td class="module"><a href="Lexing.html">Lexing</a></td><td><div class="info">
The run-time library for lexers generated by <code class="code">ocamllex</code>.
</div>
</td></tr>
<tr><td class="module"><a href="List.html">List</a></td><td><div class="info">
List operations.
</div>
</td></tr>
<tr><td class="module"><a href="ListLabels.html">ListLabels</a></td><td><div class="info">
List operations.
</div>
</td></tr>
<tr><td class="module"><a href="Location.html">Location</a></td><td><div class="info">
Source code locations (ranges of positions), used in parsetree.
</div>
</td></tr>
<tr><td class="module"><a href="Longident.html">Longident</a></td><td><div class="info">
Long identifiers, used in parsetree.
</div>
</td></tr>
<tr><td class="module"><a href="Map.html">Map</a></td><td><div class="info">
Association tables over ordered types.
</div>
</td></tr>
<tr><td class="module"><a href="Marshal.html">Marshal</a></td><td><div class="info">
Marshaling of data structures.
</div>
</td></tr>
<tr><td class="module"><a href="Misc.html">Misc</a></td><td><div class="info">
<code class="code">protect_refs&nbsp;l&nbsp;f</code> temporarily sets <code class="code">r</code> to <code class="code">v</code> for each <code class="code"><span class="constructor">R</span>&nbsp;(r,&nbsp;v)</code> in <code class="code">l</code>
    while executing <code class="code">f</code>.
</div>
</td></tr>
<tr><td class="module"><a href="MoreLabels.html">MoreLabels</a></td><td><div class="info">
Extra labeled libraries.
</div>
</td></tr>
<tr><td class="module"><a href="Mutex.html">Mutex</a></td><td><div class="info">
Locks for mutual exclusion.
</div>
</td></tr>
<tr><td class="module"><a href="Nativeint.html">Nativeint</a></td><td><div class="info">
Processor-native integers.
</div>
</td></tr>
<tr><td class="module"><a href="Num.html">Num</a></td><td><div class="info">
Operation on arbitrary-precision numbers.
</div>
</td></tr>
<tr><td class="module"><a href="Numbers.html">Numbers</a></td><td><div class="info">
Modules about numbers that satisfy <a href="Identifiable.S.html"><code class="code"><span class="constructor">Identifiable</span>.<span class="constructor">S</span></code></a>.
</div>
</td></tr>
<tr><td class="module"><a href="Obj.html">Obj</a></td><td><div class="info">
Operations on internal representations of values.
</div>
</td></tr>
<tr><td class="module"><a href="Oo.html">Oo</a></td><td><div class="info">
Operations on objects
</div>
</td></tr>
<tr><td class="module"><a href="Parse.html">Parse</a></td><td><div class="info">
Entry points in the parser
</div>
</td></tr>
<tr><td class="module"><a href="Parser.html">Parser</a></td><td></td></tr>
<tr><td class="module"><a href="Parsetree.html">Parsetree</a></td><td><div class="info">
Abstract syntax tree produced by parsing
</div>
</td></tr>
<tr><td class="module"><a href="Parsing.html">Parsing</a></td><td><div class="info">
The run-time library for parsers generated by <code class="code">ocamlyacc</code>.
</div>
</td></tr>
<tr><td class="module"><a href="Pervasives.html">Pervasives</a></td><td><div class="info">
The initially opened module.
</div>
</td></tr>
<tr><td class="module"><a href="Pprintast.html">Pprintast</a></td><td></td></tr>
<tr><td class="module"><a href="Printast.html">Printast</a></td><td></td></tr>
<tr><td class="module"><a href="Printexc.html">Printexc</a></td><td><div class="info">
Facilities for printing exceptions and inspecting current call stack.
</div>
</td></tr>
<tr><td class="module"><a href="Printf.html">Printf</a></td><td><div class="info">
Formatted output functions.
</div>
</td></tr>
<tr><td class="module"><a href="Queue.html">Queue</a></td><td><div class="info">
First-in first-out queues.
</div>
</td></tr>
<tr><td class="module"><a href="Random.html">Random</a></td><td><div class="info">
Pseudo-random number generators (PRNG).
</div>
</td></tr>
<tr><td class="module"><a href="Ratio.html">Ratio</a></td><td><div class="info">
Operation on rational numbers.
</div>
</td></tr>
<tr><td class="module"><a href="Scanf.html">Scanf</a></td><td><div class="info">
Formatted input functions.
</div>
</td></tr>
<tr><td class="module"><a href="Set.html">Set</a></td><td><div class="info">
Sets over ordered types.
</div>
</td></tr>
<tr><td class="module"><a href="Sort.html">Sort</a></td><td><div class="info">
<span class="deprecated">Sorting and merging lists.
</span></div>
</td></tr>
<tr><td class="module"><a href="Spacetime.html">Spacetime</a></td><td><div class="info">
Profiling of a program's space behaviour over time.
</div>
</td></tr>
<tr><td class="module"><a href="Stack.html">Stack</a></td><td><div class="info">
Last-in first-out stacks.
</div>
</td></tr>
<tr><td class="module"><a href="StdLabels.html">StdLabels</a></td><td><div class="info">
Standard labeled libraries.
</div>
</td></tr>
<tr><td class="module"><a href="Str.html">Str</a></td><td><div class="info">
Regular expressions and high-level string processing
</div>
</td></tr>
<tr><td class="module"><a href="Stream.html">Stream</a></td><td><div class="info">
Streams and parsers.
</div>
</td></tr>
<tr><td class="module"><a href="String.html">String</a></td><td><div class="info">
String operations.
</div>
</td></tr>
<tr><td class="module"><a href="StringLabels.html">StringLabels</a></td><td><div class="info">
String operations.
</div>
</td></tr>
<tr><td class="module"><a href="Strongly_connected_components.html">Strongly_connected_components</a></td><td><div class="info">
Kosaraju's algorithm for strongly connected components.
</div>
</td></tr>
<tr><td class="module"><a href="Syntaxerr.html">Syntaxerr</a></td><td><div class="info">
Auxiliary type for reporting syntax errors
</div>
</td></tr>
<tr><td class="module"><a href="Sys.html">Sys</a></td><td><div class="info">
System interface.
</div>
</td></tr>
<tr><td class="module"><a href="Targetint.html">Targetint</a></td><td><div class="info">
Target processor-native integers.
</div>
</td></tr>
<tr><td class="module"><a href="Tbl.html">Tbl</a></td><td></td></tr>
<tr><td class="module"><a href="Terminfo.html">Terminfo</a></td><td></td></tr>
<tr><td class="module"><a href="Thread.html">Thread</a></td><td><div class="info">
Lightweight threads for Posix <code class="code">1003.1c</code> and Win32.
</div>
</td></tr>
<tr><td class="module"><a href="ThreadUnix.html">ThreadUnix</a></td><td><div class="info">
<span class="deprecated">Thread-compatible system calls.
</span></div>
</td></tr>
<tr><td class="module"><a href="Timings.html">Timings</a></td><td><div class="info">
Compiler performance recording
</div>
</td></tr>
<tr><td class="module"><a href="Uchar.html">Uchar</a></td><td><div class="info">
Unicode characters.
</div>
</td></tr>
<tr><td class="module"><a href="Unix.html">Unix</a></td><td><div class="info">
Interface to the Unix system.
</div>
</td></tr>
<tr><td class="module"><a href="UnixLabels.html">UnixLabels</a></td><td><div class="info">
Interface to the Unix system.
</div>
</td></tr>
<tr><td class="module"><a href="Warnings.html">Warnings</a></td><td></td></tr>
<tr><td class="module"><a href="Weak.html">Weak</a></td><td><div class="info">
Arrays of weak pointers and hash sets of weak pointers.
</div>
</td></tr>
</tbody></table>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>