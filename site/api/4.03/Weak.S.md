<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Weak.S</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Weak.S.html">Weak.S</a></h1>

<pre><span class="keyword">module type</span> S = <code class="code"><span class="keyword">sig</span></code> <a href="Weak.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
The output signature of the functor <a href="Weak.Make.html"><code class="code"><span class="constructor">Weak</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<hr width="100%">

<pre><span id="TYPEdata"><span class="keyword">type</span> <code class="type"></code>data</span> </pre>
<div class="info ">
The type of the elements stored in the table.<br>
</div>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of tables that contain elements of type <code class="code">data</code>.
        Note that weak hash sets cannot be marshaled using
        <a href="Pervasives.html#VALoutput_value"><code class="code">output_value</code></a> or the functions of the <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a>
        module.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Weak.S.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">create n</code> creates a new empty weak hash set, of initial
        size <code class="code">n</code>.  The table will grow as needed.<br>
</div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Remove all elements from the table.<br>
</div>

<pre><span id="VALmerge"><span class="keyword">val</span> merge</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a></code></pre><div class="info ">
<code class="code">merge t x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code> if any,
        or else adds <code class="code">x</code> to <code class="code">t</code> and return <code class="code">x</code>.<br>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; unit</code></pre><div class="info ">
<code class="code">add t x</code> adds <code class="code">x</code> to <code class="code">t</code>.  If there is already an instance
        of <code class="code">x</code> in <code class="code">t</code>, it is unspecified which one will be
        returned by subsequent calls to <code class="code">find</code> and <code class="code">merge</code>.<br>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; unit</code></pre><div class="info ">
<code class="code">remove t x</code> removes from <code class="code">t</code> one instance of <code class="code">x</code>.  Does
        nothing if there is no instance of <code class="code">x</code> in <code class="code">t</code>.<br>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a></code></pre><div class="info ">
<code class="code">find t x</code> returns an instance of <code class="code">x</code> found in <code class="code">t</code>.
        Raise <code class="code"><span class="constructor">Not_found</span></code> if there is no such element.<br>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> list</code></pre><div class="info ">
<code class="code">find_all t x</code> returns a list of all the instances of <code class="code">x</code>
        found in <code class="code">t</code>.<br>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; <a href="Weak.S.html#TYPEdata">data</a> -&gt; bool</code></pre><div class="info ">
<code class="code">mem t x</code> returns <code class="code"><span class="keyword">true</span></code> if there is at least one instance
        of <code class="code">x</code> in <code class="code">t</code>, false otherwise.<br>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">(<a href="Weak.S.html#TYPEdata">data</a> -&gt; unit) -&gt; <a href="Weak.S.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">iter f t</code> calls <code class="code">f</code> on each element of <code class="code">t</code>, in some unspecified
        order.  It is not specified what happens if <code class="code">f</code> tries to change
        <code class="code">t</code> itself.<br>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">(<a href="Weak.S.html#TYPEdata">data</a> -&gt; 'a -&gt; 'a) -&gt; <a href="Weak.S.html#TYPEt">t</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<code class="code">fold f t init</code> computes <code class="code">(f d1 (... (f dN init)))</code> where
        <code class="code">d1 ... dN</code> are the elements of <code class="code">t</code> in some unspecified order.
        It is not specified what happens if <code class="code">f</code> tries to change <code class="code">t</code>
        itself.<br>
</div>

<pre><span id="VALcount"><span class="keyword">val</span> count</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Count the number of elements in the table.  <code class="code">count t</code> gives the
        same result as <code class="code">fold (<span class="keyword">fun</span> _ n <span class="keywordsign">-&gt;</span> n+1) t 0</code> but does not delay the
        deallocation of the dead elements.<br>
</div>

<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type"><a href="Weak.S.html#TYPEt">t</a> -&gt; int * int * int * int * int * int</code></pre><div class="info ">
Return statistics on the table.  The numbers are, in order:
        table length, number of entries, sum of bucket lengths,
        smallest bucket length, median bucket length, biggest bucket length.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>