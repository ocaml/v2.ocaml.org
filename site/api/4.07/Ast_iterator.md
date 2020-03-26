<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ast_iterator</a></div><ul><li><a href="#1_AgenericParsetreeiterator">A generic Parsetree iterator</a></li></ul></nav></header>

<h1>Module <a href="type_Ast_iterator.html">Ast_iterator</a></h1>

<pre><span id="MODULEAst_iterator"><span class="keyword">module</span> Ast_iterator</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Ast_iterator.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p><a href="Ast_iterator.html#TYPEiterator"><code class="code"><span class="constructor">Ast_iterator</span>.iterator</code></a> allows to implement AST inspection using open recursion.  A
    typical mapper would be based on <a href="Ast_iterator.html#VALdefault_iterator"><code class="code"><span class="constructor">Ast_iterator</span>.default_iterator</code></a>, a trivial iterator,
    and will fall back on it for handling the syntax it does not modify.</p>
</div>
</div>
<hr width="100%">
<h2 id="1_AgenericParsetreeiterator">A generic Parsetree iterator</h2>
<pre><code><span id="TYPEiterator"><span class="keyword">type</span> <code class="type"></code>iterator</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.attribute">attribute</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.attributes">attributes</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEattribute">Parsetree.attribute</a> list -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.case">case</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEcase">Parsetree.case</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.cases">cases</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEcase">Parsetree.case</a> list -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_declaration">class_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_declaration">Parsetree.class_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_description">class_description</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_description">Parsetree.class_description</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_expr">class_expr</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_expr">Parsetree.class_expr</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_field">class_field</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_field">Parsetree.class_field</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_signature">class_signature</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_signature">Parsetree.class_signature</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_structure">class_structure</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_structure">Parsetree.class_structure</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_type">class_type</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_type">Parsetree.class_type</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_type_declaration">class_type_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_type_declaration">Parsetree.class_type_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.class_type_field">class_type_field</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEclass_type_field">Parsetree.class_type_field</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.constructor_declaration">constructor_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEconstructor_declaration">Parsetree.constructor_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.expr">expr</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.extension">extension</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEextension">Parsetree.extension</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.extension_constructor">extension_constructor</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEextension_constructor">Parsetree.extension_constructor</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.include_declaration">include_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEinclude_declaration">Parsetree.include_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.include_description">include_description</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEinclude_description">Parsetree.include_description</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.label_declaration">label_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPElabel_declaration">Parsetree.label_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.location">location</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Location.html#TYPEt">Location.t</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.module_binding">module_binding</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEmodule_binding">Parsetree.module_binding</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.module_declaration">module_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEmodule_declaration">Parsetree.module_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.module_expr">module_expr</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEmodule_expr">Parsetree.module_expr</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.module_type">module_type</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEmodule_type">Parsetree.module_type</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.module_type_declaration">module_type_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEmodule_type_declaration">Parsetree.module_type_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.open_description">open_description</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEopen_description">Parsetree.open_description</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.pat">pat</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEpattern">Parsetree.pattern</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.payload">payload</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEpayload">Parsetree.payload</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.signature">signature</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEsignature">Parsetree.signature</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.signature_item">signature_item</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEsignature_item">Parsetree.signature_item</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.structure">structure</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.structure_item">structure_item</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEstructure_item">Parsetree.structure_item</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.typ">typ</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEcore_type">Parsetree.core_type</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.type_declaration">type_declaration</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEtype_declaration">Parsetree.type_declaration</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.type_extension">type_extension</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEtype_extension">Parsetree.type_extension</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.type_kind">type_kind</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEtype_kind">Parsetree.type_kind</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.value_binding">value_binding</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEvalue_binding">Parsetree.value_binding</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.value_description">value_description</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEvalue_description">Parsetree.value_description</a> -&gt; unit</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTiterator.with_constraint">with_constraint</span>&nbsp;: <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a> -&gt; <a href="Parsetree.html#TYPEwith_constraint">Parsetree.with_constraint</a> -&gt; unit</code>;</code></td>

</tr></tbody></table>
}

<div class="info ">
<div class="info-desc">
<p>A <code class="code">iterator</code> record implements one "method" per syntactic category,
    using an open recursion style: each method takes as its first
    argument the iterator to be applied to children in the syntax
    tree.</p>
</div>
</div>


<pre><span id="VALdefault_iterator"><span class="keyword">val</span> default_iterator</span> : <code class="type"><a href="Ast_iterator.html#TYPEiterator">iterator</a></code></pre><div class="info ">
<div class="info-desc">
<p>A default iterator, which implements a "do not do anything" mapping.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>