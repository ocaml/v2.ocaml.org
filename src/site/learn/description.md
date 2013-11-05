<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head><title>Description</title></head>
  <body>
    <h1>What is OCaml?</h1>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <div class="span5">
	<em>Table of contents</em>
	<div ml:replace="toc"></div>
      </div>
    </div>

    <p>
      <strong>OCaml</strong> is a general purpose industrial-strength
      programming language with an emphasis on expressiveness and
      safety. Developed for more than 20 years
      at <a href="http://www.inria.fr/en" >Inria</a> by a
      group of leading researchers, it benefits from one of the most
      advanced type systems and supports functional, imperative and
      object-oriented styles of programming which ease the development
      of flexible and reliable software.  Used in environments
      where <a href="companies.html" >a single mistake can cost
      millions</a> and speed matters, it is supported by an active
      community that developed a <a href="libraries.html" >rich set of
      libraries</a> and will help you to make the most of OCaml
      possibilities...
    </p>


    OCaml is a modern, high-level programming language with many
    useful features. See
    “<a href="history.html">A History of
    OCaml</a>” for an account of the origins of the language.

    <h2><a name="strengths"></a>Strengths</h2>
    <p>The OCaml language offers:</p>
    <ul>
      <li>
        <b>A powerful type system</b>, equipped with parametric polymorphism
        and type inference. For instance, the type of a collection can
        be parameterized by the type of its elements. This allows
        defining some operations over a collection independently of the
        type of its elements: sorting an array is one
        example. Furthermore, type inference allows defining such
        operations without having to explicitly provide the type of
        their parameters and result.
      </li>
      <li>
        <b>User-definable algebraic data types and pattern-matching</b>.
        New algebraic data types can be defined as
        combinations of records and sums. Functions that operate over such
        data structures can then be defined by pattern matching, a
        generalized form of the well-known switch statement, which offers a
        clean and elegant way of simultaneously examining and naming data.
      </li>
      <li>
        <b>Automatic memory management</b>, thanks to a fast,
        unobtrusive, incremental garbage collector.
      </li>
      <li>
        <b>Separate compilation of standalone applications</b>.
        Portable bytecode compilers allow creating stand-alone applications
        out of Caml Light or OCaml programs. A foreign function interface
        allows OCaml code to interoperate with C code when
        necessary. Interactive use of OCaml is also supported via a
        “read-evaluate-print” loop.
      </li>
    </ul>

    <p>In addition, OCaml features:</p>
    <ul>
      <li>
        <b>A sophisticated module system</b>, which allows organizing
        modules hierarchically and parameterizing a module over a
        number of other modules.
      </li>
      <li>
        <b>An expressive object-oriented layer</b>, featuring multiple
        inheritance, parametric and virtual classes.
      </li>
      <li>
        <b>Efficient native code compilers</b>. In addition to its
        bytecode compiler, OCaml offers a compiler that produces
        efficient machine code for many architectures.
      </li>
    </ul>

    <h2><a name="widely-used"></a>A Widely Used Programming Language</h2>
    <p>
      The OCaml language was initially used to develop applications
      that involve symbolic computation: automatic theorem provers,
      compilers and interpreters, program analyzers, etc. It is now
      used to develop software in many other application areas. This
      is illustrated by our list of selected <a href="success.html">success stories</a>.
    </p>
    <p>
      The OCaml language is widely used for teaching programming. It is also
      used inside academic projects in Europe, Asia, and the
      Americas. Several large corporations develop significant industrial
      projects in OCaml: these include Dassault Systèmes, Microsoft, IBM,
      and CEA (Commissariat à l'Énergie Atomique).
    </p>
    <p>
      The <a href="support.html#consortium">OCaml Consortium</a> offers industrial and academic partners a formal
      framework for participating in the development, maintenance, and
      evolution of OCaml. Partners also enjoy very liberal licensing
      conditions regarding the OCaml software distribution.
    </p>

    <h2><a name="overview"></a>Overview of the OCaml language and tools</h2>

    <h3><a name="safety"></a>Safety</h3>
    <p>
      OCaml is a safe language. Programs are verified by the compiler
      before they can be executed. This rules out many programming
      errors, such as, for instance, confusing an integer and a
      pointer, or accessing a nonexistent field in a record. More
      precisely, this protects the integrity of the data manipulated
      by an OCaml program.
    </p>
    <p>
      Although OCaml is statically type-checked, it does not require that the
      types of function parameters, local variables, etc. be explicitly
      declared, contrary to, say, C or Java. Much of the necessary type
      information is automatically inferred by the compiler.
    </p>

    <h3><a name="functions"></a>Functions</h3>
    <p>
      OCaml is a functional programming language: there is no restriction on
      the definition and use of functions. In other words, functions are
      ordinary values: a function can be passed as an argument to a function
      or returned by a function.
    </p>

    <h3><a name="imperative"></a>Imperative features</h3>
    <p>
      OCaml offers a full array of imperative features. In particular,
      variables, arrays, and record components can be declared as
      modifiable. Several varieties of loops are available.
    </p>

    <h3><a name="error"></a>Error recovery</h3>
    <p>
      OCaml features a general exception mechanism to signal and
      handle errors and exceptional situations.
    </p>

    <h3><a name="types"></a>Data Types</h3>
    <p>OCaml offers numerous built-in data types, including:</p>
    <ul>
      <li>
        <b>basic types</b>: integers, floating point numbers,
        booleans, characters, strings.
      </li>
      <li>
        <b>more sophisticated data types</b>: tuples, arrays, lists,
        sets, hash tables, queues, stacks, data streams.
      </li>
    </ul>
    <p>
      Beyond these powerful built-in types, OCaml offers powerful means of
      defining new data types: records, enumerations, and sum types. Sum
      types are a simple and powerful generalization of enumerations. They
      allow bringing heterogeneous values together into a common type,
      thanks to the use of tags known as data constructors.
    </p>
    <p>
      The types defined within a module can be made visible to the module's
      clients either concretely or abstractly, as the programmer
      desires. When a type is exported in a concrete manner, its full
      definition remains known: so, clients of the modules can build or
      examine values of this type. On the other hand, when a type is
      exported in an abstract manner, only its name is known outside the
      module. It then becomes impossible, from the outside, to create or
      inspect values of this type.
      </p>
    <p>
      This mechanism provides fine-grained control over data encapsulation,
      which is mandatory for programming in the large.
    </p>

    <h3><a name="symbolic"></a>Aptness to symbolic computation</h3>
    <p>
      OCaml features pattern matching, a generalization of the
      traditional case analysis construct. Pattern matching offers a
      clean and elegant way of simultaneously examining and naming
      data. The OCaml compiler takes advantage of this feature to
      perform several checks: superfluous as well as missing branches
      are detected and reported, which often allows pinpointing subtle
      errors. When no error is signaled, one can trust that no case
      has been overlooked.
    </p>
    <p>
      Pattern matching brings unrivaled comfort and safety to programs that
      manipulate symbolic data.
    </p>

    <h3><a name="polymorphism"></a>Polymorphism</h3>
    <p>
      OCaml features a polymorphic type system: some undetermined
      types can be represented by variables, which may later be
      instantiated at will. Thus, for instance, a single sorting
      function can be applied to lists of integers, lists of integer
      pairs, or lists of records, without requiring any code
      duplication.
    </p>

    <h3><a name="large"></a>Programming in the large</h3>
    <p>
      An OCaml program is made of compilation units that are dealt with
      separately by the compiler. This scheme is fully compatible with the
      use of traditional project management tools, such as the “make”
      utility. The module system is powerful and safe: every interaction
      between modules is statically typechecked. In OCaml, a module may
      contain submodules, which allows organizing modules hierarchically,
      and it is possible to parameterize a module over a number of other
      modules, or, in other words, to define functions from modules to
      modules.
    </p>

    <h3><a name="oo"></a>Object-oriented programming</h3>
    <p>
      OCaml allows writing programs in an object-oriented style. In keeping
      with the language's philosophy, the object-oriented layer obeys the
      “strong typing” paradigm: thus, it is impossible to send a message to
      some object that cannot answer it. Such safety does not come at a cost
      in expressiveness: thanks to features such as multiple inheritance and
      parametric classes, the most complex design patterns can be expressed
      in a natural manner.
    </p>

    <h3><a name="gc"></a>Automatic memory management and incremental
      garbage collection</h3>
    <p>
      OCaml features automatic memory management: allocation and
      deallocation of data structures is implicit, and dealt with by the
      compiler: there is no “new”, “malloc”, “delete”, or “free”
      operator. This makes programs much safer: memory corruption cannot
      occur.
    </p>
    <p>
      Moreover, the memory manager is incremental: it runs in parallel with
      the application, so that garbage collection does not cause noticeable
      delays.
    </p>

    <h3><a name="strict"></a>Evaluation regime</h3>
    <p>
      OCaml's evaluation strategy is strict. A lazy evaluation regime may be
      simulated, when required, via explicit suspensions. Thus, it is
      possible, for instance, to manipulate potentially infinite data
      streams.
    </p>

    <h3><a name="efficient"></a>Efficient compiler, efficient
      compiled code</h3>
    <p>
      OCaml offers two batch compilers: a bytecode compiler and a native
      code compiler. Both support separate compilation. Caml Light only
      offers a bytecode compiler.
    </p>
    <p>
      The bytecode compilers generate small, portable
      executables. Furthermore, these compilers are extremely fast.
    </p>
    <p>
      The native code compiler produces more efficient machine code, whose
      performance meets the highest standards of modern compilers.
    </p>

    <h3><a name="interactive"></a>Interactivity</h3>
    <p>
      OCaml provides an interactive “read-eval-print” loop, which is
      convenient both for learning and for rapid testing and debugging of
      programs. Indeed, there is no need to create a file, or to insert
      display instructions into programs, since results are automatically
      printed by the interactive system.
    </p>

    <h3><a name="debugging"></a>Debugging facilities</h3>
    <p>Several different methods are available to debug OCaml programs:</p>
    <ul>
      <li>
        the interactive system offers an elementary yet fast and simple method
        to test (small) functions: one types various inputs directly into the
        interactive system and checks that the results are as expected.
      </li>
      <li>
        for more complex cases, the interactive system provides a cheap means
        of following the computation, using the so-called function call
        tracing mechanism.
      </li>
      <li>
        last, the symbolic replay debugger is an extremely powerful tool to
        follow the computation. It allows stopping the program at any time to
        scrutinize the value of variables and the stack of calling functions,
        and even going back into the past to resume execution at a particular
        point of interest.
      </li>
    </ul>

    <h3><a name="parsing"></a>Parsing</h3>
    <p>
      OCaml offers parser generation tools analogous to “lex” and “yacc”.
      Furthermore, it offers a built-in type of data streams which eases
      the definition of LL(1) recursive descent parsers.
    </p>

    <h3><a name="portability"></a>Portability</h3>
    <p>OCaml runs on a wide variety of platforms. Officially supported
    platforms are described <a href="portability.html">here</a>, and
    other platforms are supported by the community. For example, OCaml
    apps are available in the Apple app store; compiling to iOS is
    described <a
    href="http://psellos.com/ocaml/compile-to-iphone.html">here</a>. It
    is also possible to compile to javascript with <a
    href="http://ocsigen.org/js_of_ocaml/">js_of_ocaml</a>, enabling
    the creation of rich client-side applications directly with
    OCaml. A striking example of this is <a
    href="http://try.ocamlpro.com/">Try OCaml</a>, the result of
    compiling the OCaml compiler itself with js_of_ocaml. Finally, <a
    href="http://cafesterol.x9c.fr/">ocamljava</a> enables direct
    compilation of OCaml to Java bytecode, as well as providing other
    mechanisms for interoperating with Java.</p>
  </body>
</html>
