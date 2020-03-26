<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.ErrorReports</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.ErrorReports.html">CamlinternalMenhirLib.ErrorReports</a></h1>

<pre><span id="MODULEErrorReports"><span class="keyword">module</span> ErrorReports</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.ErrorReports.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEbuffer"><span class="keyword">type</span> <code class="type">'a</code> buffer</span> </pre>


<pre><span id="VALwrap"><span class="keyword">val</span> wrap</span> : <code class="type">(Lexing.lexbuf -&gt; 'token) -&gt;<br>       (Lexing.position * Lexing.position)<br>       <a href="CamlinternalMenhirLib.ErrorReports.html#TYPEbuffer">buffer</a> * (Lexing.lexbuf -&gt; 'token)</code></pre>
<pre><span id="VALshow"><span class="keyword">val</span> show</span> : <code class="type">('a -&gt; string) -&gt; 'a <a href="CamlinternalMenhirLib.ErrorReports.html#TYPEbuffer">buffer</a> -&gt; string</code></pre>
<pre><span id="VALlast"><span class="keyword">val</span> last</span> : <code class="type">'a <a href="CamlinternalMenhirLib.ErrorReports.html#TYPEbuffer">buffer</a> -&gt; 'a</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>