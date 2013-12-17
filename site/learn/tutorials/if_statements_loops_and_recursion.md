<!-- ((! set title If Statements, Loops and Recursion !)) ((! set learn !)) -->

*Table of contents*

# If Statements, Loops and Recursion

## If statements (actually these are if expressions)
OCaml has an if statement with two variations, and the obvious meaning:

```ocaml
if boolean-condition then expression

if boolean-condition then expression else other-expression
```

Unlike in the conventional languages you'll be used to, if statements
are really expressions. In other words, they're much more like
`boolean-condition ? expression : other-expression` than like the if
statements you may be used to.

Here's a simple example of an `if` statement:

```ocamltop
let max a b =
  if a > b then a else b
```
As a short aside, if you type this into the OCaml toplevel, you'll
notice that OCaml decides that this function is polymorphic, with the
following type:

```ocaml
max : 'a -> 'a -> 'a
```
And indeed OCaml lets you use `max` on any type:

```ocamltop
max 3 5;;
max 3.5 13.0;;
max "a" "b";;
```
This is because `>` is in fact polymorphic. It works on any type, even
objects (it does a binary comparison).

[Note that the `Pervasives` module defines `min` and `max` for you.]

Let's look a bit more closely at the `if` expression. Here's the `range`
function which I showed you earlier without much explanation. You should
be able to combine your knowledge of recursive functions, lists and if
expressions to see what it does:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```
Let's examine some typical calls to this function. Let's start with the
easy case of `a > b`. A call to `range 11 10` returns `[]` (the empty
list) and that's it.

What about calling `range 10 10`? Since `10 > 10` is false, the
`else`-clause is evaluated, which is: `10 :: (range 11 10)` (I've added
the brackets to make the order of evaluation more clear). We've just
worked out that `range 11 10` = `[]`, so this is: `10 :: []`. Remember
our formal description of lists and the `::` (cons) operator? `10 :: []`
is just the same as `[ 10 ]`.

Let's try `range 9 10`:

```ocaml
range 9 10
→ 9 :: (range 10 10)
→ 9 :: [ 10 ]
→ [9; 10]
```
It should be fairly clear that `range 1 10` evaluates to
`[ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]`.

What we've got here is a simple case of recursion. Functional
programming can be said to prefer recursion over loops, but I'm jumping
ahead of myself. We'll discuss recursion more at the end of this
chapter.

Back, temporarily, to if statements. What does this function do?

```ocamltop
let f x y =
  x + if y > 0 then y else 0
```
Clue: add brackets around the whole of the if expression. It clips `y`
like an [electronic
diode](http://www.noir-medical.com/graphics/diode_graph.gif "http://www.noir-medical.com/graphics/diode_graph.gif").

The `abs` (absolute value) function is defined in `Pervasives` as:

```ocamltop
let abs x =
  if x >= 0 then x else -x
```
Also in `Pervasives`, the `string_of_float` function contains a complex
pair of nested if expressions:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  let l = string_length s in
  let rec loop i =
    if i >= l then s ^ "."
    else if s.[i] = '.' || s.[i] = 'e' then s
    else loop (i+1) in
  loop 0
```
Let's examine this function. Suppose the function is called with `f` =
12.34. Then `s` = "12.34", and `l` = 5. We call `loop` the first time
with `i` = 0.

`i` is not greater than or equal to `l`, and `s.[i]` (the
`i`<sup>th</sup> character in `s`) is not a period or `'e'`. So
`loop (i+1)` is called, ie. `loop 1`.

We go through the same dance for `i` = 1, and end up calling `loop 2`.

For `i` = 2, however, `s.[i]` is a period (refer to the original string,
`s` = "12.34"). So this immediately returns `s`, and the function
`string_of_float` returns "12.34".

What is `loop` doing? In fact it's checking whether the string returned
from `format_float` contains a period (or `'e'`). Suppose that we called
`string_of_float` with `12.0`. `format_float` would return the string
"12", but `string_of_float` must return "12." or "12.0" (because
floating point constants in OCaml must contain a period to differentiate
them from integer constants). Hence the check.

The strange use of recursion in this function is almost certainly for
efficiency. OCaml supports for loops, so why didn't the authors use for
loops? We'll see in the next section that OCaml's for loops are limited
in a way which prevents them from being used in `string_of_float`. Here,
however, is a more straightforward, but approximately twice as slow, way
of writing `string_of_float`:

