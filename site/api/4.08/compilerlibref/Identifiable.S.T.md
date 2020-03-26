<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable.S.T</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Identifiable.S.T.html">Identifiable.S.T</a></h1>

<pre><span id="MODULET"><span class="keyword">module</span> T</span>: <code class="type"><a href="Identifiable.Thing.html">Identifiable.Thing</a></code><code class="type">  with type t = t</code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span class="keyword">include</span> Hashtbl.HashedType</pre>

<pre><span class="keyword">include</span> Map.OrderedType</pre>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type">out_channel -&gt; <a href="Identifiable.Thing.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">Format.formatter -&gt; <a href="Identifiable.Thing.html#TYPEt">t</a> -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>