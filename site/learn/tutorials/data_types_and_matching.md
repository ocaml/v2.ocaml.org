<!-- ((! set title Custom Data Types !)) ((! set learn !)) -->

*Table of contents*

# Custom Data Types

In this tutorial we learn how to build our own types in OCaml, and how to write
functions which process this new data.

## Built-in compound types

We have already seen simple data types such as `int`, `float`, `string`, and
`bool`.  Let's recap the built-in compound data types we can use in OCaml to
combine such values. First, we have lists which are ordered collections of any
number of elements of like type:

```ocamltop
[];;
[1; 2; 3];;
[[1; 2]; [3; 4]; [5; 6]];;
[false; true; false];;
```

Next, we have tuples, which collect a fixed number of elements together:

```ocamltop
(5.0, 6.5);;
(true, 0.0, 0.45, 0.73, "french blue");;
```

We have records, which are like labeled tuples. They are defined by writing a
type definition giving a name for the record, and names for each of its fields,
and their types:

```ocamltop
type point = {x : float; y : float};;
let a = {x = 5.0; y = 6.5};;
type colour = {websafe : bool; r : float; g : float; b : float; name : string};;
let b = {websafe = true; r = 0.0; g = 0.45; b = 0.73; name = "french blue"};;
```

A record must contain all fields:

```ocamltop
let c = {name = "puce"};;
```

Records may be mutable:

```ocamltop
type person =
  {first_name : string;
   surname : string;
   mutable age : int};;

let birthday p =
  p.age <- p.age + 1;;
```

Another mutable compound data type is the fixed-length array which, just as a
list, must contain elements of like type. However, its elements may be accessed
in constant time:

```ocamltop
let arr = [|1; 2; 3|];;
arr.(0);;
arr.(0) <- 0;;
arr;;
```

In this tutorial, we will define our own compound data types, using the `type`
keyword, and some of these built-in structures as building blocks.

## A simple custom type

We can define a new data type `colour` which can take one of four values.

```ocamltop
type colour = Red | Green | Blue | Yellow
```

Our new type is called `colour`, and has four *constructors* `Red`, `Green`,
`Blue` and `Yellow`. The name of the type must begin with a lower case letter,
and the names of the constructors with upper case letters. We can use our new
type anywhere a built-in type could be used:

```ocamltop
let additive_primaries = (Red, Green, Blue);;

let pattern = [(1, Red); (3, Green); (1, Red); (2, Green)];;
```

Notice the types inferred by OCaml for these expressions. We can pattern-match
on our new type, just as with any built-in type:

```ocamltop
let example c =
  match c with
  | Red -> "rose"
  | Green -> "grass"
  | Blue -> "sky"
  | Yellow -> "banana";;
```

Notice the type of the function includes the name of our new type `colour`. We
can make the function shorter and elide its parameter `c` by using the
alternative `function` keyword which allows direct matching:

```ocamltop
let example = function
  | Red -> "rose"
  | Green -> "grass"
  | Blue -> "sky"
  | Yellow -> "banana";;
```

We can match on more than one case at a time too:

```ocamltop
let rec is_primary = function
  | Red | Green | Blue -> true
  | _ -> false
```

## Constructors with data

Each constructor in a data type can carry additional information with it. Let's
extend our `colour` type to allow arbitrary RGB triples, each element begin a
number from 0 (no colour) to 1 (full colour): 

```ocamltop
type colour =
  | Red
  | Green
  | Blue
  | Yellow
  | RGB of float * float * float;;

[Red; Blue; RGB (0.5, 0.65, 0.12)];;
```

Types, just like functions, may be recursively-defined. We extend our data type
to allow mixing of colours:

```ocamltop
type colour =
  | Red
  | Green
  | Blue
  | Yellow
  | RGB of float * float * float
  | Mix of float * colour * colour;;

Mix (0.5, Red, Mix (0.5, Blue, Green));; 
```

Here is a function over our new `colour` data type:

```ocamltop
let rec rgb_of_colour = function
  | Red -> (1.0, 0.0, 0.0)
  | Green -> (0.0, 1.0, 0.0)
  | Blue -> (0.0, 0.0, 1.0)
  | Yellow -> (1.0, 1.0, 0.0)
  | RGB (r, g, b) -> (r, g, b)
  | Mix (p, a, b) ->
      let (r1, g1, b1) = rgb_of_colour a in
      let (r2, g2, b2) = rgb_of_colour b in
      let mix x y = x *. p +. y *. (1.0 -. p) in
        (mix r1 r2, mix g1 g2, mix b1 b2)
```

