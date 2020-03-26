<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Docstrings.WithMenhir</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Docstrings.WithMenhir.html">Docstrings.WithMenhir</a></h1>

<pre><span id="MODULEWithMenhir"><span class="keyword">module</span> WithMenhir</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Docstrings.WithMenhir.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALsymbol_docs"><span class="keyword">val</span> symbol_docs</span> : <code class="type">Lexing.position * Lexing.position -&gt; <a href="Docstrings.html#TYPEdocs">Docstrings.docs</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the item documentation for the current symbol. This also
    marks this documentation (for ambiguity warnings).</p>
</div>
</div>

<pre><span id="VALsymbol_docs_lazy"><span class="keyword">val</span> symbol_docs_lazy</span> : <code class="type">Lexing.position * Lexing.position -&gt;<br>       <a href="Docstrings.html#TYPEdocs">Docstrings.docs</a> Lazy.t</code></pre>
<pre><span id="VALrhs_docs"><span class="keyword">val</span> rhs_docs</span> : <code class="type">Lexing.position -&gt; Lexing.position -&gt; <a href="Docstrings.html#TYPEdocs">Docstrings.docs</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the item documentation for the symbols between two
    positions. This also marks this documentation (for ambiguity
    warnings).</p>
</div>
</div>

<pre><span id="VALrhs_docs_lazy"><span class="keyword">val</span> rhs_docs_lazy</span> : <code class="type">Lexing.position -&gt;<br>       Lexing.position -&gt; <a href="Docstrings.html#TYPEdocs">Docstrings.docs</a> Lazy.t</code></pre>
<pre><span id="VALmark_symbol_docs"><span class="keyword">val</span> mark_symbol_docs</span> : <code class="type">Lexing.position * Lexing.position -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Mark the item documentation for the current symbol (for ambiguity
    warnings).</p>
</div>
</div>

<pre><span id="VALmark_rhs_docs"><span class="keyword">val</span> mark_rhs_docs</span> : <code class="type">Lexing.position -&gt; Lexing.position -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Mark as associated the item documentation for the symbols between
    two positions (for ambiguity warnings)</p>
</div>
</div>

<pre><span id="VALsymbol_info"><span class="keyword">val</span> symbol_info</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEinfo">Docstrings.info</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the field info for the current symbol.</p>
</div>
</div>

<pre><span id="VALrhs_info"><span class="keyword">val</span> rhs_info</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEinfo">Docstrings.info</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the field info following the symbol at a given position.</p>
</div>
</div>

<pre><span id="VALsymbol_text"><span class="keyword">val</span> symbol_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the text preceding the current symbol.</p>
</div>
</div>

<pre><span id="VALsymbol_text_lazy"><span class="keyword">val</span> symbol_text_lazy</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a> Lazy.t</code></pre>
<pre><span id="VALrhs_text"><span class="keyword">val</span> rhs_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the text preceding the symbol at the given position.</p>
</div>
</div>

<pre><span id="VALrhs_text_lazy"><span class="keyword">val</span> rhs_text_lazy</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a> Lazy.t</code></pre><h4 id="3_Extratext">Extra text</h4>
<p>There may be additional text attached to the delimiters of a block
    (e.g. <code class="code"><span class="keyword">struct</span></code> and <code class="code"><span class="keyword">end</span></code>). This is fetched by the following
    functions, which are applied to the contents of the block rather
    than the delimiters.</p>

<pre><span id="VALsymbol_pre_extra_text"><span class="keyword">val</span> symbol_pre_extra_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text preceding the current symbol</p>
</div>
</div>

<pre><span id="VALsymbol_post_extra_text"><span class="keyword">val</span> symbol_post_extra_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text following the current symbol</p>
</div>
</div>

<pre><span id="VALrhs_pre_extra_text"><span class="keyword">val</span> rhs_pre_extra_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text preceding the symbol at the given position</p>
</div>
</div>

<pre><span id="VALrhs_post_extra_text"><span class="keyword">val</span> rhs_post_extra_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text following the symbol at the given position</p>
</div>
</div>

<pre><span id="VALrhs_post_text"><span class="keyword">val</span> rhs_post_text</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEtext">Docstrings.text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch text following the symbol at the given position</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>