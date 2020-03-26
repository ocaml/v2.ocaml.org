<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Timings.html">Timings</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;file&nbsp;=&nbsp;string
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;source_provenance&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">File</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Pack</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Startup</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Toplevel</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;compiler_pass&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">All</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Parsing</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Preprocessing</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Typing</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Transl</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Generate</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.file
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Assemble</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Clambda</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Cmm</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Compile_phrases</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Selection</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Comballoc</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">CSE</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Liveness</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Deadcode</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Spill</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Split</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Regalloc</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Linearize</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Scheduling</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Emit</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Flambda_pass</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;<span class="constructor">Timings</span>.source_provenance
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;reset&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;get&nbsp;:&nbsp;<span class="constructor">Timings</span>.compiler_pass&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;option
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;time&nbsp;:&nbsp;<span class="constructor">Timings</span>.compiler_pass&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;accumulate_time&nbsp;:&nbsp;<span class="constructor">Timings</span>.compiler_pass&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>