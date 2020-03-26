<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StdLabels.Bytes</a></div><ul></ul></nav></header>

<h1>Module <a href="type_StdLabels.Bytes.html">StdLabels.Bytes</a></h1>

<pre><span class="keyword">module</span> Bytes: <code class="type"><a href="BytesLabels.html">BytesLabels</a></code></pre><hr width="100%">

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">bytes -&gt; int</code></pre><div class="info ">
Return the length (number of bytes) of the argument.<br>
</div>

<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type">bytes -&gt; int -&gt; char</code></pre><div class="info ">
<code class="code">get s n</code> returns the byte at index <code class="code">n</code> in argument <code class="code">s</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> not a valid index in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; unit</code></pre><div class="info ">
<code class="code">set s n c</code> modifies <code class="code">s</code> in place, replacing the byte at index <code class="code">n</code>
    with <code class="code">c</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n</code> is not a valid index in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; bytes</code></pre><div class="info ">
<code class="code">create n</code> returns a new byte sequence of length <code class="code">n</code>. The
    sequence is uninitialized and contains arbitrary bytes.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</p></div>

<pre><span id="VALmake"><span class="keyword">val</span> make</span> : <code class="type">int -&gt; char -&gt; bytes</code></pre><div class="info ">
<code class="code">make n c</code> returns a new byte sequence of length <code class="code">n</code>, filled with
    the byte <code class="code">c</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</p></div>

<pre><span id="VALinit"><span class="keyword">val</span> init</span> : <code class="type">int -&gt; f:(int -&gt; char) -&gt; bytes</code></pre><div class="info ">
<code class="code">init n f</code> returns a fresh byte sequence of length <code class="code">n</code>,
    with character <code class="code">i</code> initialized to the result of <code class="code">f i</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">n &lt; 0</code> or <code class="code">n &gt; </code><a href="Sys.html#VALmax_string_length"><code class="code"><span class="constructor">Sys</span>.max_string_length</code></a>.<br>
</p></div>

<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">bytes</code></pre><div class="info ">
A byte sequence of size 0.<br>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a new byte sequence that contains the same bytes as the
    argument.<br>
</div>

<pre><span id="VALof_string"><span class="keyword">val</span> of_string</span> : <code class="type">string -&gt; bytes</code></pre><div class="info ">
Return a new byte sequence that contains the same bytes as the
    given string.<br>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">bytes -&gt; string</code></pre><div class="info ">
Return a new string that contains the same bytes as the given byte
    sequence.<br>
</div>

<pre><span id="VALsub"><span class="keyword">val</span> sub</span> : <code class="type">bytes -&gt; pos:int -&gt; len:int -&gt; bytes</code></pre><div class="info ">
<code class="code">sub s start len</code> returns a new byte sequence of length <code class="code">len</code>,
    containing the subsequence of <code class="code">s</code> that starts at position <code class="code">start</code>
    and has length <code class="code">len</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not designate a
    valid range of <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALsub_string"><span class="keyword">val</span> sub_string</span> : <code class="type">bytes -&gt; int -&gt; int -&gt; string</code></pre><div class="info ">
Same as <code class="code">sub</code> but return a string instead of a byte sequence.<br>
</div>

<pre><span id="VALfill"><span class="keyword">val</span> fill</span> : <code class="type">bytes -&gt; pos:int -&gt; len:int -&gt; char -&gt; unit</code></pre><div class="info ">
<code class="code">fill s start len c</code> modifies <code class="code">s</code> in place, replacing <code class="code">len</code>
    characters with <code class="code">c</code>, starting at <code class="code">start</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> and <code class="code">len</code> do not designate a
    valid range of <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALblit"><span class="keyword">val</span> blit</span> : <code class="type">src:bytes -&gt; src_pos:int -&gt; dst:bytes -&gt; dst_pos:int -&gt; len:int -&gt; unit</code></pre><div class="info ">
<code class="code">blit src srcoff dst dstoff len</code> copies <code class="code">len</code> bytes from sequence
    <code class="code">src</code>, starting at index <code class="code">srcoff</code>, to sequence <code class="code">dst</code>, starting at
    index <code class="code">dstoff</code>. It works correctly even if <code class="code">src</code> and <code class="code">dst</code> are the
    same byte sequence, and the source and destination intervals
    overlap.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">srcoff</code> and <code class="code">len</code> do not
    designate a valid range of <code class="code">src</code>, or if <code class="code">dstoff</code> and <code class="code">len</code>
    do not designate a valid range of <code class="code">dst</code>.<br>
</p></div>

<pre><span id="VALconcat"><span class="keyword">val</span> concat</span> : <code class="type">sep:bytes -&gt; bytes list -&gt; bytes</code></pre><div class="info ">
<code class="code">concat sep sl</code> concatenates the list of byte sequences <code class="code">sl</code>,
    inserting the separator byte sequence <code class="code">sep</code> between each, and
    returns the result as a new byte sequence.<br>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(char -&gt; unit) -&gt; bytes -&gt; unit</code></pre><div class="info ">
<code class="code">iter f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code>.
    It is equivalent to <code class="code">f (get s 0); f (get s 1); ...; f (get s
    (length s - 1)); ()</code>.<br>
</div>

<pre><span id="VALiteri"><span class="keyword">val</span> iteri</span> : <code class="type">f:(int -&gt; char -&gt; unit) -&gt; bytes -&gt; unit</code></pre><div class="info ">
Same as <a href="Bytes.html#VALiter"><code class="code"><span class="constructor">Bytes</span>.iter</code></a>, but the function is applied to the index of
    the byte as first argument and the byte itself as second
    argument.<br>
