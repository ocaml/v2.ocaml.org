<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Clflags.Int_arg_helper</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Clflags.Int_arg_helper.html">Clflags.Int_arg_helper</a></h1>

<pre><span id="MODULEInt_arg_helper"><span class="keyword">module</span> Int_arg_helper</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Clflags.Int_arg_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Optimization parameters represented as ints indexed by round number.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEparsed"><span class="keyword">type</span> <code class="type"></code>parsed</span> </pre>


<pre><span id="VALparse"><span class="keyword">val</span> parse</span> : <code class="type">string -&gt; string -&gt; <a href="Clflags.Int_arg_helper.html#TYPEparsed">parsed</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt; unit</code></pre>
<pre><code><span id="TYPEparse_result"><span class="keyword">type</span> <code class="type"></code>parse_result</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTparse_result.Ok"><span class="constructor">Ok</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTparse_result.Parse_failed"><span class="constructor">Parse_failed</span></span> <span class="keyword">of</span> <code class="type">exn</code></code></td>

</tr></tbody></table>



<pre><span id="VALparse_no_error"><span class="keyword">val</span> parse_no_error</span> : <code class="type">string -&gt;<br>       <a href="Clflags.Int_arg_helper.html#TYPEparsed">parsed</a> <a href="Pervasives.html#TYPEref">ref</a> -&gt;<br>       <a href="Clflags.Int_arg_helper.html#TYPEparse_result">parse_result</a></code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">key:int -&gt; <a href="Clflags.Int_arg_helper.html#TYPEparsed">parsed</a> -&gt; int</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>