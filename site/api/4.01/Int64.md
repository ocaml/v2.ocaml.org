<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Int64</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Int64.html">Int64</a></h1>

<pre><span class="keyword">module</span> Int64: <code class="code"><span class="keyword">sig</span></code> <a href="Int64.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
64-bit integers.
<p>

   This module provides operations on the type <code class="code">int64</code> of
   signed 64-bit integers.  Unlike the built-in <code class="code">int</code> type,
   the type <code class="code">int64</code> is guaranteed to be exactly 64-bit wide on all
   platforms.  All arithmetic operations over <code class="code">int64</code> are taken
   modulo 2<sup class="superscript">64</sup>
</p><p>

   Performance notice: values of type <code class="code">int64</code> occupy more memory
   space than values of type <code class="code">int</code>, and arithmetic operations on
   <code class="code">int64</code> are generally slower than those on <code class="code">int</code>.  Use <code class="code">int64</code>
   only when the application requires exact 64-bit arithmetic.<br>
</p></div>
<hr width="100%">

<pre><span id="VALzero"><span class="keyword">val</span> zero</span> : <code class="type">int64</code></pre><div class="info ">
The 64-bit integer 0.<br>
</div>

<pre><span id="VALone"><span class="keyword">val</span> one</span> : <code class="type">int64</code></pre><div class="info ">
The 64-bit integer 1.<br>
</div>

<pre><span id="VALminus_one"><span class="keyword">val</span> minus_one</span> : <code class="type">int64</code></pre><div class="info ">
The 64-bit integer -1.<br>
</div>

<pre><span id="VALneg"><span class="keyword">val</span> neg</span> : <code class="type">int64 -&gt; int64</code></pre><div class="info ">
Unary negation.<br>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Addition.<br>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Subtraction.<br>
</div>

<pre><span id="VALmul"><span class="keyword">val</span> mul</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Multiplication.<br>
</div>

<pre><span id="VALdiv"><span class="keyword">val</span> div</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Integer division.  Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if the second
   argument is zero.  This division rounds the real quotient of
   its arguments towards zero, as specified for <a href="Pervasives.html#VAL(/)"><code class="code">(/)</code></a>.<br>
</div>

<pre><span id="VALrem"><span class="keyword">val</span> rem</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Integer remainder.  If <code class="code">y</code> is not zero, the result
   of <code class="code"><span class="constructor">Int64</span>.rem x y</code> satisfies the following property:
   <code class="code">x = <span class="constructor">Int64</span>.add (<span class="constructor">Int64</span>.mul (<span class="constructor">Int64</span>.div x y) y) (<span class="constructor">Int64</span>.rem x y)</code>.
   If <code class="code">y = 0</code>, <code class="code"><span class="constructor">Int64</span>.rem x y</code> raises <code class="code"><span class="constructor">Division_by_zero</span></code>.<br>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">int64 -&gt; int64</code></pre><div class="info ">
Successor.  <code class="code"><span class="constructor">Int64</span>.succ x</code> is <code class="code"><span class="constructor">Int64</span>.add x <span class="constructor">Int64</span>.one</code>.<br>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">int64 -&gt; int64</code></pre><div class="info ">
Predecessor.  <code class="code"><span class="constructor">Int64</span>.pred x</code> is <code class="code"><span class="constructor">Int64</span>.sub x <span class="constructor">Int64</span>.one</code>.<br>
</div>

<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">int64 -&gt; int64</code></pre><div class="info ">
Return the absolute value of its argument.<br>
</div>

<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">int64</code></pre><div class="info ">
The greatest representable 64-bit integer, 2<sup class="superscript">63</sup> - 1.<br>
</div>

<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">int64</code></pre><div class="info ">
The smallest representable 64-bit integer, -2<sup class="superscript">63</sup>.<br>
</div>

<pre><span id="VALlogand"><span class="keyword">val</span> logand</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Bitwise logical and.<br>
</div>

<pre><span id="VALlogor"><span class="keyword">val</span> logor</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Bitwise logical or.<br>
</div>

<pre><span id="VALlogxor"><span class="keyword">val</span> logxor</span> : <code class="type">int64 -&gt; int64 -&gt; int64</code></pre><div class="info ">
Bitwise logical exclusive or.<br>
</div>

<pre><span id="VALlognot"><span class="keyword">val</span> lognot</span> : <code class="type">int64 -&gt; int64</code></pre><div class="info ">
Bitwise logical negation<br>
</div>

<pre><span id="VALshift_left"><span class="keyword">val</span> shift_left</span> : <code class="type">int64 -&gt; int -&gt; int64</code></pre><div class="info ">
<code class="code"><span class="constructor">Int64</span>.shift_left x y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
   The result is unspecified if <code class="code">y &lt; 0</code> or <code class="code">y &gt;= 64</code>.<br>
</div>

<pre><span id="VALshift_right"><span class="keyword">val</span> shift_right</span> : <code class="type">int64 -&gt; int -&gt; int64</code></pre><div class="info ">
<code class="code"><span class="constructor">Int64</span>.shift_right x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
   This is an arithmetic shift: the sign bit of <code class="code">x</code> is replicated
   and inserted in the vacated bits.
   The result is unspecified if <code class="code">y &lt; 0</code> or <code class="code">y &gt;= 64</code>.<br>
