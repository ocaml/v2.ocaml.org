<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Printexc.Slot</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Printexc.Slot.html">Printexc.Slot</a></h1>

<pre><span class="keyword">module</span> Slot: <code class="code"><span class="keyword">sig</span></code> <a href="Printexc.Slot.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type"><a href="Printexc.html#TYPEbacktrace_slot">Printexc.backtrace_slot</a></code> </pre>


<pre><span id="VALis_raise"><span class="keyword">val</span> is_raise</span> : <code class="type"><a href="Printexc.Slot.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<code class="code">is_raise slot</code> is <code class="code"><span class="keyword">true</span></code> when <code class="code">slot</code> refers to a raising
      point in the code, and <code class="code"><span class="keyword">false</span></code> when it comes from a simple
      function call.<br>
<b>Since</b> 4.02<br>
</div>

<pre><span id="VALlocation"><span class="keyword">val</span> location</span> : <code class="type"><a href="Printexc.Slot.html#TYPEt">t</a> -&gt; <a href="Printexc.html#TYPElocation">Printexc.location</a> option</code></pre><div class="info ">
<code class="code">location slot</code> returns the location information of the slot,
      if available, and <code class="code"><span class="constructor">None</span></code> otherwise.
<p>

      Some possible reasons for failing to return a location are as follow:</p><ul>
<li>the slot corresponds to a compiler-inserted raise</li>
<li>the slot corresponds to a part of the program that has not been
      compiled with debug information (<code class="code">-g</code>)</li>
</ul>
<br>
<b>Since</b> 4.02<br>
</div>

<pre><span id="VALformat"><span class="keyword">val</span> format</span> : <code class="type">int -&gt; <a href="Printexc.Slot.html#TYPEt">t</a> -&gt; string option</code></pre><div class="info ">
<code class="code">format pos slot</code> returns the string representation of <code class="code">slot</code> as
      <code class="code">raw_backtrace_to_string</code> would format it, assuming it is the
      <code class="code">pos</code>-th element of the backtrace: the <code class="code">0</code>-th element is
      pretty-printed differently than the others.
<p>

      Whole-backtrace printing functions also skip some uninformative
      slots; in that case, <code class="code">format pos slot</code> returns <code class="code"><span class="constructor">None</span></code>.<br>
<b>Since</b> 4.02<br>
</p></div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>