</div>

<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">f:(char -&gt; char) -&gt; bytes -&gt; bytes</code></pre><div class="info ">
<code class="code">map f s</code> applies function <code class="code">f</code> in turn to all the bytes of <code class="code">s</code> and
    stores the resulting bytes in a new sequence that is returned as
    the result.<br>
</div>

<pre><span id="VALmapi"><span class="keyword">val</span> mapi</span> : <code class="type">f:(int -&gt; char -&gt; char) -&gt; bytes -&gt; bytes</code></pre><div class="info ">
<code class="code">mapi f s</code> calls <code class="code">f</code> with each character of <code class="code">s</code> and its
    index (in increasing index order) and stores the resulting bytes
    in a new sequence that is returned as the result.<br>
</div>

<pre><span id="VALtrim"><span class="keyword">val</span> trim</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, without leading and trailing
    whitespace. The bytes regarded as whitespace are the ASCII
    characters <code class="code"><span class="string">' '</span></code>, <code class="code"><span class="string">'\012'</span></code>, <code class="code"><span class="string">'\n'</span></code>, <code class="code"><span class="string">'\r'</span></code>, and <code class="code"><span class="string">'\t'</span></code>.<br>
</div>

<pre><span id="VALescaped"><span class="keyword">val</span> escaped</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, with special characters represented
    by escape sequences, following the lexical conventions of OCaml.<br>
</div>

<pre><span id="VALindex"><span class="keyword">val</span> index</span> : <code class="type">bytes -&gt; char -&gt; int</code></pre><div class="info ">
<code class="code">index s c</code> returns the index of the first occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
<p>

    Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALrindex"><span class="keyword">val</span> rindex</span> : <code class="type">bytes -&gt; char -&gt; int</code></pre><div class="info ">
<code class="code">rindex s c</code> returns the index of the last occurrence of byte <code class="code">c</code>
    in <code class="code">s</code>.
<p>

    Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALindex_from"><span class="keyword">val</span> index_from</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; int</code></pre><div class="info ">
<code class="code">index_from s i c</code> returns the index of the first occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> after position <code class="code">i</code>.  <code class="code"><span class="constructor">Bytes</span>.index s c</code> is
    equivalent to <code class="code"><span class="constructor">Bytes</span>.index_from s 0 c</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i</code> is not a valid position in <code class="code">s</code>.
    Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> after position <code class="code">i</code>.<br>
</p></div>

<pre><span id="VALrindex_from"><span class="keyword">val</span> rindex_from</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; int</code></pre><div class="info ">
<code class="code">rindex_from s i c</code> returns the index of the last occurrence of
    byte <code class="code">c</code> in <code class="code">s</code> before position <code class="code">i+1</code>.  <code class="code">rindex s c</code> is equivalent
    to <code class="code">rindex_from s (<span class="constructor">Bytes</span>.length s - 1) c</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">i+1</code> is not a valid position in <code class="code">s</code>.
    Raise <code class="code"><span class="constructor">Not_found</span></code> if <code class="code">c</code> does not occur in <code class="code">s</code> before position <code class="code">i+1</code>.<br>
</p></div>

<pre><span id="VALcontains"><span class="keyword">val</span> contains</span> : <code class="type">bytes -&gt; char -&gt; bool</code></pre><div class="info ">
<code class="code">contains s c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code>.<br>
</div>

<pre><span id="VALcontains_from"><span class="keyword">val</span> contains_from</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; bool</code></pre><div class="info ">
<code class="code">contains_from s start c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> after
    position <code class="code">start</code>.  <code class="code">contains s c</code> is equivalent to <code class="code">contains_from
    s 0 c</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">start</code> is not a valid position in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALrcontains_from"><span class="keyword">val</span> rcontains_from</span> : <code class="type">bytes -&gt; int -&gt; char -&gt; bool</code></pre><div class="info ">
<code class="code">rcontains_from s stop c</code> tests if byte <code class="code">c</code> appears in <code class="code">s</code> before
    position <code class="code">stop+1</code>.
<p>

    Raise <code class="code"><span class="constructor">Invalid_argument</span></code> if <code class="code">stop &lt; 0</code> or <code class="code">stop+1</code> is not a valid
    position in <code class="code">s</code>.<br>
</p></div>

<pre><span id="VALuppercase"><span class="keyword">val</span> uppercase</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, with all lowercase letters
    translated to uppercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.<br>
</div>

<pre><span id="VALlowercase"><span class="keyword">val</span> lowercase</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, with all uppercase letters
    translated to lowercase, including accented letters of the ISO
    Latin-1 (8859-1) character set.<br>
</div>

<pre><span id="VALcapitalize"><span class="keyword">val</span> capitalize</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, with the first byte set to
    uppercase.<br>
</div>

<pre><span id="VALuncapitalize"><span class="keyword">val</span> uncapitalize</span> : <code class="type">bytes -&gt; bytes</code></pre><div class="info ">
Return a copy of the argument, with the first byte set to
    lowercase.<br>
</div>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">bytes</code> </pre>
<div class="info ">
An alias for the type of byte sequences.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="BytesLabels.html#TYPEt">t</a> -&gt; <a href="BytesLabels.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
The comparison function for byte sequences, with the same
    specification as <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.  Along with the type <code class="code">t</code>,
    this function <code class="code">compare</code> allows the module <code class="code"><span class="constructor">Bytes</span></code> to be passed as
    argument to the functors <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> and <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>