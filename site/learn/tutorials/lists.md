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
`[2; 3]`.

An alternative way to write a list is to use the **cons** operator
`head :: tail`. So the following ways to write a list are exactly the
same:

```ocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```

copy & extend stuff from "A First Hour"?

lists of different types. empty list and polymorphism.

the list of lists

cons and append.

pattern matching on lists, intro pattern matching.

length / sum

tail recursive length / sum

rev by accum

non exhaustive pattern matching

append ourselves

example standard library list functions

polymorphic functions over lists
