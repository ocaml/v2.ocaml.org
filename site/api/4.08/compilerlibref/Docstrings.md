<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Docstrings</a></div><ul><li><ul><li><a href="#2_Docstrings">Docstrings</a></li><li><a href="#2_Setfunctions">Set functions</a></li><li><a href="#2_Items">Items</a></li><li><a href="#2_Fieldsandconstructors">Fields and constructors</a></li><li><a href="#2_Unattachedcomments">Unattached comments</a></li><li><a href="#2_Extratext">Extra text</a></li></ul></li></ul></nav></header>

<h1>Module <a href="type_Docstrings.html">Docstrings</a></h1>

<pre><span id="MODULEDocstrings"><span class="keyword">module</span> Docstrings</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Docstrings.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Documentation comments</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>(Re)Initialise all docstring state</p>
</div>
</div>

<pre><span id="VALwarn_bad_docstrings"><span class="keyword">val</span> warn_bad_docstrings</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Emit warnings for unattached and ambiguous docstrings</p>
</div>
</div>
<h3 id="2_Docstrings">Docstrings</h3>
<pre><span id="TYPEdocstring"><span class="keyword">type</span> <code class="type"></code>docstring</span> </pre>
<div class="info ">
<div class="info-desc">
<p>Documentation comments</p>
</div>
</div>


<pre><span id="VALdocstring"><span class="keyword">val</span> docstring</span> : <code class="type">string -&gt; <a href="Location.html#TYPEt">Location.t</a> -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a docstring</p>
</div>
</div>

<pre><span id="VALregister"><span class="keyword">val</span> register</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Register a docstring</p>
</div>
</div>

<pre><span id="VALdocstring_body"><span class="keyword">val</span> docstring_body</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p>Get the text of a docstring</p>
</div>
</div>

<pre><span id="VALdocstring_loc"><span class="keyword">val</span> docstring_loc</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; <a href="Location.html#TYPEt">Location.t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Get the location of a docstring</p>
</div>
</div>
<h3 id="2_Setfunctions">Set functions</h3>
<p>These functions are used by the lexer to associate docstrings to
   the locations of tokens.</p>

<pre><span id="VALset_pre_docstrings"><span class="keyword">val</span> set_pre_docstrings</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Docstrings immediately preceding a token</p>
</div>
</div>

<pre><span id="VALset_post_docstrings"><span class="keyword">val</span> set_post_docstrings</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Docstrings immediately following a token</p>
</div>
</div>

<pre><span id="VALset_floating_docstrings"><span class="keyword">val</span> set_floating_docstrings</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Docstrings not immediately adjacent to a token</p>
</div>
</div>

<pre><span id="VALset_pre_extra_docstrings"><span class="keyword">val</span> set_pre_extra_docstrings</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Docstrings immediately following the token which precedes this one</p>
</div>
</div>

<pre><span id="VALset_post_extra_docstrings"><span class="keyword">val</span> set_post_extra_docstrings</span> : <code class="type">Lexing.position -&gt; <a href="Docstrings.html#TYPEdocstring">docstring</a> list -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Docstrings immediately preceding the token which follows this one</p>
</div>
</div>
<h3 id="2_Items">Items</h3>
<p>The <a href="Docstrings.html#TYPEdocs"><code class="code"><span class="constructor">Docstrings</span>.docs</code></a> type represents documentation attached to an item.</p>

<pre><code><span id="TYPEdocs"><span class="keyword">type</span> <code class="type"></code>docs</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTdocs.docs_pre">docs_pre</span>&nbsp;: <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> option</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTdocs.docs_post">docs_post</span>&nbsp;: <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> option</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="VALempty_docs"><span class="keyword">val</span> empty_docs</span> : <code class="type"><a href="Docstrings.html#TYPEdocs">docs</a></code></pre>
<pre><span id="VALdocs_attr"><span class="keyword">val</span> docs_attr</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; <a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a></code></pre>
<pre><span id="VALadd_docs_attrs"><span class="keyword">val</span> add_docs_attrs</span> : <code class="type"><a href="Docstrings.html#TYPEdocs">docs</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a></code></pre><div class="info ">
<div class="info-desc">
<p>Convert item documentation to attributes and add them to an
    attribute list</p>
</div>
</div>

<pre><span id="VALsymbol_docs"><span class="keyword">val</span> symbol_docs</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEdocs">docs</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the item documentation for the current symbol. This also
    marks this documentation (for ambiguity warnings).</p>
</div>
</div>

<pre><span id="VALsymbol_docs_lazy"><span class="keyword">val</span> symbol_docs_lazy</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEdocs">docs</a> Lazy.t</code></pre>
<pre><span id="VALrhs_docs"><span class="keyword">val</span> rhs_docs</span> : <code class="type">int -&gt; int -&gt; <a href="Docstrings.html#TYPEdocs">docs</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the item documentation for the symbols between two
    positions. This also marks this documentation (for ambiguity
    warnings).</p>
</div>
</div>

<pre><span id="VALrhs_docs_lazy"><span class="keyword">val</span> rhs_docs_lazy</span> : <code class="type">int -&gt; int -&gt; <a href="Docstrings.html#TYPEdocs">docs</a> Lazy.t</code></pre>
<pre><span id="VALmark_symbol_docs"><span class="keyword">val</span> mark_symbol_docs</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Mark the item documentation for the current symbol (for ambiguity
    warnings).</p>
