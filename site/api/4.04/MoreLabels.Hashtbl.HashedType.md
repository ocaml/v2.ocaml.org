<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">MoreLabels.Hashtbl.HashedType</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_MoreLabels.Hashtbl.HashedType.html">MoreLabels.Hashtbl.HashedType</a></h1>

<pre><span class="keyword">module type</span> HashedType = <code class="type"><a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of the hashtable keys.<br>
</div>


<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Hashtbl.HashedType.html#TYPEt">t</a> -&gt; <a href="Hashtbl.HashedType.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
The equality predicate used to compare keys.<br>
</div>

<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type"><a href="Hashtbl.HashedType.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
A hashing function on keys. It must be such that if two keys are
          equal according to <code class="code">equal</code>, then they have identical hash values
          as computed by <code class="code">hash</code>.
          Examples: suitable (<code class="code">equal</code>, <code class="code">hash</code>) pairs for arbitrary key
          types include<ul>
<li>        (<code class="code">(=)</code>, <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a>) for comparing objects by structure
              (provided objects do not contain floats)</li>
<li>        (<code class="code">(<span class="keyword">fun</span>&nbsp;x&nbsp;y&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;compare&nbsp;x&nbsp;y&nbsp;=&nbsp;0)</code>, <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a>)
              for comparing objects by structure
              and handling <a href="Pervasives.html#VALnan"><code class="code">nan</code></a> correctly</li>
<li>        (<code class="code">(==)</code>, <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a>) for comparing objects by physical
              equality (e.g. for mutable or cyclic objects).</li>
</ul>
<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>