<!-- ((! set title Papers !)) ((! set documentation !)) -->

# A few papers on OCaml
*Table of contents*

## Language features
###  The core language

1. Andrew K. Wright and Matthias Felleisen. A Syntactic Approach to Type
Soundness. In Information &amp; Computation, 115(1):38−94, 1994.
[ [Gzipped
PostScript](http://www.cs.rice.edu/CS/PLT/Publications/Scheme/ic94-wf.ps.gz)
]

    This paper describes the semantics and the type system of Core ML, and
uses a simple syntactic technique to prove that well-typed programs
cannot go wrong.

2. François Pottier and Didier Rémy. The Essence of ML Type Inference. In
Benjamin C. Pierce, editor, Advanced Topics in Types and Programming
Languages, MIT Press, 2005.

    This book chapter gives an in-depth description of the Core ML type
system, with an emphasis on type inference. The type inference algorithm
is described as the composition of a constraint generator, which
produces a system of type equations, and a constraint solver, which is
presented as a set of rewrite rules.
[
[Gzipped PostScript](http://cristal.inria.fr/attapl/preversion.ps.gz)
]

3. Jacques Garrigue. Relaxing the value restriction. In International
Symposium on Functional and Logic Programming, 2004.
[
[PDF](http://caml.inria.fr/pub/papers/garrigue-value_restriction-fiwflp04.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-value_restriction-fiwflp04.ps.gz)
]

    This paper explains why it is sound to generalize certain type variables
at a `let` binding, even when the expression that is being `let`-bound
is not a value. This relaxed version of Wright's classic “value
restriction” was introduced in OCaml 3.07.

###  Modules

4. Xavier Leroy. Manifest types, modules, and separate compilation. In
Principles of Programming Languages, 1994.
[
[PDF](http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/xleroy-manifest_types-popl94.dvi.gz)
]

    This paper presents a variant of the Standard ML module system that
introduces a strict distinction between abstract and *manifest* types.
The latter are types whose definitions explicitly appear as part of a
module interface. This proposal is meant to retain most of the
expressive power of the Standard ML module system, while providing much
better support for separate compilation. This work sets the formal bases
for OCaml's module system.

5. Xavier Leroy. Applicative functors and fully transparent higher-order
modules. In Principles of Programming Languages, 1995.
[
[PDF](http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/xleroy-applicative_functors-popl95.dvi.gz)
]

    This work extends the above paper by introducing so-called *applicative*
functors, that is, functors that produce compatible abstract types when
applied to provably equal arguments. Applicative functors are also a
feature of OCaml.

6. Xavier Leroy. A Modular Module System. In Journal of Functional
Programming, 10(3):269-303, 2000.
[ [PDF](http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/xleroy-modular_modules-jfp.dvi.gz)
]

    This accessible paper describes a simplified implementation of the OCaml
module system, emphasizing the fact that the module system is largely
independent of the underlying core language. This is a good tutorial to
learn both how modules can be used and how they are typechecked.

7.  Xavier Leroy. A proposal for recursive modules in Objective Caml.
Unpublished.
[ [PDF](http://caml.inria.fr/pub/papers/xleroy-recursive_modules-03.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-recursive_modules-03.ps.gz)
]

    This note describes the experimental recursive modules introduced in
    OCaml 3.07.

###  Objects

8. Didier Rémy and Jérôme Vouillon. Objective ML: An effective
object-oriented extension to ML. In Theory And Practice of Objects
Systems, 4(1):27−50, 1998.
[
[PDF](http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/remy_vouillon-objective_ml-tapos98.dvi.gz)
]

    This paper provides theoretical foundations for OCaml's object-oriented
layer, including dynamic and static semantics.

9. Jacques Garrigue and Didier Rémy. Extending ML with Semi-Explicit
Higher-Order Polymorphism. In Information &amp; Computation,
155(1/2):134−169, 1999.
[ [PDF](http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.pdf) |
[Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/garrigue_remy-poly-ic99.dvi.gz) ]

    This paper proposes a device for re-introducing first-class polymorphic
values into ML while preserving its type inference mechanism. This
technology underlies OCaml's polymorphic methods.

###  Polymorphic variants

10.  Jacques Garrigue. Programming with polymorphic variants. In ML Workshop,
1998.
[
[PDF](http://caml.inria.fr/pub/papers/garrigue-polymorphic_variants-ml98.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-polymorphic_variants-ml98.ps.gz)
]

    This paper briefly explains what polymorphic variants are about and how
they are compiled.

11. Jacques Garrigue. Code reuse through polymorphic variants. In Workshop
on Foundations of Software Engineering, 2000.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-variant-reuse-2000.ps.gz)
]

    This short paper explains how to design a modular, extensible
interpreter using polymorphic variants.

12. Jacques Garrigue. Simple Type Inference for Structural Polymorphism. In
Workshop on Foundations of Object-Oriented Languages, 2002.
[
[PDF](http://caml.inria.fr/pub/papers/garrigue-structural_poly-fool02.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-structural_poly-fool02.ps.gz)
]

    This paper explains most of the typechecking machinery behind
polymorphic variants. At its heart is an extension of Core ML's type
discipline with so-called *local* constraints.

13. Jacques Garrigue. Typing deep pattern-matching in presence of
polymorphic variants. In JSSST Workshop on Programming and Programming
Languages, 2004.
[ [PDF](http://caml.inria.fr/pub/papers/garrigue-deep-variants-2004.pdf)
| [Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-deep-variants-2004.ps.gz)
]

    This paper provides more details about the technical machinery behind
polymorphic variants, focusing on the rules for typechecking *deep*
pattern matching constructs.

###  Labeled and optional parameters

14. Jacques Garrigue. Labeled and optional arguments for Objective Caml. In
JSSST Workshop on Programming and Programming Languages, 2001.
[ [PDF](http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.pdf) |
[Gzipped
PostScript](http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.ps.gz)
| [Gzipped
DVI](http://caml.inria.fr/pub/papers/garrigue-labels-ppl01.dvi.gz) ]

    This paper offers a dynamic semantics, a static semantics, and a
compilation scheme for OCaml's labeled and optional function parameters.

## Compilers and runtime system
###  The bytecode compiler and bytecode interpreter

15. Xavier Leroy. The ZINC experiment, an economical implementation of the
ML language. Technical report 117, INRIA, 1990.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-zinc.ps.gz) |
[PDF](http://caml.inria.fr/pub/papers/xleroy-zinc.pdf) ]

    This report contains a description of the ZINC compiler, which later
evolved into Caml Light, then into OCaml. Large parts of this report are
out of date, but it is still valuable as a description of the abstract
machine used in Caml Light and (with some further simplifications and
speed improvements) in OCaml.

###  The native-code compiler

16. Xavier Leroy. The effectiveness of type-based unboxing. In Workshop on
Types in Compilation, 1997.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/xleroy-unboxing-tic97.ps.gz)
| [PDF](http://caml.inria.fr/pub/papers/xleroy-unboxing-tic97.pdf) ]

	This paper surveys and compares several data representation strategies,
including the one used in the OCaml native-code compiler.


###  The garbage collector

17. Damien Doligez and Xavier Leroy. A concurrent, generational garbage
collector for a multithreaded implementation of ML. In Principles of
Programming Languages, 1993.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/doligez_xleroy-concurrent_gc-popl93.ps.gz)
|
[PDF](http://caml.inria.fr/pub/papers/doligez_xleroy-concurrent_gc-popl93.pdf)
]

    Superseded by the next paper.

18. Damien Doligez and Georges Gonthier. Portable, Unobtrusive Garbage
Collection for Multiprocessor Systems. In Principles of Programming
Languages, 1994.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/doligez_gonthier-gc-popl94.ps.gz)
| [PDF](http://caml.inria.fr/pub/papers/doligez_gonthier-gc-popl94.pdf)
]

    This paper describes a concurrent version of the garbage collector found
in Caml Light and OCaml's runtime system.

19. Damien Doligez. Conception, réalisation et certification d'un glaneur de
cellules concurrent. Ph.D. thesis, Université Paris 7, 1995.
[ [Gzipped
PostScript](http://caml.inria.fr/pub/papers/doligez-these.ps.gz) |
[PDF](http://caml.inria.fr/pub/papers/doligez-these.pdf) ]

    All you ever wanted to know about the garbage collector found in Caml
Light and OCaml's runtime system.


