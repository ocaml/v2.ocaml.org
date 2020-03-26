<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Int32</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Int32.html">Int32</a></h1>

<pre><span id="MODULEInt32"><span class="keyword">module</span> Int32</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Int32.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>32-bit integers.</p>

<p>This module provides operations on the type <code class="code">int32</code>
   of signed 32-bit integers.  Unlike the built-in <code class="code">int</code> type,
   the type <code class="code">int32</code> is guaranteed to be exactly 32-bit wide on all
   platforms.  All arithmetic operations over <code class="code">int32</code> are taken
   modulo 2<sup class="superscript">32</sup>.</p>

<p>Performance notice: values of type <code class="code">int32</code> occupy more memory
   space than values of type <code class="code">int</code>, and arithmetic operations on
   <code class="code">int32</code> are generally slower than those on <code class="code">int</code>.  Use <code class="code">int32</code>
   only when the application requires exact 32-bit arithmetic.</p>

<p>Literals for 32-bit integers are suffixed by l:</p>
<pre class="codepre"><code class="code">      <span class="keyword">let</span> zero: int32 = 0l
      <span class="keyword">let</span> one: int32 = 1l
      <span class="keyword">let</span> m_one: int32 = -1l
    </code></pre></div>
</div>
<hr width="100%">

<pre><span id="VALzero"><span class="keyword">val</span> zero</span> : <code class="type">int32</code></pre><div class="info ">
<div class="info-desc">
<p>The 32-bit integer 0.</p>
</div>
</div>

<pre><span id="VALone"><span class="keyword">val</span> one</span> : <code class="type">int32</code></pre><div class="info ">
<div class="info-desc">
<p>The 32-bit integer 1.</p>
</div>
</div>

<pre><span id="VALminus_one"><span class="keyword">val</span> minus_one</span> : <code class="type">int32</code></pre><div class="info ">
<div class="info-desc">
<p>The 32-bit integer -1.</p>
</div>
</div>

<pre><span id="VALneg"><span class="keyword">val</span> neg</span> : <code class="type">int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Unary negation.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Addition.</p>
</div>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Subtraction.</p>
</div>
</div>

<pre><span id="VALmul"><span class="keyword">val</span> mul</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Multiplication.</p>
</div>
</div>

<pre><span id="VALdiv"><span class="keyword">val</span> div</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Integer division.  Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if the second
   argument is zero.  This division rounds the real quotient of
   its arguments towards zero, as specified for <a href="Stdlib.html#VAL(/)"><code class="code">(/)</code></a>.</p>
</div>
</div>

<pre><span id="VALunsigned_div"><span class="keyword">val</span> unsigned_div</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Int32.html#VALdiv"><code class="code"><span class="constructor">Int32</span>.div</code></a>, except that arguments and result are interpreted as <em>    unsigned</em> 32-bit integers.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALrem"><span class="keyword">val</span> rem</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Integer remainder.  If <code class="code">y</code> is not zero, the result
   of <code class="code"><span class="constructor">Int32</span>.rem&nbsp;x&nbsp;y</code> satisfies the following property:
   <code class="code">x&nbsp;=&nbsp;<span class="constructor">Int32</span>.add&nbsp;(<span class="constructor">Int32</span>.mul&nbsp;(<span class="constructor">Int32</span>.div&nbsp;x&nbsp;y)&nbsp;y)&nbsp;(<span class="constructor">Int32</span>.rem&nbsp;x&nbsp;y)</code>.
   If <code class="code">y&nbsp;=&nbsp;0</code>, <code class="code"><span class="constructor">Int32</span>.rem&nbsp;x&nbsp;y</code> raises <code class="code"><span class="constructor">Division_by_zero</span></code>.</p>
</div>
</div>

