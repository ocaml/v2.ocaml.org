<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Big_int</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Big_int.html">Big_int</a></h1>

<pre><span class="keyword">module</span> Big_int: <code class="code"><span class="keyword">sig</span></code> <a href="Big_int.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Operations on arbitrary-precision integers.
<p>

   Big integers (type <code class="code">big_int</code>) are signed integers of arbitrary size.<br>
</p></div>
<hr width="100%">

<pre><span id="TYPEbig_int"><span class="keyword">type</span> <code class="type"></code>big_int</span> </pre>
<div class="info ">
The type of big integers.<br>
</div>


<pre><span id="VALzero_big_int"><span class="keyword">val</span> zero_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
The big integer <code class="code">0</code>.<br>
</div>

<pre><span id="VALunit_big_int"><span class="keyword">val</span> unit_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
The big integer <code class="code">1</code>.<br>
</div>
<br>
<h6 id="6_Arithmeticoperations">Arithmetic operations</h6><br>

<pre><span id="VALminus_big_int"><span class="keyword">val</span> minus_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Unary negation.<br>
</div>

<pre><span id="VALabs_big_int"><span class="keyword">val</span> abs_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Absolute value.<br>
</div>

<pre><span id="VALadd_big_int"><span class="keyword">val</span> add_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Addition.<br>
</div>

<pre><span id="VALsucc_big_int"><span class="keyword">val</span> succ_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Successor (add 1).<br>
</div>

<pre><span id="VALadd_int_big_int"><span class="keyword">val</span> add_int_big_int</span> : <code class="type">int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Addition of a small integer to a big integer.<br>
</div>

<pre><span id="VALsub_big_int"><span class="keyword">val</span> sub_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Subtraction.<br>
</div>

<pre><span id="VALpred_big_int"><span class="keyword">val</span> pred_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Predecessor (subtract 1).<br>
</div>

<pre><span id="VALmult_big_int"><span class="keyword">val</span> mult_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Multiplication of two big integers.<br>
</div>

<pre><span id="VALmult_int_big_int"><span class="keyword">val</span> mult_int_big_int</span> : <code class="type">int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Multiplication of a big integer by a small integer<br>
</div>

<pre><span id="VALsquare_big_int"><span class="keyword">val</span> square_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Return the square of the given big integer<br>
</div>

<pre><span id="VALsqrt_big_int"><span class="keyword">val</span> sqrt_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
<code class="code">sqrt_big_int a</code> returns the integer square root of <code class="code">a</code>,
           that is, the largest big integer <code class="code">r</code> such that <code class="code">r * r &lt;= a</code>.
           Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">a</code> is negative.<br>
</div>

<pre><span id="VALquomod_big_int"><span class="keyword">val</span> quomod_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> * <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Euclidean division of two big integers.
           The first part of the result is the quotient,
           the second part is the remainder.
           Writing <code class="code">(q,r) = quomod_big_int a b</code>, we have
           <code class="code">a = q * b + r</code> and <code class="code">0 &lt;= r &lt; <span class="keywordsign">|</span>b<span class="keywordsign">|</span></code>.
           Raise <code class="code"><span class="constructor">Division_by_zero</span></code> if the divisor is zero.<br>
</div>

<pre><span id="VALdiv_big_int"><span class="keyword">val</span> div_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Euclidean quotient of two big integers.
           This is the first result <code class="code">q</code> of <code class="code">quomod_big_int</code> (see above).<br>
</div>

<pre><span id="VALmod_big_int"><span class="keyword">val</span> mod_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Euclidean modulus of two big integers.
           This is the second result <code class="code">r</code> of <code class="code">quomod_big_int</code> (see above).<br>
</div>

<pre><span id="VALgcd_big_int"><span class="keyword">val</span> gcd_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Greatest common divisor of two big integers.<br>
</div>

<pre><span id="VALpower_int_positive_int"><span class="keyword">val</span> power_int_positive_int</span> : <code class="type">int -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre>
<pre><span id="VALpower_big_int_positive_int"><span class="keyword">val</span> power_big_int_positive_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre>
<pre><span id="VALpower_int_positive_big_int"><span class="keyword">val</span> power_int_positive_big_int</span> : <code class="type">int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre>
<pre><span id="VALpower_big_int_positive_big_int"><span class="keyword">val</span> power_big_int_positive_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Exponentiation functions.  Return the big integer
           representing the first argument <code class="code">a</code> raised to the power <code class="code">b</code>
           (the second argument).  Depending
           on the function, <code class="code">a</code> and <code class="code">b</code> can be either small integers
           or big integers.  Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">b</code> is negative.<br>
