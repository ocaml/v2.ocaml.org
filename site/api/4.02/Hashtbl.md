<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Hashtbl</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Hashtbl.html">Hashtbl</a></h1>

<pre><span class="keyword">module</span> Hashtbl: <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Hash tables and hash functions.
<p>

   Hash tables are hashed association tables, with in-place modification.<br>
</p></div>
<hr width="100%">
<br>
<h6 id="6_Genericinterface">Generic interface</h6><br>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b)</code> t</span> </pre>
<div class="info ">
The type of hash tables from type <code class="code"><span class="keywordsign">'</span>a</code> to type <code class="code"><span class="keywordsign">'</span>b</code>.<br>
</div>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">?random:bool -&gt; int -&gt; ('a, 'b) <a href="Hashtbl.html#TYPEt">t</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.create n</code> creates a new, empty hash table, with
   initial size <code class="code">n</code>.  For best results, <code class="code">n</code> should be on the
   order of the expected number of elements that will be in
   the table.  The table grows as needed, so <code class="code">n</code> is just an
   initial guess.
<p>

   The optional <code class="code">random</code> parameter (a boolean) controls whether
   the internal organization of the hash table is randomized at each
   execution of <code class="code"><span class="constructor">Hashtbl</span>.create</code> or deterministic over all executions.
</p><p>

   A hash table that is created with <code class="code">~random:<span class="keyword">false</span></code> uses a
   fixed hash function (<a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a>) to distribute keys among
   buckets.  As a consequence, collisions between keys happen
   deterministically.  In Web-facing applications or other
   security-sensitive applications, the deterministic collision
   patterns can be exploited by a malicious user to create a
   denial-of-service attack: the attacker sends input crafted to
   create many collisions in the table, slowing the application down.
</p><p>

   A hash table that is created with <code class="code">~random:<span class="keyword">true</span></code> uses the seeded
   hash function <a href="Hashtbl.html#VALseeded_hash"><code class="code"><span class="constructor">Hashtbl</span>.seeded_hash</code></a> with a seed that is randomly
   chosen at hash table creation time.  In effect, the hash function
   used is randomly selected among <code class="code">2^{30}</code> different hash functions.
   All these hash functions have different collision patterns,
   rendering ineffective the denial-of-service attack described above.
   However, because of randomization, enumerating all elements of the
   hash table using <a href="Hashtbl.html#VALfold"><code class="code"><span class="constructor">Hashtbl</span>.fold</code></a> or <a href="Hashtbl.html#VALiter"><code class="code"><span class="constructor">Hashtbl</span>.iter</code></a> is no longer
   deterministic: elements are enumerated in different orders at
   different runs of the program.
</p><p>

   If no <code class="code">~random</code> parameter is given, hash tables are created
   in non-random mode by default.  This default can be changed
   either programmatically by calling <a href="Hashtbl.html#VALrandomize"><code class="code"><span class="constructor">Hashtbl</span>.randomize</code></a> or by
   setting the <code class="code"><span class="constructor">R</span></code> flag in the <code class="code"><span class="constructor">OCAMLRUNPARAM</span></code> environment variable.<br>
<b>Before 4.00.0 </b> the <code class="code">random</code> parameter was not present and all
   hash tables were created in non-randomized mode.<br>
</p></div>

<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Empty a hash table. Use <code class="code">reset</code> instead of <code class="code">clear</code> to shrink the
    size of the bucket table to its initial size.<br>
</div>

<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
Empty a hash table and shrink the size of the bucket table
    to its initial size.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="Hashtbl.html#TYPEt">t</a></code></pre><div class="info ">
Return a copy of the given hashtable.<br>
</div>

<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.add tbl x y</code> adds a binding of <code class="code">x</code> to <code class="code">y</code> in table <code class="code">tbl</code>.
   Previous bindings for <code class="code">x</code> are not removed, but simply
   hidden. That is, after performing <a href="Hashtbl.html#VALremove"><code class="code"><span class="constructor">Hashtbl</span>.remove</code></a><code class="code"> tbl x</code>,
   the previous binding for <code class="code">x</code>, if any, is restored.
   (Same behavior as with association lists.)<br>
</div>

<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.find tbl x</code> returns the current binding of <code class="code">x</code> in <code class="code">tbl</code>,
   or raises <code class="code"><span class="constructor">Not_found</span></code> if no such binding exists.<br>
</div>

