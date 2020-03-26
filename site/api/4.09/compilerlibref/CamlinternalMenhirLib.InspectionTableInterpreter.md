<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.InspectionTableInterpreter</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.InspectionTableInterpreter.html">CamlinternalMenhirLib.InspectionTableInterpreter</a></h1>

<pre><span id="MODULEInspectionTableInterpreter"><span class="keyword">module</span> InspectionTableInterpreter</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.InspectionTableInterpreter.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="MODULESymbols"><span class="keyword">module</span> <a href="CamlinternalMenhirLib.InspectionTableInterpreter.Symbols.html">Symbols</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">T</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEterminal"><span class="keyword">type</span> <code class="type">'a</code> terminal</span> </pre>


<pre><span id="TYPEnonterminal"><span class="keyword">type</span> <code class="type">'a</code> nonterminal</span> </pre>

</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html">CamlinternalMenhirLib.IncrementalEngine.SYMBOLS</a></code><code class="type"> 
  with type 'a terminal := 'a T.terminal
   and type 'a nonterminal := 'a T.nonterminal</code></pre>
<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="CamlinternalMenhirLib.InspectionTableInterpreter.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">TT</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html">CamlinternalMenhirLib.TableFormat.TABLES</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">IT</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.InspectionTableFormat.TABLES.html">CamlinternalMenhirLib.InspectionTableFormat.TABLES</a></code><code class="type"> 
        with type 'a lr1state = int</code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">ET</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">CamlinternalMenhirLib.EngineTypes.TABLE</a></code><code class="type"> 
        with type terminal = int
         and type nonterminal = int
         and type semantic_value = Obj.t</code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">E</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></div></div></div></pre><div class="sig_block">
<pre><span id="TYPEenv"><span class="keyword">type</span> <code class="type">'a</code> env</span> = <code class="type">(ET.state, ET.semantic_value, ET.token) <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEenv">CamlinternalMenhirLib.EngineTypes.env</a></code> </pre>

</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html">CamlinternalMenhirLib.IncrementalEngine.INSPECTION</a></code><code class="type"> 
  with type 'a terminal := 'a IT.terminal
   and type 'a nonterminal := 'a IT.nonterminal
   and type 'a lr1state := 'a IT.lr1state
   and type production := int
   and type 'a env := 'a E.env</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>