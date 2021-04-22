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

We have already written a `map` function from scratch, and it is no surprise
that one is included in the `List` module. There is also a variant for two
lists:

```ocamltop
List.map2 ( + ) [1; 2; 3] [4; 5; 6]
```

In addition, we have an imperative analog to `map`, called `iter`. It takes an
imperative function of type `'a -> unit` and an `'a list` and applies the
function to each element in turn. A suitable function might be `print_endline`,
for which `'a` is `string`:

```ocamltop
List.iter print_endline ["frank"; "james"; "mary"];;
```

There is a variant of `iter` for two lists too:

```ocamltop
List.iter2
  (fun a b -> print_endline (a ^ " " ^ b))
  ["frank"; "james"; "mary"]
  ["carter"; "lee"; "jones"];;
```

Notice that `map2` and `iter2` will fail if the lists are of unequal length:

```ocamltop
List.map2 ( + ) [1; 2; 3] [4; 5]
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
let all =
  not (List.mem false (List.map (fun x -> x mod 2 = 0) [2; 4; 6; 8]));;
let any =
  List.mem true (List.map (fun x -> x mod 2 = 0) [1; 2; 3]);;
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

The function `List.find` returns the first element of a list matching a given
predicate (a predicate is a testing function which returns either true or false
when given an element). It raises an exception if such an element is not found:


```ocamltop
List.find (fun x -> x mod 2 = 0) [1; 2; 3; 4; 5];;
List.find (fun x -> x mod 2 = 0) [1; 3; 5];;
```

The `filter` function again takes a predicate and tests it against each element
in the list, but this time returns the list of all elements which test true:

```ocamltop
List.filter (fun x -> x mod 2 = 0) [1; 2; 3; 4; 5];;
```

If we wish to know also which elements did not test true, we can use
`partition` which returns a pair of lists: the first being the list of elements
for which the predicate is true, the second those for which it is false.

```ocamltop
List.partition (fun x -> x mod 2 = 0) [1; 2; 3; 4; 5];;
```

Note that the documentation for `filter` and `partition` tells us that the
order of the inputs is preserved in the outputs. Where this is not stated it
the documentation, it cannot be assumed.

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

When using association lists, and for other purposes, it is sometimes useful to
be able to make a list of pairs from a pair of lists and vice versa. The `List`
module provides the functions `split` and `combine` for this purpose: 

```ocamltop
List.split [(3, "three"); (1, "one"); (4, "four")];;
List.combine [3; 1; 4] ["three"; "one"; "four"];;
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

### Folds

There are two interestingly-named functions in the List module, `fold_left` and
`fold_right`. Their job is to combine the elements of a list together, using a
given function, accumulating an answer which is then returned. The answer
returned depends upon the function given, the elements of the list, and the
initial value of the accumulator supplied. So you can imagine these are very
general functions. Let's explore `fold_left` first.

In our first example, we supply the addition function and an initial accumulator value of 0:

```ocamltop
List.fold_left ( + ) 0 [1; 2; 3];;
```

The result is the sum of the elements in the list. Now let's use OCaml's
built-in `max` function which returns the larger of two given integers. We use
`min_int`, the smallest possible integer, as our initial acumulator

```ocamltop
List.fold_left max min_int [2; 4; 6; 0; 1];;
```

The largest number in the list is found. Let's look at the type of the
`fold_left` function:

```ocamltop
List.fold_left;;
```

The function is of type `'a -> 'b -> 'a` where `'a` is the accumulator and `'b`
is the type of each element of the list. The next argument is the initial
accumulator, which must be of type `'a`, and then finally the input list of
type `'b list`. The result is the final value of the accumulator, so it must
have type `'a`. Of course, in both of our examples, `'a` and `'b` are the same
as one another. But this is not always so. 

Consider the following definition of `append` which uses `List.fold_right`
(`fold_left` considers the elements from the left, `fold_right` from the
right):

```ocamltop
let append x y =
  List.fold_right (fun e a -> e :: a) x y;;
```

In this example, the initial accumulator is the second list, and each element
of the first is consed to it in turn. You can see the order of arguments to
fold right is a little different:

```ocamltop
List.fold_right;;
```

We can use `fold_right` to define our usual `map` function too:

```ocamltop
let map f l =
  List.fold_right (fun e a -> f e :: a) l [];;
```

But care is needed. If we try that with `List.concat`, which turns a list of lists into a list by concatenating the lists together, we get this:

```ocamltop
let concat l = List.fold_left ( @ ) [] l;;
```

Unfortunately, the order of evalution here is such that larger and larger items
are passed to the `@` operator as its first argument, and so the function has a
worse running time than `List.concat`.

Here are some more redefintions of familiar functions in terms of `fold_left`
or `fold_right`. Can you work out how they operate?

```ocamltop
let length l =
  List.fold_left (fun a _ -> a + 1) 0 l;;

let rev l =
  List.fold_left (fun a e -> e :: a) [] l;;

let setify l =
   List.fold_left
     (fun a e -> if List.mem e a then a else e :: a) [] l;;

let split l =
  List.fold_right
    (fun (x, y) (xs, ys) -> (x :: xs, y :: ys))
    l
    ([], []);;
```
