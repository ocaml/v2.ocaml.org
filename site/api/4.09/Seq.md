<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Seq</a></div><ul><li><a href="#1_FunctionalIterators">Functional Iterators</a></li></ul></nav></header>

<h1>Module <a href="type_Seq.html">Seq</a></h1>

<pre><span id="MODULESeq"><span class="keyword">module</span> Seq</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Seq.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<h2 id="1_FunctionalIterators">Functional Iterators</h2></div>
</div>
<hr width="100%">
<p>The type <code class="code"><span class="keywordsign">'</span>a&nbsp;t</code> is a <b>delayed list</b>, i.e. a list where some evaluation
    is needed to access the next element. This makes it possible to build
    infinite sequences, to build sequences as we traverse them, and to transform
    them in a lazy fashion rather than upfront.</p>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">unit -&gt; 'a <a href="Seq.html#TYPEnode">node</a></code> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of delayed lists containing elements of type <code class="code"><span class="keywordsign">'</span>a</code>.
    Note that the concrete list node <code class="code"><span class="keywordsign">'</span>a&nbsp;node</code> is delayed under a closure,
    not a <code class="code"><span class="keyword">lazy</span></code> block, which means it might be recomputed every time
    we access it.</p>
</div>
</div>


<pre><code><span id="TYPEnode"><span class="keyword">type</span> <code class="type">'a</code> node</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnode.Nil"><span class="constructor">Nil</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTnode.Cons"><span class="constructor">Cons</span></span> <span class="keyword">of</span> <code class="type">'a * 'a <a href="Seq.html#TYPEt">t</a></code></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>A fully-evaluated list node, either empty or containing an element
    and a delayed tail.</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>



<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The empty sequence, containing no elements.</p>
</div>
</div>

<pre><span id="VALreturn"><span class="keyword">val</span> return</span> : <code class="type">'a -&gt; 'a <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>The singleton sequence containing only the given element.</p>
</div>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; 'a <a href="Seq.html#TYPEt">t</a> -&gt; 'b <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;seq</code> returns a new sequence whose elements are the elements of
    <code class="code">seq</code>, transformed by <code class="code">f</code>.
    This transformation is lazy, it only applies when the result is traversed.</p>

<p>If <code class="code">seq&nbsp;=&nbsp;[1;2;3]</code>, then <code class="code">map&nbsp;f&nbsp;seq&nbsp;=&nbsp;[f&nbsp;1;&nbsp;f&nbsp;2;&nbsp;f&nbsp;3]</code>.</p>
</div>
</div>

<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">('a -&gt; bool) -&gt; 'a <a href="Seq.html#TYPEt">t</a> -&gt; 'a <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Remove from the sequence the elements that do not satisfy the
    given predicate.
    This transformation is lazy, it only applies when the result is
    traversed.</p>
</div>
</div>

<pre><span id="VALfilter_map"><span class="keyword">val</span> filter_map</span> : <code class="type">('a -&gt; 'b option) -&gt; 'a <a href="Seq.html#TYPEt">t</a> -&gt; 'b <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Apply the function to every element; if <code class="code">f&nbsp;x&nbsp;=&nbsp;<span class="constructor">None</span></code> then <code class="code">x</code> is dropped;
    if <code class="code">f&nbsp;x&nbsp;=&nbsp;<span class="constructor">Some</span>&nbsp;y</code> then <code class="code">y</code> is returned.
    This transformation is lazy, it only applies when the result is
    traversed.</p>
</div>
</div>

<pre><span id="VALflat_map"><span class="keyword">val</span> flat_map</span> : <code class="type">('a -&gt; 'b <a href="Seq.html#TYPEt">t</a>) -&gt; 'a <a href="Seq.html#TYPEt">t</a> -&gt; 'b <a href="Seq.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Map each element to a subsequence, then return each element of this
    sub-sequence in turn.
    This transformation is lazy, it only applies when the result is
    traversed.</p>
</div>
</div>

<pre><span id="VALfold_left"><span class="keyword">val</span> fold_left</span> : <code class="type">('a -&gt; 'b -&gt; 'a) -&gt; 'a -&gt; 'b <a href="Seq.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Traverse the sequence from left to right, combining each element with the
    accumulator using the given function.
    The traversal happens immediately and will not terminate on infinite
    sequences.</p>

<p>Also see <a href="List.html#VALfold_left"><code class="code"><span class="constructor">List</span>.fold_left</code></a></p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Seq.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Iterate on the sequence, calling the (imperative) function on every element.
    The traversal happens immediately and will not terminate on infinite
    sequences.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>