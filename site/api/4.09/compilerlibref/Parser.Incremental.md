<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Parser.Incremental</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Parser.Incremental.html">Parser.Incremental</a></h1>

<pre><span id="MODULEIncremental"><span class="keyword">module</span> Incremental</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Parser.Incremental.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALuse_file"><span class="keyword">val</span> use_file</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> list Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALtoplevel_phrase"><span class="keyword">val</span> toplevel_phrase</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALparse_pattern"><span class="keyword">val</span> parse_pattern</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEpattern">Parsetree.pattern</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALparse_expression"><span class="keyword">val</span> parse_expression</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALparse_core_type"><span class="keyword">val</span> parse_core_type</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALinterface"><span class="keyword">val</span> interface</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<pre><span id="VALimplementation"><span class="keyword">val</span> implementation</span> : <code class="type">Lexing.position -&gt;<br>       <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> Parser.MenhirInterpreter.checkpoint</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>