<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMod</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMod.html">CamlinternalMod</a></h1>

<pre><span class="keyword">module</span> CamlinternalMod: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMod.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Run-time support for recursive modules.
    All functions in this module are for system use only, not for the
    casual user.<br>
</div>
<hr width="100%">

<pre><code><span id="TYPEshape"><span class="keyword">type</span> <code class="type"></code>shape</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshape.Function"><span class="constructor">Function</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshape.Lazy"><span class="constructor">Lazy</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshape.Class"><span class="constructor">Class</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshape.Module"><span class="constructor">Module</span></span> <span class="keyword">of</span> <code class="type"><a href="CamlinternalMod.html#TYPEshape">shape</a> array</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTshape.Value"><span class="constructor">Value</span></span> <span class="keyword">of</span> <code class="type"><a href="Obj.html#TYPEt">Obj.t</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALinit_mod"><span class="keyword">val</span> init_mod</span> : <code class="type">string * int * int -&gt; <a href="CamlinternalMod.html#TYPEshape">shape</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a></code></pre>
<pre><span id="VALupdate_mod"><span class="keyword">val</span> update_mod</span> : <code class="type"><a href="CamlinternalMod.html#TYPEshape">shape</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>