<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stream</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stream.html">Stream</a></h1>

<pre><span class="keyword">module</span> Stream: <code class="code"><span class="keyword">sig</span></code> <a href="Stream.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Streams and parsers.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info ">
The type of streams holding values of type <code class="code"><span class="keywordsign">'</span>a</code>.<br>
</div>


<pre><span id="EXCEPTIONFailure"><span class="keyword">exception</span> Failure</span></pre>
<div class="info ">
Raised by parsers when none of the first components of the stream
   patterns is accepted.<br>
</div>

<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type">string</code></pre>
<div class="info ">
Raised by parsers when the first component of a stream pattern is
   accepted, but one of the following components is rejected.<br>
</div>
<br>
<h6 id="6_Streambuilders">Stream builders</h6><br>

<pre><span id="VALfrom"><span class="keyword">val</span> from</span> : <code class="type">(int -&gt; 'a option) -&gt; 'a <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Stream</span>.from f</code> returns a stream built from the function <code class="code">f</code>.
   To create a new stream element, the function <code class="code">f</code> is called with
   the current stream count. The user function <code class="code">f</code> must return either
   <code class="code"><span class="constructor">Some</span> &lt;value&gt;</code> for a value or <code class="code"><span class="constructor">None</span></code> to specify the end of the
   stream.
<p>

   Do note that the indices passed to <code class="code">f</code> may not start at <code class="code">0</code> in the
   general case. For example, <code class="code">[&lt; <span class="keywordsign">'</span>0; <span class="keywordsign">'</span>1; <span class="constructor">Stream</span>.from f &gt;]</code> would call
   <code class="code">f</code> the first time with count <code class="code">2</code>.<br>
</p></div>

<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">'a list -&gt; 'a <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
Return the stream holding the elements of the list in the same
   order.<br>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
Return the stream of the characters of the string parameter.<br>
</div>

<pre><span id="VALof_bytes"><span class="keyword">val</span> of_bytes</span> : <code class="type">bytes -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
Return the stream of the characters of the bytes parameter.<br>
<b>Since</b> 4.02.0<br>
</div>

<pre><span id="VALof_channel"><span class="keyword">val</span> of_channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
Return the stream of the characters read from the input channel.<br>
</div>
<br>
<h6 id="6_Streamiterator">Stream iterator</h6><br>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Stream</span>.iter f s</code> scans the whole stream s, applying function <code class="code">f</code>
   in turn to each stream element encountered.<br>
</div>
<br>
<h6 id="6_Predefinedparsers">Predefined parsers</h6><br>

<pre><span id="VALnext"><span class="keyword">val</span> next</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
Return the first element of the stream and remove it from the
   stream. Raise Stream.Failure if the stream is empty.<br>
</div>

<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Return <code class="code">()</code> if the stream is empty, else raise <code class="code"><span class="constructor">Stream</span>.<span class="constructor">Failure</span></code>.<br>
</div>
<br>
<h6 id="6_Usefulfunctions">Useful functions</h6><br>

<pre><span id="VALpeek"><span class="keyword">val</span> peek</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a option</code></pre><div class="info ">
Return <code class="code"><span class="constructor">Some</span></code> of "the first element" of the stream, or <code class="code"><span class="constructor">None</span></code> if
   the stream is empty.<br>
</div>

<pre><span id="VALjunk"><span class="keyword">val</span> junk</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Remove the first element of the stream, possibly unfreezing
   it before.<br>
</div>

<pre><span id="VALcount"><span class="keyword">val</span> count</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the current count of the stream elements, i.e. the number
   of the stream elements discarded.<br>
</div>

<pre><span id="VALnpeek"><span class="keyword">val</span> npeek</span> : <code class="type">int -&gt; 'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a list</code></pre><div class="info ">
<code class="code">npeek n</code> returns the list of the <code class="code">n</code> first elements of
   the stream, or all its remaining elements if less than <code class="code">n</code>
   elements are available.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>