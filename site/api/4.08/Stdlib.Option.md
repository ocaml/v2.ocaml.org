<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Option</a></div><ul><li><a href="#options">Options</a></li><li><a href="#preds">Predicates and comparisons</a></li><li><a href="#convert">Converting</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Option.html">Stdlib.Option</a></h1>

<pre><span id="MODULEOption"><span class="keyword">module</span> Option</span>: <code class="type"><a href="Option.html">Option</a></code></pre><hr width="100%">
<h2 id="options">Options</h2>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a option</code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.None"><span class="constructor">None</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Some"><span class="constructor">Some</span></span> <span class="keyword">of</span> <code class="type">'a</code></code></td>

</tr></tbody></table>

<div class="info ">
<div class="info-desc">
<p>The type for option values. Either <code class="code"><span class="constructor">None</span></code> or a value <code class="code"><span class="constructor">Some</span>&nbsp;v</code>.</p>
</div>
</div>


<pre><span id="VALnone"><span class="keyword">val</span> none</span> : <code class="type">'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">none</code> is <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALsome"><span class="keyword">val</span> some</span> : <code class="type">'a -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">some&nbsp;v</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code>.</p>
</div>
</div>

<pre><span id="VALvalue"><span class="keyword">val</span> value</span> : <code class="type">'a option -&gt; default:'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">value&nbsp;o&nbsp;~default</code> is <code class="code">v</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and <code class="code">default</code> otherwise.</p>
</div>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">'a option -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get&nbsp;o</code> is <code class="code">v</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> otherwise.</li>
</ul>
</div>

<pre><span id="VALbind"><span class="keyword">val</span> bind</span> : <code class="type">'a option -&gt; ('a -&gt; 'b option) -&gt; 'b option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">bind&nbsp;o&nbsp;f</code> is <code class="code">f&nbsp;v</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and <code class="code"><span class="constructor">None</span></code> if <code class="code">o</code> is <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALjoin"><span class="keyword">val</span> join</span> : <code class="type">'a option option -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">join&nbsp;oo</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> if <code class="code">oo</code> is <code class="code"><span class="constructor">Some</span>&nbsp;(<span class="constructor">Some</span>&nbsp;v)</code> and <code class="code"><span class="constructor">None</span></code> otherwise.</p>
</div>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a option -&gt; 'b option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;o</code> is <code class="code"><span class="constructor">None</span></code> if <code class="code">o</code> is <code class="code"><span class="constructor">None</span></code> and <code class="code"><span class="constructor">Some</span>&nbsp;(f&nbsp;v)</code> is <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code>.</p>
</div>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">none:'a -&gt; some:('b -&gt; 'a) -&gt; 'b option -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;~none&nbsp;~some&nbsp;o</code> is <code class="code">none</code> if <code class="code">o</code> is <code class="code"><span class="constructor">None</span></code> and <code class="code">some&nbsp;v</code> if <code class="code">o</code> is
    <code class="code"><span class="constructor">Some</span>&nbsp;v</code>.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a option -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;o</code> is <code class="code">f&nbsp;v</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and <code class="code">()</code> otherwise.</p>
</div>
</div>
<h2 id="preds">Predicates and comparisons</h2>
<pre><span id="VALis_none"><span class="keyword">val</span> is_none</span> : <code class="type">'a option -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_none&nbsp;o</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">o</code> is <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALis_some"><span class="keyword">val</span> is_some</span> : <code class="type">'a option -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_some&nbsp;o</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;o</code>.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a option -&gt; 'a option -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;eq&nbsp;o0&nbsp;o1</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">o0</code> and <code class="code">o1</code> are both <code class="code"><span class="constructor">None</span></code> or if
    they are <code class="code"><span class="constructor">Some</span>&nbsp;v0</code> and <code class="code"><span class="constructor">Some</span>&nbsp;v1</code> and <code class="code">eq&nbsp;v0&nbsp;v1</code> is <code class="code"><span class="keyword">true</span></code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a option -&gt; 'a option -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;cmp&nbsp;o0&nbsp;o1</code> is a total order on options using <code class="code">cmp</code> to compare
    values wrapped by <code class="code"><span class="constructor">Some</span>&nbsp;_</code>. <code class="code"><span class="constructor">None</span></code> is smaller than <code class="code"><span class="constructor">Some</span>&nbsp;_</code> values.</p>
</div>
</div>
<h2 id="convert">Converting</h2>
<pre><span id="VALto_result"><span class="keyword">val</span> to_result</span> : <code class="type">none:'e -&gt; 'a option -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_result&nbsp;~none&nbsp;o</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and <code class="code"><span class="constructor">Error</span>&nbsp;none</code>
    otherwise.</p>
</div>
</div>

<pre><span id="VALto_list"><span class="keyword">val</span> to_list</span> : <code class="type">'a option -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_list&nbsp;o</code> is <code class="code">[]</code> if <code class="code">o</code> is <code class="code"><span class="constructor">None</span></code> and <code class="code">[v]</code> if <code class="code">o</code> is <code class="code"><span class="constructor">Some</span>&nbsp;v</code>.</p>
</div>
</div>

<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">'a option -&gt; 'a <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_seq&nbsp;o</code> is <code class="code">o</code> as a sequence. <code class="code"><span class="constructor">None</span></code> is the empty sequence and
    <code class="code"><span class="constructor">Some</span>&nbsp;v</code> is the singleton sequence containing <code class="code">v</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>