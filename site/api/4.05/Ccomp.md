<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ccomp</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ccomp.html">Ccomp</a></h1>

<pre><span class="keyword">module</span> Ccomp: <code class="code"><span class="keyword">sig</span></code> <a href="Ccomp.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="VALcommand"><span class="keyword">val</span> command</span> : <code class="type">string -&gt; int</code></pre>
<pre><span id="VALrun_command"><span class="keyword">val</span> run_command</span> : <code class="type">string -&gt; unit</code></pre>
<pre><span id="VALcompile_file"><span class="keyword">val</span> compile_file</span> : <code class="type">string -&gt; int</code></pre>
<pre><span id="VALcreate_archive"><span class="keyword">val</span> create_archive</span> : <code class="type">string -&gt; string list -&gt; int</code></pre>
<pre><span id="VALexpand_libname"><span class="keyword">val</span> expand_libname</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALquote_files"><span class="keyword">val</span> quote_files</span> : <code class="type">string list -&gt; string</code></pre>
<pre><span id="VALquote_optfile"><span class="keyword">val</span> quote_optfile</span> : <code class="type">string option -&gt; string</code></pre>
<pre><code><span id="TYPElink_mode"><span class="keyword">type</span> <code class="type"></code>link_mode</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlink_mode.Exe"><span class="constructor">Exe</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlink_mode.Dll"><span class="constructor">Dll</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlink_mode.MainDll"><span class="constructor">MainDll</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTlink_mode.Partial"><span class="constructor">Partial</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALcall_linker"><span class="keyword">val</span> call_linker</span> : <code class="type"><a href="Ccomp.html#TYPElink_mode">link_mode</a> -&gt; string -&gt; string list -&gt; string -&gt; bool</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>