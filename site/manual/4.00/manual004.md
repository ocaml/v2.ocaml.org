<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="tutos_menu"><li><a href="manual003.html">The core language</a></li><li class="active"><a href="manual004.html">The module system</a></li><li><a href="manual005.html">Objects in OCaml</a></li><li><a href="manual006.html">Labels and variants</a></li><li><a href="manual007.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="tutorial"><a name="htoc12"><span>Tutorial 2</span></a>&nbsp;&nbsp;The module system</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><ul><div class="toc_title"><a href="/docs" id="version-select">Version 4.00</a></div><li class="top"><a href="#">Top</a></li>
<li><a href="#toc13">Structures</a>
</li><li><a href="#toc14">Signatures</a>
</li><li><a href="#toc15">Functors</a>
</li><li><a href="#toc16">Functors and type abstraction</a>
</li><li><a href="#toc17">Modules and separate compilation</a>
</li></ul></nav></header>
<p> <a name="c:moduleexamples"></a>
</p><p>This tutorial introduces the module system of OCaml.</p><h2 class="section"><a name="toc13"></a><a name="htoc13">1</a>&nbsp;&nbsp;Structures</h2><p>A primary motivation for modules is to package together related
definitions (such as the definitions of a data type and associated
operations over that type) and enforce a consistent naming scheme for
these definitions. This avoids running out of names or accidentally
confusing names. Such a package is called a <em>structure</em> and
is introduced by the <tt>struct</tt>…<tt>end</tt> construct, which contains an
arbitrary sequence of definitions. The structure is usually given a
name with the <tt>module</tt> binding. Here is for instance a structure
packaging together a type of priority queues and their operations:
</p><pre><font color="black">#</font><font color="#006000"> module PrioQueue =
    struct
      type priority = int
      type 'a queue = Empty | Node of priority * 'a * 'a queue * 'a queue
      let empty = Empty
      let rec insert queue prio elt =
        match queue with
          Empty -&gt; Node(prio, elt, Empty, Empty)
        | Node(p, e, left, right) -&gt;
            if prio &lt;= p
            then Node(prio, elt, insert right p e, left)
            else Node(p, e, insert right prio elt, left)
      exception Queue_is_empty
      let rec remove_top = function
          Empty -&gt; raise Queue_is_empty
        | Node(prio, elt, left, Empty) -&gt; left
        | Node(prio, elt, Empty, right) -&gt; right
        | Node(prio, elt, (Node(lprio, lelt, _, _) as left),
                          (Node(rprio, relt, _, _) as right)) -&gt;
            if lprio &lt;= rprio
            then Node(lprio, lelt, remove_top left, right)
            else Node(rprio, relt, left, remove_top right)
      let extract = function
          Empty -&gt; raise Queue_is_empty
        | Node(prio, elt, _, _) as queue -&gt; (prio, elt, remove_top queue)
    end;;
</font><font color="maroon">module PrioQueue :
  sig
    type priority = int
    type 'a queue = Empty | Node of priority * 'a * 'a queue * 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; priority -&gt; 'a -&gt; 'a queue
    exception Queue_is_empty
    val remove_top : 'a queue -&gt; 'a queue
    val extract : 'a queue -&gt; priority * 'a * 'a queue
  end
</font></pre><p>
Outside the structure, its components can be referred to using the
“dot notation”, that is, identifiers qualified by a structure name.
For instance, <tt>PrioQueue.insert</tt> is the function <tt>insert</tt> defined
inside the structure <tt>PrioQueue</tt> and <tt>PrioQueue.queue</tt> is the type
<tt>queue</tt> defined in <tt>PrioQueue</tt>.
</p><pre><font color="black">#</font><font color="#006000"> PrioQueue.insert PrioQueue.empty 1 "hello";;
</font><font color="maroon">- : string PrioQueue.queue =
PrioQueue.Node (1, "hello", PrioQueue.Empty, PrioQueue.Empty)
</font></pre><h2 class="section"><a name="toc14"></a><a name="htoc14">2</a>&nbsp;&nbsp;Signatures</h2><p>Signatures are interfaces for structures. A signature specifies
which components of a structure are accessible from the outside, and
with which type. It can be used to hide some components of a structure
(e.g. local function definitions) or export some components with a
restricted type. For instance, the signature below specifies the three
priority queue operations <tt>empty</tt>, <tt>insert</tt> and <tt>extract</tt>, but not the
auxiliary function <tt>remove_top</tt>. Similarly, it makes the <tt>queue</tt> type
abstract (by not providing its actual representation as a concrete type).
</p><pre><font color="black">#</font><font color="#006000"> module type PRIOQUEUE =
    sig
      type priority = int         (* still concrete *)
      type 'a queue               (* now abstract *)
      val empty : 'a queue
      val insert : 'a queue -&gt; int -&gt; 'a -&gt; 'a queue
      val extract : 'a queue -&gt; int * 'a * 'a queue
      exception Queue_is_empty
    end;;
