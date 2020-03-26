<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ast_helper</a></div><ul><li><a href="#1_Defaultlocations">Default locations</a></li><li><a href="#1_Constants">Constants</a></li><li><a href="#1_Corelanguage">Core language</a></li><li><a href="#1_Modulelanguage">Module language</a></li><li><a href="#1_Classlanguage">Class language</a></li></ul></nav></header>

<h1>Module <a href="type_Ast_helper.html">Ast_helper</a></h1>

<pre><span id="MODULEAst_helper"><span class="keyword">module</span> Ast_helper</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Helpers to produce Parsetree fragments</p>

<p><b>Warning</b> This module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="TYPEwith_loc"><span class="keyword">type</span> <code class="type">'a</code> with_loc</span> = <code class="type">'a <a href="Location.html#TYPEloc">Location.loc</a></code> </pre>


<pre><span id="TYPEloc"><span class="keyword">type</span> <code class="type"></code>loc</span> = <code class="type"><a href="Location.html#TYPEt">Location.t</a></code> </pre>


<pre><span id="TYPElid"><span class="keyword">type</span> <code class="type"></code>lid</span> = <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> <a href="Ast_helper.html#TYPEwith_loc">with_loc</a></code> </pre>


<pre><span id="TYPEstr"><span class="keyword">type</span> <code class="type"></code>str</span> = <code class="type">string <a href="Ast_helper.html#TYPEwith_loc">with_loc</a></code> </pre>


<pre><span id="TYPEattrs"><span class="keyword">type</span> <code class="type"></code>attrs</span> = <code class="type"><a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a> list</code> </pre>

<h2 id="1_Defaultlocations">Default locations</h2>
<pre><span id="VALdefault_loc"><span class="keyword">val</span> default_loc</span> : <code class="type"><a href="Ast_helper.html#TYPEloc">loc</a> ref</code></pre><div class="info ">
<div class="info-desc">
<p>Default value for all optional location arguments.</p>
</div>
</div>

<pre><span id="VALwith_default_loc"><span class="keyword">val</span> with_default_loc</span> : <code class="type"><a href="Ast_helper.html#TYPEloc">loc</a> -&gt; (unit -&gt; 'a) -&gt; 'a</code></pre><div class="info ">
<div class="info-desc">
<p>Set the <code class="code">default_loc</code> within the scope of the execution
        of the provided function.</p>
</div>
</div>
<h2 id="1_Constants">Constants</h2>
<pre><span id="MODULEConst"><span class="keyword">module</span> <a href="Ast_helper.Const.html">Const</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Const.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEAttr"><span class="keyword">module</span> <a href="Ast_helper.Attr.html">Attr</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Attr.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Attributes</p>

</div>
<h2 id="1_Corelanguage">Core language</h2>
<pre><span id="MODULETyp"><span class="keyword">module</span> <a href="Ast_helper.Typ.html">Typ</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Typ.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Type expressions</p>

</div>

<pre><span id="MODULEPat"><span class="keyword">module</span> <a href="Ast_helper.Pat.html">Pat</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Pat.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Patterns</p>

</div>

<pre><span id="MODULEExp"><span class="keyword">module</span> <a href="Ast_helper.Exp.html">Exp</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Exp.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Expressions</p>

</div>

<pre><span id="MODULEVal"><span class="keyword">module</span> <a href="Ast_helper.Val.html">Val</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Val.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Value declarations</p>

</div>

<pre><span id="MODULEType"><span class="keyword">module</span> <a href="Ast_helper.Type.html">Type</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Type.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Type declarations</p>

</div>

<pre><span id="MODULETe"><span class="keyword">module</span> <a href="Ast_helper.Te.html">Te</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Te.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Type extensions</p>

</div>
<h2 id="1_Modulelanguage">Module language</h2>
<pre><span id="MODULEMty"><span class="keyword">module</span> <a href="Ast_helper.Mty.html">Mty</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mty.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module type expressions</p>

</div>

<pre><span id="MODULEMod"><span class="keyword">module</span> <a href="Ast_helper.Mod.html">Mod</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mod.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module expressions</p>

</div>

<pre><span id="MODULESig"><span class="keyword">module</span> <a href="Ast_helper.Sig.html">Sig</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Sig.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Signature items</p>

</div>

<pre><span id="MODULEStr"><span class="keyword">module</span> <a href="Ast_helper.Str.html">Str</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Str.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Structure items</p>

</div>

<pre><span id="MODULEMd"><span class="keyword">module</span> <a href="Ast_helper.Md.html">Md</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Md.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module declarations</p>

</div>

<pre><span id="MODULEMs"><span class="keyword">module</span> <a href="Ast_helper.Ms.html">Ms</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Ms.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module substitutions</p>

</div>

<pre><span id="MODULEMtd"><span class="keyword">module</span> <a href="Ast_helper.Mtd.html">Mtd</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mtd.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module type declarations</p>

</div>

<pre><span id="MODULEMb"><span class="keyword">module</span> <a href="Ast_helper.Mb.html">Mb</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Mb.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Module bindings</p>

</div>

<pre><span id="MODULEOpn"><span class="keyword">module</span> <a href="Ast_helper.Opn.html">Opn</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Opn.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Opens</p>

</div>

<pre><span id="MODULEIncl"><span class="keyword">module</span> <a href="Ast_helper.Incl.html">Incl</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Incl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Includes</p>

</div>

<pre><span id="MODULEVb"><span class="keyword">module</span> <a href="Ast_helper.Vb.html">Vb</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Vb.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Value bindings</p>

</div>
<h2 id="1_Classlanguage">Class language</h2>
<pre><span id="MODULECty"><span class="keyword">module</span> <a href="Ast_helper.Cty.html">Cty</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cty.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class type expressions</p>

</div>

<pre><span id="MODULECtf"><span class="keyword">module</span> <a href="Ast_helper.Ctf.html">Ctf</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Ctf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class type fields</p>

</div>

<pre><span id="MODULECl"><span class="keyword">module</span> <a href="Ast_helper.Cl.html">Cl</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class expressions</p>

</div>

<pre><span id="MODULECf"><span class="keyword">module</span> <a href="Ast_helper.Cf.html">Cf</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class fields</p>

</div>

<pre><span id="MODULECi"><span class="keyword">module</span> <a href="Ast_helper.Ci.html">Ci</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Ci.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Classes</p>

</div>

<pre><span id="MODULECsig"><span class="keyword">module</span> <a href="Ast_helper.Csig.html">Csig</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Csig.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class signatures</p>

</div>

<pre><span id="MODULECstr"><span class="keyword">module</span> <a href="Ast_helper.Cstr.html">Cstr</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Cstr.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Class structures</p>

</div>

<pre><span id="MODULERf"><span class="keyword">module</span> <a href="Ast_helper.Rf.html">Rf</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Rf.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Row fields</p>

</div>

<pre><span id="MODULEOf"><span class="keyword">module</span> <a href="Ast_helper.Of.html">Of</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_helper.Of.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Object fields</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>