</div>
</div>

<pre><span id="VALmark_rhs_docs"><span class="keyword">val</span> mark_rhs_docs</span> : <code class="type">int -&gt; int -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Mark as associated the item documentation for the symbols between
    two positions (for ambiguity warnings)</p>
</div>
</div>
<h3 id="2_Fieldsandconstructors">Fields and constructors</h3>
<p>The <a href="Docstrings.html#TYPEinfo"><code class="code"><span class="constructor">Docstrings</span>.info</code></a> type represents documentation attached to a field or
    constructor.</p>

<pre><span id="TYPEinfo"><span class="keyword">type</span> <code class="type"></code>info</span> = <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> option</code> </pre>


<pre><span id="VALempty_info"><span class="keyword">val</span> empty_info</span> : <code class="type"><a href="Docstrings.html#TYPEinfo">info</a></code></pre>
<pre><span id="VALinfo_attr"><span class="keyword">val</span> info_attr</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; <a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a></code></pre>
<pre><span id="VALadd_info_attrs"><span class="keyword">val</span> add_info_attrs</span> : <code class="type"><a href="Docstrings.html#TYPEinfo">info</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a></code></pre><div class="info ">
<div class="info-desc">
<p>Convert field info to attributes and add them to an
    attribute list</p>
</div>
</div>

<pre><span id="VALsymbol_info"><span class="keyword">val</span> symbol_info</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEinfo">info</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the field info for the current symbol.</p>
</div>
</div>

<pre><span id="VALrhs_info"><span class="keyword">val</span> rhs_info</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEinfo">info</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the field info following the symbol at a given position.</p>
</div>
</div>
<h3 id="2_Unattachedcomments">Unattached comments</h3>
<p>The <a href="Docstrings.html#TYPEtext"><code class="code"><span class="constructor">Docstrings</span>.text</code></a> type represents documentation which is not attached to
    anything.</p>

<pre><span id="TYPEtext"><span class="keyword">type</span> <code class="type"></code>text</span> = <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> list</code> </pre>


<pre><span id="VALempty_text"><span class="keyword">val</span> empty_text</span> : <code class="type"><a href="Docstrings.html#TYPEtext">text</a></code></pre>
<pre><span id="VALempty_text_lazy"><span class="keyword">val</span> empty_text_lazy</span> : <code class="type"><a href="Docstrings.html#TYPEtext">text</a> Lazy.t</code></pre>
<pre><span id="VALtext_attr"><span class="keyword">val</span> text_attr</span> : <code class="type"><a href="Docstrings.html#TYPEdocstring">docstring</a> -&gt; <a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a></code></pre>
<pre><span id="VALadd_text_attrs"><span class="keyword">val</span> add_text_attrs</span> : <code class="type"><a href="Docstrings.html#TYPEtext">text</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a></code></pre><div class="info ">
<div class="info-desc">
<p>Convert text to attributes and add them to an attribute list</p>
</div>
</div>

<pre><span id="VALsymbol_text"><span class="keyword">val</span> symbol_text</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the text preceding the current symbol.</p>
</div>
</div>

<pre><span id="VALsymbol_text_lazy"><span class="keyword">val</span> symbol_text_lazy</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEtext">text</a> Lazy.t</code></pre>
<pre><span id="VALrhs_text"><span class="keyword">val</span> rhs_text</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch the text preceding the symbol at the given position.</p>
</div>
</div>

<pre><span id="VALrhs_text_lazy"><span class="keyword">val</span> rhs_text_lazy</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEtext">text</a> Lazy.t</code></pre><h3 id="2_Extratext">Extra text</h3>
<p>There may be additional text attached to the delimiters of a block
    (e.g. <code class="code"><span class="keyword">struct</span></code> and <code class="code"><span class="keyword">end</span></code>). This is fetched by the following
    functions, which are applied to the contents of the block rather
    than the delimiters.</p>

<pre><span id="VALsymbol_pre_extra_text"><span class="keyword">val</span> symbol_pre_extra_text</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text preceding the current symbol</p>
</div>
</div>

<pre><span id="VALsymbol_post_extra_text"><span class="keyword">val</span> symbol_post_extra_text</span> : <code class="type">unit -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text following the current symbol</p>
</div>
</div>

<pre><span id="VALrhs_pre_extra_text"><span class="keyword">val</span> rhs_pre_extra_text</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text preceding the symbol at the given position</p>
</div>
</div>

<pre><span id="VALrhs_post_extra_text"><span class="keyword">val</span> rhs_post_extra_text</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch additional text following the symbol at the given position</p>
</div>
</div>

<pre><span id="VALrhs_post_text"><span class="keyword">val</span> rhs_post_text</span> : <code class="type">int -&gt; <a href="Docstrings.html#TYPEtext">text</a></code></pre><div class="info ">
<div class="info-desc">
<p>Fetch text following the symbol at the given position</p>
</div>
</div>

<pre><span id="MODULEWithMenhir"><span class="keyword">module</span> <a href="Docstrings.WithMenhir.html">WithMenhir</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Docstrings.WithMenhir.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>