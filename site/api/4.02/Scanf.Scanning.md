<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Scanf.Scanning</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Scanf.Scanning.html">Scanf.Scanning</a></h1>

<pre><span class="keyword">module</span> Scanning: <code class="code"><span class="keyword">sig</span></code> <a href="Scanf.Scanning.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEin_channel"><span class="keyword">type</span> <code class="type"></code>in_channel</span> </pre>
<div class="info ">
The notion of input channel for the <code class="code"><span class="constructor">Scanf</span></code> module:
   those channels provide all the machinery necessary to read from a given
   <code class="code"><span class="constructor">Pervasives</span>.in_channel</code> value.
   A <code class="code"><span class="constructor">Scanf</span>.<span class="constructor">Scanning</span>.in_channel</code> value is also called a <i>formatted input
   channel</i> or equivalently a <i>scanning buffer</i>.
   The type <code class="code">scanbuf</code> below is an alias for <code class="code">in_channel</code>.<br>
<b>Since</b> 3.12.0<br>
</div>


<pre><span id="TYPEscanbuf"><span class="keyword">type</span> <code class="type"></code>scanbuf</span> = <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code> </pre>
<div class="info ">
The type of scanning buffers. A scanning buffer is the source from which a
    formatted input function gets characters. The scanning buffer holds the
    current state of the scan, plus a function to get the next char from the
    input, and a token buffer to store the string matched so far.
<p>

    Note: a scanning action may often require to examine one character in
    advance; when this 'lookahead' character does not belong to the token
    read, it is stored back in the scanning buffer and becomes the next
    character yet to be read.<br>
</p></div>


<pre><span id="VALstdin"><span class="keyword">val</span> stdin</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
The standard input notion for the <code class="code"><span class="constructor">Scanf</span></code> module.
    <code class="code"><span class="constructor">Scanning</span>.stdin</code> is the formatted input channel attached to
    <code class="code"><span class="constructor">Pervasives</span>.stdin</code>.
<p>

    Note: in the interactive system, when input is read from <code class="code">stdin</code>, the
    newline character that triggers the evaluation is incorporated in the
    input; thus, the scanning specifications must properly skip this
    additional newline character (for instance, simply add a <code class="code"><span class="string">'\n'</span></code> as the
    last character of the format string).<br>
<b>Since</b> 3.12.0<br>
</p></div>

<pre><span id="TYPEfile_name"><span class="keyword">type</span> <code class="type"></code>file_name</span> = <code class="type">string</code> </pre>
<div class="info ">
A convenient alias to designate a file name.<br>
<b>Since</b> 4.00.0<br>
</div>


<pre><span id="VALopen_in"><span class="keyword">val</span> open_in</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.open_in fname</code> returns a formatted input channel for bufferized
    reading in text mode from file <code class="code">fname</code>.
<p>

    Note:
    <code class="code">open_in</code> returns a formatted input channel that efficiently reads
    characters in large chunks; in contrast, <code class="code">from_channel</code> below returns
    formatted input channels that must read one character at a time, leading
    to a much slower scanning rate.<br>
<b>Since</b> 3.12.0<br>
</p></div>

<pre><span id="VALopen_in_bin"><span class="keyword">val</span> open_in_bin</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.open_in_bin fname</code> returns a formatted input channel for
    bufferized reading in binary mode from file <code class="code">fname</code>.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALclose_in"><span class="keyword">val</span> close_in</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; unit</code></pre><div class="info ">
Closes the <code class="code"><span class="constructor">Pervasives</span>.in_channel</code> associated with the given
  <code class="code"><span class="constructor">Scanning</span>.in_channel</code> formatted input channel.<br>
<b>Since</b> 3.12.0<br>
</div>

<pre><span id="VALfrom_file"><span class="keyword">val</span> from_file</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEfile_name">file_name</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
An alias for <code class="code">open_in</code> above.<br>
</div>

<pre><span id="VALfrom_file_bin"><span class="keyword">val</span> from_file_bin</span> : <code class="type">string -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
An alias for <code class="code">open_in_bin</code> above.<br>
</div>

<pre><span id="VALfrom_string"><span class="keyword">val</span> from_string</span> : <code class="type">string -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.from_string s</code> returns a formatted input channel which reads
    from the given string.
    Reading starts from the first character in the string.
    The end-of-input condition is set when the end of the string is reached.<br>
</div>

<pre><span id="VALfrom_function"><span class="keyword">val</span> from_function</span> : <code class="type">(unit -&gt; char) -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.from_function f</code> returns a formatted input channel with the
    given function as its reading method.
<p>

    When scanning needs one more character, the given function is called.
</p><p>

    When the function has no more character to provide, it <em>must</em> signal an
    end-of-input condition by raising the exception <code class="code"><span class="constructor">End_of_file</span></code>.<br>
</p></div>

<pre><span id="VALfrom_channel"><span class="keyword">val</span> from_channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; <a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.from_channel ic</code> returns a formatted input channel which reads
    from the regular input channel <code class="code">ic</code> argument, starting at the current
    reading position.<br>
</div>

<pre><span id="VALend_of_input"><span class="keyword">val</span> end_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; bool</code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.end_of_input ic</code> tests the end-of-input condition of the given
    formatted input channel.<br>
</div>

<pre><span id="VALbeginning_of_input"><span class="keyword">val</span> beginning_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; bool</code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.beginning_of_input ic</code> tests the beginning of input condition of
    the given formatted input channel.<br>
</div>

<pre><span id="VALname_of_input"><span class="keyword">val</span> name_of_input</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a> -&gt; string</code></pre><div class="info ">
<code class="code"><span class="constructor">Scanning</span>.name_of_input ic</code> returns the name of the character source
    for the formatted input channel <code class="code">ic</code>.<br>
<b>Since</b> 3.09.0<br>
</div>

<pre><span id="VALstdib"><span class="keyword">val</span> stdib</span> : <code class="type"><a href="Scanf.Scanning.html#TYPEin_channel">in_channel</a></code></pre><div class="info ">
A deprecated alias for <code class="code"><span class="constructor">Scanning</span>.stdin</code>, the scanning buffer reading from
    <code class="code"><span class="constructor">Pervasives</span>.stdin</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>