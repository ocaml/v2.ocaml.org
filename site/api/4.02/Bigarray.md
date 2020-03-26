<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Bigarray</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Bigarray.html">Bigarray</a></h1>

<pre><span class="keyword">module</span> Bigarray: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Large, multi-dimensional, numerical arrays.
<p>

   This module implements multi-dimensional arrays of integers and
   floating-point numbers, thereafter referred to as 'big arrays'.
   The implementation allows efficient sharing of large numerical
   arrays between OCaml code and C or Fortran numerical libraries.
</p><p>

   Concerning the naming conventions, users of this module are encouraged
   to do <code class="code"><span class="keyword">open</span> <span class="constructor">Bigarray</span></code> in their source, then refer to array types and
   operations via short dot notation, e.g. <code class="code"><span class="constructor">Array1</span>.t</code> or <code class="code"><span class="constructor">Array2</span>.sub</code>.
</p><p>

   Big arrays support all the OCaml ad-hoc polymorphic operations:</p><ul>
<li>comparisons (<code class="code">=</code>, <code class="code">&lt;&gt;</code>, <code class="code">&lt;=</code>, etc, as well as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>);</li>
<li>hashing (module <code class="code"><span class="constructor">Hash</span></code>);</li>
<li>and structured input-output (the functions from the
     <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a> module, as well as <a href="Pervasives.html#VALoutput_value"><code class="code">output_value</code></a>
     and <a href="Pervasives.html#VALinput_value"><code class="code">input_value</code></a>).</li>
</ul>
<br>
</div>
<hr width="100%">
<br>
<h6 id="6_Elementkinds">Element kinds</h6><br>
<br>
Big arrays can contain elements of the following kinds:<ul>
<li>IEEE single precision (32 bits) floating-point numbers
   (<a href="Bigarray.html#TYPEfloat32_elt"><code class="code"><span class="constructor">Bigarray</span>.float32_elt</code></a>),</li>
<li>IEEE double precision (64 bits) floating-point numbers
   (<a href="Bigarray.html#TYPEfloat64_elt"><code class="code"><span class="constructor">Bigarray</span>.float64_elt</code></a>),</li>
<li>IEEE single precision (2 * 32 bits) floating-point complex numbers
   (<a href="Bigarray.html#TYPEcomplex32_elt"><code class="code"><span class="constructor">Bigarray</span>.complex32_elt</code></a>),</li>
<li>IEEE double precision (2 * 64 bits) floating-point complex numbers
   (<a href="Bigarray.html#TYPEcomplex64_elt"><code class="code"><span class="constructor">Bigarray</span>.complex64_elt</code></a>),</li>
<li>8-bit integers (signed or unsigned)
   (<a href="Bigarray.html#TYPEint8_signed_elt"><code class="code"><span class="constructor">Bigarray</span>.int8_signed_elt</code></a> or <a href="Bigarray.html#TYPEint8_unsigned_elt"><code class="code"><span class="constructor">Bigarray</span>.int8_unsigned_elt</code></a>),</li>
<li>16-bit integers (signed or unsigned)
   (<a href="Bigarray.html#TYPEint16_signed_elt"><code class="code"><span class="constructor">Bigarray</span>.int16_signed_elt</code></a> or <a href="Bigarray.html#TYPEint16_unsigned_elt"><code class="code"><span class="constructor">Bigarray</span>.int16_unsigned_elt</code></a>),</li>
<li>OCaml integers (signed, 31 bits on 32-bit architectures,
   63 bits on 64-bit architectures) (<a href="Bigarray.html#TYPEint_elt"><code class="code"><span class="constructor">Bigarray</span>.int_elt</code></a>),</li>