<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b list</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.find_all tbl x</code> returns the list of all data
   associated with <code class="code">x</code> in <code class="code">tbl</code>.
   The current binding is returned first, then the previous
   bindings, in reverse order of introduction in the table.<br>
</div>

<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; bool</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.mem tbl x</code> checks if <code class="code">x</code> is bound in <code class="code">tbl</code>.<br>
</div>

<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.remove tbl x</code> removes the current binding of <code class="code">x</code> in <code class="code">tbl</code>,
   restoring the previous binding if it exists.
   It does nothing if <code class="code">x</code> is not bound in <code class="code">tbl</code>.<br>
</div>

<pre><span id="VALreplace"><span class="keyword">val</span> replace</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.replace tbl x y</code> replaces the current binding of <code class="code">x</code>
   in <code class="code">tbl</code> by a binding of <code class="code">x</code> to <code class="code">y</code>.  If <code class="code">x</code> is unbound in <code class="code">tbl</code>,
   a binding of <code class="code">x</code> to <code class="code">y</code> is added to <code class="code">tbl</code>.
   This is functionally equivalent to <a href="Hashtbl.html#VALremove"><code class="code"><span class="constructor">Hashtbl</span>.remove</code></a><code class="code"> tbl x</code>
   followed by <a href="Hashtbl.html#VALadd"><code class="code"><span class="constructor">Hashtbl</span>.add</code></a><code class="code"> tbl x y</code>.<br>
</div>