</font><font color="maroon">module type PRIOQUEUE =
  sig
    type priority = int
    type 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; int -&gt; 'a -&gt; 'a queue
    val extract : 'a queue -&gt; int * 'a * 'a queue
    exception Queue_is_empty
  end
</font></pre><p>
Restricting the <tt>PrioQueue</tt> structure by this signature results in
another view of the <tt>PrioQueue</tt> structure where the <tt>remove_top</tt>
function is not accessible and the actual representation of priority
queues is hidden:
</p><pre><font color="black">#</font><font color="#006000"> module AbstractPrioQueue = (PrioQueue : PRIOQUEUE);;
<font color="maroon">module AbstractPrioQueue : PRIOQUEUE

</font><font color="black">#</font> <u>AbstractPrioQueue.remove_top</u>;;
<font color="maroon">Error: Unbound value AbstractPrioQueue.remove_top

</font><font color="black">#</font> AbstractPrioQueue.insert AbstractPrioQueue.empty 1 "hello";;
</font><font color="maroon">- : string AbstractPrioQueue.queue = &lt;abstr&gt;
</font></pre><p>
The restriction can also be performed during the definition of the
structure, as in
</p><pre>module PrioQueue = (struct ... end : PRIOQUEUE);;
</pre><p>An alternate syntax is provided for the above:
</p><pre>module PrioQueue : PRIOQUEUE = struct ... end;;
</pre><h2 class="section"><a name="toc15"></a><a name="htoc15">3</a>&nbsp;&nbsp;Functors</h2><p>Functors are “functions” from structures to structures. They are used to
express parameterized structures: a structure <i>A</i> parameterized by a
structure <i>B</i> is simply a functor <i>F</i> with a formal parameter
<i>B</i> (along with the expected signature for <i>B</i>) which returns
the actual structure <i>A</i> itself. The functor <i>F</i> can then be
applied to one or several implementations <i>B</i><sub>1</sub> …<i>B<sub>n</sub></i>
of <i>B</i>, yielding the corresponding structures
<i>A</i><sub>1</sub> …<i>A<sub>n</sub></i>.</p><p>For instance, here is a structure implementing sets as sorted lists,
parameterized by a structure providing the type of the set elements
and an ordering function over this type (used to keep the sets
sorted):
</p><pre><font color="black">#</font><font color="#006000"> type comparison = Less | Equal | Greater;;
<font color="maroon">type comparison = Less | Equal | Greater

</font><font color="black">#</font> module type ORDERED_TYPE =
    sig
      type t
      val compare: t -&gt; t -&gt; comparison
    end;;
<font color="maroon">module type ORDERED_TYPE = sig type t val compare : t -&gt; t -&gt; comparison end

</font><font color="black">#</font> module Set =
    functor (Elt: ORDERED_TYPE) -&gt;
      struct
        type element = Elt.t
        type set = element list
        let empty = []
        let rec add x s =
          match s with
            [] -&gt; [x]
          | hd::tl -&gt;
             match Elt.compare x hd with
               Equal   -&gt; s         (* x is already in s *)
             | Less    -&gt; x :: s    (* x is smaller than all elements of s *)
             | Greater -&gt; hd :: add x tl
        let rec member x s =
          match s with
            [] -&gt; false
          | hd::tl -&gt;
              match Elt.compare x hd with
                Equal   -&gt; true     (* x belongs to s *)
              | Less    -&gt; false    (* x is smaller than all elements of s *)
              | Greater -&gt; member x tl
      end;;
</font><font color="maroon">module Set :
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set = element list
      val empty : 'a list
      val add : Elt.t -&gt; Elt.t list -&gt; Elt.t list
      val member : Elt.t -&gt; Elt.t list -&gt; bool
    end
</font></pre><p>
By applying the <tt>Set</tt> functor to a structure implementing an ordered
type, we obtain set operations for this type:
</p><pre><font color="black">#</font><font color="#006000"> module OrderedString =
    struct
      type t = string
      let compare x y = if x = y then Equal else if x &lt; y then Less else Greater
    end;;
<font color="maroon">module OrderedString :
  sig type t = string val compare : 'a -&gt; 'a -&gt; comparison end

</font><font color="black">#</font> module StringSet = Set(OrderedString);;
<font color="maroon">module StringSet :
  sig
    type element = OrderedString.t
    type set = element list
    val empty : 'a list
    val add : OrderedString.t -&gt; OrderedString.t list -&gt; OrderedString.t list
    val member : OrderedString.t -&gt; OrderedString.t list -&gt; bool
  end

