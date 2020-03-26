<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="maintitle">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.10<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 February&nbsp;21, 2020<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2020 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual071.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



<h1 class="chapter" id="sec1">Contents</h1>
<ul class="toc"><li class="li-toc">
<a href="index.html#sec6">Part&nbsp;I&nbsp;&nbsp;An introduction to OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#sec7"><span>Chapter 1</span>&nbsp;&nbsp;The core language</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#s%3Abasics">1&nbsp;&nbsp;Basics</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Adatatypes">2&nbsp;&nbsp;Data types</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Afunctions-as-values">3&nbsp;&nbsp;Functions as values</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Atut-recvariants">4&nbsp;&nbsp;Records and variants</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#ss%3Arecord-and-variant-disambiguation">4.1&nbsp;&nbsp;Record and variant disambiguation</a>
</li></ul>
</li><li class="li-toc"><a href="coreexamples.html#s%3Aimperative-features">5&nbsp;&nbsp;Imperative features</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Aexceptions">6&nbsp;&nbsp;Exceptions</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Alazy-expr">7&nbsp;&nbsp;Lazy expressions</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Asymb-expr">8&nbsp;&nbsp;Symbolic processing of expressions</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Apretty-printing">9&nbsp;&nbsp;Pretty-printing</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Aprintf">10&nbsp;&nbsp;Printf formats</a>
</li><li class="li-toc"><a href="coreexamples.html#s%3Astandalone-programs">11&nbsp;&nbsp;Standalone OCaml programs</a>
</li></ul>
</li><li class="li-toc"><a href="moduleexamples.html#sec20"><span>Chapter 2</span>&nbsp;&nbsp;The module system</a>
<ul class="toc"><li class="li-toc">
<a href="moduleexamples.html#s%3Amodule%3Astructures">1&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="moduleexamples.html#s%3Asignature">2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="moduleexamples.html#s%3Afunctors">3&nbsp;&nbsp;Functors</a>
</li><li class="li-toc"><a href="moduleexamples.html#s%3Afunctors-and-abstraction">4&nbsp;&nbsp;Functors and type abstraction</a>
</li><li class="li-toc"><a href="moduleexamples.html#s%3Aseparate-compilation">5&nbsp;&nbsp;Modules and separate compilation</a>
</li></ul>
</li><li class="li-toc"><a href="objectexamples.html#sec26"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="objectexamples.html#s%3Aclasses-and-objects">1&nbsp;&nbsp;Classes and objects</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Aimmediate-objects">2&nbsp;&nbsp;Immediate objects</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Areference-to-self">3&nbsp;&nbsp;Reference to self</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Ainitializers">4&nbsp;&nbsp;Initializers</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Avirtual-methods">5&nbsp;&nbsp;Virtual methods</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Aprivate-methods">6&nbsp;&nbsp;Private methods</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Aclass-interfaces">7&nbsp;&nbsp;Class interfaces</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Ainheritance">8&nbsp;&nbsp;Inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Amultiple-inheritance">9&nbsp;&nbsp;Multiple inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Aparameterized-classes">10&nbsp;&nbsp;Parameterized classes</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Apolymorphic-methods">11&nbsp;&nbsp;Polymorphic methods</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Ausing-coercions">12&nbsp;&nbsp;Using coercions</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Afunctional-objects">13&nbsp;&nbsp;Functional objects</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Acloning-objects">14&nbsp;&nbsp;Cloning objects</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Arecursive-classes">15&nbsp;&nbsp;Recursive classes</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Abinary-methods">16&nbsp;&nbsp;Binary methods</a>
</li><li class="li-toc"><a href="objectexamples.html#s%3Afriends">17&nbsp;&nbsp;Friends</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#sec44"><span>Chapter 4</span>&nbsp;&nbsp;Labels and variants</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#s%3Alabels">1&nbsp;&nbsp;Labels</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#ss%3Aoptional-arguments">1.1&nbsp;&nbsp;Optional arguments</a>
</li><li class="li-toc"><a href="lablexamples.html#ss%3Alabel-inference">1.2&nbsp;&nbsp;Labels and type inference</a>
</li><li class="li-toc"><a href="lablexamples.html#ss%3Alabel-suggestions">1.3&nbsp;&nbsp;Suggestions for labeling</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#s%3Apolymorphic-variants">2&nbsp;&nbsp;Polymorphic variants</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#ss%3Apolyvariant-weaknesses">2.1&nbsp;&nbsp;Weaknesses of polymorphic variants</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec53"><span>Chapter 5</span>&nbsp;&nbsp;Polymorphism and its limitations</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#s%3Aweak-polymorphism">1&nbsp;&nbsp;Weak polymorphism and mutation</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#ss%3Aweak-types">1.1&nbsp;&nbsp;Weakly polymorphic types</a>
</li><li class="li-toc"><a href="polymorphism.html#ss%3Avaluerestriction">1.2&nbsp;&nbsp;The value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#ss%3Arelaxed-value-restriction">1.3&nbsp;&nbsp;The relaxed value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#ss%3Avariance-and-value-restriction">1.4&nbsp;&nbsp;Variance and value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#ss%3Avariance%3Aabstract-data-types">1.5&nbsp;&nbsp;Abstract data types</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#s%3Apolymorphic-recursion">2&nbsp;&nbsp;Polymorphic recursion</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#ss%3Aexplicit-polymorphism">2.1&nbsp;&nbsp;Explicitly polymorphic annotations</a>
</li><li class="li-toc"><a href="polymorphism.html#ss%3Arecursive-poly-examples">2.2&nbsp;&nbsp;More examples</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#s%3Ahigher-rank-poly">3&nbsp;&nbsp;Higher-rank polymorphic functions</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec64"><span>Chapter 6</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
<ul class="toc"><li class="li-toc">
<a href="advexamples.html#s%3Aextended-bank-accounts">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li class="li-toc"><a href="advexamples.html#s%3Amodules-as-classes">2&nbsp;&nbsp;Simple modules as classes</a>
<ul class="toc"><li class="li-toc">
<a href="advexamples.html#ss%3Astring-as-class">2.1&nbsp;&nbsp;Strings</a>
</li><li class="li-toc"><a href="advexamples.html#ss%3Ahashtbl-as-class">2.2&nbsp;&nbsp;Hashtbl</a>
</li><li class="li-toc"><a href="advexamples.html#ss%3Aset-as-class">2.3&nbsp;&nbsp;Sets</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#s%3Asubject-observer">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec72">Part&nbsp;II&nbsp;&nbsp;The OCaml language</a>
<ul class="toc"><li class="li-toc">
<a href="language.html#sec73"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</a>
<ul class="toc"><li class="li-toc">
<a href="lex.html#s%3Alexical-conventions">1&nbsp;&nbsp;Lexical conventions</a>
</li><li class="li-toc"><a href="values.html#s%3Avalues">2&nbsp;&nbsp;Values</a>
<ul class="toc"><li class="li-toc">
<a href="values.html#ss%3Avalues%3Abase">2.1&nbsp;&nbsp;Base values</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Atuple">2.2&nbsp;&nbsp;Tuples</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Arecords">2.3&nbsp;&nbsp;Records</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Aarray">2.4&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Avariant">2.5&nbsp;&nbsp;Variant values</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Apolyvars">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Afun">2.7&nbsp;&nbsp;Functions</a>
</li><li class="li-toc"><a href="values.html#ss%3Avalues%3Aobj">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
</li><li class="li-toc"><a href="names.html#s%3Anames">3&nbsp;&nbsp;Names</a>
</li><li class="li-toc"><a href="types.html#s%3Atypexpr">4&nbsp;&nbsp;Type expressions</a>
</li><li class="li-toc"><a href="const.html#s%3Aconst">5&nbsp;&nbsp;Constants</a>
</li><li class="li-toc"><a href="patterns.html#s%3Apatterns">6&nbsp;&nbsp;Patterns</a>
</li><li class="li-toc"><a href="expr.html#s%3Avalue-expr">7&nbsp;&nbsp;Expressions</a>
<ul class="toc"><li class="li-toc">
<a href="expr.html#ss%3Aprecedence-and-associativity">7.1&nbsp;&nbsp;Precedence and associativity</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-basic">7.2&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-control">7.3&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-ops-on-data">7.4&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-operators">7.5&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-obj">7.6&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-coercions">7.7&nbsp;&nbsp;Coercions</a>
</li><li class="li-toc"><a href="expr.html#ss%3Aexpr-other">7.8&nbsp;&nbsp;Other</a>
</li></ul>
</li><li class="li-toc"><a href="typedecl.html#s%3Atydef">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="toc"><li class="li-toc">
<a href="typedecl.html#ss%3Atypedefs">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="typedecl.html#ss%3Aexndef">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="classes.html#s%3Aclasses">9&nbsp;&nbsp;Classes</a>
<ul class="toc"><li class="li-toc">
<a href="classes.html#ss%3Aclasses%3Aclass-types">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="classes.html#ss%3Aclass-expr">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="classes.html#ss%3Aclass-def">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="classes.html#ss%3Aclass-spec">9.4&nbsp;&nbsp;Class specifications</a>
</li><li class="li-toc"><a href="classes.html#ss%3Aclasstype">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="modtypes.html#s%3Amodtypes">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="toc"><li class="li-toc">
<a href="modtypes.html#ss%3Amty-simple">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="modtypes.html#ss%3Amty-signatures">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="modtypes.html#ss%3Amty-functors">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="modtypes.html#ss%3Amty-with">10.4&nbsp;&nbsp;The <span class="c003">with</span> operator</a>
</li></ul>
</li><li class="li-toc"><a href="modules.html#s%3Amodule-expr">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="toc"><li class="li-toc">
<a href="modules.html#ss%3Amexpr-simple">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="modules.html#ss%3Amexpr-structures">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="modules.html#ss%3Amexpr-functors">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="compunit.html#s%3Acompilation-units">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec238"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</a>
<ul class="toc"><li class="li-toc">
<a href="letrecvalues.html#s%3Aletrecvalues">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="manual024.html#s%3Arecursive-modules">2&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="privatetypes.html#s%3Aprivate-types">3&nbsp;&nbsp;Private types</a>
<ul class="toc"><li class="li-toc">
<a href="privatetypes.html#ss%3Aprivate-types-variant">3.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="privatetypes.html#ss%3Aprivate-types-abbrev">3.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="privatetypes.html#ss%3Aprivate-rows">3.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="locallyabstract.html#s%3Alocally-abstract">4&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="firstclassmodules.html#s%3Afirst-class-modules">5&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="moduletypeof.html#s%3Amodule-type-of">6&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="signaturesubstitution.html#s%3Asignature-substitution">7&nbsp;&nbsp;Substituting inside a signature</a>
<ul class="toc"><li class="li-toc">
<a href="signaturesubstitution.html#ss%3Adestructive-substitution">7.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li class="li-toc"><a href="signaturesubstitution.html#ss%3Alocal-substitution">7.2&nbsp;&nbsp;Local substitution declarations</a>
</li></ul>
</li><li class="li-toc"><a href="modulealias.html#s%3Amodule-alias">8&nbsp;&nbsp;Type-level module aliases</a>
</li><li class="li-toc"><a href="overridingopen.html#s%3Aexplicit-overriding-open">9&nbsp;&nbsp;Overriding in open statements</a>
</li><li class="li-toc"><a href="gadts.html#s%3Agadts">10&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li class="li-toc"><a href="bigarray.html#s%3Abigarray-access">11&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li class="li-toc"><a href="attributes.html#s%3Aattributes">12&nbsp;&nbsp;Attributes</a>
<ul class="toc"><li class="li-toc">
<a href="attributes.html#ss%3Abuiltin-attributes">12.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
</li><li class="li-toc"><a href="extensionnodes.html#s%3Aextension-nodes">13&nbsp;&nbsp;Extension nodes</a>
<ul class="toc"><li class="li-toc">
<a href="extensionnodes.html#ss%3Abuiltin-extension-nodes">13.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
</li><li class="li-toc"><a href="extensiblevariants.html#s%3Aextensible-variants">14&nbsp;&nbsp;Extensible variant types</a>
<ul class="toc"><li class="li-toc">
<a href="extensiblevariants.html#ss%3Aprivate-extensible">14.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
</li><li class="li-toc"><a href="generativefunctors.html#s%3Agenerative-functors">15&nbsp;&nbsp;Generative functors</a>
</li><li class="li-toc"><a href="extensionsyntax.html#s%3Aextension-syntax">16&nbsp;&nbsp;Extension-only syntax</a>
<ul class="toc"><li class="li-toc">
<a href="extensionsyntax.html#ss%3Aextension-operators">16.1&nbsp;&nbsp;Extension operators</a>
</li><li class="li-toc"><a href="extensionsyntax.html#ss%3Aextension-literals">16.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
</li><li class="li-toc"><a href="inlinerecords.html#s%3Ainline-records">17&nbsp;&nbsp;Inline records</a>
</li><li class="li-toc"><a href="doccomments.html#s%3Adoc-comments">18&nbsp;&nbsp;Documentation comments</a>
<ul class="toc"><li class="li-toc">
<a href="doccomments.html#ss%3Afloating-comments">18.1&nbsp;&nbsp;Floating comments</a>
</li><li class="li-toc"><a href="doccomments.html#ss%3Aitem-comments">18.2&nbsp;&nbsp;Item comments</a>
</li><li class="li-toc"><a href="doccomments.html#ss%3Alabel-comments">18.3&nbsp;&nbsp;Label comments</a>
</li></ul>
</li><li class="li-toc"><a href="indexops.html#s%3Aindex-operators">19&nbsp;&nbsp;Extended indexing operators </a>
<ul class="toc"><li class="li-toc">
<a href="indexops.html#ss%3Amultiindexing">19.1&nbsp;&nbsp;Multi-index notation</a>
</li></ul>
</li><li class="li-toc"><a href="emptyvariants.html#s%3Aempty-variants">20&nbsp;&nbsp;Empty variant types</a>
</li><li class="li-toc"><a href="alerts.html#s%3Aalerts">21&nbsp;&nbsp;Alerts</a>
</li><li class="li-toc"><a href="generalizedopens.html#s%3Ageneralized-open">22&nbsp;&nbsp;Generalized open statements</a>
</li><li class="li-toc"><a href="bindingops.html#s%3Abinding-operators">23&nbsp;&nbsp;Binding operators</a>
<ul class="toc"><li class="li-toc">
<a href="bindingops.html#ss%3Aletops-rationale">23.1&nbsp;&nbsp;Rationale</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec286">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#sec287"><span>Chapter 9</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#s%3Acomp-overview">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="comp.html#s%3Acomp-options">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="comp.html#s%3Amodules-file-system">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="comp.html#s%3Acomp-errors">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="comp.html#s%3Acomp-warnings">5&nbsp;&nbsp;Warning reference</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#ss%3Awarn9">5.1&nbsp;&nbsp;Warning 9: missing fields in a record pattern</a>
</li><li class="li-toc"><a href="comp.html#ss%3Awarn52">5.2&nbsp;&nbsp;Warning 52: fragile constant pattern</a>
</li><li class="li-toc"><a href="comp.html#ss%3Awarn57">5.3&nbsp;&nbsp;Warning 57: Ambiguous or-pattern variables under guard</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec297"><span>Chapter 10</span>&nbsp;&nbsp;The toplevel system or REPL (ocaml)</a>
<ul class="toc"><li class="li-toc">
<a href="toplevel.html#s%3Atoplevel-options">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="toplevel.html#s%3Atoplevel-directives">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="toplevel.html#s%3Atoplevel-modules">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="toplevel.html#s%3Atoplevel-common-errors">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="toplevel.html#s%3Acustom-toplevel">5&nbsp;&nbsp;Building custom toplevel systems: <span class="c003">ocamlmktop</span></a>
<ul class="toc"><li class="li-toc">
<a href="toplevel.html#ss%3Aocamlmktop-options">5.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#s%3Aocamlnat">6&nbsp;&nbsp;The native toplevel: <span class="c003">ocamlnat</span> (experimental)</a>
</li></ul>
</li><li class="li-toc"><a href="runtime.html#sec305"><span>Chapter 11</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="toc"><li class="li-toc">
<a href="runtime.html#s%3Aocamlrun-overview">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="runtime.html#s%3Aocamlrun-options">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="runtime.html#s%3Aocamlrun-dllpath">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="runtime.html#s%3Aocamlrun-common-errors">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="native.html#sec310"><span>Chapter 12</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="toc"><li class="li-toc">
<a href="native.html#s%3Anative-overview">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="native.html#s%3Anative-options">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="native.html#s%3Anative-common-errors">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="native.html#s%3Anative%3Arunning-executable">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="native.html#s%3Acompat-native-bytecode">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec319"><span>Chapter 13</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#s%3Aocamllex-overview">1&nbsp;&nbsp;Overview of <span class="c003">ocamllex</span></a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#ss%3Aocamllex-options">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#s%3Aocamllex-syntax">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#ss%3Aocamllex-header-trailer">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-named-regexp">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-entry-points">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-regexp">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-actions">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-variables">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Arefill-handlers">2.7&nbsp;&nbsp;Refill handlers</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamllex-reserved-ident">2.8&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#s%3Aocamlyacc-overview">3&nbsp;&nbsp;Overview of <span class="c003">ocamlyacc</span></a>
</li><li class="li-toc"><a href="lexyacc.html#s%3Aocamlyacc-syntax">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#ss%3Aocamlyacc-header-trailer">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamlyacc-declarations">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamlyacc-rules">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="lexyacc.html#ss%3Aocamlyacc-error-handling">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#s%3Aocamlyacc-options">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="lexyacc.html#s%3Alexyacc-example">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="lexyacc.html#s%3Alexyacc-common-errors">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="depend.html#sec340"><span>Chapter 14</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="toc"><li class="li-toc">
<a href="depend.html#s%3Aocamldep-options">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="depend.html#s%3Aocamldep-makefile">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="browser.html#sec343"><span>Chapter 15</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec344"><span>Chapter 16</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#s%3Aocamldoc-usage">1&nbsp;&nbsp;Usage</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#ss%3Aocamldoc-invocation">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-merge">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-rules">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#s%3Aocamldoc-comments">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#ss%3Aocamldoc-placement">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-stop">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-syntax">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-formatting">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-tags">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#s%3Aocamldoc-custom-generators">3&nbsp;&nbsp;Custom generators</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#ss%3Aocamldoc-generators">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="ocamldoc.html#ss%3Aocamldoc-handling-custom-tags">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#s%3Aocamldoc-adding-flags">4&nbsp;&nbsp;Adding command line options</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#ss%3Aocamldoc-compilation-and-usage">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec381"><span>Chapter 17</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#s%3Adebugger-compilation">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-invocation">2&nbsp;&nbsp;Invocation</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#ss%3Adebugger-start">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-init-file">2.2&nbsp;&nbsp;Initialization file</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-exut">2.3&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-commands">3&nbsp;&nbsp;Commands</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#ss%3Adebugger-help">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-state">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-execution">4&nbsp;&nbsp;Executing a program</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#ss%3Adebugger-events">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-starting-program">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-running">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-time-travel">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-kill">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#s%3Abreakpoints">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-callstack">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-examining-values">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-control">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#ss%3Adebugger-name-and-arguments">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-loading">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-search-path">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-working-dir">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-reverse-execution">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-fork">8.6&nbsp;&nbsp;Behavior of the debugger with respect to <span class="c003">fork</span></a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-stop-at-new-load">8.7&nbsp;&nbsp;Stopping execution when new code is loaded</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-communication">8.8&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-fine-tuning">8.9&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="debugger.html#ss%3Adebugger-printers">8.10&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#s%3Adebugger-misc-cmds">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="debugger.html#s%3Ainf-debugger">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="profil.html#sec412"><span>Chapter 18</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="toc"><li class="li-toc">
<a href="profil.html#s%3Aocamlprof-compiling">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="profil.html#s%3Aocamlprof-profiling">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="profil.html#s%3Aocamlprof-printing">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="profil.html#s%3Aocamlprof-time-profiling">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="manual056.html#sec420"><span>Chapter 19</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
</li><li class="li-toc"><a href="intfc.html#c%3Aintf-c"><span>Chapter 20</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#s%3Ac-overview">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-prim-decl">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-prim-impl">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Astaticlink-c-code">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Adynlink-c-code">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-static-vs-dynamic">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Acustom-runtime">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-value">2&nbsp;&nbsp;The <span class="c003">value</span> type</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-int">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-blocks">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-outside-head">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-ocaml-datatype-repr">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-atomic">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-tuples-and-records">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-arrays">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-concrete-datatypes">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-objects">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-polyvar">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-ops-on-values">4&nbsp;&nbsp;Operations on values</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-kind-tests">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-int-ops">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-block-access">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-block-allocation">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-exceptions">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-gc-harmony">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-simple-gc-harmony">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-low-level-gc-harmony">5.2&nbsp;&nbsp;Low-level interface</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-process-pending-actions">5.3&nbsp;&nbsp;Pending actions and asynchronous exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-intf-example">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-callback">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-callbacks">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-closures">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-register-exn">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Amain-c">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-embedded-code">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-advexample">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-custom">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-custom-ops">9.1&nbsp;&nbsp;The <span class="c003">struct custom_operations</span></a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-custom-alloc">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-custom-access">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-custom-serialization">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-custom-idents">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-finalized">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3AC-Bigarrays">10&nbsp;&nbsp;Advanced topic: Bigarrays and the OCaml-C interface</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3AC-Bigarrays-include">10.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="intfc.html#ss%3AC-Bigarrays-access">10.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="intfc.html#ss%3AC-Bigarrays-wrap">10.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml Bigarray</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3AC-cheaper-call">11&nbsp;&nbsp;Advanced topic: cheaper C call</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-unboxed">11.1&nbsp;&nbsp;Passing unboxed values</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-direct-call">11.2&nbsp;&nbsp;Direct C call</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-direct-call-example">11.3&nbsp;&nbsp;Example: calling C library functions without indirection</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3AC-multithreading">12&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-thread-register">12.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Aparallel-execution-long-running-c-code">12.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#s%3Ainterfacing-windows-unicode-apis">13&nbsp;&nbsp;Advanced topic: interfacing with Windows Unicode APIs</a>
</li><li class="li-toc"><a href="intfc.html#s%3Aocamlmklib">14&nbsp;&nbsp;Building mixed C/OCaml libraries: <span class="c003">ocamlmklib</span></a>
</li><li class="li-toc"><a href="intfc.html#s%3Ac-internal-guidelines">15&nbsp;&nbsp;Cautionary words: the internal runtime API</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#ss%3Ac-internals">15.1&nbsp;&nbsp;Internal variables and CAML_INTERNALS</a>
</li><li class="li-toc"><a href="intfc.html#ss%3Ac-internal-macros">15.2&nbsp;&nbsp;OCaml version macros</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec495"><span>Chapter 21</span>&nbsp;&nbsp;Optimisation with Flambda</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#s%3Aflambda-overview">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-cli">2&nbsp;&nbsp;Command-line flags</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-rounds">2.1&nbsp;&nbsp;Specification of optimisation parameters by round</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-inlining">3&nbsp;&nbsp;Inlining</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-classic">3.1&nbsp;&nbsp;Classic inlining heuristic</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-inlining-overview">3.2&nbsp;&nbsp;Overview of “Flambda” inlining heuristics</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-by-constructs">3.3&nbsp;&nbsp;Handling of specific language constructs</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-inlining-reports">3.4&nbsp;&nbsp;Inlining reports</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-assessment-inlining">3.5&nbsp;&nbsp;Assessment of inlining benefit</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-speculation">3.6&nbsp;&nbsp;Control of speculation</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-specialisation">4&nbsp;&nbsp;Specialisation</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-assessment-specialisation">4.1&nbsp;&nbsp;Assessment of specialisation benefit</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-defaults">5&nbsp;&nbsp;Default settings of parameters</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-o2">5.1&nbsp;&nbsp;Settings at -O2 optimisation level</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-o3">5.2&nbsp;&nbsp;Settings at -O3 optimisation level</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-manual-control">6&nbsp;&nbsp;Manual control of inlining and specialisation</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-simplification">7&nbsp;&nbsp;Simplification</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-other-transfs">8&nbsp;&nbsp;Other code motion transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-lift-const">8.1&nbsp;&nbsp;Lifting of constants</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-lift-toplevel-let">8.2&nbsp;&nbsp;Lifting of toplevel let bindings</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-unboxing">9&nbsp;&nbsp;Unboxing transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-unbox-fvs">9.1&nbsp;&nbsp;Unboxing of closure variables</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-unbox-spec-args">9.2&nbsp;&nbsp;Unboxing of specialised arguments</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-unbox-closures">9.3&nbsp;&nbsp;Unboxing of closures</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-remove-unused">10&nbsp;&nbsp;Removal of unused code and values</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-redundant-let">10.1&nbsp;&nbsp;Removal of redundant let expressions</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-redundant">10.2&nbsp;&nbsp;Removal of redundant program constructs</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-remove-unused-args">10.3&nbsp;&nbsp;Removal of unused arguments</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-removal-closure-vars">10.4&nbsp;&nbsp;Removal of unused closure variables</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-other">11&nbsp;&nbsp;Other code transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#ss%3Aflambda-non-escaping-refs">11.1&nbsp;&nbsp;Transformation of non-escaping references into mutable variables</a>
</li><li class="li-toc"><a href="flambda.html#ss%3Aflambda-subst-closure-vars">11.2&nbsp;&nbsp;Substitution of closure variables for specialised arguments</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-effects">12&nbsp;&nbsp;Treatment of effects</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-static-modules">13&nbsp;&nbsp;Compilation of statically-allocated modules</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-inhibition">14&nbsp;&nbsp;Inhibition of optimisation</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-unsafe">15&nbsp;&nbsp;Use of unsafe operations</a>
</li><li class="li-toc"><a href="flambda.html#s%3Aflambda-glossary">16&nbsp;&nbsp;Glossary</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#sec546"><span>Chapter 22</span>&nbsp;&nbsp;Memory profiling with Spacetime</a>
<ul class="toc"><li class="li-toc">
<a href="spacetime.html#s%3Aspacetime-overview">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="spacetime.html#s%3Aspacetime-howto">2&nbsp;&nbsp;How to use it</a>
<ul class="toc"><li class="li-toc">
<a href="spacetime.html#ss%3Aspacetime-building">2.1&nbsp;&nbsp;Building</a>
</li><li class="li-toc"><a href="spacetime.html#ss%3Aspacetime-running">2.2&nbsp;&nbsp;Running</a>
</li><li class="li-toc"><a href="spacetime.html#ss%3Aspacetime-analysis">2.3&nbsp;&nbsp;Analysis</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#s%3Aspacetime-runtimeoverhead">3&nbsp;&nbsp;Runtime overhead</a>
</li><li class="li-toc"><a href="spacetime.html#s%3Aspacetime-dev">4&nbsp;&nbsp;For developers</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#sec554"><span>Chapter 23</span>&nbsp;&nbsp;Fuzzing with afl-fuzz</a>
<ul class="toc"><li class="li-toc">
<a href="afl-fuzz.html#s%3Aafl-overview">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="afl-fuzz.html#s%3Aafl-generate">2&nbsp;&nbsp;Generating instrumentation</a>
<ul class="toc"><li class="li-toc">
<a href="afl-fuzz.html#ss%3Aafl-advanced">2.1&nbsp;&nbsp;Advanced options</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#s%3Aafl-example">3&nbsp;&nbsp;Example</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec559">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="toc"><li class="li-toc">
<a href="core.html#sec560"><span>Chapter 24</span>&nbsp;&nbsp;The core library</a>
<ul class="toc"><li class="li-toc">
<a href="core.html#s%3Acore-builtins">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
<ul class="toc"><li class="li-toc">
<a href="core.html#ss%3Abuiltin-types">1.1&nbsp;&nbsp;*</a>
</li></ul>
</li><li class="li-toc"><a href="core.html#s%3Astdlib-module">2&nbsp;&nbsp;Module <span class="c003">Stdlib</span>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="stdlib.html#sec566"><span>Chapter 25</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="parsing.html#sec568"><span>Chapter 26</span>&nbsp;&nbsp;The compiler front-end</a>
</li><li class="li-toc"><a href="libunix.html#sec569"><span>Chapter 27</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="libnum.html#sec570"><span>Chapter 28</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="libstr.html#sec571"><span>Chapter 29</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="libthreads.html#sec572"><span>Chapter 30</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="libgraph.html#sec573"><span>Chapter 31</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="libdynlink.html#sec574"><span>Chapter 32</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="libbigarray.html#sec575"><span>Chapter 33</span>&nbsp;&nbsp;The bigarray library</a>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec576">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>