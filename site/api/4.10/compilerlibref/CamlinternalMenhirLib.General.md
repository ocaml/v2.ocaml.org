<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.General</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.General.html">CamlinternalMenhirLib.General</a></h1>

<pre><span id="MODULEGeneral"><span class="keyword">module</span> General</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.General.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALtake"><span class="keyword">val</span> take</span> : <code class="type">int -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALdrop"><span class="keyword">val</span> drop</span> : <code class="type">int -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALuniq"><span class="keyword">val</span> uniq</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="VALweed"><span class="keyword">val</span> weed</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a list -&gt; 'a list</code></pre>
<pre><span id="TYPEstream"><span class="keyword">type</span> <code class="type">'a</code> stream</span> = <code class="type">'a <a href="CamlinternalMenhirLib.General.html#TYPEhead">head</a> Lazy.t</code> </pre>


<pre><code><span id="TYPEhead"><span class="keyword">type</span> <code class="type">'a</code> head</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELThead.Nil"><span class="constructor">Nil</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELThead.Cons"><span class="constructor">Cons</span></span> <span class="keyword">of</span> <code class="type">'a * 'a <a href="CamlinternalMenhirLib.General.html#TYPEstream">stream</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="CamlinternalMenhirLib.General.html#TYPEstream">stream</a> -&gt; int</code></pre>
<pre><span id="VALfoldr"><span class="keyword">val</span> foldr</span> : <code class="type">('a -&gt; 'b -&gt; 'b) -&gt; 'a <a href="CamlinternalMenhirLib.General.html#TYPEstream">stream</a> -&gt; 'b -&gt; 'b</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>