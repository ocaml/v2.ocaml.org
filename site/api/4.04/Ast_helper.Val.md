<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ast_helper.Val</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ast_helper.Val.html">Ast_helper.Val</a></h1>

<pre><span class="keyword">module</span> Val: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Val.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Value declarations<br>
</div>
<hr width="100%">

<pre><span id="VALmk"><span class="keyword">val</span> mk</span> : <code class="type">?loc:<a href="Ast_helper.html#TYPEloc">Ast_helper.loc</a> -&gt;<br>       ?attrs:<a href="Ast_helper.html#TYPEattrs">Ast_helper.attrs</a> -&gt;<br>       ?docs:<a href="Docstrings.html#TYPEdocs">Docstrings.docs</a> -&gt;<br>       ?prim:string list -&gt;<br>       <a href="Ast_helper.html#TYPEstr">Ast_helper.str</a> -&gt; <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a> -&gt; <a href="Parsetree.html#TYPEvalue_description">Parsetree.value_description</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>