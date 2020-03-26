<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pervasives</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pervasives.html">Pervasives</a></h1>

<pre><span class="keyword">module</span> Pervasives: <code class="code"><span class="keyword">sig</span></code> <a href="Pervasives.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
The initially opened module.
<p>

   This module provides the basic operations over the built-in types
   (numbers, booleans, strings, exceptions, references, lists, arrays,
   input-output channels, ...).
</p><p>

   This module is automatically opened at the beginning of each compilation.
   All components of this module can therefore be referred by their short
   name, without prefixing them by <code class="code"><span class="constructor">Pervasives</span></code>.<br>
</p></div>
<hr width="100%">
<br>
<h6 id="6_Exceptions">Exceptions</h6><br>

<pre><span id="VALraise"><span class="keyword">val</span> raise</span> : <code class="type">exn -&gt; 'a</code></pre><div class="info ">
Raise the given exception value<br>
</div>

<pre><span id="VALinvalid_arg"><span class="keyword">val</span> invalid_arg</span> : <code class="type">string -&gt; 'a</code></pre><div class="info ">
Raise exception <code class="code"><span class="constructor">Invalid_argument</span></code> with the given string.<br>
</div>

<pre><span id="VALfailwith"><span class="keyword">val</span> failwith</span> : <code class="type">string -&gt; 'a</code></pre><div class="info ">
Raise exception <code class="code"><span class="constructor">Failure</span></code> with the given string.<br>
</div>

<pre><span id="EXCEPTIONExit"><span class="keyword">exception</span> Exit</span></pre>
<div class="info ">
The <code class="code"><span class="constructor">Exit</span></code> exception is not raised by any library function.  It is
    provided for use in your programs.<br>
</div>
<br>
<h6 id="6_Comparisons">Comparisons</h6><br>

