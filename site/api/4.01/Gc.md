<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Gc</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Gc.html">Gc</a></h1>

<pre><span class="keyword">module</span> Gc: <code class="code"><span class="keyword">sig</span></code> <a href="Gc.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Memory management control and statistics; finalised values.<br>
</div>
<hr width="100%">

<pre><code><span id="TYPEstat"><span class="keyword">type</span> <code class="type"></code>stat</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.minor_words">minor_words</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of words allocated in the minor heap since
       the program was started.  This number is accurate in
       byte-code programs, but only an approximation in programs
       compiled to native code.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.promoted_words">promoted_words</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of words allocated in the minor heap that
       survived a minor collection and were moved to the major heap
       since the program was started.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.major_words">major_words</span>&nbsp;: <code class="type">float</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of words allocated in the major heap, including
       the promoted words, since the program was started.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.minor_collections">minor_collections</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of minor collections since the program was started.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.major_collections">major_collections</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of major collection cycles completed since the program
        was started.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.heap_words">heap_words</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Total size of the major heap, in words.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.heap_chunks">heap_chunks</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of contiguous pieces of memory that make up the major heap.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.live_words">live_words</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of words of live data in the major heap, including the header
       words.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.live_blocks">live_blocks</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of live blocks in the major heap.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.free_words">free_words</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of words in the free list.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.free_blocks">free_blocks</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of blocks in the free list.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.largest_free">largest_free</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Size (in words) of the largest block in the free list.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.fragments">fragments</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of wasted words due to fragmentation.  These are
       1-words free blocks placed between two live blocks.  They
       are not available for allocation.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.compactions">compactions</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Number of heap compactions since the program was started.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.top_heap_words">top_heap_words</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Maximum size reached by the major heap, in words.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstat.stack_size">stack_size</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Current size of the stack, in words.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info ">
The memory management counters are returned in a <code class="code">stat</code> record.
<p>

   The total amount of memory allocated by the program since it was started
   is (in words) <code class="code">minor_words + major_words - promoted_words</code>.  Multiply by
   the word size (4 on a 32-bit machine, 8 on a 64-bit machine) to get
   the number of bytes.<br>
</p></div>


<pre><code><span id="TYPEcontrol"><span class="keyword">type</span> <code class="type"></code>control</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.minor_heap_size">minor_heap_size</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The size (in words) of the minor heap.  Changing
       this parameter will trigger a minor collection.  Default: 32k.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.major_heap_increment">major_heap_increment</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The minimum number of words to add to the
       major heap when increasing it.  Default: 124k.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.space_overhead">space_overhead</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The major GC speed is computed from this parameter.
       This is the memory that will be "wasted" because the GC does not
       immediatly collect unreachable blocks.  It is expressed as a
       percentage of the memory used for live data.
       The GC will work more (use more CPU time and collect
       blocks more eagerly) if <code class="code">space_overhead</code> is smaller.
       Default: 80.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.verbose">verbose</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">This value controls the GC messages on standard error output.
       It is a sum of some of the following flags, to print messages
       on the corresponding events:<ul>
<li><code class="code">0x001</code> Start of major GC cycle.</li>
<li><code class="code">0x002</code> Minor collection and major GC slice.</li>
<li><code class="code">0x004</code> Growing and shrinking of the heap.</li>
<li><code class="code">0x008</code> Resizing of stacks and memory manager tables.</li>
<li><code class="code">0x010</code> Heap compaction.</li>
<li><code class="code">0x020</code> Change of GC parameters.</li>
<li><code class="code">0x040</code> Computation of major GC slice size.</li>
<li><code class="code">0x080</code> Calling of finalisation functions.</li>
<li><code class="code">0x100</code> Bytecode executable search at start-up.</li>
<li><code class="code">0x200</code> Computation of compaction triggering condition.
       Default: 0.</li>
</ul>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.max_overhead">max_overhead</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">Heap compaction is triggered when the estimated amount
       of "wasted" memory is more than <code class="code">max_overhead</code> percent of the
       amount of live data.  If <code class="code">max_overhead</code> is set to 0, heap
       compaction is triggered at the end of each major GC cycle
       (this setting is intended for testing purposes only).
       If <code class="code">max_overhead &gt;= 1000000</code>, compaction is never triggered.
       If compaction is permanently disabled, it is strongly suggested
       to set <code class="code">allocation_policy</code> to 1.
       Default: 500.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.stack_limit">stack_limit</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The maximum size of the stack (in words).  This is only
       relevant to the byte-code runtime, as the native code runtime
       uses the operating system's stack.  Default: 256k.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTcontrol.allocation_policy">allocation_policy</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top">The policy used for allocating in the heap.  Possible
        values are 0 and 1.  0 is the next-fit policy, which is
        quite fast but can result in fragmentation.  1 is the
        first-fit policy, which can be slower in some cases but
        can be better for programs with fragmentation problems.
        Default: 0.</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}