<li>32-bit signed integer (<a href="Bigarray.html#TYPEint32_elt"><code class="code"><span class="constructor">Bigarray</span>.int32_elt</code></a>),</li>
<li>64-bit signed integers (<a href="Bigarray.html#TYPEint64_elt"><code class="code"><span class="constructor">Bigarray</span>.int64_elt</code></a>),</li>
<li>platform-native signed integers (32 bits on 32-bit architectures,
   64 bits on 64-bit architectures) (<a href="Bigarray.html#TYPEnativeint_elt"><code class="code"><span class="constructor">Bigarray</span>.nativeint_elt</code></a>).</li>
</ul>

   Each element kind is represented at the type level by one of the
   <code class="code">*_elt</code> types defined below (defined with a single constructor instead
   of abstract types for technical injectivity reasons).<br>

<pre><code><span id="TYPEfloat32_elt"><span class="keyword">type</span> <code class="type"></code>float32_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfloat32_elt.Float32_elt"><span class="constructor">Float32_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEfloat64_elt"><span class="keyword">type</span> <code class="type"></code>float64_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfloat64_elt.Float64_elt"><span class="constructor">Float64_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint8_signed_elt"><span class="keyword">type</span> <code class="type"></code>int8_signed_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint8_signed_elt.Int8_signed_elt"><span class="constructor">Int8_signed_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint8_unsigned_elt"><span class="keyword">type</span> <code class="type"></code>int8_unsigned_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint8_unsigned_elt.Int8_unsigned_elt"><span class="constructor">Int8_unsigned_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint16_signed_elt"><span class="keyword">type</span> <code class="type"></code>int16_signed_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint16_signed_elt.Int16_signed_elt"><span class="constructor">Int16_signed_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint16_unsigned_elt"><span class="keyword">type</span> <code class="type"></code>int16_unsigned_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint16_unsigned_elt.Int16_unsigned_elt"><span class="constructor">Int16_unsigned_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint32_elt"><span class="keyword">type</span> <code class="type"></code>int32_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint32_elt.Int32_elt"><span class="constructor">Int32_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint64_elt"><span class="keyword">type</span> <code class="type"></code>int64_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint64_elt.Int64_elt"><span class="constructor">Int64_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEint_elt"><span class="keyword">type</span> <code class="type"></code>int_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTint_elt.Int_elt"><span class="constructor">Int_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEnativeint_elt"><span class="keyword">type</span> <code class="type"></code>nativeint_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnativeint_elt.Nativeint_elt"><span class="constructor">Nativeint_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEcomplex32_elt"><span class="keyword">type</span> <code class="type"></code>complex32_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcomplex32_elt.Complex32_elt"><span class="constructor">Complex32_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEcomplex64_elt"><span class="keyword">type</span> <code class="type"></code>complex64_elt</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcomplex64_elt.Complex64_elt"><span class="constructor">Complex64_elt</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEkind"><span class="keyword">type</span> <code class="type">('a, 'b)</code> kind</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Float32"><span class="constructor">Float32</span></span> <span class="keyword">:</span> <code class="type">(float, <a href="Bigarray.html#TYPEfloat32_elt">float32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Float64"><span class="constructor">Float64</span></span> <span class="keyword">:</span> <code class="type">(float, <a href="Bigarray.html#TYPEfloat64_elt">float64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int8_signed"><span class="constructor">Int8_signed</span></span> <span class="keyword">:</span> <code class="type">(int, <a href="Bigarray.html#TYPEint8_signed_elt">int8_signed_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int8_unsigned"><span class="constructor">Int8_unsigned</span></span> <span class="keyword">:</span> <code class="type">(int, <a href="Bigarray.html#TYPEint8_unsigned_elt">int8_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int16_signed"><span class="constructor">Int16_signed</span></span> <span class="keyword">:</span> <code class="type">(int, <a href="Bigarray.html#TYPEint16_signed_elt">int16_signed_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int16_unsigned"><span class="constructor">Int16_unsigned</span></span> <span class="keyword">:</span> <code class="type">(int, <a href="Bigarray.html#TYPEint16_unsigned_elt">int16_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int32"><span class="constructor">Int32</span></span> <span class="keyword">:</span> <code class="type">(int32, <a href="Bigarray.html#TYPEint32_elt">int32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int64"><span class="constructor">Int64</span></span> <span class="keyword">:</span> <code class="type">(int64, <a href="Bigarray.html#TYPEint64_elt">int64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Int"><span class="constructor">Int</span></span> <span class="keyword">:</span> <code class="type">(int, <a href="Bigarray.html#TYPEint_elt">int_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Nativeint"><span class="constructor">Nativeint</span></span> <span class="keyword">:</span> <code class="type">(nativeint, <a href="Bigarray.html#TYPEnativeint_elt">nativeint_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Complex32"><span class="constructor">Complex32</span></span> <span class="keyword">:</span> <code class="type">(<a href="Complex.html#TYPEt">Complex.t</a>, <a href="Bigarray.html#TYPEcomplex32_elt">complex32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Complex64"><span class="constructor">Complex64</span></span> <span class="keyword">:</span> <code class="type">(<a href="Complex.html#TYPEt">Complex.t</a>, <a href="Bigarray.html#TYPEcomplex64_elt">complex64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTkind.Char"><span class="constructor">Char</span></span> <span class="keyword">:</span> <code class="type">(char, <a href="Bigarray.html#TYPEint8_unsigned_elt">int8_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
To each element kind is associated an OCaml type, which is
   the type of OCaml values that can be stored in the big array
   or read back from it.  This type is not necessarily the same
   as the type of the array elements proper: for instance,
   a big array whose elements are of kind <code class="code">float32_elt</code> contains
   32-bit single precision floats, but reading or writing one of
   its elements from OCaml uses the OCaml type <code class="code">float</code>, which is
   64-bit double precision floats.
