<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Complex</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Complex.html">Complex</a></h1>

<pre><span id="MODULEComplex"><span class="keyword">module</span> Complex</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Complex.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Complex numbers.</p>

<p>This module provides arithmetic operations on complex numbers.
    Complex numbers are represented by their real and imaginary parts
    (cartesian representation).  Each part is represented by a
    double-precision floating-point number (type <code class="code">float</code>).</p>
</div>
</div>
<hr width="100%">

<pre><code><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.re">re</span>&nbsp;: <code class="type">float</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.im">im</span>&nbsp;: <code class="type">float</code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
<div class="info-desc">
<p>The type of complex numbers.  <code class="code">re</code> is the real part and <code class="code">im</code> the
    imaginary part.</p>
</div>
</div>


<pre><span id="VALzero"><span class="keyword">val</span> zero</span> : <code class="type"><a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The complex number <code class="code">0</code>.</p>
</div>
</div>

<pre><span id="VALone"><span class="keyword">val</span> one</span> : <code class="type"><a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The complex number <code class="code">1</code>.</p>
</div>
</div>

<pre><span id="VALi"><span class="keyword">val</span> i</span> : <code class="type"><a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The complex number <code class="code">i</code>.</p>
</div>
</div>

<pre><span id="VALneg"><span class="keyword">val</span> neg</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Unary negation.</p>
</div>
</div>

<pre><span id="VALconj"><span class="keyword">val</span> conj</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Conjugate: given the complex <code class="code">x&nbsp;+&nbsp;i.y</code>, returns <code class="code">x&nbsp;-&nbsp;i.y</code>.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Addition</p>
</div>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Subtraction</p>
</div>
</div>

<pre><span id="VALmul"><span class="keyword">val</span> mul</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Multiplication</p>
</div>
</div>

<pre><span id="VALinv"><span class="keyword">val</span> inv</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Multiplicative inverse (<code class="code">1/z</code>).</p>
</div>
</div>

<pre><span id="VALdiv"><span class="keyword">val</span> div</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Division</p>
</div>
</div>

<pre><span id="VALsqrt"><span class="keyword">val</span> sqrt</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Square root.  The result <code class="code">x&nbsp;+&nbsp;i.y</code> is such that <code class="code">x&nbsp;&gt;&nbsp;0</code> or
    <code class="code">x&nbsp;=&nbsp;0</code> and <code class="code">y&nbsp;&gt;=&nbsp;0</code>.
    This function has a discontinuity along the negative real axis.</p>
</div>
</div>

<pre><span id="VALnorm2"><span class="keyword">val</span> norm2</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p>Norm squared: given <code class="code">x&nbsp;+&nbsp;i.y</code>, returns <code class="code">x^2&nbsp;+&nbsp;y^2</code>.</p>
</div>
</div>

<pre><span id="VALnorm"><span class="keyword">val</span> norm</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p>Norm: given <code class="code">x&nbsp;+&nbsp;i.y</code>, returns <code class="code">sqrt(x^2&nbsp;+&nbsp;y^2)</code>.</p>
</div>
</div>

<pre><span id="VALarg"><span class="keyword">val</span> arg</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p>Argument.  The argument of a complex number is the angle
    in the complex plane between the positive real axis and a line
    passing through zero and the number.  This angle ranges from
    <code class="code">-pi</code> to <code class="code">pi</code>.  This function has a discontinuity along the
    negative real axis.</p>
</div>
</div>

<pre><span id="VALpolar"><span class="keyword">val</span> polar</span> : <code class="type">float -&gt; float -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">polar&nbsp;norm&nbsp;arg</code> returns the complex having norm <code class="code">norm</code>
    and argument <code class="code">arg</code>.</p>
</div>
</div>

<pre><span id="VALexp"><span class="keyword">val</span> exp</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Exponentiation.  <code class="code">exp&nbsp;z</code> returns <code class="code">e</code> to the <code class="code">z</code> power.</p>
</div>
</div>

<pre><span id="VALlog"><span class="keyword">val</span> log</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Natural logarithm (in base <code class="code">e</code>).</p>
</div>
</div>

<pre><span id="VALpow"><span class="keyword">val</span> pow</span> : <code class="type"><a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a> -&gt; <a href="Complex.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Power function.  <code class="code">pow&nbsp;z1&nbsp;z2</code> returns <code class="code">z1</code> to the <code class="code">z2</code> power.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>