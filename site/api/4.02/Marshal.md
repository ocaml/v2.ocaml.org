<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Marshal</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Marshal.html">Marshal</a></h1>

<pre><span class="keyword">module</span> Marshal: <code class="code"><span class="keyword">sig</span></code> <a href="Marshal.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Marshaling of data structures.
<p>

   This module provides functions to encode arbitrary data structures
   as sequences of bytes, which can then be written on a file or
   sent over a pipe or network connection.  The bytes can then
   be read back later, possibly in another process, and decoded back
   into a data structure. The format for the byte sequences
   is compatible across all machines for a given version of OCaml.
</p><p>

   Warning: marshaling is currently not type-safe. The type
   of marshaled data is not transmitted along the value of the data,
   making it impossible to check that the data read back possesses the
   type expected by the context. In particular, the result type of
   the <code class="code"><span class="constructor">Marshal</span>.from_*</code> functions is given as <code class="code"><span class="keywordsign">'</span>a</code>, but this is
   misleading: the returned OCaml value does not possess type <code class="code"><span class="keywordsign">'</span>a</code>
   for all <code class="code"><span class="keywordsign">'</span>a</code>; it has one, unique type which cannot be determined
   at compile-type.  The programmer should explicitly give the expected
   type of the returned value, using the following syntax:</p><ul>
<li><code class="code">(<span class="constructor">Marshal</span>.from_channel chan : <span class="keyword">type</span>)</code>.
   Anything can happen at run-time if the object in the file does not
   belong to the given type.</li>
</ul>

   Values of extensible variant types, for example exceptions (of
   extensible type <code class="code">exn</code>), returned by the unmarhsaller should not be
   pattern-matched over through <code class="code"><span class="keyword">match</span> ... <span class="keyword">with</span></code> or <code class="code"><span class="keyword">try</span> ... <span class="keyword">with</span></code>,
   because unmarshalling does not preserve the information required for
   matching their constructors. Structural equalities with other
   extensible variant values does not work either.  Most other uses such
   as Printexc.to_string, will still work as expected.
<p>

   The representation of marshaled values is not human-readable,
   and uses bytes that are not printable characters. Therefore,
   input and output channels used in conjunction with <code class="code"><span class="constructor">Marshal</span>.to_channel</code>
   and <code class="code"><span class="constructor">Marshal</span>.from_channel</code> must be opened in binary mode, using e.g.
   <code class="code">open_out_bin</code> or <code class="code">open_in_bin</code>; channels opened in text mode will
   cause unmarshaling errors on platforms where text channels behave
   differently than binary channels, e.g. Windows.<br>
</p></div>
<hr width="100%">

<pre><code><span id="TYPEextern_flags"><span class="keyword">type</span> <code class="type"></code>extern_flags</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTextern_flags.No_sharing"><span class="constructor">No_sharing</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Don't preserve sharing<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTextern_flags.Closures"><span class="constructor">Closures</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Send function closures<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTextern_flags.Compat_32"><span class="constructor">Compat_32</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Ensure 32-bit compatibility<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>

<div class="info ">
The flags to the <code class="code"><span class="constructor">Marshal</span>.to_*</code> functions below.<br>
</div>


<pre><span id="VALto_channel"><span class="keyword">val</span> to_channel</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; 'a -&gt; <a href="Marshal.html#TYPEextern_flags">extern_flags</a> list -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Marshal</span>.to_channel chan v flags</code> writes the representation
   of <code class="code">v</code> on channel <code class="code">chan</code>. The <code class="code">flags</code> argument is a
   possibly empty list of flags that governs the marshaling
   behavior with respect to sharing, functional values, and compatibility
   between 32- and 64-bit platforms.
