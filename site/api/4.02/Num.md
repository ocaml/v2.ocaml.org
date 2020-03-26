<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Num</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Num.html">Num</a></h1>

<pre><span class="keyword">module</span> Num: <code class="code"><span class="keyword">sig</span></code> <a href="Num.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Operation on arbitrary-precision numbers.
<p>

   Numbers (type <code class="code">num</code>) are arbitrary-precision rational numbers,
   plus the special elements <code class="code">1/0</code> (infinity) and <code class="code">0/0</code> (undefined).<br>
</p></div>
<hr width="100%">

<pre><code><span id="TYPEnum"><span class="keyword">type</span> <code class="type"></code>num</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnum.Int"><span class="constructor">Int</span></span> <span class="keyword">of</span> <code class="type">int</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnum.Big_int"><span class="constructor">Big_int</span></span> <span class="keyword">of</span> <code class="type"><a href="Big_int.html#TYPEbig_int">Big_int.big_int</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnum.Ratio"><span class="constructor">Ratio</span></span> <span class="keyword">of</span> <code class="type"><a href="Ratio.html#TYPEratio">Ratio.ratio</a></code></code></td>

</tr></tbody></table>

<div class="info ">
The type of numbers.<br>
</div>

<br>
<h6 id="6_Arithmeticoperations">Arithmetic operations</h6><br>

