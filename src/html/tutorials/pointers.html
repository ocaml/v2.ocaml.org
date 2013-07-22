<html>
  <head>
    <title>Pointers in OCaml</title>
  </head>
  <body>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc 2 2"></div>
    </div>

<h1>Pointers in OCaml</h1>

<h2><a name="status"></a>Status of pointers in OCaml</h2>

<p>
  Pointers exist in OCaml, and in fact they spread all over the
  place. They are used either implicitely (in the most cases), or
  explicitely (in the rare occasions where implicit pointers are not
  more handy). The vast majority of pointers usages that are found in
  usual programming languages simply disapear in OCaml, or more
  exactly, those pointers are totally automatically handled by the
  compiler and the OCaml programmer can safely just ignore their
  existence, focusing on the semantic of its program.  <br /> For
  instance lists or trees are defined without explicit pointers using
  a concrete datatype definition. The underlying implementation uses
  pointers, but this is transparent to the programmer since pointer
  handling is done by the compiler.
</p>
<p>
  In the rare occasions where explicit pointers are needed (the most
  common case is when translating in OCaml an algorithm described in a
  classic imperative language), OCaml provides references that are
  full-fledged pointers, even first class citizen pointers (references
  can be passed as argument, embedded into arbitrary data structures,
  and returned as function results).
</p>

<h3><a name="explicit"></a>Explicit pointers are OCaml values of
  type <code>ref</code></h3>

<p>
  You can program directly with explicit references if you want to,
  but this is normally a waste of time and effort.
</p>
<p>
  Let's examine the simple example of linked lists (integer lists to
  be simple). This data type is defined in C (or in Pascal) using
  explicit pointers, for instance:
</p>
<pre class="listing">
/* Cells and lists type in C */
struct cell {
  int hd;
  struct cell *tl;
};

typedef struct cell cell, *list;
</pre>
<pre class="listing">
{Cells and lists type in Pascal}
type
 list = ^cell;
 cell = record
  hd: integer;
  tl: cell;
 end;
</pre>

<p>
  We can translate this in OCaml, using a sum type definition, without
  pointers:
</p>

<pre ml:content="ocaml noeval">
  type list = Nil | Cons of int * list
</pre>

<p> Cell lists are thus represented as pairs, and the recursive
  structure of lists is evident, with the two alternatives, empty list
  (the <code>Nil</code>constructor) and non empty list (the
  <code>Cons</code> constructor).<br /> Automatic management of
  pointers and automatic memory allocation shine when allocating list
  values: one just writes <code>Cons (x, l)</code> to
  add <code>x</code> in front of the list
  <code>l</code>. In C, you need to write this function, to
  allocate a new cell and then fill its fields. For instance:
</p>

<pre class="listing">
/* The empty list */
#define nil NULL

/* The constructor of lists */
list cons (element x, list l)
{
  list result;
  result = (list) malloc (sizeof (cellule));
  result -&gt; hd = x;
  result -&gt; tl = l;
  return (result);
}
</pre>
<p>Similarly, in Pascal:</p>
<pre class="listing">
{Creating a list cell}
function cons (x: integer; l: list): list;
 var p: list;
 begin
  new(p);
  p^.hd := x;
  p^.tl := l;
  cons := p
 end;
</pre>
<p>
  We thus see that fields of list cells in the C program have to be
  mutable, otherwise initialization is impossible. By contrast in
  OCaml, allocation and initialization are merged into a single basic
  operation: constructor application. This way, immutable data
  structures are definable (those data types are often refered to as
  “pure” or “functionnal” data structures). If physical
  modifications are necessary for other reasons than mere
  initialization, OCaml provides records with mutable fields. For
  instance, a list type defining lists whose elements can be in place
  modified could be written:
</p>

<pre ml:content="ocaml noeval">
type list = Nil | Cons of cell
and cell = { mutable hd : int; tl : list }
</pre>

<p>If the structure of the list itself must also be modified (cells
  must be physically removed from the list), the
  <code>tl</code> field would also be declared as mutable:
</p>

<pre ml:content="ocaml noeval">
type list = Nil | Cons of cell
and cell = {mutable hd : int; mutable tl : list};;
</pre>

<p>
  Physical assignments are still useless to allocate mutable data: you
  write <code>Cons {hd = 1; tl = l}</code> to add
  <code>1</code> to the list <code>l</code>. Physical assigments
  that remain in OCaml programs should be just those assignments
  that are mandatory to implement the algorithm at hand.
</p>

<h3><a name="mutable"></a>Pointers and mutable fields or vectors</h3>

<p>
  Very often, pointers are used to implement physical modification of
  data structures. In OCaml programs this means using vectors or
  mutable fields in records. For this kind of use of pointers, the
  Pascal's instruction:
  <code>x^.label := <b>val</b></code> (where
  <code>x</code> is a value of a record having a <code>label</code>
  field) corresponds to the OCaml construct
  <code>x.label &lt;- <b>val</b></code> (where <code>x</code> is a
  value of a record having a <code>label</code> mutable field). The
  Pascal's <code>^</code> symbol simply disapears, since dereferencing
  is automatically handled by the OCaml compiler.
