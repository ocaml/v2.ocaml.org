<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Thread</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Thread.html">Thread</a></h1>

<pre><span class="keyword">module</span> Thread: <code class="code"><span class="keyword">sig</span></code> <a href="Thread.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Lightweight threads for Posix <code class="code">1003.1c</code> and Win32.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of thread handles.<br>
</div>

<br>
<h6 id="6_Threadcreationandtermination">Thread creation and termination</h6><br>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; <a href="Thread.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Thread</span>.create&nbsp;funct&nbsp;arg</code> creates a new thread of control,
   in which the function application <code class="code">funct&nbsp;arg</code>
   is executed concurrently with the other threads of the program.
   The application of <code class="code"><span class="constructor">Thread</span>.create</code>
   returns the handle of the newly created thread.
   The new thread terminates when the application <code class="code">funct&nbsp;arg</code>
   returns, either normally or by raising an uncaught exception.
   In the latter case, the exception is printed on standard error,
   but not propagated back to the parent thread. Similarly, the
   result of the application <code class="code">funct&nbsp;arg</code> is discarded and not
   directly accessible to the parent thread.<br>
</div>

<pre><span id="VALself"><span class="keyword">val</span> self</span> : <code class="type">unit -&gt; <a href="Thread.html#TYPEt">t</a></code></pre><div class="info ">
Return the thread currently executing.<br>
</div>

<pre><span id="VALid"><span class="keyword">val</span> id</span> : <code class="type"><a href="Thread.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the identifier of the given thread. A thread identifier
   is an integer that identifies uniquely the thread.
   It can be used to build data structures indexed by threads.<br>
</div>

<pre><span id="VALexit"><span class="keyword">val</span> exit</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Terminate prematurely the currently executing thread.<br>
</div>

<pre><span id="VALkill"><span class="keyword">val</span> kill</span> : <code class="type"><a href="Thread.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Terminate prematurely the thread whose handle is given.<br>
</div>
<br>
<h6 id="6_Suspendingthreads">Suspending threads</h6><br>

<pre><span id="VALdelay"><span class="keyword">val</span> delay</span> : <code class="type">float -&gt; unit</code></pre><div class="info ">
<code class="code">delay&nbsp;d</code> suspends the execution of the calling thread for
   <code class="code">d</code> seconds. The other program threads continue to run during
   this time.<br>
</div>

<pre><span id="VALjoin"><span class="keyword">val</span> join</span> : <code class="type"><a href="Thread.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">join&nbsp;th</code> suspends the execution of the calling thread
   until the thread <code class="code">th</code> has terminated.<br>
</div>

<pre><span id="VALwait_read"><span class="keyword">val</span> wait_read</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt; unit</code></pre><div class="info ">
See <a href="Thread.html#VALwait_write"><code class="code"><span class="constructor">Thread</span>.wait_write</code></a>.<br>
</div>

<pre><span id="VALwait_write"><span class="keyword">val</span> wait_write</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt; unit</code></pre><div class="info ">
This function does nothing in this implementation.<br>
</div>

<pre><span id="VALwait_timed_read"><span class="keyword">val</span> wait_timed_read</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt; float -&gt; bool</code></pre><div class="info ">
See <a href="Thread.html#VALwait_timed_read"><code class="code"><span class="constructor">Thread</span>.wait_timed_read</code></a>.<br>
</div>

<pre><span id="VALwait_timed_write"><span class="keyword">val</span> wait_timed_write</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> -&gt; float -&gt; bool</code></pre><div class="info ">
Suspend the execution of the calling thread until at least
   one character is available for reading (<code class="code">wait_read</code>) or
   one character can be written without blocking (<code class="code">wait_write</code>)
   on the given Unix file descriptor. Wait for at most
   the amount of time given as second argument (in seconds).
   Return <code class="code"><span class="keyword">true</span></code> if the file descriptor is ready for input/output
   and <code class="code"><span class="keyword">false</span></code> if the timeout expired.
<p>

   These functions return immediately <code class="code"><span class="keyword">true</span></code> in the Win32
   implementation.<br>
</p></div>

<pre><span id="VALselect"><span class="keyword">val</span> select</span> : <code class="type"><a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list -&gt;<br>       <a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list -&gt;<br>       <a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list -&gt;<br>       float -&gt; <a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list * <a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list * <a href="Unix.html#TYPEfile_descr">Unix.file_descr</a> list</code></pre><div class="info ">
Suspend the execution of the calling thread until input/output
   becomes possible on the given Unix file descriptors.
   The arguments and results have the same meaning as for
   <code class="code"><span class="constructor">Unix</span>.select</code>.
   This function is not implemented yet under Win32.<br>
</div>

<pre><span id="VALwait_pid"><span class="keyword">val</span> wait_pid</span> : <code class="type">int -&gt; int * <a href="Unix.html#TYPEprocess_status">Unix.process_status</a></code></pre><div class="info ">
<code class="code">wait_pid&nbsp;p</code> suspends the execution of the calling thread
   until the process specified by the process identifier <code class="code">p</code>
   terminates. Returns the pid of the child caught and
   its termination status, as per <code class="code"><span class="constructor">Unix</span>.wait</code>.
   This function is not implemented under MacOS.<br>
</div>

<pre><span id="VALyield"><span class="keyword">val</span> yield</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Re-schedule the calling thread without suspending it.
   This function can be used to give scheduling hints,
   telling the scheduler that now is a good time to
   switch to other threads.<br>
</div>
<br>
<h6 id="6_Managementofsignals">Management of signals</h6><br>
<br>
Signal handling follows the POSIX thread model: signals generated
  by a thread are delivered to that thread; signals generated externally
  are delivered to one of the threads that does not block it.
  Each thread possesses a set of blocked signals, which can be modified
  using <a href="Thread.html#VALsigmask"><code class="code"><span class="constructor">Thread</span>.sigmask</code></a>.  This set is inherited at thread creation time.
  Per-thread signal masks are supported only by the system thread library
  under Unix, but not under Win32, nor by the VM thread library.<br>

<pre><span id="VALsigmask"><span class="keyword">val</span> sigmask</span> : <code class="type"><a href="Unix.html#TYPEsigprocmask_command">Unix.sigprocmask_command</a> -&gt; int list -&gt; int list</code></pre><div class="info ">
<code class="code">sigmask&nbsp;cmd&nbsp;sigs</code> changes the set of blocked signals for the
   calling thread.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_SETMASK</span></code>, blocked signals are set to those in
   the list <code class="code">sigs</code>.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_BLOCK</span></code>, the signals in <code class="code">sigs</code> are added to
   the set of blocked signals.
   If <code class="code">cmd</code> is <code class="code"><span class="constructor">SIG_UNBLOCK</span></code>, the signals in <code class="code">sigs</code> are removed
   from the set of blocked signals.
   <code class="code">sigmask</code> returns the set of previously blocked signals for the thread.<br>
</div>

<pre><span id="VALwait_signal"><span class="keyword">val</span> wait_signal</span> : <code class="type">int list -&gt; int</code></pre><div class="info ">
<code class="code">wait_signal&nbsp;sigs</code> suspends the execution of the calling thread
   until the process receives one of the signals specified in the
   list <code class="code">sigs</code>.  It then returns the number of the signal received.
   Signal handlers attached to the signals in <code class="code">sigs</code> will not
   be invoked.  The signals <code class="code">sigs</code> are expected to be blocked before
   calling <code class="code">wait_signal</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>