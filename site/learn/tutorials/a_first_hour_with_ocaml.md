<!-- ((! set title A first hour with OCaml  !)) ((! set learn !)) -->

*Table of contents*

# A First Hour with OCaml

## Running OCaml code

The easiest way to get started is to run an interactive session in
your browser thanks to [TryOCaml](http://try.ocamlpro.com).

To install OCaml on your computer, see the [Install](/docs/install.html) documentation.

To quickly try small OCaml expressions, you can use an interactive
toplevel, or REPL (Read–Eval–Print Loop). The `ocaml` command provides
a very basic toplevel (you should install `rlwrap` through your system
package manager and run `rlwrap ocaml` to get history navigation).

The recommended alternative REPL [utop](https://github.com/diml/utop) may be
installed through [OPAM](/docs/install.html#OPAM) or your system package
manager. It has the same basic interface but is much more convenient to use
(history navigation, auto-completion, etc.).

Use `;;` to indicate that you've finished entering each expression and prompt OCaml to evaluate it. Here is what running `ocaml` looks like:
```console
$ ocaml
        OCaml version {{! get LATEST_OCAML_VERSION !}}

# 1 + 1;;
- : int = 2
```

This is how running the same code looks when using `utop`:

```console
───────┬─────────────────────────────────────────────────────────────┬────
       │ Welcome to utop version 2.7.0 (using OCaml version 4.12.0)! │     
       └─────────────────────────────────────────────────────────────┘     

Type #utop_help for help about using utop.

─( 10:12:16 )─< command 0 >───────────────────────────────────────────────
utop # 1 + 1;;
- : int = 2
```

## Comments
OCaml comments are delimited by `(*` and `*)`, like this:

```ocaml
(* This is a single-line comment. *)

(* This is a
   multi-line
   comment.
*)
```
In other words, the commenting convention is very similar to original C
(`/* ... */`). There is no single-line comment syntax (like
`# ...` in Python or `// ...` in C99/C++/Java).

OCaml counts nested `(* ... *)` blocks, and this allows you to comment
out regions of code very easily:

```ocaml
(* This code is broken ...

(* Primality test. *)
let is_prime n =
  (* note to self: ask about this on the mailing lists *) XXX;;

*)
```

## Calling functions
Let's say you've written a function — we'll call it `repeated` — which
takes a string `s` and a number `n`, and returns a new string which
contains original `s` repeated `n` times.

In most C-derived languages a call to this function will look like this:

```C
repeated ("hello", 3)  /* this is C code */
```
This means "call the function `repeated` with two arguments, first
argument the string hello and second argument the number 3".

OCaml, in common with other functional languages, writes and brackets
function calls differently, and this is the cause of many mistakes. Here
is the same function call in OCaml:

```ocaml
repeated "hello" 3  (* this is OCaml code *)
```
Note — **no** brackets, and **no** comma between the arguments.

The syntax `repeated ("hello", 3)` **is** meaningful in OCaml. It means
"call the function `repeated` with ONE argument, that argument being a
'pair' structure of two elements". Of course that would be a mistake,
because the `repeated` function is expecting two arguments, not one, and
the first argument should be a string, not a pair. But let's not worry
about pairs ("tuples") just yet. Instead, just remember that it's a
mistake to put the brackets and commas in around function call
arguments.

Let's have another function — `prompt_string` — which takes a string to
prompt and returns the string entered by the user. We want to pass this
string into `repeated`. Here are the C and OCaml versions:

```C
/* C code: */
repeated (prompt_string ("Name please: "), 3)
```

```ocaml
(* OCaml code: *)
repeated (prompt_string "Name please: ") 3
```
Take a careful look at the bracketing and the missing comma. In the
OCaml version, the brackets enclose the first argument of repeated
because that argument is the result of another function call. In general
the rule is: "bracket around the whole function call — don't put
brackets around the arguments to a function call". Here are some more
examples:

```ocaml
f 5 (g "hello") 3    (* f has three arguments, g has one argument *)
f (g 3 4)            (* f has one argument, g has two arguments *)
```

<div media:type="text/omd" style="display: none">

```ocamltop
let repeated (s : string) (i : int) =
  failwith "implementation not given"
```

</div>

```ocamltop
repeated ("hello", 3)     (* OCaml will spot the mistake *)
```

## Defining a function
We all know how to define a function (or static method, in Java)
in our existing languages. How do we do it in OCaml?

The OCaml syntax is pleasantly concise. Here's a function which takes
two floating point numbers and calculates the average:

```ocaml
let average a b =
  (a +. b) /. 2.0
```
Type this into the OCaml interactive toplevel (on Unix, type the command `ocaml`
from the shell) and you'll see this:

```ocamltop
let average a b =
  (a +. b) /. 2.0;;
```
If you look at the function definition closely, and also at what OCaml
prints back at you, you'll have a number of questions:

* What are those periods in `+.` and `/.` for?
* What does `float -> float -> float` mean?

I'll answer those questions in the next sections, but first I want to go
and define the same function in C (the Java definition would be fairly
similar to C), and hopefully that should raise even more questions.
Here's our C version of `average`:

```C
double average (double a, double b)
{
  return (a + b) / 2;
}
```
Now look at our much shorter OCaml definition above. Hopefully you'll be
asking:

* Why don't we have to define the types of `a` and `b` in the OCaml
 version? How does OCaml know what the types are (indeed, *does*
 OCaml know what the types are, or is OCaml completely dynamically
 typed?).
* In C, the `2` is implicitly converted into a `double`, can't OCaml
 do the same thing?
* What is the OCaml way to write `return`?

OK, let's get some answers.

* OCaml is a strongly *statically typed* language (in other words,
 there's nothing dynamic going on between int, float and string).
* OCaml uses *type inference* to work out the types, so you don't have
 to.  If you use the OCaml interactive toplevel as above, then OCaml
 will tell you
 its inferred type for your function.
* OCaml doesn't do any implicit casting. If you want a float, you have
 to write `2.0` because `2` is an integer. OCaml does **no automatic
 conversion** between int, float, string or any other type.
* As a side-effect of type inference in OCaml, functions (including
 operators) can't have overloaded definitions. OCaml defines `+` as
 the *integer* addition function. To add floats, use `+.` (note the
 trailing period). Similarly, use `-.`, `*.`, `/.` for other float
 operations.
* OCaml doesn't have a `return` keyword — the last expression in a
 function becomes the result of the function automatically.

We will present more details in the following sections and chapters.

## Basic types
The basic types in OCaml are:

```text
OCaml type  Range

int         31-bit signed int (roughly +/- 1 billion) on 32-bit
            processors, or 63-bit signed int on 64-bit processors
float       IEEE double-precision floating point, equivalent to C's double
bool        A boolean, written either 'true' or 'false'
char        An 8-bit character
string      A string
unit        Written as ()
```

OCaml uses one of the bits in an `int` internally in order to be able to
automatically manage the memory use (garbage collection). This is why
the basic `int` is 31 bits, not 32 bits (63 bits if you're using a 64
bit platform). In practice this isn't an issue except in a few
specialised cases. For example if you're counting things in a loop, then
OCaml limits you to counting up to 1 billion instead of 2 billion. However if you need to do things
such as processing 32 bit types (eg. you're writing crypto code or a
network stack), OCaml provides a `nativeint` type which matches the
native integer type for your platform.

OCaml doesn't have a basic unsigned integer type, but you can get the
same effect using `nativeint`. OCaml doesn't have built-in single-precision 
floating point numbers.

OCaml provides a `char` type which is used for characters, written `'x'`
for example. Unfortunately the `char` type does not support Unicode or
UTF-8, There are [comprehensive Unicode libraries](https://github.com/yoriyuki/Camomile)
which provide this functionality.

Strings are not just lists of characters. They have their own, more
efficient internal representation. Strings are immutable.

The `unit` type is sort of like `void` in C, but we'll talk about it
more below.

## Implicit vs. explicit casts
In C-derived languages ints get promoted to floats in certain
circumstances. For example if you write `1 + 2.5` then the first
argument (which is an integer) is promoted to a floating point number,
and the result is also a floating point number. It's as if you had
written `((double) 1) + 2.5`, but all done implicitly.

OCaml never does implicit casts like this. In OCaml, `1 + 2.5` is a type
error. The `+` operator in OCaml requires two ints as arguments, and
here we're giving it an int and a float, so it reports this error:

```ocamltop
1 + 2.5;;
```
To add two floats together you need to use a different operator, `+.`
(note the trailing period).

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
There are a whole load of these functions, called such things as
`int_of_float`, `char_of_int`, `int_of_char`, `string_of_int` and so on,
and they mostly do what you expect.

Since converting an `int` to a `float` is a particularly common
operation, the `float_of_int` function has a shorter alias: the above
example could simply have been written

```ocaml
float i +. f
```
(Note that it is perfectly valid in OCaml for a type and a
function to have the same name.)

###  Is implicit or explicit casting better?
You might think that these explicit casts are ugly, time-consuming even,
and you have a point, but there are at least two arguments in their
favour. Firstly, OCaml needs this explicit casting to be able to do type
inference (see below), and type inference is such a wonderful
time-saving feature that it easily offsets the extra keyboarding of
explicit casts. Secondly, if you've spent time debugging C programs
you'll know that (a) implicit casts cause errors which are hard to find,
and (b) much of the time you're sitting there trying to work out where
the implicit casts happen. Making the casts explicit helps you in
debugging. Thirdly, some casts (particularly int <-> float) are
actually very expensive operations. You do yourself no favours by hiding
them.

## Ordinary functions and recursive functions
Unlike in C-derived languages, a function isn't recursive unless you
explicitly say so by using `let rec` instead of just `let`. Here's an
example of a recursive function:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a + 1) b
```
Notice that `range` calls itself.

The only difference between `let` and `let rec` is in the scoping of the
function name. If the above function had been defined with just `let`,
then the call to `range` would have tried to look for an existing
(previously defined) function called `range`, not the
currently-being-defined function. Using `let` (without `rec`) allows you
to re-define a value in terms of the previous definition. For example:

```ocamltop
let positive_sum a b = 
  let a = max a 0
  and b = max b 0 in
    a + b
```
This redefinition hides the previous "bindings" of `a` and `b` from the
function definition. In some situations coders prefer this pattern to
using a new variable name (`let a_pos = max a 0`) as it makes the old
binding inaccessible, so that only the latest values of `a` and `b` are
accessible.

There is no performance difference between functions defined using `let`
and functions defined using `let rec`, so if you prefer you could always
use the `let rec` form and get the same semantics as C-like languages.

## Types of functions
Because of type inference you will rarely if ever need to explicitly
write down the type of your functions. However, OCaml often prints out
what it thinks are the types of your functions, so you need to know the
syntax for this. For a function `f` which takes arguments `arg1`,
`arg2`, ... `argn`, and returns type `rettype`, the compiler will print:

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```
The arrow syntax looks strange now, but when we come to so-called
"currying" later you'll see why it was chosen. For now I'll just give
you some examples.

Our function `repeated` which takes a string and an integer and returns
a string has type:

```ocaml
repeated : string -> int -> string
```
Our function `average` which takes two floats and returns a float has
type:

```ocaml
average : float -> float -> float
```
The OCaml standard `int_of_char` casting function:

```ocaml
int_of_char : char -> int
```
If a function returns nothing (`void` for C and Java programmers), then
we write that it returns the `unit` type. Here, for instance, is the
OCaml equivalent of C's _[fputc(3)](https://pubs.opengroup.org/onlinepubs/009695399/functions/fputc.html)_:

```ocaml
output_char : out_channel -> char -> unit
```

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

## Type inference
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


[utop]: https://github.com/diml/utop


Now we're going to take some time out to take a high-level look at some
real OCaml programs. I want to teach you about local and global
definitions, modules, nested functions, and
references. For this we're going to look at a lot of OCaml concepts
which won't yet make sense because we haven't seen them before. Don't
worry about the details for the moment. Concentrate instead on the
overall shape of the programs and the features which I'll point out.

##  Local "variables" (*really* local expressions)
Let's take the `average` function and add a local variable in C.
(Compare it to the first definition we had above).

```C
double average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
```
Now let's do the same to our OCaml version:

```ocamltop
let average a b =
  let sum = a +. b in
    sum /. 2.0;;
```
The standard phrase `let name = expression in` is used to define a named
local expression, and `name` can then be used later on in the function
instead of `expression`.

Now comparing C local variables and these named local expressions is a
sleight of hand. In fact they are somewhat different. The C variable
`sum` has a slot allocated for it on the stack. You can assign to `sum`
later in the function if you want, or even take the address of `sum`.
This is NOT true for the OCaml version. In the OCaml version, `sum` is
just a shorthand name for the expression `a +. b`. There is no way to
assign to `sum` or change its value in any way. (We'll see how you can
do variables whose value changes in a minute).

Here's another example to make this clearer. The following two code
snippets should return the same value (namely (a + b) +
(a + b)²):

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2.;;
```

```ocamltop
let f a b =
  let x = a +. b in
  x +. x ** 2.;;
```

The second version might be faster (but most compilers ought to be able
to perform this step of "common subexpression elimination" for you), and
it is certainly easier to read. `x` in the second example is just
shorthand for `a +. b`.

##  Global "variables" (*really* global expressions)
You can also define global names for things at the top level, and as
with our local "variables" above, these aren't really variable at all,
just shorthand names for things. Here's a real (but cut-down) example:

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content

let menu_bold () =
  match bold_button#active with
  | true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()

let main () =
  (* code omitted *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
```

In this real piece of code, `html` is an HTML editing widget (an object
from the lablgtk library) which is created once at the beginning of the
program by the first `let html =` statement. It is then referred to in
several later functions.

Note that the `html` name in the code snippet above shouldn't really be
compared to a real global variable as in C or other imperative
languages. There is no space allocated to "store" the "`html` pointer".
Nor is it possible to assign anything to `html`, for example to reassign
it to point to a different widget. In the next section we'll talk about
references, which are real variables.

## Let-bindings
Any use of `let ...`, whether at the top level (globally) or within a
function, is often called a **let-binding**.

## References: real variables
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

## Nested functions
C doesn't really have a concept of nested functions. GCC supports nested
functions for C programs but I don't know of any program which actually
uses this extension. Anyway, here's what the gcc info page has to say
about nested functions:

A "nested function" is a function defined inside another function.
(Nested functions are not supported for GNU C++.) The nested function's
name is local to the block where it is defined. For example, here we
define a nested function named 'square', and call it twice:

```C
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
```

The nested function can access all the variables of the containing
function that are visible at the point of its definition. This is called
"lexical scoping". For example, here we show a nested function which
uses an inherited variable named `offset`:

```C
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i < size; i++)
    /* ... */ access (array, i) /* ... */
}
```
You get the idea. Nested functions are, however, very useful and very
heavily used in OCaml. Here is an example of a nested function from some
real code:

```ocamltop
let read_whole_channel chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let newline = input_line chan in
      Buffer.add_string buf newline;
      Buffer.add_char buf '\n';
      loop ()
  in
    try
      loop ()
    with
      End_of_file -> Buffer.contents buf;;
```
Don't worry about what this code does - it contains many concepts which
haven't been discussed in this tutorial yet. Concentrate instead on the
central nested function called `loop` which takes just a unit argument.
You can call `loop ()` from within the function `read_whole_channel`,
but it's not defined outside this function. The nested function can
access variables defined in the main function (here `loop` accesses the
local names `buf` and `chan`).

The form for nested functions is the same as for local named
expressions: `let name arguments = function-definition in`.

You normally indent the function definition on a new line as in the
example above, and remember to use `let rec` instead of `let` if your
function is recursive (as it is in that example).

## Modules and `open`
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

## The `Stdlib` module
There's one module that you never need to "`open`". That is the
`Stdlib` module. All of the symbols from the `Stdlib` module are automatically
imported into every OCaml program.

## Renaming modules
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

## The sequence operator `;`

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

## Putting it all together: some real code
In this section we're going to show some real code fragments from the
lablgtk 1.2 library. (Lablgtk is the OCaml interface to the native Unix
Gtk widget library). A word of warning: these fragments contain a lot of
ideas which we haven't discussed yet. Don't look at the details, look
instead at the overall shape of the code, where they used `open`, how they indented the
code, how they used local and global named expressions.

... However, I'll give you some clues so you don't get totally lost!

* `?foo` and `~foo` is OCaml's way of doing optional and named
 arguments to functions. There is no real parallel to this in
 C-derived languages, but Python and Smalltalk all have this
 concept that you can name the arguments in a function call, omit
 some of them, and supply the others in any order you like.
* `foo#bar` is a method invocation (calling a method called `bar` on
 an object called `foo`). It's similar to `foo->bar` or `foo.bar` in
 C++ or Java respectively.

First snippet: The programmer opens a couple of standard libraries.
They then create a function called `file_dialog`. Inside
this function they define a named expression called `sel` using a
two-line `let sel = ... in` statement. Then they call several methods on
`sel`.

```ocaml
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename ()
  in
    sel#cancel_button#connect#clicked ~callback:sel#destroy;
    sel#ok_button#connect#clicked ~callback:do_ok;
    sel#show ()
```

Second snippet: Just a long list of global names at the top level.
Notice that the author elided every single one of the `;;` because of
Rule #2.

```ocaml
(* Second snippet *)
let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu "File"
let edit_menu = factory#add_submenu "Edit"

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
```

Third snippet: The author imports all the symbols from the `GdkKeysyms`
module. Now we have an unusual let-binding. `let _ = expression` means
"calculate the value of the expression (with all the side-effects that
may entail), but throw away the result". In this case, "calculate the
value of the expression" means to run `Main.main ()` which is Gtk's main
loop, which has the side-effect of popping the window onto the screen
and running the whole application. The "result" of `Main.main ()` is
insignificant - probably a `unit` return value, but I haven't checked -
and it doesn't get returned until the application finally exits.

Notice in this snippet how we have a long series of essentially
procedural commands. This is really a classic imperative program.

```ocaml
(* Third snippet *)
open GdkKeysyms

let _ =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
  factory#add_item "Save" ~key:_S ~callback:editor#save_file;
  factory#add_item "Save as..." ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item "Word wrap" ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev ->
      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
```