</font><font color="black">#</font> StringSet.member "bar" (StringSet.add "foo" StringSet.empty);;
</font><font color="maroon">- : bool = false
</font></pre><h2 class="section"><a name="toc16"></a><a name="htoc16">4</a>&nbsp;&nbsp;Functors and type abstraction</h2><p>As in the <tt>PrioQueue</tt> example, it would be good style to hide the
actual implementation of the type <tt>set</tt>, so that users of the
structure will not rely on sets being lists, and we can switch later
to another, more efficient representation of sets without breaking
their code. This can be achieved by restricting <tt>Set</tt> by a suitable
functor signature:
</p><pre><font color="black">#</font><font color="#006000"> module type SETFUNCTOR =
    functor (Elt: ORDERED_TYPE) -&gt;
      sig
        type element = Elt.t      (* concrete *)
        type set                  (* abstract *)
        val empty : set
        val add : element -&gt; set -&gt; set
        val member : element -&gt; set -&gt; bool
      end;;
<font color="maroon">module type SETFUNCTOR =
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set
      val empty : set
      val add : element -&gt; set -&gt; set
      val member : element -&gt; set -&gt; bool
    end

</font><font color="black">#</font> module AbstractSet = (Set : SETFUNCTOR);;
<font color="maroon">module AbstractSet : SETFUNCTOR

