<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Spacetime</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Spacetime.html">Stdlib.Spacetime</a></h1>

<pre><span id="MODULESpacetime"><span class="keyword">module</span> Spacetime</span>: <code class="type"><a href="Spacetime.html">Spacetime</a></code></pre><hr width="100%">

<pre><span id="VALenabled"><span class="keyword">val</span> enabled</span> : <code class="type">bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">enabled</code> is <code class="code"><span class="keyword">true</span></code> if the compiler is configured with spacetime and <code class="code"><span class="keyword">false</span></code>
    otherwise</p>
</div>
</div>

<pre><span id="MODULESeries"><span class="keyword">module</span> <a href="Spacetime.Series.html">Series</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.Series.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULESnapshot"><span class="keyword">module</span> <a href="Spacetime.Snapshot.html">Snapshot</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.Snapshot.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="VALsave_event_for_automatic_snapshots"><span class="keyword">val</span> save_event_for_automatic_snapshots</span> : <code class="type">event_name:string -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Like <a href="Spacetime.Series.html#VALsave_event"><code class="code"><span class="constructor">Spacetime</span>.<span class="constructor">Series</span>.save_event</code></a>, but writes to the automatic snapshot file.
    This function is a no-op if OCAML_SPACETIME_INTERVAL was not set.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>