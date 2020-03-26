<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.EngineTypes</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.EngineTypes.html">CamlinternalMenhirLib.EngineTypes</a></h1>

<pre><span id="MODULEEngineTypes"><span class="keyword">module</span> EngineTypes</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEstack"><span class="keyword">type</span> <code class="type">('state, 'semantic_value)</code> stack</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstack.state">state</span>&nbsp;: <code class="type">'state</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstack.semv">semv</span>&nbsp;: <code class="type">'semantic_value</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstack.startp">startp</span>&nbsp;: <code class="type">Lexing.position</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstack.endp">endp</span>&nbsp;: <code class="type">Lexing.position</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstack.next">next</span>&nbsp;: <code class="type">('state, 'semantic_value) <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEstack">stack</a></code>;</code></td>

</tr></tbody></table>
}



<pre><code><span id="TYPEenv"><span class="keyword">type</span> <code class="type">('state, 'semantic_value, 'token)</code> env</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTenv.error">error</span>&nbsp;: <code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTenv.triple">triple</span>&nbsp;: <code class="type">'token * Lexing.position * Lexing.position</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTenv.stack">stack</span>&nbsp;: <code class="type">('state, 'semantic_value) <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEstack">stack</a></code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTenv.current">current</span>&nbsp;: <code class="type">'state</code>;</code></td>

</tr></tbody></table>
}



<pre><span id="MODULETYPETABLE"><span class="keyword">module type</span> <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">TABLE</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPEMONOLITHIC_ENGINE"><span class="keyword">module type</span> <a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html">MONOLITHIC_ENGINE</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPEINCREMENTAL_ENGINE_START"><span class="keyword">module type</span> <a href="CamlinternalMenhirLib.EngineTypes.INCREMENTAL_ENGINE_START.html">INCREMENTAL_ENGINE_START</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.INCREMENTAL_ENGINE_START.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPEENGINE"><span class="keyword">module type</span> <a href="CamlinternalMenhirLib.EngineTypes.ENGINE.html">ENGINE</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.ENGINE.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>