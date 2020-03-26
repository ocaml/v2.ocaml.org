<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec238"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="letrecvalues.html#start-section">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="manual024.html#start-section">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="privatetypes.html#start-section">3&nbsp;&nbsp;Private types</a>
</li><li><a href="locallyabstract.html#start-section">4&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="firstclassmodules.html#start-section">5&nbsp;&nbsp;First-class modules</a>
</li><li><a href="moduletypeof.html#start-section">6&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="signaturesubstitution.html#start-section">7&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="modulealias.html#start-section">8&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="overridingopen.html#start-section">9&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="gadts.html#start-section">10&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="bigarray.html#start-section">11&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="attributes.html#start-section">12&nbsp;&nbsp;Attributes</a>
</li><li><a href="extensionnodes.html#start-section">13&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="extensiblevariants.html#start-section">14&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="generativefunctors.html#start-section">15&nbsp;&nbsp;Generative functors</a>
</li><li><a href="extensionsyntax.html#start-section">16&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="inlinerecords.html#start-section">17&nbsp;&nbsp;Inline records</a>
</li><li><a href="doccomments.html#start-section">18&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="indexops.html#start-section">19&nbsp;&nbsp;Extended indexing operators </a>
</li><li><a href="emptyvariants.html#start-section">20&nbsp;&nbsp;Empty variant types</a>
</li><li><a href="alerts.html#start-section">21&nbsp;&nbsp;Alerts</a>
</li><li><a href="generalizedopens.html#start-section">22&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="bindingops.html#start-section">23&nbsp;&nbsp;Binding operators</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="s:bigarray-access"><a class="section-anchor" href="#s:bigarray-access" aria-hidden="true"></a>11&nbsp;&nbsp;Syntax for Bigarray access</h2>
<p>(Introduced in Objective Caml 3.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>&nbsp;<span class="c004">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This extension provides syntactic sugar for getting and setting
elements in the arrays provided by the <a href="../../api/4.10/Bigarray.html"><span class="c003">Bigarray</span></a> module.</p><p>The short expressions are translated into calls to functions of the
<span class="c003">Bigarray</span> module as described in the following table.</p><div class="tableau">
<div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">expression</span></td><td class="c014"><span class="c013">translation</span> </td></tr>
<tr><td class="c016">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array1.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array1.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array2.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array2.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array3.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array3.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> …<span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Genarray.get </span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> <span class="c004">[|</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span>
&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> <span class="c004">|]</span> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> …<span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Genarray.set </span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> <span class="c004">[|</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span>
&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> <span class="c004">|]</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
</tbody></table></div></div><p>The last two entries are valid for any <span class="c009">n</span> &gt; 3.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>