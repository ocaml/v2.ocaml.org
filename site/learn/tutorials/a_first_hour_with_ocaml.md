<!-- ((! set title A first hour with OCaml  !)) ((! set learn !)) -->

*Table of contents*

# A First Hour with OCaml

You may follow along with this tutorial with just a basic OCaml installation,
as described in [Up and Running](up_and_running.html).

Alternatively, you may follow almost all of it by running OCaml in your browser
using [TryOCaml](http://try.ocamlpro.com), with no installation required.

## Running OCaml programs

To try small OCaml expressions, you can use an interactive top level, or REPL
(Read-Eval-Print Loop). The `ocaml` command provides a basic top level (you
should install `rlwrap` through your system package manager and run `rlwrap
ocaml` instead to get history navigation.)

The alternative REPL [utop](https://github.com/ocaml-community/utop) may be installed
through [opam](/docs/install.html#OPAM) or your system package manager. It has
the same basic interface but is much more convenient to use (history
navigation, auto-completion, etc).

Use `;;` to indicate that you've finished entering each expression and prompt
OCaml to evaluate it. We run OCaml and evaluate a simple expression:

```console
        OCaml version {{! get LATEST_OCAML_VERSION !}}

# 50 * 50;;
- : int = 2500
```

This is how it looks using `utop`:

```console
───────┬─────────────────────────────────────────────────────────────┬────
       │ Welcome to utop version 2.7.0 (using OCaml version {{! get LATEST_OCAML_VERSION !}})! │     
       └─────────────────────────────────────────────────────────────┘     

Type #utop_help for help about using utop.

─( 10:12:16 )─< command 0 >───────────────────────────────────────────────
utop # 50 * 50;;
- : int = 2500
```

The in-browser [TryOCaml](http://try.ocamlpro.com) has a similar interface.

The examples in this tutorial can be typed in by hand, or copied into `ocaml`,
`utop` or TryOCaml with copy and paste. Alternatively, we may type into a file,
and load its contents directly with the `#use` directive:

```console
$ ocaml
        OCaml version {{! get LATEST_OCAML_VERSION !}}

# #use "program.ml"
```

Note that `#use` is not part of the OCaml language proper; it is an instruction
to the OCaml top level only.

## Expressions

Our phrase `50 * 50` was an expression, which evaluated to `2500`. OCaml told
us that the type was `int`, an integer (every expression in OCaml has a type).
To avoid repetition, we can give a name to our number:

```ocamltop
let x = 50;;
x * x;;
```

Note that this is not a variable as in languages like C and Python. Its value
cannot be changed. We can write it all in one go using `let` ... `in` ...:

```ocamltop
let x = 50 in x * x;;
```

Of course, we can have multiple names:

```ocamltop
let a = 1 in
let b = 2 in
  a + b;;
```

Note that this is still just one expression. We can define a function to do the
job for any number:

```ocamltop
let square x = x * x;;

square 50;;
```

This says that `square` is a function with one argument, namely `x`, and that
the result of the function is the result of evaluating the expression `x * x`
with the given value associated with `x`. Here is another function, this time
using the comparison operator `=` to test for even-ness:

```ocamltop
let square_is_even x =
  square x mod 2 = 0;;

square_is_even 50;;

square_is_even 3;;
```

Notice the type OCaml infers for the function.

A function may take multiple
arguments. Unlike in imperative languages, they are written without parentheses
and commas. We shall explain why later.

```ocamltop
let ordered a b c =
  a <= b && b <= c;;

ordered 1 1 2;;
```

We can work with floating-point numbers too, but we must write `+.`, for
example, instead of just `+`:

```ocamltop
let average a b =
  (a +. b) /. 2.0;;
```

This is rather unusual. In other languages (such as C) integers get promoted to
floating point values in certain circumstances. For example if you write `1 +
2.5` then the first argument (which is an integer) is promoted to a floating
point number, and the result is also a floating point number.

OCaml never does implicit casts like this. In OCaml, `1 + 2.5` is a type error.
The `+` operator in OCaml requires two integers as arguments, and here we're
giving it an integer and a floating point number, so it reports this error:

```ocamltop
1 + 2.5;;
```

OCaml doesn't promote integers to floating point numbers automatically so this
is also an error:

```ocamltop
1 +. 2.5
```

What if you actually want to add an integer and a floating point number
together? (Say they are stored as `i` and `f`). In OCaml you need to
explicitly cast:

```ocaml
float_of_int i +. f
```

The `float_of_int` function takes an `int` and returns a `float`.

You might think that these explicit casts are ugly, time-consuming even, but
there are several arguments in their favour. Firstly, OCaml needs this explicit
casting to be able to work out types automatically, which is a wonderful
time-saving feature. Secondly, if you've spent time debugging C programs you'll
know that (a) implicit casts cause errors which are hard to find, and (b) much
of the time you're sitting there trying to work out where the implicit casts
happen. Making the casts explicit helps you in debugging.  Thirdly, some casts
are actually expensive operations. We do ourselves no favours by hiding them.

## Recursive functions

A recursive function is one which uses itself in its own definition. An OCaml
function isn't recursive unless you explicitly say so by using `let rec`
instead of just `let`. Here's an example of a recursive function:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a + 1) b;;

let digits = range 0 9;;
```

We have used OCaml's `if` ... `then` ... `else` ... construct to test a
condition and choose a path of evaluation. Notice that, like everything else in
OCaml, it is an expression not a statement. The result of evaluating the whole
expression is either the result of evaluating the `then` part or the `else`
part.

The only difference between `let` and `let rec` is in the scoping of the
function name. If the above function had been defined with just `let`, then the
call to `range` would have tried to look for an existing (previously defined)
function called `range`, not the currently-being-defined function.

## Types
The basic types in OCaml are:

```text
OCaml type  Range

int         63-bit signed int on 64-bit processors, or 31-bit signed int on
            32-bit processors
float       IEEE double-precision floating point, equivalent to C's double
bool        A boolean, written either 'true' or 'false'
char        An 8-bit character
string      A string (sequence of 8 bit chars)
```

OCaml provides a `char` type which is used for simple 8-bit characters, written
`'x'` for example. There are [comprehensive Unicode
libraries](https://github.com/yoriyuki/Camomile) which provide more extensive
functionality for text management.

Strings are not just lists of characters. They have their own, more
efficient internal representation. Strings are immutable.

When we type our expressions into the OCaml top level, OCaml prints the type:

```ocamltop
1 + 2;;

1.0 +. 2.0;;

false;;

'c';;

"Help me!";;

```

Each expression has one and only one type.

OCaml works out types automatically so you will rarely need to explicitly write
down the type of your functions. However, OCaml often prints out what it infers
are the types of your functions, so you need to know the syntax. For a function
`f` which takes arguments `arg1`, `arg2`, ... `argn`, and returns type
`rettype`, the compiler will print:

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```

The arrow syntax looks strange now but later you'll see why it was chosen. Our
function `average` which takes two floats and returns a float has type:

```ocaml
average : float -> float -> float
```

The OCaml standard `int_of_char` casting function:

```ocaml
int_of_char : char -> int
```

We can now look at some of the properties which distinguish OCaml from other
languages:

- OCaml is a strongly statically typed language. This means each expression has
  a type, and only one type, and it is determined before the program is run.

- OCaml uses type inference to work out (infer) the types, so you don't have
  to. If you use the OCaml top level, then OCaml will tell you its inferred
  type for your function.

- OCaml doesn't do any implicit conversion of types. If you want a floating
  point number, you have to write `2.0` because `2` is an integer. OCaml does
  no automatic conversion between int and floats or any other type. As a
  side-effect of type inference in OCaml, functions (including operators) can't
  have overloaded definitions.

## Pattern matching

Instead of using one or more `if` ... `then` ... `else` ... constructs to make
choices in OCaml programs, we can use the `match` keyword to match on multiple
possible values. Consider the factorial function:

```ocamltop
let rec factorial n =
  if n <= 1 then 1 else n * factorial (n - 1);;
```

We may write it using pattern matching instead:

```ocamltop
let rec factorial n =
  match n with
  | 0 | 1 -> 1
  | x -> x * factorial (x - 1);;
```

Equally, we could use the pattern `_` which matches anything, and write:

```ocamltop
let rec factorial n =
  match n with
  | 0 | 1 -> 1
  | _ -> n * factorial (n - 1);;
```

In fact, we may simplify further with the `function` keyword which introduces
pattern-matching directly:

```ocamltop
let rec factorial = function
  | 0 | 1 -> 1
  | n -> n * factorial (n - 1);;
```

We will use pattern matching more extensively as we introduce more complicated
data structures.

## Lists

Lists are a common compound data type in OCaml. They are ordered collections of
elements of like type. Here are some lists:

```ocamltop
[];;

[1; 2; 3];;

[false; false; true];;

[[1; 2]; [3; 4]; [5; 6]];;
```

Each list can have a head (its first element) and a tail (the list of the rest
of its elements).  There are two built-in operators on lists. The `::` or cons
operator, adds one element to the front of a list. The `@` or append operator
combines two lists:

```ocamltop
1 :: [2; 3];;

[1] @ [2; 3];;
```

We can write functions which operate over lists by pattern matching:

```ocamltop
let rec total l =
  match l with
  | [] -> 0
  | h :: t -> h + total t;;

total [1; 3; 5; 3; 1];;
```

You can see how the pattern `h :: t` is used to deconstruct the list, naming
its head and tail. If we omit a case, OCaml will notice and warn us:

```ocamltop
let rec total l =
  match l with
  | h :: t -> h + total t;;

total [1; 3; 5; 3; 1];;
```

We shall talk about the "exception" which was caused by our ignoring the
warning later. Consider now a function to find the length of a list:

```ocamltop
let rec length l =
  match l with
  | [] -> 0
  | _ :: t -> 1 + length t;;
```

This function operates not just on lists of integers, but on any kind of list.
This is indicated by the type, which allows its input to be `'a list`
(pronounced alpha list).

```ocamltop
length [1; 2; 3];;

length ["cow"; "sheep"; "cat"];;

length [[]];;
```

Why is this? Because in the pattern `_ :: t` the head of the list is not
inspected, so its type cannot be relevant. Such a function is called
polymorphic. Here is another polymorphic function, our own version of the `@`
operator for appending:

```ocamltop
let rec append a b =
  match a with
  | [] -> b
  | h :: t -> h :: append t b;;
```

Can you see how it works? Notice that the memory for the second list is shared,
but the first list is effectively copied. Such sharing is common when we use
immutable data types (ones whose values cannot be changed).

We might wish to apply a function to each element in a list, yielding a new
one. We shall write a function `map` which is given another function as its
argument - such a function is called "higher-order":

```ocamltop
let rec map f l =
  match l with
  | [] -> []
  | h :: t -> f h :: map f t;;
```

Notice the type of the function `f` in parentheses as part of the whole type.
This `map` function, given a function of type `'a -> 'b` and a list of `'a`s,
will build a list of `'b'`s. Sometimes `'a` and `'b` might be the same type, of
course. Here are some examples of using `map`:

```ocamltop
map total [[1; 2]; [3; 4]; [5; 6]];;
map (fun x -> x * 2) [1; 2; 3];;
```

(The syntax `fun` ... `->` ... is used to build a function without a name - one
we will only use in one place in the program.)

We need not give a function all its arguments at once. This is called partial
application. For example:

```ocamltop
let add a b = a + b;;
add;;
let f = add 6;;
f 7;;
```

Look at the types of `add` and `f` to see what is going on. We can use partial
application to add to each item of a list:

```ocamltop
map (add 6) [1; 2; 3];;
```

Indeed we can use partial application of our `map` function to map over lists
of lists:

```ocamltop
map (map (fun x -> x * 2)) [[1; 2]; [3; 4]; [5; 6]];;
```

## Other built-in types

We have seen basic data types like `int`, and our first compound data type, the
list. There are two more ways compound data types of interest. First we have
tuples, which are fixed length collections of elements of any type:

```ocamltop
let t = (1, "one", '1')
```

Notice how the type is written. Records are like tuples, but they have named
elements:

```ocamltop
type person =
  {first_name : string;
   surname : string;
   age : int};;

let frank =
  {first_name = "Frank";
   surname = "Smith";
   age = 40};;

let s = frank.surname;;
```

Pattern-matching works on tuples and records too, of course.

## Our own data types

We can define new data types in OCaml with the `type` keyword:

```ocamltop
type colour = Red | Blue | Green | Yellow;;
let l = [Red; Blue; Red];;
```

Each "type constructor", which must begin with a capital letter, can optionally
carry data along with it:

```ocamltop
type colour =
  | Red
  | Blue
  | Green
  | Yellow
  | RGB of int * int * int;;
let l = [Red; Blue; RGB (30, 255, 154)];;
```

Data types may be polymorphic and recursive too. Here is an OCaml data type for
a binary tree carrying any kind of data:

```ocamltop
type 'a tree =
  | Lf
  | Br of 'a tree * 'a * 'a tree;;

let t = Br (Br (Lf, 1, Lf), 2, Br (Br (Lf, 3, Lf), 4, Lf));;
```

A `Lf` leaf holds no information, just like an empty list. A `Br` branch holds
a left tree, a value of type `'a` and a right tree. Now we can write recursive
and polymorphic functions over these trees, by pattern matching on our new
constructors:

```ocamltop
let rec total t =
  match t with
  | Lf -> 0
  | Br (l, x, r) -> total l + x + total r;;

let rec flip t =
  match t with
  | Lf -> Lf
  | Br (l, x, r) -> Br (flip r, x, flip l);;
```

Let's try our new functions out:

```ocamltop
let all = total t;;

let flipped = flip t;;

t = flip flipped;;
```

Notice that we do not need to explicitly free memory for such data structures
when we no longer need it: OCaml is a garbage-collected language, and will free
memory for data structures when they are no longer needed. In our example, once
the boolean test `t = flip flipped` has been evaluated, the data structure
`flip flipped` is not longer reachable by the rest of the program, and its
memory may be reclaimed by the garbage collector.

## Dealing with errors

OCaml deals with exceptional situations in two ways. One is to use *exceptions*,
which may be defined in roughly the same way as types:

```ocamltop
exception E;;

exception E2 of string;;
```

An exception is raised like this:

```ocamltop
let f a b =
  if b = 0 then raise (E2 "division by zero") else a / b;;
```

An exception may be handled with pattern matching:

```ocamltop
try f 10 0 with E2 _ -> 0;;
```

When an exception is not handled, it is printed at the top level:

```ocamltop
f 10 0;;
```

The other way to deal with exceptional situations in OCaml is by returning a
value of a type which can represent either the correct result or an error, for
example the built-in polymorphic `option` type, which is defined as:

```ocaml
type 'a option = None | Some of 'a
```

So we may write:

```ocamltop
let f a b =
  if b = 0 then None else Some (a / b)
```

We can use exception handling to build an option-style function from one which
raises an exception, the built-in `List.find` function (which finds the first
element matching a given boolean test):

```ocamltop
let list_find_opt p l =
  try Some (List.find p l) with
    Not_found -> None;;
```

As an alternative, we can use an extended form of our usual `match` expression,
to match both values and catch exceptions:

```ocamltop
let list_find_opt p l =
  match List.find p l with
  | v -> Some v
  | exception Not_found -> None;;
```

## Imperative OCaml

OCaml is not just a functional language: it supports imperative programming
too. OCaml programmers tend to use imperative features sparingly, but almost
all OCaml programmers use them sometimes. What happens if you want a variable
that you can assign to and change throughout your program? You need to use a
*reference*.

Here's how we create a reference to an integer in OCaml:

```ocamltop
let r = ref 0;;
```

This reference is currently storing the integer zero. Let's put something
else into it (assignment):

```ocamltop
r := 100;;
```

And let's find out what the reference contains now:

```ocamltop
!r;;
```

So the `:=` operator is used to assign to references, and the `!` operator
dereferences to get the contents.

References have their place, but you may find that you don't use them very
often. Much more often you'll be using `let` ... `=` ... `in` ... to name local
expressions in your function definitions.

We can combine multiple imperative operations with `;`. For example, here is a
function to swap the contents of two references of like type:

```ocamltop
let swap a b =
  let t = !a in
    a := !b;
    b := t;;
```

Notice the function return type is `unit`. There is exactly one thing of type
unit, and it is written `()`. We use unit to call a function which needs no
other argument, and is only used for its imperative side effect. For example:

```ocamltop
let print_number n =
  print_string (string_of_int n);
  print_newline ();;
```

We can look at the type of the built-in function `print_newline` by typing its
name without applying the unit argument:

```ocamltop
print_newline;;
```

The usual imperative looping constructs are available. Here is a `for` loop:

```ocamltop
let table n =
  for row = 1 to n do
    for column = 1 to n do
      print_string (string_of_int (row * column));
      print_string " "
    done;
    print_newline ()
  done;;

let () = table 10;;
```

Here is a `while` loop, used to write a function to calculate the power of
two larger or equal to a given number:

```ocamltop
let smallest_power_of_two x =
  let t = ref 1 in
    while !t < x do
      t := !t * 2
    done;
    !t;;
```

In addition to references, the imperative part of OCaml has arrays of items of
like type, whose elements can be accessed or updated in constant time:

```ocamltop
let arr = [|1; 2; 3|];;
arr.(0);;
arr.(0) <- 0;;
arr;;
```

Records may have mutable fields too, which must be marked in the type:

```ocamltop
type person =
  {first_name : string;
   surname : string;
   mutable age : int};;

let birthday p =
  p.age <- p.age + 1;;
```

## The Standard Library

OCaml comes with a library of useful modules which are available anywhere OCaml
is. For example there are standard libraries for functional data structures
(such as maps and sets) and imperative data structures (such as hash tables),
and for interacting with the operating system. We use them by writing the module, followed by a
full stop, followed by the name of the function. Here are some functions from
the `List` module:

```ocamltop
List.concat [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]];;
List.filter (( < ) 10) [1; 4; 20; 10; 9; 2];;
List.sort compare [1; 6; 2; 2; 3; 56; 3; 2];;
```

The `Printf` module provides type-checked printing facilities, so we know at
compile-time that the printing will work:

```ocamltop
let print_length s =
  Printf.printf "%s has %i characters\n" s (String.length s);;
 
List.iter print_length ["one"; "two"; "three"];;
```

You can find the full list of standard library modules in the
[manual](/releases/latest/manual.html).

## A module from OPAM

Apart from the standard library, a much wider range of modules are available
through the OCaml Package Manager, opam. You must have OCaml on your computer
to follow the tutorial from now on, not just TryOCaml.

For these examples we're going to use module called `Graphics` which can be
installed with `opam install graphics` and the `ocamlfind` program installed
with `opam install ocamlfind`. The `Graphics` module is a very simple
cross-platform Graphics system which was once part of OCaml itself. Now it's
available separately through OPAM.

If we want to use the functions in `Graphics` there are two ways we can
do it. Either at the start of our program we have the `open Graphics`
declaration. Or we prefix all calls to the functions like this:
`Graphics.open_graph`.

To use `Graphics` in the top level, you must first load the library with

```ocaml
# #use "topfind";;
- : unit = ()
Findlib has been successfully loaded. Additional directives:
...
  #require "package";;      to load a package
...

- : unit = ()
# #require "graphics";;
/Users/me/.opam/4.12.0/lib/graphics: added to search path
/Users/me/.opam/4.12.0/lib/graphics/graphics.cma: loaded
```

A couple of examples should make this clear. (The two examples draw different
things - try them out). Note the first example uses `open` to open the Graphics
module then calls `open_graph` and the second one uses `Graphics.open_graph`
directly.

```ocaml
open Graphics;;

open_graph " 640x480";;

for i = 12 downto 1 do
  let radius = i * 20 in
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
done;;

read_line ();;
```

```ocaml
Random.self_init ();;

Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init else
    let x = iterate r x_init (i - 1) in
      r *. x *. (1.0 -. x);;

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
      Graphics.plot x y
  done
done;;

read_line ();;
```

You should copy and paste these examples into OCaml piece by piece, each piece
being ended by a  `;;`.

## Compiling OCaml programs

So far we have been using only the OCaml top level. Now we will compile OCaml
programs into fast stand-alone executables. Consider the following program,
saved as "helloworld.ml"

```ocaml
print_endline "Hello, World!"
```

(Notice there is no need to write `;;` since we are not using the top level).
We may compile it like this:

```ocaml
ocamlopt -o helloworld helloworld.ml
```

Now our current directory has four more files. The files `helloworld.cmi`,
`helloworld.cmo`, and `helloworld.o` are left over from the compilation
process. The file `helloworld` is our executable:

```ocaml
$ ./helloworld
Hello, World!
$
```

If we have more than one file, we list them all. Here is an example, defined in
its own file `data.ml` with a corresponding `data.mli` interface, and a main
file `main.ml` which uses it.

```ocaml
data.ml:

let to_print = "Hello, World!"
```

```ocaml
data.mli:

val to_print : string
```

```ocaml
main.ml:

print_endline Data.to_print
```

We can compile it like this:

```console
ocamlopt -o main data.mli data.ml main.ml
```

Most users of OCaml do not call the compiler directly. They use one of the
[build systems](/learn/tutorials/compiling_ocaml_projects.html) to manage
compilation for them.

## Where next?

This quick tour should have given you a little taste of OCaml and why you might
like to explore it further. Elsewhere on [ocaml.org](/index.html) there are
pointers to [books on OCaml](/learn/books.html) and
[other tutorials](/learn/tutorials/index.html).