<p>

   If <code class="code">flags</code> does not contain <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">No_sharing</span></code>, circularities
   and sharing inside the value <code class="code">v</code> are detected and preserved
   in the sequence of bytes produced. In particular, this
   guarantees that marshaling always terminates. Sharing
   between values marshaled by successive calls to
   <code class="code"><span class="constructor">Marshal</span>.to_channel</code> is neither detected nor preserved, though.
   If <code class="code">flags</code> contains <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">No_sharing</span></code>, sharing is ignored.
   This results in faster marshaling if <code class="code">v</code> contains no shared
   substructures, but may cause slower marshaling and larger
   byte representations if <code class="code">v</code> actually contains sharing,
   or even non-termination if <code class="code">v</code> contains cycles.
</p><p>

   If <code class="code">flags</code> does not contain <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">Closures</span></code>, marshaling fails
   when it encounters a functional value inside <code class="code">v</code>: only 'pure' data
   structures, containing neither functions nor objects, can safely be
   transmitted between different programs. If <code class="code">flags</code> contains
   <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">Closures</span></code>, functional values will be marshaled as a the
   position in the code of the program together with the values
   corresponding to the free variables captured in the closure.  In
   this case, the output of marshaling can only be read back in
   processes that run exactly the same program, with exactly the same
   compiled code. (This is checked at un-marshaling time, using an MD5
   digest of the code transmitted along with the code position.)
</p><p>

   The exact definition of which free variables are captured in a
   closure is not specified and can very between bytecode and native
   code (and according to optimization flags).  In particular, a
   function value accessing a global reference may or may not include
   the reference in its closure.  If it does, unmarshaling the
   corresponding closure will create a new reference, different from
   the global one.
</p><p>

   If <code class="code">flags</code> contains <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">Compat_32</span></code>, marshaling fails when
   it encounters an integer value outside the range <code class="code">[-2{^30}, 2{^30}-1]</code>
   of integers that are representable on a 32-bit platform.  This
   ensures that marshaled data generated on a 64-bit platform can be
   safely read back on a 32-bit platform.  If <code class="code">flags</code> does not
   contain <code class="code"><span class="constructor">Marshal</span>.<span class="constructor">Compat_32</span></code>, integer values outside the
   range <code class="code">[-2{^30}, 2{^30}-1]</code> are marshaled, and can be read back on
   a 64-bit platform, but will cause an error at un-marshaling time
   when read back on a 32-bit platform.  The <code class="code"><span class="constructor">Mashal</span>.<span class="constructor">Compat_32</span></code> flag
   only matters when marshaling is performed on a 64-bit platform;
   it has no effect if marshaling is performed on a 32-bit platform.<br>
</p></div>

<pre><span id="VALto_bytes"><span class="keyword">val</span> to_bytes</span> : <code class="type">'a -&gt; <a href="Marshal.html#TYPEextern_flags">extern_flags</a> list -&gt; bytes</code></pre><div class="info ">
<code class="code"><span class="constructor">Marshal</span>.to_bytes v flags</code> returns a byte sequence containing
   the representation of <code class="code">v</code>.
   The <code class="code">flags</code> argument has the same meaning as for
   <a href="Marshal.html#VALto_channel"><code class="code"><span class="constructor">Marshal</span>.to_channel</code></a>.<br>
</div>

<pre><span id="VALto_string"><span class="keyword">val</span> to_string</span> : <code class="type">'a -&gt; <a href="Marshal.html#TYPEextern_flags">extern_flags</a> list -&gt; string</code></pre><div class="info ">
Same as <code class="code">to_bytes</code> but return the result as a string instead of
    a byte sequence.<br>
</div>

<pre><span id="VALto_buffer"><span class="keyword">val</span> to_buffer</span> : <code class="type">bytes -&gt; int -&gt; int -&gt; 'a -&gt; <a href="Marshal.html#TYPEextern_flags">extern_flags</a> list -&gt; int</code></pre><div class="info ">
<code class="code"><span class="constructor">Marshal</span>.to_buffer buff ofs len v flags</code> marshals the value <code class="code">v</code>,
   storing its byte representation in the sequence <code class="code">buff</code>,
   starting at index <code class="code">ofs</code>, and writing at most
   <code class="code">len</code> bytes.  It returns the number of bytes
   actually written to the sequence. If the byte representation
   of <code class="code">v</code> does not fit in <code class="code">len</code> characters, the exception <code class="code"><span class="constructor">Failure</span></code>
   is raised.<br>
