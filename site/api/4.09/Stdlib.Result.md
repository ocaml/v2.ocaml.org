<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Result</a></div><ul><li><a href="#results">Results</a></li><li><a href="#preds">Predicates and comparisons</a></li><li><a href="#convert">Converting</a></li></ul></nav></header>

<h1>Module <a href="type_Stdlib.Result.html">Stdlib.Result</a></h1>

<pre><span id="MODULEResult"><span class="keyword">module</span> Result</span>: <code class="type"><a href="Result.html">Result</a></code></pre><hr width="100%">
<h2 id="results">Results</h2>
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'e)</code> t</span> = <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a></code> = </pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Ok"><span class="constructor">Ok</span></span> <span class="keyword">of</span> <code class="type">'a</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Error"><span class="constructor">Error</span></span> <span class="keyword">of</span> <code class="type">'e</code></code></td>

</tr></tbody></table>

<div class="info ">
<div class="info-desc">
<p>The type for result values. Either a value <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> or an error <code class="code"><span class="constructor">Error</span>&nbsp;e</code>.</p>
</div>
</div>


<pre><span id="VALok"><span class="keyword">val</span> ok</span> : <code class="type">'a -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">ok&nbsp;v</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code>.</p>
</div>
</div>

<pre><span id="VALerror"><span class="keyword">val</span> error</span> : <code class="type">'e -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">error&nbsp;e</code> is <code class="code"><span class="constructor">Error</span>&nbsp;e</code>.</p>
</div>
</div>

<pre><span id="VALvalue"><span class="keyword">val</span> value</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; default:'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">value&nbsp;r&nbsp;~default</code> is <code class="code">v</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">default</code> otherwise.</p>
</div>
</div>

<pre><span id="VALget_ok"><span class="keyword">val</span> get_ok</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get_ok&nbsp;r</code> is <code class="code">v</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> otherwise.</li>
</ul>
</div>

<pre><span id="VALget_error"><span class="keyword">val</span> get_error</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'e</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get_error&nbsp;r</code> is <code class="code">e</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;e</code> and</p>
</div>
<ul class="info-attributes">
<li><b>Raises</b> <code>Invalid_argument</code> otherwise.</li>
</ul>
</div>

<pre><span id="VALbind"><span class="keyword">val</span> bind</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt;<br>       ('a -&gt; ('b, 'e) <a href="Stdlib.html#TYPEresult">result</a>) -&gt; ('b, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">bind&nbsp;r&nbsp;f</code> is <code class="code">f&nbsp;v</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">r</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALjoin"><span class="keyword">val</span> join</span> : <code class="type">(('a, 'e) <a href="Stdlib.html#TYPEresult">result</a>, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">join&nbsp;rr</code> is <code class="code">r</code> if <code class="code">rr</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;r</code> and <code class="code">rr</code> if <code class="code">rr</code> is <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('a -&gt; 'b) -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; ('b, 'e) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map&nbsp;f&nbsp;r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;(f&nbsp;v)</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">r</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALmap_error"><span class="keyword">val</span> map_error</span> : <code class="type">('e -&gt; 'f) -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; ('a, 'f) <a href="Stdlib.html#TYPEresult">result</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">map_error&nbsp;f&nbsp;r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;(f&nbsp;e)</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;e</code> and <code class="code">r</code> if
    <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">ok:('a -&gt; 'c) -&gt; error:('e -&gt; 'c) -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'c</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;~ok&nbsp;~error&nbsp;r</code> is <code class="code">ok&nbsp;v</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">error&nbsp;e</code> if <code class="code">r</code>
    is <code class="code"><span class="constructor">Error</span>&nbsp;e</code>.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;r</code> is <code class="code">f&nbsp;v</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">()</code> otherwise.</p>
</div>
</div>

<pre><span id="VALiter_error"><span class="keyword">val</span> iter_error</span> : <code class="type">('e -&gt; unit) -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter_error&nbsp;f&nbsp;r</code> is <code class="code">f&nbsp;e</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;e</code> and <code class="code">()</code> otherwise.</p>
</div>
</div>
<h2 id="preds">Predicates and comparisons</h2>
<pre><span id="VALis_ok"><span class="keyword">val</span> is_ok</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_ok&nbsp;r</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALis_error"><span class="keyword">val</span> is_error</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">is_error&nbsp;r</code> is <code class="code"><span class="keyword">true</span></code> iff <code class="code">r</code> is <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">ok:('a -&gt; 'a -&gt; bool) -&gt;<br>       error:('e -&gt; 'e -&gt; bool) -&gt;<br>       ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">equal&nbsp;~ok&nbsp;~error&nbsp;r0&nbsp;r1</code> tests equality of <code class="code">r0</code> and <code class="code">r1</code> using <code class="code">ok</code>
    and <code class="code">error</code> to respectively compare values wrapped by <code class="code"><span class="constructor">Ok</span>&nbsp;_</code> and
    <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.</p>
</div>
</div>

<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type">ok:('a -&gt; 'a -&gt; int) -&gt;<br>       error:('e -&gt; 'e -&gt; int) -&gt;<br>       ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; ('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">compare&nbsp;~ok&nbsp;~error&nbsp;r0&nbsp;r1</code> totally orders <code class="code">r0</code> and <code class="code">r1</code> using <code class="code">ok</code> and
    <code class="code">error</code> to respectively compare values wrapped by <code class="code"><span class="constructor">Ok</span>&nbsp;_&nbsp;</code> and <code class="code"><span class="constructor">Error</span>&nbsp;_</code>.
    <code class="code"><span class="constructor">Ok</span>&nbsp;_</code> values are smaller than <code class="code"><span class="constructor">Error</span>&nbsp;_</code> values.</p>
</div>
</div>
<h2 id="convert">Converting</h2>
<pre><span id="VALto_option"><span class="keyword">val</span> to_option</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_option&nbsp;r</code> is <code class="code">r</code> as an option, mapping <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> to <code class="code"><span class="constructor">Some</span>&nbsp;v</code> and
    <code class="code"><span class="constructor">Error</span>&nbsp;_</code> to <code class="code"><span class="constructor">None</span></code>.</p>
</div>
</div>

<pre><span id="VALto_list"><span class="keyword">val</span> to_list</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_list&nbsp;r</code> is <code class="code">[v]</code> if <code class="code">r</code> is <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> and <code class="code">[]</code> otherwise.</p>
</div>
</div>

<pre><span id="VALto_seq"><span class="keyword">val</span> to_seq</span> : <code class="type">('a, 'e) <a href="Stdlib.html#TYPEresult">result</a> -&gt; 'a <a href="Seq.html#TYPEt">Seq.t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">to_seq&nbsp;r</code> is <code class="code">r</code> as a sequence. <code class="code"><span class="constructor">Ok</span>&nbsp;v</code> is the singleton sequence
    containing <code class="code">v</code> and <code class="code"><span class="constructor">Error</span>&nbsp;_</code> is the empty sequence.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>