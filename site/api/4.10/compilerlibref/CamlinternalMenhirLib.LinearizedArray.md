<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.LinearizedArray</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalMenhirLib.LinearizedArray.html">CamlinternalMenhirLib.LinearizedArray</a></h1>

<pre><span id="MODULELinearizedArray"><span class="keyword">module</span> LinearizedArray</span>: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.LinearizedArray.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> = <code class="type">'a array * int array</code> </pre>


<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">'a array array -&gt; 'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a></code></pre>
<pre><span id="VALread"><span class="keyword">val</span> read</span> : <code class="type">'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a</code></pre>
<pre><span id="VALwrite"><span class="keyword">val</span> write</span> : <code class="type">'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALrow_length"><span class="keyword">val</span> row_length</span> : <code class="type">'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a> -&gt; int -&gt; int</code></pre>
<pre><span id="VALread_row"><span class="keyword">val</span> read_row</span> : <code class="type">'a <a href="CamlinternalMenhirLib.LinearizedArray.html#TYPEt">t</a> -&gt; int -&gt; 'a list</code></pre>
<pre><span id="VALrow_length_via"><span class="keyword">val</span> row_length_via</span> : <code class="type">(int -&gt; int) -&gt; int -&gt; int</code></pre>
<pre><span id="VALread_via"><span class="keyword">val</span> read_via</span> : <code class="type">(int -&gt; 'a) -&gt; (int -&gt; int) -&gt; int -&gt; int -&gt; 'a</code></pre>
<pre><span id="VALread_row_via"><span class="keyword">val</span> read_row_via</span> : <code class="type">(int -&gt; 'a) -&gt; (int -&gt; int) -&gt; int -&gt; 'a list</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>