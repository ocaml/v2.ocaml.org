<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Nativeint</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Nativeint.html">Nativeint</a></h1>

<pre><span class="keyword">module</span> Nativeint: <code class="code"><span class="keyword">sig</span></code> <a href="Nativeint.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Processor-native integers.
<p>

   This module provides operations on the type <code class="code">nativeint</code> of
   signed 32-bit integers (on 32-bit platforms) or
   signed 64-bit integers (on 64-bit platforms).
   This integer type has exactly the same width as that of a
   pointer type in the C compiler.  All arithmetic operations over
   <code class="code">nativeint</code> are taken modulo 2<sup class="superscript">32</sup> or 2<sup class="superscript">64</sup> depending
   on the word size of the architecture.
</p><p>

   Performance notice: values of type <code class="code">nativeint</code> occupy more memory
   space than values of type <code class="code">int</code>, and arithmetic operations on
   <code class="code">nativeint</code> are generally slower than those on <code class="code">int</code>.  Use <code class="code">nativeint</code>
   only when the application requires the extra bit of precision
   over the <code class="code">int</code> type.<br>
</p></div>
<hr width="100%">

<pre><span id="VALzero"><span class="keyword">val</span> zero</span> : <code class="type">nativeint</code></pre><div class="info ">
The native integer 0.<br>
</div>

<pre><span id="VALone"><span class="keyword">val</span> one</span> : <code class="type">nativeint</code></pre><div class="info ">
The native integer 1.<br>
</div>

<pre><span id="VALminus_one"><span class="keyword">val</span> minus_one</span> : <code class="type">nativeint</code></pre><div class="info ">
The native integer -1.<br>
</div>

<pre><span id="VALneg"><span class="keyword">val</span> neg</span> : <code class="type">nativeint -&gt; nativeint</code></pre><div class="info ">
Unary negation.<br>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Addition.<br>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Subtraction.<br>
</div>

<pre><span id="VALmul"><span class="keyword">val</span> mul</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Multiplication.<br>
</div>

<pre><span id="VALdiv"><span class="keyword">val</span> div</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Integer division.  Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if the second
   argument is zero.  This division rounds the real quotient of
   its arguments towards zero, as specified for <a href="Pervasives.html#VAL(/)"><code class="code">(/)</code></a>.<br>
</div>

<pre><span id="VALrem"><span class="keyword">val</span> rem</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Integer remainder.  If <code class="code">y</code> is not zero, the result
   of <code class="code"><span class="constructor">Nativeint</span>.rem&nbsp;x&nbsp;y</code> satisfies the following properties:
   <code class="code"><span class="constructor">Nativeint</span>.zero&nbsp;&lt;=&nbsp;<span class="constructor">Nativeint</span>.rem&nbsp;x&nbsp;y&nbsp;&lt;&nbsp;<span class="constructor">Nativeint</span>.abs&nbsp;y</code> and
   <code class="code">x&nbsp;=&nbsp;<span class="constructor">Nativeint</span>.add&nbsp;(<span class="constructor">Nativeint</span>.mul&nbsp;(<span class="constructor">Nativeint</span>.div&nbsp;x&nbsp;y)&nbsp;y)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Nativeint</span>.rem&nbsp;x&nbsp;y)</code>.
   If <code class="code">y&nbsp;=&nbsp;0</code>, <code class="code"><span class="constructor">Nativeint</span>.rem&nbsp;x&nbsp;y</code> raises <code class="code"><span class="constructor">Division_by_zero</span></code>.<br>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">nativeint -&gt; nativeint</code></pre><div class="info ">
Successor.
   <code class="code"><span class="constructor">Nativeint</span>.succ&nbsp;x</code> is <code class="code"><span class="constructor">Nativeint</span>.add&nbsp;x&nbsp;<span class="constructor">Nativeint</span>.one</code>.<br>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">nativeint -&gt; nativeint</code></pre><div class="info ">
Predecessor.
   <code class="code"><span class="constructor">Nativeint</span>.pred&nbsp;x</code> is <code class="code"><span class="constructor">Nativeint</span>.sub&nbsp;x&nbsp;<span class="constructor">Nativeint</span>.one</code>.<br>
</div>

<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">nativeint -&gt; nativeint</code></pre><div class="info ">
Return the absolute value of its argument.<br>
</div>

<pre><span id="VALsize"><span class="keyword">val</span> size</span> : <code class="type">int</code></pre><div class="info ">
The size in bits of a native integer.  This is equal to <code class="code">32</code>
   on a 32-bit platform and to <code class="code">64</code> on a 64-bit platform.<br>
</div>

<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">nativeint</code></pre><div class="info ">
The greatest representable native integer,
   either 2<sup class="superscript">31</sup> - 1 on a 32-bit platform,
   or 2<sup class="superscript">63</sup> - 1 on a 64-bit platform.<br>
</div>

<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">nativeint</code></pre><div class="info ">
The smallest representable native integer,
   either -2<sup class="superscript">31</sup> on a 32-bit platform,
   or -2<sup class="superscript">63</sup> on a 64-bit platform.<br>
</div>

<pre><span id="VALlogand"><span class="keyword">val</span> logand</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Bitwise logical and.<br>
</div>

<pre><span id="VALlogor"><span class="keyword">val</span> logor</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Bitwise logical or.<br>
</div>

<pre><span id="VALlogxor"><span class="keyword">val</span> logxor</span> : <code class="type">nativeint -&gt; nativeint -&gt; nativeint</code></pre><div class="info ">
Bitwise logical exclusive or.<br>
</div>

