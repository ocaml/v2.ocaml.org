<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Oo</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Oo.html">Oo</a></h1>

<pre><span class="keyword">module</span> Oo: <code class="code"><span class="keyword">sig</span></code> <a href="Oo.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Operations on objects<br>
</div>
<hr width="100%">

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">(&lt; .. &gt; as 'a) -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">Oo</span>.copy o</code> returns a copy of object <code class="code">o</code>, that is a fresh
   object with the same methods and instance variables as <code class="code">o</code>.<br>
</div>

<pre><span id="VALid"><span class="keyword">val</span> id</span> : <code class="type">&lt; .. &gt; -&gt; int</code></pre><div class="info ">
Return an integer identifying this object, unique for
    the current execution of the program. The generic comparison
    and hashing functions are based on this integer. When an object
    is obtained by unmarshaling, the id is refreshed, and thus
    different from the original object. As a consequence, the internal
    invariants of data structures such as hash table or sets containing
    objects are broken after unmarshaling the data structures.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>