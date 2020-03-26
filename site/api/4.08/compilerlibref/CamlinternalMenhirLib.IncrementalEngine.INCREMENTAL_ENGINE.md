<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html">CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE</a></h1>

<pre><span id="MODULETYPEINCREMENTAL_ENGINE"><span class="keyword">module type</span> INCREMENTAL_ENGINE</span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEtoken"><span class="keyword">type</span> <code class="type"></code>token</span> </pre>


<pre><span id="TYPEproduction"><span class="keyword">type</span> <code class="type"></code>production</span> </pre>


<pre><span id="TYPEenv"><span class="keyword">type</span> <code class="type">'a</code> env</span> </pre>


<pre><code><span id="TYPEcheckpoint"><span class="keyword">type</span> <code class="type">'a</code> checkpoint</span> = private </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.InputNeeded"><span class="constructor">InputNeeded</span></span> <span class="keyword">of</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.Shifting"><span class="constructor">Shifting</span></span> <span class="keyword">of</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a><br>        * 'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> * <br>       bool</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.AboutToReduce"><span class="constructor">AboutToReduce</span></span> <span class="keyword">of</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a><br>        * <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEproduction">production</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.HandlingError"><span class="constructor">HandlingError</span></span> <span class="keyword">of</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.Accepted"><span class="constructor">Accepted</span></span> <span class="keyword">of</span> <code class="type">'a</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTcheckpoint.Rejected"><span class="constructor">Rejected</span></span></code></td>

</tr></tbody></table>



<pre><span id="VALoffer"><span class="keyword">val</span> offer</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEtoken">token</a> *<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> *<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a></code></pre>
<pre><span id="VALresume"><span class="keyword">val</span> resume</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a></code></pre>
<pre><span id="TYPEsupplier"><span class="keyword">type</span> <code class="type"></code>supplier</span> = <code class="type">unit -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEtoken">token</a> *<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> *<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a></code> </pre>


<pre><span id="VALlexer_lexbuf_to_supplier"><span class="keyword">val</span> lexer_lexbuf_to_supplier</span> : <code class="type">(Lexing.lexbuf -&gt;<br>        <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEtoken">token</a>) -&gt;<br>       Lexing.lexbuf -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEsupplier">supplier</a></code></pre>
<pre><span id="VALloop"><span class="keyword">val</span> loop</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEsupplier">supplier</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       'a</code></pre>
<pre><span id="VALloop_handle"><span class="keyword">val</span> loop_handle</span> : <code class="type">('a -&gt; 'answer) -&gt;<br>       ('a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>        'answer) -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEsupplier">supplier</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       'answer</code></pre>
<pre><span id="VALloop_handle_undo"><span class="keyword">val</span> loop_handle_undo</span> : <code class="type">('a -&gt; 'answer) -&gt;<br>       ('a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>        'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>        'answer) -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEsupplier">supplier</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       'answer</code></pre>
<pre><span id="VALshifts"><span class="keyword">val</span> shifts</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> option</code></pre>
<pre><span id="VALacceptable"><span class="keyword">val</span> acceptable</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEtoken">token</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> -&gt; bool</code></pre>
<pre><span id="TYPElr1state"><span class="keyword">type</span> <code class="type">'a</code> lr1state</span> </pre>


<pre><span id="VALnumber"><span class="keyword">val</span> number</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPElr1state">lr1state</a> -&gt; int</code></pre>
<pre><span id="VALproduction_index"><span class="keyword">val</span> production_index</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEproduction">production</a> -&gt; int</code></pre>
<pre><span id="VALfind_production"><span class="keyword">val</span> find_production</span> : <code class="type">int -&gt; <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEproduction">production</a></code></pre>
<pre><code><span id="TYPEelement"><span class="keyword">type</span> <code class="type"></code>element</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTelement.Element"><span class="constructor">Element</span></span> <span class="keyword">:</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPElr1state">lr1state</a> * 'a<br>        * <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a><br>        * <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a></code> <span class="keyword">-&gt;</span> <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEelement">element</a></code></code></td>

</tr></tbody></table>



<pre><span id="TYPEstack"><span class="keyword">type</span> <code class="type"></code>stack</span> = <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEelement">element</a><br>       <a href="CamlinternalMenhirLib.General.html#TYPEstream">CamlinternalMenhirLib.General.stream</a></code> </pre>


<pre><span id="VALstack"><span class="keyword">val</span> stack</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEstack">stack</a></code></pre>
<pre><span id="VALtop"><span class="keyword">val</span> top</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEelement">element</a> option</code></pre>
<pre><span id="VALpop_many"><span class="keyword">val</span> pop_many</span> : <code class="type">int -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> option</code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">int -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEelement">element</a> option</code></pre>
<pre><span id="VALcurrent_state_number"><span class="keyword">val</span> current_state_number</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt; int</code></pre>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt; bool</code></pre>
<pre><span id="VALpositions"><span class="keyword">val</span> positions</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> *<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a></code></pre>
<pre><span id="VALenv_has_default_reduction"><span class="keyword">val</span> env_has_default_reduction</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt; bool</code></pre>
<pre><span id="VALstate_has_default_reduction"><span class="keyword">val</span> state_has_default_reduction</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPElr1state">lr1state</a> -&gt;<br>       bool</code></pre>
<pre><span id="VALpop"><span class="keyword">val</span> pop</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> option</code></pre>
<pre><span id="VALforce_reduction"><span class="keyword">val</span> force_reduction</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEproduction">production</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a></code></pre>
<pre><span id="VALinput_needed"><span class="keyword">val</span> input_needed</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEenv">env</a> -&gt;<br>       'a <a href="CamlinternalMenhirLib.IncrementalEngine.INCREMENTAL_ENGINE.html#TYPEcheckpoint">checkpoint</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>