<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalOO</a></div><ul></ul></nav></header>

<h1>Module <a href="type_CamlinternalOO.html">CamlinternalOO</a></h1>
<pre><span class="keyword">module</span> CamlinternalOO: <code class="code"><span class="keyword">sig</span></code> <a href="CamlinternalOO.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Run-time support for objects and classes.
    All functions in this module are for system use only, not for the
    casual user.<br>
<hr width="100%">
<br>
<span id="6_Classes"><h6>Classes</h6></span><br>
<pre><span id="TYPEtag"><span class="keyword">type</span> <code class="type"></code>tag</span> </pre>

<pre><span id="TYPElabel"><span class="keyword">type</span> <code class="type"></code>label</span> </pre>

<pre><span id="TYPEtable"><span class="keyword">type</span> <code class="type"></code>table</span> </pre>

<pre><span id="TYPEmeth"><span class="keyword">type</span> <code class="type"></code>meth</span> </pre>

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>

<pre><span id="TYPEobj"><span class="keyword">type</span> <code class="type"></code>obj</span> </pre>

<pre><span id="TYPEclosure"><span class="keyword">type</span> <code class="type"></code>closure</span> </pre>

<pre><span id="VALpublic_method_label"><span class="keyword">val</span> public_method_label</span> : <code class="type">string -&gt; <a href="CamlinternalOO.html#TYPEtag">tag</a></code></pre><pre><span id="VALnew_method"><span class="keyword">val</span> new_method</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a></code></pre><pre><span id="VALnew_variable"><span class="keyword">val</span> new_variable</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string -&gt; int</code></pre><pre><span id="VALnew_methods_variables"><span class="keyword">val</span> new_methods_variables</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt;<br>       string array -&gt; string array -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> array</code></pre><pre><span id="VALget_variable"><span class="keyword">val</span> get_variable</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string -&gt; int</code></pre><pre><span id="VALget_variables"><span class="keyword">val</span> get_variables</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string array -&gt; int array</code></pre><pre><span id="VALget_method_label"><span class="keyword">val</span> get_method_label</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a></code></pre><pre><span id="VALget_method_labels"><span class="keyword">val</span> get_method_labels</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string array -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> array</code></pre><pre><span id="VALget_method"><span class="keyword">val</span> get_method</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> -&gt; <a href="CamlinternalOO.html#TYPEmeth">meth</a></code></pre><pre><span id="VALset_method"><span class="keyword">val</span> set_method</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> -&gt; <a href="CamlinternalOO.html#TYPEmeth">meth</a> -&gt; unit</code></pre><pre><span id="VALset_methods"><span class="keyword">val</span> set_methods</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> array -&gt; unit</code></pre><pre><span id="VALnarrow"><span class="keyword">val</span> narrow</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; string array -&gt; string array -&gt; string array -&gt; unit</code></pre><pre><span id="VALwiden"><span class="keyword">val</span> widen</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; unit</code></pre><pre><span id="VALadd_initializer"><span class="keyword">val</span> add_initializer</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; (<a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; unit) -&gt; unit</code></pre><pre><span id="VALdummy_table"><span class="keyword">val</span> dummy_table</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a></code></pre><pre><span id="VALcreate_table"><span class="keyword">val</span> create_table</span> : <code class="type">string array -&gt; <a href="CamlinternalOO.html#TYPEtable">table</a></code></pre><pre><span id="VALinit_class"><span class="keyword">val</span> init_class</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; unit</code></pre><pre><span id="VALinherits"><span class="keyword">val</span> inherits</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt;<br>       string array -&gt;<br>       string array -&gt;<br>       string array -&gt;<br>       <a href="CamlinternalOO.html#TYPEt">t</a> * (<a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a>) *<br>       <a href="CamlinternalOO.html#TYPEt">t</a> * <a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; bool -&gt; <a href="Obj.html#TYPEt">Obj.t</a> array</code></pre><pre><span id="VALmake_class"><span class="keyword">val</span> make_class</span> : <code class="type">string array -&gt;<br>       (<a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) -&gt;<br>       <a href="CamlinternalOO.html#TYPEt">t</a> * (<a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) *<br>       (<a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) * <a href="Obj.html#TYPEt">Obj.t</a></code></pre><pre><span id="TYPEinit_table"><span class="keyword">type</span> <code class="type"></code>init_table</span> </pre>

