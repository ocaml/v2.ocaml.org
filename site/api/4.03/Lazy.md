<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Lazy</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Lazy.html">Lazy</a></h1>

<pre><span class="keyword">module</span> Lazy: <code class="code"><span class="keyword">sig</span></code> <a href="Lazy.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Deferred computations.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a lazy_t</code> </pre>
<div class="info ">
A value of type <code class="code"><span class="keywordsign">'</span>a <span class="constructor">Lazy</span>.t</code> is a deferred computation, called
   a suspension, that has a result of type <code class="code"><span class="keywordsign">'</span>a</code>.  The special
   expression syntax <code class="code"><span class="keyword">lazy</span> (expr)</code> makes a suspension of the
   computation of <code class="code">expr</code>, without computing <code class="code">expr</code> itself yet.
   "Forcing" the suspension will then compute <code class="code">expr</code> and return its
   result.
<p>

   Note: <code class="code">lazy_t</code> is the built-in type constructor used by the compiler
   for the <code class="code"><span class="keyword">lazy</span></code> keyword.  You should not use it directly.  Always use
   <code class="code"><span class="constructor">Lazy</span>.t</code> instead.
</p><p>

   Note: <code class="code"><span class="constructor">Lazy</span>.force</code> is not thread-safe.  If you use this module in
   a multi-threaded program, you will need to add some locks.
</p><p>

   Note: if the program is compiled with the <code class="code">-rectypes</code> option,
   ill-founded recursive definitions of the form <code class="code"><span class="keyword">let</span> <span class="keyword">rec</span> x = <span class="keyword">lazy</span> x</code>
   or <code class="code"><span class="keyword">let</span> <span class="keyword">rec</span> x = <span class="keyword">lazy</span>(<span class="keyword">lazy</span>(...(<span class="keyword">lazy</span> x)))</code> are accepted by the type-checker
   and lead, when forced, to ill-formed values that trigger infinite
   loops in the garbage collector and other parts of the run-time system.
   Without the <code class="code">-rectypes</code> option, such ill-founded recursive definitions
   are rejected by the type-checker.<br>
</p></div>


<pre><span id="EXCEPTIONUndefined"><span class="keyword">exception</span> Undefined</span></pre>

<pre><span id="VALforce"><span class="keyword">val</span> force</span> : <code class="type">'a <a href="Lazy.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">force x</code> forces the suspension <code class="code">x</code> and returns its result.
   If <code class="code">x</code> has already been forced, <code class="code"><span class="constructor">Lazy</span>.force x</code> returns the
   same value again without recomputing it.  If it raised an exception,
   the same exception is raised again.
   Raise <code class="code"><span class="constructor">Undefined</span></code> if the forcing of <code class="code">x</code> tries to force <code class="code">x</code> itself
   recursively.<br>
</div>

<pre><span id="VALforce_val"><span class="keyword">val</span> force_val</span> : <code class="type">'a <a href="Lazy.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">force_val x</code> forces the suspension <code class="code">x</code> and returns its
    result.  If <code class="code">x</code> has already been forced, <code class="code">force_val x</code>
    returns the same value again without recomputing it.
    Raise <code class="code"><span class="constructor">Undefined</span></code> if the forcing of <code class="code">x</code> tries to force <code class="code">x</code> itself
    recursively.
    If the computation of <code class="code">x</code> raises an exception, it is unspecified
    whether <code class="code">force_val x</code> raises the same exception or <code class="code"><span class="constructor">Undefined</span></code>.<br>
</div>

<pre><span id="VALfrom_fun"><span class="keyword">val</span> from_fun</span> : <code class="type">(unit -&gt; 'a) -&gt; 'a <a href="Lazy.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">from_fun f</code> is the same as <code class="code"><span class="keyword">lazy</span> (f ())</code> but slightly more efficient.
<p>

    <code class="code">from_fun</code> should only be used if the function <code class="code">f</code> is already defined.
    In particular it is always less efficient to write
    <code class="code">from_fun (<span class="keyword">fun</span> () <span class="keywordsign">-&gt;</span> expr)</code> than <code class="code"><span class="keyword">lazy</span> expr</code>.<br>
<b>Since</b> 4.00.0<br>
</p></div>

<pre><span id="VALfrom_val"><span class="keyword">val</span> from_val</span> : <code class="type">'a -&gt; 'a <a href="Lazy.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">from_val v</code> returns an already-forced suspension of <code class="code">v</code>.
    This is for special purposes only and should not be confused with
    <code class="code"><span class="keyword">lazy</span> (v)</code>.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALis_val"><span class="keyword">val</span> is_val</span> : <code class="type">'a <a href="Lazy.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">is_val x</code> returns <code class="code"><span class="keyword">true</span></code> if <code class="code">x</code> has already been forced and
    did not raise an exception.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALlazy_from_fun"><span class="keyword">val</span> lazy_from_fun</span> : <code class="type">(unit -&gt; 'a) -&gt; 'a <a href="Lazy.html#TYPEt">t</a></code></pre><div class="info ">
<span class="warning">Deprecated.</span>synonym for <code class="code">from_fun</code>.<br>
</div>

<pre><span id="VALlazy_from_val"><span class="keyword">val</span> lazy_from_val</span> : <code class="type">'a -&gt; 'a <a href="Lazy.html#TYPEt">t</a></code></pre><div class="info ">
<span class="warning">Deprecated.</span>synonym for <code class="code">from_val</code>.<br>
</div>

<pre><span id="VALlazy_is_val"><span class="keyword">val</span> lazy_is_val</span> : <code class="type">'a <a href="Lazy.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<span class="warning">Deprecated.</span>synonym for <code class="code">is_val</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>