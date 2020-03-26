<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pparse.InterfaceHooks</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pparse.InterfaceHooks.html">Pparse.InterfaceHooks</a></h1>

<pre><span id="MODULEInterfaceHooks"><span class="keyword">module</span> InterfaceHooks</span>: <code class="type"><a href="Misc.HookSig.html">Misc.HookSig</a></code><code class="type">  with type t = <a href="Parsetree.html">Parsetree</a>.signature</code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="VALadd_hook"><span class="keyword">val</span> add_hook</span> : <code class="type">string -&gt; (<a href="Misc.html#TYPEhook_info">Misc.hook_info</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a>) -&gt; unit</code></pre>
<pre><span id="VALapply_hooks"><span class="keyword">val</span> apply_hooks</span> : <code class="type"><a href="Misc.html#TYPEhook_info">Misc.hook_info</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>