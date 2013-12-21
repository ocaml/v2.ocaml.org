<!-- ((! set title The Structure of OCaml Programs !)) ((! set learn !)) -->

*Table of contents*

# The Structure of OCaml Programs

## The structure of OCaml programs
Now we're going to take some time out to take a high-level look at some
real OCaml programs. I want to teach you about local and global
definitions, when to use `;;` vs. `;`, modules, nested functions, and
references. For this we're going to look at a lot of OCaml concepts
which won't yet make sense because we haven't seen them before. Don't
worry about the details for the moment. Concentrate instead on the
overall shape of the programs and the features which I'll point out.

###  Local "variables" (*really* local expressions)
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
instead of `expression`, till a `;;` which ends the block of code.
Notice that we don't indent after the `in`. Just think of `let ... in`
as if it were a statement.

Now comparing C local variables and these named local expressions is a
sleight of hand. In fact they are somewhat different. The C variable
`sum` has a slot allocated for it on the stack. You can assign to `sum`
later in the function if you want, or even take the address of `sum`.
This is NOT true for the OCaml version. In the OCaml version, `sum` is
just a shorthand name for the expression `a +. b`. There is no way to
assign to `sum` or change its value in any way. (We'll see how you can
do variables whose value changes in a minute).

Here's another example to make this clearer. The following two code
snippets should return the same value (namely (a+b) +
(a+b)²):

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;

let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
```

The second version might be faster (but most compilers ought to be able
to perform this step of "common subexpression elimination" for you), and
it is certainly easier to read. `x` in the second example is just
shorthand for `a +. b`.

###  Global "variables" (*really* global expressions)
You can also define global names for things at the top level, and as
with our local "variables" above, these aren't really variable at all,
just shorthand names for things. Here's a real (but cut-down) example:

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
  | true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
  ;;
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

###  Let-bindings
Any use of `let ...`, whether at the top level (globally) or within a
function, is often called a **let-binding**.

###  References: real variables
What happens if you want a real variable that you can assign to and
change throughout your program? You need to use a **reference**.
References are very similar to pointers in C/C++. In Java, all variables
which store objects are really references (pointers) to the objects. In
Perl, references are references - the same thing as in OCaml.

Here's how we create a reference to an `int` in OCaml:

```ocamltop
ref 0;;
```
Actually that statement wasn't really very useful. We created the
reference and then, because we didn't name it, the garbage collector
came along and collected it immediately afterwards! (actually, it was
probably thrown away at compile-time.) Let's name the reference:

```ocamltop
let my_ref = ref 0
```
This reference is currently storing a zero integer. Let's put something
else into it (assignment):

```ocamltop
my_ref := 100
```
And let's find out what the reference contains now:

```ocamltop
!my_ref
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
*my_ptr
```
References have their place, but you may find that you don't use
references very often. Much more often you'll be using
`let name = expression in` to name local expressions in your function
definitions.

###  Nested functions
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

###  Modules and `open`
OCaml comes with lots of fun and interesting modules (libraries of
useful code). For example there are standard libraries for drawing
graphics, interfacing with GUI widget sets, handling large numbers, data
structures, and making POSIX system calls. These libraries are located
in `/usr/lib/ocaml/` (on Unix anyway). For these examples we're
going to concentrate on one quite simple module called `Graphics`.

The `Graphics` module is installed into 7 files (on my system):

```
/usr/lib/ocaml/graphics.a
/usr/lib/ocaml/graphics.cma
/usr/lib/ocaml/graphics.cmi
/usr/lib/ocaml/graphics.cmx
/usr/lib/ocaml/graphics.cmxa
/usr/lib/ocaml/graphics.cmxs
/usr/lib/ocaml/graphics.mli
```
For the moment let's just concentrate on the file `graphics.mli`. This
is a text file, so you can read it now. Notice first of all that the
name is `graphics.mli` and not `Graphics.mli`. OCaml always capitalizes
the first letter of the file name to get the module name. This can be
very confusing until you know about it!

If we want to use the functions in `Graphics` there are two ways we can
do it. Either at the start of our program we have the `open Graphics;;`
declaration. Or we prefix all calls to the functions like this:
`Graphics.open_graph`. `open` is a little bit like Java's `import`
statement, and much more like Perl's `use` statement.

To use `Graphics` in the interactive toplevel, you must first first
load the library with

```ocaml
#load "graphics.cma";;
```
Windows users: For this example to work interactively on Windows, you
will need to create a custom toplevel. Issue the command `ocamlmktop
-o ocaml-graphics graphics.cma` from the command line.
<!-- FIXME: is this last remark still true? -->

A couple of examples should make this clear. (The two examples draw
different things - try them out). Note the first example calls
`open_graph` and the second one `Graphics.open_graph`.

```ocaml
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)
open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if i mod 2 = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;

