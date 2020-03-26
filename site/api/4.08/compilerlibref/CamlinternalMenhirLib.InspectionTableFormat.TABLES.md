<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.InspectionTableFormat.TABLES</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_CamlinternalMenhirLib.InspectionTableFormat.TABLES.html">CamlinternalMenhirLib.InspectionTableFormat.TABLES</a></h1>

<pre><span id="MODULETYPETABLES"><span class="keyword">module type</span> TABLES</span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.InspectionTableFormat.TABLES.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html">CamlinternalMenhirLib.IncrementalEngine.SYMBOLS</a></pre>

<pre><span id="TYPElr1state"><span class="keyword">type</span> <code class="type">'a</code> lr1state</span> </pre>


<pre><span id="VALterminal"><span class="keyword">val</span> terminal</span> : <code class="type">int -&gt; xsymbol</code></pre>
<pre><span id="VALnonterminal"><span class="keyword">val</span> nonterminal</span> : <code class="type">int -&gt; xsymbol</code></pre>
<pre><span id="VALrhs"><span class="keyword">val</span> rhs</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a> *<br>       <a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALlr0_core"><span class="keyword">val</span> lr0_core</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALlr0_items"><span class="keyword">val</span> lr0_items</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a> *<br>       <a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALlr0_incoming"><span class="keyword">val</span> lr0_incoming</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALnullable"><span class="keyword">val</span> nullable</span> : <code class="type">string</code></pre>
<pre><span id="VALfirst"><span class="keyword">val</span> first</span> : <code class="type">int * string</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>