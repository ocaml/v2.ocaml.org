<h1>A few papers on OCaml</h1>

<div class="pull-right hero-unit" style="margin-left: 1em" >
  <div class="span5">
    <em>Table of contents</em>
    <div ml:replace="toc"></div>
  </div>
</div>

<h2><a name="language-features"></a>Language features</h2>

<h3><a name="core-language"></a>The core language</h3>

<table class="biblio">
  <tr>
    <td class="number">[1]</td>
    <td>
      <span class="authors-caption"></span>Andrew K. Wright and Matthias Felleisen.
      <span class="title">A Syntactic Approach to Type Soundness.</span>
      <span class="ref">In Information &amp; Computation, 115(1):38&#8722;94, 1994.</span>
      <div class="alist">[ <a href="http://www.cs.rice.edu/CS/PLT/Publications/Scheme/ic94-wf.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This paper describes the semantics and the type system of Core ML, and uses a simple syntactic technique to prove that well-typed programs cannot go wrong.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[2]</td>
    <td>
      <span class="authors-caption"></span>François Pottier and Didier Rémy.
      <span class="title">The Essence of ML Type Inference.</span> 
      <span class="ref">In Benjamin C. Pierce, editor, Advanced Topics in Types and Programming Languages, MIT Press, 2005.</span> 
      <div class="desc">
	This book chapter gives an in-depth description of the Core ML type system, with
        an emphasis on type inference. The type inference algorithm is described as the
	composition of a constraint generator, which produces a system of type equations,
	and a constraint solver, which is presented as a set of rewrite rules.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[3]</td>
    <td>
      <span class="authors-caption"></span>Jacques Garrigue.
      <span class="title">Relaxing the value restriction.</span> 
      <span class="ref">In International Symposium on Functional and Logic Programming, 2004.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-value_restriction-fiwflp04.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-value_restriction-fiwflp04.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This paper explains why it is sound to generalize certain type variables
        at a <code><b>let</b></code> binding, even when the expression that is being
	<code><b>let</b></code>-bound is not a value. This relaxed version
	of Wright's classic &#8220;value restriction&#8221; was introduced
	in OCaml 3.07.
      </div>
    </td>
  </tr>
</table>

<h3><a name="modules"></a>Modules</h3>

<table class="biblio">
  <tr>
    <td class="number">[4]</td>
    <td>
      <span class="authors-caption"></span>Xavier Leroy.
      <span class="title">Manifest types, modules, and separate compilation.</span>
      <span class="ref">In Principles of Programming Languages, 1994.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This paper presents a variant of the Standard ML module system that
        introduces a strict distinction between abstract and <em>manifest</em> types.
	The latter are types whose definitions explicitly appear as part of a module
	interface. This proposal is meant to retain most of the expressive power of
	the Standard ML module system, while providing much better support for separate
	compilation. This work sets the formal bases for OCaml's module system.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[5]</td>
    <td>
      <span class="authors-caption"></span>Xavier Leroy.
      <span class="title">Applicative functors and fully transparent higher-order 
	modules.</span>
      <span class="ref">In Principles of Programming Languages, 1995.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This work extends the above paper by introducing so-called <em>applicative</em> functors,
        that is, functors that produce compatible abstract types when applied to provably
	equal arguments. Applicative functors are also a feature of OCaml.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[6]</td>
    <td>
      <span class="authors-caption">
      </span>Xavier Leroy.
      <span class="title">A Modular Module System.</span>
      <span class="ref">In Journal of Functional Programming, 10(3):269-303, 2000.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This accessible paper describes a simplified implementation of the OCaml
        module system, emphasizing the fact that the module system is largely independent
	of the underlying core language. This is a good tutorial to learn both how
	modules can be used and how they are typechecked.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[7]</td>
    <td>
      <span class="authors-caption">
      </span>Xavier Leroy.
      <span class="title">A proposal for recursive modules in Objective Caml.</span>
      <span class="ref">Unpublished.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-recursive_modules-03.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-recursive_modules-03.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This note describes the experimental recursive modules introduced
        in OCaml 3.07.
      </div>
    </td>
  </tr>
</table>


<h3><a name="objects"></a>Objects</h3>

<table class="biblio">
  <tr>
    <td class="number">[8]</td>
    <td>
      <span class="authors-caption">
      </span>Didier Rémy and Jérôme Vouillon.
      <span class="title">Objective ML: An effective object-oriented extension to ML.</span>
      <span class="ref">In Theory And Practice of Objects Systems, 4(1):27&#8722;50, 1998.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This paper provides theoretical foundations for OCaml's object-oriented
        layer, including dynamic and static semantics.
      </div>
    </td>
  </tr>
</table>


<table class="biblio">
  <tr>
    <td class="number">[9]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue and Didier Rémy.
      <span class="title">Extending ML with Semi-Explicit Higher-Order Polymorphism.</span>
      <span class="ref">In Information &amp; Computation, 155(1/2):134&#8722;169, 1999.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This paper proposes a device for re-introducing first-class polymorphic values
        into ML while preserving its type inference mechanism. This technology underlies
	OCaml's polymorphic methods.
      </div>
    </td>
  </tr>
</table>



<h3><a name="polymorphic-variants"></a>Polymorphic variants</h3>

<table class="biblio">
  <tr>
    <td class="number">[10]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue.
      <span class="title">Programming with polymorphic variants.</span>
      <span class="ref">In ML Workshop, 1998.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-polymorphic_variants-ml98.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-polymorphic_variants-ml98.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This paper briefly explains what polymorphic variants are about and how
        they are compiled.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[11]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue.
      <span class="title">Code reuse through polymorphic variants.</span>
      <span class="ref">In Workshop on Foundations of Software Engineering, 2000.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-variant-reuse-2000.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This short paper explains how to design a modular, extensible interpreter
        using polymorphic variants.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[12]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue.
      <span class="title">Simple Type Inference for Structural Polymorphism.</span>
      <span class="ref">In Workshop on Foundations of Object-Oriented Languages, 2002.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-structural_poly-fool02.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-structural_poly-fool02.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This paper explains most of the typechecking machinery behind polymorphic variants.
        At its heart is an extension of Core ML's type discipline with so-called <em>local</em>
	constraints.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[13]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue.
      <span class="title">Typing deep pattern-matching in presence of polymorphic variants.</span>
      <span class="ref">In JSSST Workshop on Programming and Programming Languages, 2004.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-deep-variants-2004.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-deep-variants-2004.ps.gz">Gzipped PostScript</a> ]</div>
      <div class="desc">
	This paper provides more details about the technical machinery behind polymorphic variants,
        focusing on the rules for typechecking <em>deep</em> pattern matching constructs.
      </div>
    </td>
  </tr>
</table>

<h3><a name="labeled-parameters"></a>Labeled and optional parameters</h3>

<table class="biblio">
  <tr>
    <td class="number">[14]</td>
    <td>
      <span class="authors-caption">
      </span>Jacques Garrigue.
      <span class="title">Labeled and optional arguments for Objective Caml.</span>
      <span class="ref">In JSSST Workshop on Programming and
	Programming Languages, 2001.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.pdf">PDF</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.dvi.gz">Gzipped DVI</a> ]</div>
      <div class="desc">
	This paper offers a dynamic semantics, a static semantics, and a compilation scheme
        for OCaml's labeled and optional function parameters.
      </div>
    </td>
  </tr>
