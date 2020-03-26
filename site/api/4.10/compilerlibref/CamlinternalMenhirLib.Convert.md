<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.Convert</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.Convert.html">CamlinternalMenhirLib.Convert</a></h1>

<pre><span id="MODULEConvert"><span class="keyword">module</span> Convert</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.Convert.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEtraditional"><span class="keyword">type</span> <code class="type">('token, 'semantic_value)</code> traditional</span> = <code class="type">(Lexing.lexbuf -&gt; 'token) -&gt; Lexing.lexbuf -&gt; 'semantic_value</code> </pre>


<pre><span id="TYPErevised"><span class="keyword">type</span> <code class="type">('token, 'semantic_value)</code> revised</span> = <code class="type">(unit -&gt; 'token) -&gt; 'semantic_value</code> </pre>


<pre><span id="VALtraditional2revised"><span class="keyword">val</span> traditional2revised</span> : <code class="type">('token -&gt; 'raw_token) -&gt;<br>       ('token -&gt; Lexing.position) -&gt;<br>       ('token -&gt; Lexing.position) -&gt;<br>       ('raw_token, 'semantic_value) <a href="CamlinternalMenhirLib.Convert.html#TYPEtraditional">traditional</a> -&gt;<br>       ('token, 'semantic_value) <a href="CamlinternalMenhirLib.Convert.html#TYPErevised">revised</a></code></pre>
<pre><span id="VALrevised2traditional"><span class="keyword">val</span> revised2traditional</span> : <code class="type">('raw_token -&gt; Lexing.position -&gt; Lexing.position -&gt; 'token) -&gt;<br>       ('token, 'semantic_value) <a href="CamlinternalMenhirLib.Convert.html#TYPErevised">revised</a> -&gt;<br>       ('raw_token, 'semantic_value) <a href="CamlinternalMenhirLib.Convert.html#TYPEtraditional">traditional</a></code></pre>
<pre><span id="MODULESimplified"><span class="keyword">module</span> <a href="CamlinternalMenhirLib.Convert.Simplified.html">Simplified</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.Convert.Simplified.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>