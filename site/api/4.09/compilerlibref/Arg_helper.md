<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Arg_helper</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Arg_helper.html">Arg_helper</a></h1>

<pre><span id="MODULEArg_helper"><span class="keyword">module</span> Arg_helper</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Decipher command line arguments of the form
        &lt;value&gt; | &lt;key&gt;=&lt;value&gt;<code class="code">,...</code></p>

<p>(as used for example for the specification of inlining parameters
    varying by simplification round).</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Arg_helper.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">S</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="MODULEKey"><span class="keyword">module</span> <a href="Arg_helper.Make.Key.html">Key</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Key.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEValue"><span class="keyword">module</span> <a href="Arg_helper.Make.Value.html">Value</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.Value.html">..</a> <code class="code"><span class="keyword">end</span></code></pre></div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="Arg_helper.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>