</table>

<h2><a name="compilers"></a>Compilers and runtime system</h2>

<h3><a name="bytecode"></a>The bytecode compiler and bytecode interpreter</h3>

<table class="biblio">
  <tr>
    <td class="number">[15]</td>
    <td>
      <span class="authors-caption">
      </span>Xavier Leroy.
      <span class="title">The ZINC experiment, 
	an economical implementation of the ML language.</span>
      <span class="ref">Technical report 117, INRIA, 1990.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-zinc.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-zinc.pdf">PDF</a> ]</div>
      <div class="desc">
	This report contains a description of the ZINC compiler, which later evolved into
	Caml Light, then into OCaml. Large parts of this report
	are out of date, but it is still valuable as a description of the
	abstract machine used in Caml Light and (with some further
	simplifications and speed improvements) in OCaml.
      </div>
    </td>
  </tr>
</table>



<h3><a name="native-compiler"></a>The native-code compiler</h3>

<table class="biblio">
  <tr>
    <td class="number">[16]</td>
    <td>
      <span class="authors-caption">
      </span>Xavier Leroy.
      <span class="title">The effectiveness of type-based unboxing.</span>
      <span class="ref">In Workshop on Types in Compilation, 1997.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/xleroy-unboxing-tic97.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/xleroy-unboxing-tic97.pdf">PDF</a> ]</div>
      <div class="desc">
	This paper surveys and compares several 
	data representation strategies, including the one used in the
	OCaml native-code compiler.
      </div>
    </td>
  </tr>
</table>



<h3><a name="garbage-collector"></a>The garbage collector</h3>

<table class="biblio">
  <tr>
    <td class="number">[17]</td>
    <td>
      <span class="authors-caption">
      </span>Damien Doligez and Xavier Leroy.
      <span class="title">A concurrent, generational garbage collector for a multithreaded
	implementation of ML.</span>
      <span class="ref">In Principles of Programming Languages, 1993.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/doligez_xleroy-concurrent_gc-popl93.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/doligez_xleroy-concurrent_gc-popl93.pdf">PDF</a> ]</div>
      <div class="desc">Superseded by the next paper.</div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[18]</td>
    <td>
      <span class="authors-caption">
      </span>Damien Doligez and Georges Gonthier.
      <span class="title">Portable, Unobtrusive Garbage Collection for Multiprocessor 
	Systems.</span>
      <span class="ref">In Principles of Programming Languages, 1994.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/doligez_gonthier-gc-popl94.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/doligez_gonthier-gc-popl94.pdf">PDF</a> ]</div>
      <div class="desc">
	This paper describes a concurrent version of the garbage collector
        found in Caml Light and OCaml's runtime system.
      </div>
    </td>
  </tr>
</table>

<table class="biblio">
  <tr>
    <td class="number">[19]</td>
    <td>
      <span class="authors-caption">
      </span>Damien Doligez.
      <span class="title">Conception, réalisation et certification d'un glaneur de cellules
	concurrent.</span>
      <span class="ref">Ph.D. thesis, Université Paris 7, 1995.</span>
      <div class="alist">[ <a href="http://caml.inria.fr/pub/papers/doligez-these.ps.gz">Gzipped PostScript</a> | <a href="http://caml.inria.fr/pub/papers/doligez-these.pdf">PDF</a> ]</div>
      <div class="desc">
	All you ever wanted to know about the garbage collector
        found in Caml Light and OCaml's runtime system.
      </div>
    </td>
  </tr>
</table>

