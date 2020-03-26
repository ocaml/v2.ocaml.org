<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.IncrementalEngine.INSPECTION</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html">CamlinternalMenhirLib.IncrementalEngine.INSPECTION</a></h1>

<pre><span id="MODULETYPEINSPECTION"><span class="keyword">module type</span> INSPECTION</span> = <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html">CamlinternalMenhirLib.IncrementalEngine.SYMBOLS</a></pre>

<pre><span id="TYPElr1state"><span class="keyword">type</span> <code class="type">'a</code> lr1state</span> </pre>


<pre><span id="TYPEproduction"><span class="keyword">type</span> <code class="type"></code>production</span> </pre>


<pre><span id="TYPEitem"><span class="keyword">type</span> <code class="type"></code>item</span> = <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEproduction">production</a> * int</code> </pre>


<pre><span id="VALcompare_terminals"><span class="keyword">val</span> compare_terminals</span> : <code class="type">'a terminal -&gt; 'b terminal -&gt; int</code></pre>
<pre><span id="VALcompare_nonterminals"><span class="keyword">val</span> compare_nonterminals</span> : <code class="type">'a nonterminal -&gt; 'b nonterminal -&gt; int</code></pre>
<pre><span id="VALcompare_symbols"><span class="keyword">val</span> compare_symbols</span> : <code class="type">xsymbol -&gt; xsymbol -&gt; int</code></pre>
<pre><span id="VALcompare_productions"><span class="keyword">val</span> compare_productions</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEproduction">production</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEproduction">production</a> -&gt; int</code></pre>
<pre><span id="VALcompare_items"><span class="keyword">val</span> compare_items</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEitem">item</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEitem">item</a> -&gt; int</code></pre>
<pre><span id="VALincoming_symbol"><span class="keyword">val</span> incoming_symbol</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPElr1state">lr1state</a> -&gt; 'a symbol</code></pre>
<pre><span id="VALitems"><span class="keyword">val</span> items</span> : <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPElr1state">lr1state</a> -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEitem">item</a> list</code></pre>
<pre><span id="VALlhs"><span class="keyword">val</span> lhs</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEproduction">production</a> -&gt; xsymbol</code></pre>
<pre><span id="VALrhs"><span class="keyword">val</span> rhs</span> : <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEproduction">production</a> -&gt; xsymbol list</code></pre>
<pre><span id="VALnullable"><span class="keyword">val</span> nullable</span> : <code class="type">'a nonterminal -&gt; bool</code></pre>
<pre><span id="VALfirst"><span class="keyword">val</span> first</span> : <code class="type">'a nonterminal -&gt; 'b terminal -&gt; bool</code></pre>
<pre><span id="VALxfirst"><span class="keyword">val</span> xfirst</span> : <code class="type">xsymbol -&gt; 'a terminal -&gt; bool</code></pre>
<pre><span id="VALforeach_terminal"><span class="keyword">val</span> foreach_terminal</span> : <code class="type">(xsymbol -&gt; 'a -&gt; 'a) -&gt; 'a -&gt; 'a</code></pre>
<pre><span id="VALforeach_terminal_but_error"><span class="keyword">val</span> foreach_terminal_but_error</span> : <code class="type">(xsymbol -&gt; 'a -&gt; 'a) -&gt; 'a -&gt; 'a</code></pre>
<pre><span id="TYPEenv"><span class="keyword">type</span> <code class="type">'a</code> env</span> </pre>


<pre><span id="VALfeed"><span class="keyword">val</span> feed</span> : <code class="type">'a symbol -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> -&gt;<br>       'a -&gt;<br>       <a href="CamlinternalMenhirLib.IncrementalEngine.html#TYPEposition">CamlinternalMenhirLib.IncrementalEngine.position</a> -&gt;<br>       'b <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEenv">env</a> -&gt;<br>       'b <a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html#TYPEenv">env</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>