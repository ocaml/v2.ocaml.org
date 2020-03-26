<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.GenHashTable.MakeSeeded</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Ephemeron.GenHashTable.MakeSeeded.html">Ephemeron.GenHashTable.MakeSeeded</a></h1>

<pre><span id="MODULEMakeSeeded"><span class="keyword">module</span> MakeSeeded</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
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
</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.SeededS.html">Ephemeron.SeededS</a></code><code class="type">  with type key = H.t</code></pre><div class="info module top">
<div class="info-desc">
<p>Functor building an implementation of an hash table that use the container
      for keeping the information given</p>
</div>
</div>
<table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>H</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig
    type t
    (** keys *)

    type 'a container
    (** contains keys and the associated data *)

    val hash: int -&gt; t -&gt; int
    (** same as {!<a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a>} *)

    val equal: 'a container -&gt; t -&gt; equal
    (** equality predicate used to compare a key with the one in a
        container. Can return [EDead] if the keys in the container are
        dead *)

    val create: t -&gt; 'a -&gt; 'a container
    (** [create key data] creates a container from
        some initials keys and one data *)

    val get_key: 'a container -&gt; t option
    (** [get_key cont] returns the keys if they are all alive *)

    val get_data: 'a container -&gt; 'a option
    (** [get_data cont] returns the data if it is alive *)

    val set_key_data: 'a container -&gt; t -&gt; 'a -&gt; unit
    (** [set_key_data cont] modifies the key and data *)

    val check_key: 'a container -&gt; bool
    (** [check_key cont] checks if all the keys contained in the data
        are alive *)
  end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span class="keyword">include</span> <a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a></pre>

<pre><span id="VALclean"><span class="keyword">val</span> clean</span> : <code class="type">'a t -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>remove all dead bindings. Done automatically during automatic resizing.</p>
</div>
</div>

<pre><span id="VALstats_alive"><span class="keyword">val</span> stats_alive</span> : <code class="type">'a t -&gt; <a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code></pre><div class="info ">
<div class="info-desc">
<p>same as <a href="Hashtbl.SeededS.html#VALstats"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">SeededS</span>.stats</code></a> but only count the alive bindings</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>