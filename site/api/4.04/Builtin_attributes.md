<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Builtin_attributes</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Builtin_attributes.html">Builtin_attributes</a></h1>

<pre><span class="keyword">module</span> Builtin_attributes: <code class="code"><span class="keyword">sig</span></code> <a href="Builtin_attributes.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALcheck_deprecated"><span class="keyword">val</span> check_deprecated</span> : <code class="type"><a href="Location.html#TYPEt">Location.t</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALdeprecated_of_attrs"><span class="keyword">val</span> deprecated_of_attrs</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; string option</code></pre>
<pre><span id="VALdeprecated_of_sig"><span class="keyword">val</span> deprecated_of_sig</span> : <code class="type"><a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; string option</code></pre>
<pre><span id="VALdeprecated_of_str"><span class="keyword">val</span> deprecated_of_str</span> : <code class="type"><a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; string option</code></pre>
<pre><span id="VALcheck_deprecated_mutable"><span class="keyword">val</span> check_deprecated_mutable</span> : <code class="type"><a href="Location.html#TYPEt">Location.t</a> -&gt; <a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALerror_of_extension"><span class="keyword">val</span> error_of_extension</span> : <code class="type"><a href="Parsetree.html#TYPEextension">Parsetree.extension</a> -&gt; <a href="Location.html#TYPEerror">Location.error</a></code></pre>
<pre><span id="VALwarning_enter_scope"><span class="keyword">val</span> warning_enter_scope</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALwarning_leave_scope"><span class="keyword">val</span> warning_leave_scope</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="VALwarning_attribute"><span class="keyword">val</span> warning_attribute</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; unit</code></pre>
<pre><span id="VALwith_warning_attribute"><span class="keyword">val</span> with_warning_attribute</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre>
<pre><span id="VALemit_external_warnings"><span class="keyword">val</span> emit_external_warnings</span> : <code class="type"><a href="Ast_iterator.html#TYPEiterator">Ast_iterator.iterator</a></code></pre>
<pre><span id="VALwarn_on_literal_pattern"><span class="keyword">val</span> warn_on_literal_pattern</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre>
<pre><span id="VALexplicit_arity"><span class="keyword">val</span> explicit_arity</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre>
<pre><span id="VALimmediate"><span class="keyword">val</span> immediate</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre>
<pre><span id="VALhas_unboxed"><span class="keyword">val</span> has_unboxed</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre>
<pre><span id="VALhas_boxed"><span class="keyword">val</span> has_boxed</span> : <code class="type"><a href="Parsetree.html#TYPEattributes">Parsetree.attributes</a> -&gt; bool</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>