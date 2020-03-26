<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Pervasives.LargeFile</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Pervasives.LargeFile.html">Pervasives.LargeFile</a></h1>

<pre><span id="MODULELargeFile"><span class="keyword">module</span> LargeFile</span>: <code class="type"><a href="Stdlib.LargeFile.html">LargeFile</a></code></pre><hr width="100%">

<pre><span id="VALseek_out"><span class="keyword">val</span> seek_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int64 -&gt; unit</code></pre>
<pre><span id="VALpos_out"><span class="keyword">val</span> pos_out</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int64</code></pre>
<pre><span id="VALout_channel_length"><span class="keyword">val</span> out_channel_length</span> : <code class="type"><a href="Stdlib.html#TYPEout_channel">out_channel</a> -&gt; int64</code></pre>
<pre><span id="VALseek_in"><span class="keyword">val</span> seek_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int64 -&gt; unit</code></pre>
<pre><span id="VALpos_in"><span class="keyword">val</span> pos_in</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int64</code></pre>
<pre><span id="VALin_channel_length"><span class="keyword">val</span> in_channel_length</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; int64</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>