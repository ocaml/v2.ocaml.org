<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.String</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.String.html">Misc.Stdlib.String</a></h1>

<pre><span class="keyword">module</span> String: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.String.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">string</code> </pre>


<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="Misc.Stdlib.String.html#TYPEt">t</a> -&gt; on:char -&gt; <a href="Misc.Stdlib.String.html#TYPEt">t</a> list</code></pre><div class="info ">
Splits the given string at every occurrence of the given separator.
        Does not return empty substrings when the separator is repeated or
        present at the start or end of the string.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>