</div>

<pre><span id="VALshift_right_logical"><span class="keyword">val</span> shift_right_logical</span> : <code class="type">int64 -&gt; int -&gt; int64</code></pre><div class="info ">
<code class="code"><span class="constructor">Int64</span>.shift_right_logical x y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
   This is a logical shift: zeroes are inserted in the vacated bits
   regardless of the sign of <code class="code">x</code>.
   The result is unspecified if <code class="code">y &lt; 0</code> or <code class="code">y &gt;= 64</code>.<br>
</div>

<pre><span id="VALof_int"><span class="keyword">val</span> of_int</span> : <code class="type">int -&gt; int64</code></pre><div class="info ">
Convert the given integer (type <code class="code">int</code>) to a 64-bit integer
    (type <code class="code">int64</code>).<br>
</div>

<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type">int64 -&gt; int</code></pre><div class="info ">
Convert the given 64-bit integer (type <code class="code">int64</code>) to an
   integer (type <code class="code">int</code>).  On 64-bit platforms, the 64-bit integer
   is taken modulo 2<sup class="superscript">63</sup>, i.e. the high-order bit is lost
   during the conversion.  On 32-bit platforms, the 64-bit integer
   is taken modulo 2<sup class="superscript">31</sup>, i.e. the top 33 bits are lost
   during the conversion.<br>
</div>

<pre><span id="VALof_float"><span class="keyword">val</span> of_float</span> : <code class="type">float -&gt; int64</code></pre><div class="info ">
Convert the given floating-point number to a 64-bit integer,
   discarding the fractional part (truncate towards 0).
   The result of the conversion is undefined if, after truncation,
   the number is outside the range [<a href="Int64.html#VALmin_int"><code class="code"><span class="constructor">Int64</span>.min_int</code></a>, <a href="Int64.html#VALmax_int"><code class="code"><span class="constructor">Int64</span>.max_int</code></a>].<br>
</div>

<pre><span id="VALto_float"><span class="keyword">val</span> to_float</span> : <code class="type">int64 -&gt; float</code></pre><div class="info ">
Convert the given 64-bit integer to a floating-point number.<br>
</div>

<pre><span id="VALof_int32"><span class="keyword">val</span> of_int32</span> : <code class="type">int32 -&gt; int64</code></pre><div class="info ">
Convert the given 32-bit integer (type <code class="code">int32</code>)
   to a 64-bit integer (type <code class="code">int64</code>).<br>
</div>

<pre><span id="VALto_int32"><span class="keyword">val</span> to_int32</span> : <code class="type">int64 -&gt; int32</code></pre><div class="info ">
Convert the given 64-bit integer (type <code class="code">int64</code>) to a
   32-bit integer (type <code class="code">int32</code>). The 64-bit integer
   is taken modulo 2<sup class="superscript">32</sup>, i.e. the top 32 bits are lost
   during the conversion.<br>
</div>

<pre><span id="VALof_nativeint"><span class="keyword">val</span> of_nativeint</span> : <code class="type">nativeint -&gt; int64</code></pre><div class="info ">
Convert the given native integer (type <code class="code">nativeint</code>)
   to a 64-bit integer (type <code class="code">int64</code>).<br>
</div>

<pre><span id="VALto_nativeint"><span class="keyword">val</span> to_nativeint</span> : <code class="type">int64 -&gt; nativeint</code></pre><div class="info ">
Convert the given 64-bit integer (type <code class="code">int64</code>) to a
   native integer.  On 32-bit platforms, the 64-bit integer
   is taken modulo 2<sup class="superscript">32</sup>.  On 64-bit platforms,
   the conversion is exact.<br>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; int64</code></pre><div class="info ">
Convert the given string to a 64-bit integer.
   The string is read in decimal (by default) or in hexadecimal,
   octal or binary if the string begins with <code class="code">0x</code>, <code class="code">0o</code> or <code class="code">0b</code>
   respectively.
   Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"int_of_string"</span></code> if the given string is not
   a valid representation of an integer, or if the integer represented
   exceeds the range of integers representable in type <code class="code">int64</code>.<br>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">int64 -&gt; string</code></pre><div class="info ">
Return the string representation of its argument, in decimal.<br>
</div>

<pre><span id="VALbits_of_float"><span class="keyword">val</span> bits_of_float</span> : <code class="type">float -&gt; int64</code></pre><div class="info ">
Return the internal representation of the given float according
   to the IEEE 754 floating-point 'double format' bit layout.
   Bit 63 of the result represents the sign of the float;
   bits 62 to 52 represent the (biased) exponent; bits 51 to 0
   represent the mantissa.<br>
</div>

<pre><span id="VALfloat_of_bits"><span class="keyword">val</span> float_of_bits</span> : <code class="type">int64 -&gt; float</code></pre><div class="info ">
Return the floating-point number whose internal representation,
   according to the IEEE 754 floating-point 'double format' bit layout,
   is the given <code class="code">int64</code>.<br>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">int64</code> </pre>
<div class="info ">
An alias for the type of 64-bit integers.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Int64.html#TYPEt">t</a> -&gt; <a href="Int64.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The comparison function for 64-bit integers, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">Int64</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>