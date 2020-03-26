<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><h1>The OCaml Compiler API</h1><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(true);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(true)"><span class="search_comment">(search values, type signatures, and descriptions - case sensitive)</span></div>
<div id="search_results"></div><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><div class="toc_title"><a href="#top"></a></div><ul><li><a href="#1_Warning">Warning</a></li>
<li><a href="index_types.html">Index of types</a></li>
<li><a href="index_exceptions.html">Index of exceptions</a></li>
<li><a href="index_values.html">Index of values</a></li>
<li><a href="index_modules.html">Index of modules</a></li>
<li><a href="index_module_types.html">Index of module types</a></li>
</ul></nav></header>
<div class="info-desc">


<h2 id="1_Warning">Warning</h2><p>This library is part of the internal OCaml compiler API, and is
not the language standard library.
  There are no compatibility guarantees between releases, so code written
against these modules must be willing to depend on specific OCaml compiler
versions.</p>

<p></p><table class="indextable module-list">
<tbody><tr><td class="module"><a href="Ast_iterator.html">Ast_iterator</a></td><td><div class="info">
<p><a href="Ast_iterator.html#TYPEiterator"><code class="code"><span class="constructor">Ast_iterator</span>.iterator</code></a> enables AST inspection using open recursion.</p>

</div>
</td></tr>
<tr><td class="module"><a href="CamlinternalMenhirLib.html">CamlinternalMenhirLib</a></td><td></td></tr>
<tr><td class="module"><a href="Ast_invariants.html">Ast_invariants</a></td><td><div class="info">
<p>Check AST invariants</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_mapper.html">Ast_mapper</a></td><td><div class="info">
<p>The interface of a -ppx rewriter</p>

</div>
</td></tr>
<tr><td class="module"><a href="Printast.html">Printast</a></td><td><div class="info">
<p>Raw printer for <a href="Parsetree.html"><code class="code"><span class="constructor">Parsetree</span></code></a></p>

</div>
</td></tr>
<tr><td class="module"><a href="Builtin_attributes.html">Builtin_attributes</a></td><td><div class="info">
<p>Support for some of the builtin attributes</p>

</div>
</td></tr>
<tr><td class="module"><a href="Pprintast.html">Pprintast</a></td><td><div class="info">
<p>Pretty-printers for <a href="Parsetree.html"><code class="code"><span class="constructor">Parsetree</span></code></a></p>

</div>
</td></tr>
<tr><td class="module"><a href="Parse.html">Parse</a></td><td><div class="info">
<p>Entry points in the parser</p>

</div>
</td></tr>
<tr><td class="module"><a href="Location.html">Location</a></td><td><div class="info">
<p>Source code locations (ranges of positions), used in parsetree</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ast_helper.html">Ast_helper</a></td><td><div class="info">
<p>Helpers to produce Parsetree fragments</p>

</div>
</td></tr>
<tr><td class="module"><a href="Syntaxerr.html">Syntaxerr</a></td><td><div class="info">
<p>Auxiliary type for reporting syntax errors</p>

</div>
</td></tr>
<tr><td class="module"><a href="Attr_helper.html">Attr_helper</a></td><td><div class="info">
<p>Helpers for attributes</p>

</div>
</td></tr>
<tr><td class="module"><a href="Asttypes.html">Asttypes</a></td><td><div class="info">
<p>Auxiliary AST types used by parsetree and typedtree.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Lexer.html">Lexer</a></td><td><div class="info">
<p>The lexical analyzer</p>

</div>
</td></tr>
<tr><td class="module"><a href="Longident.html">Longident</a></td><td><div class="info">
<p>Long identifiers, used in parsetree.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Parser.html">Parser</a></td><td></td></tr>
<tr><td class="module"><a href="Docstrings.html">Docstrings</a></td><td><div class="info">
<p>Documentation comments</p>

</div>
</td></tr>
<tr><td class="module"><a href="Parsetree.html">Parsetree</a></td><td><div class="info">
<p>Abstract syntax tree produced by parsing</p>

</div>
</td></tr>
<tr><td class="module"><a href="Depend.html">Depend</a></td><td><div class="info">
<p>Module dependencies.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Terminfo.html">Terminfo</a></td><td><div class="info">
<p>Basic interface to the terminfo database</p>

</div>
</td></tr>
<tr><td class="module"><a href="Clflags.html">Clflags</a></td><td><div class="info">
<p>Command line flags</p>

</div>
</td></tr>
<tr><td class="module"><a href="Arg_helper.html">Arg_helper</a></td><td><div class="info">
<p>Decipher command line arguments of the form
        &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code class="code">,...</code></p>

</div>
</td></tr>
<tr><td class="module"><a href="Targetint.html">Targetint</a></td><td><div class="info">
<p>Target processor-native integers.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Profile.html">Profile</a></td><td><div class="info">
<p>Compiler performance recording</p>

</div>
</td></tr>
<tr><td class="module"><a href="Strongly_connected_components.html">Strongly_connected_components</a></td><td><div class="info">
<p>Kosaraju's algorithm for strongly connected components.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Load_path.html">Load_path</a></td><td><div class="info">
<p>Management of include directories.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Build_path_prefix_map.html">Build_path_prefix_map</a></td><td><div class="info">
<p>Rewrite paths for reproducible builds</p>

</div>
</td></tr>
<tr><td class="module"><a href="Int_replace_polymorphic_compare.html">Int_replace_polymorphic_compare</a></td><td></td></tr>
<tr><td class="module"><a href="Identifiable.html">Identifiable</a></td><td><div class="info">
<p>Uniform interface for common data structures over various things.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Ccomp.html">Ccomp</a></td><td><div class="info">
<p>Compiling C files and building C libraries</p>

</div>
</td></tr>
<tr><td class="module"><a href="Misc.html">Misc</a></td><td><div class="info">
<p>Miscellaneous useful types and functions</p>

</div>
</td></tr>
<tr><td class="module"><a href="Numbers.html">Numbers</a></td><td><div class="info">
<p>Modules about numbers, some of which satisfy <a href="Identifiable.S.html"><code class="code"><span class="constructor">Identifiable</span>.<span class="constructor">S</span></code></a>.</p>

</div>
</td></tr>
<tr><td class="module"><a href="Consistbl.html">Consistbl</a></td><td><div class="info">
<p>Consistency tables: for checking consistency of module CRCs</p>

</div>
</td></tr>
<tr><td class="module"><a href="Warnings.html">Warnings</a></td><td><div class="info">
<p>Warning definitions</p>

</div>
</td></tr>
<tr><td class="module"><a href="Config.html">Config</a></td><td><div class="info">
<p>System configuration</p>

</div>
</td></tr>
<tr><td class="module"><a href="Pparse.html">Pparse</a></td><td><div class="info">
<p>Driver for the parser and external preprocessors.</p>

</div>
</td></tr>
</tbody></table><p></p>
</div>


<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>