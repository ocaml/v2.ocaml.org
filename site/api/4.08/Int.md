<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Int</a></div><ul><li><a href="#ints">Integers</a></li><li><a href="#preds">Predicates and comparisons</a></li><li><a href="#convert">Converting</a></li></ul></nav></header>

<h1>Module <a href="type_Int.html">Int</a></h1>

<pre><span id="MODULEInt"><span class="keyword">module</span> Int</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Int.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Integer values.</p>

<p>Integers are <a href="Sys.html#VALint_size"><code class="code"><span class="constructor">Sys</span>.int_size</code></a> bits wide and use two's complement
    representation. All operations are taken modulo
    2<sup class="superscript"><code class="code"><span class="constructor">Sys</span>.int_size</code></sup>. They do not fail on overflow.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08</li>
</ul>
</div>
<hr width="100%">
<h2 id="ints">Integers</h2>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">int</code> </pre>
<div class="info ">
<div class="info-desc">
<p>The type for integer values.</p>
</div>
</div>


<pre><span id="VALzero"><span class="keyword">val</span> zero</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">zero</code> is the integer <code class="code">0</code>.</p>
</div>
</div>

<pre><span id="VALone"><span class="keyword">val</span> one</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">one</code> is the integer <code class="code">1</code>.</p>
</div>
</div>

<pre><span id="VALminus_one"><span class="keyword">val</span> minus_one</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">minus_one</code> is the integer <code class="code">-1</code>.</p>
</div>
</div>

<pre><span id="VALneg"><span class="keyword">val</span> neg</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">neg&nbsp;x</code> is <code class="code"><span class="keywordsign">~-</span>x</code>.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">add&nbsp;x&nbsp;y</code> is the addition <code class="code">x&nbsp;+&nbsp;y</code>.</p>
</div>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">sub&nbsp;x&nbsp;y</code> is the subtraction <code class="code">x&nbsp;-&nbsp;y</code>.</p>
</div>
</div>

<pre><span id="VALmul"><span class="keyword">val</span> mul</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mul&nbsp;x&nbsp;y</code> is the multiplication <code class="code">x&nbsp;*&nbsp;y</code>.</p>
</div>
</div>

<pre><span id="VALdiv"><span class="keyword">val</span> div</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">div&nbsp;x&nbsp;y</code> is the division <code class="code">x&nbsp;/&nbsp;y</code>. See <a href="Stdlib.html#VAL(/)"><code class="code">(/)</code></a> for details.</p>
</div>
</div>

<pre><span id="VALrem"><span class="keyword">val</span> rem</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">rem&nbsp;x&nbsp;y</code> is the remainder <code class="code">x&nbsp;<span class="keyword">mod</span>&nbsp;y</code>. See <a href="Stdlib.html#VAL(mod)"><code class="code">(<span class="keyword">mod</span>)</code></a> for details.</p>
</div>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">succ&nbsp;x</code> is <code class="code">add&nbsp;x&nbsp;1</code>.</p>
</div>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">pred&nbsp;x</code> is <code class="code">sub&nbsp;x&nbsp;1</code>.</p>
</div>
</div>

<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">abs&nbsp;x</code> is the absolute value of <code class="code">x</code>. That is <code class="code">x</code> if <code class="code">x</code> is positive
    and <code class="code">neg&nbsp;x</code> if <code class="code">x</code> is negative. <b>Warning.</b> This may be negative if
    the argument is <a href="Int.html#VALmin_int"><code class="code"><span class="constructor">Int</span>.min_int</code></a>.</p>
</div>
</div>

<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">max_int</code> is the greatest representable integer,
    <code class="code">2{^[<span class="constructor">Sys</span>.int_size&nbsp;-&nbsp;1]}&nbsp;-&nbsp;1</code>.</p>
</div>
</div>

<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">min_int</code> is the smallest representable integer,
    <code class="code">-2{^[<span class="constructor">Sys</span>.int_size&nbsp;-&nbsp;1]}</code>.</p>
</div>
</div>

<pre><span id="VALlogand"><span class="keyword">val</span> logand</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">logand&nbsp;x&nbsp;y</code> is the bitwise logical and of <code class="code">x</code> and <code class="code">y</code>.</p>
</div>
</div>

<pre><span id="VALlogor"><span class="keyword">val</span> logor</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">logor&nbsp;x&nbsp;y</code> is the bitwise logical or of <code class="code">x</code> and <code class="code">y</code>.</p>
</div>
</div>

<pre><span id="VALlogxor"><span class="keyword">val</span> logxor</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">logxor&nbsp;x&nbsp;y</code> is the bitwise logical exclusive or of <code class="code">x</code> and <code class="code">y</code>.</p>
</div>
</div>

<pre><span id="VALlognot"><span class="keyword">val</span> lognot</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">lognot&nbsp;x</code> is the bitwise logical negation of <code class="code">x</code>.</p>
</div>
</div>

<pre><span id="VALshift_left"><span class="keyword">val</span> shift_left</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">shift_left&nbsp;x&nbsp;n</code> shifts <code class="code">x</code> to the left by <code class="code">n</code> bits. The result
    is unspecified if <code class="code">n&nbsp;&lt;&nbsp;0</code> or <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALint_size"><code class="code"><span class="constructor">Sys</span>.int_size</code></a>.</p>
</div>
</div>

<pre><span id="VALshift_right"><span class="keyword">val</span> shift_right</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">shift_right&nbsp;x&nbsp;n</code> shifts <code class="code">x</code> to the right by <code class="code">n</code> bits. This is an
    arithmetic shift: the sign bit of <code class="code">x</code> is replicated and inserted
    in the vacated bits. The result is unspecified if <code class="code">n&nbsp;&lt;&nbsp;0</code> or
    <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALint_size"><code class="code"><span class="constructor">Sys</span>.int_size</code></a>.</p>
</div>
</div>

<pre><span id="VALshift_right_logical"><span class="keyword">val</span> shift_right_logical</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">shift_right&nbsp;x&nbsp;n</code> shifts <code class="code">x</code> to the right by <code class="code">n</code> bits. This is a
    logical shift: zeroes are inserted in the vacated bits regardless
    of the sign of <code class="code">x</code>. The result is unspecified if <code class="code">n&nbsp;&lt;&nbsp;0</code> or
    <code class="code">n&nbsp;&gt;&nbsp;</code><a href="Sys.html#VALint_size"><code class="code"><span class="constructor">Sys</span>.int_size</code></a>.</p>
</div>
</div>
<h2 id="preds">Predicates and comparisons</h2>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">int -&gt; int -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;x&nbsp;y</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">x&nbsp;=&nbsp;y</code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;x&nbsp;y</code> is <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a><code class="code">&nbsp;x&nbsp;y</code> but more efficient.</p>
</div>
</div>
<h2 id="convert">Converting</h2>
<pre><span id="VALto_float"><span class="keyword">val</span> to_float</span> : <code class="type">int -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_float&nbsp;x</code> is <code class="code">x</code> as a floating point number.</p>
</div>
</div>

<pre><span id="VALof_float"><span class="keyword">val</span> of_float</span> : <code class="type">float -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">of_float&nbsp;x</code> truncates <code class="code">x</code> to an integer. The result is
    unspecified if the argument is <code class="code">nan</code> or falls outside the range of
    representable integers.</p>
</div>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">int -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_string&nbsp;x</code> is the written representation of <code class="code">x</code> in decimal.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>