</div>

<pre><span id="VALfrom_channel"><span class="keyword">val</span> from_channel</span> : <code class="type"><a href="Pervasives.html#TYPEin_channel">in_channel</a> -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">Marshal</span>.from_channel chan</code> reads from channel <code class="code">chan</code> the
   byte representation of a structured value, as produced by
   one of the <code class="code"><span class="constructor">Marshal</span>.to_*</code> functions, and reconstructs and
   returns the corresponding value.<br>
</div>

<pre><span id="VALfrom_bytes"><span class="keyword">val</span> from_bytes</span> : <code class="type">bytes -&gt; int -&gt; 'a</code></pre><div class="info ">
<code class="code"><span class="constructor">Marshal</span>.from_bytes buff ofs</code> unmarshals a structured value
   like <a href="Marshal.html#VALfrom_channel"><code class="code"><span class="constructor">Marshal</span>.from_channel</code></a> does, except that the byte
   representation is not read from a channel, but taken from
   the byte sequence <code class="code">buff</code>, starting at position <code class="code">ofs</code>.
   The byte sequence is not mutated.<br>
</div>

<pre><span id="VALfrom_string"><span class="keyword">val</span> from_string</span> : <code class="type">string -&gt; int -&gt; 'a</code></pre><div class="info ">
Same as <code class="code">from_bytes</code> but take a string as argument instead of a
    byte sequence.<br>
</div>

<pre><span id="VALheader_size"><span class="keyword">val</span> header_size</span> : <code class="type">int</code></pre><div class="info ">
The bytes representing a marshaled value are composed of
   a fixed-size header and a variable-sized data part,
   whose size can be determined from the header.
   <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a> is the size, in bytes, of the header.
   <a href="Marshal.html#VALdata_size"><code class="code"><span class="constructor">Marshal</span>.data_size</code></a><code class="code"> buff ofs</code> is the size, in bytes,
   of the data part, assuming a valid header is stored in
   <code class="code">buff</code> starting at position <code class="code">ofs</code>.
   Finally, <a href="Marshal.html#VALtotal_size"><code class="code"><span class="constructor">Marshal</span>.total_size</code></a> <code class="code">buff ofs</code> is the total size,
   in bytes, of the marshaled value.
   Both <a href="Marshal.html#VALdata_size"><code class="code"><span class="constructor">Marshal</span>.data_size</code></a> and <a href="Marshal.html#VALtotal_size"><code class="code"><span class="constructor">Marshal</span>.total_size</code></a> raise <code class="code"><span class="constructor">Failure</span></code>
   if <code class="code">buff</code>, <code class="code">ofs</code> does not contain a valid header.
<p>

   To read the byte representation of a marshaled value into
   a byte sequence, the program needs to read first
   <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a> bytes into the sequence,
   then determine the length of the remainder of the
   representation using <a href="Marshal.html#VALdata_size"><code class="code"><span class="constructor">Marshal</span>.data_size</code></a>,
   make sure the sequence is large enough to hold the remaining
   data, then read it, and finally call <a href="Marshal.html#VALfrom_bytes"><code class="code"><span class="constructor">Marshal</span>.from_bytes</code></a>
   to unmarshal the value.<br>
</p></div>

<pre><span id="VALdata_size"><span class="keyword">val</span> data_size</span> : <code class="type">bytes -&gt; int -&gt; int</code></pre><div class="info ">
See <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a>.<br>
</div>

<pre><span id="VALtotal_size"><span class="keyword">val</span> total_size</span> : <code class="type">bytes -&gt; int -&gt; int</code></pre><div class="info ">
See <a href="Marshal.html#VALheader_size"><code class="code"><span class="constructor">Marshal</span>.header_size</code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>