<pre><span id="VALunsigned_rem"><span class="keyword">val</span> unsigned_rem</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Int32.html#VALrem"><code class="code"><span class="constructor">Int32</span>.rem</code></a>, except that arguments and result are interpreted as <em>    unsigned</em> 32-bit integers.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Successor.  <code class="code"><span class="constructor">Int32</span>.succ&nbsp;x</code> is <code class="code"><span class="constructor">Int32</span>.add&nbsp;x&nbsp;<span class="constructor">Int32</span>.one</code>.</p>
</div>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Predecessor.  <code class="code"><span class="constructor">Int32</span>.pred&nbsp;x</code> is <code class="code"><span class="constructor">Int32</span>.sub&nbsp;x&nbsp;<span class="constructor">Int32</span>.one</code>.</p>
</div>
</div>

<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Return the absolute value of its argument.</p>
</div>
</div>

<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">int32</code></pre><div class="info ">
<div class="info-desc">
<p>The greatest representable 32-bit integer, 2<sup class="superscript">31</sup> - 1.</p>
</div>
</div>

<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">int32</code></pre><div class="info ">
<div class="info-desc">
<p>The smallest representable 32-bit integer, -2<sup class="superscript">31</sup>.</p>
</div>
</div>

<pre><span id="VALlogand"><span class="keyword">val</span> logand</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Bitwise logical and.</p>
</div>
</div>

<pre><span id="VALlogor"><span class="keyword">val</span> logor</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Bitwise logical or.</p>
</div>
</div>

<pre><span id="VALlogxor"><span class="keyword">val</span> logxor</span> : <code class="type">int32 -&gt; int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Bitwise logical exclusive or.</p>
</div>
</div>

<pre><span id="VALlognot"><span class="keyword">val</span> lognot</span> : <code class="type">int32 -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Bitwise logical negation.</p>
</div>
</div>

<pre><span id="VALshift_left"><span class="keyword">val</span> shift_left</span> : <code class="type">int32 -&gt; int -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Int32</span>.shift_left&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;32</code>.</p>
</div>
</div>

<pre><span id="VALshift_right"><span class="keyword">val</span> shift_right</span> : <code class="type">int32 -&gt; int -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Int32</span>.shift_right&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
   This is an arithmetic shift: the sign bit of <code class="code">x</code> is replicated
   and inserted in the vacated bits.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;32</code>.</p>
</div>
</div>

<pre><span id="VALshift_right_logical"><span class="keyword">val</span> shift_right_logical</span> : <code class="type">int32 -&gt; int -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Int32</span>.shift_right_logical&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
   This is a logical shift: zeroes are inserted in the vacated bits
   regardless of the sign of <code class="code">x</code>.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;32</code>.</p>
</div>
</div>

<pre><span id="VALof_int"><span class="keyword">val</span> of_int</span> : <code class="type">int -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Convert the given integer (type <code class="code">int</code>) to a 32-bit integer
    (type <code class="code">int32</code>). On 64-bit platforms, the argument is taken
    modulo 2<sup class="superscript">32</sup>.</p>
</div>
</div>

<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type">int32 -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Convert the given 32-bit integer (type <code class="code">int32</code>) to an
   integer (type <code class="code">int</code>).  On 32-bit platforms, the 32-bit integer
   is taken modulo 2<sup class="superscript">31</sup>, i.e. the high-order bit is lost
   during the conversion.  On 64-bit platforms, the conversion
   is exact.</p>
</div>
</div>

<pre><span id="VALunsigned_to_int"><span class="keyword">val</span> unsigned_to_int</span> : <code class="type">int32 -&gt; int option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Int32.html#VALto_int"><code class="code"><span class="constructor">Int32</span>.to_int</code></a>, but interprets the argument as an <em>unsigned</em> integer.
    Returns <code class="code"><span class="constructor">None</span></code> if the unsigned value of the argument cannot fit into an
    <code class="code">int</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALof_float"><span class="keyword">val</span> of_float</span> : <code class="type">float -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Convert the given floating-point number to a 32-bit integer,
   discarding the fractional part (truncate towards 0).
   The result of the conversion is undefined if, after truncation,
   the number is outside the range [<a href="Int32.html#VALmin_int"><code class="code"><span class="constructor">Int32</span>.min_int</code></a>, <a href="Int32.html#VALmax_int"><code class="code"><span class="constructor">Int32</span>.max_int</code></a>].</p>
