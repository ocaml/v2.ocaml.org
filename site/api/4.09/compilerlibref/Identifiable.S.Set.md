<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable.S.Set</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Identifiable.S.Set.html">Identifiable.S.Set</a></h1>

<pre><span id="MODULESet"><span class="keyword">module</span> Set</span>: <code class="type"><a href="Identifiable.Set.html">Identifiable.Set</a></code><code class="type">  with module T := T</code></pre><hr width="100%">

<pre><span id="MODULET"><span class="keyword">module</span> <a href="Identifiable.Set.T.html">T</a></span>: <code class="type">Set.OrderedType</code><code class="type"> </code></pre>
<pre><span class="keyword">include</span> Set.S</pre>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type">out_channel -&gt; t -&gt; unit</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">Format.formatter -&gt; t -&gt; unit</code></pre>
<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">t -&gt; string</code></pre>
<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">elt list -&gt; t</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">(elt -&gt; elt) -&gt; t -&gt; t</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>