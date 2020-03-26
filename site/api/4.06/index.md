<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><h1>The OCaml API</h1><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(true);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(true)"><span class="search_comment">(search values, type signatures, and descriptions - case sensitive)</span></div>
<div id="search_results"></div><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><div class="toc_title"><a href="#top"></a></div><ul>
<li><a href="index_types.html">Index of types</a></li>
<li><a href="index_exceptions.html">Index of exceptions</a></li>
<li><a href="index_values.html">Index of values</a></li>
<li><a href="index_modules.html">Index of modules</a></li>
<li><a href="index_module_types.html">Index of module types</a></li>
</ul></nav></header>
<div class="index-list">

</div>

<table class="indextable module-list">
<tbody><tr><td class="module"><a href="Arg.html">Arg</a></td><td><div class="info">
<p>Parsing of command line arguments.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Arg_helper.html">Arg_helper</a></td><td><div class="info">
<p>Decipher command line arguments of the form
        &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code class="code">,...</code>
    (as used for example for the specification of inlining parameters
    varying by simplification round).</p>

</div>
</td></tr>
<tr><td class="module"><a href="Array.html">Array</a></td><td><div class="info">
<p>Array operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="ArrayLabels.html">ArrayLabels</a></td><td><div class="info">
<p>Array operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_helper.html">Ast_helper</a></td><td><div class="info">
<p>Helpers to produce Parsetree fragments</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_invariants.html">Ast_invariants</a></td><td><div class="info">
<p>Check AST invariants</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_iterator.html">Ast_iterator</a></td><td><div class="info">
<p><a href="Ast_iterator.html#TYPEiterator"><code class="code"><span class="constructor">Ast_iterator</span>.iterator</code></a> allows to implement AST inspection using open recursion.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_mapper.html">Ast_mapper</a></td><td><div class="info">
<p>The interface of a -ppx rewriter</p>

</div>
</td></tr>
<tr><td class="module"><a href="Asttypes.html">Asttypes</a></td><td><div class="info">
<p>Auxiliary AST types used by parsetree and typedtree.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Attr_helper.html">Attr_helper</a></td><td><div class="info">
<p>Helpers for attributes</p>

</div>
</td></tr>
<tr><td class="module"><a href="Bigarray.html">Bigarray</a></td><td><div class="info">
<p>Large, multi-dimensional, numerical arrays.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Buffer.html">Buffer</a></td><td><div class="info">
<p>Extensible buffers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Builtin_attributes.html">Builtin_attributes</a></td><td></td></tr>
<tr><td class="module"><a href="Bytes.html">Bytes</a></td><td><div class="info">
<p>Byte sequence operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="BytesLabels.html">BytesLabels</a></td><td><div class="info">
<p>Byte sequence operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Callback.html">Callback</a></td><td><div class="info">
<p>Registering OCaml values with the C runtime.</p>

</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalFormat.html">CamlinternalFormat</a></td><td></td></tr>
<tr><td class="module"><a href="CamlinternalFormatBasics.html">CamlinternalFormatBasics</a></td><td></td></tr>
<tr><td class="module"><a href="CamlinternalLazy.html">CamlinternalLazy</a></td><td><div class="info">
<p>Run-time support for lazy values.</p>

</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalMod.html">CamlinternalMod</a></td><td><div class="info">
<p>Run-time support for recursive modules.</p>

</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalOO.html">CamlinternalOO</a></td><td><div class="info">
<p>Run-time support for objects and classes.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ccomp.html">Ccomp</a></td><td></td></tr>
<tr><td class="module"><a href="Char.html">Char</a></td><td><div class="info">
<p>Character operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Clflags.html">Clflags</a></td><td><div class="info">
<p>Command line flags</p>

</div>
</td></tr>
<tr><td class="module"><a href="Complex.html">Complex</a></td><td><div class="info">
<p>Complex numbers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Condition.html">Condition</a></td><td><div class="info">
<p>Condition variables to synchronize between threads.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Config.html">Config</a></td><td></td></tr>
<tr><td class="module"><a href="Consistbl.html">Consistbl</a></td><td></td></tr>
<tr><td class="module"><a href="Depend.html">Depend</a></td><td><div class="info">
<p>Module dependencies.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Digest.html">Digest</a></td><td><div class="info">
<p>MD5 message digest.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Docstrings.html">Docstrings</a></td><td><div class="info">
<p>Documentation comments</p>

