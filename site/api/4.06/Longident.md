<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Longident</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Longident.html">Longident</a></h1>

<pre><span id="MODULELongident"><span class="keyword">module</span> Longident</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Longident.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Long identifiers, used in parsetree.</p>
</div>
</div>
<hr width="100%">

<pre><code><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Lident"><span class="constructor">Lident</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Ldot"><span class="constructor">Ldot</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Lapply"><span class="constructor">Lapply</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">t</a> * <a href="Longident.html#TYPEt">t</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALflatten"><span class="keyword">val</span> flatten</span> : <code class="type"><a href="Longident.html#TYPEt">t</a> -&gt; string list</code></pre>
<pre><span id="VALunflatten"><span class="keyword">val</span> unflatten</span> : <code class="type">string list -&gt; <a href="Longident.html#TYPEt">t</a> option</code></pre>
<pre><span id="VALlast"><span class="keyword">val</span> last</span> : <code class="type"><a href="Longident.html#TYPEt">t</a> -&gt; string</code></pre>
<pre><span id="VALparse"><span class="keyword">val</span> parse</span> : <code class="type">string -&gt; <a href="Longident.html#TYPEt">t</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>