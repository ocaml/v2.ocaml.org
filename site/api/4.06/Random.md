<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Random</a></div><ul><li><a href="#1_Basicfunctions">Basic functions</a></li><li><a href="#1_Advancedfunctions">Advanced functions</a></li></ul></nav></header>

<h1>Module <a href="type_Random.html">Random</a></h1>

<pre><span id="MODULERandom"><span class="keyword">module</span> Random</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Random.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Pseudo-random number generators (PRNG).</p>
</div>
</div>
<hr width="100%">
<h2 id="1_Basicfunctions">Basic functions</h2>
<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Initialize the generator, using the argument as a seed.
     The same seed will always yield the same sequence of numbers.</p>
</div>
</div>

<pre><span id="VALfull_init"><span class="keyword">val</span> full_init</span> : <code class="type">int array -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Same as <a href="Random.html#VALinit"><code class="code"><span class="constructor">Random</span>.init</code></a> but takes more data as seed.</p>
</div>
</div>

<pre><span id="VALself_init"><span class="keyword">val</span> self_init</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Initialize the generator with a random seed chosen
   in a system-dependent way.  If <code class="code">/dev/urandom</code> is available on
   the host machine, it is used to provide a highly random initial
   seed.  Otherwise, a less random seed is computed from system
   parameters (current time, process IDs).</p>
</div>
</div>

<pre><span id="VALbits"><span class="keyword">val</span> bits</span> : <code class="type">unit -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return 30 random bits in a nonnegative integer.</p>
</div>
<ul class="info-attributes">
<li><b>Before 3.12.0 </b> used a different algorithm (affects all the following
                   functions)</li>
</ul>
</div>

<pre><span id="VALint"><span class="keyword">val</span> int</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.int&nbsp;bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).  <code class="code">bound</code> must be greater than 0 and less
     than 2<sup class="superscript">30</sup>.</p>
</div>
</div>

<pre><span id="VALint32"><span class="keyword">val</span> int32</span> : <code class="type"><a href="Int32.html#TYPEt">Int32.t</a> -&gt; <a href="Int32.html#TYPEt">Int32.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.int32&nbsp;bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).  <code class="code">bound</code> must be greater than 0.</p>
</div>
</div>

<pre><span id="VALnativeint"><span class="keyword">val</span> nativeint</span> : <code class="type"><a href="Nativeint.html#TYPEt">Nativeint.t</a> -&gt; <a href="Nativeint.html#TYPEt">Nativeint.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.nativeint&nbsp;bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).  <code class="code">bound</code> must be greater than 0.</p>
</div>
</div>

<pre><span id="VALint64"><span class="keyword">val</span> int64</span> : <code class="type"><a href="Int64.html#TYPEt">Int64.t</a> -&gt; <a href="Int64.html#TYPEt">Int64.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.int64&nbsp;bound</code> returns a random integer between 0 (inclusive)
     and <code class="code">bound</code> (exclusive).  <code class="code">bound</code> must be greater than 0.</p>
</div>
</div>

<pre><span id="VALfloat"><span class="keyword">val</span> float</span> : <code class="type">float -&gt; float</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.float&nbsp;bound</code> returns a random floating-point number
   between 0 and <code class="code">bound</code> (inclusive).  If <code class="code">bound</code> is
   negative, the result is negative or zero.  If <code class="code">bound</code> is 0,
   the result is 0.</p>
</div>
</div>

<pre><span id="VALbool"><span class="keyword">val</span> bool</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Random</span>.bool&nbsp;()</code> returns <code class="code"><span class="keyword">true</span></code> or <code class="code"><span class="keyword">false</span></code> with probability 0.5 each.</p>
</div>
</div>
<h2 id="1_Advancedfunctions">Advanced functions</h2><p>The functions from module <a href="Random.State.html"><code class="code"><span class="constructor">Random</span>.<span class="constructor">State</span></code></a> manipulate the current state
    of the random generator explicitly.
    This allows using one or several deterministic PRNGs,
    even in a multi-threaded program, without interference from
    other parts of the program.</p>

<pre><span id="MODULEState"><span class="keyword">module</span> <a href="Random.State.html">State</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Random.State.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALget_state"><span class="keyword">val</span> get_state</span> : <code class="type">unit -&gt; <a href="Random.State.html#TYPEt">State.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the current state of the generator used by the basic functions.</p>
</div>
</div>

<pre><span id="VALset_state"><span class="keyword">val</span> set_state</span> : <code class="type"><a href="Random.State.html#TYPEt">State.t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Set the state of the generator used by the basic functions.</p>
</div>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>