<pre><span id="VALmake_class_store"><span class="keyword">val</span> make_class_store</span> : <code class="type">string array -&gt;<br>       (<a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) -&gt;<br>       <a href="CamlinternalOO.html#TYPEinit_table">init_table</a> -&gt; unit</code></pre><pre><span id="VALdummy_class"><span class="keyword">val</span> dummy_class</span> : <code class="type">string * int * int -&gt;<br>       <a href="CamlinternalOO.html#TYPEt">t</a> * (<a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) *<br>       (<a href="Obj.html#TYPEt">Obj.t</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a>) * <a href="Obj.html#TYPEt">Obj.t</a></code></pre><br>
<span id="6_Objects"><h6>Objects</h6></span><br>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">(&lt; .. &gt; as 'a) -&gt; 'a</code></pre><pre><span id="VALcreate_object"><span class="keyword">val</span> create_object</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEobj">obj</a></code></pre><pre><span id="VALcreate_object_opt"><span class="keyword">val</span> create_object_opt</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEobj">obj</a></code></pre><pre><span id="VALrun_initializers"><span class="keyword">val</span> run_initializers</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; unit</code></pre><pre><span id="VALrun_initializers_opt"><span class="keyword">val</span> run_initializers_opt</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt;<br>       <a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEobj">obj</a></code></pre><pre><span id="VALcreate_object_and_run_initializers"><span class="keyword">val</span> create_object_and_run_initializers</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtable">table</a> -&gt; <a href="CamlinternalOO.html#TYPEobj">obj</a></code></pre><pre><span id="VALsend"><span class="keyword">val</span> send</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtag">tag</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a></code></pre><pre><span id="VALsendcache"><span class="keyword">val</span> sendcache</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt;<br>       <a href="CamlinternalOO.html#TYPEtag">tag</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a> -&gt; int -&gt; <a href="CamlinternalOO.html#TYPEt">t</a></code></pre><pre><span id="VALsendself"><span class="keyword">val</span> sendself</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPElabel">label</a> -&gt; <a href="CamlinternalOO.html#TYPEt">t</a></code></pre><pre><span id="VALget_public_method"><span class="keyword">val</span> get_public_method</span> : <code class="type"><a href="CamlinternalOO.html#TYPEobj">obj</a> -&gt; <a href="CamlinternalOO.html#TYPEtag">tag</a> -&gt; <a href="CamlinternalOO.html#TYPEclosure">closure</a></code></pre><br>
<span id="6_Tablecache"><h6>Table cache</h6></span><br>
<pre><span id="TYPEtables"><span class="keyword">type</span> <code class="type"></code>tables</span> </pre>

<pre><span id="VALlookup_tables"><span class="keyword">val</span> lookup_tables</span> : <code class="type"><a href="CamlinternalOO.html#TYPEtables">tables</a> -&gt;<br>       <a href="CamlinternalOO.html#TYPEclosure">closure</a> array -&gt; <a href="CamlinternalOO.html#TYPEtables">tables</a></code></pre><br>
<span id="6_Builtinstoreducecodesize"><h6>Builtins to reduce code size</h6></span><br>
<pre><code><span id="TYPEimpl"><span class="keyword">type</span> <code class="type"></code>impl</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.GetConst"><span class="constructor">GetConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.GetVar"><span class="constructor">GetVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.GetEnv"><span class="constructor">GetEnv</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.GetMeth"><span class="constructor">GetMeth</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.SetVar"><span class="constructor">SetVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppConst"><span class="constructor">AppConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppVar"><span class="constructor">AppVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppEnv"><span class="constructor">AppEnv</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppMeth"><span class="constructor">AppMeth</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppConstConst"><span class="constructor">AppConstConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppConstVar"><span class="constructor">AppConstVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppConstEnv"><span class="constructor">AppConstEnv</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppConstMeth"><span class="constructor">AppConstMeth</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppVarConst"><span class="constructor">AppVarConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppEnvConst"><span class="constructor">AppEnvConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.AppMethConst"><span class="constructor">AppMethConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.MethAppConst"><span class="constructor">MethAppConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.MethAppVar"><span class="constructor">MethAppVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.MethAppEnv"><span class="constructor">MethAppEnv</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.MethAppMeth"><span class="constructor">MethAppMeth</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.SendConst"><span class="constructor">SendConst</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.SendVar"><span class="constructor">SendVar</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.SendEnv"><span class="constructor">SendEnv</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.SendMeth"><span class="constructor">SendMeth</span></span></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTimpl.Closure"><span class="constructor">Closure</span></span> <span class="keyword">of</span> <code class="type"><a href="CamlinternalOO.html#TYPEclosure">closure</a></code></code></td>

</tr></tbody></table>


<br>
<span id="6_Parameters"><h6>Parameters</h6></span><br>
<pre><code><span id="TYPEparams"><span class="keyword">type</span> <code class="type"></code>params</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTparams.compact_table">compact_table</span>&nbsp;:<code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTparams.copy_parent">copy_parent</span>&nbsp;:<code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTparams.clean_when_copying">clean_when_copying</span>&nbsp;:<code class="type">bool</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTparams.retry_count">retry_count</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span class="keyword">mutable&nbsp;</span><span id="TYPEELTparams.bucket_small_size">bucket_small_size</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr></tbody></table>
}


<pre><span id="VALparams"><span class="keyword">val</span> params</span> : <code class="type"><a href="CamlinternalOO.html#TYPEparams">params</a></code></pre><br>
<span id="6_Statistics"><h6>Statistics</h6></span><br>
<pre><code><span id="TYPEstats"><span class="keyword">type</span> <code class="type"></code>stats</span> = {</code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.classes">classes</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.methods">methods</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr>
<tr>
<td align="left" valign="top">
<code>&nbsp;&nbsp;</code></td>
<td align="left" valign="top">
<code><span id="TYPEELTstats.inst_vars">inst_vars</span>&nbsp;:<code class="type">int</code>;</code></td>

</tr></tbody></table>
}


<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type">unit -&gt; <a href="CamlinternalOO.html#TYPEstats">stats</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>