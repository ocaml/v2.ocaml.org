<!-- ((! set title Set !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Set

## Module Set
To make a set of strings:

```ocamltop
module SS = Set.Make(String);;
```
To create a set you need to start somewhere so here is the empty set

```ocamltop
let s = SS.empty;;
```
Alternatively if we know an element to start with we can create a set
like

```ocamltop
let s = SS.singleton "hello";;
```
To add some elements to the the set we can do.

```ocamltop
let s =
  List.fold_right SS.add ["hello"; "world"; "community"; "manager";
                          "stuff"; "blue"; "green"] s;;
```
Now if we are playing around with sets we will probably want to see what
is in the set that we have created. To do this we can write a function
that will print the set out.

```ocamltop
(* Prints a new line "\n" after each string is printed *)
let print_set s = 
   SS.iter print_endline s;;
```
If we want to remove a specific element of a set there is a remove
function. However if we want to remove several elements at once we could
think of it as doing a 'filter'. Let's filter out all words that are
longer than 5 characters.

This can be written as:

```ocamltop
let my_filter str =
  String.length str <= 5;;
let s2 = SS.filter my_filter s;;
```
or using an anonymous function:

```ocamltop
let s2 = SS.filter (fun str -> String.length str <= 5) s;;
```
If we want to check and see if an element is in the set it might look
like this.

```ocamltop
SS.exists (fun str -> str = "hello") s2;;
```
or even:

```ocamltop
SS.exists (( = ) "hello") s2;;
```
The Set module also provides the set theoretic operations union,
intersection and difference. For example, the difference of the original
set and the set with short strings (≤ 5 characters) is the set of long
strings:

```ocamltop
print_set (SS.diff s s2);;
```
Note that the Set module provides a purely functional data structure:
removing an element from a set does not alter that set but, rather,
returns a new set that is very similar to (and shares much of its
internals with) the original set.