```ocaml
let string_of_float f =
  let s = format_float "%.12g" f in
  if String.contains s '.' || String.contains s 'e'
  then s
  else s ^ "."
```

## Using begin ... end
Here is some code from lablgtk:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else begin
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
end
```
`begin` and `end` are what is known as **syntactic sugar** for open and
close parentheses. In the example above, all they do is group the two
statements in the `else`-clause together. Suppose the author had written
this instead:

```ocaml
if GtkBase.Object.is_a obj cls then
  fun _ -> f obj
else
  eprintf "Glade-warning: %s expects a %s argument.\n" name cls;
  raise Not_found
```
Fully bracketing and properly indenting the above expression gives:

```ocaml
(if GtkBase.Object.is_a obj cls then
   fun _ -> f obj
 else
   eprintf "Glade-warning: %s expects a %s argument.\n" name cls
);
raise Not_found
```
Not what was intended at all. So the `begin` and `end` are necessary to
group together multiple statements in a `then` or `else` clause of an if
expression. You can also use plain ordinary parentheses `( ... )` if you
prefer (and I do prefer, because I **loathe** Pascal :-). Here are two
simple examples:

```ocamltop
  if 1 = 0 then
    print_endline "THEN"
  else begin
    print_endline "ELSE";
    failwith "else clause"
  end;;

  if 1 = 0 then
    print_endline "THEN"
  else (
    print_endline "ELSE";
    failwith "else clause"
  );;
```

## For loops and while loops
OCaml supports a rather limited form of the familiar `for` loop:

```ocaml
for variable = start_value to end_value do
  expression
done

for variable = start_value downto end_value do
  expression
done
```
A simple but real example from lablgtk:

```ocaml
for i = 1 to n_jobs () do
  do_next_job ()
done
```
In OCaml, `for` loops are just shorthand for writing:

```ocaml
let i = 1 in
do_next_job ();
let i = 2 in
do_next_job ();
let i = 3 in
do_next_job ();
  ...
let i = n_jobs () in
do_next_job ();
()
```
OCaml doesn't support the concept of breaking out of a `for` loop early
i.e. it has no `break`, `continue` or `last` statements. (You *could*
throw an exception and catch it outside, and this would run fast but
often looks clumsy.)

The expression inside an OCaml for loop should evaluate to `unit`
(otherwise you'll get a warning), and the for loop expression as a whole
returns `unit`:

```ocamltop
for i = 1 to 10 do i done;;
```
Functional programmers tend to use recursion instead of explicit loops,
and regard **for** loops with suspicion since it can't return anything,
hence OCaml's relatively powerless **for** loop. We talk about recursion
below.

**While loops** in OCaml are written:

```ocaml
while boolean-condition do
  expression
done
```
As with for loops, there is no way provided by the language to break out
of a while loop, except by throwing an exception, and this means that
while loops have fairly limited use. Again, remember that functional
programmers like recursion, and so while loops are second-class citizens
in the language.

If you stop to consider while loops, you may see that they aren't really
any use at all, except in conjunction with our old friend references.
Let's imagine that OCaml didn't have references for a moment:

```ocaml
let quit_loop = false in
while not quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    (* how do I set quit_loop to true ?!? *)
done
```
Remember that `quit_loop` is not a real "variable" - the let-binding
just makes `quit_loop` a shorthand for `false`. This means the while
loop condition (shown in red) is always true, and the loop runs on
forever!

Luckily OCaml *does have* references, so we can write the code above if
we want. Don't get confused and think that the `!` (exclamation mark)
means "not" as in C/Java. It's used here to mean "dereference the
pointer", similar in fact to Forth. You're better off reading `!` as
"get" or "deref".

```ocaml
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then
    quit_loop := true
done;;
```
## Looping over lists
If you want to loop over a list, don't be an imperative programmer and
reach for your trusty six-shooter Mr. For Loop! OCaml has some better
and faster ways to loop over lists, and they are all located in the
`List` module. There are in fact dozens of good functions in `List`, but
I'll only talk about the most useful ones here.

First off, let's define a list for us to use:

```ocamltop
let my_list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
```
If you want to call a function once on every element of the list, use
`List.iter`, like this:

```ocamltop
let f elem =
  Printf.printf "I'm looking at element %d now\n" elem in
  List.iter f my_list
