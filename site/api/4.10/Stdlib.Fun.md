<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Fun</a></div><ul><li><a href="#combinators">Combinators</a></li><li><a href="#exception">Exception handling</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Fun.html">Stdlib.Fun</a></h1>

<pre><span id="MODULEFun"><span class="keyword">module</span> Fun</span>: <code class="type"><a href="Fun.html">Fun</a></code></pre><hr width="100%">
<h2 id="combinators">Combinators</h2>
<pre><span id="VALid"><span class="keyword">val</span> id</span> : <code class="type">'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">id</code> is the identity function. For any argument <code class="code">x</code>, <code class="code">id&nbsp;x</code> is <code class="code">x</code>.</p>
</div>
</div>

<pre><span id="VALconst"><span class="keyword">val</span> const</span> : <code class="type">'a -&gt; 'b -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">const&nbsp;c</code> is a function that always returns the value <code class="code">c</code>. For any
    argument <code class="code">x</code>, <code class="code">(const&nbsp;c)&nbsp;x</code> is <code class="code">c</code>.</p>
</div>
</div>

<pre><span id="VALflip"><span class="keyword">val</span> flip</span> : <code class="type">('a -&gt; 'b -&gt; 'c) -&gt; 'b -&gt; 'a -&gt; 'c</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">flip&nbsp;f</code> reverses the argument order of the binary function
    <code class="code">f</code>. For any arguments <code class="code">x</code> and <code class="code">y</code>, <code class="code">(flip&nbsp;f)&nbsp;x&nbsp;y</code> is <code class="code">f&nbsp;y&nbsp;x</code>.</p>
</div>
</div>

<pre><span id="VALnegate"><span class="keyword">val</span> negate</span> : <code class="type">('a -&gt; bool) -&gt; 'a -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">negate&nbsp;p</code> is the negation of the predicate function <code class="code">p</code>. For any
    argument <code class="code">x</code>, <code class="code">(negate&nbsp;p)&nbsp;x</code> is <code class="code">not&nbsp;(p&nbsp;x)</code>.</p>
</div>
</div>
<h2 id="exception">Exception handling</h2>
<pre><span id="VALprotect"><span class="keyword">val</span> protect</span> : <code class="type">finally:(unit -&gt; unit) -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">protect&nbsp;~finally&nbsp;work</code> invokes <code class="code">work&nbsp;()</code> and then <code class="code">finally&nbsp;()</code>
    before <code class="code">work&nbsp;()</code> returns with its value or an exception. In the
    latter case the exception is re-raised after <code class="code">finally&nbsp;()</code>. If
    <code class="code">finally&nbsp;()</code> raises an exception, then the exception
    <a href="Fun.html#EXCEPTIONFinally_raised"><code class="code"><span class="constructor">Fun</span>.<span class="constructor">Finally_raised</span></code></a> is raised instead.</p>

<p><code class="code">protect</code> can be used to enforce local invariants whether <code class="code">work&nbsp;()</code>
    returns normally or raises an exception. However, it does not
    protect against unexpected exceptions raised inside <code class="code">finally&nbsp;()</code>
    such as <a href="Stdlib.html#EXCEPTIONOut_of_memory"><code class="code"><span class="constructor">Out_of_memory</span></code></a>, <a href="Stdlib.html#EXCEPTIONStack_overflow"><code class="code"><span class="constructor">Stack_overflow</span></code></a>, or
    asynchronous exceptions raised by signal handlers
    (e.g. <a href="Sys.html#EXCEPTIONBreak"><code class="code"><span class="constructor">Sys</span>.<span class="constructor">Break</span></code></a>).</p>

<p>Note: It is a <em>programming error</em> if other kinds of exceptions
    are raised by <code class="code">finally</code>, as any exception raised in <code class="code">work&nbsp;()</code> will
    be lost in the event of a <a href="Fun.html#EXCEPTIONFinally_raised"><code class="code"><span class="constructor">Fun</span>.<span class="constructor">Finally_raised</span></code></a> exception. Therefore,
    one should make sure to handle those inside the finally.</p>
</div>
</div>

<pre><span id="EXCEPTIONFinally_raised"><span class="keyword">exception</span> Finally_raised</span> <span class="keyword">of</span> <code class="type">exn</code></pre>
<div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Finally_raised</span>&nbsp;exn</code> is raised by <code class="code">protect&nbsp;~finally&nbsp;work</code> when
    <code class="code">finally</code> raises an exception <code class="code">exn</code>. This exception denotes either
    an unexpected exception or a programming error. As a general rule,
    one should not catch a <code class="code"><span class="constructor">Finally_raised</span></code> exception except as part of
    a catch-all handler.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>