</div>
</td></tr>
<tr><td class="module"><a href="Dynlink.html">Dynlink</a></td><td><div class="info">
<p>Dynamic loading of object files.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ephemeron.html">Ephemeron</a></td><td><div class="info">
<p>Ephemerons and weak hash table</p>

</div>
</td></tr>
<tr><td class="module"><a href="Event.html">Event</a></td><td><div class="info">
<p>First-class synchronous communication.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Filename.html">Filename</a></td><td><div class="info">
<p>Operations on file names.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Format.html">Format</a></td><td><div class="info">
<p>Pretty-printing.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Gc.html">Gc</a></td><td><div class="info">
<p>Memory management control and statistics; finalised values.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Genlex.html">Genlex</a></td><td><div class="info">
<p>A generic lexical analyzer.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Graphics.html">Graphics</a></td><td><div class="info">
<p>Machine-independent graphics primitives.</p>

</div>
</td></tr>
<tr><td class="module"><a href="GraphicsX11.html">GraphicsX11</a></td><td><div class="info">
<p>Additional graphics primitives for the X Windows system.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Hashtbl.html">Hashtbl</a></td><td><div class="info">
<p>Hash tables and hash functions.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Identifiable.html">Identifiable</a></td><td><div class="info">
<p>Uniform interface for common data structures over various things.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Int32.html">Int32</a></td><td><div class="info">
<p>32-bit integers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Int64.html">Int64</a></td><td><div class="info">
<p>64-bit integers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Lazy.html">Lazy</a></td><td><div class="info">
<p>Deferred computations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Lexer.html">Lexer</a></td><td></td></tr>
<tr><td class="module"><a href="Lexing.html">Lexing</a></td><td><div class="info">
<p>The run-time library for lexers generated by <code class="code">ocamllex</code>.</p>

</div>
</td></tr>
<tr><td class="module"><a href="List.html">List</a></td><td><div class="info">
<p>List operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="ListLabels.html">ListLabels</a></td><td><div class="info">
<p>List operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Location.html">Location</a></td><td><div class="info">
<p>Source code locations (ranges of positions), used in parsetree.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Longident.html">Longident</a></td><td><div class="info">
<p>Long identifiers, used in parsetree.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Map.html">Map</a></td><td><div class="info">
<p>Association tables over ordered types.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Marshal.html">Marshal</a></td><td><div class="info">
<p>Marshaling of data structures.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Misc.html">Misc</a></td><td></td></tr>
<tr><td class="module"><a href="MoreLabels.html">MoreLabels</a></td><td><div class="info">
<p>Extra labeled libraries.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Mutex.html">Mutex</a></td><td><div class="info">
<p>Locks for mutual exclusion.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Nativeint.html">Nativeint</a></td><td><div class="info">
<p>Processor-native integers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Numbers.html">Numbers</a></td><td><div class="info">
<p>Modules about numbers, some of which satisfy <a href="Identifiable.S.html"><code class="code"><span class="constructor">Identifiable</span>.<span class="constructor">S</span></code></a>.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Obj.html">Obj</a></td><td><div class="info">
<p>Operations on internal representations of values.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Oo.html">Oo</a></td><td><div class="info">
<p>Operations on objects</p>

</div>
</td></tr>
<tr><td class="module"><a href="Parse.html">Parse</a></td><td><div class="info">
<p>Entry points in the parser</p>

</div>
</td></tr>
<tr><td class="module"><a href="Parser.html">Parser</a></td><td></td></tr>
<tr><td class="module"><a href="Parsetree.html">Parsetree</a></td><td><div class="info">
<p>Abstract syntax tree produced by parsing</p>

</div>
</td></tr>
<tr><td class="module"><a href="Parsing.html">Parsing</a></td><td><div class="info">
<p>The run-time library for parsers generated by <code class="code">ocamlyacc</code>.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Pervasives.html">Pervasives</a></td><td><div class="info">
<p>The initially opened module.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Pparse.html">Pparse</a></td><td><div class="info">
<p>Driver for the parser, external preprocessors and ast plugin hooks</p>

