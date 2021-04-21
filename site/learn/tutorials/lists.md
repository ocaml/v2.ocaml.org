<!-- ((! set title Lists !)) ((! set learn !)) -->

*Table of contents*

# Lists

A list is an ordered sequence of elements. All elements of a list in OCaml
must be the same type. Lists are built into the language, and have a special
syntax. Here is a list of three integers:

```ocamltop
[1; 2; 3]
```

Note semicolons separate the element, not commas. The empty list is written
`[]`. The type of this list of integers is `int list`.

A list has a *head* (the first element) and a *tail* (the list consisting of
the rest of the elements). The head is an element, and the tail is a list, so
in the above example, the head is the integer `1` while the tail is the *list*
`[2; 3]`. An empty list has neither a head nor a tail. Here are some more lists:

```ocamltop
[];;

[1; 2; 3];;

[false; false; true];;

[[1; 2]; [3; 4]; [5; 6]];;
```

Notice the type of the empty list is `'a list` (its element type is not known).
Notice also the type of the last list - `int list list` or a list of lists of
integers.

There are two built-in operators on lists. The `::` or cons operator, adds one
element to the front of a list. The `@` or append operator combines two lists:

```ocamltop
1 :: [2; 3];;

[1] @ [2; 3];;
```

## Functions on lists

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

## Tail Recursion with Lists

length / sum rev by accum

## Higher order functions on lists

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

add left fold, right fold

## List complexity (time and space) and hd/tl not complete problems


## A tour of the standard library List module

The standard library [List](https://ocaml.org/api/List.html) module contains a
wide range of useful utility functions, including pre-written versions of many
of the functions we have written in this tutorial. A version of the module with
labeled functions is available as part of
[StdLabels](https://ocaml.org/api/StdLabels.html).

In the List module documenation, non tail-recursive functions are marked
specially. As always, functions which can raise an exception are marked with
the exception kind.

### Maps and iterators on one and two lists

map, iter

map2 etc.

```ocamltop
```

### List scanning

The useful function [`mem`](https://ocaml.org/api/List.html#VALmem) checks
whether a given element is a member of a list by scanning its contents:

```ocamltop
List.mem "frank" ["james"; "frank"; "mary"];;
List.mem [] [[1; 2]; [3]; []; [5]];;
```

There are more elaborate scanning functions: imagine we wish to check to see if
all elements of a list are even, or if any element is even. We could either
write functions to go over each element of the list, keeping a boolean check,
or use `mem` and other functions already known to us:

```ocamltop
let all = not (List.mem false (List.map (fun x -> x mod 2 = 0) [2; 4; 6; 8]));;
let any = List.mem true (List.map (fun x -> x mod 2 = 0) [1; 2; 3]);;
```

This is rather clumsy, though. The standard library provides two useful
functions [`for_all`](https://ocaml.org/api/List.html#VALfor_all) and
[`exists`](https://ocaml.org/api/List.html#VALexists) for this common problem:

```ocamltop
List.for_all (fun x -> x mod 2 = 0) [2; 4; 6; 8];;
List.exists (fun x -> x mod 2 = 0) [1; 2; 3];;
```

So you can see how the standard library has evolved into its present state:
useful pieces of frequently-rewritten code are chosen, and made into useful
standalone functions.

### List searching

find / filter / partition

```ocamltop
```

### Association lists

Association lists are a simple (and simplistic) way of implementing the
dictionary data structure: that is to say, a group of keys each with an
associated value. For large dictionaries, for efficiency, we would use the
standard library's [Map](https://ocaml.org/api/Map.html) or
[Hashtbl](https://ocaml.org/api/Hashtbl.html) modules. But these functions from
the List module are useful for lists which are generally small, and have other
advantages: since they are just lists of pairs, they can be built and modified
easily. They are also easily printed in the toplevel.

```ocamltop
List.assoc 4 [(3, "three"); (1, "one"); (4, "four")];;
List.mem_assoc 4 [(3, "three"); (1, "one"); (4, "four")];;
```

### Lists of pairs

split / combine

```ocamltop
```

### Sorting lists

The function [`List.sort`](https://ocaml.org/api/List.html#VALsort), given a
comparison function of type `'a -> 'a -> int` (zero if equal, negative if first
smaller, positive if second smaller) and an input list of type `'a list`,
returns the list sorted according to the comparison function. Usually, we us
the built-in comparison function
[`compare`](https://ocaml.org/api/Stdlib.html#VALcompare) which can compare two
values of like type with the exception of functions which are incomparable.

```ocamltop
List.sort compare [1; 4; 6; 4; 1];;
List.sort compare ["Reynolds"; "Smith"; "Barnes"];;
List.sort (Fun.flip compare) [1; 4; 6; 4; 1];;
List.sort compare [(1, 3); (1, 2); (2, 3); (2, 2)];;
List.sort
  (fun a b -> compare (fst a) (fst b))
  [(1, 3); (1, 2); (2, 3); (2, 2)];;
```
