<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Bool</a></div><ul><li><a href="#bools">Booleans</a></li><li><a href="#preds">Predicates and comparisons</a></li><li><a href="#convert">Converting</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Bool.html">Stdlib.Bool</a></h1>

<pre><span id="MODULEBool"><span class="keyword">module</span> Bool</span>: <code class="type"><a href="Bool.html">Bool</a></code></pre><hr width="100%">
<h2 id="bools">Booleans</h2>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">bool</code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.false"><span class="constructor">false</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.true"><span class="constructor">true</span></span></code></td>

</tr></tbody></table>

<div class="info ">
<div class="info-desc">
<p>The type of booleans (truth values).</p>

<p>The constructors <code class="code"><span class="keyword">false</span></code> and <code class="code"><span class="keyword">true</span></code> are included here so that they have
    paths, but they are not intended to be used in user-defined data types.</p>
</div>
</div>


<pre><span id="VALnot"><span class="keyword">val</span> not</span> : <code class="type">bool -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">not&nbsp;b</code> is the boolean negation of <code class="code">b</code>.</p>
</div>
</div>

<pre><span id="VAL(&amp;&amp;)"><span class="keyword">val</span> (&amp;&amp;)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">e0&nbsp;<span class="keywordsign">&amp;&amp;</span>&nbsp;e1</code> is the lazy boolean conjunction of expressions <code class="code">e0</code> and <code class="code">e1</code>.
    If <code class="code">e0</code> evaluates to <code class="code"><span class="keyword">false</span></code>, <code class="code">e1</code> is not evaluated. Right-associative
    operator at precedence level 3/11.</p>
</div>
</div>

<pre><span id="VAL(||)"><span class="keyword">val</span> (||)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">e0&nbsp;<span class="keywordsign">||</span>&nbsp;e1</code> is the lazy boolean disjunction of expressions <code class="code">e0</code> and <code class="code">e1</code>.
    If <code class="code">e0</code> evaluates to <code class="code"><span class="keyword">true</span></code>, <code class="code">e1</code> is not evaluated. Right-associative
    operator at precedence level 2/11.</p>
</div>
</div>
<h2 id="preds">Predicates and comparisons</h2>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;b0&nbsp;b1</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">b0</code> and <code class="code">b1</code> are both either <code class="code"><span class="keyword">true</span></code>
    or <code class="code"><span class="keyword">false</span></code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">bool -&gt; bool -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;b0&nbsp;b1</code> is a total order on boolean values. <code class="code"><span class="keyword">false</span></code> is smaller
    than <code class="code"><span class="keyword">true</span></code>.</p>
</div>
</div>
<h2 id="convert">Converting</h2>
<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type">bool -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_int&nbsp;b</code> is <code class="code">0</code> if <code class="code">b</code> is <code class="code"><span class="keyword">false</span></code> and <code class="code">1</code> if <code class="code">b</code> is <code class="code"><span class="keyword">true</span></code>.</p>
</div>
</div>

<pre><span id="VALto_float"><span class="keyword">val</span> to_float</span> : <code class="type">bool -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_float&nbsp;b</code> is <code class="code">0.</code> if <code class="code">b</code> is <code class="code"><span class="keyword">false</span></code> and <code class="code">1.</code> if <code class="code">b</code> is <code class="code"><span class="keyword">true</span></code>.</p>
</div>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">bool -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_string&nbsp;b</code> is <code class="code"><span class="string">"true"</span></code> if <code class="code">b</code> is <code class="code"><span class="keyword">true</span></code> and <code class="code"><span class="string">"false"</span></code> if <code class="code">b</code> is
    <code class="code"><span class="keyword">false</span></code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>