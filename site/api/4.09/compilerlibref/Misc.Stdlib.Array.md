<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.Array</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.Array.html">Misc.Stdlib.Array</a></h1>

<pre><span id="MODULEArray"><span class="keyword">module</span> Array</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.Array.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALexists2"><span class="keyword">val</span> exists2</span> : <code class="type">('a -&gt; 'b -&gt; bool) -&gt; 'a array -&gt; 'b array -&gt; bool</code></pre>
<pre><span id="VALfor_alli"><span class="keyword">val</span> for_alli</span> : <code class="type">(int -&gt; 'a -&gt; bool) -&gt; 'a array -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code"><span class="constructor">Array</span>.for_all</code>, but the
        function is applied with the index of the element as first argument,
        and the element itself as second argument.</p>
</div>
</div>

<pre><span id="VALall_somes"><span class="keyword">val</span> all_somes</span> : <code class="type">'a option array -&gt; 'a array option</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>