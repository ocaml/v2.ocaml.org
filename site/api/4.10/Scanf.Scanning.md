<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Scanf.Scanning</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Scanf.Scanning.html">Scanf.Scanning</a></h1>

<pre><span id="MODULEScanning"><span class="keyword">module</span> Scanning</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Scanf.Scanning.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEin_channel"><span class="keyword">type</span> <code class="type"></code>in_channel</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The notion of input channel for the <a href="Scanf.html"><code class="code"><span class="constructor">Scanf</span></code></a> module:
   those channels provide all the machinery necessary to read from any source
   of characters, including a <a href="Stdlib.html#TYPEin_channel"><code class="code">in_channel</code></a> value.
   A Scanf.Scanning.in_channel value is also called a <i>formatted input
   channel</i> or equivalently a <i>scanning buffer</i>.
   The type <a href="Scanf.Scanning.html#TYPEscanbuf"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.scanbuf</code></a> below is an alias for <code class="code"><span class="constructor">Scanning</span>.in_channel</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>


<pre><span id="TYPEscanbuf"><span class="keyword">type</span> <code class="type"></code>scanbuf</span> = <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of scanning buffers. A scanning buffer is the source from which a
    formatted input function gets characters. The scanning buffer holds the
    current state of the scan, plus a function to get the next char from the
    input, and a token buffer to store the string matched so far.</p>

<p>Note: a scanning action may often require to examine one character in
    advance; when this 'lookahead' character does not belong to the token
    read, it is stored back in the scanning buffer and becomes the next
    character yet to be read.</p>
</div>
</div>


<pre><span id="VALstdin"><span class="keyword">val</span> stdin</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p>The standard input notion for the <a href="Scanf.html"><code class="code"><span class="constructor">Scanf</span></code></a> module.
    <code class="code"><span class="constructor">Scanning</span>.stdin</code> is the <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input channel
    attached to <a href="Stdlib.html#VALstdin"><code class="code">stdin</code></a>.</p>

<p>Note: in the interactive system, when input is read from
    <a href="Stdlib.html#VALstdin"><code class="code">stdin</code></a>, the newline character that triggers evaluation is
    part of the input; thus, the scanning specifications must properly skip
    this additional newline character (for instance, simply add a <code class="code"><span class="string">'\n'</span></code> as
    the last character of the format string).</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="TYPEfile_name"><span class="keyword">type</span> <code class="type"></code>file_name</span> = <code class="type">string</code> </pre>
<div class="info ">
<div class="info-desc">
<p>A convenient alias to designate a file name.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>


<pre><span id="VALopen_in"><span class="keyword">val</span> open_in</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.open_in&nbsp;fname</code> returns a <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input
    channel for bufferized reading in text mode from file <code class="code">fname</code>.</p>

<p>Note:
    <code class="code">open_in</code> returns a formatted input channel that efficiently reads
    characters in large chunks; in contrast, <code class="code">from_channel</code> below returns
    formatted input channels that must read one character at a time, leading
    to a much slower scanning rate.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALopen_in_bin"><span class="keyword">val</span> open_in_bin</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.open_in_bin&nbsp;fname</code> returns a <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted
    input channel for bufferized reading in binary mode from file <code class="code">fname</code>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALclose_in"><span class="keyword">val</span> close_in</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Closes the <a href="Stdlib.html#TYPEin_channel"><code class="code">in_channel</code></a> associated with the given
  <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input channel.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.12.0</li>
</ul>
</div>

<pre><span id="VALfrom_file"><span class="keyword">val</span> from_file</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p>An alias for <a href="Scanf.Scanning.html#VALopen_in"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.open_in</code></a> above.</p>
</div>
</div>

<pre><span id="VALfrom_file_bin"><span class="keyword">val</span> from_file_bin</span> : <code class="type">string -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p>An alias for <a href="Scanf.Scanning.html#VALopen_in_bin"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.open_in_bin</code></a> above.</p>
</div>
</div>

<pre><span id="VALfrom_string"><span class="keyword">val</span> from_string</span> : <code class="type">string -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.from_string&nbsp;s</code> returns a <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted
    input channel which reads from the given string.
    Reading starts from the first character in the string.
    The end-of-input condition is set when the end of the string is reached.</p>
</div>
</div>

<pre><span id="VALfrom_function"><span class="keyword">val</span> from_function</span> : <code class="type">(unit -&gt; char) -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.from_function&nbsp;f</code> returns a <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted
    input channel with the given function as its reading method.</p>

<p>When scanning needs one more character, the given function is called.</p>

<p>When the function has no more character to provide, it <em>must</em> signal an
    end-of-input condition by raising the exception <code class="code"><span class="constructor">End_of_file</span></code>.</p>
</div>
</div>

<pre><span id="VALfrom_channel"><span class="keyword">val</span> from_channel</span> : <code class="type"><a href="Stdlib.html#TYPEin_channel">in_channel</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.from_channel&nbsp;ic</code> returns a <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted
    input channel which reads from the regular <a href="Stdlib.html#TYPEin_channel"><code class="code">in_channel</code></a> input
    channel <code class="code">ic</code> argument.
    Reading starts at current reading position of <code class="code">ic</code>.</p>
</div>
</div>

<pre><span id="VALend_of_input"><span class="keyword">val</span> end_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.end_of_input&nbsp;ic</code> tests the end-of-input condition of the given
    <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input channel.</p>
</div>
</div>

<pre><span id="VALbeginning_of_input"><span class="keyword">val</span> beginning_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.beginning_of_input&nbsp;ic</code> tests the beginning of input condition
    of the given <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input channel.</p>
</div>
</div>

<pre><span id="VALname_of_input"><span class="keyword">val</span> name_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; string</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Scanning</span>.name_of_input&nbsp;ic</code> returns the name of the character source
    for the given <a href="Scanf.Scanning.html#TYPEin_channel"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code></a> formatted input channel.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 3.09.0</li>
</ul>
</div>

<pre><span id="VALstdib"><span class="keyword">val</span> stdib</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<div class="info-desc">
<p>A deprecated alias for <a href="Scanf.Scanning.html#VALstdin"><code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.stdin</code></a>, the scanning buffer reading from
    <a href="Stdlib.html#VALstdin"><code class="code">stdin</code></a>.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>