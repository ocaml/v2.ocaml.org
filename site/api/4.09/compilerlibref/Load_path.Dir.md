<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Load_path.Dir</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Load_path.Dir.html">Load_path.Dir</a></h1>

<pre><span id="MODULEDir"><span class="keyword">module</span> Dir</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Load_path.Dir.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>Represent one directory in the load path.</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">string -&gt; <a href="Load_path.Dir.html#TYPEt">t</a></code></pre>
<pre><span id="VALpath"><span class="keyword">val</span> path</span> : <code class="type"><a href="Load_path.Dir.html#TYPEt">t</a> -&gt; string</code></pre>
<pre><span id="VALfiles"><span class="keyword">val</span> files</span> : <code class="type"><a href="Load_path.Dir.html#TYPEt">t</a> -&gt; string list</code></pre><div class="info ">
<div class="info-desc">
<p>All the files in that directory. This doesn't include files in
      sub-directories of this directory.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>