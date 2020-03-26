<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pprintast</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pprintast.html">Pprintast</a></h1>

<pre><span id="MODULEPprintast"><span class="keyword">module</span> Pprintast</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Pprintast.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Pretty-printers for <a href="Parsetree.html"><code class="code"><span class="constructor">Parsetree</span></code></a></p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEspace_formatter"><span class="keyword">type</span> <code class="type"></code>space_formatter</span> = <code class="type">(unit, Format.formatter, unit) format</code> </pre>


<pre><span id="VALlongident"><span class="keyword">val</span> longident</span> : <code class="type">Format.formatter -&gt; <a href="Longident.html#TYPEt">Longident.t</a> -&gt; unit</code></pre>
<pre><span id="VALexpression"><span class="keyword">val</span> expression</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; unit</code></pre>
<pre><span id="VALstring_of_expression"><span class="keyword">val</span> string_of_expression</span> : <code class="type"><a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; string</code></pre>
<pre><span id="VALpattern"><span class="keyword">val</span> pattern</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEpattern">Parsetree.pattern</a> -&gt; unit</code></pre>
<pre><span id="VALcore_type"><span class="keyword">val</span> core_type</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a> -&gt; unit</code></pre>
<pre><span id="VALsignature"><span class="keyword">val</span> signature</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; unit</code></pre>
<pre><span id="VALstructure"><span class="keyword">val</span> structure</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; unit</code></pre>
<pre><span id="VALstring_of_structure"><span class="keyword">val</span> string_of_structure</span> : <code class="type"><a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; string</code></pre>
<pre><span id="VALtoplevel_phrase"><span class="keyword">val</span> toplevel_phrase</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> -&gt; unit</code></pre>
<pre><span id="VALtop_phrase"><span class="keyword">val</span> top_phrase</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> -&gt; unit</code></pre>
<pre><span id="VALtyvar"><span class="keyword">val</span> tyvar</span> : <code class="type">Format.formatter -&gt; string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Print a type variable name, taking care of the special treatment
      required for the single quote character in second position.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>