```
`List.iter` is in fact what you should think about using first every
time your cerebellum suggests you use a for loop.

If you want to *transform* each element separately in the list - for
example, doubling each element in the list - then use `List.map`. This
function will be familiar to people who've

programmed in Perl before.

```ocamltop
List.map (( * ) 2) my_list
```
Perl has the useful function "grep" for filtering only elements of a
list which satisfy some condition - eg. returning all even numbers in a
list. In OCaml this function is called `List.filter`:

```ocamltop
let is_even i =
  i mod 2 = 0 in
  List.filter is_even my_list
```
To find out if a list contains some element, use `List.mem` (short for
member):

```ocamltop
List.mem 12 my_list
```
`List.for_all` and `List.exists` are the same as the "forall" and
"exist" operators in predicate logic.

For operating over two lists at the same time, there are "-2" variants
of some of these functions, namely `iter2`, `map2`, `for_all2`,
`exists2`.

The `map` and `filter` functions operate on individual list elements in
isolation. \<dfn\>Fold\</dfn\> is a more unusual operation that is best
thought about as "inserting an operator between each element of the
list". Suppose I wanted to add all the numbers in my list together. In
hand-waving terms what I want to do is insert a plus sign between the
elements in my list:

```ocamltop
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
```
The fold operation does this, although the exact details are a little
bit more tricky. First of all, what happens if I try to fold an empty
list? In the case of summing the list it would be nice if the answer was
zero, instead of error. However if I was trying to find the product of
the list, I'd like the answer to be one instead. So I obviously have to
provide some sort of "default" argument to my fold. The second issue
doesn't arise with simple operators like `+` and `*`: what happens if
the operator I'm using isn't associative, ie. (a *op* b) *op* c not
equal to a *op* (b *op* c)? In that case it would matter if I started
from the left hand end of the list and worked right, versus if I started
from the right and worked left. For this reason there are two versions
of fold, called `List.fold_left` (works left to right) and
`List.fold_right` (works right to left, and is also less efficient).

Let's use `List.fold_left` to define `sum` and `product` functions for
integer lists:

```ocamltop
let sum = List.fold_left ( + ) 0;;
let product = List.fold_left ( * ) 1;;
sum my_list;;
product my_list;;
```
That was easy! Notice that I've accidentally come up with a way to do
mathematical factorials:

```ocamltop
let fact n = product (range 1 n);;
fact 10;;
```
(Notice that this factorial function isn't very useful because it
overflows the integers and gives wrong answers even for quite small
values of `n`. A real factorial function would use the `Big_int`
module.)

## Looping over strings
The `String` module also contains many dozens of useful string-related
functions, and some of them are concerned with looping over strings.

`String.fill` and `String.blit` are the equivalents to C `memset` and
`strcpy` respectively. `String.copy` copies a string, like `strdup`.

There is also a `String.iter` function which works like `List.iter`,
except over the characters of the string.

## Recursion
Now we come to a hard topic - recursion. Functional programmers are
defined by their love of recursive functions, and in many ways recursive
functions in f.p. are the equivalent of loops in imperative programming.
In functional languages loops are second-class citizens, whilest
recursive functions get all the best support.

Writing recursive functions requires a change in mindset from writing
for loops and while loops. So what I'll give you in this section will be
just an introduction and examples.

In the first example we're going to read the whole of a file into memory
(into a long string). There are essentially three possible approaches to
this:

###  Approach 1
Get the length of the file, and read it all in one go using the
`really_input` method. This is the simplest, but it might not work on
channels which are not really files (eg. reading keyboard input) which
is why we look at the other two approaches.

###  Approach 2
The imperative approach, using a while loop which is broken out of using
an exception.

###  Approach 3
A recursive loop, breaking out of the recursion again using an
exception.

We're going to introduce a few new concepts here. Our second two
approaches will use the `Buffer` module - an expandable buffer which you
can think of like a string onto which you can efficiently append more
text at the end. We're also going to be catching the `End_of_file`
exception which the input functions throw when they reach the end of the
input. Also we're going to use `Sys.argv.(1)` to get the first command
line parameter.

```ocaml
(* Read whole file: Approach 1 *)
open Printf

