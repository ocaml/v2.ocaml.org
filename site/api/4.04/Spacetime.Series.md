<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Spacetime.Series</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Spacetime.Series.html">Spacetime.Series</a></h1>

<pre><span class="keyword">module</span> Series: <code class="code"><span class="keyword">sig</span></code> <a href="Spacetime.Series.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
Type representing a file that will hold a series of heap snapshots
      together with additional information required to interpret those
      snapshots.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">path:string -&gt; <a href="Spacetime.Series.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">create&nbsp;~path</code> creates a series file at <code class="code">path</code>.<br>
</div>

<pre><span id="VALsave_event"><span class="keyword">val</span> save_event</span> : <code class="type">?time:float -&gt; <a href="Spacetime.Series.html#TYPEt">t</a> -&gt; event_name:string -&gt; unit</code></pre><div class="info ">
<code class="code">save_event</code> writes an event, which is an arbitrary string, into the
      given series file.  This may be used for identifying particular points
      during program execution when analysing the profile.
      The optional <code class="code">time</code> parameter is as for <code class="code"><span class="constructor">Snapshot</span>.take</code>.<br>
</div>

<pre><span id="VALsave_and_close"><span class="keyword">val</span> save_and_close</span> : <code class="type">?time:float -&gt; <a href="Spacetime.Series.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">save_and_close&nbsp;series</code> writes information into <code class="code">series</code> required for
      interpeting the snapshots that <code class="code">series</code> contains and then closes the
      <code class="code">series</code> file. This function must be called to produce a valid series
      file.
      The optional <code class="code">time</code> parameter is as for <code class="code"><span class="constructor">Snapshot</span>.take</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>