</font><font color="black">#</font> module AbstractStringSet = AbstractSet(OrderedString);;
<font color="maroon">module AbstractStringSet :
  sig
    type element = OrderedString.t
    type set = AbstractSet(OrderedString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end

</font><font color="black">#</font> AbstractStringSet.add "gee" AbstractStringSet.empty;;
</font><font color="maroon">- : AbstractStringSet.set = &lt;abstr&gt;
</font></pre><p>In an attempt to write the type constraint above more elegantly,
one may wish to name the signature of the structure
returned by the functor, then use that signature in the constraint:
</p><pre><font color="black">#</font><font color="#006000"> module type SET =
    sig
      type element
      type set
      val empty : set
      val add : element -&gt; set -&gt; set
      val member : element -&gt; set -&gt; bool
    end;;
<font color="maroon">module type SET =
  sig
    type element
    type set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end

</font><font color="black">#</font> module WrongSet = (Set : functor(Elt: ORDERED_TYPE) -&gt; SET);;
<font color="maroon">module WrongSet : functor (Elt : ORDERED_TYPE) -&gt; SET

</font><font color="black">#</font> module WrongStringSet = WrongSet(OrderedString);;
<font color="maroon">module WrongStringSet :
  sig
    type element = WrongSet(OrderedString).element
    type set = WrongSet(OrderedString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end

</font><font color="black">#</font> WrongStringSet.add <u>"gee"</u> WrongStringSet.empty;;
</font><font color="maroon">Error: This expression has type string but an expression was expected of type
         WrongStringSet.element = WrongSet(OrderedString).element
</font></pre><p>
The problem here is that <tt>SET</tt> specifies the type <tt>element</tt>
abstractly, so that the type equality between <tt>element</tt> in the result
of the functor and <tt>t</tt> in its argument is forgotten. Consequently,
<tt>WrongStringSet.element</tt> is not the same type as <tt>string</tt>, and the
operations of <tt>WrongStringSet</tt> cannot be applied to strings.
As demonstrated above, it is important that the type <tt>element</tt> in the
signature <tt>SET</tt> be declared equal to <tt>Elt.t</tt>; unfortunately, this is
impossible above since <tt>SET</tt> is defined in a context where <tt>Elt</tt> does
not exist. To overcome this difficulty, OCaml provides a
<tt>with type</tt> construct over signatures that allows enriching a signature
with extra type equalities:
</p><pre><font color="black">#</font><font color="#006000"> module AbstractSet2 =
    (Set : functor(Elt: ORDERED_TYPE) -&gt; (SET with type element = Elt.t));;
</font><font color="maroon">module AbstractSet2 :
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set
      val empty : set
      val add : element -&gt; set -&gt; set
      val member : element -&gt; set -&gt; bool
    end
</font></pre><p>As in the case of simple structures, an alternate syntax is provided
for defining functors and restricting their result:
</p><pre>module AbstractSet2(Elt: ORDERED_TYPE) : (SET with type element = Elt.t) =
  struct ... end;;
</pre><p>
Abstracting a type component in a functor result is a powerful
technique that provides a high degree of type safety, as we now
illustrate. Consider an ordering over character strings that is
different from the standard ordering implemented in the
<tt>OrderedString</tt> structure. For instance, we compare strings without
distinguishing upper and lower case.
</p><pre><font color="black">#</font><font color="#006000"> module NoCaseString =
    struct
      type t = string
      let compare s1 s2 =
        OrderedString.compare (String.lowercase s1) (String.lowercase s2)
    end;;
<font color="maroon">module NoCaseString :
  sig type t = string val compare : string -&gt; string -&gt; comparison end

</font><font color="black">#</font> module NoCaseStringSet = AbstractSet(NoCaseString);;
<font color="maroon">module NoCaseStringSet :
  sig
    type element = NoCaseString.t
    type set = AbstractSet(NoCaseString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end

</font><font color="black">#</font> NoCaseStringSet.add "FOO" <u>AbstractStringSet.empty</u>;;
</font><font color="maroon">Error: This expression has type
         AbstractStringSet.set = AbstractSet(OrderedString).set
       but an expression was expected of type
         NoCaseStringSet.set = AbstractSet(NoCaseString).set
</font></pre><p>
Note that the two types <tt>AbstractStringSet.set</tt> and
<tt>NoCaseStringSet.set</tt> are not compatible, and values of these
two types do not match. This is the correct behavior: even though both
set types contain elements of the same type (strings), they are built
upon different orderings of that type, and different invariants need
to be maintained by the operations (being strictly increasing for the
standard ordering and for the case-insensitive ordering). Applying
operations from <tt>AbstractStringSet</tt> to values of type
<tt>NoCaseStringSet.set</tt> could give incorrect results, or build
lists that violate the invariants of <tt>NoCaseStringSet</tt>.</p><h2 class="section"><a name="toc17"></a><a name="htoc17">5</a>&nbsp;&nbsp;Modules and separate compilation</h2><p>All examples of modules so far have been given in the context of the
interactive system. However, modules are most useful for large,
batch-compiled programs. For these programs, it is a practical
necessity to split the source into several files, called compilation
units, that can be compiled separately, thus minimizing recompilation
after changes.</p><p>In OCaml, compilation units are special cases of structures
and signatures, and the relationship between the units can be
explained easily in terms of the module system. A compilation unit <i>A</i>
comprises two files:
</p><ul class="itemize"><li class="li-itemize">
the implementation file <i>A</i><tt>.ml</tt>, which contains a sequence
of definitions, analogous to the inside of a <tt>struct</tt>…<tt>end</tt>
construct;
</li><li class="li-itemize">the interface file <i>A</i><tt>.mli</tt>, which contains a sequence of
specifications, analogous to the inside of a <tt>sig</tt>…<tt>end</tt>
construct.
</li></ul><p>
These two files together define a structure named <i>A</i> as if
the following definition was entered at top-level:
</p><pre>module <i>A</i>: sig (* contents of file <i>A</i>.mli *) end
        = struct (* contents of file <i>A</i>.ml *) end;;
</pre><p>
The files that define the compilation units can be compiled separately
using the <tt>ocamlc -c</tt> command (the <tt>-c</tt> option means “compile only, do
not try to link”); this produces compiled interface files (with
extension <tt>.cmi</tt>) and compiled object code files (with extension
<tt>.cmo</tt>). When all units have been compiled, their <tt>.cmo</tt> files are
linked together using the <tt>ocamlc</tt> command. For instance, the following
commands compile and link a program composed of two compilation units
<tt>Aux</tt> and <tt>Main</tt>:
</p><pre>$ ocamlc -c Aux.mli                     # produces aux.cmi
$ ocamlc -c Aux.ml                      # produces aux.cmo
$ ocamlc -c Main.mli                    # produces main.cmi
$ ocamlc -c Main.ml                     # produces main.cmo
$ ocamlc -o theprogram Aux.cmo Main.cmo
</pre><p>The program behaves exactly as if the following phrases were entered
at top-level:
</p><pre>module Aux: sig (* contents of Aux.mli *) end
          = struct (* contents of Aux.ml *) end;;
module Main: sig (* contents of Main.mli *) end
           = struct (* contents of Main.ml *) end;;
</pre><p>
In particular, <tt>Main</tt> can refer to <tt>Aux</tt>: the definitions and
declarations contained in <tt>Main.ml</tt> and <tt>Main.mli</tt> can refer to
definition in <tt>Aux.ml</tt>, using the <tt>Aux.</tt><i>ident</i> notation, provided
these definitions are exported in <tt>Aux.mli</tt>.</p><p>The order in which the <tt>.cmo</tt> files are given to <tt>ocamlc</tt> during the
linking phase determines the order in which the module definitions
occur. Hence, in the example above, <tt>Aux</tt> appears first and <tt>Main</tt> can
refer to it, but <tt>Aux</tt> cannot refer to <tt>Main</tt>.</p><p>Note that only top-level structures can be mapped to
separately-compiled files, but neither functors nor module types.
However, all module-class objects can appear as components of a
structure, so the solution is to put the functor or module type
inside a structure, which can then be mapped to a file.

</p><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>