<p>

   The GADT type <code class="code">(<span class="keywordsign">'</span>a, <span class="keywordsign">'</span>b) kind</code> captures this association
   of an OCaml type <code class="code"><span class="keywordsign">'</span>a</code> for values read or written in the big array,
   and of an element kind <code class="code"><span class="keywordsign">'</span>b</code> which represents the actual contents
   of the big array. Its constructors list all possible associations
   of OCaml types with element kinds, and are re-exported below for
   backward-compatibility reasons.
</p><p>

   Using a generalized algebraic datatype (GADT) here allows to write
   well-typed polymorphic functions whose return type depend on the
   argument type, such as:
</p><p>

</p><pre class="codepre"><code class="code">&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;zero&nbsp;:&nbsp;<span class="keyword">type</span>&nbsp;a&nbsp;b.&nbsp;(a,&nbsp;b)&nbsp;kind&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;a&nbsp;=&nbsp;<span class="keyword">function</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Float32</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0.0&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Complex32</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Complex</span>.zero<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Float64</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0.0&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Complex64</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Complex</span>.zero<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int8_signed</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int8_unsigned</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int16_signed</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int16_unsigned</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int32</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0l&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int64</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0<span class="constructor">L</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Nativeint</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;0n<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Char</span>&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="string">'\000'</span><br>
</code></pre><br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>



