<!-- ((! set title A first hour with OCaml  !)) ((! set learn !)) -->

*Table of contents*

# A First Hour with OCaml

You may follow along with this tutorial with just a basic OCaml installation,
as described in the [Up and Running](up_and_running.html) tutorial.

Alternatively, you may follow the first three-quarters by running OCaml in your
browser, with no installation required, thanks to
[TryOCaml](http://try.ocamlpro.com).

## Running OCaml programs

To quickly try small OCaml expressions, you can use an interactive
toplevel, or REPL (Read–Eval–Print Loop). The `ocaml` command provides
a very basic toplevel (you should install `rlwrap` through your system
package manager and run `rlwrap ocaml` to get history navigation).

The alternative REPL [utop](https://github.com/diml/utop) may be installed
through [OPAM](/docs/install.html#OPAM) or your system package manager. It has
the same basic interface but is much more convenient to use (history
navigation, auto-completion, etc.).

Use `;;` to indicate that you've finished entering each expression and prompt
OCaml to evaluate it. Here is what running `ocaml` looks like:

```console
$ ocaml
        OCaml version {{! get LATEST_OCAML_VERSION !}}

# 50 * 50;;
- : int = 2500
```

This is how it looks when using `utop`:

```console
───────┬─────────────────────────────────────────────────────────────┬────
       │ Welcome to utop version 2.7.0 (using OCaml version 4.12.0)! │     
       └─────────────────────────────────────────────────────────────┘     

Type #utop_help for help about using utop.

─( 10:12:16 )─< command 0 >───────────────────────────────────────────────
utop # 50 * 50;;
- : int = 2500
```

The in-browser [TryOCaml](http://try.ocamlpro.com) has a similar interface.

## Expressions

Our phrase `50 * 50` was an expression, which evaluated to `2`. To avoid
repetition, we can give a name to our number:

```ocamltop
let x = 50;;
x * x;;
```

Note that this is not a variable as in languages like C and Python. Its value
cannot be changed. We can write it all in one go using `let`...`in`:

```ocamltop
let x = 50 in x * x
```

```ocamltop
let a = 1 in
let b = 2 in
  a + b
```

We can define a function to do the job for any number:

```ocamltop
let square x = x * x;;

square 50;;
```

This says that `square` is a function with one argument, namely `x`, and that
the result of the function is the result of evaluating the expression `x * x`
with the given value assigned to `x`. Here is another function, this time using
the comparison operator `=` to test for even-ness:

```ocamltop
let square_is_even x =
  square x mod 2 = 0
```

A function may take multiple arguments. Unlike in imperative languages, they
are written without parentheses and commas. We shall explain why later.

```ocamltop
let ordered a b c =
  a <= b && b <= c;;
```

In general the rule is: "bracket around the whole function call — don't put
brackets around the arguments to a function call". Here are some more examples:

```ocaml
f 5 (g "hello") 3    (* f has three arguments, g has one argument *)
f (g 3 4)            (* f has one argument, g has two arguments *)
```

We can work with floating-point numbers too, but we must write `+.`, for
example, instead of just `+`:

```ocamltop
let average a b =
  (a +. b) /. 2.0
```

This is rather unusual. In C-derived languages ints get promoted to floats in
certain circumstances. For example if you write `1 + 2.5` then the first
argument (which is an integer) is promoted to a floating point number, and the
result is also a floating point number. It's as if you had written `((double)
1) + 2.5`, but all done implicitly.

OCaml never does implicit casts like this. In OCaml, `1 + 2.5` is a type
error. The `+` operator in OCaml requires two ints as arguments, and
here we're giving it an int and a float, so it reports this error:

```ocamltop
1 + 2.5;;
```

OCaml doesn't promote ints to floats automatically so this is also an
error:

```ocamltop
1 +. 2.5
```
Here OCaml is now complaining about the first argument.

What if you actually want to add an integer and a floating point number
together? (Say they are stored as `i` and `f`). In OCaml you need to
explicitly cast:

```ocaml
float_of_int i +. f
```
`float_of_int` is a function which takes an `int` and returns a `float`.

You might think that these explicit casts are ugly, time-consuming even, but
there are several arguments in their favour. Firstly, OCaml needs this explicit
casting to be able to do type inference (see below), and type inference is such
a wonderful time-saving feature that it easily offsets the extra keyboarding of
explicit casts. Secondly, if you've spent time debugging C programs you'll know
that (a) implicit casts cause errors which are hard to find, and (b) much of
the time you're sitting there trying to work out where the implicit casts
happen. Making the casts explicit helps you in debugging.  Thirdly, some casts
(particularly int <-> float) are actually very expensive operations. We do
ourselves no favours by hiding them.

## Recursive functions

An OCaml function isn't recursive unless you explicitly say so by using `let
rec` instead of just `let`. Here's an example of a recursive function:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a + 1) b;;
```

We have used OCaml's `if` ... `then` ... `else` ... construct. Notice that,
like everything else in OCaml, it is an expression not a statement. The result
of evaluating the whole expression is either the result of evaluating the
`then` part or the `else` part. 

The only difference between `let` and `let rec` is in the scoping of the
function name. If the above function had been defined with just `let`,
then the call to `range` would have tried to look for an existing
(previously defined) function called `range`, not the
currently-being-defined function.

## Types
The basic types in OCaml are:

```text
OCaml type  Range

int         63-bit signed int 64-bit processors, or 31-bit signed int on
            32-bit processors
float       IEEE double-precision floating point, equivalent to C's double
bool        A boolean, written either 'true' or 'false'
char        An 8-bit character
string      A string
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
1.0 + 2.0;;
false;;
'c';;
"Help me!";;
```

Each expression has one and only one type.

## Types of functions
Because of type inference you will rarely if ever need to explicitly
write down the type of your functions. However, OCaml often prints out
what it infers are the types of your functions, so you need to know the
syntax. For a function `f` which takes arguments `arg1`,
`arg2`, ... `argn`, and returns type `rettype`, the compiler will print:

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```
The arrow syntax looks strange now, but when we come to so-called
"currying" later you'll see why it was chosen. For now I'll just give
you some examples.

Our function `average` which takes two floats and returns a float has
type:

```ocaml
average : float -> float -> float
```
The OCaml standard `int_of_char` casting function:

```ocaml
int_of_char : char -> int
```

What does this tell us?

- OCaml is a strongly statically typed language. This means each expression has a
type, and only one type.

- OCaml uses so-called type inference to work out (infer) the types, so you don't
have to.  If you use the OCaml top level, then OCaml will tell you its inferred
type for your function.

- OCaml doesn't do any implicit casting. If you want a float, you have
 to write `2.0` because `2` is an integer. OCaml does no automatic
 conversion between int and floats or any other type.

- As a side-effect of type inference in OCaml, functions (including
 operators) can't have overloaded definitions.


(* CHAPTER 4 / 5 LISTS GOES HERE so we can then discuss polymorphism *)

###  Polymorphic functions
Now for something a bit stranger. What about a function which takes
*anything* as an argument? Here's an odd function which takes an
argument, but just ignores it and always returns 3:

```ocaml
let give_me_a_three x = 3
```
What is the type of this function? In OCaml we use a special placeholder
to mean "any type you fancy". It's a single quote character followed by
a letter. The type of the above function would normally be written:

```ocaml
give_me_a_three : 'a -> int
```
where `'a` (pronounced alpha) really does mean any type. You can, for example, call this
function as `give_me_a_three "foo"` or `give_me_a_three 2.0` and both
are quite valid expressions in OCaml.

It won't be clear yet why polymorphic functions are useful, but they are
very useful and very common, and so we'll discuss them later on. (Hint:
polymorphism is kind of like templates in C++ or generics in Java).

(* MENTION NESTED FUNCTIONS *)
(* HIGHER ORDER FUNCTIONS *)

### Type inference
So the theme of this tutorial is that functional languages have many
really cool features, and OCaml is a language which has all of these
really cool features stuffed into it at once, thus making it a very
practical language for real programmers to use. But the odd thing is
that most of these cool features have nothing to do with "functional
programming" at all. In fact, I've come to the first really cool
feature, and I still haven't talked about why functional programming is
called "functional". Anyway, here's the first really cool feature: type
inference.

Simply put: you don't need to declare the types of your functions and
variables, because OCaml will just figure them out for you!

In addition OCaml goes on to check all your types match up (even across
different files).

But OCaml is also a practical language, and for this reason it contains
backdoors into the type system allowing you to bypass this checking on
the rare occasions that it is sensible to do this. Only gurus will
probably need to bypass the type checking.

Let's go back to the `average` function which we typed into the OCaml
interactive toplevel:

```ocamltop
let average a b =
  (a +. b) /. 2.0
```
OCaml worked out all on its own that the function takes
two `float` arguments and returns a `float`!

How did it do this? Firstly it looks at where `a` and `b` are used,
namely in the expression `(a +. b)`. Now, `+.` is itself a function
which always takes two `float` arguments, so by simple deduction, `a`
and `b` must both also have type `float`.

Secondly, the `/.` function returns a `float`, and this is the same as
the return value of the `average` function, so `average` must return a
`float`. The conclusion is that `average` has this type signature:

```ocaml
average : float -> float -> float
```
Type inference is obviously easy for such a short program, but it works
even for large programs, and it's a major time-saving feature because it
removes a whole class of errors which cause segfaults,
`NullPointerException`s and `ClassCastException`s in other languages (or
important but often ignored runtime warnings).

(* FUN WITH TREES (Chap. 11) *)



## Modules
OCaml comes with lots of fun and interesting modules (libraries of
useful code). For example there are standard libraries for drawing
graphics, interfacing with GUI widget sets, handling large numbers, data
structures, and making POSIX system calls. These libraries are located
in `/usr/lib/ocaml/` (on Unix anyway).

For these examples we're going to use module called `Graphics` which can be
installed with `opam install graphics` and the `ocamlfind` program installed
with `opam install ocamlfind`.

If we want to use the functions in `Graphics` there are two ways we can
do it. Either at the start of our program we have the `open Graphics;;`
declaration. Or we prefix all calls to the functions like this:
`Graphics.open_graph`. `open` is a little bit like Java's `import`
statement.

To use `Graphics` in the [interactive toplevel](basics.html), you must
first load the
library with

```ocaml
# #use "topfind";;
- : unit = ()
Findlib has been successfully loaded. Additional directives:
  #require "package";;      to load a package

- : unit = ()
# #require "graphics";;
/Users/me/.opam/4.12.0/lib/graphics: added to search path
/Users/me/.opam/4.12.0/lib/graphics/graphics.cma: loaded
```

A couple of examples should make this clear. (The two examples draw
different things - try them out). Note the first example calls
`open_graph` and the second one `Graphics.open_graph`.

```ocaml
open Graphics

open_graph " 640x480"

for i = 12 downto 1 do
  let radius = i * 20 in
    set_color (if i mod 2 = 0 then red else yellow);
    fill_circle 320 240 radius
done;;

read_line ()
```

```ocaml
Random.self_init ()

Graphics.open_graph " 640x480"

let rec iterate r x_init i =
  if i = 1 then x_init else
    let x = iterate r x_init (i - 1) in
      r *. x *. (1.0 -. x)

for x = 0 to 639 do
  let r = 4.0 *. (float_of_int x) /. 640.0 in
  for i = 0 to 39 do
    let x_init = Random.float 1.0 in
    let x_final = iterate r x_init 500 in
    let y = int_of_float (x_final *. 480.) in
      Graphics.plot x y
  done
done

read_line ()
```
Both of these examples make use of some features we haven't talked about
yet: imperative-style for-loops, if-then-else and recursion. We'll talk
about those later. Nevertheless you should look at these programs and
try and find out (1) how they work, and (2) how type inference is
helping you to eliminate bugs.

(* USING THE STANDARD LIBRARY EXAMPLES *)

### The `Stdlib` module
There's one module that you never need to "`open`". That is the
`Stdlib` module. All of the symbols from the `Stdlib` module are automatically
imported into every OCaml program.

### Renaming modules
What happens if you want to use symbols in the `Graphics` module, but
you don't want to import all of them and you can't be bothered to type
`Graphics` each time? Just rename it like this:

```ocaml
module Gr = Graphics

Gr.open_graph " 640x480"

Gr.fill_circle 320 240 240

read_line ()
```
Actually this is really useful when you want to import a nested module
(modules can be nested inside one another), but you don't want to type
out the full path to the nested module name each time.

## Imperative OCaml
What happens if you want a real variable that you can assign to and
change throughout your program? You need to use a **reference**.
References are very similar to pointers in C/C++. In Java, all variables
which store objects are really references (pointers) to the objects.

Here's how we create a reference to an `int` in OCaml:

```ocamltop
ref 0;;
```
Actually that statement wasn't really very useful. We created the
reference and then, because we didn't name it, the garbage collector
came along and collected it immediately afterwards! (actually, it was
probably thrown away at compile-time.) Let's name the reference:

```ocamltop
let my_ref = ref 0;;
```
This reference is currently storing a zero integer. Let's put something
else into it (assignment):

```ocamltop
my_ref := 100;;
```
And let's find out what the reference contains now:

```ocamltop
!my_ref;;
```
So the `:=` operator is used to assign to references, and the `!`
operator dereferences to get out the contents. Here's a rough-and-ready
comparison with C/C++:

OCaml
```ocamltop
let my_ref = ref 0;;
my_ref := 100;;
!my_ref
```

C/C++
```C
int a = 0; int *my_ptr = &a;
*my_ptr = 100;
*my_ptr;
```
References have their place, but you may find that you don't use
references very often. Much more often you'll be using
`let name = expression in` to name local expressions in your function
definitions.

### One thing after another

The semi-colon `;` is an operator, just like `+` is. Well, not quite just like
`+` is, but conceptually the same. The operator `+` has type `int -> int -> int` —
it takes two ints and returns an int (the sum). The semi-colon `;` may
be seen as having type
`unit -> 'b -> 'b` — it takes two values and simply returns the second
one, the first expression is guaranteed to be evaluated before the
second.  Rather like C's `,` (comma) operator. You can write
`a; b; c; d` just as easily as you can write `a + b + c + d`.

This is one of those "mental leaps" which is never spelled out very
well — in OCaml, nearly everything is an expression. `if/then/else` is
an expression. `a; b` is an expression. `match foo with ...` is an
expression. The following code is perfectly legal (and all do the same
thing):

 ```ocamltop
 let f x b y = if b then x + y else x + 0
 let f x b y = x + (if b then y else 0)
 let f x b y = x + (match b with true -> y | false -> 0)
 let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
 let f = fun x -> fun b -> fun y -> if b then x + y else x + 0
 let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
```

Note especially the last one — I'm using `;` as an operator to "join"
two statements. All functions in OCaml can be expressed as:

```ocaml
 let name [parameters] = expression
```
OCaml's definition of what is an expression is just a little wider
than C's. In fact, C has the concept of "statements" — but all of C's
statements are just expressions in OCaml of type `unit` (combined with the `;`
operator).

The one place that `;` is different from `+` is that I can refer to
`+` just like a function. For instance, I can define a `sum_list`
function, to sum a list of ints, like:

```ocamltop
let sum_list = List.fold_left ( + ) 0;;
```

(* COMPILING OCAML LAST QUARTER GOES HERE *)

## Compiling OCaml programs

This is a reference to the standard **filenames** and extensions used by
various parts of the OCaml build system.

### Source and object files
The basic source, object and binary files, with comparisons to C
programming:



<table>
<thead>
<tr class="header">
<th align="left">Purpose</th>
<th align="left">C</th>
<th align="left">Bytecode</th>
<th align="left">Native code</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Source code</td>
<td align="left">*.c</td>
<td align="left">*.ml</td>
<td align="left">*.ml</td>
</tr>
<tr class="even">
<td align="left">Header files<sup>1</sup></td>
<td align="left">*.h</td>
<td align="left">*.mli</td>
<td align="left">*.mli</td>
</tr>
<tr class="odd">
<td align="left">Object files</td>
<td align="left">*.o</td>
<td align="left">*.cmo</td>
<td align="left">*.cmx<sup>2</sup></td>
</tr>
<tr class="even">
<td align="left">Library files</td>
<td align="left">*.a</td>
<td align="left">*.cma</td>
<td align="left">*.cmxa<sup>3</sup></td>
</tr>
<tr class="odd">
<td align="left">Binary programs</td>
<td align="left">prog</td>
<td align="left">prog</td>
<td align="left">prog.opt<sup>4</sup></td>
</tr>
</tbody>
</table>


Notes

1. In C the header files describe the functions, etc., but only by
 convention. In OCaml, the *.mli file is the exported signature of
 the [module](modules.html "modules"), and the compiler strictly
 enforces it.<br />
 In most cases for a module called `Foo` you will find two files:
 `foo.ml` and `foo.mli`. `foo.ml` is the implementation and `foo.mli`
 is the interface or signature.<br />
 Notice also that the first letter of the file is turned to
 uppercase to get the module name. For example, Extlib contains a
 file called `uTF8.mli` which is the signature of a module called
 `UTF8`.
1. There is also a corresponding *.o file which contains the actual
 machine code, but you can usually ignore this file.
1. There is also a corresponding *.a file which contains the actual
 machine code, but you can usually ignore this file.
1. This is the convention often used by OCaml programs, but in fact you
 can name binary programs however you want.

`*.cmi` files are intermediate files which are compiled forms of the
`.mli` (interface or "header file").

To produce them, just compile the `.mli` file:

```
ocamlc -c foo.mli
```
