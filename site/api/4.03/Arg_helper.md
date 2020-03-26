<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Arg_helper</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Arg_helper.html">Arg_helper</a></h1>

<pre><span class="keyword">module</span> Arg_helper: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Decipher command line arguments of the form
        &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code class="code">,...</code>
    (as used for example for the specification of inlining parameters
    varying by simplification round).<br>
</div>
<hr width="100%">

<pre><span class="keyword">module</span> <a href="Arg_helper.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">S</span></code><code class="code"> : </code><code class="code"><span class="keyword">sig</span></code><div class="sig_block">
<pre><span class="keyword">module</span> <a href="Arg_helper.Make.Key.html">Key</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Key.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="Arg_helper.Make.Value.html">Value</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Value.html">..</a> <code class="code"><span class="keyword">end</span></code></pre></div><code class="code"><span class="keyword">end</span></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></div></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>