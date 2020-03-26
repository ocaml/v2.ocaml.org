<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Clflags.Compiler_pass</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Clflags.Compiler_pass.html">Clflags.Compiler_pass</a></h1>

<pre><span id="MODULECompiler_pass"><span class="keyword">module</span> Compiler_pass</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Clflags.Compiler_pass.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><code><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Parsing"><span class="constructor">Parsing</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTt.Typing"><span class="constructor">Typing</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; <a href="Clflags.Compiler_pass.html#TYPEt">t</a> option</code></pre>
<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type"><a href="Clflags.Compiler_pass.html#TYPEt">t</a> -&gt; string</code></pre>
<pre><span id="VALpasses"><span class="keyword">val</span> passes</span> : <code class="type"><a href="Clflags.Compiler_pass.html#TYPEt">t</a> list</code></pre>
<pre><span id="VALpass_names"><span class="keyword">val</span> pass_names</span> : <code class="type">string list</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>