<!-- ((! set title FAQ !)) ((! set learn !)) -->

# FAQ
See also [Stack Overflow](http://stackoverflow.com/tags/ocaml/info),
which is widely used by the OCaml community.

*Table of contents*

## General Questions
#### What is OCaml?

OCaml is a programming language. It is a functional language, since the
basic units of programs are functions. It is a strongly-typed language;
it means that the objects that you use belong to a set that has a name,
called its type. In OCaml, types are managed by the computer, the user
has nothing to do about types (types are synthesized). The language is
available on almost every Unix platform (including Linux and MacOS X)
and on PCs under Windows. A brief tour on main
[features](description.html) of OCaml.

#### Under what licensing terms is the OCaml software available?

The OCaml system is open source software. Since version 4.03 the
compiler and the standard library are distributed under LGPL 2.1 with
static linking exception, read the [license](/docs/license.html) for
details. The software is also available under a BSD-style license for a
fee through the [OCaml Consortium](/consortium/).

#### What is the meaning of the name “OCaml”

CAML once was an acronym that stood for “Categorical Abstract Machine
Language”, an abstract machine its early versions targeted. The evaluation model
has changed since then, but the name stuck.

The “O” stands for “objective” and was added when the language got object-oriented
programming capabilities.

#### Do you write “Caml”, “CAML”, “Ocaml”, “OCaML”, “OCAML” or “OCaml” ?

The official name of the language, capitalization included, is “OCaml”.

#### Is OCaml a compiled or interpreted language?

OCaml is compiled. However, the OCaml compiler offers a top-level
interactive loop, that is similar to an interpreter. In fact, in the
interactive system, the user may type in program chunks (we call these
pieces OCaml “phrases”) that the system handles at once, compiling them,
executing them, and writing their results.

#### What are the differences between Caml V3.1, Caml Light, and OCaml?

These are different Caml implementations that have been developed
successively at Inria. These systems share many features since they all
implement the core of the OCaml language; so the basic syntax is nearly
the same. However, all these systems have their own extensions to the
Caml core language.<br />
Caml V3.1 is no longer maintained nor distributed. [Caml
Light](../caml-light/) is no longer developed, but still maintained.
Because of its stable status, it is actively used in education. Most
other users have switched to OCaml, the latest variant of the language.
This is the version we suggest using in new software developments. See
our brief [history](history.html) of the OCaml language.

#### How to report a bug in the compilers?

Use the [bug tracking system](http://caml.inria.fr/mantis/) to browse
bug reports and features request, and submit new ones.


## Core Language
* * *

###  Basic types
#### Is it possible to do computations with arbritrary precision arithmetics?

OCaml provides a library called `Num` that handles exact arithmetic computation
for rational numbers.

Operations on big numbers gets the suffix `/`: addition is thus `+/`.
You build big numbers using conversion from (small) integers or
character strings. For printing in the interactive toplevel (aka
[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)),
a custom printer can be
used. An example under OCaml is given below.

```ocamltop
#load "nums.cma";;
open Num
open Format;;
let print_num ff n = fprintf ff "%s" (string_of_num n);;
#install_printer print_num;;
num_of_string "2/3";;
let n = num_of_string "1/3" +/ num_of_string "2/3";;
let rec fact n =
  if n <= 0 then (num_of_int 1) else num_of_int n */ (fact (n - 1));;
fact 100;;
```

###  Data structures
#### My array is modified, and I don't know why

This is due to the physical sharing of two arrays that you missed. In
OCaml there is no implicit array copying. If you give two names to the
same array, every modification on one array will be visible to the
other:

```ocamltop
let v = Array.make 3 0;;
let w = v;;
w.(0) <- 4;;
v;;
```
The physical sharing effect also applies to elements stored in vectors:
if these elements are also vectors, the sharing of these vectors implies
that modifying one of these elements modifies the others (see also the
entry below).

#### How to define multidimensional arrays?

The only way is to define an array whose elements are arrays themselves
(OCaml arrays are unidimensional, they modelize mathematical vectors).
The naive way to define multidimensional arrays is bogus: the result is
not right because there is some unexpected physical sharing between the
lines of the new array (see also previous entry):

```ocamltop
let m = Array.make 2 (Array.make 3 0);;
m.(0).(0) <- 1;;
m;;
```
The allocation of a new array has two phases. First, the initial value
is computed; then this value is written in each element of the new
array. That's why the line which is allocated by `Array.make 3 0` is
unique and physically shared by all the lines of the array `m`.<br />
 The solution is to use the `make_matrix` primitive that builds the
matrix with all elements equal to the initial value provided.
Alternatively, write the program that allocates a new line for each line
of your matrix. For instance:

```ocamltop
let matrix n m init =
  let result = Array.make n (Array.make m init) in
  for i = 1 to n - 1 do
    result.(i) <- Array.make m init
  done;
  result
```
In the same vein, the `copy_vect` primitive gives strange results, when
applied to matrices: you need to write a function that explicitly copies
each line of the matrix at hand:

```ocamltop
let copy_matrix m =
  let l = Array.length m in
  if l = 0 then m else
    let result = Array.make l m.(0) in
    for i = 0 to l - 1 do
      result.(i) <- Array.copy m.(i)
    done;
    result
```

###  Types definitions
#### How to define an enumerated type?

An enumerated type is a sum type with only constants. For instance, a
type with 3 constants:

```ocamltop
type color = Blue | White | Red;;
Blue;;
```
The names `Blue`, `White` and `Red` are the constructors of the `color`
type. One can define functions on this type by pattern matching:

```ocamltop
let string_of_color =function
  | Blue -> "blue"
  | White -> "white"
  | Red -> "red"
```

#### Is it possible to make a record value without declaring its type first?
No, Before making a record, you must give record's type a name, using the `type` keyword, 
or the type name for the record should at least be in scope. Ocaml needs to know
the record type's name and associated field names before making a record value.
Otherwise it results in error "Unbound record field".

```ocamltop
type person = { name: string; age: int }
let p1 = { name="John"; age=30 }
```

#### How to share a field between two different record types?

When you define two types sharing a field name, the last defined type
hides the field of the first type. For instance:

```ocamltop
type point_3d = {x : float; y : float; z : float};;
type point_2d = {x : float; y : float};;
{x = 10.; y = 20.; z = 30.};;
```

Since OCaml 4.02, fields are automatically disambiguated when types are
known. For example, in `let u:point_3d = ... in u.x`, `u.x` refers to
the field of `point_3d` even though it is shadowed. However, field
disambiguation does not work when type information is not available
(e.g. in `let get_x u = u.x` where the type of `get_x` is not otherwise
constrained), and may produce confusing results when types are omitted,
so one may consider avoiding the problem entirely.

The simplest way to overcome this problem is to simply use different
names! For instance

```ocamltop
type point3d = {x3d : float; y3d : float; z3d : float};;
type point2d = {x2d : float; y2d : float};;
```

One can propose two others solutions. First, it is possible
to use modules to define the two types in different name spaces:

```ocamltop
module D3 = struct
  type point = {x : float; y : float; z : float}
end

module D2 = struct
  type point = {x : float; y : float}
end
```

This way fields can be fully qualified as `D3.x` `D2.x`:

```ocamltop
{D3.x = 10.; D3.y = 20.; D3.z = 30.};;
{D2.x = 10.; D2.y = 20.};;
```
You can also use objects that provide overloading on method names:

```ocamltop
class point_3d ~x ~y ~z = object
  method x : float = x
  method y : float = y
  method z : float = z
end;;

class point_2d ~x ~y = object
  method x : float = x
  method y : float = y
end;;
```

Note that objects provide you more than overloading: you can define
truly polymorphic functions, working on both `point_3d` and `point_2d`,
and you can even coerce a `point_3d` to a `point_2d`.

#### How to define two sum types that share constructor names?

Since OCaml 4.02, constructors are automatically disambiguated when types
are known. For example, in `type a = A;; type b = A of int;; let x:a = A`,
`A` is recognized as belonging to the type `a` even though its constructor
is shadowed. However, constructor disambiguation does not work when type
information is not available (e.g. in `let get_n x = match x with A -> 1`
where the type of `get_n` is not otherwise constrained), and may produce
confusing results when types are omitted, so one may consider avoiding 
the problem entirely.

Generally speaking, sharing names between two constructors is not
possible. As for all other names, you must use
distinct name constructors. However, you can define the two types in two
different name spaces, i.e. into two different modules. As for fields
discussed above, you obtain constructors that can be qualified by their
module names. With OCaml you can alternatively use polymorphic variants,
i.e. constructors that are, in some sense, *predefined*, since they are
not defined by a type definition. For instance:

```ocamltop
type ids = [ `Name | `Val ];;
type person = [ `Name of string ];;
let f : person -> string = function `Name s -> s;;
let is_name : ids -> bool = function `Name -> true | _ -> false;;
```

###  Functions and procedures
#### How to define a function?

In OCaml, the syntax to define functions is close to the mathematical
usage: the definition is introduced by the keyword `let`, followed by
the name of the function and its arguments; then the formula that
computes the image of the argument is written after an `=` sign.

```ocamltop
let successor (n) = n + 1;;
```
In fact, parens surrounding the argument may be omitted, so we generally
write:

```ocamltop
let successor n = n + 1;;
```

#### How to define a recursive function?

You need to explicitly tell that you want to define a recursive
function: use `let rec` instead of `let`.  For instance:

```ocamltop
let rec fact n =
  if n = 0 then 1 else n * fact (n - 1);;
let rec fib n =
  if n <= 1 then n else fib (n - 1) + fib (n - 2);;
```
Functions may be mutually recursive:

```ocamltop
let rec odd n =
  if n = 0 then false
  else if n = 1 then true else even (n - 1)
and even n =
  if n = 0 then true
  else if n = 1 then false else odd (n - 1);;
```

#### How to apply a function?

Functions are applied as in mathematics: write the function's name,
followed by its argument enclosed in parens: f (x). In practice, parens
are omitted in case of constants or identifiers: we write `fib 2`
instead of `fib (2)`, and `fact x` instead of `fact (x)`.<br />
 When the argument of a function is more complex than just an
identifier, you must enclose this argument between parentheses. In
particular you need parens when the argument is a negative constant
number: to apply `f` to `-1` you must write `f (-1)` and **not** `f -1`
that is syntactically similar to `f - 1` (hence it is a subtraction, not
an application).

#### How to define a procedure?

Recall that *procedures* are commands that produce an *effect* (for
instance printing something on the terminal or writing some memory
location), but have no mathematically meaningful result.

In OCaml, there is no special treatment of procedures: they are just
considered as special cases of functions that return the special
“meaningless” value `()`. For
instance, the `print_string` primitive that prints a character string on
the terminal, just returns `()` as a way of indicating that its job has
been properly completed.

Procedures that do not need any meaningful argument, get `()` as dummy
argument. For instance, the `print_newline` procedure, that outputs a
newline on the terminal, gets no meaningful argument: it has type
`unit -> unit`.

Procedures with argument are defined exactly as ordinary functions. For
instance:

```ocamltop
let message s = print_string s; print_newline();;
message "Hello world!";;
```

#### How to define a procedure/function that takes no argument?

Note that it is impossible to define a procedure without any argument at
all: its definition would imply to execute it, and there would be no way
to call it afterwards. In the following fragment `double_newline` is
bound to `()`, and its further evaluation never produces carriage
returns as may be erroneously expected by the user.

```ocamltop
let double_newline = print_newline(); print_newline();;
double_newline;;
```
The correct definition and usage of this procedure is:

```ocamltop
let double_newline () = print_newline(); print_newline();;
double_newline;;
double_newline ();;
```

### How to define a function with more than one argument?

Just write the list of successive arguments when defining the function.
For instance:

```ocamltop
let sum x y = x + y;;
```
then gives the actual arguments in the same order when applying the
function:

```ocamltop
sum 1 2;;
```
These functions are named “curried” functions, as opposed to functions
with tuples as argument:

```ocamltop
let sum' (x, y) = x + y;;
sum' (1, 2);;
```

By convention, OCaml code generally uses curried functions rather
than functions accepting a tuple as an argument. Of course, this
does not apply to cases where the tuple is denoting a data structure
on its own (e.g. `(float * float * float)` being used to represent
a point).

#### How to define a function that has several results?

You can define a function that return a pair or a tuple:

```ocamltop
let div_mod x y = (x / y, x mod y);;
div_mod 15 7;;
```

#### What is an “anonymous function”?

You may use functions that have no names: we call them functional values
or anonymous functions. A functional value is introduced by the keyword
`fun`, followed by its argument, then an arrow `->` and the function
body. For instance:

```ocamltop
fun x -> x + 1;;
(fun x -> x + 1) 2;;
```

#### What is the difference between `fun` and `function`?

Functions are usually introduced by the keyword `fun`. Each parameter is
introduced by its own `fun` construct. For instance, the construct:

```ocaml
fun x -> fun y -> ...
```
defines a function with two parameters `x` and `y`. An equivalent but
shorter form is:

```ocaml
fun x y -> ...
```
Functions that use pattern-matching are introduced by the keyword
`function`. For example:

```ocamltop
function None -> false | Some _ -> true
```

#### My function is never applied

This is probably due to a missing argument: since OCaml is a functional
programming language, there is no error when you evaluate a function
with missing arguments: in this case, a functional value is returned,
but the function is evidently not applied. Example: if you evaluate
`print_newline` without argument, there is no error, but nothing
happens. The compiler issues a warning in case of a blatant misuse.

```ocamltop
print_newline;;
print_newline ();;
```

###  Pattern matching
#### How to do nested pattern matching?

You imperatively need to enclose between parens a pattern matching which
is written inside another pattern matching. In effect, the internal
pattern matching “catches” all the pattern matching clauses that are
written after it. For instance:

```ocaml
let f = function
  | 0 -> match ... with | a -> ... | b -> ...
  | 1 -> ...
  | 2 -> ...
```
is parsed as

```ocaml
let f = function
  | 0 ->
     match ... with
     | a -> ...
     | b -> ...
     | 1 -> ...
     | 2 -> ...
```

This error may occur for every syntactic construct that involves pattern
matching: `function`, `match       .. with` and `try ... with`. The
usual trick is to enclose inner pattern matchings with `begin` and
`end`. One write:

```ocaml
let f = function
  | 0 ->
     begin match ... with
     | a -> ...
     | b -> ...
     end
  | 1 -> ...
  | 2 -> ...
```

<!-- ###  Exceptions -->
###  Typing
#### Error message: a type is not compatible with itself

You may obtain the message: This expression has type “some type” but is
used with type “the same some type”. This may occur very often when
using the interactive system.<br />
 The reason is that two types with the same name have been defined the
compiler does not confuse the two types, but the types are evidently
written the same. Consider for instance:

```ocamltop
type t = T of int;;
let x = T 1;;
type t = T of int;;
let incr = function T x -> T (x+1);;
incr x;;
```
This phenomenon appears when you load many times the same file into the
interactive system, since each reloading redefines the types. The
solution is to quit your interactive system and reload your files in a
new session.

#### A function obtained through partial application is not polymorphic enough

The more common case to get a “not polymorphic enough” definition is
when defining a function via partial application of a general
polymorphic function. In OCaml polymorphism is introduced only through
the “let” construct, and results from application are weakly polymorph;
hence the function resulting from the application is not polymorph. In
this case, you recover a fully polymorphic definition by clearly
exhibiting the functionality to the type-checker : define the function
with an explicit functional abstraction, that is, add a `function`
construct or an extra parameter (this rewriting is known as
eta-expansion):

```ocamltop
let map_id = List.map (function x -> x) (* Result is weakly polymorphic *);;
map_id [1;2];;
map_id (* No longer polymorphic *);;
let map_id' l = List.map (function x -> x) l;;
map_id' [1;2];;
map_id' (* Still fully polymorphic *);;
```

The two definitions are semantically equivalent, and the new one can be
assigned a polymorphic type scheme, since it is no more a function
application.

#### The type of this expression contains type variables that cannot be generalized

This message appears when the OCaml compiler tries to compile a function
or a value which is monomorphic, but for which some types have not been
completely inferred. Some types variables are left in the type, which
are are called “weak” (and are displayed by an underscore: `'_a`); they
will disappear thanks to type inference as soon as enough informations
will be given.

```ocamltop
let r = ref [];;
let f = List.map (fun x -> x);;
```

Since the expression mentionned in the error message cannot be compiled
as is, two cases must be envisioned:

* The expression can really not be turned into a polymorphic
 expression, as in `r` above. You must use an explicit type
 annotation, in order to turn it into something completely
 monomorphic.
* The expression can be transformed into something polymorphic through
 rewriting some part of the code (for example using
 [eta-expansion](#eta-expansion)) as in the case of `f`.

#### How to write a function with polymorphic arguments?

In ML, an argument of a function cannot be polymorphic inside the body
of the function; hence the following typing:

```ocamltop
let f (g : 'a -> 'a) x y = g x, g y;;
```
The function is not as polymorphic as we could have hoped.<br />
 Nevertheless, in OCaml it is possible to use first-order polymorphism.
For this, you can use either records or objects; in the case of records,
you need to declare the type before using it in the function.

```ocamltop
let f (o : < g : 'a. 'a -> 'a >) x y = o#g x, o#g y;;
type id = { g : 'a. 'a -> 'a };;
let f r x y = r.g x, r.g y;;
```

###  Input/output

#### Why some printing material is mixed up and does not appear in the right order?

If you use printing functions of the `format` module, you might not mix
printing commands from `format` with printing commands from the basic
I/O system. In effect, the material printed by functions from the
`format` module is delayed (stored into the pretty-printing queue) in
order to find out the proper line breaking to perform with the material
at hand. By contrast low level output is performed with no more
buffering than usual I/O buffering.

```ocamltop
print_endline "before";
Format.print_string "MIDDLE";
print_endline "after";;
```
To avoid this kind of problems you should not mix printing orders from
`format` and basic printing commands; that's the reason why when using
functions from the `format` module, it is considered good programming
habit to open `format` globally in order to completely mask low level
printing functions by the high level printing functions provided by
`format`.

## Module Language

#### Can I have two mutually recursive structures, signatures, functors inside a single compilation unit?

Yes, but structures always have to have  an explcit signature. 
Recursive structures may be defined as follows:

```ocamltop
module rec A : sig
  type a = { x: int }
end = struct
  type a = { x: int }
  let b : B.b = { y = 1.0 }
end and B : sig
  type b = { y: float }
end = struct
  type b = { y: float }
  let a : A.a = { x = 1 }
end
```

In a similar way, mutually recursive signatures and functors can also
be defined.

#### Can I have two mutually recursive compilation units?

With any two compilation units (`.ml` or `.mli` files), there must always
exist an order in which it is possible to compile them sequentially.
This precludes most kinds of recursion between compilation units.

However, two implementations can be recursive on types by exporting abstract
versions of the types in the interfaces, with the manifest versions in 
the implementations referring to the actual types.

For example, consider these `x.ml`/`x.mli` files:

```ocamltop
type a (* only in x.ml: *) = Y.a
type b =
| BNone
| BOne of a
```

and `y.ml`/`y.mli` files:

```ocamltop
type b (* only in y.ml: *) = X.b
type a =
| ANone
| AOne of b
```

In this way, cooperation between the `X` and `Y` modules allows 
the recursive value `X.BOne (Y.AOne (X.BOne ...))` to be produced.

#### How do I express sharing constraints between modules?

Use manifest type specifications in the arguments of the functor. For
instance, assume defined the following signatures:

```ocaml
module type S1 = sig ... type t ... end
module type S2 = sig ... type u ... end
```
To define a functor `F` that takes two arguments `X:S1` and `Y:S2` such
that `X.t` and `Y.u` are the same, write:

```ocaml
module F (X: S1) (Y: S2 with type u = X.t) =
  struct ... end
```
Indeed, internally this expands to

```ocaml
module F (X: S1) (Y: sig ... type u = X.t ... end) =
  struct ... end
```

#### Compilation units are forced to be modules. What if I want to make a unit with a functor or a signature instead?

In OCaml, functors and signatures (module types) can be components of
modules. So, just make the functor or signature be a component of a
compilation unit. A good example is the module `Set` from the standard
library.

## Development Tools
###  Interactive toplevel (aka REPL)

#### How to stop the evaluation (execution) of an expression?

It is often possible to interrupt a program or the OCaml system by
typing some combination of keys that is operating system dependent:
under Unix send an interrupt signal (generally `Control-C`), under
Macintosh OS type `Command-.`, under Windows use the “OCaml” menu.

#### How to quit the interactive loop?

Type `#quit;;`. You can also quit it by inputting an end-of-file character
with Ctrl-D on Unix, and Ctrl-Z on Windows.
