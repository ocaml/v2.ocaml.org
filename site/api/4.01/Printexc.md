<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Printexc</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Printexc.html">Printexc</a></h1>

<pre><span class="keyword">module</span> Printexc: <code class="code"><span class="keyword">sig</span></code> <a href="Printexc.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Facilities for printing exceptions and inspecting current call stack.<br>
</div>
<hr width="100%">

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">exn -&gt; string</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.to_string e</code> returns a string representation of
   the exception <code class="code">e</code>.<br>
</div>

<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.print fn x</code> applies <code class="code">fn</code> to <code class="code">x</code> and returns the result.
   If the evaluation of <code class="code">fn x</code> raises any exception, the
   name of the exception is printed on standard error output,
   and the exception is raised again.
   The typical use is to catch and report exceptions that
   escape a function application.<br>
</div>

<pre><span id="VALcatch"><span class="keyword">val</span> catch</span> : <code class="type">('a -&gt; 'b) -&gt; 'a -&gt; 'b</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.catch fn x</code> is similar to <a href="Printexc.html#VALprint"><code class="code"><span class="constructor">Printexc</span>.print</code></a>, but
   aborts the program with exit code 2 after printing the
   uncaught exception.  This function is deprecated: the runtime
   system is now able to print uncaught exceptions as precisely
   as <code class="code"><span class="constructor">Printexc</span>.catch</code> does.  Moreover, calling <code class="code"><span class="constructor">Printexc</span>.catch</code>
   makes it harder to track the location of the exception
   using the debugger or the stack backtrace facility.
   So, do not use <code class="code"><span class="constructor">Printexc</span>.catch</code> in new code.<br>
</div>

<pre><span id="VALprint_backtrace"><span class="keyword">val</span> print_backtrace</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.print_backtrace oc</code> prints an exception backtrace
    on the output channel <code class="code">oc</code>.  The backtrace lists the program
    locations where the most-recently raised exception was raised
    and where it was propagated through function calls.<br>
<b>Since</b> 3.11.0<br>
</div>

<pre><span id="VALget_backtrace"><span class="keyword">val</span> get_backtrace</span> : <code class="type">unit -&gt; string</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.get_backtrace ()</code> returns a string containing the
    same exception backtrace that <code class="code"><span class="constructor">Printexc</span>.print_backtrace</code> would
    print.<br>
<b>Since</b> 3.11.0<br>
</div>

<pre><span id="VALrecord_backtrace"><span class="keyword">val</span> record_backtrace</span> : <code class="type">bool -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.record_backtrace b</code> turns recording of exception backtraces
    on (if <code class="code">b = <span class="keyword">true</span></code>) or off (if <code class="code">b = <span class="keyword">false</span></code>).  Initially, backtraces
    are not recorded, unless the <code class="code">b</code> flag is given to the program
    through the <code class="code"><span class="constructor">OCAMLRUNPARAM</span></code> variable.<br>
<b>Since</b> 3.11.0<br>
</div>

<pre><span id="VALbacktrace_status"><span class="keyword">val</span> backtrace_status</span> : <code class="type">unit -&gt; bool</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.backtrace_status()</code> returns <code class="code"><span class="keyword">true</span></code> if exception
    backtraces are currently recorded, <code class="code"><span class="keyword">false</span></code> if not.<br>
<b>Since</b> 3.11.0<br>
</div>

<pre><span id="VALregister_printer"><span class="keyword">val</span> register_printer</span> : <code class="type">(exn -&gt; string option) -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Printexc</span>.register_printer fn</code> registers <code class="code">fn</code> as an exception
    printer.  The printer should return <code class="code"><span class="constructor">None</span></code> or raise an exception
    if it does not know how to convert the passed exception, and <code class="code"><span class="constructor">Some</span>
    s</code> with <code class="code">s</code> the resulting string if it can convert the passed
    exception. Exceptions raised by the printer are ignored.
<p>

    When converting an exception into a string, the printers will be invoked
    in the reverse order of their registrations, until a printer returns
    a <code class="code"><span class="constructor">Some</span> s</code> value (if no such printer exists, the runtime will use a
    generic printer).
</p><p>

    When using this mechanism, one should be aware that an exception backtrace
    is attached to the thread that saw it raised, rather than to the exception
    itself. Practically, it means that the code related to <code class="code">fn</code> should not use
    the backtrace if it has itself raised an exception before.<br>
<b>Since</b> 3.11.2<br>
</p></div>
<br>
<h6 id="6_Rawbacktraces">Raw backtraces</h6><br>

<pre><span id="TYPEraw_backtrace"><span class="keyword">type</span> <code class="type"></code>raw_backtrace</span> </pre>

<br>
The abstract type <code class="code">backtrace</code> stores exception backtraces in
    a low-level format, instead of directly exposing them as string as
    the <code class="code">get_backtrace()</code> function does.
<p>

    This allows to pay the performance overhead of representation
    conversion and formatting only at printing time, which is useful
    if you want to record more backtrace than you actually print.<br>

</p><pre><span id="VALget_raw_backtrace"><span class="keyword">val</span> get_raw_backtrace</span> : <code class="type">unit -&gt; <a href="Printexc.html#TYPEraw_backtrace">raw_backtrace</a></code></pre>
<pre><span id="VALprint_raw_backtrace"><span class="keyword">val</span> print_raw_backtrace</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Printexc.html#TYPEraw_backtrace">raw_backtrace</a> -&gt; unit</code></pre>
<pre><span id="VALraw_backtrace_to_string"><span class="keyword">val</span> raw_backtrace_to_string</span> : <code class="type"><a href="Printexc.html#TYPEraw_backtrace">raw_backtrace</a> -&gt; string</code></pre><br>
<h6 id="6_Currentcallstack">Current call stack</h6><br>

<pre><span id="VALget_callstack"><span class="keyword">val</span> get_callstack</span> : <code class="type">int -&gt; <a href="Printexc.html#TYPEraw_backtrace">raw_backtrace</a></code></pre><br>
<code class="code"><span class="constructor">Printexc</span>.get_callstack n</code> returns a description of the top of the
    call stack on the current program point (for the current thread),
    with at most <code class="code">n</code> entries.  (Note: this function is not related to
    exceptions at all, despite being part of the <code class="code"><span class="constructor">Printexc</span></code> module.)<br>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>