</div>
</div>

<pre><span id="VALto_float"><span class="keyword">val</span> to_float</span> : <code class="type">int32 -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p>Convert the given 32-bit integer to a floating-point number.</p>
</div>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Convert the given string to a 32-bit integer.
   The string is read in decimal (by default, or if the string
   begins with <code class="code">0u</code>) or in hexadecimal, octal or binary if the
   string begins with <code class="code">0x</code>, <code class="code">0o</code> or <code class="code">0b</code> respectively.</p>

<p>The <code class="code">0u</code> prefix reads the input as an unsigned integer in the range
   <code class="code">[0,&nbsp;2*<span class="constructor">Int32</span>.max_int+1]</code>.  If the input exceeds <a href="Int32.html#VALmax_int"><code class="code"><span class="constructor">Int32</span>.max_int</code></a>
   it is converted to the signed integer
   <code class="code"><span class="constructor">Int32</span>.min_int&nbsp;+&nbsp;input&nbsp;-&nbsp;<span class="constructor">Int32</span>.max_int&nbsp;-&nbsp;1</code>.</p>

<p>The <code class="code">_</code> (underscore) character can appear anywhere in the string
   and is ignored.
   Raise <code class="code"><span class="constructor">Failure</span>&nbsp;<span class="string">"Int32.of_string"</span></code> if the given string is not
   a valid representation of an integer, or if the integer represented
   exceeds the range of integers representable in type <code class="code">int32</code>.</p>
</div>
</div>

<pre><span id="VALof_string_opt"><span class="keyword">val</span> of_string_opt</span> : <code class="type">string -&gt; int32 option</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <code class="code">of_string</code>, but return <code class="code"><span class="constructor">None</span></code> instead of raising.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">int32 -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Return the string representation of its argument, in signed decimal.</p>
</div>
</div>

<pre><span id="VALbits_of_float"><span class="keyword">val</span> bits_of_float</span> : <code class="type">float -&gt; int32</code></pre><div class="info ">
<div class="info-desc">
<p>Return the internal representation of the given float according
   to the IEEE 754 floating-point 'single format' bit layout.
   Bit 31 of the result represents the sign of the float;
   bits 30 to 23 represent the (biased) exponent; bits 22 to 0
   represent the mantissa.</p>
</div>
</div>

<pre><span id="VALfloat_of_bits"><span class="keyword">val</span> float_of_bits</span> : <code class="type">int32 -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p>Return the floating-point number whose internal representation,
   according to the IEEE 754 floating-point 'single format' bit layout,
   is the given <code class="code">int32</code>.</p>
</div>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">int32</code> </pre>
<div class="info ">
<div class="info-desc">
<p>An alias for the type of 32-bit integers.</p>
</div>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Int32.html#TYPEt">t</a> -&gt; <a href="Int32.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>The comparison function for 32-bit integers, with the same specification as
    <a href="Stdlib.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">Int32</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
</div>

<pre><span id="VALunsigned_compare"><span class="keyword">val</span> unsigned_compare</span> : <code class="type"><a href="Int32.html#TYPEt">t</a> -&gt; <a href="Int32.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Int32.html#VALcompare"><code class="code"><span class="constructor">Int32</span>.compare</code></a>, except that arguments are interpreted as <em>unsigned</em>
    32-bit integers.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.08.0</li>
</ul>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Int32.html#TYPEt">t</a> -&gt; <a href="Int32.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>The equal function for int32s.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.03.0</li>
</ul>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>