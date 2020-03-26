<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.List</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.List.html">Misc.Stdlib.List</a></h1>

<pre><span id="MODULEList"><span class="keyword">module</span> List</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.List.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a list</code> </pre>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">('a -&gt; 'a -&gt; int) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>The lexicographic order supported by the provided order.
        There is no constraint on the relative lengths of the lists.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">('a -&gt; 'a -&gt; bool) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Returns <code class="code"><span class="keyword">true</span></code> iff the given lists have the same length and content
        with respect to the given equality function.</p>
</div>
</div>

<pre><span id="VALfind_map"><span class="keyword">val</span> find_map</span> : <code class="type">('a -&gt; 'b option) -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'b option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">find_map&nbsp;f&nbsp;l</code> returns the first evaluation of <code class="code">f</code> that returns <code class="code"><span class="constructor">Some</span></code>,
       or returns None if there is no such element.</p>
</div>
</div>

<pre><span id="VALsome_if_all_elements_are_some"><span class="keyword">val</span> some_if_all_elements_are_some</span> : <code class="type">'a option <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> option</code></pre><div class="info ">
<div class="info-desc">
<p>If all elements of the given list are <code class="code"><span class="constructor">Some</span>&nbsp;_</code> then <code class="code"><span class="constructor">Some</span>&nbsp;xs</code>
        is returned with the <code class="code">xs</code> being the contents of those <code class="code"><span class="constructor">Some</span></code>s, with
        order preserved.  Otherwise return <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALmap2_prefix"><span class="keyword">val</span> map2_prefix</span> : <code class="type">('a -&gt; 'b -&gt; 'c) -&gt;<br>       'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt;<br>       'b <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'c <a href="Misc.Stdlib.List.html#TYPEt">t</a> * 'b <a href="Misc.Stdlib.List.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="keyword">let</span>&nbsp;r1,&nbsp;r2&nbsp;=&nbsp;map2_prefix&nbsp;f&nbsp;l1&nbsp;l2</code>
        If <code class="code">l1</code> is of length n and <code class="code">l2&nbsp;=&nbsp;h2&nbsp;@&nbsp;t2</code> with h2 of length n,
        r1 is <code class="code"><span class="constructor">List</span>.map2&nbsp;f&nbsp;l1&nbsp;h1</code> and r2 is t2.</p>
</div>
</div>

<pre><span id="VALsplit_at"><span class="keyword">val</span> split_at</span> : <code class="type">int -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> -&gt; 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a> * 'a <a href="Misc.Stdlib.List.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">split_at&nbsp;n&nbsp;l</code> returns the pair <code class="code">before,&nbsp;after</code> where <code class="code">before</code> is
        the <code class="code">n</code> first elements of <code class="code">l</code> and <code class="code">after</code> the remaining ones.
        If <code class="code">l</code> has less than <code class="code">n</code> elements, raises Invalid_argument.</p>
</div>
</div>

<pre><span id="VALis_prefix"><span class="keyword">val</span> is_prefix</span> : <code class="type">equal:('a -&gt; 'a -&gt; bool) -&gt; 'a list -&gt; of_:'a list -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Returns <code class="code"><span class="keyword">true</span></code> iff the given list, with respect to the given equality
        function on list members, is a prefix of the list <code class="code">of_</code>.</p>
</div>
</div>

<pre><code><span id="TYPElongest_common_prefix_result"><span class="keyword">type</span> <code class="type">'a</code> longest_common_prefix_result</span> = private {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlongest_common_prefix_result.longest_common_prefix">longest_common_prefix</span>&nbsp;: <code class="type">'a list</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlongest_common_prefix_result.first_without_longest_common_prefix">first_without_longest_common_prefix</span>&nbsp;: <code class="type">'a list</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlongest_common_prefix_result.second_without_longest_common_prefix">second_without_longest_common_prefix</span>&nbsp;: <code class="type">'a list</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALfind_and_chop_longest_common_prefix"><span class="keyword">val</span> find_and_chop_longest_common_prefix</span> : <code class="type">equal:('a -&gt; 'a -&gt; bool) -&gt;<br>       first:'a list -&gt;<br>       second:'a list -&gt; 'a <a href="Misc.Stdlib.List.html#TYPElongest_common_prefix_result">longest_common_prefix_result</a></code></pre><div class="info ">
<div class="info-desc">
<p>Returns the longest list that, with respect to the provided equality
        function, is a prefix of both of the given lists.  The input lists,
        each with such longest common prefix removed, are also returned.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>