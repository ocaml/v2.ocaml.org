<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Callback</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Callback.html">Callback</a></h1>

<pre><span id="MODULECallback"><span class="keyword">module</span> Callback</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Callback.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Registering OCaml values with the C runtime.</p>

<p>This module allows OCaml values to be registered with the C runtime
   under a symbolic name, so that C code can later call back registered
   OCaml functions, or raise registered OCaml exceptions.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALregister"><span class="keyword">val</span> register</span> : <code class="type">string -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Callback</span>.register&nbsp;n&nbsp;v</code> registers the value <code class="code">v</code> under
   the name <code class="code">n</code>. C code can later retrieve a handle to <code class="code">v</code>
   by calling <code class="code">caml_named_value(n)</code>.</p>
</div>
</div>

<pre><span id="VALregister_exception"><span class="keyword">val</span> register_exception</span> : <code class="type">string -&gt; exn -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Callback</span>.register_exception&nbsp;n&nbsp;exn</code> registers the
   exception contained in the exception value <code class="code">exn</code>
   under the name <code class="code">n</code>. C code can later retrieve a handle to
   the exception by calling <code class="code">caml_named_value(n)</code>. The exception
   value thus obtained is suitable for passing as first argument
   to <code class="code">raise_constant</code> or <code class="code">raise_with_arg</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>