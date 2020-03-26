<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.List</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.List.html">Misc.Stdlib.List</a></h1>

<pre><span class="keyword">module</span> List: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.List.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a list</code> </pre>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The lexicographic order supported by the provided order.
        There is no constraint on the relative lengths of the lists.<br>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
Returns <code class="code"><span class="keyword">true</span></code> iff the given lists have the same length and content
        with respect to the given equality function.<br>
</div>

<pre><span id="VALfilter_map"><span class="keyword">val</span> filter_map</span> : <code class="type">('a -&gt; 'b option) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'b <a href="Misc.Stdlib.List.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">filter_map f l</code> applies <code class="code">f</code> to every element of <code class="code">l</code>, filters
        out the <code class="code"><span class="constructor">None</span></code> elements and returns the list of the arguments of
        the <code class="code"><span class="constructor">Some</span></code> elements.<br>
</div>

<pre><span id="VALsome_if_all_elements_are_some"><span class="keyword">val</span> some_if_all_elements_are_some</span> : <code class="type">'a option <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> option</code></pre><div class="info ">
If all elements of the given list are <code class="code"><span class="constructor">Some</span> _</code> then <code class="code"><span class="constructor">Some</span> xs</code>
        is returned with the <code class="code">xs</code> being the contents of those <code class="code"><span class="constructor">Some</span></code>s, with
        order preserved.  Otherwise return <code class="code"><span class="constructor">None</span></code>.<br>
</div>

<pre><span id="VALmap2_prefix"><span class="keyword">val</span> map2_prefix</span> : <code class="type">('a -&gt; 'b -&gt; 'c) -&gt;<br>       'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt;<br>       'b <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'c <a href="Misc.Stdlib.List.html#TYPEt">t</a> * 'b <a href="Misc.Stdlib.List.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="keyword">let</span> r1, r2 = map2_prefix f l1 l2</code>
        If <code class="code">l1</code> is of length n and <code class="code">l2 = h2 @ t2</code> with h2 of length n,
        r1 is <code class="code"><span class="constructor">List</span>.map2 f l1 h1</code> and r2 is t2.<br>
</div>

<pre><span id="VALsplit_at"><span class="keyword">val</span> split_at</span> : <code class="type">int -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> * 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">split_at n l</code> returns the pair <code class="code">before, after</code> where <code class="code">before</code> is
        the <code class="code">n</code> first elements of <code class="code">l</code> and <code class="code">after</code> the remaining ones.
        If <code class="code">l</code> has less than <code class="code">n</code> elements, raises Invalid_argument.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>