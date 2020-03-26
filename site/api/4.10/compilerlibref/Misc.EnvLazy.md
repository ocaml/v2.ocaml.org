<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.EnvLazy</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.EnvLazy.html">Misc.EnvLazy</a></h1>

<pre><span id="MODULEEnvLazy"><span class="keyword">module</span> EnvLazy</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.EnvLazy.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b)</code> t</span> </pre>


<pre><span id="TYPElog"><span class="keyword">type</span> <code class="type"></code>log</span> </pre>


<pre><span id="VALforce"><span class="keyword">val</span> force</span> : <code class="type">('a -&gt; 'b) -&gt; ('a, 'b) <a href="Misc.EnvLazy.html#TYPEt">t</a> -&gt; 'b</code></pre>
<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">'a -&gt; ('a, 'b) <a href="Misc.EnvLazy.html#TYPEt">t</a></code></pre>
<pre><span id="VALget_arg"><span class="keyword">val</span> get_arg</span> : <code class="type">('a, 'b) <a href="Misc.EnvLazy.html#TYPEt">t</a> -&gt; 'a option</code></pre>
<pre><span id="VALcreate_forced"><span class="keyword">val</span> create_forced</span> : <code class="type">'b -&gt; ('a, 'b) <a href="Misc.EnvLazy.html#TYPEt">t</a></code></pre>
<pre><span id="VALcreate_failed"><span class="keyword">val</span> create_failed</span> : <code class="type">exn -&gt; ('a, 'b) <a href="Misc.EnvLazy.html#TYPEt">t</a></code></pre>
<pre><span id="VALlog"><span class="keyword">val</span> log</span> : <code class="type">unit -&gt; <a href="Misc.EnvLazy.html#TYPElog">log</a></code></pre>
<pre><span id="VALforce_logged"><span class="keyword">val</span> force_logged</span> : <code class="type"><a href="Misc.EnvLazy.html#TYPElog">log</a> -&gt;<br>       ('a -&gt; ('b, 'c) result) -&gt;<br>       ('a, ('b, 'c) result) <a href="Misc.EnvLazy.html#TYPEt">t</a> -&gt; ('b, 'c) result</code></pre>
<pre><span id="VALbacktrack"><span class="keyword">val</span> backtrack</span> : <code class="type"><a href="Misc.EnvLazy.html#TYPElog">log</a> -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>