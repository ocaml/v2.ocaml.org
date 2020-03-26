<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.RowDisplacement</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.RowDisplacement.html">CamlinternalMenhirLib.RowDisplacement</a></h1>

<pre><span id="MODULERowDisplacement"><span class="keyword">module</span> RowDisplacement</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.RowDisplacement.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEtable"><span class="keyword">type</span> <code class="type">'a</code> table</span> = <code class="type">int array * 'a array</code> </pre>


<pre><span id="VALcompress"><span class="keyword">val</span> compress</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt;<br>       ('a -&gt; bool) -&gt;<br>       'a -&gt;<br>       int -&gt;<br>       int -&gt; 'a array array -&gt; 'a <a href="CamlinternalMenhirLib.RowDisplacement.html#TYPEtable">table</a></code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">'a <a href="CamlinternalMenhirLib.RowDisplacement.html#TYPEtable">table</a> -&gt; int -&gt; int -&gt; 'a</code></pre>
<pre><span id="VALgetget"><span class="keyword">val</span> getget</span> : <code class="type">('displacement -&gt; int -&gt; int) -&gt;<br>       ('data -&gt; int -&gt; 'a) -&gt; 'displacement * 'data -&gt; int -&gt; int -&gt; 'a</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>