(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
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
Both of these examples make use of some features we haven't talked about
yet: imperative-style for-loops, if-then-else and recursion. We'll talk
about those later. Nevertheless you should look at these programs and
try and find out (1) how they work, and (2) how type inference is
helping you to eliminate bugs.

###  The `Pervasives` module
There's one module that you never need to "`open`". That is the
`Pervasives` module (go and read `/usr/lib/ocaml/3.08/pervasives.mli`
now). All of the symbols from the `Pervasives` module are automatically
imported into every OCaml program.

###  Renaming modules
What happens if you want to use symbols in the `Graphics` module, but
you don't want to import all of them and you can't be bothered to type
`Graphics` each time? Just rename it using this trick:

```ocaml
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
```
Actually this is really useful when you want to import a nested module
(modules can be nested inside one another), but you don't want to type
out the full path to the nested module name each time.

###  Using and omitting `;;` and `;`
Now we're going to look at a very important issue. When should you use
`;;`, when should you use `;`, and when should you use none of these at
all? This is a tricky issue until you "get it", and it taxed the author
for a long time while he was learning OCaml too.

Rule #1 is that you should use `;;` to separate statements at the
top-level of your code, and *never* within function definitions or any
other kind of statement.

Have a look at a section from the second graphics example above:

```ocaml
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
```

We have two top-level statements and a function definition (of a
function called `iterate`). Each one is followed by `;;`.

Rule #2 is that *sometimes* you can elide the `;;`. As a
beginner you shouldn't worry about this — you should always put in the
`;;` as directed by Rule #1. But since you'll also be reading a lot of
other peoples' code you'll need to know that sometimes we can elide
`;;`. The particular places where this is allowed are:

* Before the keyword `let`.
* Before the keyword `open`.
* Before the keyword `type`.
* At the very end of the file.
* A few other (very rare) places where OCaml can "guess" that the next
 thing is the start of a new statement and not the continuation of
 the current statement.

Here is some working code with `;;` elided wherever possible:

```ocaml
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph " 640x480"         (* ;; *)

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
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

read_line ()                  (* ;; *)
```

Rules #3 and #4 refer to the single `;`. This is completely different
from `;;`. The single semicolon `;` is what is known as a **sequence
point**, which is to say it has exactly the same purpose as the single
semicolon in C, C++, Java and Perl. It means "do the stuff before this
point first, then do the stuff after this point when the first stuff has
completed". Bet you didn't know that.

Rule #3 is: Consider `let ... in` as a statement, and never put a
single `;` after it.

Rule #4 is: For all other statements within a block of code, follow
them with a single `;`, *except* for the very last one.

The inner for-loop in our example above is a good demonstration. Notice
that we never use any single `;` in this code:

```ocaml
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
```
The only place in the above code where might think about putting in a
`;` is after the `Graphics.plot x y`, but because this is the last
statement in the block, Rule #4 tells us not to put one there.

###  Note about ";"
Brian Hurt writes to correct me on ";"

> The `;` is an operator, just like `+` is. Well, not quite just like
> `+` is, but conceptually the same. `+` has type `int -> int -> int` -
> it takes two ints and returns an int (the sum). `;` has type
> `unit -> 'b -> 'b` - it takes two values and simply returns the second
> one. Rather like C's `,` (comma) operator. You can write
> `a ; b ; c ; d` just as easily as you can write `a + b + c + d`.
> 
> This is one of those "mental leaps" which is never spelled out very
> well - in OCaml, nearly everything is an expression. `if/then/else` is
> an expression. `a ; b` is an expression. `match foo with ...` is an
> expression. The following code is perfectly legal (and all do the same
> thing):
> 
> ```ocamltop
> let f x b y = if b then x+y else x+0
> let f x b y = x + (if b then y else 0)
> let f x b y = x + (match b with true -> y | false -> 0)
> let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
> let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
> ```
> 
> Note especially the last one - I'm using `;` as an operator to "join"
> two statements. All functions in OCaml can be expressed as:
> 
> ```ocaml
> let name [parameters] = expression
> ```
> 
> OCaml's definition of what is an expression is just a little wider
> than C's. In fact, C has the concept of "statements"- but all of C's
> statements are just expressions in OCaml (combined with the `;`
> operator).
> 
> The one place that `;` is different from `+` is that I can refer to
> `+` just like a function. For instance, I can define a `sum_list`
> function, to sum a list of ints, like:
> 
> ```ocamltop
> let sum_list = List.fold_left ( + ) 0
> ```

###  Putting it all together: some real code
In this section we're going to show some real code fragments from the
lablgtk 1.2 library. (Lablgtk is the OCaml interface to the native Unix
Gtk widget library). A word of warning: these fragments contain a lot of
ideas which we haven't discussed yet. Don't look at the details, look
instead at the overall shape of the code, where the authors used `;;`,
where they used `;` and where they used `open`, how they indented the
code, how they used local and global named expressions.

... However, I'll give you some clues so you don't get totally lost!

* `?foo` and `~foo` is OCaml's way of doing optional and named
 arguments to functions. There is no real parallel to this in
 C-derived languages, but Perl, Python and Smalltalk all have this
 concept that you can name the arguments in a function call, omit
 some of them, and supply the others in any order you like.
* `foo#bar` is a method invocation (calling a method called `bar` on
 an object called `foo`). It's similar to `foo->bar` or `foo.bar` or
 `$foo->bar` in C++, Java or Perl respectively.

First snippet: The programmer opens a couple of standard libraries
(eliding the `;;` because the next keyword is `open` and `let`
respectively). He then creates a function called `file_dialog`. Inside
this function he defines a named expression called `sel` using a
two-line `let sel = ... in` statement. Then he calls several methods on
`sel`.

```ocaml
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
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

let () =
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