<pre><span id="VAL(+/)"><span class="keyword">val</span> (+/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Same as <a href="Num.html#VALadd_num"><code class="code"><span class="constructor">Num</span>.add_num</code></a>.<br>
</div>

<pre><span id="VALadd_num"><span class="keyword">val</span> add_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Addition<br>
</div>

<pre><span id="VALminus_num"><span class="keyword">val</span> minus_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Unary negation.<br>
</div>

<pre><span id="VAL(-/)"><span class="keyword">val</span> (-/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Same as <a href="Num.html#VALsub_num"><code class="code"><span class="constructor">Num</span>.sub_num</code></a>.<br>
</div>

<pre><span id="VALsub_num"><span class="keyword">val</span> sub_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Subtraction<br>
</div>

<pre><span id="VAL( */ )"><span class="keyword">val</span> ( */ )</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Same as <a href="Num.html#VALmult_num"><code class="code"><span class="constructor">Num</span>.mult_num</code></a>.<br>
</div>

<pre><span id="VALmult_num"><span class="keyword">val</span> mult_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Multiplication<br>
</div>

<pre><span id="VALsquare_num"><span class="keyword">val</span> square_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Squaring<br>
</div>

<pre><span id="VAL(//)"><span class="keyword">val</span> (//)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Same as <a href="Num.html#VALdiv_num"><code class="code"><span class="constructor">Num</span>.div_num</code></a>.<br>
</div>

<pre><span id="VALdiv_num"><span class="keyword">val</span> div_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Division<br>
</div>

<pre><span id="VALquo_num"><span class="keyword">val</span> quo_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Euclidean division: quotient.<br>
</div>

<pre><span id="VALmod_num"><span class="keyword">val</span> mod_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Euclidean division: remainder.<br>
</div>

<pre><span id="VAL( **/ )"><span class="keyword">val</span> ( **/ )</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Same as <a href="Num.html#VALpower_num"><code class="code"><span class="constructor">Num</span>.power_num</code></a>.<br>
</div>

<pre><span id="VALpower_num"><span class="keyword">val</span> power_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Exponentiation<br>
</div>

<pre><span id="VALabs_num"><span class="keyword">val</span> abs_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Absolute value.<br>
</div>

<pre><span id="VALsucc_num"><span class="keyword">val</span> succ_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">succ n</code> is <code class="code">n+1</code><br>
</div>

<pre><span id="VALpred_num"><span class="keyword">val</span> pred_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">pred n</code> is <code class="code">n-1</code><br>
</div>

<pre><span id="VALincr_num"><span class="keyword">val</span> incr_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre><div class="info ">
<code class="code">incr r</code> is <code class="code">r:=!r+1</code>, where <code class="code">r</code> is a reference to a number.<br>
</div>

<pre><span id="VALdecr_num"><span class="keyword">val</span> decr_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre><div class="info ">
<code class="code">decr r</code> is <code class="code">r:=!r-1</code>, where <code class="code">r</code> is a reference to a number.<br>
</div>

<pre><span id="VALis_integer_num"><span class="keyword">val</span> is_integer_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre><div class="info ">
Test if a number is an integer<br>
</div>
<br>
The four following functions approximate a number by an integer :<br>

<pre><span id="VALinteger_num"><span class="keyword">val</span> integer_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">integer_num n</code> returns the integer closest to <code class="code">n</code>. In case of ties,
   rounds towards zero.<br>
</div>

<pre><span id="VALfloor_num"><span class="keyword">val</span> floor_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">floor_num n</code> returns the largest integer smaller or equal to <code class="code">n</code>.<br>
</div>

<pre><span id="VALround_num"><span class="keyword">val</span> round_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">round_num n</code> returns the integer closest to <code class="code">n</code>. In case of ties,
   rounds off zero.<br>
</div>

<pre><span id="VALceiling_num"><span class="keyword">val</span> ceiling_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
<code class="code">ceiling_num n</code> returns the smallest integer bigger or equal to <code class="code">n</code>.<br>
</div>

<pre><span id="VALsign_num"><span class="keyword">val</span> sign_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; int</code></pre><div class="info ">
Return <code class="code">-1</code>, <code class="code">0</code> or <code class="code">1</code> according to the sign of the argument.<br>
</div>
<br>
<div class="h7" id="7_Comparisonsbetweennumbers">Comparisons between numbers</div><br>

<pre><span id="VAL(=/)"><span class="keyword">val</span> (=/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VAL(</)"><span class="keyword">val</span> (&lt;/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VAL(>/)"><span class="keyword">val</span> (&gt;/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VAL(<=/)"><span class="keyword">val</span> (&lt;=/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VAL(>=/)"><span class="keyword">val</span> (&gt;=/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VAL(<>/)"><span class="keyword">val</span> (&lt;&gt;/)</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALeq_num"><span class="keyword">val</span> eq_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALlt_num"><span class="keyword">val</span> lt_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALle_num"><span class="keyword">val</span> le_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALgt_num"><span class="keyword">val</span> gt_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALge_num"><span class="keyword">val</span> ge_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; bool</code></pre>
<pre><span id="VALcompare_num"><span class="keyword">val</span> compare_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; int</code></pre><div class="info ">
Return <code class="code">-1</code>, <code class="code">0</code> or <code class="code">1</code> if the first argument is less than,
   equal to, or greater than the second argument.<br>
</div>

<pre><span id="VALmax_num"><span class="keyword">val</span> max_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Return the greater of the two arguments.<br>
</div>

<pre><span id="VALmin_num"><span class="keyword">val</span> min_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Return the smaller of the two arguments.<br>
</div>
<br>
<h6 id="6_Coercionswithstrings">Coercions with strings</h6><br>

<pre><span id="VALstring_of_num"><span class="keyword">val</span> string_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; string</code></pre><div class="info ">
Convert a number to a string, using fractional notation.<br>
</div>

<pre><span id="VALapprox_num_fix"><span class="keyword">val</span> approx_num_fix</span> : <code class="type">int -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; string</code></pre><div class="info ">
See <a href="Num.html#VALapprox_num_exp"><code class="code"><span class="constructor">Num</span>.approx_num_exp</code></a>.<br>
</div>

<pre><span id="VALapprox_num_exp"><span class="keyword">val</span> approx_num_exp</span> : <code class="type">int -&gt; <a href="Num.html#TYPEnum">num</a> -&gt; string</code></pre><div class="info ">
Approximate a number by a decimal. The first argument is the
   required precision. The second argument is the number to
   approximate. <a href="Num.html#VALapprox_num_fix"><code class="code"><span class="constructor">Num</span>.approx_num_fix</code></a> uses decimal notation; the first
   argument is the number of digits after the decimal point.
   <code class="code">approx_num_exp</code> uses scientific (exponential) notation; the
   first argument is the number of digits in the mantissa.<br>
</div>

<pre><span id="VALnum_of_string"><span class="keyword">val</span> num_of_string</span> : <code class="type">string -&gt; <a href="Num.html#TYPEnum">num</a></code></pre><div class="info ">
Convert a string to a number.
   Raise <code class="code"><span class="constructor">Failure</span> <span class="string">"num_of_string"</span></code> if the given string is not
   a valid representation of an integer<br>
</div>
<br>
<h6 id="6_Coercionsbetweennumericaltypes">Coercions between numerical types</h6><br>

<pre><span id="VALint_of_num"><span class="keyword">val</span> int_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; int</code></pre>
<pre><span id="VALnum_of_int"><span class="keyword">val</span> num_of_int</span> : <code class="type">int -&gt; <a href="Num.html#TYPEnum">num</a></code></pre>
<pre><span id="VALnat_of_num"><span class="keyword">val</span> nat_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; Nat.nat</code></pre>
<pre><span id="VALnum_of_nat"><span class="keyword">val</span> num_of_nat</span> : <code class="type">Nat.nat -&gt; <a href="Num.html#TYPEnum">num</a></code></pre>
<pre><span id="VALnum_of_big_int"><span class="keyword">val</span> num_of_big_int</span> : <code class="type"><a href="Big_int.html#TYPEbig_int">Big_int.big_int</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre>
<pre><span id="VALbig_int_of_num"><span class="keyword">val</span> big_int_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Big_int.html#TYPEbig_int">Big_int.big_int</a></code></pre>
<pre><span id="VALratio_of_num"><span class="keyword">val</span> ratio_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; <a href="Ratio.html#TYPEratio">Ratio.ratio</a></code></pre>
<pre><span id="VALnum_of_ratio"><span class="keyword">val</span> num_of_ratio</span> : <code class="type"><a href="Ratio.html#TYPEratio">Ratio.ratio</a> -&gt; <a href="Num.html#TYPEnum">num</a></code></pre>
<pre><span id="VALfloat_of_num"><span class="keyword">val</span> float_of_num</span> : <code class="type"><a href="Num.html#TYPEnum">num</a> -&gt; float</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>