<div class="info ">
The GC parameters are given as a <code class="code">control</code> record.  Note that
    these parameters can also be initialised by setting the
    OCAMLRUNPARAM environment variable.  See the documentation of
    <code class="code">ocamlrun</code>.<br>
</div>


<pre><span id="VALstat"><span class="keyword">val</span> stat</span> : <code class="type">unit -&gt; <a href="Gc.html#TYPEstat">stat</a></code></pre><div class="info ">
Return the current values of the memory management counters in a
   <code class="code">stat</code> record.  This function examines every heap block to get the
   statistics.<br>
</div>

<pre><span id="VALquick_stat"><span class="keyword">val</span> quick_stat</span> : <code class="type">unit -&gt; <a href="Gc.html#TYPEstat">stat</a></code></pre><div class="info ">
Same as <code class="code">stat</code> except that <code class="code">live_words</code>, <code class="code">live_blocks</code>, <code class="code">free_words</code>,
    <code class="code">free_blocks</code>, <code class="code">largest_free</code>, and <code class="code">fragments</code> are set to 0.  This
    function is much faster than <code class="code">stat</code> because it does not need to go
    through the heap.<br>
</div>

<pre><span id="VALcounters"><span class="keyword">val</span> counters</span> : <code class="type">unit -&gt; float * float * float</code></pre><div class="info ">
Return <code class="code">(minor_words, promoted_words, major_words)</code>.  This function
    is as fast as <code class="code">quick_stat</code>.<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">unit -&gt; <a href="Gc.html#TYPEcontrol">control</a></code></pre><div class="info ">
Return the current values of the GC parameters in a <code class="code">control</code> record.<br>
</div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Gc.html#TYPEcontrol">control</a> -&gt; unit</code></pre><div class="info ">
<code class="code">set r</code> changes the GC parameters according to the <code class="code">control</code> record <code class="code">r</code>.
   The normal usage is: <code class="code"><span class="constructor">Gc</span>.set { (<span class="constructor">Gc</span>.get()) <span class="keyword">with</span> <span class="constructor">Gc</span>.verbose = 0x00d }</code><br>
</div>

<pre><span id="VALminor"><span class="keyword">val</span> minor</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Trigger a minor collection.<br>
</div>

<pre><span id="VALmajor_slice"><span class="keyword">val</span> major_slice</span> : <code class="type">int -&gt; int</code></pre><div class="info ">
Do a minor collection and a slice of major collection.  The argument
    is the size of the slice, 0 to use the automatically-computed
    slice size.  In all cases, the result is the computed slice size.<br>
</div>

<pre><span id="VALmajor"><span class="keyword">val</span> major</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Do a minor collection and finish the current major collection cycle.<br>
</div>

<pre><span id="VALfull_major"><span class="keyword">val</span> full_major</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Do a minor collection, finish the current major collection cycle,
   and perform a complete new cycle.  This will collect all currently
   unreachable blocks.<br>
</div>

<pre><span id="VALcompact"><span class="keyword">val</span> compact</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
Perform a full major collection and compact the heap.  Note that heap
   compaction is a lengthy operation.<br>
</div>

<pre><span id="VALprint_stat"><span class="keyword">val</span> print_stat</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
Print the current values of the memory management counters (in
   human-readable form) into the channel argument.<br>
</div>

<pre><span id="VALallocated_bytes"><span class="keyword">val</span> allocated_bytes</span> : <code class="type">unit -&gt; float</code></pre><div class="info ">
Return the total number of bytes allocated since the program was
   started.  It is returned as a <code class="code">float</code> to avoid overflow problems
   with <code class="code">int</code> on 32-bit machines.<br>
</div>