<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('a -&gt; 'b -&gt; unit) -&gt; ('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.iter f tbl</code> applies <code class="code">f</code> to all bindings in table <code class="code">tbl</code>.
   <code class="code">f</code> receives the key as first argument, and the associated value
   as second argument. Each binding is presented exactly once to <code class="code">f</code>.
<p>

   The order in which the bindings are passed to <code class="code">f</code> is unspecified.
   However, if the table contains several bindings for the same key,
   they are passed to <code class="code">f</code> in reverse order of introduction, that is,
   the most recent binding is passed first.
</p><p>

   If the hash table was created in non-randomized mode, the order
   in which the bindings are enumerated is reproducible between
   successive runs of the program, and even between minor versions
   of OCaml.  For randomized hash tables, the order of enumeration
   is entirely random.<br>
</p></div>

<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('a -&gt; 'b -&gt; 'c -&gt; 'c) -&gt; ('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; 'c -&gt; 'c</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.fold f tbl init</code> computes
   <code class="code">(f kN dN ... (f k1 d1 init)...)</code>,
   where <code class="code">k1 ... kN</code> are the keys of all bindings in <code class="code">tbl</code>,
   and <code class="code">d1 ... dN</code> are the associated values.
   Each binding is presented exactly once to <code class="code">f</code>.
<p>

   The order in which the bindings are passed to <code class="code">f</code> is unspecified.
   However, if the table contains several bindings for the same key,
   they are passed to <code class="code">f</code> in reverse order of introduction, that is,
   the most recent binding is passed first.
</p><p>

   If the hash table was created in non-randomized mode, the order
   in which the bindings are enumerated is reproducible between
   successive runs of the program, and even between minor versions
   of OCaml.  For randomized hash tables, the order of enumeration
   is entirely random.<br>
</p></div>

<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.length tbl</code> returns the number of bindings in <code class="code">tbl</code>.
   It takes constant time.  Multiple bindings are counted once each, so
   <code class="code"><span class="constructor">Hashtbl</span>.length</code> gives the number of times <code class="code"><span class="constructor">Hashtbl</span>.iter</code> calls its
   first argument.<br>
</div>

<pre><span id="VALrandomize"><span class="keyword">val</span> randomize</span> : <code class="type">unit -&gt; unit</code></pre><div class="info ">
After a call to <code class="code"><span class="constructor">Hashtbl</span>.randomize()</code>, hash tables are created in
    randomized mode by default: <a href="Hashtbl.html#VALcreate"><code class="code"><span class="constructor">Hashtbl</span>.create</code></a> returns randomized
    hash tables, unless the <code class="code">~random:<span class="keyword">false</span></code> optional parameter is given.
    The same effect can be achieved by setting the <code class="code"><span class="constructor">R</span></code> parameter in
    the <code class="code"><span class="constructor">OCAMLRUNPARAM</span></code> environment variable.
<p>

    It is recommended that applications or Web frameworks that need to
    protect themselves against the denial-of-service attack described
    in <a href="Hashtbl.html#VALcreate"><code class="code"><span class="constructor">Hashtbl</span>.create</code></a> call <code class="code"><span class="constructor">Hashtbl</span>.randomize()</code> at initialization
    time.
</p><p>

    Note that once <code class="code"><span class="constructor">Hashtbl</span>.randomize()</code> was called, there is no way
    to revert to the non-randomized default behavior of <a href="Hashtbl.html#VALcreate"><code class="code"><span class="constructor">Hashtbl</span>.create</code></a>.
    This is intentional.  Non-randomized hash tables can still be
    created using <code class="code"><span class="constructor">Hashtbl</span>.create ~random:<span class="keyword">false</span></code>.<br>
<b>Since</b> 4.00.0<br>
</p></div>

<pre><code><span id="TYPEstatistics"><span class="keyword">type</span> <code class="type"></code>statistics</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatistics.num_bindings">num_bindings</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Number of bindings present in the table.
        Same value as returned by <a href="Hashtbl.html#VALlength"><code class="code"><span class="constructor">Hashtbl</span>.length</code></a>.<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatistics.num_buckets">num_buckets</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Number of buckets in the table.<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatistics.max_bucket_length">max_bucket_length</span>&nbsp;: <code class="type">int</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Maximal number of bindings per bucket.<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstatistics.bucket_histogram">bucket_histogram</span>&nbsp;: <code class="type">int array</code>;</code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
Histogram of bucket sizes.  This array <code class="code">histo</code> has
        length <code class="code">max_bucket_length + 1</code>.  The value of
        <code class="code">histo.(i)</code> is the number of buckets whose size is <code class="code">i</code>.<br>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>
}



<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">t</a> -&gt; <a href="Hashtbl.html#TYPEstatistics">statistics</a></code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.stats tbl</code> returns statistics about the table <code class="code">tbl</code>:
   number of buckets, size of the biggest bucket, distribution of
   buckets by size.<br>
<b>Since</b> 4.00.0<br>
</div>
<br>
<h6 id="6_Functorialinterface">Functorial interface</h6><br>
<br>
The functorial interface allows the use of specific comparison
    and hash functions, either for performance/security concerns,
    or because keys are not hashable/comparable with the polymorphic builtins.
<p>

    For instance, one might want to specialize a table for integer keys:
    </p><pre class="codepre"><code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">IntHash</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">struct</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;equal&nbsp;i&nbsp;j&nbsp;=&nbsp;i=j<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;hash&nbsp;i&nbsp;=&nbsp;i&nbsp;<span class="keyword">land</span>&nbsp;max_int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">IntHashtbl</span>&nbsp;=&nbsp;<span class="constructor">Hashtbl</span>.<span class="constructor">Make</span>(<span class="constructor">IntHash</span>)<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;h&nbsp;=&nbsp;<span class="constructor">IntHashtbl</span>.create&nbsp;17&nbsp;<span class="keyword">in</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">IntHashtbl</span>.add&nbsp;h&nbsp;12&nbsp;<span class="string">"hello"</span>;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;</code></pre>
<p>

    This creates a new module <code class="code"><span class="constructor">IntHashtbl</span></code>, with a new type <code class="code"><span class="keywordsign">'</span>a
    <span class="constructor">IntHashtbl</span>.t</code> of tables from <code class="code">int</code> to <code class="code"><span class="keywordsign">'</span>a</code>. In this example, <code class="code">h</code>
    contains <code class="code">string</code> values so its type is <code class="code">string <span class="constructor">IntHashtbl</span>.t</code>.
</p><p>

    Note that the new type <code class="code"><span class="keywordsign">'</span>a <span class="constructor">IntHashtbl</span>.t</code> is not compatible with
    the type <code class="code">(<span class="keywordsign">'</span>a,<span class="keywordsign">'</span>b) <span class="constructor">Hashtbl</span>.t</code> of the generic interface. For
    example, <code class="code"><span class="constructor">Hashtbl</span>.length h</code> would not type-check, you must use
    <code class="code"><span class="constructor">IntHashtbl</span>.length</code>.<br>

</p><pre><span class="keyword">module type</span> <a href="Hashtbl.HashedType.html">HashedType</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.HashedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
The input signature of the functor <a href="Hashtbl.Make.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">Make</span></code></a>.
</div>

<pre><span class="keyword">module type</span> <a href="Hashtbl.S.html">S</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
The output signature of the functor <a href="Hashtbl.Make.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">Make</span></code></a>.
</div>

<pre><span class="keyword">module</span> <a href="Hashtbl.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">H</span></code><code class="code"> : </code><code class="type"><a href="Hashtbl.HashedType.html">HashedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="Hashtbl.S.html">S</a></code><code class="type">  with type key = H.t</code></div></pre><div class="info">
Functor building an implementation of the hashtable structure.
</div>

<pre><span class="keyword">module type</span> <a href="Hashtbl.SeededHashedType.html">SeededHashedType</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.SeededHashedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
The input signature of the functor <a href="Hashtbl.MakeSeeded.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">MakeSeeded</span></code></a>.
</div>

<pre><span class="keyword">module type</span> <a href="Hashtbl.SeededS.html">SeededS</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.SeededS.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
The output signature of the functor <a href="Hashtbl.MakeSeeded.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">MakeSeeded</span></code></a>.
</div>

<pre><span class="keyword">module</span> <a href="Hashtbl.MakeSeeded.html">MakeSeeded</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">H</span></code><code class="code"> : </code><code class="type"><a href="Hashtbl.SeededHashedType.html">SeededHashedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="Hashtbl.SeededS.html">SeededS</a></code><code class="type">  with type key = H.t</code></div></pre><div class="info">
Functor building an implementation of the hashtable structure.
</div>
<br>
<h6 id="6_Thepolymorphichashfunctions">The polymorphic hash functions</h6><br>

<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type">'a -&gt; int</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.hash x</code> associates a nonnegative integer to any value of
   any type. It is guaranteed that
   if <code class="code">x = y</code> or <code class="code"><span class="constructor">Pervasives</span>.compare x y = 0</code>, then <code class="code">hash x = hash y</code>.
   Moreover, <code class="code">hash</code> always terminates, even on cyclic structures.<br>
</div>

<pre><span id="VALseeded_hash"><span class="keyword">val</span> seeded_hash</span> : <code class="type">int -&gt; 'a -&gt; int</code></pre><div class="info ">
A variant of <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a> that is further parameterized by
   an integer seed.<br>
<b>Since</b> 4.00.0<br>
</div>

<pre><span id="VALhash_param"><span class="keyword">val</span> hash_param</span> : <code class="type">int -&gt; int -&gt; 'a -&gt; int</code></pre><div class="info ">
<code class="code"><span class="constructor">Hashtbl</span>.hash_param meaningful total x</code> computes a hash value for <code class="code">x</code>,
   with the same properties as for <code class="code">hash</code>. The two extra integer
   parameters <code class="code">meaningful</code> and <code class="code">total</code> give more precise control over
   hashing. Hashing performs a breadth-first, left-to-right traversal
   of the structure <code class="code">x</code>, stopping after <code class="code">meaningful</code> meaningful nodes
   were encountered, or <code class="code">total</code> nodes (meaningful or not) were
   encountered. Meaningful nodes are: integers; floating-point
   numbers; strings; characters; booleans; and constant
   constructors. Larger values of <code class="code">meaningful</code> and <code class="code">total</code> means that
   more nodes are taken into account to compute the final hash value,
   and therefore collisions are less likely to happen.  However,
   hashing takes longer. The parameters <code class="code">meaningful</code> and <code class="code">total</code>
   govern the tradeoff between accuracy and speed.  As default
   choices, <a href="Hashtbl.html#VALhash"><code class="code"><span class="constructor">Hashtbl</span>.hash</code></a> and <a href="Hashtbl.html#VALseeded_hash"><code class="code"><span class="constructor">Hashtbl</span>.seeded_hash</code></a> take
   <code class="code">meaningful = 10</code> and <code class="code">total = 100</code>.<br>
</div>

<pre><span id="VALseeded_hash_param"><span class="keyword">val</span> seeded_hash_param</span> : <code class="type">int -&gt; int -&gt; int -&gt; 'a -&gt; int</code></pre><div class="info ">
A variant of <a href="Hashtbl.html#VALhash_param"><code class="code"><span class="constructor">Hashtbl</span>.hash_param</code></a> that is further parameterized by
   an integer seed.  Usage:
   <code class="code"><span class="constructor">Hashtbl</span>.seeded_hash_param meaningful total seed x</code>.<br>
<b>Since</b> 4.00.0<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>