let read_whole_chan chan =
  let len = in_channel_length chan in
  let result = String.create len in
  really_input chan result 0 len;
  result

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

Approach 1 works but is not very satisfactory because `read_whole_chan`
won't work on non-file channels like keyboard input or sockets. Approach
2 involves a while loop:

```ocaml
(* Read whole file: Approach 2 *)
open Printf

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  try
    while true do
      let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed
	                (always raise Assert_failure). *)
  with
    End_of_file -> Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

The key to approach 2 is to look at the central while loop. Remember
that I said the only way to break out of a while loop early was with an
exception? This is exactly what we're doing here. Although I haven't
covered exceptions yet, you probably won't have any trouble
understanding the `End_of_file` exception thrown in the code above by
`input_line` when it hits the end of the file. The buffer `buf`
accumulates the contents of the file, and when we hit the end of the
file we return it (`Buffer.contents buf`).

One curious point about this is the apparently superfluous extra set of
quotes (`""`) just after the while loop. What are they for? Remember
that while loops, like for loops, are just expressions, and they return
the `unit` object (`()`). However OCaml demands that the return type
inside a `try` matches the return type of each caught exception. In this
case because `End_of_file` results in a `string`, the main body of the
`try` must also "return" a string - even though because of the infinite
while loop the string could never actually be returned.

Here's our recursive version. Notice that it's *shorter* than approach
2, but not so easy to understand for imperative programmers at least:

```ocaml
(* Read whole file: Approach 3 *)
open Printf

let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf

let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let () =
  let filename = Sys.argv.(1) in
  let str = read_whole_file filename in
  printf "I read %d characters from %s\n" (String.length str) filename