</div>
<br>
<h6 id="6_Comparisonsandtests">Comparisons and tests</h6><br>

<pre><span id="VALsign_big_int"><span class="keyword">val</span> sign_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int</code></pre><div class="info ">
Return <code class="code">0</code> if the given big integer is zero,
           <code class="code">1</code> if it is positive, and <code class="code">-1</code> if it is negative.<br>
</div>

<pre><span id="VALcompare_big_int"><span class="keyword">val</span> compare_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int</code></pre><div class="info ">
<code class="code">compare_big_int a b</code> returns <code class="code">0</code> if <code class="code">a</code> and <code class="code">b</code> are equal,
           <code class="code">1</code> if <code class="code">a</code> is greater than <code class="code">b</code>, and <code class="code">-1</code> if <code class="code">a</code> is smaller
           than <code class="code">b</code>.<br>
</div>

<pre><span id="VALeq_big_int"><span class="keyword">val</span> eq_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre>
<pre><span id="VALle_big_int"><span class="keyword">val</span> le_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre>
<pre><span id="VALge_big_int"><span class="keyword">val</span> ge_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre>
<pre><span id="VALlt_big_int"><span class="keyword">val</span> lt_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre>
<pre><span id="VALgt_big_int"><span class="keyword">val</span> gt_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre><div class="info ">
Usual boolean comparisons between two big integers.<br>
</div>

<pre><span id="VALmax_big_int"><span class="keyword">val</span> max_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Return the greater of its two arguments.<br>
</div>

<pre><span id="VALmin_big_int"><span class="keyword">val</span> min_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Return the smaller of its two arguments.<br>
</div>

<pre><span id="VALnum_digits_big_int"><span class="keyword">val</span> num_digits_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int</code></pre><div class="info ">
Return the number of machine words used to store the
           given big integer.<br>
</div>
<br>
<h6 id="6_Conversionstoandfromstrings">Conversions to and from strings</h6><br>

<pre><span id="VALstring_of_big_int"><span class="keyword">val</span> string_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; string</code></pre><div class="info ">
Return the string representation of the given big integer,
           in decimal (base 10).<br>
</div>

<pre><span id="VALbig_int_of_string"><span class="keyword">val</span> big_int_of_string</span> : <code class="type">string -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Convert a string to a big integer, in decimal.
           The string consists of an optional <code class="code">-</code> or <code class="code">+</code> sign,
           followed by one or several decimal digits.<br>
</div>
<br>
<h6 id="6_Conversionstoandfromothernumericaltypes">Conversions to and from other numerical types</h6><br>

<pre><span id="VALbig_int_of_int"><span class="keyword">val</span> big_int_of_int</span> : <code class="type">int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Convert a small integer to a big integer.<br>
</div>

<pre><span id="VALis_int_big_int"><span class="keyword">val</span> is_int_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; bool</code></pre><div class="info ">
Test whether the given big integer is small enough to
           be representable as a small integer (type <code class="code">int</code>)
           without loss of precision.  On a 32-bit platform,
           <code class="code">is_int_big_int a</code> returns <code class="code"><span class="keyword">true</span></code> if and only if
           <code class="code">a</code> is between 2<sup class="superscript">30</sup> and 2<sup class="superscript">30</sup>-1.  On a 64-bit platform,
           <code class="code">is_int_big_int a</code> returns <code class="code"><span class="keyword">true</span></code> if and only if
           <code class="code">a</code> is between -2<sup class="superscript">62</sup> and 2<sup class="superscript">62</sup>-1.<br>
</div>

<pre><span id="VALint_of_big_int"><span class="keyword">val</span> int_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int</code></pre><div class="info ">
Convert a big integer to a small integer (type <code class="code">int</code>).
           Raises <code class="code"><span class="constructor">Failure</span> <span class="string">"int_of_big_int"</span></code> if the big integer
           is not representable as a small integer.<br>
