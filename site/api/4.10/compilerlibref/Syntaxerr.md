<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Syntaxerr</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Syntaxerr.html">Syntaxerr</a></h1>

<pre><span id="MODULESyntaxerr"><span class="keyword">module</span> Syntaxerr</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Syntaxerr.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Auxiliary type for reporting syntax errors</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Unclosed"><span class="constructor">Unclosed</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string * <a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Expecting"><span class="constructor">Expecting</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Not_expecting"><span class="constructor">Not_expecting</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Applicative_path"><span class="constructor">Applicative_path</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Variable_in_scope"><span class="constructor">Variable_in_scope</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Other"><span class="constructor">Other</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Ill_formed_ast"><span class="constructor">Ill_formed_ast</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Invalid_package_type"><span class="constructor">Invalid_package_type</span></span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * string</code></code></td>

</tr></tbody></table>



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Syntaxerr.html#TYPEerror">error</a></code></pre>

<pre><span id="EXCEPTIONEscape_error"><span class="keyword">exception</span> Escape_error</span></pre>

<pre><span id="VALlocation_of_error"><span class="keyword">val</span> location_of_error</span> : <code class="type"><a href="Syntaxerr.html#TYPEerror">error</a> -&gt; <a href="Location.html#TYPEt">Location.t</a></code></pre>
<pre><span id="VALill_formed_ast"><span class="keyword">val</span> ill_formed_ast</span> : <code class="type"><a href="Location.html#TYPEt">Location.t</a> -&gt; string -&gt; 'a</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>