We can use records directly in the data type instead to label our components:

```ocamltop
type colour =
  | Red
  | Green
  | Blue
  | Yellow
  | RGB of {r : float; g : float; b : float}
  | Mix of {proportion : float; c1 : colour; c2 : colour}
```

## Example: trees

Data types may be polymorphic as well as recursive. Here is an OCaml data type
for a binary tree carrying any kind of data:

```ocamltop
type 'a tree =
  | Leaf
  | Node of 'a tree * 'a * 'a tree;;

let t =
  Node (Node (Leaf, 1, Leaf), 2, Node (Node (Leaf, 3, Leaf), 4, Leaf));;
```

Notice that we give the type parameter `'a` before the type name (if there is
more than one, we write `('a, 'b)` etc).  A `Leaf` holds no information,
just like an empty list. A `Node` holds a left tree, a value of type `'a`
and a right tree. In our example, we built an integer tree, but any type can be
used. Now we can write recursive and polymorphic functions over these trees, by
pattern matching on our new constructors:

```ocamltop
let rec total = function
  | Leaf -> 0
  | Node (l, x, r) -> total l + x + total r;;

let rec flip = function
  | Leaf -> Leaf
  | Node (l, x, r) -> Node (flip r, x, flip l);;
```

Here, `flip` is polymorphic while `total` operates only on trees of type `int
tree`. Let's try our new functions out:

```ocamltop
let all = total t;;

let flipped = flip t;;

t = flip flipped;;
```

Instead of integers, we could build a tree of key-value pairs. Then, if we
insist that the keys are unique and that a smaller key is always left of a
larger key, we have a data structure for dictionaries which performs better
than a simple list of pairs. It is known as a *binary search tree*:

```ocamltop
let rec insert (k, v) = function
  | Leaf -> Node (Leaf, (k, v), Leaf)
  | Node (l, (k', v'), r) ->
      if k < k' then Node (insert (k, v) l, (k', v'), r) 
      else if k > k' then Node (l, (k', v'), insert (k, v) r)
      else Node (l, (k, v), r);;
```

Similar functions can be written to look up values in a dictionary, to convert
a list of pairs to or from a tree dictionary and so on.

## Example: mathematical expressions

We wish to represent simple mathematical expressions like `n * (x + y)` and
multiply them out symbolically to get `n * x + n * y`.

Let's define a type for these expressions:

```ocamltop
type expr =
  | Plus of expr * expr        (* a + b *)
  | Minus of expr * expr       (* a - b *)
  | Times of expr * expr       (* a * b *)
  | Divide of expr * expr      (* a / b *)
  | Var of string              (* "x", "y", etc. *)
```

The expression `n * (x + y)` would be written:

```ocamltop
Times (Var "n", Plus (Var "x", Var "y"))
```

Let's write a function which prints out `Times (Var "n", Plus (Var "x", Var
"y"))` as something more like `n * (x + y)`.

```ocamltop
let rec to_string e =
  match e with
  | Plus (left, right) ->
     "(" ^ to_string left ^ " + " ^ to_string right ^ ")"
  | Minus (left, right) ->
     "(" ^ to_string left ^ " - " ^ to_string right ^ ")"
  | Times (left, right) ->
	 "(" ^ to_string left ^ " * " ^ to_string right ^ ")"
  | Divide (left, right) ->
	 "(" ^ to_string left ^ " / " ^ to_string right ^ ")"
  | Var v -> v ;;
  
let print_expr e =
  print_endline (to_string e);;
```

(The `^` operator concatenates strings). We separate the function into two so
that our `to_string` function is usable in other contexts. Here's the
`print_expr` function in action:

```ocamltop
print_expr (Times (Var "n", Plus (Var "x", Var "y")));;
```

We can write a function to multiply out expressions of the form `n * (x + y)`
or `(x + y) * n` and for this we will use a nested pattern:

```ocamltop
let rec multiply_out e =
  match e with
  | Times (e1, Plus (e2, e3)) ->
     Plus (Times (multiply_out e1, multiply_out e2),
           Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) ->
     Plus (Times (multiply_out e1, multiply_out e3),
           Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) ->
     Plus (multiply_out left, multiply_out right)
  | Minus (left, right) ->
     Minus (multiply_out left, multiply_out right)
  | Times (left, right) ->
     Times (multiply_out left, multiply_out right)
  | Divide (left, right) ->
     Divide (multiply_out left, multiply_out right)
  | Var v -> Var v;;
