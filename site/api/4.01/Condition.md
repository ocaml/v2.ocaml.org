<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Condition</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Condition.html">Condition</a></h1>

<pre><span class="keyword">module</span> Condition: <code class="code"><span class="keyword">sig</span></code> <a href="Condition.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Condition variables to synchronize between threads.
<p>

   Condition variables are used when one thread wants to wait until another
   thread has finished doing something: the former thread 'waits' on the
   condition variable, the latter thread 'signals' the condition when it
   is done. Condition variables should always be protected by a mutex.
   The typical use is (if <code class="code"><span class="constructor">D</span></code> is a shared data structure, <code class="code">m</code> its mutex,
   and <code class="code">c</code> is a condition variable):
   </p><pre class="codepre"><code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Mutex</span>.lock&nbsp;m;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">while</span>&nbsp;<span class="comment">(*&nbsp;some&nbsp;predicate&nbsp;P&nbsp;over&nbsp;D&nbsp;is&nbsp;not&nbsp;satisfied&nbsp;*)</span>&nbsp;<span class="keyword">do</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Condition</span>.wait&nbsp;c&nbsp;m<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">done</span>;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">(*&nbsp;Modify&nbsp;D&nbsp;*)</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span>&nbsp;<span class="comment">(*&nbsp;the&nbsp;predicate&nbsp;P&nbsp;over&nbsp;D&nbsp;is&nbsp;now&nbsp;satified&nbsp;*)</span>&nbsp;<span class="keyword">then</span>&nbsp;<span class="constructor">Condition</span>.signal&nbsp;c;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Mutex</span>.unlock&nbsp;m<br>
&nbsp;&nbsp;&nbsp;</code></pre><br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of condition variables.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">unit -&gt; <a href="Condition.html#TYPEt">t</a></code></pre><div class="info ">
Return a new condition variable.<br>
</div>

<pre><span id="VALwait"><span class="keyword">val</span> wait</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; <a href="Mutex.html#TYPEt">Mutex.t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">wait c m</code> atomically unlocks the mutex <code class="code">m</code> and suspends the
   calling process on the condition variable <code class="code">c</code>. The process will
   restart after the condition variable <code class="code">c</code> has been signalled.
   The mutex <code class="code">m</code> is locked again before <code class="code">wait</code> returns.<br>
</div>

<pre><span id="VALsignal"><span class="keyword">val</span> signal</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">signal c</code> restarts one of the processes waiting on the
   condition variable <code class="code">c</code>.<br>
</div>

<pre><span id="VALbroadcast"><span class="keyword">val</span> broadcast</span> : <code class="type"><a href="Condition.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">broadcast c</code> restarts all processes waiting on the
   condition variable <code class="code">c</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>