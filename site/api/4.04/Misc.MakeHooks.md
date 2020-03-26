<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.MakeHooks</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Misc.MakeHooks.html">Misc.MakeHooks</a></h1>

<pre><span class="keyword">module</span> MakeHooks: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">M</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code><div class="sig_block">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>

</div><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Misc.HookSig.html">HookSig</a></code><code class="type">  with type t = M.t</code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>M</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig type t end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="VALadd_hook"><span class="keyword">val</span> add_hook</span> : <code class="type">string -&gt; (<a href="Misc.html#TYPEhook_info">Misc.hook_info</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a>) -&gt; unit</code></pre>
<pre><span id="VALapply_hooks"><span class="keyword">val</span> apply_hooks</span> : <code class="type"><a href="Misc.html#TYPEhook_info">Misc.hook_info</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a> -&gt; <a href="Misc.HookSig.html#TYPEt">t</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>