<!-- ((! set title Functors !)) ((! set learn !)) -->

*Table of contents*

# Functors

Functors are probably one of the most complex features of OCaml, but you don't
have to use them extensively to be a successful OCaml programmer.  Actually,
you may never have to define a functor yourself, but you will surely encounter
them in the standard library. They are the only way of using the Set and Map
modules, but using them is not so difficult.

##  What are functors and why do we need them?

A functor is a module that is parametrized by another module, just like a
function is a value which is parametrized by other values, the arguments.

It allows one to parametrize a type by a value, which is not possible directly
in OCaml without functors. For example, we can define a functor that takes an
int n and returns a collection of array operations that work exclusively on
arrays of length n. If by mistake the programmer passes a regular array to one
of those functions, it will result in a compilation error. If we were not using
this functor but the standard array type, the compiler would not be able to
detect the error, and we would get a runtime error at some undetermined date in
the future, which is much worse.

##  Using an existing functor

The standard library defines a `Set` module, which provides a `Make` functor.
This functor takes one argument, which is a module that provides (at least) two
things: the type of elements, given as `t` and the comparison function given as
`compare`. The point of the functor is to ensure that the same comparison
function will always be used, even if the programmer makes a mistake.

For example, if we want to use sets of ints, we would do this:

```ocamltop
module Int_set =
  Set.Make (struct
              type t = int
              let compare = compare
            end)
```

For sets of strings, it is even easier because the standard library provides a
`String` module with a type `t` and a function `compare`. If you were following
carefully, by now you must have guessed how to create a module for the
manipulation of sets of strings:

```ocamltop
module String_set = Set.Make (String)
```

(the parentheses are necessary)

##  Defining functors

A functor with one argument can be defined like this:

```ocaml
module F (X : X_type) = struct
  ...
end
```

where `X` is the module that will be passed as argument, and `X_type` is its
signature, which is mandatory.

The signature of the returned module itself can be constrained, using this
syntax:

```ocaml
module F (X : X_type) : Y_type =
struct
  ...
end
```

or by specifying this in the .mli file:

```ocaml
module F (X : X_type) : Y_type
```

Overall, the syntax of functors is hard to grasp. The best may be to look at
the source files
[`set.ml`](https://github.com/ocaml/ocaml/blob/trunk/stdlib/set.ml) or
[`map.ml`](https://github.com/ocaml/ocaml/blob/trunk/stdlib/map.ml) of the
standard library.

<div class="bottom-navigation">
<a href = "null_pointers_asserts_and_warnings.html" class="previous">« Null Pointers, Asserts, and Warnings</a><a href="objects.html" class="next">Objects »</a>
</div>
