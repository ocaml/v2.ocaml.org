<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable.S.Set</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Identifiable.S.Set.html">Identifiable.S.Set</a></h1>

<pre><span class="keyword">module</span> Set: <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.S.Set.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> <a href="Set.S.html">Set.S</a></pre>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; unit</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; unit</code></pre>
<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type"><a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; string</code></pre>
<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">elt list -&gt; <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">(elt -&gt; elt) -&gt; <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a> -&gt; <a href="Identifiable.S.html#TYPEt">Identifiable.S.t</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>