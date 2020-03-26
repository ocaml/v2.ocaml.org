<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Timings</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Timings.html">Timings</a></h1>

<pre><span class="keyword">module</span> Timings: <code class="code"><span class="keyword">sig</span></code> <a href="Timings.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Compiler performance recording<br>
</div>
<hr width="100%">

<pre><span id="TYPEfile"><span class="keyword">type</span> <code class="type"></code>file</span> = <code class="type">string</code> </pre>


<pre><code><span id="TYPEsource_provenance"><span class="keyword">type</span> <code class="type"></code>source_provenance</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsource_provenance.File"><span class="constructor">File</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsource_provenance.Pack"><span class="constructor">Pack</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsource_provenance.Startup"><span class="constructor">Startup</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsource_provenance.Toplevel"><span class="constructor">Toplevel</span></span></code></td>

</tr></tbody></table>



<pre><code><span id="TYPEcompiler_pass"><span class="keyword">type</span> <code class="type"></code>compiler_pass</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.All"><span class="constructor">All</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Parsing"><span class="constructor">Parsing</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Preprocessing"><span class="constructor">Preprocessing</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Typing"><span class="constructor">Typing</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Transl"><span class="constructor">Transl</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Generate"><span class="constructor">Generate</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEfile">file</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Assemble"><span class="constructor">Assemble</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Clambda"><span class="constructor">Clambda</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Cmm"><span class="constructor">Cmm</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Compile_phrases"><span class="constructor">Compile_phrases</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Selection"><span class="constructor">Selection</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Comballoc"><span class="constructor">Comballoc</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.CSE"><span class="constructor">CSE</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Liveness"><span class="constructor">Liveness</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Deadcode"><span class="constructor">Deadcode</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Spill"><span class="constructor">Spill</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Split"><span class="constructor">Split</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Regalloc"><span class="constructor">Regalloc</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Linearize"><span class="constructor">Linearize</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Scheduling"><span class="constructor">Scheduling</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Emit"><span class="constructor">Emit</span></span> <span class="keyword">of</span> <code class="type"><a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcompiler_pass.Flambda_pass"><span class="constructor">Flambda_pass</span></span> <span class="keyword">of</span> <code class="type">string * <a href="Timings.html#TYPEsource_provenance">source_provenance</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
erase all recorded times<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type"><a href="Timings.html#TYPEcompiler_pass">compiler_pass</a> -&gt; float option</code></pre><div class="info ">
returns the runtime in seconds of a completed pass<br>
</div>

<pre><span id="VALtime"><span class="keyword">val</span> time</span> : <code class="type"><a href="Timings.html#TYPEcompiler_pass">compiler_pass</a> -&gt; ('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
<code class="code">time&nbsp;pass&nbsp;f&nbsp;arg</code> Record the runtime of <code class="code">f&nbsp;arg</code><br>
</div>

<pre><span id="VALaccumulate_time"><span class="keyword">val</span> accumulate_time</span> : <code class="type"><a href="Timings.html#TYPEcompiler_pass">compiler_pass</a> -&gt; ('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
Like time for passes that can run multiple times<br>
</div>

<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; unit</code></pre><div class="info ">
Prints all recorded timings to the formatter.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>