<!-- ((! set title Set !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Set

`Set` is a functor, which means that it is a module that is parameterized
by another module. More concretely, this means you cannot directly create
a set; instead, you must first specify what type of elements your set will
contain.

The `Set` functor provides a function `Make` which accepts a module as a
parameter, and returns a new module representing a set whose elements have
the type that you passed in. For example, if you want to work with sets of
strings, you can invoke `Set.Make(String)` which will return you a new module
which you can assign the name `SS` (short for "String Set"). Note: Be sure to
pay attention to the case; you need to type `Set.Make(String)` and not
`Set.Make(string)`. The reason behind this is explained in the
"Technical Details" section at the bottom.

Doing this in the OCaml's top level will yield a lot of output:

```ocamltop
module SS = Set.Make(String);;
```

What happened here is that after assigning your newly created module to the name
`SS`, OCaml's top level then displayed the module, which in this case contains
a large number of convenience functions for working with sets (for example `is_empty`
for checking if you set is empty, `add` to add an element to your set, `remove` to
remove an element from your set, and so on).

Note also that this module defines two types: `type elt = String.t` representing
the type of the elements, and `type t = Set.Make(String).t` representing the type of
the set itself. It's important to note this, because these types are used in the
signatures of many of the functions defined in this module.

For example, the `add` function has the signature `elt -> t -> t`, which means
that it expects an element (a String), and a set of strings, and will return to you
a set of strings. As you gain more experience in OCaml and other function languages,
the type signature of functions are often the most convenient form of documentation
on how to use those functions.

## Creating a Set

You've created your module representing a set of strings, but now you actually want
to create an instance of a set of strings. So how do we go about doing this? Well, you
could search through the documentation for the original `Set` functor to try and
find what function or value you should use to do this, but this is an excellent
opportunity to practice reading the type signatures and inferring the answer from them.

You want to create a new set (as opposed to modifying an existing set). So you should
look for functions whose return result has type `t` (the type representing the set),
and which *does not* require a parameter of type `t`.

Skimming through the list of functions in the module, there's only a handful of functions
that match that criteria: `empty: t`, `singleton : elt -> t`, `of_list : elt list -> t`
and `of_seq : elt Seq.t -> t`.

Perhaps you already know how to work with lists and sequences in OCaml or
perhaps you don't. For now, let's assume you don't know, and so we'll focus
our attention on the first two functions in that list: `empty` and `singleton`.

The type signature for `empty` says that it simply returns `t`, i.e. an instance
of our set, without requiring any parameters at all. By intuition, you might
guess that the only reasonable set that a library function could return when
given zero parameters is the empty set. And the fact that the function is named
`empty` reinforces this theory.

Is there a way to test this theory? Perhaps if we had a function which
could print out the size of a set, then we could check if the set we get
from `empty` has a size of zero. In other words, we want a function which
receives a set as a parameter, and returns an integer as a result. Again,
skimming through the list of functions in the module, we see there is a
function which matches this signature: `cardinal : t -> int`. If you're
not familiar with the word "cardinal", you can look it up on Wikipedia
and notice that it basically refers to the size of sets, so this reinforces
the idea that this is exactly the function we want.

So let's test our hypothesis:

```ocamltop
let s = SS.empty;;
SS.cardinal s;;
```

Excellent, it looks like `SS.empty` does indeed create an empty set,
and `SS.cardinal` does indeed print out the size of a set.

What about that other function we saw, `singleton : elt -> t`? Again,
using our intuition, if we provide the function with a single element,
and the function returns a set, then probably the function will return
a set containing that element (or else what else would it do with the
parameter we gave it?). The name of the function is `singleton`, and
again if you're unfamiliar with what word, you can look it up on
Wikipedia and see that the word means "a set with exactly one element".
It sounds like we're on the right track again. Let's test our theory.

```ocamltop
let s = SS.singleton "hello";;
SS.cardinal s;;
```

It looks like we were right again!

## Working with Sets

Now let's say we want to build bigger and more complex sets. Specifically,
let's say we want to add another element to our existing set. So we're
looking for a function with two parameters: One of the parameters should
be the element we wish to add, and the other parameter should be the set
that we're adding to. For the return value, we would expect it to either
return unit (if the function modifies the set in place), or it returns a
new set representing the result of adding the new element. So we're
looking for signatures that look something like `elt -> t -> unit` or
`t -> elt -> unit` (since we don't know what order the two parameters
should appear in), or `elt -> t -> t` or `t -> elt -> t`.

Skimming through the list, we see 2 functions with matching signatures:
`add : elt -> t -> t` and `remove : elt -> t -> t`. Based on their names,
`add` is probably the function we're looking for. `remove` probably removes
an element from a set, and using our intuition again, it does seem like
the type signature makes sense: To remove an element from a set, you need
to tell it what set you want to perform the removal on and what element
you want to remove; and the return result will be the resulting set after
the removal.

Furthermore, because we see that these functions return `t` and not `unit`,
we can infer that these functions do not modify the set in place, but
instead return a new set. Again, we can test this theory:

```ocamltop
let firstSet = SS.singleton "hello";;
let secondSet = SS.add "world" firstSet;;
SS.cardinal firstSet;;
SS.cardinal secondSet;;
```

It looks like our theories were correct!

## Sets of With Custom Comparators

The `SS` module we created uses the built-in comparison function provided
by the `String` module, which performs a case-sensitive comparison. We
can test that with the following code:

```ocamltop
let firstSet = SS.singleton "hello";;
let secondSet = SS.add "HELLO" firstSet;;
SS.cardinal firstSet;;
SS.cardinal secondSet;;
```

As we can see, the `secondSet` has a cardinality of 2, indicating that
`"hello"` and `"HELLO"` are considered two distinct elements.

Let's say we want to create a set which performs a case-insensitive
comparison instead. To do this, we simply have to change the parameter
that we pass to the `Set.Make` function.

The `Set.Make` function expects a struct with two fields: a type `t`
that represents the type of the element, and a function `compare`
whose signature is `t -> t -> int` and essentially returns 0 if two
values are equal, and non-zero if they are non-equal. It just so happens
that the `String` module matches that structure, which is why we could
directly pass `String` as a parameter to `Set.Make`. Incidentally, many
other modules also have that structure, including `Int` and `Float`,
and so they too can be directly passed into `Set.Make` to construct a
set of integers, or a set of floating point numbers.

For our use case, we still want our elements to be of type string, but
we want to change the comparison function to ignore the case of the
strings. We can accomplish this by directly passing in a literal struct
to the `Set.Make` function:

```ocamltop
module CISS = Set.Make(struct
  type t = string
  let compare a b = compare (String.lowercase_ascii a) (String.lowercase_ascii b)
end);;
```

We name the resulting module CISS (short for "Case Insensitive String Set").
We can now test whether this module has the desired behavior:


```ocamltop
let firstSet = CISS.singleton "hello";;
let secondSet = CISS.add "HELLO" firstSet;;
CISS.cardinal firstSet;;
CISS.cardinal secondSet;;
```

Success! `secondSet` has a cardinality of 1, showing that `"hello"`
and `"HELLO"` are now considered to be the same element in this set.
We now have a set of strings whose compare function performs a case
insensitive comparison.

Note that this technique can also be used to allow arbitrary types
to be used as the element type for set, as long as you can define a
meaningful compare operation:

```ocamltop
type color = Red | Green | Blue;;

module SC = Set.Make(struct
  type t = color
  let compare a b =
    match (a, b) with
    | (Red, Red) -> 0
    | (Red, Green) -> 1
    | (Red, Blue) -> 1
    | (Green, Red) -> -1
    | (Green, Green) -> 0
    | (Green, Blue) -> 1
    | (Blue, Red) -> -1
    | (Blue, Green) -> -1
    | (Blue, Blue) -> 0
end);;
```

## Technical Details

### Set.Make, types and modules

As mentioned in a previous section, the `Set.Make` function accepts a structure
with two specific fields, `t` and `compare`. Modules have structure, and thus
it's possible (but not guaranteed) for a module to have the structure that
`Set.Make` expects. On the other hand, types do not have structure, and so you
can never pass a type to the `Set.Make` function. In OCaml, modules start with
an upper case letter and types start with a lower case letter. This is why
when creating a set of strings, you have to use `Set.Make(String)` (passing in
the module named `String`), and not `Set.Make(string)` (which would be attempting
to pass in the type named `string`, which will not work).

### Purely Functional Data Structures

The data structure implemented by the Set functor is a purely functional one.
What exactly that means is a big topic in itself (feel free to search for
"Purely Functional Data Structure" in Google or Wikipedia to learn more). As a
short oversimplification, this means that all instances of the data structure
that you create are immutable. The functions like `add` and `remove` do not
actually modify the set you pass in, but instead return a new set representing
the results of having performed the corresponding operation.

### Full API documentation

This tutorial focused on teaching how to quickly find a function that does what
you want by looking at the type signature. This is often the quickest and most
convenient way to discover useful functions. However, sometimes you do want to
see the formal documentation for the API provided by a module. For sets, the
API documentation you probably want to look at is at
https://ocaml.org/api/Set.Make.html