<pre><span id="VALlognot"><span class="keyword">val</span> lognot</span> : <code class="type">nativeint -&gt; nativeint</code></pre><div class="info ">
Bitwise logical negation<br>
</div>

<pre><span id="VALshift_left"><span class="keyword">val</span> shift_left</span> : <code class="type">nativeint -&gt; int -&gt; nativeint</code></pre><div class="info ">
<code class="code"><span class="constructor">Nativeint</span>.shift_left&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the left by <code class="code">y</code> bits.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;bitsize</code>,
   where <code class="code">bitsize</code> is <code class="code">32</code> on a 32-bit platform and
   <code class="code">64</code> on a 64-bit platform.<br>
</div>

<pre><span id="VALshift_right"><span class="keyword">val</span> shift_right</span> : <code class="type">nativeint -&gt; int -&gt; nativeint</code></pre><div class="info ">
<code class="code"><span class="constructor">Nativeint</span>.shift_right&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the right by <code class="code">y</code> bits.
   This is an arithmetic shift: the sign bit of <code class="code">x</code> is replicated
   and inserted in the vacated bits.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;bitsize</code>.<br>
</div>

<pre><span id="VALshift_right_logical"><span class="keyword">val</span> shift_right_logical</span> : <code class="type">nativeint -&gt; int -&gt; nativeint</code></pre><div class="info ">
<code class="code"><span class="constructor">Nativeint</span>.shift_right_logical&nbsp;x&nbsp;y</code> shifts <code class="code">x</code> to the right
   by <code class="code">y</code> bits.
   This is a logical shift: zeroes are inserted in the vacated bits
   regardless of the sign of <code class="code">x</code>.
   The result is unspecified if <code class="code">y&nbsp;&lt;&nbsp;0</code> or <code class="code">y&nbsp;&gt;=&nbsp;bitsize</code>.<br>
</div>

<pre><span id="VALof_int"><span class="keyword">val</span> of_int</span> : <code class="type">int -&gt; nativeint</code></pre><div class="info ">
Convert the given integer (type <code class="code">int</code>) to a native integer
   (type <code class="code">nativeint</code>).<br>
</div>

<pre><span id="VALto_int"><span class="keyword">val</span> to_int</span> : <code class="type">nativeint -&gt; int</code></pre><div class="info ">
Convert the given native integer (type <code class="code">nativeint</code>) to an
   integer (type <code class="code">int</code>).  The high-order bit is lost during
   the conversion.<br>
</div>

<pre><span id="VALof_float"><span class="keyword">val</span> of_float</span> : <code class="type">float -&gt; nativeint</code></pre><div class="info ">
Convert the given floating-point number to a native integer,
   discarding the fractional part (truncate towards 0).
   The result of the conversion is undefined if, after truncation,
   the number is outside the range
   [<a href="Nativeint.html#VALmin_int"><code class="code"><span class="constructor">Nativeint</span>.min_int</code></a>, <a href="Nativeint.html#VALmax_int"><code class="code"><span class="constructor">Nativeint</span>.max_int</code></a>].<br>
</div>

<pre><span id="VALto_float"><span class="keyword">val</span> to_float</span> : <code class="type">nativeint -&gt; float</code></pre><div class="info ">
Convert the given native integer to a floating-point number.<br>
</div>

<pre><span id="VALof_int32"><span class="keyword">val</span> of_int32</span> : <code class="type">int32 -&gt; nativeint</code></pre><div class="info ">
Convert the given 32-bit integer (type <code class="code">int32</code>)
   to a native integer.<br>
</div>

<pre><span id="VALto_int32"><span class="keyword">val</span> to_int32</span> : <code class="type">nativeint -&gt; int32</code></pre><div class="info ">
Convert the given native integer to a
   32-bit integer (type <code class="code">int32</code>).  On 64-bit platforms,
   the 64-bit native integer is taken modulo 2<sup class="superscript">32</sup>,
   i.e. the top 32 bits are lost.  On 32-bit platforms,
   the conversion is exact.<br>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; nativeint</code></pre><div class="info ">
Convert the given string to a native integer.
   The string is read in decimal (by default) or in hexadecimal,
   octal or binary if the string begins with <code class="code">0x</code>, <code class="code">0o</code> or <code class="code">0b</code>
   respectively.
   Raise <code class="code"><span class="constructor">Failure</span>&nbsp;<span class="string">"int_of_string"</span></code> if the given string is not
   a valid representation of an integer, or if the integer represented
   exceeds the range of integers representable in type <code class="code">nativeint</code>.<br>
</div>

<pre><span id="VALof_string_opt"><span class="keyword">val</span> of_string_opt</span> : <code class="type">string -&gt; nativeint option</code></pre><div class="info ">
Same as <code class="code">of_string</code>, but return <code class="code"><span class="constructor">None</span></code> instead of raising.<br>
<b>Since</b> 4.05<br>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">nativeint -&gt; string</code></pre><div class="info ">
Return the string representation of its argument, in decimal.<br>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">nativeint</code> </pre>
<div class="info ">
An alias for the type of native integers.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Nativeint.html#TYPEt">t</a> -&gt; <a href="Nativeint.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The comparison function for native integers, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">Nativeint</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Nativeint.html#TYPEt">t</a> -&gt; <a href="Nativeint.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
The equal function for native ints.<br>
<b>Since</b> 4.03.0<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>