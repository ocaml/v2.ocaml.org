<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Buffer</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Buffer.html">Buffer</a></h1>

<pre><span class="keyword">module</span> Buffer: <code class="code"><span class="keyword">sig</span></code> <a href="Buffer.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Extensible buffers.
<p>

   This module implements buffers that automatically expand
   as necessary.  It provides accumulative concatenation of strings
   in quasi-linear time (instead of quadratic time when strings are
   concatenated pairwise).<br>
</p></div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The abstract type of buffers.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Buffer.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code">create n</code> returns a fresh buffer, initially empty.
   The <code class="code">n</code> parameter is the initial size of the internal byte sequence
   that holds the buffer contents. That byte sequence is automatically
   reallocated when more than <code class="code">n</code> characters are stored in the buffer,
   but shrinks back to <code class="code">n</code> characters when <code class="code">reset</code> is called.
   For best performance, <code class="code">n</code> should be of the same order of magnitude
   as the number of characters that are expected to be stored in
   the buffer (for instance, 80 for a buffer that holds one output
   line).  Nothing bad will happen if the buffer grows beyond that
   limit, however. In doubt, take <code class="code">n = 16</code> for instance.
   If <code class="code">n</code> is not between 1 and <a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>, it will
   be clipped to that interval.<br>
</div>

<pre><span id="VALcontents"><span class="keyword">val</span> contents</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; string</code></pre><div class="info ">
Return a copy of the current contents of the buffer.
   The buffer itself is unchanged.<br>
</div>

<pre><span id="VALto_bytes"><span class="keyword">val</span> to_bytes</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; bytes</code></pre><div class="info ">
Return a copy of the current contents of the buffer.
   The buffer itself is unchanged.<br>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; int -&gt; int -&gt; string</code></pre><div class="info ">
<code class="code"><span class="constructor">Buffer</span>.sub b off len</code> returns (a copy of) the bytes from the
    current contents of the buffer <code class="code">b</code> starting at offset <code class="code">off</code> of
    length <code class="code">len</code> bytes. May raise <code class="code"><span class="constructor">Invalid_argument</span></code> if out of bounds
    request. The buffer itself is unaffected.<br>
</div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; int -&gt; bytes -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Buffer</span>.blit src srcoff dst dstoff len</code> copies <code class="code">len</code> characters from
   the current contents of the buffer <code class="code">src</code>, starting at offset <code class="code">srcoff</code>
   to <code class="code">dst</code>, starting at character <code class="code">dstoff</code>.
<p>

   Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">srcoff</code> and <code class="code">len</code> do not designate a valid
   range of <code class="code">src</code>, or if <code class="code">dstoff</code> and <code class="code">len</code> do not designate a valid
   range of <code class="code">dst</code>.<br>
<b>Since</b> 3.11.2<br>
</p></div>

<pre><span id="VALnth"><span class="keyword">val</span> nth</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; int -&gt; char</code></pre><div class="info ">
get the n-th character of the buffer. Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if
    index out of bounds<br>
</div>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
Return the number of characters currently contained in the buffer.<br>
</div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Empty the buffer.<br>
</div>

<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Empty the buffer and deallocate the internal byte sequence holding the
   buffer contents, replacing it with the initial internal byte sequence
   of length <code class="code">n</code> that was allocated by <a href="Buffer.html#VALcreate"><code class="code"><span class="constructor">Buffer</span>.create</code></a> <code class="code">n</code>.
   For long-lived buffers that may have grown a lot, <code class="code">reset</code> allows
   faster reclamation of the space used by the buffer.<br>
</div>

<pre><span id="VALadd_char"><span class="keyword">val</span> add_char</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; char -&gt; unit</code></pre><div class="info ">
<code class="code">add_char b c</code> appends the character <code class="code">c</code> at the end of the buffer <code class="code">b</code>.<br>
</div>

<pre><span id="VALadd_string"><span class="keyword">val</span> add_string</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; string -&gt; unit</code></pre><div class="info ">
<code class="code">add_string b s</code> appends the string <code class="code">s</code> at the end of the buffer <code class="code">b</code>.<br>
</div>

<pre><span id="VALadd_bytes"><span class="keyword">val</span> add_bytes</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; bytes -&gt; unit</code></pre><div class="info ">
<code class="code">add_string b s</code> appends the string <code class="code">s</code> at the end of the buffer <code class="code">b</code>.<br>
</div>

<pre><span id="VALadd_substring"><span class="keyword">val</span> add_substring</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; string -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">add_substring b s ofs len</code> takes <code class="code">len</code> characters from offset
   <code class="code">ofs</code> in string <code class="code">s</code> and appends them at the end of the buffer <code class="code">b</code>.<br>
</div>

<pre><span id="VALadd_subbytes"><span class="keyword">val</span> add_subbytes</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; bytes -&gt; int -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">add_substring b s ofs len</code> takes <code class="code">len</code> characters from offset
   <code class="code">ofs</code> in byte sequence <code class="code">s</code> and appends them at the end of the buffer <code class="code">b</code>.<br>
</div>

<pre><span id="VALadd_substitute"><span class="keyword">val</span> add_substitute</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; (string -&gt; string) -&gt; string -&gt; unit</code></pre><div class="info ">
<code class="code">add_substitute b f s</code> appends the string pattern <code class="code">s</code> at the end
   of the buffer <code class="code">b</code> with substitution.
   The substitution process looks for variables into
   the pattern and substitutes each variable name by its value, as
   obtained by applying the mapping <code class="code">f</code> to the variable name. Inside the
   string pattern, a variable name immediately follows a non-escaped
   <code class="code">$</code> character and is one of the following:<ul>
<li>a non empty sequence of alphanumeric or <code class="code">_</code> characters,</li>
<li>an arbitrary sequence of characters enclosed by a pair of
   matching parentheses or curly brackets.
   An escaped <code class="code">$</code> character is a <code class="code">$</code> that immediately follows a backslash
   character; it then stands for a plain <code class="code">$</code>.
   Raise <code class="code"><span class="constructor">Not_found</span></code> if the closing character of a parenthesized variable
   cannot be found.</li>
</ul>
<br>
</div>

<pre><span id="VALadd_buffer"><span class="keyword">val</span> add_buffer</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; <a href="Buffer.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">add_buffer b1 b2</code> appends the current contents of buffer <code class="code">b2</code>
   at the end of buffer <code class="code">b1</code>.  <code class="code">b2</code> is not modified.<br>
</div>

<pre><span id="VALadd_channel"><span class="keyword">val</span> add_channel</span> : <code class="type"><a href="Buffer.html#TYPEt">t</a> -&gt; <a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; int -&gt; unit</code></pre><div class="info ">
<code class="code">add_channel b ic n</code> reads exactly <code class="code">n</code> character from the
   input channel <code class="code">ic</code> and stores them at the end of buffer <code class="code">b</code>.
   Raise <code class="code"><span class="constructor">End_of_file</span></code> if the channel contains fewer than <code class="code">n</code>
   characters.<br>
</div>

<pre><span id="VALoutput_buffer"><span class="keyword">val</span> output_buffer</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Buffer.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code">output_buffer oc b</code> writes the current contents of buffer <code class="code">b</code>
   on the output channel <code class="code">oc</code>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>