<!-- ((! set title Objects !)) ((! set learn !)) -->

# Objects

*Table of contents*

## Objects and classes
OCaml is an object-oriented, imperative, functional programming language
:-) It mixes all these paradigms and lets you use the most appropriate
(or most familiar) programming paradigm for the task at hand. In this
chapter I'm going to look at object-oriented programming in OCaml, but
I'm also going to talk about why you might or might not want to write
object-oriented programs.

The classic noddy example used in text books to demonstrate
object-oriented programming is the stack class. This is a pretty
terrible example in many ways, but I'm going to use it here to show the
basics of writing object-oriented OCaml.

Here's some basic code to provide a stack of integers. The class is
implemented using a linked list.

```ocamltop
class stack_of_ints =
  object (self)
    val mutable the_list = ( [] : int list ) (* instance variable *)
    method push x =                        (* push method *)
      the_list <- x :: the_list
    method pop =                           (* pop method *)
      let result = List.hd the_list in
      the_list <- List.tl the_list;
      result
    method peek =                          (* peek method *)
      List.hd the_list
    method size =                          (* size method *)
      List.length the_list
  end
```
The basic pattern `class name = object (self) ... end` defines a class
called `name`.

The class has one instance variable, which is mutable (not constant),
called `the_list`. This is the underlying linked list. We initialize
this (each time a `stack_of_ints` object is created) using a bit of code
that you may not be familiar with. The expression `( [] : int list )`
means "an empty list, of type `int list`". Recall that the simple empty
list `[]` has type `'a list`, meaning a list of any type. However we
want a stack of `int`, not anything else, and so in this case we want to
tell the type inference engine that this list isn't the general "list of
anything" but is in fact the narrower "list of `int`". The syntax
`( expression : type )` means `expression` which is in fact of type
`type`. This *isn't* a general type cast, because you can't use it to
overrule the type inference engine, only to narrow a general type to
make it more specific. So you can't write, for example, `( 1 : float )`:

```ocamltop
(1 : float);;
```
Type safety is preserved. Back to the example ...

This class has four simple methods. `push` pushes an integer onto the
stack. `pop` pops the top integer off the stack and returns it. Notice
the `<-` assignment operator used for updating our mutable instance
variable. It's the same `<-` assignment operator which is used for
updating mutable fields in records.

`peek` returns the top of the stack (ie. head of the list) without
affecting the stack, while `size` returns the number of elements in the
stack (ie. the length of the list).

Let's write some code to test stacks of ints. First let's create a new
object. We use the familiar `new` operator:

```ocamltop
let s = new stack_of_ints
```
Now we'll push and pop some elements off the stack:

```ocamltop
for i = 1 to 10 do
  s#push i
done;;
while s#size > 0 do
  Printf.printf "Popped %d off the stack.\n" s#pop
done;;
```
Notice the syntax. `object#method` means call `method` on `object`. This
is the same as `object.method` or `object->method` that you will be
familiar with in imperative languages.

In the OCaml toplevel we can examine the types of objects and methods in
more detail:

```ocamltop
let s = new stack_of_ints;;
s#push;;
```
`s` is an opaque object. The implementation (ie. the list) is hidden
from callers.

###  Polymorphic classes
A stack of integers is good, but what about a stack that can store any
type? (Not a single stack that can store a mixture of types, but
multiple stacks each storing objects of any single type). As with
`'a list`, we can define `'a stack`:

```ocamltop
class ['a] stack =
  object (self)
    val mutable list = ( [] : 'a list )  (* instance variable *)
    method push x =                      (* push method *)
      list <- x :: list
    method pop =                         (* pop method *)
      let result = List.hd list in
      list <- List.tl list;
      result
    method peek =                        (* peek method *)
      List.hd list
    method size =                        (* size method *)
      List.length list
  end
```
The `class ['a] stack` doesn't really define just one class, but a whole
"class of classes", one for every possible type (ie. an infinitely large
number of classes!) Let's try and use our `'a stack` class. In this
instance we create a stack and push a floating point number onto the
stack. Notice the type of the stack:

```ocamltop
let s = new stack;;
s#push 1.0;;
s;;
```
This stack is now a `float stack`, and only floating point numbers may
be pushed and popped from this stack. (For an explanation of the `'_a`
notation, see the [OCaml expert
FAQ](http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html "http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html")).
Let's demonstrate the type-safety of our new `float stack`:

```ocamltop
s#push 3.0;;
s#pop;;
s#pop;;
s#push "a string";;
```
We can define polymorphic functions which can operate on any type of
stack. Our first attempt is this one:

