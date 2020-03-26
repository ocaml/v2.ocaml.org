<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ocaml_operators</a></div><ul></ul></nav></header>

<h1>Ocaml_operators</h1>
<div class="info-desc">
<p>Precedence level and associativity of operators</p>

<p>The following table lists the precedence level of all operator classes
from the highest to the lowest precedence. A few other syntactic constructions
are also listed as references.</p>


<p></p><table align="center" border="1">
<thead><tr><th>Operator class</th><th>Associativity </th></tr></thead>
<tbody><tr><td><code class="code">!… ~…</code>     </td><td>–</td></tr>
<tr><td><code class="code">.…() .…[] .…{} </code>
                                                      </td><td>–</td></tr>
<tr><td><code class="code">#…</code>              </td><td> left </td></tr>
<tr><td><code class="code">function application</code>  </td><td> left </td></tr>
<tr><td><code class="code">- -.</code>                  </td><td>–</td></tr>
<tr><td><code class="code">**… lsl lsr asr </code></td><td> right </td></tr>
<tr><td><code class="code">*…  /… %… mod land lor lxor</code>
                                                      </td><td> left  </td></tr>
<tr><td><code class="code">+… -…</code>     </td><td> left  </td></tr>
<tr><td><code class="code">::</code>                    </td><td> right </td></tr>
<tr><td><code class="code">@… ^…            </code></td><td> right </td></tr>
<tr><td><code class="code">=… &lt;…
&gt;… |… &amp;… $… !=</code>     </td><td> left  </td></tr>
<tr><td><code class="code">&amp; &amp;&amp;</code>      </td><td> right </td></tr>
<tr><td><code class="code">or || </code>                </td><td> right </td></tr>
<tr><td><code class="code">,</code>                     </td><td>–</td></tr>
<tr><td><code class="code">&lt;- :=</code>                 </td><td> right </td></tr>
<tr><td><code class="code">if</code>                    </td><td>–</td></tr>
<tr><td><code class="code">;</code>                     </td><td> right </td></tr>
</tbody></table><p></p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>