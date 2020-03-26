<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Typemod</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Typemod.html">Typemod</a></h1>

<pre><span id="MODULETypemod"><span class="keyword">module</span> Typemod</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Typemod.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Type-checking of the module language and typed ast plugin hooks</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALtype_module"><span class="keyword">val</span> type_module</span> : <code class="type">Env.t -&gt; <a href="Parsetree.html#TYPEmodule_expr">Parsetree.module_expr</a> -&gt; Typedtree.module_expr</code></pre>
<pre><span id="VALtype_structure"><span class="keyword">val</span> type_structure</span> : <code class="type">Env.t -&gt;<br>       <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt;<br>       <a href="Location.html#TYPEt">Location.t</a> -&gt; Typedtree.structure * Types.signature * Env.t</code></pre>
<pre><span id="VALtype_toplevel_phrase"><span class="keyword">val</span> type_toplevel_phrase</span> : <code class="type">Env.t -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; Typedtree.structure * Types.signature * Env.t</code></pre>
<pre><span id="VALtype_implementation"><span class="keyword">val</span> type_implementation</span> : <code class="type">string -&gt;<br>       string -&gt;<br>       string -&gt;<br>       Env.t -&gt;<br>       <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; Typedtree.structure * Typedtree.module_coercion</code></pre>
<pre><span id="VALtype_interface"><span class="keyword">val</span> type_interface</span> : <code class="type">string -&gt; Env.t -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; Typedtree.signature</code></pre>
<pre><span id="VALtransl_signature"><span class="keyword">val</span> transl_signature</span> : <code class="type">Env.t -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; Typedtree.signature</code></pre>
<pre><span id="VALcheck_nongen_schemes"><span class="keyword">val</span> check_nongen_schemes</span> : <code class="type">Env.t -&gt; Types.signature -&gt; unit</code></pre>
<pre><span id="VALtype_open_"><span class="keyword">val</span> type_open_</span> : <code class="type">?used_slot:bool <a href="Pervasives.html#TYPEref">ref</a> -&gt;<br>       ?toplevel:bool -&gt;<br>       <a href="Asttypes.html#TYPEoverride_flag">Asttypes.override_flag</a> -&gt;<br>       Env.t -&gt; <a href="Location.html#TYPEt">Location.t</a> -&gt; <a href="Longident.html#TYPEt">Longident.t</a> <a href="Asttypes.html#TYPEloc">Asttypes.loc</a> -&gt; Path.t * Env.t</code></pre>
<pre><span id="VALmodtype_of_package"><span class="keyword">val</span> modtype_of_package</span> : <code class="type">Env.t -&gt;<br>       <a href="Location.html#TYPEt">Location.t</a> -&gt;<br>       Path.t -&gt; <a href="Longident.html#TYPEt">Longident.t</a> list -&gt; Types.type_expr list -&gt; Types.module_type</code></pre>
<pre><span id="VALsimplify_signature"><span class="keyword">val</span> simplify_signature</span> : <code class="type">Types.signature -&gt; Types.signature</code></pre>
<pre><span id="VALpath_of_module"><span class="keyword">val</span> path_of_module</span> : <code class="type">Typedtree.module_expr -&gt; Path.t option</code></pre>
<pre><span id="VALsave_signature"><span class="keyword">val</span> save_signature</span> : <code class="type">string -&gt;<br>       Typedtree.signature -&gt;<br>       string -&gt; string -&gt; Env.t -&gt; Cmi_format.cmi_infos -&gt; unit</code></pre>
<pre><span id="VALpackage_units"><span class="keyword">val</span> package_units</span> : <code class="type">Env.t -&gt; string list -&gt; string -&gt; string -&gt; Typedtree.module_coercion</code></pre>
<pre><code><span id="TYPEerror"><span class="keyword">type</span> <code class="type"></code>error</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Cannot_apply"><span class="constructor">Cannot_apply</span></span> <span class="keyword">of</span> <code class="type">Types.module_type</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Not_included"><span class="constructor">Not_included</span></span> <span class="keyword">of</span> <code class="type">Includemod.error list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Cannot_eliminate_dependency"><span class="constructor">Cannot_eliminate_dependency</span></span> <span class="keyword">of</span> <code class="type">Types.module_type</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Signature_expected"><span class="constructor">Signature_expected</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Structure_expected"><span class="constructor">Structure_expected</span></span> <span class="keyword">of</span> <code class="type">Types.module_type</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.With_no_component"><span class="constructor">With_no_component</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">Longident.t</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.With_mismatch"><span class="constructor">With_mismatch</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> * Includemod.error list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.With_makes_applicative_functor_ill_typed"><span class="constructor">With_makes_applicative_functor_ill_typed</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> * Path.t * Includemod.error list</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.With_changes_module_alias"><span class="constructor">With_changes_module_alias</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> * Ident.t * Path.t</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.With_cannot_remove_constrained_type"><span class="constructor">With_cannot_remove_constrained_type</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Repeated_name"><span class="constructor">Repeated_name</span></span> <span class="keyword">of</span> <code class="type">string * string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Non_generalizable"><span class="constructor">Non_generalizable</span></span> <span class="keyword">of</span> <code class="type">Types.type_expr</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Non_generalizable_class"><span class="constructor">Non_generalizable_class</span></span> <span class="keyword">of</span> <code class="type">Ident.t * Types.class_declaration</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Non_generalizable_module"><span class="constructor">Non_generalizable_module</span></span> <span class="keyword">of</span> <code class="type">Types.module_type</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Implementation_is_required"><span class="constructor">Implementation_is_required</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Interface_not_compiled"><span class="constructor">Interface_not_compiled</span></span> <span class="keyword">of</span> <code class="type">string</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Not_allowed_in_functor_body"><span class="constructor">Not_allowed_in_functor_body</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Not_a_packed_module"><span class="constructor">Not_a_packed_module</span></span> <span class="keyword">of</span> <code class="type">Types.type_expr</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Incomplete_packed_module"><span class="constructor">Incomplete_packed_module</span></span> <span class="keyword">of</span> <code class="type">Types.type_expr</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Scoping_pack"><span class="constructor">Scoping_pack</span></span> <span class="keyword">of</span> <code class="type"><a href="Longident.html#TYPEt">Longident.t</a> * Types.type_expr</code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Recursive_module_require_explicit_type"><span class="constructor">Recursive_module_require_explicit_type</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Apply_generative"><span class="constructor">Apply_generative</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTerror.Cannot_scrape_alias"><span class="constructor">Cannot_scrape_alias</span></span> <span class="keyword">of</span> <code class="type">Path.t</code></code></td>

