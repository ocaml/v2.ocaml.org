<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.Option</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.Option.html">Misc.Stdlib.Option</a></h1>

<pre><span id="MODULEOption"><span class="keyword">module</span> Option</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.Option.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a option</code> </pre>


<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt;<br>       'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; 'b <a href="Misc.Stdlib.Option.html#TYPEt">t</a></code></pre>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; 'b -&gt; 'b</code></pre>
<pre><span id="VALvalue_default"><span class="keyword">val</span> value_default</span> : <code class="type">('a -&gt; 'b) -&gt; default:'b -&gt; 'a <a href="Misc.Stdlib.Option.html#TYPEt">t</a> -&gt; 'b</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>