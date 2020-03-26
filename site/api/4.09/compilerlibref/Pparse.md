<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pparse</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pparse.html">Pparse</a></h1>

<pre><span id="MODULEPparse"><span class="keyword">module</span> Pparse</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Pparse.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Driver for the parser and external preprocessors.</p>

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
<code><span id="TYPEELTerror.CannotRun"><span class="constructor">CannotRun</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.WrongMagic"><span class="constructor">WrongMagic</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr></tbody></table>



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Pparse.html#TYPEerror">error</a></code></pre>

<pre><span id="VALpreprocess"><span class="keyword">val</span> preprocess</span> : <code class="type">string -&gt; string</code></pre>
<pre><span id="VALremove_preprocessed"><span class="keyword">val</span> remove_preprocessed</span> : <code class="type">string -&gt; unit</code></pre>
<pre><code><span id="TYPEast_kind"><span class="keyword">type</span> <code class="type">'a</code> ast_kind</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTast_kind.Structure"><span class="constructor">Structure</span></span> <span class="keyword">:</span> <code class="type"><a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> <a href="Pparse.html#TYPEast_kind">ast_kind</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTast_kind.Signature"><span class="constructor">Signature</span></span> <span class="keyword">:</span> <code class="type"><a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> <a href="Pparse.html#TYPEast_kind">ast_kind</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALread_ast"><span class="keyword">val</span> read_ast</span> : <code class="type">'a <a href="Pparse.html#TYPEast_kind">ast_kind</a> -&gt; string -&gt; 'a</code></pre>
<pre><span id="VALwrite_ast"><span class="keyword">val</span> write_ast</span> : <code class="type">'a <a href="Pparse.html#TYPEast_kind">ast_kind</a> -&gt; string -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALfile"><span class="keyword">val</span> file</span> : <code class="type">tool_name:string -&gt;<br>       string -&gt; (Lexing.lexbuf -&gt; 'a) -&gt; 'a <a href="Pparse.html#TYPEast_kind">ast_kind</a> -&gt; 'a</code></pre>
<pre><span id="VALapply_rewriters"><span class="keyword">val</span> apply_rewriters</span> : <code class="type">?restore:bool -&gt; tool_name:string -&gt; 'a <a href="Pparse.html#TYPEast_kind">ast_kind</a> -&gt; 'a -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>If <code class="code">restore&nbsp;=&nbsp;<span class="keyword">true</span></code> (the default), cookies set by external
      rewriters will be kept for later calls.</p>
</div>
</div>

<pre><span id="VALapply_rewriters_str"><span class="keyword">val</span> apply_rewriters_str</span> : <code class="type">?restore:bool -&gt;<br>       tool_name:string -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a></code></pre>
<pre><span id="VALapply_rewriters_sig"><span class="keyword">val</span> apply_rewriters_sig</span> : <code class="type">?restore:bool -&gt;<br>       tool_name:string -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a></code></pre>
<pre><span id="VALreport_error"><span class="keyword">val</span> report_error</span> : <code class="type">Format.formatter -&gt; <a href="Pparse.html#TYPEerror">error</a> -&gt; unit</code></pre>
<pre><span id="VALparse_implementation"><span class="keyword">val</span> parse_implementation</span> : <code class="type">tool_name:string -&gt; string -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a></code></pre>
<pre><span id="VALparse_interface"><span class="keyword">val</span> parse_interface</span> : <code class="type">tool_name:string -&gt; string -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a></code></pre>
<pre><span id="VALcall_external_preprocessor"><span class="keyword">val</span> call_external_preprocessor</span> : <code class="type">string -&gt; string -&gt; string</code></pre>
<pre><span id="VALopen_and_check_magic"><span class="keyword">val</span> open_and_check_magic</span> : <code class="type">string -&gt; string -&gt; in_channel * bool</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>