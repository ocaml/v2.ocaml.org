<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Queue</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Queue.html">Queue</a></h1>

<pre><span id="MODULEQueue"><span class="keyword">module</span> Queue</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Queue.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>First-in first-out queues.</p>

<p>This module implements queues (FIFOs), with in-place modification.</p>

<p><b>Warning</b> This module is not thread-safe: each <a href="Queue.html#TYPEt"><code class="code"><span class="constructor">Queue</span>.t</code></a> value
   must be protected from concurrent access (e.g. with a <code class="code"><span class="constructor">Mutex</span>.t</code>).
   Failure to do so can lead to a crash.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of queues containing elements of type <code class="code"><span class="keywordsign">'</span>a</code>.</p>
</div>
</div>


<pre><span id="EXCEPTIONEmpty"><span class="keyword">exception</span> Empty</span></pre>
<div class="info ">
<div class="info-desc">
<p>Raised when <a href="Queue.html#VALtake"><code class="code"><span class="constructor">Queue</span>.take</code></a> or <a href="Queue.html#VALpeek"><code class="code"><span class="constructor">Queue</span>.peek</code></a> is applied to an empty queue.</p>
</div>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; 'a <a href="Queue.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return a new queue, initially empty.</p>
</div>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">'a -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">add&nbsp;x&nbsp;q</code> adds the element <code class="code">x</code> at the end of the queue <code class="code">q</code>.</p>
</div>
</div>

<pre><span id="VALpush"><span class="keyword">val</span> push</span> : <code class="type">'a -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">push</code> is a synonym for <code class="code">add</code>.</p>
</div>
</div>

<pre><span id="VALtake"><span class="keyword">val</span> take</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">take&nbsp;q</code> removes and returns the first element in queue <code class="code">q</code>,
   or raises <a href="Queue.html#EXCEPTIONEmpty"><code class="code"><span class="constructor">Queue</span>.<span class="constructor">Empty</span></code></a> if the queue is empty.</p>
</div>
</div>

<pre><span id="VALpop"><span class="keyword">val</span> pop</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">pop</code> is a synonym for <code class="code">take</code>.</p>
</div>
</div>

<pre><span id="VALpeek"><span class="keyword">val</span> peek</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">peek&nbsp;q</code> returns the first element in queue <code class="code">q</code>, without removing
   it from the queue, or raises <a href="Queue.html#EXCEPTIONEmpty"><code class="code"><span class="constructor">Queue</span>.<span class="constructor">Empty</span></code></a> if the queue is empty.</p>
</div>
</div>

<pre><span id="VALtop"><span class="keyword">val</span> top</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">top</code> is a synonym for <code class="code">peek</code>.</p>
</div>
</div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Discard all elements from a queue.</p>
</div>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a <a href="Queue.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return a copy of the given queue.</p>
</div>
</div>

<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>Return <code class="code"><span class="keyword">true</span></code> if the given queue is empty, <code class="code"><span class="keyword">false</span></code> otherwise.</p>
</div>
</div>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the number of elements in a queue.</p>
</div>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">iter&nbsp;f&nbsp;q</code> applies <code class="code">f</code> in turn to all elements of <code class="code">q</code>,
   from the least recently entered to the most recently entered.
   The queue itself is unchanged.</p>
</div>
</div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; 'b</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">fold&nbsp;f&nbsp;accu&nbsp;q</code> is equivalent to <code class="code"><span class="constructor">List</span>.fold_left&nbsp;f&nbsp;accu&nbsp;l</code>,
   where <code class="code">l</code> is the list of <code class="code">q</code>'s elements. The queue remains
   unchanged.</p>
</div>
</div>

<pre><span id="VALtransfer"><span class="keyword">val</span> transfer</span> : <code class="type">'a <a href="Queue.html#TYPEt">t</a> -&gt; 'a <a href="Queue.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">transfer&nbsp;q1&nbsp;q2</code> adds all of <code class="code">q1</code>'s elements at the end of
   the queue <code class="code">q2</code>, then clears <code class="code">q1</code>. It is equivalent to the
   sequence <code class="code">iter&nbsp;(<span class="keyword">fun</span>&nbsp;x&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;add&nbsp;x&nbsp;q2)&nbsp;q1;&nbsp;clear&nbsp;q1</code>, but runs
   in constant time.</p>
</div>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>