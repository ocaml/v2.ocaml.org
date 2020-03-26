<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Mutex</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Mutex.html">Mutex</a></h1>
<pre><span class="keyword">module</span> Mutex: <code class="code"><span class="keyword">sig</span></code> <a href="Mutex.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Locks for mutual exclusion.
<p>

   Mutexes (mutual-exclusion locks) are used to implement critical sections
   and protect shared mutable data structures against concurrent accesses.
   The typical use is (if <code class="code">m</code> is the mutex associated with the data structure
   <code class="code"><span class="constructor">D</span></code>):
   <code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Mutex</span>.lock&nbsp;m;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">(*&nbsp;Critical&nbsp;section&nbsp;that&nbsp;operates&nbsp;over&nbsp;D&nbsp;*)</span>;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Mutex</span>.unlock&nbsp;m<br>
&nbsp;&nbsp;&nbsp;</code><br>
</p><hr width="100%">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info">
The type of mutexes.<br>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; <a href="Mutex.html#TYPEt">t</a></code></pre><div class="info">
Return a new mutex.<br>
</div>
<pre><span id="VALlock"><span class="keyword">val</span> lock</span> : <code class="type"><a href="Mutex.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
Lock the given mutex. Only one thread can have the mutex locked
   at any time. A thread that attempts to lock a mutex already locked
   by another thread will suspend until the other thread unlocks
   the mutex.<br>
</div>
<pre><span id="VALtry_lock"><span class="keyword">val</span> try_lock</span> : <code class="type"><a href="Mutex.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info">
Same as <a href="Mutex.html#VALlock"><code class="code"><span class="constructor">Mutex</span>.lock</code></a>, but does not suspend the calling thread if
   the mutex is already locked: just return <code class="code"><span class="keyword">false</span></code> immediately
   in that case. If the mutex is unlocked, lock it and
   return <code class="code"><span class="keyword">true</span></code>.<br>
</div>
<pre><span id="VALunlock"><span class="keyword">val</span> unlock</span> : <code class="type"><a href="Mutex.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info">
Unlock the given mutex. Other threads suspended trying to lock
   the mutex will restart.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>