<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Ephemeron</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Ephemeron.html">Stdlib.Ephemeron</a></h1>

<pre><span id="MODULEEphemeron"><span class="keyword">module</span> Ephemeron</span>: <code class="type"><a href="Ephemeron.html">Ephemeron</a></code></pre><hr width="100%">
<p>Ephemerons and weak hash table are useful when one wants to cache
    or memorize the computation of a function, as long as the
    arguments and the function are used, without creating memory leaks
    by continuously keeping old computation results that are not
    useful anymore because one argument or the function is freed. An
    implementation using <a href="Hashtbl.html#TYPEt"><code class="code"><span class="constructor">Hashtbl</span>.t</code></a> is not suitable because all
    associations would keep in memory the arguments and the result.</p>

<p>Ephemerons can also be used for "adding" a field to an arbitrary
    boxed ocaml value: you can attach an information to a value
    created by an external library without memory leaks.</p>

<p>Ephemerons hold some keys and one or no data. They are all boxed
    ocaml values. The keys of an ephemeron have the same behavior
    than weak pointers according to the garbage collector. In fact
    ocaml weak pointers are implemented as ephemerons without data.</p>

<p>The keys and data of an ephemeron are said to be full if they
    point to a value, empty if the value have never been set, have
    been unset, or was erased by the GC. In the function that accesses
    the keys or data these two states are represented by the <code class="code">option</code>
    type.</p>

<p>The data is considered by the garbage collector alive if all the
    full keys are alive and if the ephemeron is alive. When one of the
    keys is not considered alive anymore by the GC, the data is
    emptied from the ephemeron. The data could be alive for another
    reason and in that case the GC will not free it, but the ephemeron
    will not hold the data anymore.</p>

<p>The ephemerons complicate the notion of liveness of values, because
    it is not anymore an equivalence with the reachability from root
    value by usual pointers (not weak and not ephemerons). With ephemerons
    the notion of liveness is constructed by the least fixpoint of:
       A value is alive if:</p>
<ul>
<li>it is a root value</li>
<li>it is reachable from alive value by usual pointers</li>
<li>it is the data of an alive ephemeron with all its full keys alive</li>
</ul>
<p>Notes:</p>
<ul>
<li>All the types defined in this module cannot be marshaled
    using <a href="Stdlib.html#VALoutput_value"><code class="code">output_value</code></a> or the functions of the
    <a href="Marshal.html"><code class="code"><span class="constructor">Marshal</span></code></a> module.</li>
</ul>
<p>Ephemerons are defined in a language agnostic way in this paper:
    B. Hayes, Ephemerons: a New Finalization Mechanism, OOPSLA'9</p>

<pre><span id="MODULETYPES"><span class="keyword">module type</span> <a href="Ephemeron.S.html">S</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>The output signature of the functor <a href="Ephemeron.K1.Make.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.<span class="constructor">Make</span></code></a> and <a href="Ephemeron.K2.Make.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K2</span>.<span class="constructor">Make</span></code></a>.</p>

</div>

<pre><span id="MODULETYPESeededS"><span class="keyword">module type</span> <a href="Ephemeron.SeededS.html">SeededS</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.SeededS.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>The output signature of the functor <a href="Ephemeron.K1.MakeSeeded.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.<span class="constructor">MakeSeeded</span></code></a> and <a href="Ephemeron.K2.MakeSeeded.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K2</span>.<span class="constructor">MakeSeeded</span></code></a>.</p>

</div>

<pre><span id="MODULEK1"><span class="keyword">module</span> <a href="Ephemeron.K1.html">K1</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.K1.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEK2"><span class="keyword">module</span> <a href="Ephemeron.K2.html">K2</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.K2.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEKn"><span class="keyword">module</span> <a href="Ephemeron.Kn.html">Kn</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.Kn.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEGenHashTable"><span class="keyword">module</span> <a href="Ephemeron.GenHashTable.html">GenHashTable</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.GenHashTable.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>