```

Again we have an infinite loop - but in this case done using recursion.
`loop` calls itself at the end of the function. The infinite recursion
is broken when `input_line` throws an `End_of_file` exception.

It looks like approach 3 might overflow the stack if you gave it a
particularly large file, but this is in fact not the case. Because of
tail recursion (discussed below) the compiler will turn the recursive
`loop` function into a real while loop (!) which runs in constant stack
space.

In the next example we will show how recursion is great for constructing
or examining certain types of data structures, particularly trees. Let's
have a recursive type to represent files in a filesystem:

```ocamltop
type filesystem = File of string | Directory of filesystem list
```
The `opendir` and `readdir` functions are used to open a directory and
read elements from the directory. I'm going to define a handy
`readdir_no_ex` function which hides the annoying `End_of_file`
exception that `readdir` throws when it reaches the end of the
directory:

```ocamltop
open Unix  (*  You may need to #load "Unix.cma" *)

let readdir_no_ex dirh =
  try
    Some (readdir dirh)
  with
    End_of_file -> None
```
The type of `readdir_no_ex` is this. Recall our earlier discussion about
null pointers.

```ocaml
readdir_no_ex : dir_handle -> string option
```
I'm also going to define a simple recursive function which I can use to
convert the `filesystem` type into a string for (eg) printing:

```ocamltop
let rec string_of_filesystem fs =
  match fs with
  | File filename -> filename ^ "\n"
  | Directory fs_list ->
      List.fold_left (^) "" (List.map string_of_filesystem fs_list)
```
Note the use of `fold_left` and `map`. The `map` is used to
(recursively) convert each `filesystem` in the list into a `string`.
Then the `fold_left (^) ""` concatenates the list together into one big
string. Notice also the use of pattern matching. (The library defines a
function called `String.concat` which is essentially equivalent to
`fold_left (^) `, but implemented more efficiently).

Now let's define a function to read a directory structure, recursively,
and return a recursive `filesystem` data structure. I'm going to show
this function in steps, but I'll print out the entire function at the
end of this section. First the outline of the function:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    (* ..... *) in
  Directory (loop ())
```
The call to `opendir` opens up the given path and returns a `dir_handle`
from which we will be able to read the names using `readdir_no_ex`
later. The return value of the function is going to be a
`Directory fs_list`, so all we need to do to complete the function is to
write our function `loop` which returns a list of `filesystem`s. The
type of `loop` will be:

```ocaml
loop : unit -> filesystem list
```
How do we define loop? Let's take it in steps again.

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  (* ..... *)
```
First we read the next filename from the directory handle. `filename`
has type `string option`, in other words it could be `None` or
`Some "foo"` where `foo` is the name of the next filename in the
directory. We also need to ignore the `"."` and `".."` files (ie. the
current directory and the parent directory). We can do all this with a
nice pattern match:

```ocaml
let rec loop () =
  let filename = readdir_no_ex dirh in
  match filename with
  | None -> []
  | Some "." -> loop ()
  | Some ".." -> loop ()
  | Some filename ->
     (* ..... *)
```
The `None` case is easy. Thinking recursively (!) if `loop` is called
and we've reached the end of the directory, `loop` needs to return a
list of entries - and there's no entries - so it returns the empty list
(`[]`).

For `"."` and `".."` we just ignore the file and call `loop` again.

What do we do when `loop` reads a real filename (the `Some filename`
match below)? Let `pathname` be the full path to the file. We 'stat' the
file to see if it's really a directory. If it *is* a directory, we set
`this` by recursively calling `read_directory` which will return
`Directory something`. Notice that the overall result of
`read_directory` is `Directory (loop ())`. If the file is really a file
(not a directory) then we let `this` be `File pathname`. Then we do
something clever: we return `this :: loop ()`. This is the recursive
call to `loop ()` to calculate the remaining directory members (a list),
to which we prepend `this`.

```ocamltop
let rec read_directory path =
  let dirh = opendir path in
  let rec loop () =
    let filename = readdir_no_ex dirh in
    match filename with
    | None -> []
    | Some "." -> loop ()
    | Some ".." -> loop ()
    | Some filename ->
        let pathname = path ^ "/" ^ filename in
        let stat = lstat pathname in
        let this = if stat.st_kind = S_DIR then
                     read_directory pathname
                   else
                     File pathname in
        this :: loop () in
  Directory (loop ())
```
That's quite a complex bit of recursion, but although this is a made-up
example, it's fairly typical of the complex patterns of recursion found
in real-world functional programs. The two important lessons to take
away from this are:

* The use of recursion to build a list:

<!-- -->
```ocaml
let rec loop () =
  a match or if statement
  | base case -> []
  | recursive case -> element :: loop ()
```
Compare this to our previous `range` function. The pattern of recursion
is exactly the same:

```ocamltop
let rec range a b =
  if a > b then []            (* Base case *)
  else a :: range (a+1) b     (* Recursive case *)
  ;;
```
* The use of recursion to build up trees:

<!-- -->
```ocaml
let rec read_directory path =
  (* blah blah *)
  if file-is-a-directory then
    read_directory path-to-file
  else
    Leaf file
```
All that remains now to make this a working program is a little bit of
code to call `read_directory` and display the result:

```ocaml
let path = Sys.argv.(1) in
let fs = read_directory path in
print_endline (string_of_filesystem fs)
```

###  Addendum
After I posted this example to the caml-list mailing list I received
many follow-ups. (You can [read the full
thread](http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html "http://caml.inria.fr/pub/ml-archives/caml-list/2003/06/2732fbf1bed1ae50fefb6ea410ea9955.en.html").)

First of all there is a basic fault with `read_directory` directory
which will cause it to fail if you try to run it on very large directory
structures. I don't explicitly call `closedir` to close the directory
handle. The garbage collector doesn't help, because in OCaml the garbage
collector does **not** collect and close open file and directory
handles.

The fix is pretty trivial: add a call to `closedir` at the end of the
`read_directory` function:

```ocaml
let rec read_directory path =
  let dirh = opendir path in
    (* ... *)
  let result = Directory (loop ()) in
  closedir dirh;
  result
```
Next up is the issue of `readdir` throwing an exception in a rather
"unexceptional" situation, namely `End_of_file`. I don't agree that
throwing an exception in this case is the right thing to do. In typical
programs I want to never have to write a `try ... with` clause, because
exceptions are supposed to mean "something really bad happened which I'm
not prepared to deal with", like running out of disk space or memory.
Throwing an exception as part of the routine running of a function
(every program which uses `readdir` *has* to be prepared to handle
`End_of_file`), that's not an exceptional situation.

However, Eric Cooper came up with a way to write the function and check
the exception, and this highlights another frequent technique used by
functional programmers. Namely, passing an **accumulator** which
contains the result of the function call, but passed as an *argument* to
the function (!) Really the accumulator means "this is the result so
far", so in the exceptional case (`End_of_file`) we give up and return
the result so far. Here is his code with all the references to the
accumulator argument in red:

```ocamltop
let rec read_filesystem path =
  if (lstat path).st_kind = S_DIR then
    Directory (read_directory path)
  else
    File path

and read_directory path =
  let dirh = opendir path in
  let rec loop entries =
    try
      match readdir dirh with
      | "." | ".." -> loop entries
      | filename ->
	     loop (read_filesystem (path ^ "/" ^ filename) :: entries)
    with End_of_file -> entries in
  let list = loop [] in
  closedir dirh;
  list
```
Notice `End_of_file -> entries` which means "when we get the exception,
give up and return the result so far".

Next up - it was pointed out that the easiest way to do this is actually
not to use recursion at all, but instead to do the loop imperatively (a
while loop is probably best) and have a reference to a list to store the
ongoing accumulated result. Because `readdir` throws an exception, we
have a simple way to break out of the while loop, *and* in the
`with`-clause we can just return `!list` (dereference the reference to
the list of entries we've built up).

It all works nicely, and proves that writing code imperatively is often
best, *particularly* as in this case where
`opendir ... readdir ... closedir` is essentially an imperative API,
designed for C programmers. It's no surprise, therefore, that the
imperative solution is easier. OCaml, not being a [bondage and
discipline
language](http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html "http://www.elsewhere.org/jargon/html/entry/bondage-and-discipline-language.html"),
doesn't mind you using the imperative approach when it makes sense.

Here is the outline of the imperative approach by Fabrice Le Fessant:

```ocaml
let list = ref [] in
let dir = opendir "......." in
try
  while true do
    match readdir dir with
    | "." | ".." -> ()
    | filename -> list := filename :: !list
  done;
  assert false
with End_of_file -> !list
```
###  Recursion example: maximum element in a list
Remember the basic recursion pattern for lists:

```ocaml
let rec loop () =
  a match or if statement
  | base case -> []
  | recursive case -> element :: loop ()
```
The key here is actually the use of the match / base case / recursive
case pattern. In this example - finding the maximum element in a list -
we're going to have two base cases and one recursive case. But before I
jump ahead to the code, let's just step back and think about the
problem. By thinking about the problem, the solution will appear "as if
by magic" (I promise you :-)

First of all, let's be clear that the maximum element of a list is just
the biggest one. eg. The maximum element of the list `[1; 2; 3; 4; 1]`
is `4`.

Are there any special cases? Yes there are. What's the maximum element
of the empty list `[]`? There *isn't one*. If we are passed an empty
list, we should throw an error.

What's the maximum element of a single element list such as `[4]`?
That's easy: it's just the element itself. So `list_max [4]` should
return `4`, or in the general case, `list_max [x]` should return `x`.

What's the maximum element of the general list `x :: remainder` (this is
the "cons" notation for the list, so `remainder` is the tail - also a
list)?

Think about this for a while. Suppose you know the maximum element of
`remainder`, which is, say, `y`. What's the maximum element of
`x :: remainder`? It depends on whether `x > y` or `x <= y`. If `x` is
bigger than `y`, then the overall maximum is `x`, whereas conversely if
`x` is less than `y`, then the overall maximum is `y`.

Does this really work? Consider `[1; 2; 3; 4; 1]` again. This is
`1 :: [2; 3; 4; 1]`. Now the maximum element of the remainder,
`[2; 3; 4; 1]`, is `4`. So now we're interested in `x = 1` and `y = 4`.
That head element `x = 1` doesn't matter because `y = 4` is bigger, so
the overall maximum of the whole list is `y = 4`.

Let's now code those rules above up, to get a working function:

```ocamltop
  let rec list_max xs =
    match xs with
    | [] ->   (* empty list: fail *)
	   failwith "list_max called on empty list"
    | [x] -> (* single element list: return the element *)
	   x
    | x :: remainder -> (* multiple element list: recursive case *)
	   max x (list_max remainder)
```
I've added comments so you can see how the rules / special cases we
decided upon above really correspond to lines of code.

Does it work?

```ocamltop
list_max [1; 2; 3; 4; 1];;
list_max [];;
list_max [5; 4; 3; 2; 1];;
list_max [5; 4; 3; 2; 1; 100];;
```
Notice how the solution proposed is both (a) very different from the
imperative for-loop solution, and (b) much more closely tied to the
problem specification. Functional programmers will tell you that this is
because the functional style is much higher level than the imperative
style, and therefore better and simpler. Whether you believe them is up
to you. It's certainly true that it's much simpler to reason logically
about the functional version, which is useful if you wanted to formally
prove that `list_max` is correct ("correct" being the mathematical way
to say that a program is provably bug-free, useful for space shuttles,
nuclear power plants and higher quality software in general).

###  Tail recursion
Let's look at the `range` function again for about the twentieth time:

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
```
I'm going to rewrite it slightly to make something about the structure
of the program clearer (still the same function however):

```ocamltop
let rec range a b =
  if a > b then []
  else
    let result = range (a+1) b in
    a :: result
```
Let's call it:

```ocamltop
List.length (range 1 10);;
List.length (range 1 1000000);;
```
Hmmm ... at first sight this looks like a problem with recursive
programming, and hence with the whole of functional programming! If you
write your code recursively instead of iteratively then you necessarily
run out of stack space on large inputs, right?

In fact, wrong. Compilers can perform a simple optimisation on certain
types of recursive functions to turn them into while loops. These
certain types of recursive functions therefore run in constant stack
space, and with the equivalent efficiency of imperative while loops.
These functions are called **tail-recursive functions**.

In tail-recursive functions, the recursive call happens last of all.
Remember our `loop ()` functions above? They all had the form:

```ocaml
let rec loop () =
  (* do something *)
  loop ()
```
Because the recursive call to `loop ()` happens as the very last thing,
`loop` is tail-recursive and the compiler will turn the whole thing into
a while loop.

Unfortunately `range` is not tail-recursive, and the longer version
above shows why. The recursive call to `range` doesn't happen as the
very last thing. In fact the last thing to happen is the `::` (cons)
operation. As a result, the compiler doesn't turn the recursion into a
while loop, and the function is not efficient in its use of stack space.

Now recall we discussed in the addendum above Eric Cooper's
"accumulator" technique, and I said that this technique was widely used
in functional programming. We will now see why this is the case. It's
because it allows you to write functions such as `range` above in a
tail-recursive manner, which means they will be efficient and work
properly on large inputs.

Let's plan our rewritten `range` function which will use an accumulator
argument to store the "result so far":

```ocaml
let rec range2 a b accum =
  (* ... *)

let range a b =
  range2 a b []
```
(I could and probably should have used a nested function here.)

The `accum` argument is going to accumulate the result. It's the "result
so far". We pass in the empty list ("no result so far"). The easy case
is when `a > b`:

```ocaml
let rec range2 a b accum =
  if a > b then accum
  else
    (* ... *)
```
If `a > b` (ie. if we've reached the end of the recursion), then stop
and return the result (`accum`).

Now the trick is to write the `else`-clause and make sure that the call
to `range2` is the very last thing that we do, so the function is
tail-recursive:

```ocamltop
let rec range2 a b accum =
  if a > b then accum
  else range2 (a+1) b (a :: accum)
```
There's only one slight problem with this function: it constructs the
list backwards! However, this is easy to rectify by redefining range as:

```ocamltop
let range a b = List.rev (range2 a b []);;
```
It works this time, although it's a bit slow to run because it really
does have to construct a list with a million elements in it:

```ocamltop
List.length (range 1 1000000)
```
The following implementation is twice as fast as the previous one,
because it does not need to reverse a list:

```ocamltop
let rec range2 a b accum =
  if b < a then accum
  else range2 a (b-1) (b :: accum);;

let range a b =
  range2 a b [];;
```
That was a brief overview of tail recursion, but in real world
situations determining if a function is tail recursive can be quite
hard. What did we really learn here? One thing is that recursive
functions have a dangerous trap for inexperienced programmers. Your
function can appear to work for small inputs (during testing), but fail
catastrophically in the field when exposed to large inputs. This is one
argument *against* using recursive functions, and for using explicit
while loops when possible.

## Mutable records, references (again!) and arrays
Previously we mentioned records in passing. These are like C `struct`s:

```ocamltop
type pair_of_ints = { a : int; b : int };;
{a=3; b=5};;
{a=3};;
```
One feature which I didn't cover: OCaml records can have mutable fields.
Normally an expression like `{a = 3; b = 5}` is an immutable, constant
object. However if the record has \<dfn\>mutable fields\</dfn\>, then
there is a way to change those fields in the record. This is an
imperative feature of OCaml, because functional languages don't normally
allow mutable objects (or references or mutable arrays, which we'll look
at in a moment).

Here is an object defined with a mutable field. This field is used to
count how many times the object has been accessed. You could imagine
this being used in a caching scheme to decide which objects you'd evict
from memory.

```ocamltop
type name = { name : string; mutable access_count : int }
```
Here is a function defined on names which prints the `name` field and
increments the mutable `access_count` field:

```ocamltop
let print_name name =
  print_endline ("The name is " ^ name.name);
  name.access_count <- name.access_count + 1
```
Notice a strange, and very non-functional feature of `print_name`: it
modifies its `access_count` parameter. If you read chapter 5 closely,
you'll see that this function is not "pure". OCaml is a functional
language, but not to the extent that it forces functional programming
down your throat.

Anyway, let's see `print_name` in action:

```ocamltop
let n = { name = "Richard Jones"; access_count = 0 };;
n;;
print_name n;;
n;;
print_name n;;
n;;
```
Only fields explicitly marked as `mutable` can be assigned to using the
`<-` operator. If you try to assign to a non-mutable field, OCaml won't
let you:

```ocamltop
n.name <- "John Smith";;
```
References, with which we should be familiar by now, are implemented
using records with a mutable `contents` field. Check out the definition
in `Pervasives`:

```ocamltop
type 'a ref = { mutable contents : 'a }
```
And look closely at what the OCaml toplevel prints out for the value of
a reference:

```ocamltop
let r = ref 100;;
```
Arrays are another sort of mutable structure provided by OCaml. In
OCaml, plain lists are implemented as linked lists, and linked lists are
slow for some types of operation. For example, getting the head of a
list, or iterating over a list to perform some operation on each element
is reasonably fast. However, jumping to the n<sup>th</sup> element of a
list, or trying to randomly access a list - both are slow operations.
The OCaml `Array` type is a real array, so random access is fast, but
insertion and deletion of elements is slow. `Array`s are also mutable so
you can randomly change elements too.

The basics of arrays are simple:

```ocamltop
let a = Array.create 10 0;;
for i = 0 to Array.length a - 1 do
  a.(i) <- i
done;;
a;;
```
Notice the syntax for writing arrays: `[| element; element; ... |]`

The OCaml compiler was designed with heavy numerical processing in mind
(the sort of thing that FORTRAN is traditionally used for), and so it
contains various optimisations specifically for arrays of numbers,
vectors and matrices. Here is some benchmark code for doing dense matrix
multiplication. Notice that it uses for-loops and is generally very
imperative in style:

```ocamltop
(*
 * $Id: index.shtml,v 1.3 2004/04/23 12:33:00 rich Exp $
 * http://www.bagley.org/~doug/shootout/
 * from Markus Mottl
 *)

let size = 30

let mkmatrix rows cols =
  let count = ref 1
  and last_col = cols - 1
  and m = Array.make_matrix rows cols 0 in
  for i = 0 to rows - 1 do
    let mi = m.(i) in
    for j = 0 to last_col do
      mi.(j) <- !count;
      incr count
    done;
  done;
  m

let rec inner_loop k v m1i m2 j =
  if k < 0 then v
  else inner_loop (k - 1) (v + m1i.(k) * m2.(k).(j)) m1i m2 j

let mmult rows cols m1 m2 m3 =
  let last_col = cols - 1
  and last_row = rows - 1 in
  for i = 0 to last_row do
    let m1i = m1.(i) and m3i = m3.(i) in
    for j = 0 to last_col do
      m3i.(j) <- inner_loop last_row 0 m1i m2 j
    done;
  done

let () =
  let n =
    try int_of_string Sys.argv.(1)
    with Invalid_argument _ -> 1
  and m1 = mkmatrix size size
  and m2 = mkmatrix size size
  and m3 = Array.make_matrix size size 0 in
  for i = 1 to n - 1 do
    mmult size size m1 m2 m3
  done;
  mmult size size m1 m2 m3;
  Printf.printf "%d %d %d %d\n" m3.(0).(0) m3.(2).(3) m3.(3).(2) m3.(4).(4)

```