```ocamltop
let drain_stack s =
  while s#size > 0 do
    ignore (s#pop)
  done
```
Notice the type of `drain_stack`. Cleverly - perhaps *too* cleverly -
OCaml's type inference engine has worked out that `drain_stack` works on
*any* object which has `pop` and `size` methods! So if we defined
another, entirely separate class which happened to contain `pop` and
`size` methods with suitable type signatures, then we might accidentally
call `drain_stack` on objects of that other type.

We can force OCaml to be more specific and only allow `drain_stack` to
be called on `'a stack`s by narrowing the type of the `s` argument, like
this:

```ocamltop
let drain_stack (s : 'a stack) =
  while s#size > 0 do
    ignore (s#pop)
  done
```

###  Inheritance, virtual classes, initializers
I've noticed programmers in Java tend to overuse inheritance, possibly
because it's the only reasonable way of extending code in that language.
A much better and more general way to extend code is usually to use
hooks (cf. Apache's module API). Nevertheless in certain narrow areas
inheritance can be useful, and the most important of these is in writing
GUI widget libraries.

Let's consider an imaginary OCaml widget library similar to Java's
Swing. We will define buttons and labels with the following class
hierarchy:

```
widget  (superclass for all widgets)
  |
  +----> container  (any widget that can contain other widgets)
  |        |
  |        +----> button
  |
  +-------------> label
```
(Notice that a `button` is a `container` because it can contain either a
label or an image, depending on what is displayed on the button).

`widget` is the virtual superclass for all widgets. I want every widget
to have a name (just a string) which is constant over the life of that
widget. This was my first attempt:

```ocamltop
class virtual widget name =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```
Oops! I forgot that OCaml cannot infer the type of `name` so will assume
that it is `'a`. But that defines a polymorphic class, and I didn't
declare the class as polymorphic (`class ['a] widget`). I need to narrow
the type of `name` like this:

```ocamltop
class virtual widget (name : string) =
  object (self)
    method get_name =
      name
    method virtual repaint : unit
  end
```
Now there are several new things going on in this code. Firstly the
class contains an **initializer**. This is an argument to the class
(`name`) which you can think of as exactly the equivalent of an argument
to a constructor in, eg., Java:

```
public class Widget
{
  public Widget (String name)
  {
    ...
  }
}
```
In OCaml a constructor constructs the whole class, it's not just a
specially named function, so we write the arguments as if they are
arguments to the class:

```ocaml
class foo arg1 arg2 ... =
```
Secondly the class contains a virtual method, and thus the whole class
is marked as virtual. The virtual method is our `repaint` method. We
need to tell OCaml it's virtual (`method virtual`), *and* we need to
tell OCaml the type of the method. Because the method doesn't contain
any code, OCaml can't use type inference to automatically work out the
type for you, so you need to tell it the type. In this case the method
just returns `unit`. If your class contains any virtual methods (even
just inherited ones) then you need to specify the whole class as virtual
by using `class virtual ...`.

As in C++ and Java, virtual classes cannot be directly instantiated
using `new`:

```ocamltop
let w = new widget "my widget"
```
Now my `container` class is more interesting. It must inherit from
`widget` and have the mechanics for storing the list of contained
widgets. Here is my simple implementation for `container`:

```ocamltop
class virtual container name =
  object (self)
    inherit widget name
    val mutable widgets = ( [] : widget list )
    method add w =
      widgets <- w :: widgets
    method get_widgets =
      widgets
    method repaint =
      List.iter (fun w -> w#repaint) widgets
  end
```

Notes:

1. The `container` class is marked as virtual. It doesn't contain any
 virtual methods, but in this case I just want to prevent people
 creating containers directly.
1. The `container` class has a `name` argument which is passed directly
 up when constructing the `widget`.
1. `inherit widget name` means that the `container` inherits from
 `widget`, and it passes the `name` argument to the constructor for
 `widget`.
1. My `container` contains a mutable list of widgets and methods to
 `add` a widget to this list and `get_widgets` (return the list of
 widgets).
1. The list of widgets returned by `get_widgets` cannot be modified by
 code outside the class. The reason for this is somewhat subtle, but
 basically comes down to the fact that OCaml's linked lists are
 immutable. Let's imagine that someone wrote this code:

    ```ocaml
    let list = container#get_widgets in
    x :: list
    ```

	Would this modify the private internal representation of my `container`
class, by prepending `x` to the list of widgets? No it wouldn't. The
private variable `widgets` would be unaffected by this or any other
change attempted by the outside code. This means, for example, that you
could change the internal representation to use an array at some later
date, and no code outside the class would need to be changed.


Last, but not least, we have implemented the previously virtual
`repaint` function so that `container#repaint` will repaint all of the
contained widgets. Notice I use `List.iter` to iterate over the list,
and I also use a probably unfamiliar anonymous function expression:

```ocamltop
(fun w -> w#repaint)
```
which defines an anonymous function with one argument `w` that just
calls `w#repaint` (the `repaint` method on widget `w`).

In this instance our `button` class is simple (rather unrealistically
simple in fact, but nevermind that):

```ocamltop
type button_state = Released | Pressed;;

class button ?callback name =
  object (self)
    inherit container name as super
    val mutable state = Released
    method press =
      state <- Pressed;
      match callback with
      | None -> ()
      | Some f -> f ()
    method release =
      state <- Released
    method repaint =
      super#repaint;
      print_endline ("Button being repainted, state is " ^
                     (match state with
                      | Pressed -> "Pressed"
                      | Released -> "Released"))
  end
```

Notes:

1. This function has an optional argument (see the previous chapter)
 which is used to pass in the optional callback function. The
 callback is called when the button is pressed.
1. The expression `inherit container name as super` names the
 superclass `super`. I use this in the `repaint` method:
 `super#repaint`. This expressly calls the superclass method.
1. Pressing the button (calling `button#press` in this rather
 simplistic code) sets the state of the button to `Pressed` and calls
 the callback function, if one was defined. Notice that the
 `callback` variable is either `None` or `Some f`, in other words it
 has type `(unit -> unit) option`. Reread the previous chapter if you
 are unsure about this.
1. Notice a strange thing about the `callback` variable. It's defined
 as an argument to the class, but any method can see and use it. In
 other words, the variable is supplied when the object is
 constructed, but persists over the lifetime of the object.
1. The `repaint` method has been implemented. It calls the superclass
 (to repaint the container), then repaints the button, displaying the
 current state of the button.

Before defining our `label` class, let's play with the `button` class in
the OCaml toplevel:

```ocamltop
let b = new button ~callback:(fun () -> print_endline "Ouch!") "button";;
b#repaint;;
b#press;;
b#repaint;;
b#release;;
```
Here's our comparatively trivial `label` class:

```ocamltop
class label name text =
  object (self)
    inherit widget name
    method repaint =
      print_endline ("Label: " ^ text)
  end;;
```
Let's create a label which says "Press me!" and add it to the button:

```ocamltop
let l = new label "label" "Press me!";;
b#add l;;
b#repaint;;
```

###  A note about `self`
In all the examples above we defined classes using the general pattern:

```ocaml
class name =
  object (self)
    (* ... *)
  end;;
```
I didn't explain the reference to `self`. In fact this names the object,
allowing you to call methods in the same class or pass the object to
functions outside the class. In other words, it's exactly the same as
`this` in C++/Java and `$self` in Perl. You may completely omit the
`(self)` part if you don't need to refer to yourself - indeed in all the
examples above we could have done exactly that. However, I would advise
you to leave it in there because you never know when you might modify
the class and require the reference to `self`. There is no penalty for
having it.

###  Inheritance and coercions
```ocamltop
let b = new button "button";;
let l = new label "label" "Press me!";;
[b; l];;
```
I created a button `b` and a label `l` and I tried to create a list
containing both, but I got an error. Yet `b` and `l` are both `widget`s,
so why can't I put them into the same list? Perhaps OCaml can't guess
that I want a `widget list`? Let's try telling it:

```ocamltop
let wl = ([] : widget list);;
let wl = b :: wl;;
```
It turns out that OCaml doesn't coerce subclasses to the type of the
superclass by default, but you can tell it to by using the `:>`
(coercion) operator:

```ocamltop
let wl = (b :> widget) :: wl;;
let wl = (l :> widget) :: wl;;
```
The expression `(b :> widget)` means "coerce the button `b` to have type
`widget`". Type-safety is preserved because it is possible to tell
completely at compile time whether the coercion will succeed.

Actually, coercions are somewhat more subtle than described above, and
so I urge you to read the manual to find out the full details.

The `container#add` method defined above is actually incorrect, and
fails if you try to add widgets of different types into a `container`. A
coercion would fix this.

Is it possible to coerce from a superclass (eg. `widget`) to a subclass
(eg. `button`)? The answer, perhaps surprisingly, is NO! Coercing in
this direction is *unsafe*. You might try to coerce a `widget` which is
in fact a `label`, not a `button`.

The problem of coercing from a superclass to a subclass will be familiar
to Java programmers. In Java the container types contain `Object`s, and
when you extract an object from a container you must cast it back to its
original type. This can cause runtime `ClassCastException`s. OCaml's
strong type system has the specific goal of eliminating runtime type
errors, and this is why this sort of coercion is not permitted.

Polymorphism and functional programming should remove most of the need
to coerce from superclasses to subclasses. Java's container classes
store `Object`s because Java (at time of writing) lacks generics
("templates" in C++ or polymorphism in OCaml). This is a fault in the
Java language - a pretty fundamental fault in fact - which will
hopefully be fixed in Java 1.5. In OCaml it's so simple to define
polymorphic types like `'a list` or `'a stack` that Java-like
programming just wouldn't be required. Having said that, if you do
extensive OO programming in OCaml then I'm pretty sure you'll come up
with a case where this type of coercion would actually be darned useful.
Perhaps for this reason it's enough to say that you might try
implementing solutions functionally first, and in an OO style only in
the few problem domains where it really makes sense.

[Yamagata Yoriyuki writes that type-safe downcasts are possible.
Advanced users should see:
[http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html](http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html)
, that leads to
[hweak](http://remi.vanicat.free.fr/ocaml/hweak/ "http://remi.vanicat.free.fr/ocaml/hweak/")]

###  The `Oo` module and comparing objects
The `Oo` module contains a few useful functions for OO programming.

`Oo.copy` makes a shallow copy of an object. `Oo.id object` returns a
unique identifying number for each object (a unique number across all
classes).

`=` and `<>` can be used to compare objects for *physical* equality (an
object and its copy are not physically identical). You can also use `<`
etc. which provides an ordering of objects based apparently on their
IDs.

## Objects without class
Here we examine how to use objects pretty much like records, without
necessarily using classes.

###  Immediate objects and object types
Objects can be used instead of records, and have some nice properties
that can make them preferrable to records in some cases. We saw that the
canonical way of creating objects is to first define a class, and use
this class to create individual objects. This can be cumbersome in some
situations since class definitions are more than a type definition and
cannot be defined recursively with types. However, objects have a type
that is very analog to a record type, and it can be used in type
definitions. In addition, objects can be created without a class. They
are called *immediate objects*. Here is the definition of an immediate
object:

```ocamltop
let o =
  object
    val mutable n = 0
    method incr = n <- n + 1
    method get = n
  end
```
This object has a type, which is defined by its public methods only.
Values are not visible and neither are private methods (not shown).
Unlike records, such a type does not need to be predefined explicitely,
but doing so can make things clearer. We can do it like this:

```ocamltop
type counter = < get : int;  incr : unit >
```
Compare with an equivalent record type definition:

```ocamltop
type counter_r = { get : unit -> int;
                   incr : unit -> unit }
```
The implementation of a record working like our object would be:

```ocamltop
let r =
  let n = ref 0 in
  { get = (fun () -> !n);
    incr = (fun () -> incr n) }
```
In terms of functionality, both the object and the record are similar,
but each solution has its own advantages:

* **speed**: slightly faster field access in records
* **field names**: it is inconvenient to manipulate records of
 different types when some fields are named identically but it's not
 a problem with objects
* **subtyping**: it is impossible to coerce the type of a record to a
 type with less fields. That is however possible with objects, so
 objects of different kinds that share some methods can be mixed in a
 data structure where only their common methods are visible (see next
 section)
* **type definitions**: there is no need to define an object type in
 advance, so it lightens the dependency contraints between modules

###  Class types vs. just types
Beware of the confusion between *class types* and object *types*. A
*class type* is not a data *type*, normally referred to as *type* in the
OCaml jargon. An object *type* is a kind of data *type*, just like a
record type or a tuple.

When a class is defined, both a *class type* and an object *type* of the
same name are defined:

```ocamltop
class t =
  object
    val x = 0
    method get = x
 end
```
`object val x : int method get : int end` is a class type.

In this example, `t` is also the type of objects that this class would
create. Objects that derive from different classes or no class at all
(immediate objects) can be mixed together as long as they have the same
type:

```ocamltop
let x = object method get = 123 end;;
let l = [ new t; x ];;
```
Mixing objects that share a common subtype can be done, but requires
explicit type coercion using the `:>` operator:

```ocamltop
let x = object method get = 123 end;;
let y = object method get = 80 method special = "hello" end;;
let l = [ x; y ];;
let l = [ x; (y :> t) ];;
```

## More objects
The OCaml manual, chapter 3, contains the canonical reference for
objects and classes. Amongst the things which I have not covered here,
but which are covered in the manual, are:

* private methods
* complex constructors
* interfaces
* multiple inheritance
* polymorphic methods
* more detail about coercions
* functional objects
* more detail about cloning objects
* mutually recursive classes
* binary methods
* friends
