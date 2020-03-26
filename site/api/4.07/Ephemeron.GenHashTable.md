<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.GenHashTable</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Ephemeron.GenHashTable.html">Ephemeron.GenHashTable</a></h1>

<pre><span id="MODULEGenHashTable"><span class="keyword">module</span> GenHashTable</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.GenHashTable.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">
<p>Define a hash table on generic containers which have a notion of
      "death" and aliveness. If a binding is dead the hash table can
      automatically remove it.</p>

<pre><code><span id="TYPEequal"><span class="keyword">type</span> <code class="type"></code>equal</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTequal.ETrue"><span class="constructor">ETrue</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTequal.EFalse"><span class="constructor">EFalse</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTequal.EDead"><span class="constructor">EDead</span></span></code></td>
<td class="typefieldcomment" align="left" valign="top"><code>(*</code></td><td class="typefieldcomment" align="left" valign="top"><div class="info ">
<div class="info-desc">
<p>the container is dead</p>
</div>
</div>
</td><td class="typefieldcomment" align="left" valign="bottom"><code>*)</code></td>
</tr></tbody></table>



<pre><span id="MODULEMakeSeeded"><span class="keyword">module</span> <a href="Ephemeron.GenHashTable.MakeSeeded.html">MakeSeeded</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>keys</p>
</div>
</div>


<pre><span id="TYPEcontainer"><span class="keyword">type</span> <code class="type">'a</code> container</span> </pre>
<div class="info ">
<div class="info-desc">
<p>contains keys and the associated data</p>
</div>
</div>


<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type">int -&gt; t -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>same as <code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">SeededHashedType</span></code></p>
</div>
</div>

<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type">'a container -&gt;<br>       t -&gt; <a href="Ephemeron.GenHashTable.html#TYPEequal">Ephemeron.GenHashTable.equal</a></code></pre><div class="info ">
<div class="info-desc">
<p>equality predicate used to compare a key with the one in a
        container. Can return <code class="code"><span class="constructor">EDead</span></code> if the keys in the container are
        dead</p>
</div>
</div>

<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">t -&gt;<br>       'a -&gt; 'a container</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">create&nbsp;key&nbsp;data</code> creates a container from
        some initials keys and one data</p>
</div>
</div>

<pre><span id="VALget_key"><span class="keyword">val</span> get_key</span> : <code class="type">'a container -&gt;<br>       t option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get_key&nbsp;cont</code> returns the keys if they are all alive</p>
</div>
</div>

<pre><span id="VALget_data"><span class="keyword">val</span> get_data</span> : <code class="type">'a container -&gt; 'a option</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">get_data&nbsp;cont</code> returns the data if it is alive</p>
</div>
</div>

<pre><span id="VALset_key_data"><span class="keyword">val</span> set_key_data</span> : <code class="type">'a container -&gt;<br>       t -&gt; 'a -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">set_key_data&nbsp;cont</code> modifies the key and data</p>
</div>
</div>

<pre><span id="VALcheck_key"><span class="keyword">val</span> check_key</span> : <code class="type">'a container -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p><code class="code">check_key&nbsp;cont</code> checks if all the keys contained in the data
        are alive</p>
</div>
</div>
</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.SeededS.html">Ephemeron.SeededS</a></code><code class="type">  with type key = H.t</code></pre><div class="info">
<p>Functor building an implementation of an hash table that use the container
      for keeping the information given</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>