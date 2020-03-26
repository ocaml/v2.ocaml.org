<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Unit</a></div><ul><li><a href="#unit">The unit type</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Unit.html">Stdlib.Unit</a></h1>

<pre><span id="MODULEUnit"><span class="keyword">module</span> Unit</span>: <code class="type"><a href="Unit.html">Unit</a></code></pre><hr width="100%">
<h2 id="unit">The unit type</h2>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">unit</code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.()"><span class="constructor">()</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>The unit type.</p>

<p>The constructor <code class="code">()</code> is included here so that it has a path,
    but it is not intended to be used in user-defined data types.</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>



<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Unit.html#TYPEt">t</a> -&gt; <a href="Unit.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;u1&nbsp;u2</code> is <code class="code"><span class="keyword">true</span></code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Unit.html#TYPEt">t</a> -&gt; <a href="Unit.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;u1&nbsp;u2</code> is <code class="code">0</code>.</p>
</div>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type"><a href="Unit.html#TYPEt">t</a> -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_string&nbsp;b</code> is <code class="code"><span class="string">"()"</span></code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>