</div>

<pre><span id="VALbig_int_of_int32"><span class="keyword">val</span> big_int_of_int32</span> : <code class="type">int32 -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Convert a 32-bit integer to a big integer.<br>
</div>

<pre><span id="VALbig_int_of_nativeint"><span class="keyword">val</span> big_int_of_nativeint</span> : <code class="type">nativeint -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Convert a native integer to a big integer.<br>
</div>

<pre><span id="VALbig_int_of_int64"><span class="keyword">val</span> big_int_of_int64</span> : <code class="type">int64 -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Convert a 64-bit integer to a big integer.<br>
</div>

<pre><span id="VALint32_of_big_int"><span class="keyword">val</span> int32_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int32</code></pre><div class="info ">
Convert a big integer to a 32-bit integer.
            Raises <code class="code"><span class="constructor">Failure</span></code> if the big integer is outside the
            range <code class="code">[-2{^31}, 2{^31}-1]</code>.<br>
</div>

<pre><span id="VALnativeint_of_big_int"><span class="keyword">val</span> nativeint_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; nativeint</code></pre><div class="info ">
Convert a big integer to a native integer.
            Raises <code class="code"><span class="constructor">Failure</span></code> if the big integer is outside the
            range <code class="code">[<span class="constructor">Nativeint</span>.min_int, <span class="constructor">Nativeint</span>.max_int]</code>.<br>
</div>

<pre><span id="VALint64_of_big_int"><span class="keyword">val</span> int64_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int64</code></pre><div class="info ">
Convert a big integer to a 64-bit integer.
            Raises <code class="code"><span class="constructor">Failure</span></code> if the big integer is outside the
            range <code class="code">[-2{^63}, 2{^63}-1]</code>.<br>
</div>

<pre><span id="VALfloat_of_big_int"><span class="keyword">val</span> float_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; float</code></pre><div class="info ">
Returns a floating-point number approximating the
           given big integer.<br>
</div>
<br>
<h6 id="6_Bitorientedoperations">Bit-oriented operations</h6><br>

<pre><span id="VALand_big_int"><span class="keyword">val</span> and_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Bitwise logical 'and'.
            The arguments must be positive or zero.<br>
</div>

<pre><span id="VALor_big_int"><span class="keyword">val</span> or_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Bitwise logical 'or'.
            The arguments must be positive or zero.<br>
</div>

<pre><span id="VALxor_big_int"><span class="keyword">val</span> xor_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
Bitwise logical 'exclusive or'.
            The arguments must be positive or zero.<br>
</div>

<pre><span id="VALshift_left_big_int"><span class="keyword">val</span> shift_left_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
<code class="code">shift_left_big_int b n</code> returns <code class="code">b</code> shifted left by <code class="code">n</code> bits.
            Equivalent to multiplication by <code class="code">2^n</code>.<br>
</div>

<pre><span id="VALshift_right_big_int"><span class="keyword">val</span> shift_right_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
<code class="code">shift_right_big_int b n</code> returns <code class="code">b</code> shifted right by <code class="code">n</code> bits.
            Equivalent to division by <code class="code">2^n</code> with the result being
            rounded towards minus infinity.<br>
</div>

<pre><span id="VALshift_right_towards_zero_big_int"><span class="keyword">val</span> shift_right_towards_zero_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
<code class="code">shift_right_towards_zero_big_int b n</code> returns <code class="code">b</code> shifted
            right by <code class="code">n</code> bits.  The shift is performed on the absolute
            value of <code class="code">b</code>, and the result has the same sign as <code class="code">b</code>.
            Equivalent to division by <code class="code">2^n</code> with the result being
            rounded towards zero.<br>
</div>

<pre><span id="VALextract_big_int"><span class="keyword">val</span> extract_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">big_int</a> -&gt; int -&gt; int -&gt; <a href="Big_int.html#TYPEbig_int">big_int</a></code></pre><div class="info ">
<code class="code">extract_big_int bi ofs n</code> returns a nonnegative number
            corresponding to bits <code class="code">ofs</code> to <code class="code">ofs + n - 1</code> of the
            binary representation of <code class="code">bi</code>.  If <code class="code">bi</code> is negative,
            a two's complement representation is used.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>