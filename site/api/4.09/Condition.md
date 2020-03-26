<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Condition</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Condition.html">Condition</a></h1>

<pre><span id="MODULECondition"><span class="keyword">module</span> Condition</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Condition.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Condition variables to synchronize between threads.</p>

<p>Condition variables are used when one thread wants to wait until another
   thread has finished doing something: the former thread 'waits' on the
   condition variable, the latter thread 'signals' the condition when it
   is done. Condition variables should always be protected by a mutex.
   The typical use is (if <code class="code"><span class="constructor">D</span></code> is a shared data structure, <code class="code">m</code> its mutex,
   and <code class="code">c</code> is a condition variable):</p>
<pre class="codepre"><code class="code">     <span class="constructor">Mutex</span>.lock m;
     <span class="keyword">while</span> <span class="comment">(* some predicate P over D is not satisfied *)</span> <span class="keyword">do</span>
       <span class="constructor">Condition</span>.wait c m
     <span class="keyword">done</span>;
     <span class="comment">(* Modify D *)</span>
     <span class="keyword">if</span> <span class="comment">(* the predicate P over D is now satisfied *)</span> <span class="keyword">then</span> <span class="constructor">Condition</span>.signal c;
     <span class="constructor">Mutex</span>.unlock m
   </code></pre></div>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of condition variables.</p>
</div>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; <a href="Condition.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return a new condition variable.</p>
</div>
</div>

<pre><span id="VALwait"><span class="keyword">val</span> wait</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; <a href="Mutex.html#TYPEt">Mutex.t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">wait&nbsp;c&nbsp;m</code> atomically unlocks the mutex <code class="code">m</code> and suspends the
   calling process on the condition variable <code class="code">c</code>. The process will
   restart after the condition variable <code class="code">c</code> has been signalled.
   The mutex <code class="code">m</code> is locked again before <code class="code">wait</code> returns.</p>
</div>
</div>

<pre><span id="VALsignal"><span class="keyword">val</span> signal</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">signal&nbsp;c</code> restarts one of the processes waiting on the
   condition variable <code class="code">c</code>.</p>
</div>
</div>

<pre><span id="VALbroadcast"><span class="keyword">val</span> broadcast</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">broadcast&nbsp;c</code> restarts all processes waiting on the
   condition variable <code class="code">c</code>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>