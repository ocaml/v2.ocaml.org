<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html">CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE</a></h1>

<pre><span id="MODULETYPEMONOLITHIC_ENGINE"><span class="keyword">module type</span> MONOLITHIC_ENGINE</span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEstate"><span class="keyword">type</span> <code class="type"></code>state</span> </pre>


<pre><span id="TYPEtoken"><span class="keyword">type</span> <code class="type"></code>token</span> </pre>


<pre><span id="TYPEsemantic_value"><span class="keyword">type</span> <code class="type"></code>semantic_value</span> </pre>


<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span></pre>

<pre><span id="VALentry"><span class="keyword">val</span> entry</span> : <code class="type"><a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html#TYPEstate">state</a> -&gt;<br>       (Lexing.lexbuf -&gt;<br>        <a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html#TYPEtoken">token</a>) -&gt;<br>       Lexing.lexbuf -&gt;<br>       <a href="CamlinternalMenhirLib.EngineTypes.MONOLITHIC_ENGINE.html#TYPEsemantic_value">semantic_value</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>