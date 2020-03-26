<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Parse</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Parse.html">Parse</a></h1>

<pre><span id="MODULEParse"><span class="keyword">module</span> Parse</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Parse.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Entry points in the parser</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALimplementation"><span class="keyword">val</span> implementation</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a></code></pre>
<pre><span id="VALinterface"><span class="keyword">val</span> interface</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a></code></pre>
<pre><span id="VALtoplevel_phrase"><span class="keyword">val</span> toplevel_phrase</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a></code></pre>
<pre><span id="VALuse_file"><span class="keyword">val</span> use_file</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> list</code></pre>
<pre><span id="VALcore_type"><span class="keyword">val</span> core_type</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a></code></pre>
<pre><span id="VALexpression"><span class="keyword">val</span> expression</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a></code></pre>
<pre><span id="VALpattern"><span class="keyword">val</span> pattern</span> : <code class="type">Lexing.lexbuf -&gt; <a href="Parsetree.html#TYPEpattern">Parsetree.pattern</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>