<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalLazy</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalLazy.html">CamlinternalLazy</a></h1>

<pre><span class="keyword">module</span> CamlinternalLazy: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalLazy.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Run-time support for lazy values.
    All functions in this module are for system use only, not for the
    casual user.<br>
</div>
<hr width="100%">

<pre><span id="EXCEPTIONUndefined"><span class="keyword">exception</span> Undefined</span></pre>

<pre><span id="VALforce_lazy_block"><span class="keyword">val</span> force_lazy_block</span> : <code class="type">'a lazy_t -&gt; 'a</code></pre>
<pre><span id="VALforce_val_lazy_block"><span class="keyword">val</span> force_val_lazy_block</span> : <code class="type">'a lazy_t -&gt; 'a</code></pre>
<pre><span id="VALforce"><span class="keyword">val</span> force</span> : <code class="type">'a lazy_t -&gt; 'a</code></pre>
<pre><span id="VALforce_val"><span class="keyword">val</span> force_val</span> : <code class="type">'a lazy_t -&gt; 'a</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>