<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Weak.S</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Weak.S.html">Weak.S</a></h1>

<pre><span id="MODULETYPES"><span class="keyword">module type</span> S</span> = <code class="code"><span class="keyword">sig</span></code> <a href="Weak.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
<div class="info-desc">
<p>The output signature of the functor <a href="Weak.Make.html"><code class="code"><span class="constructor">Weak</span>.<span class="constructor">Make</span></code></a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEdata"><span class="keyword">type</span> <code class="type"></code>data</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of the elements stored in the table.</p>
</div>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of tables that contain elements of type <code class="code">data</code>.
        Note that weak hash sets cannot be marshaled using
        <a href="Stdlib.html#VALoutput_value"><code class="code">output_value</code></a> or the functions of the <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a>
        module.</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Weak.S.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">create&nbsp;n</code> creates a new empty weak hash set, of initial
        size <code class="code">n</code>.  The table will grow as needed.</p>
</div>
</div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Remove all elements from the table.</p>
</div>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">merge&nbsp;t&nbsp;x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code> if any,
        or else adds <code class="code">x</code> to <code class="code">t</code> and return <code class="code">x</code>.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">add&nbsp;t&nbsp;x</code> adds <code class="code">x</code> to <code class="code">t</code>.  If there is already an instance
        of <code class="code">x</code> in <code class="code">t</code>, it is unspecified which one will be
        returned by subsequent calls to <code class="code">find</code> and <code class="code">merge</code>.</p>
</div>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">remove&nbsp;t&nbsp;x</code> removes from <code class="code">t</code> one instance of <code class="code">x</code>.  Does
        nothing if there is no instance of <code class="code">x</code> in <code class="code">t</code>.</p>
</div>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find&nbsp;t&nbsp;x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code>.
        Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no such element.</p>
</div>
</div>

<pre><span id="VALfind_opt"><span class="keyword">val</span> find_opt</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_opt&nbsp;t&nbsp;x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code>
        or <code class="code"><span class="constructor">None</span></code> if there is no such element.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.05</li>
</ul>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_all&nbsp;t&nbsp;x</code> returns a list of all the instances of <code class="code">x</code>
        found in <code class="code">t</code>.</p>
</div>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">mem&nbsp;t&nbsp;x</code> returns <code class="code"><span class="keyword">true</span></code> if there is at least one instance
        of <code class="code">x</code> in <code class="code">t</code>, false otherwise.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Weak.S.html#TYPEdata">data</a> -&gt; unit) -&gt; <a href="Weak.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;t</code> calls <code class="code">f</code> on each element of <code class="code">t</code>, in some unspecified
        order.  It is not specified what happens if <code class="code">f</code> tries to change
        <code class="code">t</code> itself.</p>
</div>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Weak.S.html#TYPEdata">data</a> -&gt; 'a -&gt; 'a) -&gt; <a href="Weak.S.html#TYPEt">t</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;f&nbsp;t&nbsp;init</code> computes <code class="code">(f&nbsp;d1&nbsp;(...&nbsp;(f&nbsp;dN&nbsp;init)))</code> where
        <code class="code">d1&nbsp;...&nbsp;dN</code> are the elements of <code class="code">t</code> in some unspecified order.
        It is not specified what happens if <code class="code">f</code> tries to change <code class="code">t</code>
        itself.</p>
</div>
</div>

<pre><span id="VALcount"><span class="keyword">val</span> count</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Count the number of elements in the table.  <code class="code">count&nbsp;t</code> gives the
        same result as <code class="code">fold&nbsp;(<span class="keyword">fun</span>&nbsp;_&nbsp;n&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;n+1)&nbsp;t&nbsp;0</code> but does not delay the
        deallocation of the dead elements.</p>
</div>
</div>

<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; int * int * int * int * int * int</code></pre><div class="info ">
<div class="info-desc">
<p>Return statistics on the table.  The numbers are, in order:
        table length, number of entries, sum of bucket lengths,
        smallest bucket length, median bucket length, biggest bucket length.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>