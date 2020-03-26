<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Arith_status</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Arith_status.html">Arith_status</a></h1>

<pre><span class="keyword">module</span> Arith_status: <code class="code"><span class="keyword">sig</span></code> <a href="Arith_status.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Flags that control rational arithmetic.<br>
</div>
<hr width="100%">

<pre><span id="VALarith_status"><span class="keyword">val</span> arith_status</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Print the current status of the arithmetic flags.<br>
</div>

<pre><span id="VALget_error_when_null_denominator"><span class="keyword">val</span> get_error_when_null_denominator</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
See <a href="Arith_status.html#VALset_error_when_null_denominator"><code class="code"><span class="constructor">Arith_status</span>.set_error_when_null_denominator</code></a>.<br>
</div>

<pre><span id="VALset_error_when_null_denominator"><span class="keyword">val</span> set_error_when_null_denominator</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Get or set the flag <code class="code">null_denominator</code>. When on, attempting to
           create a rational with a null denominator raises an exception.
           When off, rationals with null denominators are accepted.
           Initially: on.<br>
</div>

<pre><span id="VALget_normalize_ratio"><span class="keyword">val</span> get_normalize_ratio</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
See <a href="Arith_status.html#VALset_normalize_ratio"><code class="code"><span class="constructor">Arith_status</span>.set_normalize_ratio</code></a>.<br>
</div>

<pre><span id="VALset_normalize_ratio"><span class="keyword">val</span> set_normalize_ratio</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Get or set the flag <code class="code">normalize_ratio</code>. When on, rational
           numbers are normalized after each operation. When off,
           rational numbers are not normalized until printed.
           Initially: off.<br>
</div>

<pre><span id="VALget_normalize_ratio_when_printing"><span class="keyword">val</span> get_normalize_ratio_when_printing</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
See <a href="Arith_status.html#VALset_normalize_ratio_when_printing"><code class="code"><span class="constructor">Arith_status</span>.set_normalize_ratio_when_printing</code></a>.<br>
</div>

<pre><span id="VALset_normalize_ratio_when_printing"><span class="keyword">val</span> set_normalize_ratio_when_printing</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Get or set the flag <code class="code">normalize_ratio_when_printing</code>.
           When on, rational numbers are normalized before being printed.
           When off, rational numbers are printed as is, without normalization.
           Initially: on.<br>
</div>

<pre><span id="VALget_approx_printing"><span class="keyword">val</span> get_approx_printing</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
See <a href="Arith_status.html#VALset_approx_printing"><code class="code"><span class="constructor">Arith_status</span>.set_approx_printing</code></a>.<br>
</div>

<pre><span id="VALset_approx_printing"><span class="keyword">val</span> set_approx_printing</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
Get or set the flag <code class="code">approx_printing</code>.
           When on, rational numbers are printed as a decimal approximation.
           When off, rational numbers are printed as a fraction.
           Initially: off.<br>
</div>

<pre><span id="VALget_floating_precision"><span class="keyword">val</span> get_floating_precision</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
See <a href="Arith_status.html#VALset_floating_precision"><code class="code"><span class="constructor">Arith_status</span>.set_floating_precision</code></a>.<br>
</div>

<pre><span id="VALset_floating_precision"><span class="keyword">val</span> set_floating_precision</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
Get or set the parameter <code class="code">floating_precision</code>.
           This parameter is the number of digits displayed when
           <code class="code">approx_printing</code> is on.
           Initially: 12.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>