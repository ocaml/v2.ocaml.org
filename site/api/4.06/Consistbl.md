<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Consistbl</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Consistbl.html">Consistbl</a></h1>

<pre><span id="MODULEConsistbl"><span class="keyword">module</span> Consistbl</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Consistbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; <a href="Consistbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type"><a href="Consistbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALcheck"><span class="keyword">val</span> check</span> : <code class="type"><a href="Consistbl.html#TYPEt">t</a> -&gt; string -&gt; <a href="Digest.html#TYPEt">Digest.t</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALcheck_noadd"><span class="keyword">val</span> check_noadd</span> : <code class="type"><a href="Consistbl.html#TYPEt">t</a> -&gt; string -&gt; <a href="Digest.html#TYPEt">Digest.t</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Consistbl.html#TYPEt">t</a> -&gt; string -&gt; <a href="Digest.html#TYPEt">Digest.t</a> -&gt; string -&gt; unit</code></pre>
<pre><span id="VALsource"><span class="keyword">val</span> source</span> : <code class="type"><a href="Consistbl.html#TYPEt">t</a> -&gt; string -&gt; string</code></pre>
<pre><span id="VALextract"><span class="keyword">val</span> extract</span> : <code class="type">string list -&gt; <a href="Consistbl.html#TYPEt">t</a> -&gt; (string * <a href="Digest.html#TYPEt">Digest.t</a> option) list</code></pre>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">(string -&gt; bool) -&gt; <a href="Consistbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="EXCEPTIONInconsistency"><span class="keyword">exception</span> Inconsistency</span> <span class="keyword">of</span> <code class="type">string * string * string</code></pre>

<pre><span id="EXCEPTIONNot_available"><span class="keyword">exception</span> Not_available</span> <span class="keyword">of</span> <code class="type">string</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>