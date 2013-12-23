<!-- ((! set title What is OCaml? !)) ((! set learn !)) -->

# What is OCaml?
*Table of contents*

**OCaml** is a general purpose industrial-strength programming language
with an emphasis on expressiveness and safety. Developed for more than
20 years at [Inria](http://www.inria.fr/en) by a group of leading
researchers, it benefits from one of the most advanced type systems and
supports functional, imperative and object-oriented styles of
programming which ease the development of flexible and reliable
software. Used in environments where [a single mistake can cost
millions](companies.html) and speed matters, it is supported by an
active community that developed a [rich set of
libraries](libraries.html) and will help you to make the most of OCaml
possibilities...

OCaml is a modern, high-level programming language with many useful
features. See “[A History of OCaml](history.html)” for an account of the
origins of the language.

## Strengths
The OCaml language offers:

* **A powerful type system**, equipped with parametric polymorphism
 and type inference. For instance, the type of a collection can be
 parameterized by the type of its elements. This allows defining some
 operations over a collection independently of the type of its
 elements: sorting an array is one example. Furthermore, type
 inference allows defining such operations without having to
 explicitly provide the type of their parameters and result.
* **User-definable algebraic data types and pattern-matching**. New
 algebraic data types can be defined as combinations of records and
 sums. Functions that operate over such data structures can then be
 defined by pattern matching, a generalized form of the well-known
 switch statement, which offers a clean and elegant way of
 simultaneously examining and naming data.
* **Automatic memory management**, thanks to a fast, unobtrusive,
 incremental garbage collector.
* **Separate compilation of standalone applications**. Portable
 bytecode compilers allow creating stand-alone applications out of
 Caml Light or OCaml programs. A foreign function interface allows
 OCaml code to interoperate with C code when necessary. Interactive
 use of OCaml is also supported via a “read-evaluate-print” loop.

In addition, OCaml features:

* **A sophisticated module system**, which allows organizing modules
 hierarchically and parameterizing a module over a number of other
 modules.
* **An expressive object-oriented layer**, featuring multiple
 inheritance, parametric and virtual classes.
* **Efficient native code compilers**. In addition to its bytecode
 compiler, OCaml offers a compiler that produces efficient machine
 code for many architectures.

## A Widely Used Programming Language
The OCaml language was initially used to develop applications that
involve symbolic computation: automatic theorem provers, compilers and
interpreters, program analyzers, etc. It is now used to develop software
in many other application areas. This is illustrated by our list of
selected [success stories](success.html).

The OCaml language is widely used for teaching programming. It is also
used inside academic projects in Europe, Asia, and the Americas. Several
large corporations develop significant industrial projects in OCaml:
these include Dassault Systèmes, Microsoft, IBM, and CEA (Commissariat à
l'Énergie Atomique).

The [OCaml Consortium](/community/support.html#TheCamlConsortiumatInria)
offers industrial and
academic partners a formal framework for participating in the
development, maintenance, and evolution of OCaml. Partners also enjoy
very liberal licensing conditions regarding the OCaml software
distribution.

## Overview of the OCaml language and tools
###  Safety
OCaml is a safe language. Programs are verified by the compiler before
they can be executed. This rules out many programming errors, such as,
for instance, confusing an integer and a pointer, or accessing a
nonexistent field in a record. More precisely, this protects the
integrity of the data manipulated by an OCaml program.

Although OCaml is statically type-checked, it does not require that the
types of function parameters, local variables, etc. be explicitly
declared, contrary to, say, C or Java. Much of the necessary type
information is automatically inferred by the compiler.

###  Functions
OCaml is a functional programming language: there is no restriction on
the definition and use of functions. In other words, functions are
ordinary values: a function can be passed as an argument to a function
or returned by a function.

###  Imperative features
OCaml offers a full array of imperative features. In particular,
variables, arrays, and record components can be declared as modifiable.
Several varieties of loops are available.

###  Error recovery
OCaml features a general exception mechanism to signal and handle errors
and exceptional situations.

###  Data Types
OCaml offers numerous built-in data types, including:

* **basic types**: integers, floating point numbers, booleans,
 characters, strings.
* **more sophisticated data types**: tuples, arrays, lists, sets, hash
 tables, queues, stacks, data streams.

Beyond these powerful built-in types, OCaml offers powerful means of
defining new data types: records, enumerations, and sum types. Sum types
are a simple and powerful generalization of enumerations. They allow
bringing heterogeneous values together into a common type, thanks to the
use of tags known as data constructors.

The types defined within a module can be made visible to the module's
clients either concretely or abstractly, as the programmer desires. When
a type is exported in a concrete manner, its full definition remains
known: so, clients of the modules can build or examine values of this
type. On the other hand, when a type is exported in an abstract manner,
only its name is known outside the module. It then becomes impossible,
from the outside, to create or inspect values of this type.

This mechanism provides fine-grained control over data encapsulation,
which is mandatory for programming in the large.

###  Aptness to symbolic computation
OCaml features pattern matching, a generalization of the traditional
case analysis construct. Pattern matching offers a clean and elegant way
of simultaneously examining and naming data. The OCaml compiler takes
advantage of this feature to perform several checks: superfluous as well
as missing branches are detected and reported, which often allows
pinpointing subtle errors. When no error is signaled, one can trust that
no case has been overlooked.

Pattern matching brings unrivaled comfort and safety to programs that
manipulate symbolic data.

###  Polymorphism
OCaml features a polymorphic type system: some undetermined types can be
represented by variables, which may later be instantiated at will. Thus,
for instance, a single sorting function can be applied to lists of
integers, lists of integer pairs, or lists of records, without requiring
any code duplication.

###  Programming in the large
An OCaml program is made of compilation units that are dealt with
separately by the compiler. This scheme is fully compatible with the use
of traditional project management tools, such as the “make” utility. The
module system is powerful and safe: every interaction between modules is
statically typechecked. In OCaml, a module may contain submodules, which
allows organizing modules hierarchically, and it is possible to
parameterize a module over a number of other modules, or, in other
words, to define functions from modules to modules.

###  Object-oriented programming
OCaml allows writing programs in an object-oriented style. In keeping
with the language's philosophy, the object-oriented layer obeys the
“strong typing” paradigm: thus, it is impossible to send a message to
some object that cannot answer it. Such safety does not come at a cost
in expressiveness: thanks to features such as multiple inheritance and
parametric classes, the most complex design patterns can be expressed in
a natural manner.

###  Automatic memory management and incremental garbage collection
OCaml features automatic memory management: allocation and deallocation
of data structures is implicit, and dealt with by the compiler: there is
no “new”, “malloc”, “delete”, or “free” operator. This makes programs
much safer: memory corruption cannot occur.

Moreover, the memory manager is incremental: it runs in parallel with
the application, so that garbage collection does not cause noticeable
delays.

###  Evaluation regime
OCaml's evaluation strategy is strict. A lazy evaluation regime may be
simulated, when required, via explicit suspensions. Thus, it is
possible, for instance, to manipulate potentially infinite data streams.

###  Efficient compiler, efficient compiled code
OCaml offers two batch compilers: a bytecode compiler and a native code
compiler. Both support separate compilation. Caml Light only offers a
bytecode compiler.

The bytecode compilers generate small, portable executables.
Furthermore, these compilers are extremely fast.

The native code compiler produces more efficient machine code, whose
performance meets the highest standards of modern compilers.

###  Interactivity
OCaml provides an interactive “read-eval-print” loop, which is
convenient both for learning and for rapid testing and debugging of
programs. Indeed, there is no need to create a file, or to insert
display instructions into programs, since results are automatically
printed by the interactive system.

###  Debugging facilities
Several different methods are available to debug OCaml programs:

* the interactive system offers an elementary yet fast and simple
 method to test (small) functions: one types various inputs directly
 into the interactive system and checks that the results are as
 expected.
* for more complex cases, the interactive system provides a cheap
 means of following the computation, using the so-called function
 call tracing mechanism.
* last, the symbolic replay debugger is an extremely powerful tool to
 follow the computation. It allows stopping the program at any time
 to scrutinize the value of variables and the stack of calling
 functions, and even going back into the past to resume execution at
 a particular point of interest.

###  Parsing
OCaml offers parser generation tools analogous to “lex” and “yacc”.
Furthermore, it offers a built-in type of data streams which eases the
definition of LL(1) recursive descent parsers.

###  Portability
OCaml runs on a wide variety of platforms. Officially supported
platforms are described [here](portability.html), and other platforms
are supported by the community. For example, OCaml apps are available in
the Apple app store; compiling to iOS is described
[here](http://psellos.com/ocaml/compile-to-iphone.html). It is also
possible to compile to javascript with
[js_of_ocaml](http://ocsigen.org/js_of_ocaml/), enabling the creation
of rich client-side applications directly with OCaml. A striking example
of this is [Try OCaml](http://try.ocamlpro.com/), the result of
compiling the OCaml compiler itself with js_of_ocaml. Finally,
[ocamljava](http://cafesterol.x9c.fr/) enables direct compilation of
OCaml to Java bytecode, as well as providing other mechanisms for
interoperating with Java.