<pre><span id="VALfinalise"><span class="keyword">val</span> finalise</span> : <code class="type">('a -&gt; unit) -&gt; 'a -&gt; unit</code></pre><div class="info ">
<code class="code">finalise f v</code> registers <code class="code">f</code> as a finalisation function for <code class="code">v</code>.
   <code class="code">v</code> must be heap-allocated.  <code class="code">f</code> will be called with <code class="code">v</code> as
   argument at some point between the first time <code class="code">v</code> becomes unreachable
   and the time <code class="code">v</code> is collected by the GC.  Several functions can
   be registered for the same value, or even several instances of the
   same function.  Each instance will be called once (or never,
   if the program terminates before <code class="code">v</code> becomes unreachable).
<p>

   The GC will call the finalisation functions in the order of
   deallocation.  When several values become unreachable at the
   same time (i.e. during the same GC cycle), the finalisation
   functions will be called in the reverse order of the corresponding
   calls to <code class="code">finalise</code>.  If <code class="code">finalise</code> is called in the same order
   as the values are allocated, that means each value is finalised
   before the values it depends upon.  Of course, this becomes
   false if additional dependencies are introduced by assignments.
</p><p>

   Anything reachable from the closure of finalisation functions
   is considered reachable, so the following code will not work
   as expected:</p><ul>
<li><code class="code"> <span class="keyword">let</span> v = ... <span class="keyword">in</span> <span class="constructor">Gc</span>.finalise (<span class="keyword">fun</span> x <span class="keywordsign">-&gt;</span> ...) v </code></li>
</ul>

   Instead you should write:<ul>
<li><code class="code"> <span class="keyword">let</span> f = <span class="keyword">fun</span> x <span class="keywordsign">-&gt;</span> ... ;; <span class="keyword">let</span> v = ... <span class="keyword">in</span> <span class="constructor">Gc</span>.finalise f v </code></li>
</ul>

   The <code class="code">f</code> function can use all features of OCaml, including
   assignments that make the value reachable again.  It can also
   loop forever (in this case, the other
   finalisation functions will not be called during the execution of f,
   unless it calls <code class="code">finalise_release</code>).
   It can call <code class="code">finalise</code> on <code class="code">v</code> or other values to register other
   functions or even itself.  It can raise an exception; in this case
   the exception will interrupt whatever the program was doing when
   the function was called.
<p>

   <code class="code">finalise</code> will raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">v</code> is not
   heap-allocated.  Some examples of values that are not
   heap-allocated are integers, constant constructors, booleans,
   the empty array, the empty list, the unit value.  The exact list
   of what is heap-allocated or not is implementation-dependent.
   Some constant values can be heap-allocated but never deallocated
   during the lifetime of the program, for example a list of integer
   constants; this is also implementation-dependent.
   You should also be aware that compiler optimisations may duplicate
   some immutable values, for example floating-point numbers when
   stored into arrays, so they can be finalised and collected while
   another copy is still in use by the program.
</p><p>

   The results of calling <a href="String.html#VALmake"><code class="code"><span class="constructor">String</span>.make</code></a>, <a href="String.html#VALcreate"><code class="code"><span class="constructor">String</span>.create</code></a>,
   <a href="Array.html#VALmake"><code class="code"><span class="constructor">Array</span>.make</code></a>, and <a href="Pervasives.html#VALref"><code class="code">ref</code></a> are guaranteed to be
   heap-allocated and non-constant except when the length argument is <code class="code">0</code>.<br>
</p></div>

<pre><span id="VALfinalise_release"><span class="keyword">val</span> finalise_release</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
A finalisation function may call <code class="code">finalise_release</code> to tell the
    GC that it can launch the next finalisation function without waiting
    for the current one to return.<br>
</div>

<pre><span id="TYPEalarm"><span class="keyword">type</span> <code class="type"></code>alarm</span> </pre>
<div class="info ">
An alarm is a piece of data that calls a user function at the end of
   each major GC cycle.  The following functions are provided to create
   and delete alarms.<br>
</div>


<pre><span id="VALcreate_alarm"><span class="keyword">val</span> create_alarm</span> : <code class="type">(unit -&gt; unit) -&gt; <a href="Gc.html#TYPEalarm">alarm</a></code></pre><div class="info ">
<code class="code">create_alarm f</code> will arrange for <code class="code">f</code> to be called at the end of each
   major GC cycle, starting with the current cycle or the next one.
   A value of type <code class="code">alarm</code> is returned that you can
   use to call <code class="code">delete_alarm</code>.<br>
</div>

<pre><span id="VALdelete_alarm"><span class="keyword">val</span> delete_alarm</span> : <code class="type"><a href="Gc.html#TYPEalarm">alarm</a> -&gt; unit</code></pre><div class="info ">
<code class="code">delete_alarm a</code> will stop the calls to the function associated
   to <code class="code">a</code>.  Calling <code class="code">delete_alarm a</code> again has no effect.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>