<pre><span id="VAL(=)"><span class="keyword">val</span> (=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
<code class="code">e1 = e2</code> tests for structural equality of <code class="code">e1</code> and <code class="code">e2</code>.
   Mutable structures (e.g. references and arrays) are equal
   if and only if their current contents are structurally equal,
   even if the two mutable objects are not the same physical object.
   Equality between functional values raises <code class="code"><span class="constructor">Invalid_argument</span></code>.
   Equality between cyclic data structures may not terminate.<br>
</div>

<pre><span id="VAL(<>)"><span class="keyword">val</span> (&lt;&gt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
Negation of <a href="Pervasives.html#VAL(=)"><code class="code">(=)</code></a>.<br>
</div>

<pre><span id="VAL(<)"><span class="keyword">val</span> (&lt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.<br>
</div>

<pre><span id="VAL(>)"><span class="keyword">val</span> (&gt;)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.<br>
</div>

<pre><span id="VAL(<=)"><span class="keyword">val</span> (&lt;=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
See <a href="Pervasives.html#VAL(>=)"><code class="code">(&gt;=)</code></a>.<br>
</div>

<pre><span id="VAL(>=)"><span class="keyword">val</span> (&gt;=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
Structural ordering functions. These functions coincide with
   the usual orderings over integers, characters, strings
   and floating-point numbers, and extend them to a
   total ordering over all types.
   The ordering is compatible with <code class="code">( = )</code>. As in the case
   of <code class="code">( = )</code>, mutable structures are compared by contents.
   Comparison between functional values raises <code class="code"><span class="constructor">Invalid_argument</span></code>.
   Comparison between cyclic structures may not terminate.<br>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">'a -&gt; 'a -&gt; int</code></pre><div class="info ">
<code class="code">compare x y</code> returns <code class="code">0</code> if <code class="code">x</code> is equal to <code class="code">y</code>,
   a negative integer if <code class="code">x</code> is less than <code class="code">y</code>, and a positive integer
   if <code class="code">x</code> is greater than <code class="code">y</code>.  The ordering implemented by <code class="code">compare</code>
   is compatible with the comparison predicates <code class="code">=</code>, <code class="code">&lt;</code> and <code class="code">&gt;</code>
   defined above,  with one difference on the treatment of the float value
   <a href="Pervasives.html#VALnan"><code class="code">nan</code></a>.  Namely, the comparison predicates treat <code class="code">nan</code>
   as different from any other float value, including itself;
   while <code class="code">compare</code> treats <code class="code">nan</code> as equal to itself and less than any
   other float value.  This treatment of <code class="code">nan</code> ensures that <code class="code">compare</code>
   defines a total ordering relation.
<p>

   <code class="code">compare</code> applied to functional values may raise <code class="code"><span class="constructor">Invalid_argument</span></code>.
   <code class="code">compare</code> applied to cyclic structures may not terminate.
</p><p>

   The <code class="code">compare</code> function can be used as the comparison function
   required by the <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a> functors, as well as
   the <a href="List.html#VALsort"><code class="code"><span class="constructor">List</span>.sort</code></a> and <a href="Array.html#VALsort"><code class="code"><span class="constructor">Array</span>.sort</code></a> functions.<br>
</p></div>

<pre><span id="VALmin"><span class="keyword">val</span> min</span> : <code class="type">'a -&gt; 'a -&gt; 'a</code></pre><div class="info ">
Return the smaller of the two arguments.
    The result is unspecified if one of the arguments contains
    the float value <code class="code">nan</code>.<br>
</div>

<pre><span id="VALmax"><span class="keyword">val</span> max</span> : <code class="type">'a -&gt; 'a -&gt; 'a</code></pre><div class="info ">
Return the greater of the two arguments.
    The result is unspecified if one of the arguments contains
    the float value <code class="code">nan</code>.<br>
</div>

<pre><span id="VAL(==)"><span class="keyword">val</span> (==)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
<code class="code">e1 == e2</code> tests for physical equality of <code class="code">e1</code> and <code class="code">e2</code>.
   On mutable types such as references, arrays, strings, records with
   mutable fields and objects with mutable instance variables,
   <code class="code">e1 == e2</code> is true if and only if physical modification of <code class="code">e1</code>
   also affects <code class="code">e2</code>.
   On non-mutable types, the behavior of <code class="code">( == )</code> is
   implementation-dependent; however, it is guaranteed that
   <code class="code">e1 == e2</code> implies <code class="code">compare e1 e2 = 0</code>.<br>
</div>

<pre><span id="VAL(!=)"><span class="keyword">val</span> (!=)</span> : <code class="type">'a -&gt; 'a -&gt; bool</code></pre><div class="info ">
Negation of <a href="Pervasives.html#VAL(==)"><code class="code">(==)</code></a>.<br>
</div>
<br>
<h6 id="6_Booleanoperations">Boolean operations</h6><br>

<pre><span id="VALnot"><span class="keyword">val</span> not</span> : <code class="type">bool -&gt; bool</code></pre><div class="info ">
The boolean negation.<br>
</div>

<pre><span id="VAL(&amp;&amp;)"><span class="keyword">val</span> (&amp;&amp;)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
The boolean 'and'. Evaluation is sequential, left-to-right:
   in <code class="code">e1 <span class="keywordsign">&amp;&amp;</span> e2</code>, <code class="code">e1</code> is evaluated first, and if it returns <code class="code"><span class="keyword">false</span></code>,
   <code class="code">e2</code> is not evaluated at all.<br>
</div>

<pre><span id="VAL(&amp;)"><span class="keyword">val</span> (&amp;)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
<span class="warning">Deprecated.</span><a href="Pervasives.html#VAL(&amp;&amp;)"><code class="code">(<span class="keywordsign">&amp;&amp;</span>)</code></a> should be used instead.<br>
</div>

<pre><span id="VAL(||)"><span class="keyword">val</span> (||)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
The boolean 'or'. Evaluation is sequential, left-to-right:
   in <code class="code">e1 <span class="keywordsign">||</span> e2</code>, <code class="code">e1</code> is evaluated first, and if it returns <code class="code"><span class="keyword">true</span></code>,
   <code class="code">e2</code> is not evaluated at all.<br>
</div>

<pre><span id="VAL(or)"><span class="keyword">val</span> (or)</span> : <code class="type">bool -&gt; bool -&gt; bool</code></pre><div class="info ">
<span class="warning">Deprecated.</span><a href="Pervasives.html#VAL(||)"><code class="code">(<span class="keywordsign">||</span>)</code></a> should be used instead.<br>
</div>
<br>
<h6 id="6_Compositionoperators">Composition operators</h6><br>

<pre><span id="VAL(|>)"><span class="keyword">val</span> (|&gt;)</span> : <code class="type">'a -&gt; ('a -&gt; 'b) -&gt; 'b</code></pre><div class="info ">
Reverse-application operator: <code class="code">x |&gt; f |&gt; g</code> is exactly equivalent
 to <code class="code">g (f (x))</code>.<br>
<b>Since</b> 4.01<br>
</div>

<pre><span id="VAL(@@)"><span class="keyword">val</span> (@@)</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
Application operator: <code class="code">g @@ f @@ x</code> is exactly equivalent to
 <code class="code">g (f (x))</code>.<br>
<b>Since</b> 4.01<br>
</div>
<br>
<h6 id="6_Integerarithmetic">Integer arithmetic</h6><br>
<br>
Integers are 31 bits wide (or 63 bits on 64-bit processors).
   All operations are taken modulo 2<sup class="superscript">31</sup> (or 2<sup class="superscript">63</sup>).
   They do not fail on overflow.<br>

<pre><span id="VAL(~-)"><span class="keyword">val</span> (~-)</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
Unary negation. You can also write <code class="code">- e</code> instead of <code class="code"><span class="keywordsign">~-</span> e</code>.<br>
</div>

<pre><span id="VAL(~+)"><span class="keyword">val</span> (~+)</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
Unary addition. You can also write <code class="code">+ e</code> instead of <code class="code"><span class="keywordsign">~+</span> e</code>.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALsucc"><span class="keyword">val</span> succ</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<code class="code">succ x</code> is <code class="code">x + 1</code>.<br>
</div>

<pre><span id="VALpred"><span class="keyword">val</span> pred</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<code class="code">pred x</code> is <code class="code">x - 1</code>.<br>
</div>

<pre><span id="VAL(+)"><span class="keyword">val</span> (+)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Integer addition.<br>
</div>

<pre><span id="VAL(-)"><span class="keyword">val</span> (-)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Integer subtraction.<br>
</div>

<pre><span id="VAL( * )"><span class="keyword">val</span> ( * )</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Integer multiplication.<br>
</div>

<pre><span id="VAL(/)"><span class="keyword">val</span> (/)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Integer division.
   Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if the second argument is 0.
   Integer division rounds the real quotient of its arguments towards zero.
   More precisely, if <code class="code">x &gt;= 0</code> and <code class="code">y &gt; 0</code>, <code class="code">x / y</code> is the greatest integer
   less than or equal to the real quotient of <code class="code">x</code> by <code class="code">y</code>.  Moreover,
   <code class="code">(- x) / y = x / (- y) = - (x / y)</code>.<br>
</div>

<pre><span id="VAL(mod)"><span class="keyword">val</span> (mod)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Integer remainder.  If <code class="code">y</code> is not zero, the result
   of <code class="code">x <span class="keyword">mod</span> y</code> satisfies the following properties:
   <code class="code">x = (x / y) * y + x <span class="keyword">mod</span> y</code> and
   <code class="code">abs(x <span class="keyword">mod</span> y) &lt;= abs(y) - 1</code>.
   If <code class="code">y = 0</code>, <code class="code">x <span class="keyword">mod</span> y</code> raises <code class="code"><span class="constructor">Division_by_zero</span></code>.
   Note that <code class="code">x <span class="keyword">mod</span> y</code> is negative only if <code class="code">x &lt; 0</code>.
   Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if <code class="code">y</code> is zero.<br>
</div>

<pre><span id="VALabs"><span class="keyword">val</span> abs</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
Return the absolute value of the argument.  Note that this may be
  negative if the argument is <code class="code">min_int</code>.<br>
</div>

<pre><span id="VALmax_int"><span class="keyword">val</span> max_int</span> : <code class="type">int</code></pre><div class="info ">
The greatest representable integer.<br>
</div>

<pre><span id="VALmin_int"><span class="keyword">val</span> min_int</span> : <code class="type">int</code></pre><div class="info ">
The smallest representable integer.<br>
</div>
<br>
<div class="h7" id="7_Bitwiseoperations">Bitwise operations</div><br>

<pre><span id="VAL(land)"><span class="keyword">val</span> (land)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Bitwise logical and.<br>
</div>

<pre><span id="VAL(lor)"><span class="keyword">val</span> (lor)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Bitwise logical or.<br>
</div>

<pre><span id="VAL(lxor)"><span class="keyword">val</span> (lxor)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
Bitwise logical exclusive or.<br>
</div>

<pre><span id="VALlnot"><span class="keyword">val</span> lnot</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
Bitwise logical negation.<br>
</div>

<pre><span id="VAL(lsl)"><span class="keyword">val</span> (lsl)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<code class="code">n <span class="keyword">lsl</span> m</code> shifts <code class="code">n</code> to the left by <code class="code">m</code> bits.
   The result is unspecified if <code class="code">m &lt; 0</code> or <code class="code">m &gt;= bitsize</code>,
   where <code class="code">bitsize</code> is <code class="code">32</code> on a 32-bit platform and
   <code class="code">64</code> on a 64-bit platform.<br>
</div>

<pre><span id="VAL(lsr)"><span class="keyword">val</span> (lsr)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<code class="code">n <span class="keyword">lsr</span> m</code> shifts <code class="code">n</code> to the right by <code class="code">m</code> bits.
   This is a logical shift: zeroes are inserted regardless of
   the sign of <code class="code">n</code>.
   The result is unspecified if <code class="code">m &lt; 0</code> or <code class="code">m &gt;= bitsize</code>.<br>
</div>

<pre><span id="VAL(asr)"><span class="keyword">val</span> (asr)</span> : <code class="type">int -&gt; int -&gt; int</code></pre><div class="info ">
<code class="code">n <span class="keyword">asr</span> m</code> shifts <code class="code">n</code> to the right by <code class="code">m</code> bits.
   This is an arithmetic shift: the sign bit of <code class="code">n</code> is replicated.
   The result is unspecified if <code class="code">m &lt; 0</code> or <code class="code">m &gt;= bitsize</code>.<br>
</div>
<br>
<h6 id="6_Floatingpointarithmetic">Floating-point arithmetic</h6>
<p>

   OCaml's floating-point numbers follow the
   IEEE 754 standard, using double precision (64 bits) numbers.
   Floating-point operations never raise an exception on overflow,
   underflow, division by zero, etc.  Instead, special IEEE numbers
   are returned as appropriate, such as <code class="code">infinity</code> for <code class="code">1.0 /. 0.0</code>,
   <code class="code">neg_infinity</code> for <code class="code">-1.0 /. 0.0</code>, and <code class="code">nan</code> ('not a number')
   for <code class="code">0.0 /. 0.0</code>.  These special numbers then propagate through
   floating-point computations as expected: for instance,
   <code class="code">1.0 /. infinity</code> is <code class="code">0.0</code>, and any arithmetic operation with <code class="code">nan</code>
   as argument returns <code class="code">nan</code> as result.<br>

</p><pre><span id="VAL(~-.)"><span class="keyword">val</span> (~-.)</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Unary negation. You can also write <code class="code">-. e</code> instead of <code class="code"><span class="keywordsign">~-.</span> e</code>.<br>
</div>

<pre><span id="VAL(~+.)"><span class="keyword">val</span> (~+.)</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Unary addition. You can also write <code class="code">+. e</code> instead of <code class="code"><span class="keywordsign">~+.</span> e</code>.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VAL(+.)"><span class="keyword">val</span> (+.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
Floating-point addition<br>
</div>

<pre><span id="VAL(-.)"><span class="keyword">val</span> (-.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
Floating-point subtraction<br>
</div>

<pre><span id="VAL( *. )"><span class="keyword">val</span> ( *. )</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
Floating-point multiplication<br>
</div>

<pre><span id="VAL(/.)"><span class="keyword">val</span> (/.)</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
Floating-point division.<br>
</div>

<pre><span id="VAL( ** )"><span class="keyword">val</span> ( ** )</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
Exponentiation.<br>
</div>

<pre><span id="VALsqrt"><span class="keyword">val</span> sqrt</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Square root.<br>
</div>

<pre><span id="VALexp"><span class="keyword">val</span> exp</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Exponential.<br>
</div>

<pre><span id="VALlog"><span class="keyword">val</span> log</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Natural logarithm.<br>
</div>

<pre><span id="VALlog10"><span class="keyword">val</span> log10</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Base 10 logarithm.<br>
</div>

<pre><span id="VALexpm1"><span class="keyword">val</span> expm1</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
<code class="code">expm1 x</code> computes <code class="code">exp x -. 1.0</code>, giving numerically-accurate results
    even if <code class="code">x</code> is close to <code class="code">0.0</code>.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALlog1p"><span class="keyword">val</span> log1p</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
<code class="code">log1p x</code> computes <code class="code">log(1.0 +. x)</code> (natural logarithm),
    giving numerically-accurate results even if <code class="code">x</code> is close to <code class="code">0.0</code>.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALcos"><span class="keyword">val</span> cos</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Cosine.  Argument is in radians.<br>
</div>

<pre><span id="VALsin"><span class="keyword">val</span> sin</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Sine.  Argument is in radians.<br>
</div>

<pre><span id="VALtan"><span class="keyword">val</span> tan</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Tangent.  Argument is in radians.<br>
</div>

<pre><span id="VALacos"><span class="keyword">val</span> acos</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Arc cosine.  The argument must fall within the range <code class="code">[-1.0, 1.0]</code>.
    Result is in radians and is between <code class="code">0.0</code> and <code class="code">pi</code>.<br>
</div>

<pre><span id="VALasin"><span class="keyword">val</span> asin</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Arc sine.  The argument must fall within the range <code class="code">[-1.0, 1.0]</code>.
    Result is in radians and is between <code class="code">-pi/2</code> and <code class="code">pi/2</code>.<br>
</div>

<pre><span id="VALatan"><span class="keyword">val</span> atan</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Arc tangent.
    Result is in radians and is between <code class="code">-pi/2</code> and <code class="code">pi/2</code>.<br>
</div>

<pre><span id="VALatan2"><span class="keyword">val</span> atan2</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
<code class="code">atan2 y x</code> returns the arc tangent of <code class="code">y /. x</code>.  The signs of <code class="code">x</code>
    and <code class="code">y</code> are used to determine the quadrant of the result.
    Result is in radians and is between <code class="code">-pi</code> and <code class="code">pi</code>.<br>
</div>

<pre><span id="VALhypot"><span class="keyword">val</span> hypot</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
<code class="code">hypot x y</code> returns <code class="code">sqrt(x *. x + y *. y)</code>, that is, the length
  of the hypotenuse of a right-angled triangle with sides of length
  <code class="code">x</code> and <code class="code">y</code>, or, equivalently, the distance of the point <code class="code">(x,y)</code>
  to origin.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALcosh"><span class="keyword">val</span> cosh</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Hyperbolic cosine.  Argument is in radians.<br>
</div>

<pre><span id="VALsinh"><span class="keyword">val</span> sinh</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Hyperbolic sine.  Argument is in radians.<br>
</div>

<pre><span id="VALtanh"><span class="keyword">val</span> tanh</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Hyperbolic tangent.  Argument is in radians.<br>
</div>

<pre><span id="VALceil"><span class="keyword">val</span> ceil</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Round above to an integer value.
    <code class="code">ceil f</code> returns the least integer value greater than or equal to <code class="code">f</code>.
    The result is returned as a float.<br>
</div>

<pre><span id="VALfloor"><span class="keyword">val</span> floor</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
Round below to an integer value.
    <code class="code">floor f</code> returns the greatest integer value less than or
    equal to <code class="code">f</code>.
    The result is returned as a float.<br>
</div>

<pre><span id="VALabs_float"><span class="keyword">val</span> abs_float</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
<code class="code">abs_float f</code> returns the absolute value of <code class="code">f</code>.<br>
</div>

<pre><span id="VALcopysign"><span class="keyword">val</span> copysign</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
<code class="code">copysign x y</code> returns a float whose absolute value is that of <code class="code">x</code>
  and whose sign is that of <code class="code">y</code>.  If <code class="code">x</code> is <code class="code">nan</code>, returns <code class="code">nan</code>.
  If <code class="code">y</code> is <code class="code">nan</code>, returns either <code class="code">x</code> or <code class="code">-. x</code>, but it is not
  specified which.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALmod_float"><span class="keyword">val</span> mod_float</span> : <code class="type">float -&gt; float -&gt; float</code></pre><div class="info ">
<code class="code">mod_float a b</code> returns the remainder of <code class="code">a</code> with respect to
   <code class="code">b</code>.  The returned value is <code class="code">a -. n *. b</code>, where <code class="code">n</code>
   is the quotient <code class="code">a /. b</code> rounded towards zero to an integer.<br>
</div>

<pre><span id="VALfrexp"><span class="keyword">val</span> frexp</span> : <code class="type">float -&gt; float * int</code></pre><div class="info ">
<code class="code">frexp f</code> returns the pair of the significant
   and the exponent of <code class="code">f</code>.  When <code class="code">f</code> is zero, the
   significant <code class="code">x</code> and the exponent <code class="code">n</code> of <code class="code">f</code> are equal to
   zero.  When <code class="code">f</code> is non-zero, they are defined by
   <code class="code">f = x *. 2 ** n</code> and <code class="code">0.5 &lt;= x &lt; 1.0</code>.<br>
</div>

<pre><span id="VALldexp"><span class="keyword">val</span> ldexp</span> : <code class="type">float -&gt; int -&gt; float</code></pre><div class="info ">
<code class="code">ldexp x n</code> returns <code class="code">x *. 2 ** n</code>.<br>
</div>

<pre><span id="VALmodf"><span class="keyword">val</span> modf</span> : <code class="type">float -&gt; float * float</code></pre><div class="info ">
<code class="code">modf f</code> returns the pair of the fractional and integral
   part of <code class="code">f</code>.<br>
</div>

<pre><span id="VALfloat"><span class="keyword">val</span> float</span> : <code class="type">int -&gt; float</code></pre><div class="info ">
Same as <a href="Pervasives.html#VALfloat_of_int"><code class="code">float_of_int</code></a>.<br>
</div>

<pre><span id="VALfloat_of_int"><span class="keyword">val</span> float_of_int</span> : <code class="type">int -&gt; float</code></pre><div class="info ">
Convert an integer to floating-point.<br>
</div>

<pre><span id="VALtruncate"><span class="keyword">val</span> truncate</span> : <code class="type">float -&gt; int</code></pre><div class="info ">
Same as <a href="Pervasives.html#VALint_of_float"><code class="code">int_of_float</code></a>.<br>
</div>

<pre><span id="VALint_of_float"><span class="keyword">val</span> int_of_float</span> : <code class="type">float -&gt; int</code></pre><div class="info ">
Truncate the given floating-point number to an integer.
   The result is unspecified if the argument is <code class="code">nan</code> or falls outside the
   range of representable integers.<br>
</div>

<pre><span id="VALinfinity"><span class="keyword">val</span> infinity</span> : <code class="type">float</code></pre><div class="info ">
Positive infinity.<br>
</div>

<pre><span id="VALneg_infinity"><span class="keyword">val</span> neg_infinity</span> : <code class="type">float</code></pre><div class="info ">
Negative infinity.<br>
</div>

<pre><span id="VALnan"><span class="keyword">val</span> nan</span> : <code class="type">float</code></pre><div class="info ">
A special floating-point value denoting the result of an
   undefined operation such as <code class="code">0.0 /. 0.0</code>.  Stands for
   'not a number'.  Any floating-point operation with <code class="code">nan</code> as
   argument returns <code class="code">nan</code> as result.  As for floating-point comparisons,
   <code class="code">=</code>, <code class="code">&lt;</code>, <code class="code">&lt;=</code>, <code class="code">&gt;</code> and <code class="code">&gt;=</code> return <code class="code"><span class="keyword">false</span></code> and <code class="code">&lt;&gt;</code> returns <code class="code"><span class="keyword">true</span></code>
   if one or both of their arguments is <code class="code">nan</code>.<br>
</div>

<pre><span id="VALmax_float"><span class="keyword">val</span> max_float</span> : <code class="type">float</code></pre><div class="info ">
The largest positive finite value of type <code class="code">float</code>.<br>
</div>

<pre><span id="VALmin_float"><span class="keyword">val</span> min_float</span> : <code class="type">float</code></pre><div class="info ">
The smallest positive, non-zero, non-denormalized value of type <code class="code">float</code>.<br>
</div>

<pre><span id="VALepsilon_float"><span class="keyword">val</span> epsilon_float</span> : <code class="type">float</code></pre><div class="info ">
The difference between <code class="code">1.0</code> and the smallest exactly representable
    floating-point number greater than <code class="code">1.0</code>.<br>
</div>

<pre><code><span id="TYPEfpclass"><span class="keyword">type</span> <code class="type"></code>fpclass</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_normal"><span class="constructor">FP_normal</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Normal number, none of the below</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_subnormal"><span class="constructor">FP_subnormal</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number very close to 0.0, has reduced precision</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_zero"><span class="constructor">FP_zero</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number is 0.0 or -0.0</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_infinite"><span class="constructor">FP_infinite</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number is positive or negative infinity</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfpclass.FP_nan"><span class="constructor">FP_nan</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Not a number: result of an undefined operation</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info ">
The five classes of floating-point numbers, as determined by
   the <a href="Pervasives.html#VALclassify_float"><code class="code">classify_float</code></a> function.<br>
</div>


<pre><span id="VALclassify_float"><span class="keyword">val</span> classify_float</span> : <code class="type">float -&gt; <a href="Pervasives.html#TYPEfpclass">fpclass</a></code></pre><div class="info ">
Return the class of the given floating-point number:
   normal, subnormal, zero, infinite, or not a number.<br>
</div>
<br>
<h6 id="6_Stringoperations">String operations</h6>
<p>

   More string operations are provided in module <a href="String.html"><code class="code"><span class="constructor">String</span></code></a>.<br>

</p><pre><span id="VAL(^)"><span class="keyword">val</span> (^)</span> : <code class="type">string -&gt; string -&gt; string</code></pre><div class="info ">
String concatenation.<br>
</div>
<br>
<h6 id="6_Characteroperations">Character operations</h6>
<p>

   More character operations are provided in module <a href="Char.html"><code class="code"><span class="constructor">Char</span></code></a>.<br>

</p><pre><span id="VALint_of_char"><span class="keyword">val</span> int_of_char</span> : <code class="type">char -&gt; int</code></pre><div class="info ">
Return the ASCII code of the argument.<br>
</div>

<pre><span id="VALchar_of_int"><span class="keyword">val</span> char_of_int</span> : <code class="type">int -&gt; char</code></pre><div class="info ">
Return the character with the given ASCII code.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"char_of_int"</span></code> if the argument is
   outside the range 0--255.<br>
</div>
<br>
<h6 id="6_Unitoperations">Unit operations</h6><br>

<pre><span id="VALignore"><span class="keyword">val</span> ignore</span> : <code class="type">'a -&gt; unit</code></pre><div class="info ">
Discard the value of its argument and return <code class="code">()</code>.
   For instance, <code class="code">ignore(f x)</code> discards the result of
   the side-effecting function <code class="code">f</code>.  It is equivalent to
   <code class="code">f x; ()</code>, except that the latter may generate a
   compiler warning; writing <code class="code">ignore(f x)</code> instead
   avoids the warning.<br>
</div>
<br>
<h6 id="6_Stringconversionfunctions">String conversion functions</h6><br>

<pre><span id="VALstring_of_bool"><span class="keyword">val</span> string_of_bool</span> : <code class="type">bool -&gt; string</code></pre><div class="info ">
Return the string representation of a boolean. As the returned values
   may be shared, the user should not modify them directly.<br>
</div>

<pre><span id="VALbool_of_string"><span class="keyword">val</span> bool_of_string</span> : <code class="type">string -&gt; bool</code></pre><div class="info ">
Convert the given string to a boolean.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"bool_of_string"</span></code> if the string is not
   <code class="code"><span class="string">"true"</span></code> or <code class="code"><span class="string">"false"</span></code>.<br>
</div>

<pre><span id="VALstring_of_int"><span class="keyword">val</span> string_of_int</span> : <code class="type">int -&gt; string</code></pre><div class="info ">
Return the string representation of an integer, in decimal.<br>
</div>

<pre><span id="VALint_of_string"><span class="keyword">val</span> int_of_string</span> : <code class="type">string -&gt; int</code></pre><div class="info ">
Convert the given string to an integer.
   The string is read in decimal (by default) or in hexadecimal (if it
   begins with <code class="code">0x</code> or <code class="code">0<span class="constructor">X</span></code>), octal (if it begins with <code class="code">0o</code> or <code class="code">0<span class="constructor">O</span></code>),
   or binary (if it begins with <code class="code">0b</code> or <code class="code">0<span class="constructor">B</span></code>).
   Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"int_of_string"</span></code> if the given string is not
   a valid representation of an integer, or if the integer represented
   exceeds the range of integers representable in type <code class="code">int</code>.<br>
</div>

<pre><span id="VALstring_of_float"><span class="keyword">val</span> string_of_float</span> : <code class="type">float -&gt; string</code></pre><div class="info ">
Return the string representation of a floating-point number.<br>
</div>

<pre><span id="VALfloat_of_string"><span class="keyword">val</span> float_of_string</span> : <code class="type">string -&gt; float</code></pre><div class="info ">
Convert the given string to a float.  Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"float_of_string"</span></code>
   if the given string is not a valid representation of a float.<br>
</div>
<br>
<h6 id="6_Pairoperations">Pair operations</h6><br>

<pre><span id="VALfst"><span class="keyword">val</span> fst</span> : <code class="type">'a * 'b -&gt; 'a</code></pre><div class="info ">
Return the first component of a pair.<br>
</div>

<pre><span id="VALsnd"><span class="keyword">val</span> snd</span> : <code class="type">'a * 'b -&gt; 'b</code></pre><div class="info ">
Return the second component of a pair.<br>
</div>
<br>
<h6 id="6_Listoperations">List operations</h6>
<p>

   More list operations are provided in module <a href="List.html"><code class="code"><span class="constructor">List</span></code></a>.<br>

</p><pre><span id="VAL(@)"><span class="keyword">val</span> (@)</span> : <code class="type">'a list -&gt; 'a list -&gt; 'a list</code></pre><div class="info ">
List concatenation.<br>
</div>
<br>
<h6 id="6_Inputoutput">Input/output</h6>
    Note: all input/output functions can raise <code class="code"><span class="constructor">Sys_error</span></code> when the system
    calls they invoke fail.<br>

<pre><span id="TYPEin_channel"><span class="keyword">type</span> <code class="type"></code>in_channel</span> </pre>
<div class="info ">
The type of input channel.<br>
</div>


<pre><span id="TYPEout_channel"><span class="keyword">type</span> <code class="type"></code>out_channel</span> </pre>
<div class="info ">
The type of output channel.<br>
</div>


<pre><span id="VALstdin"><span class="keyword">val</span> stdin</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
The standard input for the process.<br>
</div>

<pre><span id="VALstdout"><span class="keyword">val</span> stdout</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info ">
The standard output for the process.<br>
</div>

<pre><span id="VALstderr"><span class="keyword">val</span> stderr</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info ">
The standard error output for the process.<br>
</div>
<br>
<div class="h7" id="7_Outputfunctionsonstandardoutput">Output functions on standard output</div><br>

<pre><span id="VALprint_char"><span class="keyword">val</span> print_char</span> : <code class="type">char -&gt; unit</code></pre><div class="info ">
Print a character on standard output.<br>
</div>

<pre><span id="VALprint_string"><span class="keyword">val</span> print_string</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Print a string on standard output.<br>
</div>

<pre><span id="VALprint_int"><span class="keyword">val</span> print_int</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
Print an integer, in decimal, on standard output.<br>
</div>

<pre><span id="VALprint_float"><span class="keyword">val</span> print_float</span> : <code class="type">float -&gt; unit</code></pre><div class="info ">
Print a floating-point number, in decimal, on standard output.<br>
</div>

<pre><span id="VALprint_endline"><span class="keyword">val</span> print_endline</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Print a string, followed by a newline character, on
   standard output and flush standard output.<br>
</div>

<pre><span id="VALprint_newline"><span class="keyword">val</span> print_newline</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Print a newline character on standard output, and flush
   standard output. This can be used to simulate line
   buffering of standard output.<br>
</div>
<br>
<div class="h7" id="7_Outputfunctionsonstandarderror">Output functions on standard error</div><br>

<pre><span id="VALprerr_char"><span class="keyword">val</span> prerr_char</span> : <code class="type">char -&gt; unit</code></pre><div class="info ">
Print a character on standard error.<br>
</div>

<pre><span id="VALprerr_string"><span class="keyword">val</span> prerr_string</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Print a string on standard error.<br>
</div>

<pre><span id="VALprerr_int"><span class="keyword">val</span> prerr_int</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
Print an integer, in decimal, on standard error.<br>
</div>

<pre><span id="VALprerr_float"><span class="keyword">val</span> prerr_float</span> : <code class="type">float -&gt; unit</code></pre><div class="info ">
Print a floating-point number, in decimal, on standard error.<br>
</div>

<pre><span id="VALprerr_endline"><span class="keyword">val</span> prerr_endline</span> : <code class="type">string -&gt; unit</code></pre><div class="info ">
Print a string, followed by a newline character on standard error
   and flush standard error.<br>
</div>

<pre><span id="VALprerr_newline"><span class="keyword">val</span> prerr_newline</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Print a newline character on standard error, and flush
   standard error.<br>
</div>
<br>
<div class="h7" id="7_Inputfunctionsonstandardinput">Input functions on standard input</div><br>

<pre><span id="VALread_line"><span class="keyword">val</span> read_line</span> : <code class="type">unit -&gt; string</code></pre><div class="info ">
Flush standard output, then read characters from standard input
   until a newline character is encountered. Return the string of
   all characters read, without the newline character at the end.<br>
</div>

<pre><span id="VALread_int"><span class="keyword">val</span> read_int</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
Flush standard output, then read one line from standard input
   and convert it to an integer. Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"int_of_string"</span></code>
   if the line read is not a valid representation of an integer.<br>
</div>

<pre><span id="VALread_float"><span class="keyword">val</span> read_float</span> : <code class="type">unit -&gt; float</code></pre><div class="info ">
Flush standard output, then read one line from standard input
   and convert it to a floating-point number.
   The result is unspecified if the line read is not a valid
   representation of a floating-point number.<br>
</div>
<br>
<div class="h7" id="7_Generaloutputfunctions">General output functions</div><br>

<pre><code><span id="TYPEopen_flag"><span class="keyword">type</span> <code class="type"></code>open_flag</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_rdonly"><span class="constructor">Open_rdonly</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open for reading.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_wronly"><span class="constructor">Open_wronly</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open for writing.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_append"><span class="constructor">Open_append</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open for appending: always write at end of file.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_creat"><span class="constructor">Open_creat</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">create the file if it does not exist.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_trunc"><span class="constructor">Open_trunc</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">empty the file if it already exists.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_excl"><span class="constructor">Open_excl</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">fail if Open_creat and the file already exists.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_binary"><span class="constructor">Open_binary</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open in binary mode (no conversion).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_text"><span class="constructor">Open_text</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open in text mode (may perform conversions).</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTopen_flag.Open_nonblock"><span class="constructor">Open_nonblock</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">open in non-blocking mode.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info ">
Opening modes for <a href="Pervasives.html#VALopen_out_gen"><code class="code">open_out_gen</code></a> and
  <a href="Pervasives.html#VALopen_in_gen"><code class="code">open_in_gen</code></a>.<br>
</div>


<pre><span id="VALopen_out"><span class="keyword">val</span> open_out</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info ">
Open the named file for writing, and return a new output channel
   on that file, positionned at the beginning of the file. The
   file is truncated to zero length if it already exists. It
   is created if it does not already exists.<br>
</div>

<pre><span id="VALopen_out_bin"><span class="keyword">val</span> open_out_bin</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info ">
Same as <a href="Pervasives.html#VALopen_out"><code class="code">open_out</code></a>, but the file is opened in binary mode,
   so that no translation takes place during writes. On operating
   systems that do not distinguish between text mode and binary
   mode, this function behaves like <a href="Pervasives.html#VALopen_out"><code class="code">open_out</code></a>.<br>
</div>

<pre><span id="VALopen_out_gen"><span class="keyword">val</span> open_out_gen</span> : <code class="type"><a href="Pervasives.html#TYPEopen_flag">open_flag</a> list -&gt; int -&gt; string -&gt; <a href="Pervasives.html#TYPEout_channel">out_channel</a></code></pre><div class="info ">
<code class="code">open_out_gen mode perm filename</code> opens the named file for writing,
   as described above. The extra argument <code class="code">mode</code>
   specify the opening mode. The extra argument <code class="code">perm</code> specifies
   the file permissions, in case the file must be created.
   <a href="Pervasives.html#VALopen_out"><code class="code">open_out</code></a> and <a href="Pervasives.html#VALopen_out_bin"><code class="code">open_out_bin</code></a> are special
   cases of this function.<br>
</div>

<pre><span id="VALflush"><span class="keyword">val</span> flush</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
Flush the buffer associated with the given output channel,
   performing all pending writes on that channel.
   Interactive programs must be careful about flushing standard
   output and standard error at the right time.<br>
</div>

<pre><span id="VALflush_all"><span class="keyword">val</span> flush_all</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Flush all open output channels; ignore errors.<br>
</div>

<pre><span id="VALoutput_char"><span class="keyword">val</span> output_char</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; char -&gt; unit</code></pre><div class="info ">
Write the character on the given output channel.<br>
</div>

<pre><span id="VALoutput_string"><span class="keyword">val</span> output_string</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; string -&gt; unit</code></pre><div class="info ">
Write the string on the given output channel.<br>
</div>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; string -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">output oc buf pos len</code> writes <code class="code">len</code> characters from string <code class="code">buf</code>,
   starting at offset <code class="code">pos</code>, to the given output channel <code class="code">oc</code>.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"output"</span></code> if <code class="code">pos</code> and <code class="code">len</code> do not
   designate a valid substring of <code class="code">buf</code>.<br>
</div>

<pre><span id="VALoutput_byte"><span class="keyword">val</span> output_byte</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre><div class="info ">
Write one 8-bit integer (as the single character with that code)
   on the given output channel. The given integer is taken modulo
   256.<br>
</div>

<pre><span id="VALoutput_binary_int"><span class="keyword">val</span> output_binary_int</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre><div class="info ">
Write one integer in binary format (4 bytes, big-endian)
   on the given output channel.
   The given integer is taken modulo 2<sup class="superscript">32</sup>.
   The only reliable way to read it back is through the
   <a href="Pervasives.html#VALinput_binary_int"><code class="code">input_binary_int</code></a> function. The format is compatible across
   all machines for a given version of OCaml.<br>
</div>

<pre><span id="VALoutput_value"><span class="keyword">val</span> output_value</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
Write the representation of a structured value of any type
   to a channel. Circularities and sharing inside the value
   are detected and preserved. The object can be read back,
   by the function <a href="Pervasives.html#VALinput_value"><code class="code">input_value</code></a>. See the description of module
   <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a> for more information. <a href="Pervasives.html#VALoutput_value"><code class="code">output_value</code></a> is equivalent
   to <a href="Marshal.html#VALto_channel"><code class="code"><span class="constructor">Marshal</span>.to_channel</code></a> with an empty list of flags.<br>
</div>

<pre><span id="VALseek_out"><span class="keyword">val</span> seek_out</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">seek_out chan pos</code> sets the current writing position to <code class="code">pos</code>
   for channel <code class="code">chan</code>. This works only for regular files. On
   files of other kinds (such as terminals, pipes and sockets),
   the behavior is unspecified.<br>
</div>

<pre><span id="VALpos_out"><span class="keyword">val</span> pos_out</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int</code></pre><div class="info ">
Return the current writing position for the given channel.  Does
    not work on channels opened with the <code class="code"><span class="constructor">Open_append</span></code> flag (returns
    unspecified results).<br>
</div>

<pre><span id="VALout_channel_length"><span class="keyword">val</span> out_channel_length</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; int</code></pre><div class="info ">
Return the size (number of characters) of the regular file
   on which the given channel is opened.  If the channel is opened
    on a file that is not a regular file, the result is meaningless.<br>
</div>

<pre><span id="VALclose_out"><span class="keyword">val</span> close_out</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
Close the given channel, flushing all buffered write operations.
   Output functions raise a <code class="code"><span class="constructor">Sys_error</span></code> exception when they are
   applied to a closed output channel, except <code class="code">close_out</code> and <code class="code">flush</code>,
   which do nothing when applied to an already closed channel.
   Note that <code class="code">close_out</code> may raise <code class="code"><span class="constructor">Sys_error</span></code> if the operating
   system signals an error when flushing or closing.<br>
</div>

<pre><span id="VALclose_out_noerr"><span class="keyword">val</span> close_out_noerr</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
Same as <code class="code">close_out</code>, but ignore all errors.<br>
</div>

<pre><span id="VALset_binary_mode_out"><span class="keyword">val</span> set_binary_mode_out</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; bool -&gt; unit</code></pre><div class="info ">
<code class="code">set_binary_mode_out oc <span class="keyword">true</span></code> sets the channel <code class="code">oc</code> to binary
   mode: no translations take place during output.
   <code class="code">set_binary_mode_out oc <span class="keyword">false</span></code> sets the channel <code class="code">oc</code> to text
   mode: depending on the operating system, some translations
   may take place during output.  For instance, under Windows,
   end-of-lines will be translated from <code class="code">\n</code> to <code class="code">\r\n</code>.
   This function has no effect under operating systems that
   do not distinguish between text mode and binary mode.<br>
</div>
<br>
<div class="h7" id="7_Generalinputfunctions">General input functions</div><br>

<pre><span id="VALopen_in"><span class="keyword">val</span> open_in</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
Open the named file for reading, and return a new input channel
   on that file, positionned at the beginning of the file.<br>
</div>

<pre><span id="VALopen_in_bin"><span class="keyword">val</span> open_in_bin</span> : <code class="type">string -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
Same as <a href="Pervasives.html#VALopen_in"><code class="code">open_in</code></a>, but the file is opened in binary mode,
   so that no translation takes place during reads. On operating
   systems that do not distinguish between text mode and binary
   mode, this function behaves like <a href="Pervasives.html#VALopen_in"><code class="code">open_in</code></a>.<br>
</div>

<pre><span id="VALopen_in_gen"><span class="keyword">val</span> open_in_gen</span> : <code class="type"><a href="Pervasives.html#TYPEopen_flag">open_flag</a> list -&gt; int -&gt; string -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code">open_in_gen mode perm filename</code> opens the named file for reading,
   as described above. The extra arguments
   <code class="code">mode</code> and <code class="code">perm</code> specify the opening mode and file permissions.
   <a href="Pervasives.html#VALopen_in"><code class="code">open_in</code></a> and <a href="Pervasives.html#VALopen_in_bin"><code class="code">open_in_bin</code></a> are special
   cases of this function.<br>
</div>

<pre><span id="VALinput_char"><span class="keyword">val</span> input_char</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; char</code></pre><div class="info ">
Read one character from the given input channel.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if there are no more characters to read.<br>
</div>

<pre><span id="VALinput_line"><span class="keyword">val</span> input_line</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; string</code></pre><div class="info ">
Read characters from the given input channel, until a
   newline character is encountered. Return the string of
   all characters read, without the newline character at the end.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if the end of the file is reached
   at the beginning of line.<br>
</div>

<pre><span id="VALinput"><span class="keyword">val</span> input</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; string -&gt; int -&gt; int -&gt; int</code></pre><div class="info ">
<code class="code">input ic buf pos len</code> reads up to <code class="code">len</code> characters from
   the given channel <code class="code">ic</code>, storing them in string <code class="code">buf</code>, starting at
   character number <code class="code">pos</code>.
   It returns the actual number of characters read, between 0 and
   <code class="code">len</code> (inclusive).
   A return value of 0 means that the end of file was reached.
   A return value between 0 and <code class="code">len</code> exclusive means that
   not all requested <code class="code">len</code> characters were read, either because
   no more characters were available at that time, or because
   the implementation found it convenient to do a partial read;
   <code class="code">input</code> must be called again to read the remaining characters,
   if desired.  (See also <a href="Pervasives.html#VALreally_input"><code class="code">really_input</code></a> for reading
   exactly <code class="code">len</code> characters.)
   Exception <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"input"</span></code> is raised if <code class="code">pos</code> and <code class="code">len</code>
   do not designate a valid substring of <code class="code">buf</code>.<br>
</div>

<pre><span id="VALreally_input"><span class="keyword">val</span> really_input</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; string -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">really_input ic buf pos len</code> reads <code class="code">len</code> characters from channel <code class="code">ic</code>,
   storing them in string <code class="code">buf</code>, starting at character number <code class="code">pos</code>.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if the end of file is reached before <code class="code">len</code>
   characters have been read.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"really_input"</span></code> if
   <code class="code">pos</code> and <code class="code">len</code> do not designate a valid substring of <code class="code">buf</code>.<br>
</div>

<pre><span id="VALinput_byte"><span class="keyword">val</span> input_byte</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre><div class="info ">
Same as <a href="Pervasives.html#VALinput_char"><code class="code">input_char</code></a>, but return the 8-bit integer representing
   the character.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if an end of file was reached.<br>
</div>

<pre><span id="VALinput_binary_int"><span class="keyword">val</span> input_binary_int</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre><div class="info ">
Read an integer encoded in binary format (4 bytes, big-endian)
   from the given input channel. See <a href="Pervasives.html#VALoutput_binary_int"><code class="code">output_binary_int</code></a>.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if an end of file was reached while reading the
   integer.<br>
</div>

<pre><span id="VALinput_value"><span class="keyword">val</span> input_value</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; 'a</code></pre><div class="info ">
Read the representation of a structured value, as produced
   by <a href="Pervasives.html#VALoutput_value"><code class="code">output_value</code></a>, and return the corresponding value.
   This function is identical to <a href="Marshal.html#VALfrom_channel"><code class="code"><span class="constructor">Marshal</span>.from_channel</code></a>;
   see the description of module <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a> for more information,
   in particular concerning the lack of type safety.<br>
</div>

<pre><span id="VALseek_in"><span class="keyword">val</span> seek_in</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">seek_in chan pos</code> sets the current reading position to <code class="code">pos</code>
   for channel <code class="code">chan</code>. This works only for regular files. On
   files of other kinds, the behavior is unspecified.<br>
</div>

<pre><span id="VALpos_in"><span class="keyword">val</span> pos_in</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre><div class="info ">
Return the current reading position for the given channel.<br>
</div>

<pre><span id="VALin_channel_length"><span class="keyword">val</span> in_channel_length</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int</code></pre><div class="info ">
Return the size (number of characters) of the regular file
    on which the given channel is opened.  If the channel is opened
    on a file that is not a regular file, the result is meaningless.
    The returned size does not take into account the end-of-line
    translations that can be performed when reading from a channel
    opened in text mode.<br>
</div>

<pre><span id="VALclose_in"><span class="keyword">val</span> close_in</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre><div class="info ">
Close the given channel.  Input functions raise a <code class="code"><span class="constructor">Sys_error</span></code>
  exception when they are applied to a closed input channel,
  except <code class="code">close_in</code>, which does nothing when applied to an already
  closed channel.<br>
</div>

<pre><span id="VALclose_in_noerr"><span class="keyword">val</span> close_in_noerr</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre><div class="info ">
Same as <code class="code">close_in</code>, but ignore all errors.<br>
</div>

<pre><span id="VALset_binary_mode_in"><span class="keyword">val</span> set_binary_mode_in</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; bool -&gt; unit</code></pre><div class="info ">
<code class="code">set_binary_mode_in ic <span class="keyword">true</span></code> sets the channel <code class="code">ic</code> to binary
   mode: no translations take place during input.
   <code class="code">set_binary_mode_out ic <span class="keyword">false</span></code> sets the channel <code class="code">ic</code> to text
   mode: depending on the operating system, some translations
   may take place during input.  For instance, under Windows,
   end-of-lines will be translated from <code class="code">\r\n</code> to <code class="code">\n</code>.
   This function has no effect under operating systems that
   do not distinguish between text mode and binary mode.<br>
</div>
<br>
<div class="h7" id="7_Operationsonlargefiles">Operations on large files</div><br>

<pre><span class="keyword">module</span> <a href="Pervasives.LargeFile.html">LargeFile</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Pervasives.LargeFile.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Operations on large files.
</div>
<br>
<h6 id="6_References">References</h6><br>

<pre><code><span id="TYPEref"><span class="keyword">type</span> <code class="type">'a</code> ref</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTref.contents">contents</span>&nbsp;: <code class="type">'a</code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
The type of references (mutable indirection cells) containing
   a value of type <code class="code"><span class="keywordsign">'</span>a</code>.<br>
</div>


<pre><span id="VALref"><span class="keyword">val</span> ref</span> : <code class="type">'a -&gt; 'a <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="info ">
Return a fresh reference containing the given value.<br>
</div>

<pre><span id="VAL(!)"><span class="keyword">val</span> (!)</span> : <code class="type">'a <a href="Pervasives.html#TYPEref">ref</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">!r</code> returns the current contents of reference <code class="code">r</code>.
   Equivalent to <code class="code"><span class="keyword">fun</span> r <span class="keywordsign">-&gt;</span> r.contents</code>.<br>
</div>

<pre><span id="VAL(:=)"><span class="keyword">val</span> (:=)</span> : <code class="type">'a <a href="Pervasives.html#TYPEref">ref</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
<code class="code">r := a</code> stores the value of <code class="code">a</code> in reference <code class="code">r</code>.
   Equivalent to <code class="code"><span class="keyword">fun</span> r v <span class="keywordsign">-&gt;</span> r.contents &lt;- v</code>.<br>
</div>

<pre><span id="VALincr"><span class="keyword">val</span> incr</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre><div class="info ">
Increment the integer contained in the given reference.
   Equivalent to <code class="code"><span class="keyword">fun</span> r <span class="keywordsign">-&gt;</span> r := succ !r</code>.<br>
</div>

<pre><span id="VALdecr"><span class="keyword">val</span> decr</span> : <code class="type">int <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre><div class="info ">
Decrement the integer contained in the given reference.
   Equivalent to <code class="code"><span class="keyword">fun</span> r <span class="keywordsign">-&gt;</span> r := pred !r</code>.<br>
</div>
<br>
<h6 id="6_Operationsonformatstrings">Operations on format strings</h6><br>
<br>
Format strings are character strings with special lexical conventions
  that defines the functionality of formatted input/output functions. Format
  strings are used to read data with formatted input functions from module
  <a href="Scanf.html"><code class="code"><span class="constructor">Scanf</span></code></a> and to print data with formatted output functions from modules
  <a href="Printf.html"><code class="code"><span class="constructor">Printf</span></code></a> and <a href="Format.html"><code class="code"><span class="constructor">Format</span></code></a>.
<p>

  Format strings are made of three kinds of entities:</p><ul>
<li><em>conversions specifications</em>, introduced by the special character <code class="code"><span class="string">'%'</span></code>
    followed by one or more characters specifying what kind of argument to
    read or print,</li>
<li><em>formatting indications</em>, introduced by the special character <code class="code"><span class="string">'@'</span></code>
    followed by one or more characters specifying how to read or print the
    argument,</li>
<li><em>plain characters</em> that are regular characters with usual lexical
    conventions. Plain characters specify string literals to be read in the
    input or printed in the output.</li>
</ul>

  There is an additional lexical rule to escape the special characters <code class="code"><span class="string">'%'</span></code>
  and <code class="code"><span class="string">'@'</span></code> in format strings: if a special character follows a <code class="code"><span class="string">'%'</span></code>
  character, it is treated as a plain character. In other words, <code class="code"><span class="string">"%%"</span></code> is
  considered as a plain <code class="code"><span class="string">'%'</span></code> and <code class="code"><span class="string">"%@"</span></code> as a plain <code class="code"><span class="string">'@'</span></code>.
<p>

  For more information about conversion specifications and formatting
  indications available, read the documentation of modules <a href="Scanf.html"><code class="code"><span class="constructor">Scanf</span></code></a>,
  <a href="Printf.html"><code class="code"><span class="constructor">Printf</span></code></a> and <a href="Format.html"><code class="code"><span class="constructor">Format</span></code></a>.<br>

</p><pre><span id="TYPEformat4"><span class="keyword">type</span> <code class="type">('a, 'b, 'c, 'd)</code> format4</span> = <code class="type">('a, 'b, 'c, 'c, 'c, 'd) format6</code> </pre>
<div class="info ">
Format strings have a general and highly polymorphic type
    <code class="code">(<span class="keywordsign">'</span>a, <span class="keywordsign">'</span>b, <span class="keywordsign">'</span>c, <span class="keywordsign">'</span>d, <span class="keywordsign">'</span>e, <span class="keywordsign">'</span>f) format6</code>. Type <code class="code">format6</code> is built in.
    The two simplified types, <code class="code">format</code> and <code class="code">format4</code> below are
    included for backward compatibility with earlier releases of
    OCaml.
<p>

    The meaning of format string type parameters is as follows:
</p><p>
</p><ul>
<li><code class="code"><span class="keywordsign">'</span>a</code> is the type of the parameters of the format for formatted output
      functions (<code class="code">printf</code>-style functions);
      <code class="code"><span class="keywordsign">'</span>a</code> is the type of the values read by the format for formatted input
      functions (<code class="code">scanf</code>-style functions).</li>
</ul>
<ul>
<li><code class="code"><span class="keywordsign">'</span>b</code> is the type of input source for formatted input functions and the
      type of output target for formatted output functions.
      For <code class="code">printf</code>-style functions from module <code class="code"><span class="constructor">Printf</span></code>, <code class="code"><span class="keywordsign">'</span>b</code> is typically
      <code class="code">out_channel</code>;
      for <code class="code">printf</code>-style functions from module <code class="code"><span class="constructor">Format</span></code>, <code class="code"><span class="keywordsign">'</span>b</code> is typically
      <code class="code"><span class="constructor">Format</span>.formatter</code>;
      for <code class="code">scanf</code>-style functions from module <code class="code"><span class="constructor">Scanf</span></code>, <code class="code"><span class="keywordsign">'</span>b</code> is typically
      <code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code>.</li>
</ul>

      Type argument <code class="code"><span class="keywordsign">'</span>b</code> is also the type of the first argument given to
      user's defined printing functions for <code class="code">%a</code> and <code class="code">%t</code> conversions,
      and user's defined reading functions for <code class="code">%r</code> conversion.
<p>
</p><ul>
<li><code class="code"><span class="keywordsign">'</span>c</code> is the type of the result of the <code class="code">%a</code> and <code class="code">%t</code> printing
      functions, and also the type of the argument transmitted to the
      first argument of <code class="code">kprintf</code>-style functions or to the
      <code class="code">kscanf</code>-style functions.</li>
</ul>
<ul>
<li><code class="code"><span class="keywordsign">'</span>d</code> is the type of parameters for the <code class="code">scanf</code>-style functions.</li>
</ul>
<ul>
<li><code class="code"><span class="keywordsign">'</span>e</code> is the type of the receiver function for the <code class="code">scanf</code>-style functions.</li>
</ul>
<ul>
<li><code class="code"><span class="keywordsign">'</span>f</code> is the final result type of a formatted input/output function
      invocation: for the <code class="code">printf</code>-style functions, it is typically <code class="code">unit</code>;
      for the <code class="code">scanf</code>-style functions, it is typically the result type of the
      receiver function.</li>
</ul>
<br>
</div>


<pre><span id="TYPEformat"><span class="keyword">type</span> <code class="type">('a, 'b, 'c)</code> format</span> = <code class="type">('a, 'b, 'c, 'c) <a href="Pervasives.html#TYPEformat4">format4</a></code> </pre>


<pre><span id="VALstring_of_format"><span class="keyword">val</span> string_of_format</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) format6 -&gt; string</code></pre><div class="info ">
Converts a format string into a string.<br>
</div>

<pre><span id="VALformat_of_string"><span class="keyword">val</span> format_of_string</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) format6 -&gt; ('a, 'b, 'c, 'd, 'e, 'f) format6</code></pre><div class="info ">
<code class="code">format_of_string s</code> returns a format string read from the string
    literal <code class="code">s</code>.
    Note: <code class="code">format_of_string</code> can not convert a string argument that is not a
    literal. If you need this functionality, use the more general
    <a href="Scanf.html#VALformat_from_string"><code class="code"><span class="constructor">Scanf</span>.format_from_string</code></a> function.<br>
</div>

<pre><span id="VAL(^^)"><span class="keyword">val</span> (^^)</span> : <code class="type">('a, 'b, 'c, 'd, 'e, 'f) format6 -&gt;<br>       ('f, 'b, 'c, 'e, 'g, 'h) format6 -&gt; ('a, 'b, 'c, 'd, 'g, 'h) format6</code></pre><div class="info ">
<code class="code">f1 ^^ f2</code> catenates format strings <code class="code">f1</code> and <code class="code">f2</code>. The result is a
  format string that behaves as the concatenation of format strings <code class="code">f1</code> and
  <code class="code">f2</code>: in case of formatted output, it accepts arguments from <code class="code">f1</code>, then
  arguments from <code class="code">f2</code>; in case of formatted input, it returns results from
  <code class="code">f1</code>, then results from <code class="code">f2</code>.<br>
</div>
<br>
<h6 id="6_Programtermination">Program termination</h6><br>

<pre><span id="VALexit"><span class="keyword">val</span> exit</span> : <code class="type">int -&gt; 'a</code></pre><div class="info ">
Terminate the process, returning the given status code
   to the operating system: usually 0 to indicate no errors,
   and a small positive integer to indicate failure.
   All open output channels are flushed with <code class="code">flush_all</code>.
   An implicit <code class="code">exit 0</code> is performed each time a program
   terminates normally.  An implicit <code class="code">exit 2</code> is performed if the program
   terminates early because of an uncaught exception.<br>
</div>

<pre><span id="VALat_exit"><span class="keyword">val</span> at_exit</span> : <code class="type">(unit -&gt; unit) -&gt; unit</code></pre><div class="info ">
Register the given function to be called at program
   termination time. The functions registered with <code class="code">at_exit</code>
   will be called when the program executes <a href="Pervasives.html#VALexit"><code class="code">exit</code></a>,
   or terminates, either normally or because of an uncaught exception.
   The functions are called in 'last in, first out' order:
   the function most recently added with <code class="code">at_exit</code> is called first.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>