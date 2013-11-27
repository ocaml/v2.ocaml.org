<!-- ((! set title Labels !)) ((! set learn !)) -->

# Labels

*Table of contents*

## Exceptions and hash tables
*(unfinished)*

## Mutually recursive functions
Suppose I want to define two functions which call each other. This is
actually not a very common thing to do, but it can be useful sometimes.
Here's a contrived example (thanks to Ryan Tarpine): The number 0 is
even. Other numbers greater than 0 are even if their predecessor is odd.
Hence:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
```

The code above doesn't compile because we haven't defined the function
`odd` yet! That's easy though. Zero is not odd, and other numbers
greater than 0 are odd if their predecessor is even. So to make this
complete we need that function too:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)

let rec odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```

The only problem is... this program doesn't compile. In order to compile
the `even` function, we already need the definition of `odd`, and to
compile `odd` we need the definition of `even`. So swapping the two
definitions around won't help either.

There are no "forward prototypes" in OCaml but there is a special syntax
for defining a set of two or more mutually recursive functions, like
`odd` and `even`:

```ocamltop
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x-1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x-1)
```
It's hard to know exactly how useful this is in practice, since I've
never had cause to write mutually recursive functions, nor have I been
able to think of a non-trivial example. However it's there. You can also
use similar syntax for writing mutually recursive class definitions and
modules.

## Aliases for function names and arguments
Recall in Chapter 5 we talked about partial function application. It's
possible to use this as a neat trick to save typing: aliasing function
names, and function arguments.

Although we haven't looked at object-oriented programming (that's the
subject for the next chapter), here's an example from OCamlNet of an
aliased function call. All you need to know is that
`cgi # output # output_string "string"` is a method call, similar to
`cgi.output().output_string ("string")` in Java.