</div>
</td></tr>
<tr><td class="module"><a href="Pprintast.html">Pprintast</a></td><td></td></tr>
<tr><td class="module"><a href="Printast.html">Printast</a></td><td></td></tr>
<tr><td class="module"><a href="Printexc.html">Printexc</a></td><td><div class="info">
<p>Facilities for printing exceptions and inspecting current call stack.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Printf.html">Printf</a></td><td><div class="info">
<p>Formatted output functions.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Profile.html">Profile</a></td><td><div class="info">
<p>Compiler performance recording</p>

</div>
</td></tr>
<tr><td class="module"><a href="Queue.html">Queue</a></td><td><div class="info">
<p>First-in first-out queues.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Random.html">Random</a></td><td><div class="info">
<p>Pseudo-random number generators (PRNG).</p>

</div>
</td></tr>
<tr><td class="module"><a href="Scanf.html">Scanf</a></td><td><div class="info">
<p>Formatted input functions.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Set.html">Set</a></td><td><div class="info">
<p>Sets over ordered types.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Simplif.html">Simplif</a></td><td><div class="info">
<p>Lambda simplification and lambda plugin hooks</p>

</div>
</td></tr>
<tr><td class="module"><a href="Sort.html">Sort</a></td><td><div class="info">
<span class="deprecated"><p>Sorting and merging lists.</p>

</span></div>
</td></tr>
<tr><td class="module"><a href="Spacetime.html">Spacetime</a></td><td><div class="info">
<p>Profiling of a program's space behaviour over time.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Stack.html">Stack</a></td><td><div class="info">
<p>Last-in first-out stacks.</p>

</div>
</td></tr>
<tr><td class="module"><a href="StdLabels.html">StdLabels</a></td><td><div class="info">
<p>Standard labeled libraries.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Str.html">Str</a></td><td><div class="info">
<p>Regular expressions and high-level string processing</p>

</div>
</td></tr>
<tr><td class="module"><a href="Stream.html">Stream</a></td><td><div class="info">
<p>Streams and parsers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="String.html">String</a></td><td><div class="info">
<p>String operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="StringLabels.html">StringLabels</a></td><td><div class="info">
<p>String operations.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Strongly_connected_components.html">Strongly_connected_components</a></td><td><div class="info">
<p>Kosaraju's algorithm for strongly connected components.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Syntaxerr.html">Syntaxerr</a></td><td><div class="info">
<p>Auxiliary type for reporting syntax errors</p>

</div>
</td></tr>
<tr><td class="module"><a href="Sys.html">Sys</a></td><td><div class="info">
<p>System interface.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Targetint.html">Targetint</a></td><td><div class="info">
<p>Target processor-native integers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Tbl.html">Tbl</a></td><td></td></tr>
<tr><td class="module"><a href="Terminfo.html">Terminfo</a></td><td></td></tr>
<tr><td class="module"><a href="Thread.html">Thread</a></td><td><div class="info">
<p>Lightweight threads for Posix <code class="code">1003.1c</code> and Win32.</p>

</div>
</td></tr>
<tr><td class="module"><a href="ThreadUnix.html">ThreadUnix</a></td><td><div class="info">
<span class="deprecated"><p>Thread-compatible system calls.</p>

</span></div>
</td></tr>
<tr><td class="module"><a href="Typemod.html">Typemod</a></td><td><div class="info">
<p>Type-checking of the module language and typed ast plugin hooks</p>

</div>
</td></tr>
<tr><td class="module"><a href="Uchar.html">Uchar</a></td><td><div class="info">
<p>Unicode characters.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Unix.html">Unix</a></td><td><div class="info">
<p>Interface to the Unix system.</p>

</div>
</td></tr>
<tr><td class="module"><a href="UnixLabels.html">UnixLabels</a></td><td><div class="info">
<p>Interface to the Unix system.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Warnings.html">Warnings</a></td><td></td></tr>
<tr><td class="module"><a href="Weak.html">Weak</a></td><td><div class="info">
<p>Arrays of weak pointers and hash sets of weak pointers.</p>

</div>
</td></tr>
</tbody></table>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>