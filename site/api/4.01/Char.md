<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Char</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Char.html">Char</a></h1>

<pre><span class="keyword">module</span> Char: <code class="code"><span class="keyword">sig</span></code> <a href="Char.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Character operations.<br>
</div>
<hr width="100%">

<pre><span id="VALcode"><span class="keyword">val</span> code</span> : <code class="type">char -&gt; int</code></pre><div class="info ">
Return the ASCII code of the argument.<br>
</div>

<pre><span id="VALchr"><span class="keyword">val</span> chr</span> : <code class="type">int -&gt; char</code></pre><div class="info ">
Return the character with the given ASCII code.
   Raise <code class="code"><span class="constructor">Invalid_argument</span> <span class="string">"Char.chr"</span></code> if the argument is
   outside the range 0--255.<br>
</div>

<pre><span id="VALescaped"><span class="keyword">val</span> escaped</span> : <code class="type">char -&gt; string</code></pre><div class="info ">
Return a string representing the given character,
   with special characters escaped following the lexical conventions
   of OCaml.<br>
</div>

<pre><span id="VALlowercase"><span class="keyword">val</span> lowercase</span> : <code class="type">char -&gt; char</code></pre><div class="info ">
Convert the given character to its equivalent lowercase character.<br>
</div>

<pre><span id="VALuppercase"><span class="keyword">val</span> uppercase</span> : <code class="type">char -&gt; char</code></pre><div class="info ">
Convert the given character to its equivalent uppercase character.<br>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">char</code> </pre>
<div class="info ">
An alias for the type of characters.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Char.html#TYPEt">t</a> -&gt; <a href="Char.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The comparison function for characters, with the same specification as
    <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>, this function <code class="code">compare</code>
    allows the module <code class="code"><span class="constructor">Char</span></code> to be passed as argument to the functors
    <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>