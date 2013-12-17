<!-- ((! set title Hash Tables !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Hashtbl

## Module Hashtbl
The Hashtbl module implements an efficient, mutable lookup table. To
create a hash table we could write:

```ocamltop
let my_hash = Hashtbl.create 123456;;
```
The 123456 is the initial size of the hashtbl. This initial number is
just your best guess as to the amount of data that you will be putting
into the hash table. The hash table can grow if you under-estimate the
size so don't worry about it too much. The type of my_hash is:

```ocaml
val my_hash : ('_a, '_b) Hashtbl.t
```
The `'_a` and `'_b` correspond to the key and value types, respectively.
There are no concrete types (e.g., `int or float * string`) filled in in
those slots because the type of the key and value are not yet
determined. The underscore indicates that the key and data types, once
chosen, will be fixed. In other words, you can't sometimes use a given
hashtable with ints for keys, and then later use a string as a key in
that same hashtable.

Lets add some data to `my_hash`. Lets say I am working on a cross word
solving program and I want to find all words that start with a certain
letter. First I need to enter the data into `my_hash`.

Note that a hashtable is modified by in-place updates, so, unlike a map,
another hash table is _not_ created every time you change the table. Thus,
the code `let my_hash = Hashtbl.add my_hash ...` wouldn't make any
sense. Instead, we would write something like this:

```ocamltop
Hashtbl.add my_hash "h" "hello";;
Hashtbl.add my_hash "h" "hi";;
Hashtbl.add my_hash "h" "hug";;
Hashtbl.add my_hash "h" "hard";;
Hashtbl.add my_hash "w" "wimp";;
Hashtbl.add my_hash "w" "world";;
Hashtbl.add my_hash "w" "wine";;
```
If we want to find one element in `my_hash` that has an "h" in it then we
would write. Notice how it only returns just one element? That element
was the last one entered in with the value of "h".

```ocamltop
 
Hashtbl.find my_hash "h";;
```
What we probably want is all the elements that start with "h". To do
this we want to find all of them. What better name for this then
`find_all`?

```ocamltop
Hashtbl.find_all my_hash "h";;
```
returns `["hard"; "hug"; "hi"; "hello"]`. To find out if there is an
entry in the my_hash for a letter we would do:

```ocamltop
Hashtbl.mem my_hash "h";;

```
