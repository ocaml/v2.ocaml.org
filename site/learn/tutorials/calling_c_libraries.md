<!-- ((! set title Calling C libraries  !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Calling C libraries

## Note from Rich
Chapters 12 and 13 really need to be rewritten from scratch.

I've left them here — you can read them, but the formatting is screwy.

## MiniGtk
While the structure of lablgtk outlined in [Introduction to
Gtk](introduction_to_gtk.html "Introduction to Gtk") seems perhaps
over-complex, it's worth considering exactly why the author chose two
layers. To appreciate this, you really need to get your hands dirty and
look at other ways that a Gtk wrapper might have been written.

To this end I played around with something I call
\<dfn\>MiniGtk\</dfn\>, intended as a simple Gtk wrapper. All MiniGtk is
capable of is opening a window with a label, but after writing MiniGtk I
had renewed respect for the author of lablgtk!

MiniGtk is also a good tutorial for people who want to write OCaml
bindings around their favorite C library. If you've ever tried to write
bindings for Perl or Java, you'll find doing the same for OCaml is
surprisingly easy, although you do have to worry a bit about the garbage
collector.

Let's talk first about how MiniGtk is structured: rather than using a
two layered approach as with lablgtk, I wanted to implement MiniGtk
using a single (object-oriented) layer. This means that MiniGtk consists
of a bunch of class definitions. Methods in those classes pretty much
directly translate into calls to the C `libgtk-1.2.so` library.

I also wanted to rationalise the module naming scheme for Gtk. So there
is exactly one top-level module called (surprise!) `Gtk` and all classes
are inside this module. A test program looks like this:

```ocaml
let win = new Gtk.window ~title:"My window" ();;
let lbl = new Gtk.label ~text:"Hello" ();;
win#add lbl;;

let () =
  Gtk.main ()
```
I defined a single abstract type to cover all `GtkObject`s (and
"subclasses" of this C structure). In the `Gtk` module you'll find this
type definition:

```ocaml
type obj
```
As discussed in the last chapter, this defines an abstract type of which
it is impossible to create any instances. In OCaml, at least. Certain C
functions are going to create instances of this type. For instance, the
function which creates new labels (ie. `GtkLabel` structures) is defined
this way:

```ocaml
external gtk_label_new : string -> obj = "gtk_label_new_c"
```
This strange function definition defines an \<dfn\>external
function\</dfn\>, one coming from C. The C function is called
`gtk_label_new_c`, and it takes a string and returns one of our abstract
`obj` types.

OCaml doesn't quite let you call *any* C function yet. You need to write
a little C wrapper around the library's function to translate to and
from OCaml's internal types and C types. `gtk_label_new_c` (note the
additional `_c`) is my wrapper around the real Gtk C function called
`gtk_label_new`. Here it is. I'll explain more about it later.

```C
CAMLprim value
gtk_label_new_c (value str)
{
  CAMLparam1 (str);
  CAMLreturn (wrap (GTK_OBJECT (
    gtk_label_new (String_val (str)))));
 }
```
Before explaining this function further, I'm going to take a step back
and look at the hierarchy of our Gtk classes. I've chosen to reflect the
actual Gtk widget hierarchy as closely as possible. All Gtk widgets are
derived from a virtual base class called `GtkObject`. In fact from this
class is derived `GtkWidget` and the whole variety of Gtk widgets are
derived from this. So we define our own `GtkObject` equivalent class
like this (note that `object` is a reserved word in OCaml).

```ocaml
type obj

class virtual gtk_object (obj : obj) =
object (self)
  val obj = obj
  method obj = obj
end
```
`type obj` defines our abstract object type, and `class gtk_object`
takes one of these "things" as a parameter to its constructor. Recall
from above that this parameter is actually the C `GtkObject` structure
(in fact it's a specially wrapped pointer to this structure).

You can't create `gtk_object` instances directly because it's a virtual
class, but if you could you'd have to construct them like this:
`new gtk_object obj`. What would you pass as that `obj` parameter? You'd
pass the return value of, for instance, `gtk_label_new` (go back and
have a look at how that `external` function was typed). This is shown
below:

```ocaml
(* Example code, not really part of MiniGtk! *)
class label text =
  let obj = gtk_label_new text in
  object (self)
    inherit gtk_object obj
  end
```
Of course the real `label` class doesn't inherit directly from
`gtk_object` as shown above, but in principle this is how it works.

Following the Gtk class hierarchy the only class derived directly from
`gtk_object` is our `widget` class, defined like this:

```ocaml
external gtk_widget_show : obj -> unit = "gtk_widget_show_c"
external gtk_widget_show_all : obj -> unit = "gtk_widget_show_all_c"

class virtual widget ?show obj =
  object (self)
    inherit gtk_object obj
    method show = gtk_widget_show obj
    method show_all = gtk_widget_show_all obj
    initializer if show <> Some false then self#show
  end
```
This class is considerably more complex. Let's look at the
initialization code first:

```ocaml
class virtual widget ?show obj =
  object (self)
    inherit gtk_object obj
    initializer
      if show <> Some false then self#show
  end
```
The `initializer` section may well be new to you. This is code which
runs when an object is being created - the equivalent of a constructor
in other languages. In this case we check the boolean optional `show`
argument and unless the user specified it explicitly as `false` we
automatically call the `#show` method. (All Gtk widgets need to be
"shown" after being created unless you want a widget to be created but
hidden).

The actual definition of the methods happens with the help of a couple
of external functions. These are basically direct calls to the C library
(well, in fact there's a tiny bit of wrapper code, but that's not
functionally important).

```ocaml
method show = gtk_widget_show obj
method show_all = gtk_widget_show_all obj
```
Notice that we pass the underlying `GtkObject` to both C library calls.
This makes sense because these functions are prototyped as
`void gtk_widget_show (GtkWidget *);` in C (`GtkWidget` and `GtkObject`
are safely used interchangably in this context).

I want to describe the `label` class (the real one this time!), but in
between `widget` and `label` is `misc`, a generic class which describes
a large class of miscellaneous widgets. This class just adds padding and
alignment around a widget such as a label. Here is its definition:

```ocaml
let may f x =
  match x with
  | None -> ()
  | Some x -> f x

external gtk_misc_set_alignment :
  obj -> float * float -> unit = "gtk_misc_set_alignment_c"
external gtk_misc_set_padding :
  obj -> int * int -> unit = "gtk_misc_set_padding_c"

class virtual misc ?alignment ?padding ?show obj =
  object (self)
    inherit widget ?show obj
    method set_alignment = gtk_misc_set_alignment obj
    method set_padding = gtk_misc_set_padding obj
    initializer
      may (gtk_misc_set_alignment obj) alignment;
      may (gtk_misc_set_padding obj) padding
  end
```

We start with a helper function called
`may : ('a -> unit) -> 'a option -> unit` which invokes its first
argument on the contents of its second unless the second argument is
`None`. This trick (stolen from lablgtk of course) is very useful when
dealing with optional arguments as we'll see.

The methods in `misc` should be straightforward. What is tricky is the
initialization code. First notice that we take optional `alignment` and
`padding` arguments to the constructor, and we pass the optional `show`
and mandatory `obj` arguments directly up to `widget`. What do we do
with the optional `alignment` and `padding`? The initializer uses these:

```ocaml
initializer
  may (gtk_misc_set_alignment obj) alignment;
  may (gtk_misc_set_padding obj) padding 
```
It's that tricky `may` function in action. *If* the user gave an
`alignment` argument, then this will set the alignment on the object by
calling `gtk_misc_set_alignment obj the_alignment`. But more commonly
the user will omit the `alignment` argument, in which case `alignment`
is `None` and this does nothing. (In effect we get Gtk's default
alignment, whatever that is). A similar thing happens with the
`padding`. Note there is a certain simplicity and elegance in the way
this is done.

Now we can finally get to the `label` class, which is derived directly
from `misc`:

```ocaml
external gtk_label_new :
    string -> obj  = "gtk_label_new_c"
external gtk_label_set_text :
    obj -> string -> unit = "gtk_label_set_text_c"
external gtk_label_set_justify :
    obj -> Justification.t -> unit = "gtk_label_set_justify_c"
external gtk_label_set_pattern :
    obj -> string -> unit = "gtk_label_set_pattern_c"
external gtk_label_set_line_wrap :
    obj -> bool -> unit = "gtk_label_set_line_wrap_c"

class label ~text
  ?justify ?pattern ?line_wrap ?alignment
  ?padding ?show () =
  let obj = gtk_label_new text in
  object (self)
    inherit misc ?alignment ?padding ?show obj
    method set_text = gtk_label_set_text obj
    method set_justify = gtk_label_set_justify obj
    method set_pattern = gtk_label_set_pattern obj
    method set_line_wrap = gtk_label_set_line_wrap obj
    initializer
      may (gtk_label_set_justify obj) justify;
      may (gtk_label_set_pattern obj) pattern;
      may (gtk_label_set_line_wrap obj) line_wrap
  end
```
Although this class is bigger than the ones we've looked at up til now,
it's really more of the same idea, *except* that this class isn't
virtual. You can create instances of this class which means it finally
has to call `gtk_..._new`. This is the initialization code (we discussed
this pattern above):

```ocaml
class label ~text ... () =
  let obj = gtk_label_new text in
  object (self)
    inherit misc ... obj
  end
```
(Pop quiz: what happens if we need to define a class which is both a
base class from which other classes can be derived, and is also a
non-virtual class of which the user should be allowed to create
instances?)

####  Wrapping calls to C libraries
Now we'll look in more detail at actually wrapping up calls to C library
functions. Here's a simple example:

```C
/* external gtk_label_set_text :
     obj -> string -> unit
       = "gtk_label_set_text_c" */

CAMLprim value
gtk_label_set_text_c (value obj, value str)
{
  CAMLparam2 (obj, str);
  gtk_label_set_text (unwrap (GtkLabel, obj),
    String_val (str));
  CAMLreturn (Val_unit);
}
```
Comparing the OCaml prototype for the external function call (in the
comment) with the definition of the function we can see two things:

* The C function that OCaml calls is named `"gtk_label_set_text_c"`.
* Two arguments are passed (`value obj` and `value str`) and a unit is
 returned.

Values are OCaml's internal representation of all sorts of things from
simple integers through to strings and even objects. I'm not going to go
into any great detail about the `value` type because it is more than
adequately covered in the OCaml manual. To use `value` you need to just
know what macros are available to convert between a `value` and some C
type. The macros look like this:

\<dl\> \<dt\>`String_val (val)`\</dt\> \<dd\> Convert from a `value`
which is known to be a string to a C string (ie. `char *`). \</dd\>
\<dt\>`Val_unit`\</dt\> \<dd\> The OCaml unit `()` as a `value`. \</dd\>
\<dt\>`Int_val (val)`\</dt\> boolean \<dd\> Convert from a `value` which
is known to be an integer to a C `int`. \</dd\>
\<dt\>`Val_int (i)`\</dt\> \<dd\> Convert from a C integer `i` into an
integer `value`. \</dd\> \<dt\>`Bool_val (val)`\</dt\> \<dd\> Convert
from a `value` which is known to be a boolean to a C boolean (ie. an
`int`). \</dd\> \<dt\>`Val_bool (i)`\</dt\> \<dd\> Convert from a C
integer `i` into a boolean `value`. \</dd\> \</dl\>

You can guess the others or consult the manual. Note that there is no
straightforward conversion from C `char *` to a value. This involves
allocating memory, which is somewhat more complicated.

In `gtk_label_set_text_c` above, the `external` definition, plus strong
typing and type inference, has already ensured that the arguments are of
the correct type, so to convert `value str` to a C `char *` we called
`String_val (str)`.

The other parts of the function are a bit stranger. To ensure that the
garbage collector "knows" that your C function is still using `obj` and
`str` while the C function is running (remember that the garbage
collector might be triggered within your C function by a number of
events - a callback to OCaml or using one of OCaml's allocation
functions), you need to frame the function to add code to tell the
garbage collector about the "roots" that you're using. And tell the
garbage collector when you finish using those roots too, of course. This
is done by framing the function within `CAMLparamN` ... `CAMLreturn`.
Hence:

```C
CAMLparam2 (obj, str);
...
CAMLreturn (Val_unit); 
```
`CAMLparam2` is a macro saying that you're using two `value` parameters.
(There is another macro for annotating local `value` variables too). You
need to use `CAMLreturn` instead of plain `return` which tells the GC
you've finished with those roots. It might be instructive to examine
what code is inlined when you write `CAMLparam2 (obj, str)`. This is the
generated code (with the author's version of OCaml, so it might vary
between implementations slightly):

```C
struct caml__roots_block *caml__frame
    = local_roots;
struct caml__roots_block caml__roots_obj;

caml__roots_obj.next = local_roots;
local_roots = &caml__roots_obj;
caml__roots_obj.nitems = 1;
caml__roots_obj.ntables = 2;
caml__roots_obj.tables [0] = &obj;
caml__roots_obj.tables [1] = &str; 
```
And for `CAMLreturn (foo)`:

```C
local_roots = caml__frame;
return (foo); 
```
If you follow the code closely you'll see that `local_roots` is
obviously a linked list of `caml__roots_block` structures. One (or more)
of these structures is pushed onto the linked list when we enter the
function, and all of these are popped back off when we leave, thus
restoring `local_roots` to its previous state when we leave the
function. (*If* you remembered to call `CAMLreturn` instead of `return`
of course - otherwise `local_roots` will end up pointing at
uninitialised data on the stack with "hilarious" consequences).

Each `caml__roots_block` structure has space for up to five `value`s
(you can have multiple blocks, so this isn't a limitation). When the GC
runs we can infer that it must walk through the linked list, starting at
`local_roots`, and treat each `value` as a root for garbage collection
purposes. The consequences of *not* declaring a `value` parameter or
local `value` variable in this way would be that the garbage collector
might treat that variable as unreachable memory and thus reclaim it
while your function is running!

`CAMLprim` is a Windows-only thing and so we won't talk about it ...

Finally there is the mysterious `unwrap` macro. This is one I wrote
myself, or rather, this is one I mostly copied from lablgtk. There are
two related functions, called `wrap` and `unwrap` and as you might
possibly have guessed, they wrap and unwrap `GtkObject`s in OCaml
`value`s. These functions establish the somewhat magical relationship
between `GtkObject` and our opaque, mysterious `obj` type which we
defined for OCaml (see the very first part of this chapter to remind
yourself).

The problem is how do we wrap up (and hide) the C `GtkObject` structure
in a way that we can pass it around as an opaque "thing" (`obj`) through
our OCaml code, and hopefully pass it back later to a C function which
can unwrap it and retrieve the same `GtkObject` back again?

In order for it to get passed to OCaml code at all, we must somehow
convert it to a `value`. Luckily we can quite easily use the C API to
create `value` blocks which the OCaml garbage collector *won't* examine
too closely ......