```

Here it is in action:

```ocamltop
print_expr (multiply_out (Times (Var "n", Plus (Var "x", Var "y"))))
```

How does the `multiply_out` function work? The key is in the first two
patterns. The first pattern is `Times (e1, Plus (e2, e3))` which matches
expressions of the form `e1 * (e2 + e3)`. Now look at the right hand side of
this first pattern match, and convince yourself that it is the equivalent of
`(e1 * e2) + (e1 * e3)`. The second pattern does the same thing, except for
expressions of the form `(e1 + e2) * e3`.

The remaining patterns don't change the form of the expression, but they
crucially *do* call the `multiply_out` function recursively on their
subexpressions. This ensures that all subexpressions within the expression get
multiplied out too (if you only wanted to multiply out the very top level of an
expression, then you could replace all the remaining patterns with a simple `e
-> e` rule).

Can we do the reverse (i.e. factorizing out common subexpressions)? We can!
(But it's a bit more complicated). The following version only works for the top
level expression. You could certainly extend it to cope with all levels of an
expression and more complex cases:

```ocamltop
let factorize e =
  match e with
  | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 ->
     Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 ->
     Times (Plus (e1, e3), e4)
  | e -> e;;

factorize (Plus (Times (Var "n", Var "x"),
                 Times (Var "n", Var "y")));;
```

The factorize function above introduces another couple of features. You can add
what are known as *guards* to each pattern match. A guard is the conditional
which follows the `when`, and it means that the pattern match only happens if
the pattern matches *and* the condition in the `when`-clause is satisfied.

```ocaml
match value with
| pattern [ when condition ] -> result
| pattern [ when condition ] -> result
  ...
```

The second feature is the `=` operator which tests for "structural equality"
between two expressions. That means it goes recursively into each expression
checking they're exactly the same at all levels down.

Another feature which is useful when we build more complicated nested patterns
is the `as` keyword, which can be used to name part of an expression. For
example:

```ocaml
Name ("/DeviceGray" | "/DeviceRGB" | "/DeviceCMYK") as n -> n

Node (l, ((k, _) as pair), r) when k = k' -> Some pair
```

## Mutually recursive data types

Data types may be mutually-recursive when declared with `and`:

```ocamltop
type t = A | B of t' and t' = C | D of t;;
```

One common use for mutually-recursive data types is to *decorate* a tree, by
adding information to each node using mutually-recursive types, one of which is
a tuple or record. For example:

```ocamltop
type t' = Int of int | Add of t * t

and t = {annotation : string; data : t'}
```

Values of such mutually-recursive data type are manipulated by accompanying
mutually-recursive functions:

```ocamltop
let rec sum_t' = function
  | Int i -> i
  | Add (i, i') -> sum_t i + sum_t i'

and sum_t {annotation; data} =
  if annotation <> "" then Printf.printf "Touching %s\n" annotation;
  sum_t' data
```

## A note on tupled constructors

There is a difference between `RGB of float * float * float` and `RGB of (float
* float * float)`. The first is a constructor with three pieces of data
associated with it, the second is a constructor with one tuple associated with
it. There are two ways this matters: the memory layout differs between the two
(a tuple is an extra indirection), and the ability to create or match using a
tuple:

```ocamltop
type t = T of int * int;;

type t2 = T2 of (int * int);;

let pair = (1, 2);;

T2 pair;;

T pair;;

match T2 (1, 2) with T2 x -> fst x;;

match T (1, 2) with T x -> fst x;;
```

Note, however, that OCaml allows us to use the always-matching `_` in either
version:

```ocamltop
match T2 (1, 2) with T2 _ -> 0;;

match T (1, 2) with T _ -> 0;;
```

## Types and modules

Often, a module will provide a single type and operations on that type. For
example, a module for a file format like PNG might have the following `png.mli`
interface:

```ocaml
type t

val of_file : filename -> t

val to_file : t -> filename -> unit

val flip_vertical : t -> t

val flip_horizontal : t -> t

val rotate : float -> t -> t
```

Traditionally, we name the type `t`. In the program using this library, it
would then be `Png.t` which is shorter, reads better than `Png.png`, and avoids
confusion if the library also defines other types.
