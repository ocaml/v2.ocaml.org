<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Uchar</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Uchar.html">Uchar</a></h1>

<pre><span class="keyword">module</span> Uchar: <code class="code"><span class="keyword">sig</span></code> <a href="Uchar.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Unicode characters.<br>
<b>Since</b> 4.03<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type for Unicode characters.
<p>

    A value of this type represents an Unicode
    <a href="http://unicode.org/glossary/#unicode_scalar_value">scalar
    value</a> which is an integer in the ranges <code class="code">0x0000</code>...<code class="code">0xD7FF</code> or
    <code class="code">0xE000</code>...<code class="code">0x10FFFF</code>.<br>
</p></div>


<pre><span id="VALmin"><span class="keyword">val</span> min</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">min</code> is U+0000.<br>
</div>

<pre><span id="VALmax"><span class="keyword">val</span> max</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">max</code> is U+10FFFF.<br>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">succ u</code> is the scalar value after <code class="code">u</code> in the set of Unicode scalar
    values.<br>
<b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> is <a href="Uchar.html#VALmax"><code class="code"><span class="constructor">Uchar</span>.max</code></a>.<br>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">pred u</code> is the scalar value before <code class="code">u</code> in the set of Unicode scalar
    values.<br>
<b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> is <a href="Uchar.html#VALmin"><code class="code"><span class="constructor">Uchar</span>.min</code></a>.<br>
</div>

<pre><span id="VALis_valid"><span class="keyword">val</span> is_valid</span> : <code class="type">int -&gt; bool</code></pre><div class="info ">
<code class="code">is_valid n</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">n</code> is an Unicode scalar value
    (i.e. in the ranges <code class="code">0x0000</code>...<code class="code">0xD7FF</code> or <code class="code">0xE000</code>...<code class="code">0x10FFFF</code>).<br>
</div>

<pre><span id="VALof_int"><span class="keyword">val</span> of_int</span> : <code class="type">int -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">of_int i</code> is <code class="code">i</code> as an Unicode character.<br>
<b>Raises</b> <code>Invalid_argument</code> if <code class="code">i</code> does not satisfy <a href="Uchar.html#VALis_valid"><code class="code"><span class="constructor">Uchar</span>.is_valid</code></a>.<br>
</div>

<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code">to_int u</code> is <code class="code">u</code> as an integer.<br>
</div>

<pre><span id="VALis_char"><span class="keyword">val</span> is_char</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">is_char u</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">u</code> is a latin1 OCaml character.<br>
</div>

<pre><span id="VALof_char"><span class="keyword">val</span> of_char</span> : <code class="type">char -&gt; <a href="Uchar.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">of_char c</code> is <code class="code">c</code> as an Unicode character.<br>
</div>

<pre><span id="VALto_char"><span class="keyword">val</span> to_char</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; char</code></pre><div class="info ">
<code class="code">to_char u</code> is <code class="code">u</code> as an OCaml latin1 character.<br>
<b>Raises</b> <code>Invalid_argument</code> if <code class="code">u</code> does not satisfy <a href="Uchar.html#VALis_char"><code class="code"><span class="constructor">Uchar</span>.is_char</code></a>.<br>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">equal u u'</code> is <code class="code">u = u'</code>.<br>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; <a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code">compare u u'</code> is <code class="code"><span class="constructor">Pervasives</span>.compare u u'</code>.<br>
</div>

<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type"><a href="Uchar.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code">hash u</code> associates a non-negative integer to <code class="code">u</code>.<br>
</div>

<pre><span id="VALdump"><span class="keyword">val</span> dump</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Uchar.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">dump ppf u</code> prints a representation of <code class="code">u</code> on <code class="code">ppf</code> using
    only US-ASCII encoded characters according to the Unicode
    <a href="http://www.unicode.org/versions/latest/appA.pdf">notational
    convention for code points</a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>