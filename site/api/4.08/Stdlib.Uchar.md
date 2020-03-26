<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Uchar</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Uchar.html">Stdlib.Uchar</a></h1>

<pre><span id="MODULEUchar"><span class="keyword">module</span> Uchar</span>: <code class="type"><a href="Uchar.html">Uchar</a></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type for Unicode characters.</p>

<p>A value of this type represents a Unicode
    <a href="http://unicode.org/glossary/#unicode_scalar_value">scalar
    value</a> which is an integer in the ranges <code class="code">0x0000</code>...<code class="code">0xD7FF</code> or
    <code class="code">0xE000</code>...<code class="code">0x10FFFF</code>.</p>
</div>
</div>


<pre><span id="VALmin"><span class="keyword">val</span> min</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">min</code> is U+0000.</p>
</div>
</div>

<pre><span id="VALmax"><span class="keyword">val</span> max</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">max</code> is U+10FFFF.</p>
</div>
</div>

<pre><span id="VALbom"><span class="keyword">val</span> bom</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">bom</code> is U+FEFF, the
    <a href="http://unicode.org/glossary/#byte_order_mark">byte order mark</a> (BOM)
    character.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALrep"><span class="keyword">val</span> rep</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">rep</code> is U+FFFD, the
    <a href="http://unicode.org/glossary/#replacement_character">replacement</a>
    character.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.06.0</li>
</ul>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">succ&nbsp;u</code> is the scalar value after <code class="code">u</code> in the set of Unicode scalar
    values.</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> is <a href="Uchar.html#VALmax"><code class="code"><span class="constructor">Uchar</span>.max</code></a>.</li>
</ul>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">pred&nbsp;u</code> is the scalar value before <code class="code">u</code> in the set of Unicode scalar
    values.</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> is <a href="Uchar.html#VALmin"><code class="code"><span class="constructor">Uchar</span>.min</code></a>.</li>
</ul>
</div>

<pre><span id="VALis_valid"><span class="keyword">val</span> is_valid</span> : <code class="type">int -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_valid&nbsp;n</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">n</code> is a Unicode scalar value
    (i.e. in the ranges <code class="code">0x0000</code>...<code class="code">0xD7FF</code> or <code class="code">0xE000</code>...<code class="code">0x10FFFF</code>).</p>
</div>
</div>

<pre><span id="VALof_int"><span class="keyword">val</span> of_int</span> : <code class="type">int -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">of_int&nbsp;i</code> is <code class="code">i</code> as a Unicode character.</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> if <code class="code">i</code> does not satisfy <a href="Uchar.html#VALis_valid"><code class="code"><span class="constructor">Uchar</span>.is_valid</code></a>.</li>
</ul>
</div>

<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_int&nbsp;u</code> is <code class="code">u</code> as an integer.</p>
</div>
</div>

<pre><span id="VALis_char"><span class="keyword">val</span> is_char</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_char&nbsp;u</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">u</code> is a latin1 OCaml character.</p>
</div>
</div>

<pre><span id="VALof_char"><span class="keyword">val</span> of_char</span> : <code class="type">char -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">of_char&nbsp;c</code> is <code class="code">c</code> as a Unicode character.</p>
</div>
</div>

<pre><span id="VALto_char"><span class="keyword">val</span> to_char</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; char</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_char&nbsp;u</code> is <code class="code">u</code> as an OCaml latin1 character.</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> does not satisfy <a href="Uchar.html#VALis_char"><code class="code"><span class="constructor">Uchar</span>.is_char</code></a>.</li>
</ul>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;u&nbsp;u'</code> is <code class="code">u&nbsp;=&nbsp;u'</code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;u&nbsp;u'</code> is <code class="code"><span class="constructor">Stdlib</span>.compare&nbsp;u&nbsp;u'</code>.</p>
</div>
</div>

<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">hash&nbsp;u</code> associates a non-negative integer to <code class="code">u</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>