</tr></tbody></table>



<pre><span id="EXCEPTIONError"><span class="keyword">exception</span> Error</span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEt">Location.t</a> * Env.t * <a href="Typemod.html#TYPEerror">error</a></code></pre>

<pre><span id="EXCEPTIONError_forward"><span class="keyword">exception</span> Error_forward</span> <span class="keyword">of</span> <code class="type"><a href="Location.html#TYPEerror">Location.error</a></code></pre>

<pre><span id="VALreport_error"><span class="keyword">val</span> report_error</span> : <code class="type">Env.t -&gt; <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Typemod.html#TYPEerror">error</a> -&gt; unit</code></pre>
<pre><span id="MODULEImplementationHooks"><span class="keyword">module</span> <a href="Typemod.ImplementationHooks.html">ImplementationHooks</a></span>: <code class="type"><a href="Misc.HookSig.html">Misc.HookSig</a></code><code class="type"> 
  with type t = Typedtree.structure * Typedtree.module_coercion</code></pre>
<pre><span id="MODULEInterfaceHooks"><span class="keyword">module</span> <a href="Typemod.InterfaceHooks.html">InterfaceHooks</a></span>: <code class="type"><a href="Misc.HookSig.html">Misc.HookSig</a></code><code class="type"> 
  with type t = Typedtree.signature</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>