<pre><span id="VALfloat32"><span class="keyword">val</span> float32</span> : <code class="type">(float, <a href="Bigarray.html#TYPEfloat32_elt">float32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALfloat64"><span class="keyword">val</span> float64</span> : <code class="type">(float, <a href="Bigarray.html#TYPEfloat64_elt">float64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALcomplex32"><span class="keyword">val</span> complex32</span> : <code class="type">(<a href="Complex.html#TYPEt">Complex.t</a>, <a href="Bigarray.html#TYPEcomplex32_elt">complex32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALcomplex64"><span class="keyword">val</span> complex64</span> : <code class="type">(<a href="Complex.html#TYPEt">Complex.t</a>, <a href="Bigarray.html#TYPEcomplex64_elt">complex64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint8_signed"><span class="keyword">val</span> int8_signed</span> : <code class="type">(int, <a href="Bigarray.html#TYPEint8_signed_elt">int8_signed_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint8_unsigned"><span class="keyword">val</span> int8_unsigned</span> : <code class="type">(int, <a href="Bigarray.html#TYPEint8_unsigned_elt">int8_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint16_signed"><span class="keyword">val</span> int16_signed</span> : <code class="type">(int, <a href="Bigarray.html#TYPEint16_signed_elt">int16_signed_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint16_unsigned"><span class="keyword">val</span> int16_unsigned</span> : <code class="type">(int, <a href="Bigarray.html#TYPEint16_unsigned_elt">int16_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint"><span class="keyword">val</span> int</span> : <code class="type">(int, <a href="Bigarray.html#TYPEint_elt">int_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint32"><span class="keyword">val</span> int32</span> : <code class="type">(int32, <a href="Bigarray.html#TYPEint32_elt">int32_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALint64"><span class="keyword">val</span> int64</span> : <code class="type">(int64, <a href="Bigarray.html#TYPEint64_elt">int64_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALnativeint"><span class="keyword">val</span> nativeint</span> : <code class="type">(nativeint, <a href="Bigarray.html#TYPEnativeint_elt">nativeint_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
See <a href="Bigarray.html#VALchar"><code class="code"><span class="constructor">Bigarray</span>.char</code></a>.<br>
</div>

<pre><span id="VALchar"><span class="keyword">val</span> char</span> : <code class="type">(char, <a href="Bigarray.html#TYPEint8_unsigned_elt">int8_unsigned_elt</a>) <a href="Bigarray.html#TYPEkind">kind</a></code></pre><div class="info ">
As shown by the types of the values above,
   big arrays of kind <code class="code">float32_elt</code> and <code class="code">float64_elt</code> are
   accessed using the OCaml type <code class="code">float</code>.  Big arrays of complex kinds
   <code class="code">complex32_elt</code>, <code class="code">complex64_elt</code> are accessed with the OCaml type
   <a href="Complex.html#TYPEt"><code class="code"><span class="constructor">Complex</span>.t</code></a>. Big arrays of
   integer kinds are accessed using the smallest OCaml integer
   type large enough to represent the array elements:
   <code class="code">int</code> for 8- and 16-bit integer bigarrays, as well as OCaml-integer
   bigarrays; <code class="code">int32</code> for 32-bit integer bigarrays; <code class="code">int64</code>
   for 64-bit integer bigarrays; and <code class="code">nativeint</code> for
   platform-native integer bigarrays.  Finally, big arrays of
   kind <code class="code">int8_unsigned_elt</code> can also be accessed as arrays of
   characters instead of arrays of small integers, by using
   the kind value <code class="code">char</code> instead of <code class="code">int8_unsigned</code>.<br>
</div>
<br>
<h6 id="6_Arraylayouts">Array layouts</h6><br>

<pre><code><span id="TYPEc_layout"><span class="keyword">type</span> <code class="type"></code>c_layout</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTc_layout.C_layout_typ"><span class="constructor">C_layout_typ</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
See <a href="Bigarray.html#VALfortran_layout"><code class="code"><span class="constructor">Bigarray</span>.fortran_layout</code></a>.<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>



<pre><code><span id="TYPEfortran_layout"><span class="keyword">type</span> <code class="type"></code>fortran_layout</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTfortran_layout.Fortran_layout_typ"><span class="constructor">Fortran_layout_typ</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
To facilitate interoperability with existing C and Fortran code,
   this library supports two different memory layouts for big arrays,
   one compatible with the C conventions,
   the other compatible with the Fortran conventions.
<p>

   In the C-style layout, array indices start at 0, and
   multi-dimensional arrays are laid out in row-major format.
   That is, for a two-dimensional array, all elements of
   row 0 are contiguous in memory, followed by all elements of
   row 1, etc.  In other terms, the array elements at <code class="code">(x,y)</code>
   and <code class="code">(x, y+1)</code> are adjacent in memory.
</p><p>

   In the Fortran-style layout, array indices start at 1, and
   multi-dimensional arrays are laid out in column-major format.
   That is, for a two-dimensional array, all elements of
   column 0 are contiguous in memory, followed by all elements of
   column 1, etc.  In other terms, the array elements at <code class="code">(x,y)</code>
   and <code class="code">(x+1, y)</code> are adjacent in memory.
</p><p>

   Each layout style is identified at the type level by the
   phantom types <a href="Bigarray.html#VALc_layout"><code class="code"><span class="constructor">Bigarray</span>.c_layout</code></a> and <a href="Bigarray.html#VALfortran_layout"><code class="code"><span class="constructor">Bigarray</span>.fortran_layout</code></a>
   respectively.<br>
</p></div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>


<br>
<div class="h7" id="7_Supportedlayouts">Supported layouts</div>
<p>

   The GADT type <code class="code"><span class="keywordsign">'</span>a layout</code> represents one of the two supported
   memory layouts: C-style or Fortran-style. Its constructors are
   re-exported as values below for backward-compatibility reasons.<br>

</p><pre><code><span id="TYPElayout"><span class="keyword">type</span> <code class="type">'a</code> layout</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlayout.C_layout"><span class="constructor">C_layout</span></span> <span class="keyword">:</span> <code class="type"><a href="Bigarray.html#TYPEc_layout">c_layout</a> <a href="Bigarray.html#TYPElayout">layout</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlayout.Fortran_layout"><span class="constructor">Fortran_layout</span></span> <span class="keyword">:</span> <code class="type"><a href="Bigarray.html#TYPEfortran_layout">fortran_layout</a> <a href="Bigarray.html#TYPElayout">layout</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALc_layout"><span class="keyword">val</span> c_layout</span> : <code class="type"><a href="Bigarray.html#TYPEc_layout">c_layout</a> <a href="Bigarray.html#TYPElayout">layout</a></code></pre>
<pre><span id="VALfortran_layout"><span class="keyword">val</span> fortran_layout</span> : <code class="type"><a href="Bigarray.html#TYPEfortran_layout">fortran_layout</a> <a href="Bigarray.html#TYPElayout">layout</a></code></pre><br>
<h6 id="6_Genericarraysofarbitrarilymanydimensions">Generic arrays (of arbitrarily many dimensions)</h6><br>

<pre><span class="keyword">module</span> <a href="Bigarray.Genarray.html">Genarray</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Genarray.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><br>
<h6 id="6_Onedimensionalarrays">One-dimensional arrays</h6><br>

<pre><span class="keyword">module</span> <a href="Bigarray.Array1.html">Array1</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array1.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
One-dimensional arrays.
</div>
<br>
<h6 id="6_Twodimensionalarrays">Two-dimensional arrays</h6><br>

<pre><span class="keyword">module</span> <a href="Bigarray.Array2.html">Array2</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array2.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Two-dimensional arrays.
</div>
<br>
<h6 id="6_Threedimensionalarrays">Three-dimensional arrays</h6><br>

<pre><span class="keyword">module</span> <a href="Bigarray.Array3.html">Array3</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Bigarray.Array3.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Three-dimensional arrays.
</div>
<br>
<h6 id="6_Coercionsbetweengenericbigarraysandfixeddimensionbigarrays">Coercions between generic big arrays and fixed-dimension big arrays</h6><br>

<pre><span id="VALgenarray_of_array1"><span class="keyword">val</span> genarray_of_array1</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">Array1.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a></code></pre><div class="info ">
Return the generic big array corresponding to the given one-dimensional
   big array.<br>
</div>

<pre><span id="VALgenarray_of_array2"><span class="keyword">val</span> genarray_of_array2</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">Array2.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a></code></pre><div class="info ">
Return the generic big array corresponding to the given two-dimensional
   big array.<br>
</div>

<pre><span id="VALgenarray_of_array3"><span class="keyword">val</span> genarray_of_array3</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">Array3.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a></code></pre><div class="info ">
Return the generic big array corresponding to the given three-dimensional
   big array.<br>
</div>

<pre><span id="VALarray1_of_genarray"><span class="keyword">val</span> array1_of_genarray</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">Array1.t</a></code></pre><div class="info ">
Return the one-dimensional big array corresponding to the given
   generic big array.  Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the generic big array
   does not have exactly one dimension.<br>
</div>

<pre><span id="VALarray2_of_genarray"><span class="keyword">val</span> array2_of_genarray</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">Array2.t</a></code></pre><div class="info ">
Return the two-dimensional big array corresponding to the given
   generic big array.  Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the generic big array
   does not have exactly two dimensions.<br>
</div>

<pre><span id="VALarray3_of_genarray"><span class="keyword">val</span> array3_of_genarray</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">Array3.t</a></code></pre><div class="info ">
Return the three-dimensional big array corresponding to the given
   generic big array.  Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if the generic big array
   does not have exactly three dimensions.<br>
</div>
<br>
<h6 id="6_Reshapingbigarrays">Re-shaping big arrays</h6><br>

<pre><span id="VALreshape"><span class="keyword">val</span> reshape</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt;<br>       int array -&gt; ('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a></code></pre><div class="info ">
<code class="code">reshape b [|d1;...;dN|]</code> converts the big array <code class="code">b</code> to a
   <code class="code"><span class="constructor">N</span></code>-dimensional array of dimensions <code class="code">d1</code>...<code class="code">dN</code>.  The returned
   array and the original array <code class="code">b</code> share their data
   and have the same layout.  For instance, assuming that <code class="code">b</code>
   is a one-dimensional array of dimension 12, <code class="code">reshape b [|3;4|]</code>
   returns a two-dimensional array <code class="code">b'</code> of dimensions 3 and 4.
   If <code class="code">b</code> has C layout, the element <code class="code">(x,y)</code> of <code class="code">b'</code> corresponds
   to the element <code class="code">x * 3 + y</code> of <code class="code">b</code>.  If <code class="code">b</code> has Fortran layout,
   the element <code class="code">(x,y)</code> of <code class="code">b'</code> corresponds to the element
   <code class="code">x + (y - 1) * 4</code> of <code class="code">b</code>.
   The returned big array must have exactly the same number of
   elements as the original big array <code class="code">b</code>.  That is, the product
   of the dimensions of <code class="code">b</code> must be equal to <code class="code">i1 * ... * iN</code>.
   Otherwise, <code class="code"><span class="constructor">Invalid_argument</span></code> is raised.<br>
</div>

<pre><span id="VALreshape_1"><span class="keyword">val</span> reshape_1</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array1.html#TYPEt">Array1.t</a></code></pre><div class="info ">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   one-dimensional arrays.<br>
</div>

<pre><span id="VALreshape_2"><span class="keyword">val</span> reshape_2</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt;<br>       int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array2.html#TYPEt">Array2.t</a></code></pre><div class="info ">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   two-dimensional arrays.<br>
</div>

<pre><span id="VALreshape_3"><span class="keyword">val</span> reshape_3</span> : <code class="type">('a, 'b, 'c) <a href="Bigarray.Genarray.html#TYPEt">Genarray.t</a> -&gt;<br>       int -&gt; int -&gt; int -&gt; ('a, 'b, 'c) <a href="Bigarray.Array3.html#TYPEt">Array3.t</a></code></pre><div class="info ">
Specialized version of <a href="Bigarray.html#VALreshape"><code class="code"><span class="constructor">Bigarray</span>.reshape</code></a> for reshaping to
   three-dimensional arrays.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>