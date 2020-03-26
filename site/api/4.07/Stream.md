<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stream</a></div><ul><li><a href="#1_Streambuilders">Stream builders</a></li><li><a href="#1_Streamiterator">Stream iterator</a></li><li><a href="#1_Predefinedparsers">Predefined parsers</a></li><li><a href="#1_Usefulfunctions">Useful functions</a></li></ul></nav></header>

<h1>Module <a href="type_Stream.html">Stream</a></h1>

<pre><span id="MODULEStream"><span class="keyword">module</span> Stream</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Stream.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Streams and parsers.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">'a</code> t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of streams holding values of type <code class="code"><span class="keywordsign">'</span>a</code>.</p>
</div>
</div>


<pre><span id="EXCEPTIONFailure"><span class="keyword">exception</span> Failure</span></pre>
<div class="info ">
<div class="info-desc">
<p>Raised by parsers when none of the first components of the stream
   patterns is accepted.</p>
</div>
</div>

<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type">string</code></pre>
<div class="info ">
<div class="info-desc">
<p>Raised by parsers when the first component of a stream pattern is
   accepted, but one of the following components is rejected.</p>
</div>
</div>
<h2 id="1_Streambuilders">Stream builders</h2>
<pre><span id="VALfrom"><span class="keyword">val</span> from</span> : <code class="type">(int -&gt; 'a option) -&gt; 'a <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Stream</span>.from&nbsp;f</code> returns a stream built from the function <code class="code">f</code>.
   To create a new stream element, the function <code class="code">f</code> is called with
   the current stream count. The user function <code class="code">f</code> must return either
   <code class="code"><span class="constructor">Some</span>&nbsp;&lt;value&gt;</code> for a value or <code class="code"><span class="constructor">None</span></code> to specify the end of the
   stream.</p>

<p>Do note that the indices passed to <code class="code">f</code> may not start at <code class="code">0</code> in the
   general case. For example, <code class="code">[&lt;&nbsp;<span class="keywordsign">'</span>0;&nbsp;<span class="keywordsign">'</span>1;&nbsp;<span class="constructor">Stream</span>.from&nbsp;f&nbsp;&gt;]</code> would call
   <code class="code">f</code> the first time with count <code class="code">2</code>.</p>
</div>
</div>

<pre><span id="VALof_list"><span class="keyword">val</span> of_list</span> : <code class="type">'a list -&gt; 'a <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the stream holding the elements of the list in the same
   order.</p>
</div>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the stream of the characters of the string parameter.</p>
</div>
</div>

<pre><span id="VALof_bytes"><span class="keyword">val</span> of_bytes</span> : <code class="type">bytes -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the stream of the characters of the bytes parameter.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.02.0</li>
</ul>
</div>

<pre><span id="VALof_channel"><span class="keyword">val</span> of_channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; char <a href="Stream.html#TYPEt">t</a></code></pre><div class="info ">
<div class="info-desc">
<p>Return the stream of the characters read from the input channel.</p>
</div>
</div>
<h2 id="1_Streamiterator">Stream iterator</h2>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; unit) -&gt; 'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code"><span class="constructor">Stream</span>.iter&nbsp;f&nbsp;s</code> scans the whole stream s, applying function <code class="code">f</code>
   in turn to each stream element encountered.</p>
</div>
</div>
<h2 id="1_Predefinedparsers">Predefined parsers</h2>
<pre><span id="VALnext"><span class="keyword">val</span> next</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Return the first element of the stream and remove it from the
   stream. Raise <a href="Stream.html#EXCEPTIONFailure"><code class="code"><span class="constructor">Stream</span>.<span class="constructor">Failure</span></code></a> if the stream is empty.</p>
</div>
</div>

<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Return <code class="code">()</code> if the stream is empty, else raise <a href="Stream.html#EXCEPTIONFailure"><code class="code"><span class="constructor">Stream</span>.<span class="constructor">Failure</span></code></a>.</p>
</div>
</div>
<h2 id="1_Usefulfunctions">Useful functions</h2>
<pre><span id="VALpeek"><span class="keyword">val</span> peek</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p>Return <code class="code"><span class="constructor">Some</span></code> of "the first element" of the stream, or <code class="code"><span class="constructor">None</span></code> if
   the stream is empty.</p>
</div>
</div>

<pre><span id="VALjunk"><span class="keyword">val</span> junk</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>Remove the first element of the stream, possibly unfreezing
   it before.</p>
</div>
</div>

<pre><span id="VALcount"><span class="keyword">val</span> count</span> : <code class="type">'a <a href="Stream.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>Return the current count of the stream elements, i.e. the number
   of the stream elements discarded.</p>
</div>
</div>

<pre><span id="VALnpeek"><span class="keyword">val</span> npeek</span> : <code class="type">int -&gt; 'a <a href="Stream.html#TYPEt">t</a> -&gt; 'a list</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">npeek&nbsp;n</code> returns the list of the <code class="code">n</code> first elements of
   the stream, or all its remaining elements if less than <code class="code">n</code>
   elements are available.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>