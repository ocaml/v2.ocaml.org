<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Simplif</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Simplif.html">Simplif</a></h1>

<pre><span id="MODULESimplif"><span class="keyword">module</span> Simplif</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Simplif.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Lambda simplification and lambda plugin hooks</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALsimplify_lambda"><span class="keyword">val</span> simplify_lambda</span> : <code class="type">string -&gt; Lambda.lambda -&gt; Lambda.lambda</code></pre>
<pre><span id="VALsplit_default_wrapper"><span class="keyword">val</span> split_default_wrapper</span> : <code class="type">id:Ident.t -&gt;<br>       kind:Lambda.function_kind -&gt;<br>       params:Ident.t list -&gt;<br>       body:Lambda.lambda -&gt;<br>       attr:Lambda.function_attribute -&gt;<br>       loc:<a href="Location.html#TYPEt">Location.t</a> -&gt; (Ident.t * Lambda.lambda) list</code></pre>
<pre><span id="VALis_tail_native_heuristic"><span class="keyword">val</span> is_tail_native_heuristic</span> : <code class="type">(int -&gt; bool) <a href="Pervasives.html#TYPEref">ref</a></code></pre>
<pre><span id="MODULEHooks"><span class="keyword">module</span> <a href="Simplif.Hooks.html">Hooks</a></span>: <code class="type"><a href="Misc.HookSig.html">Misc.HookSig</a></code><code class="type">  with type t = lambda</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>