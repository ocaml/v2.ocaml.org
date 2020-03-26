<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pprintast</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pprintast.html">Pprintast</a></h1>

<pre><span class="keyword">module</span> Pprintast: <code class="code"><span class="keyword">sig</span></code> <a href="Pprintast.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEspace_formatter"><span class="keyword">type</span> <code class="type"></code>space_formatter</span> = <code class="type">(unit, <a href="Format.html#TYPEformatter">Format.formatter</a>, unit) <a href="Pervasives.html#TYPEformat">format</a></code> </pre>


<pre><span id="VALtoplevel_phrase"><span class="keyword">val</span> toplevel_phrase</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> -&gt; unit</code></pre>
<pre><span id="VALexpression"><span class="keyword">val</span> expression</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; unit</code></pre>
<pre><span id="VALstring_of_expression"><span class="keyword">val</span> string_of_expression</span> : <code class="type"><a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; string</code></pre>
<pre><span id="VALtop_phrase"><span class="keyword">val</span> top_phrase</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> -&gt; unit</code></pre>
<pre><span id="VALcore_type"><span class="keyword">val</span> core_type</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a> -&gt; unit</code></pre>
<pre><span id="VALpattern"><span class="keyword">val</span> pattern</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEpattern">Parsetree.pattern</a> -&gt; unit</code></pre>
<pre><span id="VALsignature"><span class="keyword">val</span> signature</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; unit</code></pre>
<pre><span id="VALstructure"><span class="keyword">val</span> structure</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; unit</code></pre>
<pre><span id="VALstring_of_structure"><span class="keyword">val</span> string_of_structure</span> : <code class="type"><a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; string</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>