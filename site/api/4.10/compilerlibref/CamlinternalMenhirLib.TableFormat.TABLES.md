<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.TableFormat.TABLES</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_CamlinternalMenhirLib.TableFormat.TABLES.html">CamlinternalMenhirLib.TableFormat.TABLES</a></h1>

<pre><span id="MODULETYPETABLES"><span class="keyword">module type</span> TABLES</span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.TableFormat.TABLES.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEtoken"><span class="keyword">type</span> <code class="type"></code>token</span> </pre>


<pre><span id="VALtoken2terminal"><span class="keyword">val</span> token2terminal</span> : <code class="type"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html#TYPEtoken">token</a> -&gt; int</code></pre>
<pre><span id="VALerror_terminal"><span class="keyword">val</span> error_terminal</span> : <code class="type">int</code></pre>
<pre><span id="VALtoken2value"><span class="keyword">val</span> token2value</span> : <code class="type"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html#TYPEtoken">token</a> -&gt; Obj.t</code></pre>
<pre><span id="VALdefault_reduction"><span class="keyword">val</span> default_reduction</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALerror"><span class="keyword">val</span> error</span> : <code class="type">int * string</code></pre>
<pre><span id="VALaction"><span class="keyword">val</span> action</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a> *<br>       <a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALlhs"><span class="keyword">val</span> lhs</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALgoto"><span class="keyword">val</span> goto</span> : <code class="type"><a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a> *<br>       <a href="CamlinternalMenhirLib.PackedIntArray.html#TYPEt">CamlinternalMenhirLib.PackedIntArray.t</a></code></pre>
<pre><span id="VALstart"><span class="keyword">val</span> start</span> : <code class="type">int</code></pre>
<pre><span id="VALsemantic_action"><span class="keyword">val</span> semantic_action</span> : <code class="type">((int, Obj.t, <a href="CamlinternalMenhirLib.TableFormat.TABLES.html#TYPEtoken">token</a>)<br>        <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEenv">CamlinternalMenhirLib.EngineTypes.env</a> -&gt;<br>        (int, Obj.t) <a href="CamlinternalMenhirLib.EngineTypes.html#TYPEstack">CamlinternalMenhirLib.EngineTypes.stack</a>)<br>       array</code></pre>
<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span></pre>

<pre><span id="VALtrace"><span class="keyword">val</span> trace</span> : <code class="type">(string array * string array) option</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>