</p>

<p>
  <strong>In conclusion:</strong>
  You can use explicit pointers in OCaml, exactly as in Pascal or C,
  but this is not natural, since you get back the usual drawbacks
  and difficulties of explicit pointers manipulation of classical
  algorithmic languages. See a more complete example below.
</p>


<h2><a name="def"></a>Defining pointers in OCaml</h2>

<p>
  The general pointer type can be defined using the definition of a
  pointer: a pointer is either null, or a pointer to an assignable
  memory location:
</p>
<pre ml:content="ocaml">
type 'a pointer = Null | Pointer of 'a ref
</pre>

<p>
  Explicit dereferencing (or reading the pointer's designated value)
  and pointer assignment (or writing to the pointer's designated
  memory location) are easily defined. We define dereferencing as a
  prefix operator named <code>!^</code>, and assigment as the
  infix <code>^:=</code>.
</p>
<pre ml:content="ocaml">
  let ( !^ ) = function
    | Null -> invalid_arg "Attempt <b>to</b> dereference the null pointer"
    | Pointer r -> !r;;
  
  let ( ^:= ) p v =
    match p with
    | Null -> invalid_arg "Attempt <b>to</b> assign the null pointer"
    | Pointer r -> r := v;;
</pre>

<p>
  Now we define the allocation of a new pointer initialized to points
  to a given value:
</p>
<pre ml:content="ocaml">
  let new_pointer x = Pointer (ref x);;
</pre>

<p>
  For instance, let's define and then assign a pointer to an integer:
</p>
<pre ml:content="ocaml">
  let p = new_pointer 0;;
  p ^:= 1;;
  !^p;;
</pre>


<h2><a name="integer-lists"</a>Integer Lists</h2>

<p>
  Now we can define lists using explicit pointers as in usual
  imperative languages:
</p>

<pre ml:content="ocaml">
  (* The list type ``à la Pascal'' *)
  type ilist = cell pointer
  and cell = {mutable hd : int; mutable tl : ilist}
</pre>

<p>
  We then define allocation of a new cell, the list constructor and
  its associated destructors.
</p>

<pre ml:content="ocaml">
  let new_cell () = {hd = 0; tl = Null};;

  let cons x l =
    let c = new_cell () in
    c.hd <- x;
    c.tl <- l;
    (new_pointer c : ilist);;

  let hd (l : ilist) = !^l.hd;;
  let tl (l : ilist) = !^l.tl;;
</pre>

<p>
  We can now write all kind of classical algorithms, based on pointers
  manipulation, with their associated loops, their unwanted sharing
  problems and their null pointer errors. For instance, list
  concatenation, as often described in litterature, physically
  modifies its first list argument, hooking the second list to the end
  of the first:
</p>

<pre ml:content="ocaml">
  (* Physical append *)
  let append (l1 : ilist) (l2 : ilist) =
    let temp = ref l1 in
    while tl !temp <> Null do
      temp := tl !temp
    done;
    !^ !temp.tl <- l2;;

  (* An example: *)
  let l1 = cons 1 (cons 2 Null);;

  let l2 = cons 3 Null;;

  append l1 l2;;
</pre>

<p>
  The lists <code>l1</code> and <code>l2</code> are effectively catenated:
</p>
<pre ml:content="ocaml">
  l1;;
</pre>

<p>
  Just a nasty side effect of physical list concatenation:
    <code>l1</code> now contains the concatenation of the two lists
    <code>l1</code> and <code>l2</code>, thus the list
    <code>l1</code> no longer exists: in some sense
    <code>append</code> <em>consumes</em> its first argument. In
    other words, the value of a list data now depends on its history,
    that is on the sequence of function calls that use the value.
    This strange behaviour leads to a lot of difficulties when
    explicitely manipulating pointers. Try for instance, the
    seemingly harmless:
  
</p>
<pre ml:content="ocaml">
  append l1 l1;;
</pre>
<p>Then evaluate <code>l1</code>:</p>
<pre ml:content="ocaml">
  l1;;
</pre>


<h2><a name="polymorphic-lists"></a>Polymorphic lists</h2>

<p>
  To go beyond Pascal type system, we define polymorphic lists using
  pointers; here is a simple implementation of those polymorphic
  mutable lists:
</p>

<pre ml:content="ocaml">
  type 'a lists = 'a cell pointer
  and 'a cell = {mutable hd : 'a pointer; mutable tl : 'a lists};;

  let new_cell () = {hd = Null; tl = Null};;
  let cons x l =
    let c = new_cell () in
    c.hd <- new_pointer x;
    c.tl <- l;
    (new_pointer c : 'a lists);;
  let hd (l : 'a lists) = !^l.hd;;
  let tl (l : 'a lists) = !^l.tl;;

  let append (l1 : 'a lists) (l2 : 'a lists) =
    let temp = ref l1 in
    while tl !temp <> Null do
      temp := tl !temp
    done;
    !^ !temp.tl <- l2;;
</pre>

  </body>
</html>
