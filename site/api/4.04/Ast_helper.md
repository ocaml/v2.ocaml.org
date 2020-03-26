<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ast_helper</a></div><ul><li><a href="#2_Defaultlocations">Default locations</a></li><li><a href="#2_Constants">Constants</a></li><li><a href="#2_Corelanguage">Core language</a></li><li><a href="#2_Modulelanguage">Module language</a></li><li><a href="#2_Classlanguage">Class language</a></li></ul></nav></header>

<h1>Module <a href="type_Ast_helper.html">Ast_helper</a></h1>

<pre><span class="keyword">module</span> Ast_helper: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Helpers to produce Parsetree fragments<br>
</div>
<hr width="100%">

<pre><span id="TYPElid"><span class="keyword">type</span> <code class="type"></code>lid</span> = <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> <a href="Asttypes.html#TYPEloc">Asttypes.loc</a></code> </pre>


<pre><span id="TYPEstr"><span class="keyword">type</span> <code class="type"></code>str</span> = <code class="type">string <a href="Asttypes.html#TYPEloc">Asttypes.loc</a></code> </pre>


<pre><span id="TYPEloc"><span class="keyword">type</span> <code class="type"></code>loc</span> = <code class="type"><a href="Location.html#TYPEt">Location.t</a></code> </pre>


<pre><span id="TYPEattrs"><span class="keyword">type</span> <code class="type"></code>attrs</span> = <code class="type"><a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a> list</code> </pre>

<br>
<h2 id="2_Defaultlocations">Default locations</h2><br>

<pre><span id="VALdefault_loc"><span class="keyword">val</span> default_loc</span> : <code class="type"><a href="Ast_helper.html#TYPEloc">loc</a> <a href="Pervasives.html#TYPEref">ref</a></code></pre><div class="info ">
Default value for all optional location arguments.<br>
</div>

<pre><span id="VALwith_default_loc"><span class="keyword">val</span> with_default_loc</span> : <code class="type"><a href="Ast_helper.html#TYPEloc">loc</a> -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre><div class="info ">
Set the <code class="code">default_loc</code> within the scope of the execution
        of the provided function.<br>
</div>
<br>
<h2 id="2_Constants">Constants</h2><br>

<pre><span class="keyword">module</span> <a href="Ast_helper.Const.html">Const</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Const.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><br>
<h2 id="2_Corelanguage">Core language</h2><br>

<pre><span class="keyword">module</span> <a href="Ast_helper.Typ.html">Typ</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Typ.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Type expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Pat.html">Pat</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Pat.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Patterns
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Exp.html">Exp</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Exp.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Val.html">Val</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Val.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Value declarations
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Type.html">Type</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Type.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Type declarations
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Te.html">Te</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Te.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Type extensions
</div>
<br>
<h2 id="2_Modulelanguage">Module language</h2><br>

<pre><span class="keyword">module</span> <a href="Ast_helper.Mty.html">Mty</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mty.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Module type expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Mod.html">Mod</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mod.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Module expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Sig.html">Sig</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Sig.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Signature items
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Str.html">Str</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Str.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Structure items
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Md.html">Md</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Md.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Module declarations
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Mtd.html">Mtd</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mtd.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Module type declarations
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Mb.html">Mb</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mb.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Module bindings
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Opn.html">Opn</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Opn.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Opens
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Incl.html">Incl</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Incl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Includes
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Vb.html">Vb</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Vb.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Value bindings
</div>
<br>
<h2 id="2_Classlanguage">Class language</h2><br>

<pre><span class="keyword">module</span> <a href="Ast_helper.Cty.html">Cty</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cty.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class type expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Ctf.html">Ctf</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Ctf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class type fields
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Cl.html">Cl</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class expressions
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Cf.html">Cf</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class fields
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Ci.html">Ci</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Ci.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Classes
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Csig.html">Csig</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Csig.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class signatures
</div>

<pre><span class="keyword">module</span> <a href="Ast_helper.Cstr.html">Cstr</a>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cstr.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Class structures
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>