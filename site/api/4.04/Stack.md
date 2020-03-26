<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stack</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stack.html">Stack</a></h1>

<pre><span class="keyword">module</span> Stack: <code class="code"><span class="keyword">sig</span></code> <a href="Stack.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Last-in first-out stacks.
<p>

   This module implements stacks (LIFOs), with in-place modification.<br>
</p></div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info ">
The type of stacks containing elements of type <code class="code"><span class="keywordsign">'</span>a</code>.<br>
</div>


<pre><span id="EXCEPTIONEmpty"><span class="keyword">exception</span> Empty</span></pre>
<div class="info ">
Raised when <a href="Stack.html#VALpop"><code class="code"><span class="constructor">Stack</span>.pop</code></a> or <a href="Stack.html#VALtop"><code class="code"><span class="constructor">Stack</span>.top</code></a> is applied to an empty stack.<br>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; 'a <a href="Stack.html#TYPEt">t</a></code></pre><div class="info ">
Return a new stack, initially empty.<br>
</div>

<pre><span id="VALpush"><span class="keyword">val</span> push</span> : <code class="type">'a -&gt; 'a <a href="Stack.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">push&nbsp;x&nbsp;s</code> adds the element <code class="code">x</code> at the top of stack <code class="code">s</code>.<br>
</div>

<pre><span id="VALpop"><span class="keyword">val</span> pop</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">pop&nbsp;s</code> removes and returns the topmost element in stack <code class="code">s</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the stack is empty.<br>
</div>

<pre><span id="VALtop"><span class="keyword">val</span> top</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<code class="code">top&nbsp;s</code> returns the topmost element in stack <code class="code">s</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the stack is empty.<br>
</div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Discard all elements from a stack.<br>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; 'a <a href="Stack.html#TYPEt">t</a></code></pre><div class="info ">
Return a copy of the given stack.<br>
</div>

<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
Return <code class="code"><span class="keyword">true</span></code> if the given stack is empty, <code class="code"><span class="keyword">false</span></code> otherwise.<br>
</div>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="Stack.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the number of elements in a stack. Time complexity O(1)<br>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Stack.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">iter&nbsp;f&nbsp;s</code> applies <code class="code">f</code> in turn to all elements of <code class="code">s</code>,
   from the element at the top of the stack to the element at the
   bottom of the stack. The stack itself is unchanged.<br>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'a <a href="Stack.html#TYPEt">t</a> -&gt; 'b</code></pre><div class="info ">
<code class="code">fold&nbsp;f&nbsp;accu&nbsp;s</code> is <code class="code">(f&nbsp;(...&nbsp;(f&nbsp;(f&nbsp;accu&nbsp;x1)&nbsp;x2)&nbsp;...)&nbsp;xn)</code>
    where <code class="code">x1</code> is the top of the stack, <code class="code">x2</code> the second element,
    and <code class="code">xn</code> the bottom element. The stack is unchanged.<br>
<b>Since</b> 4.03<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>