<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Random.State</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Random.State.html">Random.State</a></h1>

<pre><span id="MODULEState"><span class="keyword">module</span> State</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Random.State.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of PRNG states.</p>
</div>
</div>


<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int array -&gt; <a href="Random.State.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a new state and initialize it with the given seed.</p>
</div>
</div>

<pre><span id="VALmake_self_init"><span class="keyword">val</span> make_self_init</span> : <code class="type">unit -&gt; <a href="Random.State.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Create a new state and initialize it with a system-dependent
      low-entropy seed.</p>
</div>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; <a href="Random.State.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the given state.</p>
</div>
</div>

<pre><span id="VALbits"><span class="keyword">val</span> bits</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALint"><span class="keyword">val</span> int</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; int -&gt; int</code></pre>
<pre><span id="VALint32"><span class="keyword">val</span> int32</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; <a href="Int32.html#TYPEt">Int32.t</a> -&gt; <a href="Int32.html#TYPEt">Int32.t</a></code></pre>
<pre><span id="VALnativeint"><span class="keyword">val</span> nativeint</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; <a href="Nativeint.html#TYPEt">Nativeint.t</a> -&gt; <a href="Nativeint.html#TYPEt">Nativeint.t</a></code></pre>
<pre><span id="VALint64"><span class="keyword">val</span> int64</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; <a href="Int64.html#TYPEt">Int64.t</a> -&gt; <a href="Int64.html#TYPEt">Int64.t</a></code></pre>
<pre><span id="VALfloat"><span class="keyword">val</span> float</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; float -&gt; float</code></pre>
<pre><span id="VALbool"><span class="keyword">val</span> bool</span> : <code class="type"><a href="Random.State.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>These functions are the same as the basic functions, except that they
      use (and update) the given PRNG state instead of the default one.</p>
</div>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>