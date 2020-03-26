<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.TableInterpreter.MakeEngineTable</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_CamlinternalMenhirLib.TableInterpreter.MakeEngineTable.html">CamlinternalMenhirLib.TableInterpreter.MakeEngineTable</a></h1>

<pre><span id="MODULEMakeEngineTable"><span class="keyword">module</span> MakeEngineTable</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">T</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html">CamlinternalMenhirLib.TableFormat.TABLES</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">CamlinternalMenhirLib.EngineTypes.TABLE</a></code><code class="type"> 
    with type state = int
     and type token = T.token
     and type semantic_value = Obj.t
     and type production = int
     and type terminal = int
     and type nonterminal = int</code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>T</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html">CamlinternalMenhirLib.TableFormat.TABLES</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEstate"><span class="keyword">type</span> <code class="type"></code>state</span> </pre>


<pre><span id="VALnumber"><span class="keyword">val</span> number</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt; int</code></pre>
<pre><span id="TYPEtoken"><span class="keyword">type</span> <code class="type"></code>token</span> </pre>


<pre><span id="TYPEterminal"><span class="keyword">type</span> <code class="type"></code>terminal</span> </pre>


<pre><span id="TYPEnonterminal"><span class="keyword">type</span> <code class="type"></code>nonterminal</span> </pre>


<pre><span id="TYPEsemantic_value"><span class="keyword">type</span> <code class="type"></code>semantic_value</span> </pre>


<pre><span id="VALtoken2terminal"><span class="keyword">val</span> token2terminal</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEtoken">token</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEterminal">terminal</a></code></pre>
<pre><span id="VALtoken2value"><span class="keyword">val</span> token2value</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEtoken">token</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a></code></pre>
<pre><span id="VALerror_terminal"><span class="keyword">val</span> error_terminal</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEterminal">terminal</a></code></pre>
<pre><span id="VALerror_value"><span class="keyword">val</span> error_value</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a></code></pre>
<pre><span id="VALforeach_terminal"><span class="keyword">val</span> foreach_terminal</span> : <code class="type">(<a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEterminal">terminal</a> -&gt; 'a -&gt; 'a) -&gt; 'a -&gt; 'a</code></pre>
<pre><span id="TYPEproduction"><span class="keyword">type</span> <code class="type"></code>production</span> </pre>


<pre><span id="VALproduction_index"><span class="keyword">val</span> production_index</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt; int</code></pre>
<pre><span id="VALfind_production"><span class="keyword">val</span> find_production</span> : <code class="type">int -&gt; <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a></code></pre>
<pre><span id="VALdefault_reduction"><span class="keyword">val</span> default_reduction</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       ('env -&gt; <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt; 'answer) -&gt;<br>       ('env -&gt; 'answer) -&gt; 'env -&gt; 'answer</code></pre>
<pre><span id="VALaction"><span class="keyword">val</span> action</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEterminal">terminal</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a> -&gt;<br>       ('env -&gt;<br>        bool -&gt;<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEterminal">terminal</a> -&gt;<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a> -&gt;<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt; 'answer) -&gt;<br>       ('env -&gt; <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt; 'answer) -&gt;<br>       ('env -&gt; 'answer) -&gt; 'env -&gt; 'answer</code></pre>
<pre><span id="VALgoto_nt"><span class="keyword">val</span> goto_nt</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEnonterminal">nonterminal</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a></code></pre>
<pre><span id="VALgoto_prod"><span class="keyword">val</span> goto_prod</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a></code></pre>
<pre><span id="VALmaybe_goto_nt"><span class="keyword">val</span> maybe_goto_nt</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEnonterminal">nonterminal</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> option</code></pre>
<pre><span id="VALis_start"><span class="keyword">val</span> is_start</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt; bool</code></pre>
<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span></pre>

<pre><span id="TYPEsemantic_action"><span class="keyword">type</span> <code class="type"></code>semantic_action</span> = <code class="type">(<a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a>,<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a>,<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEtoken">token</a>)<br>       <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEenv">CamlinternalMenhirLib.EngineTypes.env</a> -&gt;<br>       (<a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a>,<br>        <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_value">semantic_value</a>)<br>       <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEstack">CamlinternalMenhirLib.EngineTypes.stack</a></code> </pre>


<pre><span id="VALsemantic_action"><span class="keyword">val</span> semantic_action</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEsemantic_action">semantic_action</a></code></pre>
<pre><span id="VALmay_reduce"><span class="keyword">val</span> may_reduce</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEstate">state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.TABLE.html#TYPEproduction">production</a> -&gt; bool</code></pre>
<pre><span id="VALlog"><span class="keyword">val</span> log</span> : <code class="type">bool</code></pre>
<pre><span id="MODULELog"><span class="keyword">module</span> <a href="CamlinternalMenhirLib.EngineTypes.TABLE.Log.html">Log</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.TABLE.Log.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>