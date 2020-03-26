<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ast_helper.Const</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ast_helper.Const.html">Ast_helper.Const</a></h1>

<pre><span class="keyword">module</span> Const: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Const.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALchar"><span class="keyword">val</span> char</span> : <code class="type">char -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALstring"><span class="keyword">val</span> string</span> : <code class="type">?quotation_delimiter:string -&gt; string -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALinteger"><span class="keyword">val</span> integer</span> : <code class="type">?suffix:char -&gt; string -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALint"><span class="keyword">val</span> int</span> : <code class="type">?suffix:char -&gt; int -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALint32"><span class="keyword">val</span> int32</span> : <code class="type">?suffix:char -&gt; int32 -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALint64"><span class="keyword">val</span> int64</span> : <code class="type">?suffix:char -&gt; int64 -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALnativeint"><span class="keyword">val</span> nativeint</span> : <code class="type">?suffix:char -&gt; nativeint -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre>
<pre><span id="VALfloat"><span class="keyword">val</span> float</span> : <code class="type">?suffix:char -&gt; string -&gt; <a href="Parsetree.html#TYPEconstant">Parsetree.constant</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>