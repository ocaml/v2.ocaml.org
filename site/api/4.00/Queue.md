<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Queue</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Queue.html">Queue</a></h1>
<pre><span class="keyword">module</span> Queue: <code class="code"><span class="keyword">sig</span></code> <a href="Queue.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>First-in first-out queues.
<p>

   This module implements queues (FIFOs), with in-place modification.<br>
</p><hr width="100%">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info">
The type of queues containing elements of type <code class="code"><span class="keywordsign">'</span>a</code>.<br>
</div>

<pre><span id="EXCEPTIONEmpty"><span class="keyword">exception</span> Empty</span></pre>
<div class="info">
Raised when <a href="Queue.html#VALtake"><code class="code"><span class="constructor">Queue</span>.take</code></a> or <a href="Queue.html#VALpeek"><code class="code"><span class="constructor">Queue</span>.peek</code></a> is applied to an empty queue.<br>
</div>
<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; 'a <a href="Queue.html#TYPEt">t</a></code></pre><div class="info">
Return a new queue, initially empty.<br>
</div>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">'a -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
<code class="code">add x q</code> adds the element <code class="code">x</code> at the end of the queue <code class="code">q</code>.<br>
</div>
<pre><span id="VALpush"><span class="keyword">val</span> push</span> : <code class="type">'a -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
<code class="code">push</code> is a synonym for <code class="code">add</code>.<br>
</div>
<pre><span id="VALtake"><span class="keyword">val</span> take</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info">
<code class="code">take q</code> removes and returns the first element in queue <code class="code">q</code>,
   or raises <code class="code"><span class="constructor">Empty</span></code> if the queue is empty.<br>
</div>
<pre><span id="VALpop"><span class="keyword">val</span> pop</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info">
<code class="code">pop</code> is a synonym for <code class="code">take</code>.<br>
</div>
<pre><span id="VALpeek"><span class="keyword">val</span> peek</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info">
<code class="code">peek q</code> returns the first element in queue <code class="code">q</code>, without removing
   it from the queue, or raises <code class="code"><span class="constructor">Empty</span></code> if the queue is empty.<br>
</div>
<pre><span id="VALtop"><span class="keyword">val</span> top</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info">
<code class="code">top</code> is a synonym for <code class="code">peek</code>.<br>
</div>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
Discard all elements from a queue.<br>
</div>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a <a href="Queue.html#TYPEt">t</a></code></pre><div class="info">
Return a copy of the given queue.<br>
</div>
<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
Return <code class="code"><span class="keyword">true</span></code> if the given queue is empty, <code class="code"><span class="keyword">false</span></code> otherwise.<br>
</div>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; int</code></pre><div class="info">
Return the number of elements in a queue.<br>
</div>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
<code class="code">iter f q</code> applies <code class="code">f</code> in turn to all elements of <code class="code">q</code>,
   from the least recently entered to the most recently entered.
   The queue itself is unchanged.<br>
</div>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; 'b</code></pre><div class="info">
<code class="code">fold f accu q</code> is equivalent to <code class="code"><span class="constructor">List</span>.fold_left f accu l</code>,
   where <code class="code">l</code> is the list of <code class="code">q</code>'s elements. The queue remains
   unchanged.<br>
</div>
<pre><span id="VALtransfer"><span class="keyword">val</span> transfer</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
<code class="code">transfer q1 q2</code> adds all of <code class="code">q1</code>'s elements at the end of
   the queue <code class="code">q2</code>, then clears <code class="code">q1</code>. It is equivalent to the
   sequence <code class="code">iter (<span class="keyword">fun</span> x <span class="keywordsign">-&gt;</span> add x q2) q1; clear q1</code>, but runs
   in constant time.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>