```ocaml
let begin_page cgi title =
  let out = cgi # output # output_string in
  out "<html>\n";
  out "<head>\n";
  out ("<title>" ^ text title ^ "</title>\n");
  out ("<style type=\"text/css\">\n");
  out "body { background: white; color: black; }\n";
  out "</style>\n";
  out "</head>\n";
  out "<body>\n";
  out ("<h1>" ^ text title ^ "</h1>\n")
```
The `let out = ... ` is a partial function application for that method
call (partial, because the string parameter hasn't been applied). `out`
is therefore a function, which takes a string parameter.

```ocaml
out "<html>\n";
```
is equivalent to:

```ocaml
cgi # output # output_string "<html>\n";
```
We saved ourselves a lot of typing there.

We can also add arguments. This alternative definition of `print_string`
can be thought of as a kind of alias for a function name plus arguments:

```ocaml
let print_string = output_string stdout
```
`output_string` takes two arguments (a channel and a string), but since
we have only supplied one, it is partially applied. So `print_string` is
a function, expecting one string argument.

## Labelled and optional arguments to functions
###  Labelled arguments

Python has a nice syntax for writing arguments to functions. Here's
an example (from the Python tutorial, since I'm not a Python
programmer):

```python
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
  # function definition omitted
```
Here are the ways we can call this Python function:

```python
ask_ok ('Do you really want to quit?')
ask_ok ('Overwrite the file?', 2)
ask_ok (prompt='Are you sure?')
ask_ok (complaint='Please answer yes or no!', prompt='Are you sure?')
```
Notice that in Python we are allowed to name arguments when we call
them, or use the usual function call syntax, and we can have optional
arguments with default values.

You can do something similar in Perl:

```perl
sub ask_ok
{
  my %params = @_;

  my $prompt = $params{prompt};
  my $retries = exists $params{retries} ? $params{retries} : 4;

  # ... etc.
}

ask_ok (prompt => "Are you sure?", retries => 2);
```

OCaml also has a way to label arguments and have optional arguments with
default values.

The basic syntax is:

```ocamltop
let rec range ~first:a ~last:b =
  if a > b then []
  else a :: range ~first:(a+1) ~last:b
```
(Notice that both `to` and `end` are reserved words in OCaml, so they
cannot be used as labels. So you cannot have `~from/~to` or
`~start/~end`.)

The type of our previous `range` function was:

```ocaml
range : int -> int -> int list
```
And the type of our new `range` function with labelled arguments is:

```ocaml
range : first:int -> last:int -> int list
```
(Confusingly, the `~` (tilde) is *not* shown in the type definition, but
you need to use it everywhere else).

With labelled arguments, it doesn't matter which order you give the
arguments anymore:

```ocamltop
range ~first:1 ~last:10;;
range ~last:10 ~first:1;;
```
There is also a shorthand way to name the arguments, so that the label
is the same as the variable in the function definition. Here is a
function defined in `lablgtk/gaux.ml` (a library of useful oddities used
in lablgtk):

```ocamltop
let may ~f x =
  match x with
  | None -> ()
  | Some x -> ignore(f x)
```
It's worth spending some time working out exactly what this function
does, and also working out by hand its type signature. There's a lot
going on. First of all, the parameter `~f` is just shorthand for `~f:f`
(ie. the label is `~f` and the variable used in the function is `f`).
Secondly notice that the function takes two parameters. The second
parameter (`x`) is unlabelled - it is permitted for a function to take a
mixture of labelled and unlabelled arguments if you want.

What is the type of the labelled `f` parameter? Obviously it's a
function of some sort.

What is the type of the unlabelled `x` parameter? The `match` clause
gives us a clue. It's an `'a option`.

This tells us that `f` takes an `'a` parameter, and the return value of
`f` is ignored, so it could be anything. The type of `f` is therefore
`'a -> 'b`.

The `may` function as a whole returns `unit`. Notice in each case of the
`match` the result is `()`.

Thus the type of the `may` function is (and you can verify this in the
OCaml toplevel if you want):

```ocaml
may : f:('a -> 'b) -> 'a option -> unit
```
What does this function do? Running the function in the OCaml toplevel
gives us some clues:

```ocamltop
may ~f:print_endline None;;
may ~f:print_endline (Some "hello");;
```
If the unlabelled argument is a “null pointer” then `may` does nothing.
Otherwise `may` calls the `f` function on the argument. Why is this
useful? We're just about to find out ...

###  Optional arguments
Optional arguments are like labelled arguments, but we use `?` instead
of `~` in front of them. Here is an example:

```ocamltop
let rec range ?(step=1) a b =
  if a > b then []
  else a :: range ~step (a+step) b
```
Note the somewhat confusing syntax, switching between `?` and `~`. We'll
talk about that in the next section. Here is how you call this function:

```ocamltop
range 1 10;;
range 1 10 ~step:2;;
```
In this case, `?(step=1)` fairly obviously means that `~step` is an
optional argument which defaults to 1. We can also omit the default
value and just have an optional argument. This example is modified from
lablgtk:

```ocamltop
type window = { mutable title: string;
                mutable width: int;
                mutable height: int }

let create_window () =
  { title = "none"; width = 640; height = 480; }

let set_title window title =
  window.title <- title

let set_width window width =
  window.width <- width

let set_height window height =
  window.height <- height

let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```

This example is significantly complex and quite subtle, but the pattern
used is very common in the lablgtk source code. Let's concentrate on the
simple `create_window` function first. This function takes a `unit` and
returns a `window`, initialized with default settings for title, width
and height:

```ocamltop
create_window ();;
```
The `set_title`, `set_width` and `set_height` functions are impure
functions which modify the `window` structure, in the obvious way. For
example:

```ocamltop
let w = create_window () in
set_title w "My Application";
w;;
```
So far this is just the imperative "mutable records" which we talked
about in the previous chapter. Now the complex part is the `open_window`
function. This function takes *4* arguments, three of them optional,
followed by a required, unlabelled `unit`. Let's first see this function
in action:

```ocamltop
open_window ~title:"My Application" ();;
open_window ~title:"Clock" ~width:128 ~height:128 ();;
```
It does what you expect, but how?! The secret is in the `may` function
(see above) and the fact that the optional parameters *don't* have
defaults.

When an optional parameter doesn't have a default, then it has type
`'a option`. The `'a` would normally be inferred by type inference, so
in the case of `?title` above, this has type `string option`.

Remember the `may` function? It takes a function and an argument, and
calls the function on the argument provided the argument isn't `None`.
So:

```ocaml
may ~f:(set_title window) title;
```
If the optional title argument is not specified by the caller, then
`title` = `None`, so `may` does nothing. But if we call the function
with, for example,

```ocaml
open_window ~title:"My Application" ()
```

then `title` = `Some "My Application"`, and `may` therefore calls
`set_title window "My Application"`.

You should make sure you fully understand this example before proceeding
to the next section.

###  "Warning: This optional argument cannot be erased"
We've just touched upon labels and optional arguments, but even this
brief explanation should have raised several questions. The first may be
why the extra `unit` argument to `open_window`? Let's try defining this
function without the extra `unit`:

```ocamltop
let open_window ?title ?width ?height =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```
Although OCaml has compiled the function, it has generated a somewhat
infamous warning: "This optional argument cannot be erased", referring
to the final `?height` argument. To try to show what's going on here,
let's call our modified `open_window` function:

```ocamltop
open_window;;
open_window ~title:"My Application";;
```
Did that work or not? No it didn't. In fact it didn't even run the
`open_window` function at all. Instead it printed some strange type
information. What's going on?

Recall currying and uncurrying, and partial application of functions. If
we have a function `plus` defined as:

```ocamltop
let plus x y =
  x + y
```
We can partially apply this, for example as `plus 2` which is "the
function that adds 2 to things":

```ocamltop
let f = plus 2;;
f 5;;
f 100;;
```
In the `plus` example, the OCaml compiler can easily work out that
`plus 2` doesn't have enough arguments supplied yet. It needs another
argument before the `plus` function itself can be executed. Therefore
`plus 2` is a function which is waiting for its extra argument to come
along.

Things are not so clear when we add optional arguments into the mix. The
call to `open_window;;` above is a case in point. Does the user mean
"execute `open_window` now"? Or does the user mean to supply some or all
of the optional arguments later? Is `open_window;;` waiting for extra
arguments to come along like `plus 2`?

OCaml plays it safe and doesn't execute `open_window`. Instead it treats
it as a partial function application. The expression `open_window`
literally evaluates to a function value.

Let's go back to the original and working definition of `open_window`
where we had the extra unlabelled `unit` argument at the end:

```ocamltop
let open_window ?title ?width ?height () =
  let window = create_window () in
  may ~f:(set_title window) title;
  may ~f:(set_width window) width;
  may ~f:(set_height window) height;
  window
```
If you want to pass optional arguments to `open_window` you must do so
before the final `unit`, so if you type:

```ocamltop
open_window ();;
```
you must mean "execute `open_window` now with all optional arguments
unspecified". Whereas if you type:

```ocamltop
open_window;;
```
you mean "give me the functional value" or (more usually in the
toplevel) "print out the type of `open_window`".

###  More `~`shorthand
Let's rewrite the `range` function yet again, this time using as much
shorthand as possible for the labels:

```ocamltop
let rec range ~first ~last =
  if first > last then []
  else first :: range ~first:(first+1) ~last
```
Recall that `~foo` on its own is short for `~foo:foo`. This applies also
when calling functions as well as declaring the arguments to functions,
hence in the above the highlighted red `~last` is short for
`~last:last`.

###  Using `?foo` in a function call
There's another little wrinkle concerning optional arguments. Suppose we
write a function around `open_window` to open up an application:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ~width ~height
```
Recall that `~width` is shorthand for `~width:width`. The type of
`width` is `'a option`, but `open_window ~width:` expects an `int`.

OCaml provides more syntactic sugar. Writing `?width` in the function
call is shorthand for writing `~width:(unwrap width)` where `unwrap`
would be a function which would remove the "`option` wrapper" around
`width` (it's not actually possible to write an `unwrap` function like
this, but conceptually that's the idea). So the correct way to write
this function is:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```

###  When and when not to use `~` and `?`
The syntax for labels and optional arguments is confusing, and you may
often wonder when to use `~foo`, when to use `?foo` and when to use
plain `foo`. It's something of a black art which takes practice to get
right.

`?foo` is only used when declaring the arguments of a function, ie:

```ocaml
let f ?arg1 ... =
```
or when using the specialised "unwrap `option` wrapper" form for
function calls:

```ocamltop
let open_application ?width ?height () =
  open_window ~title:"My Application" ?width ?height
```
The declaration `?foo` creates a variable called `foo`, so if you need
the value of `?foo`, use just `foo`.

The same applies to labels. Only use the `~foo` form when declaring
arguments of a function, ie:

```ocaml
let f ~foo:foo ... =
```
The declaration `~foo:foo` creates a variable called simply `foo`, so if
you need the value just use plain `foo`.

Things, however, get complicated for two reasons: Firstly the shorthand
form `~foo` (equivalent to `~foo:foo`), and secondly when you call a
function which takes a labelled or optional argument and you use the
shorthand form.

Here is some apparently obscure code from lablgtk to demonstrate all of
this:

```ocaml
let html ?border_width ?width ?height ?packing ?show () =  (* line 1 *)
  let w = create () in
  load_empty w;
  Container.set w ?border_width ?width ?height;            (* line 4 *)
  pack_return (new html w) ~packing ~show                  (* line 5 *)
```
On line 1 we have the function definition. Notice there are 5 optional
arguments, and the mandatory `unit` 6<sup>th</sup> argument. Each of the
optional arguments is going to define a variable, eg. `border_width`, of
type `'a option`.

On line 4 we use the special `?foo` form for passing optional arguments
to functions which take optional arguments. `Container.set` has the
following type:

```ocaml
module Container = struct
  let set ?border_width ?(width = -2) ?(height = -2) w =
    (* ... *)
```
Line 5 uses the `~`shorthand. Writing this in long form:

```ocaml
pack_return (new html w) ~packing:packing ~show:show
```
The `pack_return` function actually takes mandatory labelled arguments
called `~packing` and `~show`, each of type `'a option`. In other words,
`pack_return` explicitly unwraps the `option` wrapper.

###  Addendum
If you think labels and optional arguments are complicated, that's
because they are! Luckily, however, this is a relatively new feature in
OCaml, and it's not yet widely used. In fact if you're not hacking on
lablgtk, it's unlikely you'll see labels and optional arguments used at
all (at the moment).

## More variants (“polymorphic variants”)
Try compiling the following C code:

```C
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

enum lock { open, close };

main ()
{
  int fd, n;
  char buffer[256];

  fd = open ("/etc/motd", O_RDONLY);                     // line 12
  while ((n = read (fd, buffer, sizeof buffer)) > 0)
    write (1, buffer, n);
  close (fd);                                            // line 15
}
```
When I compile the code I get a whole bunch of errors including:

```text
test.c: In function `main':
test.c:12: error: called object is not a function
test.c:15: error: called object is not a function
```
This illustrates one problem with enumerated types (enums) in C. In the
example above, one enum statement reserves *three* symbols, namely
`lock`, `open` and `close`. Here's another example:

```C
enum lock { open, close };
enum door { open, close };
```
Compiling gives:

```text
test.c:2: error: conflicting types for `open'
test.c:1: error: previous declaration of `open'
test.c:2: error: conflicting types for `close'
test.c:1: error: previous declaration of `close'
```
The first enum defines the symbol `open` as something of type
`enum lock`. You cannot reuse that symbol in another enum.

This will be familiar to most C/C++ programmers, and they won't write
naive code like that above. However the same issue happens with OCaml
variants, but OCaml provides a way to work around it.

Here is some OCaml code, which actually *does* compile:

```ocamltop
type lock = Open | Close
type door = Open | Close
```
After running those two statements, what is the type of `Open`? We can
find out easily enough in the toplevel:

```ocamltop
type lock = Open | Close;;
type door = Open | Close;;
Open;;
```
OCaml uses the most recent definition for `Open`, giving it the type
`door`. This is actually not such a serious problem because if you
accidentally tried to use `Open` in the type context of a `lock`, then
OCaml's wonderful type inference would immediately spot the error and
you wouldn't be able to compile the code.

So far, so much like C. Now I said that OCaml provides a way to work
around the constraint that `Open` can only have one type. In other
words, suppose I want to use `Open` to mean either "the `Open` of type
`lock`" or "the `Open` of type `door`" and I want OCaml to work out
which one I mean.

The syntax is slightly different, but here is how we do it:

```ocamltop
type lock = [ `Open | `Close ];;
type door = [ `Open | `Close ];;
```
Notice the syntactic differences:

1. Each variant name is prefixed with `` ` `` (a back tick).
1. You have to put square brackets (`[]`) around the alternatives.

The question naturally arises: What is the type of `` `Open``?

```ocamltop
`Open;;
```
`` [> `Open] `` can be read as
`` [ `Open | and some other possibilities which we don't know about ] ``.
The “>” (greater than) sign indicates that the set of possibilities is
bigger than those listed (open-ended).

There's nothing special about `` `Open ``. *Any* back-ticked word can be
used as a type, even one which we haven't mentioned before:

```ocamltop
`Foo;;
`Foo 42;;
```
Let's write a function to print the state of a `lock`:

```ocamltop
let print_lock st =
  match st with
  | `Open -> print_endline "The lock is open"
  | `Close -> print_endline "The lock is closed"
```
Take a careful look at the type of that function. Type inference has
worked out that the `st` argument has type `` [< `Close | `Open] ``. The
“<” (less than) sign means that this is a __closed class__. In
other words, this function will only work on `` `Close`` or `` `Open``
and not on anything else.

```ocamltop
print_lock `Open;;
```
Notice that `print_lock` works just as well with a `door` as with a
`lock`! We've deliberately given up some type safety, and type inference
is now being used to help guess what we mean, rather than enforce
correct coding.

This is only an introduction to polymorphic variants. Because of the
reduction in type safety, it is recommended that you don't use these in
your code. You will, however, see them in advanced OCaml code quite a
lot precisely because advanced programmers will sometimes want to weaken
the type system to write advanced idioms.


