<!-- ((! set title Data Types and Matching !)) ((! set learn !)) -->

*Table of contents*

# Data Types and Matching

## Linked lists
As with Perl, OCaml has support for lists built into the language. All
elements of a list in OCaml must be the same type. To write a list, use:

```ocamltop
[1; 2; 3]
```
(Note semicolons, NOT commas).

`[]` is the empty list.

A list has a **head** (the first element) and a **tail** (the rest of
the elements). The head is an element, and the tail is a list, so in the
above example, the head is the integer `1` while the tail is the *list*
`[2; 3]`.

An alternative way to write a list is to use the **cons** operator
`head :: tail`. So the following ways to write a list are exactly the
same:

```ocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```
Why do I mention the cons operator? Well, it's useful when we start
doing *pattern matching* on lists, which I'll talk about below.

###  The type of a linked list
The type of a linked list of integers is `int list`, and in general the
type of a linked list of `foo`s is `foo list`.

This implies that all the elements of a linked list must have the same
type. But the type can be polymorphic (ie. `'a list`), which is really
useful if you want to write generic functions which operate on "lists of
anything". (But note: `'a list` doesn't mean that each individual
element has a different type - you still can't use this to construct a
list containing, say, a mixture of ints and strings. It means that the
type of the elements is anything, but all the same type of anything.)

The `length` function defined as part of the OCaml `List` module is a
good example of this. It doesn't matter if the list contains ints or
strings or objects or small furry animals, the `List.length` function
can still be called on it. The type of `List.length` is therefore:

```ocaml
List.length : 'a list -> int
```
## Structures
C and C++ have the concept of a simple `struct`, short for structure.
Java has classes which can be used to similar effect, albeit much more
laboriously.

Consider this simple C structure:

```C
struct pair_of_ints {
  int a, b;
};
```
The simplest equivalent to this in OCaml is a **tuple** such as `(3, 4)`
which has the type `int * int`. Unlike lists, tuples can contain
elements of different types, so for example `(3, "hello", 'x')` has type
`int * string * char`.

A slightly more complex alternative way of writing a C struct is to use
a **record**. Records, like C structs, allow you to name the elements.
Tuples don't let you name the elements, but instead you have to remember
the order in which they appear. Here is the equivalent record for our C
struct above:

```ocamltop
type pair_of_ints = { a : int; b : int };;
```
That defines the type, and here is how we actually *create* objects of
this type:

```ocamltop
{ a=3; b=5 }
```
Note that we use ":" in the type definition and "=" when creating
objects of this type.

Here are some examples of this typed into the toplevel:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```
So OCaml won't let you leave some fields in your structure undefined.

## Variants (qualified unions and enums)
A "qualified union" doesn't really exist in C, although there is support
in the gcc compiler for it. Here is the pattern which one commonly uses
for a qualified union in C:

```C
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // If type == TYPE_INT.
    int pair[2];  // If type == TYPE_PAIR_OF_INTS.
    char *str;    // If type == TYPE_STRING.
  } u;
};
```
We've all seen this I should think, and it's not a pretty sight. For a
start it's not safe: the programmer might make a mistake and
accidentally use, say, the `u.i` field when in fact a string was stored
in the structure. Also the compiler can't easily check if all possible
types have been examined in a switch statement (you can use an `enum`
type instead to solve this particular problem). The programmer might
forget to set the `type` field, which would result in all sorts of fun
and games. Furthermore, it's cumbersome.

Here is the elegant and concise equivalent in OCaml:

```ocamltop
type foo =
  | Nothing
  | Int of int
  | Pair of int * int
  | String of string
```
That's the type definition. First part of each `|` separated part is
called the constructor. It can be called anything, as long as it starts
with a capital letter. If the constructor can be used to define a value,
it's followed by the `of type` part, where type always starts with a
lowercase letter. In the above example, Nothing is used as a constant
and the other constructors are used with values.

To actually *create* things of this type you would write:

```ocaml
Nothing
Int 3
Pair (4, 5)
String "hello"
...
```
Each of these expressions has type `foo`.

Note that you use `of` when writing the type definition, but NOT when
writing elements of the type.

By extension, a simple C `enum` defined as:

```C
enum sign { positive, zero, negative };
```
can be written in OCaml as:

```ocaml
type sign = Positive | Zero | Negative
```

###  Recursive variants (used for trees)
Variants can be recursive, and one common use for this is to define tree
structures. This is where the expressive power of functional
languages come into their own:

```ocamltop
type binary_tree =
  | Leaf of int
  | Tree of binary_tree * binary_tree
```
Here're some binary trees. For practice, try drawing them on paper.

```ocaml
Leaf 3
Tree (Leaf 3, Leaf 4)
Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
```

###  Parameterized variants
The binary tree in the previous section has integers at each leaf, but
what if we wanted to describe the *shape* of a binary tree, but decide
exactly what to store at each leaf node later? We can do this by using a
parameterized (or polymorphic) variant, like this:

```ocamltop
type 'a binary_tree =
  | Leaf of 'a
  | Tree of 'a binary_tree * 'a binary_tree
```
This is a general type. The specific type which stores integers at each
leaf is called `int binary_tree`. Similarly the specific type which
stores strings at each leaf is called `string binary_tree`. In the next
example we type some instances into the top-level and allow the type
inference system to show the types for us:

```ocamltop
Leaf "hello";;
Leaf 3.0;;
```
Notice how the type name is backwards. Compare this to the type names
for lists, eg. `int list` etc.

In fact it is no coincidence that `'a list` is written "backwards" in
the same way. Lists are simply parameterized variant types with the
following slightly strange definition:

```ocaml
type 'a list = [] | :: of 'a * 'a list   (* not real OCaml code *)
```
Actually the definition above doesn't quite compile. Here's a
pretty-much equivalent definition:

```ocamltop
type 'a equiv_list =
  | Nil
  | Cons of 'a * 'a equiv_list;;
Nil;;
Cons(1, Nil);;
Cons(1, Cons(2, Nil));;
```
Recall earlier that we said lists could be written two ways, either with
the simple syntactic sugar of `[1; 2; 3]` or more formally as
`1 :: 2 :: 3 :: []`. If you look at the definition for `'a list` above,
you may be able to see the reason for the formal definition.

## Lists, structures and variants — summary

```text
OCaml name     Example type definition        Example usage

list           int list                       [1; 2; 3]
tuple          int * string                   (3, "hello")
record         type pair =                    { a = 3; b = "hello" }
                 { a: int; b: string }
variant        type foo =
	             | Int of int                 Int 3
			     | Pair of int * string
variant        type sign =
                 | Positive                   Positive
			     | Zero                       Zero
                 | Negative
parameterized  type 'a my_list =
variant          | Empty                      Cons (1, Cons (2, Empty))
                 | Cons of 'a * 'a my_list
```

## Pattern matching (on datatypes)
So one Really Cool Feature of functional languages is the ability to
break apart data structures and do pattern matching on the data. This is
again not really a "functional" feature - you could imagine some
variation of C appearing which would let you do this, but it's a Cool
Feature nonetheless.

Let's start with a real program requirement: I wish to represent simple
mathematical expressions like `n * (x + y)` and multiply them out
symbolically to get `n * x + n * y`.

Let's define a type for these expressions:

```ocamltop
type expr =
  | Plus of expr * expr        (* means a + b *)
  | Minus of expr * expr       (* means a - b *)
  | Times of expr * expr       (* means a * b *)
  | Divide of expr * expr      (* means a / b *)
  | Value of string            (* "x", "y", "n", etc. *)
```
The expression `n * (x + y)` would be written:

```ocamltop
Times (Value "n", Plus (Value "x", Value "y"))
```
Let's write a function which prints out
`Times (Value "n", Plus (Value "x", Value "y"))` as something more like
`n * (x + y)`. Actually, I'm going to write two functions, one which
converts the expression to a pretty string, and one which prints it out
(the reason is that I might want to write the same string to a file and
I wouldn't want to repeat the whole of the function just for that).

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
  | Value v -> v ;;
  
let print_expr e =
  print_endline (to_string e);;
```

(NB: The `^` operator concatenates strings.)

Here's the print function in action:

```ocamltop
print_expr (Times (Value "n", Plus (Value "x", Value "y")))
```
The general form for pattern matching is:

```ocaml
match value with
| pattern    ->  result
| pattern    ->  result
  ...
```
The patterns on the left hand side can be simple, as in the `to_string`
function above, or complex and nested. The next example is our function
to multiply out expressions of the form `n * (x + y)` or `(x + y) * n`
and for this we will use a nested pattern:

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
  | Value v -> Value v
```
Here it is in action:

```ocamltop
print_expr(multiply_out(Times (Value "n", Plus (Value "x", Value "y"))))
```
How does the `multiply_out` function work? The key is in the first two
patterns. The first pattern is `Times (e1, Plus (e2, e3))` which matches
expressions of the form `e1 * (e2 + e3)`. Now look at the right hand
side of this first pattern match, and convince yourself that it is the
equivalent of `(e1 * e2) + (e1 * e3)`.

The second pattern does the same thing, except for expressions of the
form `(e1 + e2) * e3`.

The remaining patterns don't change the form of the expression, but they
crucially *do* call the `multiply_out` function recursively on their
subexpressions. This ensures that all subexpressions within the
expression get multiplied out too (if you only wanted to multiply out
the very top level of an expression, then you could replace all the
remaining patterns with a simple `e -> e` rule).

Can we do the reverse (ie. factorizing out common subexpressions)? We
sure can! (But it's a bit more complicated). The following version only
works for the top level expression. You could certainly extend it to
cope with all levels of an expression and more complex cases:

```ocamltop
let factorize e =
  match e with
  | Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 ->
     Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 ->
     Times (Plus (e1, e3), e4)
  | e -> e;;

factorize (Plus (Times (Value "n", Value "x"),
                 Times (Value "n", Value "y")))
```

The factorize function above introduces another couple of features. You
can add what are known as **guards** to each pattern match. A guard is
the conditional which follows the `when`, and it means that the pattern
match only happens if the pattern matches *and* the condition in the
`when`-clause is satisfied.

```ocaml
match value with
| pattern  [ when condition ] ->  result
| pattern  [ when condition ] ->  result
  ...
```
The second feature is the `=` operator which tests for "structural
equality" between two expressions. That means it goes recursively into
each expression checking they're exactly the same at all levels down.

OCaml is able to check at compile time that you have covered all
possibilities in your patterns. I changed the type definition of
`type expr` above by adding a `Product` variant:

```ocamltop
type expr = Plus of expr * expr      (* means a + b *)
          | Minus of expr * expr     (* means a - b *)
          | Times of expr * expr     (* means a * b *)
          | Divide of expr * expr    (* means a / b *)
          | Product of expr list     (* means a * b * c * ... *)
          | Value of string          (* "x", "y", "n", etc. *)
```
I then recompiled the `to_string` function without changing it. OCaml
reported the following warning:

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
  | Value v -> v ;;
```
