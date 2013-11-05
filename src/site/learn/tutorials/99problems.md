<!-- ((! set title 99 problems  !)) ((! set learn !)) -->

**Your Help is Needed**   
Many of the solutions below have been written by [Victor
Nicollet](https://github.com/VictorNicollet/99-Problems-OCaml). Please
contribute more solutions or improve the existing ones.

*Table of contents*

# 99 Problems (solved) in OCaml
This section is inspired by [Ninety-Nine Lisp
Problems](http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html)
which in turn was based on “[Prolog problem
list](https://sites.google.com/site/prologsite/prolog-problems/)”. For
each of these questions, some simple tests are shown—they may also serve
to make the question clearer if needed. To work on these problems, we
recommend you first [install OCaml](../install.html) or use it [inside
your browser](http://try.ocamlpro.com/). The source of the following
problems is available on
[GitHub](https://github.com/VictorNicollet/99-Problems-OCaml).

## Working with lists
Write a function `last : 'a list -> 'a       option` that returns the
last element of a list.

Solution

```tryocaml
let rec last = function
  | [] -> None
  | [x] -> Some x
  | _ :: t -> last t
 last [ "a" ; "b" ; "c" ; "d" ] = Some "d";;
last [] = None;;
```
Find the last but one (last and penultimate) elements of a list.

Solution

```tryocaml
let rec last_two = function
  | [] | [_] -> None
  | [x;y] -> Some (x,y)
  | _::t -> last_two t
 last_two [ "a" ; "b" ; "c" ; "d" ] = Some ("c", "d") ;;
last_two [ "a" ] = None;;
```
Find the `k`'th element of a list.

Solution

```tryocaml
let rec at k = function
  | [] -> None
  | h :: t -> if k = 1 then Some h else at (k-1) t
  at 3 [ "a" ; "b"; "c"; "d"; "e" ] = Some "c" ;;

at 3 [ "a" ] = None ;;
```
Find the number of elements of a list.

OCaml standard library has `List.length` but we ask that you reimplement
it. Bonus for a [tail recursive](http://en.wikipedia.org/wiki/Tail_call)
solution.

Solution

```tryocaml
(* This function is tail-recursive: it uses a constant amount of
   stack memory regardless of list size. *)
let length list =
  let rec aux n = function
    | [] -> n
    | _::t -> aux (n+1) t
  in aux 0 list

 length [ "a" ; "b" ; "c"] = 3;;
length [] = 0;;
```
Reverse a list.

OCaml standard library has `List.rev` but we ask that you reimplement
it.

Solution

```tryocaml
let rev list =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (h::acc) t in
  aux [] list

rev ["a" ; "b" ; "c"] = ["c" ; "b" ; "a"]
```

Find out whether a list is a palindrome.

HINT: a palindrome is its own reverse.

Solution

```tryocaml
let is_palindrome list =
  list = List.rev list
(* One can use either the rev function from the previous problem, or the
   built-in List.rev *)
 is_palindrome [ "x" ; "a" ; "m" ; "a" ; "x" ];;

not (is_palindrome [ "a" ; "b" ]);;
```
Flatten a nested list structure.

```tryocaml
(* There is no nested list type in OCaml, so we need to define one
   first. A node of a nested list is either an element, or a list of
   nodes. *)
type 'a node =
  | One of 'a
  | Many of 'a node list
```

Solution

```tryocaml
(* This function traverses the list, prepending any encountered elements
  to an accumulator, which flattens the list in inverse order. It can
  then be reversed to obtain the actual flattened list. *)

let flatten list =
  let rec aux acc = function
    | [] -> acc
    | One x :: t -> aux (x :: acc) t
    | Many l :: t -> aux (aux acc l) t in
  List.rev (aux [] list)

flatten [ One "a" ; Many [ One "b" ; Many [ One "c" ; One "d" ] ; One "e" ] ]
= [ "a" ; "b" ; "c" ; "d" ; "e" ]
```
Eliminate consecutive duplicates of list elements.

Solution

```tryocaml
let rec compress = function
  | a :: (b :: _ as t) -> if a = b then compress t else a :: compress t
  | smaller -> smaller

compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
= ["a";"b";"c";"a";"d";"e"];;
```
Pack consecutive duplicates of list elements into sublists.

Solution

```tryocaml
let pack list =
  let rec aux current acc = function
    | [] -> []    (* Can only be reached if original list is empty *)
    | [x] -> (x :: current) :: acc
    | a :: (b :: _ as t) ->
       if a = b then aux (a :: current) acc t
       else aux [] ((a :: current) :: acc) t  in
  List.rev (aux [] [] list)

pack ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"d";"e";"e";"e";"e"]
= [["a";"a";"a";"a"]; ["b"]; ["c";"c"]; ["a";"a"]; ["d";"d"];
   ["e";"e";"e";"e"]]
```
[Run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding)
of a list.

Solution

```tryocaml
let encode list =
  let rec aux count acc = function
    | [] -> [] (* Can only be reached if original list is empty *)
    | [x] -> (count+1, x) :: acc
    | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
                            else aux 0 ((count+1,a) :: acc) t   in
  List.rev (aux 0 [] list)

encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
= [4,"a" ; 1,"b" ; 2,"c" ; 2,"a" ; 1,"d" ; 4,"e"]
```
Modified run-length encoding.

Modify the result of the previous problem in such a way that if an
element has no duplicates it is simply copied into the result list. Only
elements with duplicates are transferred as (N E) lists.

Since OCaml lists are homogeneous, one needs to define a type to hold
both single elements and sub-lists.

```tryocaml
type 'a rle =
  | One of 'a
  | Many of (int * 'a)
```
Solution

```tryocaml
let pack list =
  let rec aux current acc = function
    | [] -> [] (* Can only be reached if original list is empty *)
    | [x] -> (x :: current) :: acc
    | a :: (b :: _ as t) -> if a = b then aux (a :: current) acc t
                            else aux [] ((a :: current) :: acc) t  in
  List.rev (aux [] [] list)
let encode list =
  let rec aux = function
    | [] -> []
    | [] :: t -> aux t
    | [x] :: t -> One x :: aux t
    | (x :: l) :: t -> Many (1 + List.length l , x) :: aux t  in
  aux (pack list)

encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
= [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")]
```

Decode a run-length encoded list.

Given a run-length code list generated as specified in the previous
problem, construct its uncompressed version.

Solution

```tryocaml
let decode list =
  let rec many acc n x =
    if n = 0 then acc else many (x :: acc) (n-1) x in
  let rec aux acc = function
    | [] -> acc
    | One x :: t -> aux (x :: acc) t
    | Many (n,x) :: t -> aux (many acc n x) t  in
  aux [] (List.rev list)
 decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")]
= ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
```
Run-length encoding of a list (direct solution).

Implement the so-called run-length encoding data compression method
directly. I.e. don't explicitly create the sublists containing the
duplicates, as in problem “[Pack consecutive duplicates of list elements
into sublists](#pack)”, but only count them. As in problem “[Modified
run-length encoding](#modif-run-length)”, simplify the result list by
replacing the singleton lists (1 X) by X.

Solution

```tryocaml
let encode list =
  let rle count x = if count = 0 then One x else Many (count + 1, x) in
  let rec aux count acc = function
    | [] -> [] (* Can only be reached if original list is empty *)
    | [x] -> rle count x :: acc
    | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
                            else aux 0 (rle count a :: acc) t   in
  List.rev (aux 0 [] list)
;;

encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"] =
[Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")];;
```
Duplicate the elements of a list.

Solution

```tryocaml
let rec duplicate = function
  | [] -> []
  | h :: t -> h :: h :: duplicate t;;

duplicate ["a";"b";"c";"c";"d"] = ["a";"a";"b";"b";"c";"c";"c";"c";"d";"d"];;
```
Replicate the elements of a list a given number of times.

Solution

```tryocaml
let replicate list n =
  let rec prepend n acc x =
    if n = 0 then acc else prepend (n-1) (x :: acc) x in
  let rec aux acc = function
    | [] -> acc
    | h :: t -> aux (prepend n acc h) t  in
  (* This could also be written as:
     List.fold_left (prepend n) [] (List.rev list) *)
  aux [] (List.rev list);;

replicate ["a";"b";"c"] 3 = ["a";"a";"a";"b";"b";"b";"c";"c";"c"];;
```
Drop every N'th element from a list.

Solution

```tryocaml
let drop list n =
  let rec aux i = function
    | [] -> []
    | h :: t -> if i = n then aux 1 t else h :: aux (i+1) t  in
  aux 1 list;;

drop ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3
= ["a";"b";"d";"e";"g";"h";"j"];;
```
Split a list into two parts; the length of the first part is given.

If the length of the first part is longer than the entire list, then the
first part is the list and the second part is empty.

Solution

```tryocaml
let split list n =
  let rec aux i acc = function
    | [] -> List.rev acc, []
    | h :: t as l -> if i = 0 then List.rev acc, l
                     else aux (i-1) (h :: acc) t  in
  aux n [] list

split ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3
= (["a";"b";"c"], ["d";"e";"f";"g";"h";"i";"j"]);;
split ["a";"b";"c";"d"] 5 = (["a"; "b"; "c"; "d"], [])
```
Extract a slice from a list.

Given two indices, `i` and `k`, the slice is the list containing the
elements between the `i`'th and `k`'th element of the original list
(both limits included). Start counting the elements with 0 (this is the
way the `List` module numbers elements).

Solution

```tryocaml
let slice list i k =
  let rec take n = function
    | [] -> []
    | h :: t -> if n = 0 then [] else h :: take (n-1) t
  in
  let rec drop n = function
    | [] -> []
    | h :: t as l -> if n = 0 then l else drop (n-1) t
  in
  take (k - i + 1) (drop i list);;

slice ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 2 6 = ["c";"d";"e";"f";"g"];;
```
Rotate a list N places to the left.

Solution

```tryocaml
let split list n =
  let rec aux i acc = function
    | [] -> List.rev acc, []
    | h :: t as l -> if i = 0 then List.rev acc, l
                     else aux (i-1) (h :: acc) t    in
  aux n [] list

let rotate list n =
  let len = List.length list in
  (* Compute a rotation value between 0 and len-1 *)
  let n = if len = 0 then 0 else (n mod len + len) mod len in
  if n = 0 then list
  else let a, b = split list n in b @ a;;

rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3
= ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"];;
rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-2)
= ["g"; "h"; "a"; "b"; "c"; "d"; "e"; "f"];;
```
Remove the K'th element from a list.

The first element of the list is numbered 0, the second 1,...

Solution

```tryocaml
let rec remove_at n = function
  | [] -> []
  | h :: t -> if n = 0 then t else h :: remove_at (n-1) t;;

remove_at 1 ["a";"b";"c";"d"] = ["a"; "c"; "d"];;
```
Insert an element at a given position into a list.

Start counting list elements with 0.

Solution

```tryocaml
let rec insert_at x n = function
  | [] -> []
  | h :: t as l -> if n = 0 then x :: l else h :: insert_at x (n-1) t;;

insert_at "alfa" 1 ["a";"b";"c";"d"] = ["a";"alfa";"b";"c";"d"];;
```
Create a list containing all integers within a given range.

If first argument is smaller than second, produce a list in decreasing
order.

Solution

```tryocaml
let range a b =
  let rec aux a b =
    if a > b then [] else a :: aux (a+1) b  in
  if a > b then List.rev (aux b a) else aux a b;;

range 4 9 = [4;5;6;7;8;9];;
range 9 4 = [9;8;7;6;5;4];;
```
Extract a given number of randomly selected elements from a list.

The selected items shall be returned in a list. We use the `Random`
module but do not initialize it with `Random.self_init` for
reproducibility.

Solution

```tryocaml
let rec rand_select list n =
  let rec extract acc n = function
    | [] -> raise Not_found
    | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
  in
  let extract_rand list len =
    extract [] (Random.int len) list
  in
  let rec aux n acc list len =
    if n = 0 then acc else
      let picked, rest = extract_rand list len in
      aux (n-1) (picked :: acc) rest (len-1)
  in
  let len = List.length list in
  aux (min n len) [] list len;;

rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3;;
```
Lotto: Draw N different random numbers from the set 1..M.

The selected numbers shall be returned in a list.

Solution

```tryocaml
(* [range] and [rand_select] defined in problems above *)
let lotto_select n m = rand_select (range 1 m) n;;

lotto_select 6 49;;
```
Generate a random permutation of the elements of a list.

Solution

```tryocaml
let rec permutation list =
  let rec extract acc n = function
    | [] -> raise Not_found
    | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
  in
  let extract_rand list len =
    extract [] (Random.int len) list
  in
  let rec aux acc list len =
    if len = 0 then acc else
      let picked, rest = extract_rand list len in
      aux (picked :: acc) rest (len-1)
  in
  aux [] list (List.length list);;

permutation ["a"; "b"; "c"; "d"; "e"; "f"];;
```
Generate the combinations of K distinct objects chosen from the N
elements of a list

In how many ways can a committee of 3 be chosen from a group of 12
people? We all know that there are C(12,3) = 220 possibilities (C(N,K)
denotes the well-known binomial coefficients). For pure mathematicians,
this result may be great. But we want to really generate all the
possibilities in a list.

Solution

```tryocaml
let extract k list =
  let rec aux k acc emit = function
    | [] -> acc
    | h :: t ->
      if k = 1 then aux k (emit [h] acc) emit t else
        let new_emit x = emit (h :: x) in
        aux k (aux (k-1) acc new_emit t) emit t
  in
  let emit x acc = x :: acc in
  aux k [] emit list;;

extract 2 ["a";"b";"c";"d"]
= [["c";"d"]; ["b";"d"]; ["b";"c"]; ["a";"d"]; ["a";"c"]; ["a";"b"]];;
```
Group the elements of a set into disjoint subsets.

a) In how many ways can a group of 9 people work in 3 disjoint subgroups
of 2, 3 and 4 persons? Write a function that generates all the
possibilities and returns them in a list.

b) Generalize the above function in a way that we can specify a list of
group sizes and the function will return a list of groups.

Solution

```tryocaml
  (* This implementation is less streamlined than the one-extraction
     version, because more work is done on the lists after each transform
     to prepend the actual items. The end result is cleaner in terms of
     code, though. *)

  let group list sizes =
    let initial = List.map (fun size -> size, []) sizes in
    (* The core of the function. Prepend accepts a list of groups, each with
       the number of items that should be added, and prepends the item to every
       group that can support it, thus turning [1,a ; 2,b ; 0,c] into
       [ [0,x::a ; 2,b ; 0,c ] ; [1,a ; 1,x::b ; 0,c] ; [ 1,a ; 2,b ; 0,c ]]

       Again, in the prolog language (for which these questions are
       originally intended), this function is a whole lot simpler.  *)
    let prepend p list =
      let emit l acc = l :: acc in
      let rec aux emit acc = function
        | [] -> emit [] acc
        | (n,l) as h :: t ->
           let acc = if n > 0 then emit ((n-1, p::l) :: t) acc else acc in
           aux (fun l acc -> emit (h :: l) acc) acc t
      in
      aux emit [] list
    in
    let rec aux = function
      | [] -> [ initial ]
      | h :: t -> List.concat (List.map (prepend h) (aux t))
    in
    let all = aux list in
    (* Don't forget to eliminate all group sets that have non-full groups *)
    let complete = List.filter (List.for_all (fun (x,_) -> x = 0)) all in
    List.map (List.map snd) complete

  group ["a";"b";"c";"d"] [2;1]
  = [[["a"; "b"]; ["c"]]; [["a"; "c"]; ["b"]]; [["b"; "c"]; ["a"]];
     [["a"; "b"]; ["d"]]; [["a"; "c"]; ["d"]]; [["b"; "c"]; ["d"]];
     [["a"; "d"]; ["b"]]; [["b"; "d"]; ["a"]]; [["a"; "d"]; ["c"]];
     [["b"; "d"]; ["c"]]; [["c"; "d"]; ["a"]]; [["c"; "d"]; ["b"]]]
```
Sorting a list of lists according to length of sublists

a) We suppose that a list contains elements that are lists themselves.
The objective is to sort the elements of this list according to their
length. E.g. short lists first, longer lists later, or vice versa.

b) Again, we suppose that a list contains elements that are lists
themselves. But this time the objective is to sort the elements of this
list according to their **length frequency**; i.e., in the default,
where sorting is done ascendingly, lists with rare lengths are placed
first, others with a more frequent length come later.

Solution

```tryocaml
  (* We might not be allowed to use built-in List.sort, so here's an
     eight-line implementation of insertion sort - O(n²) time complexity. *)
  let rec insert cmp e = function
    | [] -> [e]
    | h :: t as l -> if cmp e h <= 0 then e :: l else h :: insert cmp e t

  let rec sort cmp = function
    | [] -> []
    | h :: t -> insert cmp h (sort cmp t)

  (* Sorting according to length : prepend length, sort, remove length *)
  let length_sort lists =
    let lists = List.map (fun list -> List.length list, list) lists in
    let lists = sort (fun a b -> compare (fst a) (fst b)) lists in
    List.map snd lists
  ;;

  (* Sorting according to length frequency : prepend frequency, sort,
     remove frequency. Frequencies are extracted by sorting lengths
     and applying RLE to count occurences of each length (see problem
     "Run-length encoding of a list.") *)
  let rle list =
    let rec aux count acc = function
      | [] -> [] (* Can only be reached if original list is empty *)
      | [x] -> (x, count + 1) :: acc
      | a :: (b :: _ as t) ->
         if a = b then aux (count + 1) acc t
         else aux 0 ((a, count + 1) :: acc) t in
    aux 0 [] list

  let frequency_sort lists =
    let lengths = List.map List.length lists in
    let freq = rle (sort compare lengths) in
    let by_freq =
      List.map (fun list -> List.assoc (List.length list) freq , list) lists in
    let sorted = sort (fun a b -> compare (fst a) (fst b)) by_freq in
    List.map snd sorted

  length_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ]
  = [["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"];
     ["f"; "g"; "h"]; ["i"; "j"; "k"; "l"]] ;;
  frequency_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                   ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ]
  = [["i"; "j"; "k"; "l"]; ["o"]; ["a"; "b"; "c"]; ["f"; "g"; "h"];
     ["d"; "e"]; ["d"; "e"]; ["m"; "n"]]
```
## Arithmetic
Determine whether a given integer number is prime.

Solution

Recall that `d` divides `n` iff `n mod d =     0`. This is a naive
solution. See the [Sieve of
Eratosthenes](http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) for a
more clever one.

```tryocaml
  let is_prime n =
    let n = abs n in
    let rec is_not_divisor d =
      d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
    n <> 1 && is_not_divisor 2

  not(is_prime 1);;
  is_prime 7;;
  not (is_prime 12)
```
Determine the greatest common divisor of two positive integer numbers.

Use Euclid's algorithm.

Solution

```tryocaml
  let rec gcd a b =
    if b = 0 then a else gcd b (a mod b)

  gcd 13 27 = 1;;
  gcd 20536 7826 = 2
```
Determine whether two positive integer numbers are coprime.

Two numbers are coprime if their greatest common divisor equals 1.

Solution

```tryocaml
  (* [gcd] is defined in the previous question *)
  let coprime a b = gcd a b = 1

  coprime 13 27;;
  not (coprime 20536 7826)
```
Calculate Euler's totient function phi(m).

Euler's so-called totient function φ(m) is defined as the number of
positive integers r (1 ≤ r \< m) that are coprime to m. We let φ(1) = 1.

Find out what the value of phi(m) is if m is a prime number. Euler's
totient function plays an important role in one of the most widely used
public key cryptography methods (RSA). In this exercise you should use
the most primitive method to calculate this function (there are smarter
ways that we shall discuss later).

Solution

```tryocaml
  (* [coprime] is defined in the previous question *)
  let phi n =
    let rec count_coprime acc d =
      if d < n then
        count_coprime (if coprime n d then acc + 1 else acc) (d + 1)
      else acc
    in
    if n = 1 then 1 else count_coprime 0 1

  phi 10 = 4;;
  phi 13 = 12
```
Determine the prime factors of a given positive integer.

Construct a flat list containing the prime factors in ascending order.

Solution

```tryocaml
  (* Recall that d divides n iff [n mod d = 0] *)
  let factors n =
    let rec aux d n =
      if n = 1 then [] else
        if n mod d = 0 then d :: aux d (n / d) else aux (d+1) n
    in
    aux 2 n

  factors 315 = [3;3;5;7]
```
Determine the prime factors of a given positive integer (2).

Construct a list containing the prime factors and their multiplicity.
*Hint:* The problem is similar to problem [Run-length encoding of a list
(direct solution)](#run-length-direct).

Solution

```tryocaml
  let factors n =
    let rec aux d n =
      if n = 1 then [] else
        if n mod d = 0 then
          match aux d (n / d) with
          | (h,n) :: t when h = d -> (h,n+1) :: t
          | l -> (d,1) :: l
        else aux (d+1) n
    in
    aux 2 n

  factors 315 = [3,2 ; 5,1 ; 7,1]
```
Calculate Euler's totient function phi(m) (improved).

See problem “[Calculate Euler&#39;s totient function phi(m)](#totient)” for
the definition of Euler's totient function. If the list of the prime
factors of a number m is known in the form of the previous problem then
the function phi(m) can be efficiently calculated as follows: Let
`[(p1, m1); (p2, m2);   (p3, m3); ...]` be the list of prime factors
(and their multiplicities) of a given number m. Then φ(m) can be
calculated with the following formula:

φ(m) = (p1 - 1) × p1<sup>m1\ -\ 1</sup> × (p2 - 1) ×
p2<sup>m2\ -\ 1</sup> × (p3 - 1) × p3<sup>m3\ -\ 1</sup> × ...

Solution

```tryocaml
  (* Naive power function. *)
  let rec pow n p = if p < 1 then 1 else n * pow n (p-1) ;;
  (* [factors] is defined in the previous question. *)
  let phi_improved n =
    let rec aux acc = function
      | [] -> acc
      | (p,m) :: t -> aux ((p - 1) * pow p (m - 1) * acc) t in
    aux 1 (factors n)

  phi_improved 10 = 4;;
  phi_improved 13 = 12
```
Compare the two methods of calculating Euler's totient function.

Use the solutions of problems “[Calculate Euler&#39;s totient function
phi(m)](#totient)” and “[Calculate Euler&#39;s totient function phi(m)
(improved)](#totient-improved)” to compare the algorithms. Take the
number of logical inferences as a measure for efficiency. Try to
calculate φ(10090) as an example.

Solution

```tryocaml
  (* Naive [timeit] function.  It requires the [Unix] module to be loaded. *)
  let timeit f a =
    let t0 = Unix.gettimeofday() in
    ignore(f a);
    let t1 = Unix.gettimeofday() in
    t1 -. t0

  timeit phi 10090;;
  timeit phi_improved 10090
```
A list of prime numbers.

Given a range of integers by its lower and upper limit, construct a list
of all prime numbers in that range.

Solution

```tryocaml
  let is_prime n =
    let n = max n (-n) in
    let rec is_not_divisor d =
      d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
    is_not_divisor 2

  let rec all_primes a b =
    if a > b then [] else
      let rest = all_primes (a + 1) b in
      if is_prime a then a :: rest else rest

  List.length (all_primes 2 7920) = 1000
```
Goldbach's conjecture.

Goldbach's conjecture says that every positive even number greater than
2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of
the most famous facts in number theory that has not been proved to be
correct in the general case. It has been *numerically confirmed* up to
very large numbers. Write a function to find the two prime numbers that
sum up to a given even integer.

Solution

```tryocaml
  (* [is_prime] is defined in the previous solution *)
  let goldbach n =
    let rec aux d =
      if is_prime d && is_prime (n - d) then (d, n-d)
      else aux (d+1) in
    aux 2

  goldbach 28 = (5,23)
```
A list of Goldbach compositions.

Given a range of integers by its lower and upper limit, print a list of
all even numbers and their Goldbach composition.

In most cases, if an even number is written as the sum of two prime
numbers, one of them is very small. Very rarely, the primes are both
bigger than say 50. Try to find out how many such cases there are in the
range 2..3000.

Solution

```tryocaml
  (* [goldbach] is defined in the previous question. *)
  let rec goldbach_list a b =
    if a > b then [] else
      if a mod 2 = 1 then goldbach_list (a+1) b
      else (a, goldbach a) :: goldbach_list (a+2) b

  let goldbach_limit a b lim =
    List.filter (fun (_,(a,b)) -> a > lim && b > lim) (goldbach_list a b)

  goldbach_list 9 20
  = [(10, (3, 7)); (12, (5, 7)); (14, (3, 11)); (16, (3, 13)); (18, (5, 13));
     (20, (3, 17))];;
  goldbach_limit 1 2000 50
  = [(992, (73, 919)); (1382, (61, 1321)); (1856, (67, 1789));
     (1928, (61, 1867))]
```
## Logic and Codes
Let us define a small “language” for boolean expressions containing
variables:

```tryocaml
  type bool_expr =
    | Var of string
    | Not of bool_expr
    | And of bool_expr * bool_expr
    | Or of bool_expr * bool_expr
```
A logical expression in two variables can then be written in prefix
notation, as in the following example:

```tryocaml
  And(Or(Var "a", Var "b"), And(Var "a", Var "b"))
```
Truth tables for logical expressions (2 variables).

Define a function, `table2` which returns the truth table of a given
logical expression in two variables (specified as arguments). The return
value must be a list of triples containing
`(value_of_a, balue_of_b,     value_of_expr)`.

Solution

```tryocaml
  let rec eval2 a val_a b val_b = function
    | Var x -> if x = a then val_a
               else if x = b then val_b
               else failwith "The expression contains an invalid variable"
    | Not e -> not(eval2 a val_a b val_b e)
    | And(e1, e2) -> eval2 a val_a b val_b e1 && eval2 a val_a b val_b e2
    | Or(e1, e2) -> eval2 a val_a b val_b e1 || eval2 a val_a b val_b e2
  let table2 a b expr =
    [(true,  true,  eval2 a true  b true  expr);
     (true,  false, eval2 a true  b false expr);
     (false, true,  eval2 a false b true  expr);
     (false, false, eval2 a false b false expr) ]

  table2 "a" "b" (And(Var "a", Or(Var "a", Var "b")))
  = [(true, true, true);
     (true, false, true);
     (false, true, false);
     (false, false, false) ]
```
Truth tables for logical expressions.

Generalize the previous problem in such a way that the logical
expression may contain any number of logical variables. Define `table`
in a way that `table variables     expr` returns the truth table for the
expression `expr`, which contains the logical variables enumerated in
`variables`.

Solution

```tryocaml
  (* [val_vars] is an associative list containing the truth value of
     each variable.  For efficiency, a Map or a Hashtlb should be preferred. *)
  let rec eval val_vars = function
    | Var x -> List.assoc x val_vars
    | Not e -> not(eval val_vars e)
    | And(e1, e2) -> eval val_vars e1 && eval val_vars e2
    | Or(e1, e2) -> eval val_vars e1 || eval val_vars e2

  (* Again, this is an easy and short implementation rather than an
     efficient one. *)
  let rec table_make val_vars vars expr =
    match vars with
    | [] -> [(List.rev val_vars, eval val_vars expr)]
    | v :: tl ->
       table_make ((v, true) :: val_vars) tl expr
       @ table_make ((v, false) :: val_vars) tl expr

  let table vars expr = table_make [] vars expr

  table ["a"; "b"] (And(Var "a", Or(Var "a", Var "b")))
  = [["a", true; "b", true], true;
     ["a", true; "b", false], true;
     ["a", false; "b", true], false;
     ["a", false; "b", false], false ];;
  let a = Var "a" and b = Var "b" and c = Var "c" in
  table ["a"; "b"; "c"] (Or(And(a, Or(b,c)), Or(And(a,b), And(a,c))))
```
Gray code.

An n-bit Gray code is a sequence of n-bit strings constructed according
to certain rules. For example,

```tryocaml
n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
```
Find out the construction rules and write a function with the following
specification: `gray n` returns the `n`-bit Gray code.

Solution

```tryocaml
let prepend c s =
  (* Prepend the char [c] to the string [s]. *)
  let s' = String.create (String.length s + 1) in
  s'.[0] <- c;
  String.blit s 0 s' 1 (String.length s);
  s'

let rec gray n =
  if n <= 1 then ["0"; "1"]
  else let g = gray (n - 1) in
       List.map (prepend '0') g @ List.map (prepend '1') g

  gray 1 = ["0"; "1"];;
  gray 2 = ["00"; "01"; "11"; "10"];;
  gray 3 = ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"]
```
Huffman code.

First of all, consult a good book on discrete mathematics or algorithms
for a detailed description of Huffman codes (you can start with the
[Wikipedia page](http://en.wikipedia.org/wiki/Huffman_coding))!

We suppose a set of symbols with their frequencies, given as a list of
`Fr(S,F)` terms. Example:
`fs = [Fr(a,45); Fr(b,13); Fr(c,12); Fr(d,16); Fr(e,9);       Fr(f,5)]`.
Our objective is to construct a list `Hc(S,C)` terms, where `C` is the
Huffman code word for the symbol `S`. In our example, the result could
be
`hs = [Hc(a,'0'); Hc(b,'101'); Hc(c,'100');       Hc(d,'111'); Hc(e,'1101'); hc(f,'1100')]`
[hc(a,'01'),...etc.]. The task shall be performed by the function
`huffman` defined as follows: `huffman(fs)` returns the Huffman code
table for the frequency table `fs`

Solution

## Binary Trees
 ![Binary
tree](https://sites.google.com/site/prologsite/_/rsrc/1264934442609/prolog-problems/4/p67.gif "")

*A binary tree is either empty or it is composed of a root element and
two successors, which are binary trees themselves.*

In OCaml, one can define a new type `binary_tree` that carries an
arbitrary value of type `'a` at each node.

```tryocaml
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
```
An example of tree carrying `char` data is:

```tryocaml
  let example_tree =
    Node('a', Node('b', Node('d', Empty, Empty), Node('e', Empty, Empty)),
         Node('c', Empty, Node('f', Node('g', Empty, Empty), Empty)))
```
In OCaml, the strict type discipline *guarantees* that, if you get a
value of type `binary_tree`, then it must have been created with the two
constructors `Empty` and `Node`.

Construct completely balanced binary trees

In a completely balanced binary tree, the following property holds for
every node: The number of nodes in its left subtree and the number of
nodes in its right subtree are almost equal, which means their
difference is not greater than one.

Write a function `cbal_tree` to construct completely balanced binary
trees for a given number of nodes. The function should generate all
solutions via backtracking. Put the letter `'x'` as information into all
nodes of the tree.

Solution

```tryocaml
  (* Build all trees with given [left] and [right] subtrees. *)
  let add_trees_with left right all =
    let add_right_tree all l =
      List.fold_left (fun a r -> Node('x', l, r) :: a) all right in
    List.fold_left add_right_tree all left
  
  let rec cbal_tree n =
    if n = 0 then [Empty]
    else if n mod 2 = 1 then
      let t = cbal_tree (n / 2) in
      add_trees_with t t []
    else (* n even: n-1 nodes for the left & right subtrees altogether. *)
      let t1 = cbal_tree (n / 2 - 1) in
      let t2 = cbal_tree (n / 2) in
      add_trees_with t1 t2 (add_trees_with t2 t1 [])

  cbal_tree 4
  = [Node('x', Node('x', Empty, Empty),
          Node('x', Node('x', Empty, Empty), Empty));
     Node('x', Node('x', Empty, Empty),
          Node('x', Empty, Node('x', Empty, Empty)));
     Node('x', Node('x', Node('x', Empty, Empty), Empty),
          Node('x', Empty, Empty));
     Node('x', Node('x', Empty, Node('x', Empty, Empty)),
          Node('x', Empty, Empty)); ];;
  List.length(cbal_tree 40)
```
Symmetric binary trees

Let us call a binary tree symmetric if you can draw a vertical line
through the root node and then the right subtree is the mirror image of
the left subtree. Write a function `is_symmetric` to check whether a
given binary tree is symmetric.

Hint: Write a function `is_mirror` first to check whether one tree is
the mirror image of another. We are only interested in the structure,
not in the contents of the nodes.

Solution

```tryocaml
  let rec is_mirror t1 t2 =
    match t1, t2 with
    | Empty, Empty -> true
    | Node(_, l1, r1), Node(_, l2, r2) ->
       is_mirror l1 r2 && is_mirror r1 l2
    | _ -> false

  let is_symmetric = function
    | Empty -> true
    | Node(_, l, r) -> is_mirror l r
```
Binary search trees (dictionaries)

Construct a [binary search
tree](http://en.wikipedia.org/wiki/Binary_search_tree) from a list of
integer numbers.

Solution

```tryocaml
  let rec insert tree x = match tree with
    | Empty -> Node(x, Empty, Empty)
    | Node(y, l, r) ->
       if x = y then tree
       else if x < y then Node(y, insert l x, r)
       else Node(y, l, insert r x)

  let construct l = List.fold_left insert Empty l

  construct [3;2;5;7;1]
  = Node(3, Node(2, Node(1, Empty, Empty), Empty),
         Node(5, Empty, Node(7, Empty, Empty)))
```
Then use this function to test the solution of the previous problem.

```tryocaml
  is_symmetric(construct [5;3;18;1;4;12;21]);;
  not(is_symmetric(construct [3;2;5;7;4]))
```
Generate-and-test paradigm

Apply the generate-and-test paradigm to construct all symmetric,
completely balanced binary trees with a given number of nodes.

Solution

```tryocaml
  let sym_cbal_trees n =
    List.filter is_symmetric (cbal_tree n)

  sym_cbal_trees 5
  = [Node('x', Node('x', Node('x', Empty, Empty), Empty),
               Node('x', Empty, Node('x', Empty, Empty)));
     Node('x', Node('x', Empty, Node('x', Empty, Empty)),
               Node('x', Node('x', Empty, Empty), Empty)) ]
```
How many such trees are there with 57 nodes? Investigate about how many
solutions there are for a given number of nodes? What if the number is
even? Write an appropriate function.

```tryocaml
  List.length (sym_cbal_trees 57);;
  List.map (fun n -> n, List.length(sym_cbal_trees n)) (range 10 20)
  = [(10, 0); (11, 4); (12, 0); (13, 4); (14, 0); (15, 1);
     (16, 0); (17, 8); (18, 0); (19, 16); (20, 0)]
```
Construct height-balanced binary trees

In a height-balanced binary tree, the following property holds for every
node: The height of its left subtree and the height of its right subtree
are almost equal, which means their difference is not greater than one.

Write a function `hbal_tree` to construct height-balanced binary trees
for a given height. The function should generate all solutions via
backtracking. Put the letter `'x'` as information into all nodes of the
tree.

Solution

```tryocaml
  let rec hbal_tree n =
    if n = 0 then [Empty]
    else if n = 1 then [Node('x', Empty, Empty)]
    else
      (* [add_trees_with left right trees] is defined in a question above. *)
      let t1 = hbal_tree (n - 1)
      and t2 = hbal_tree (n - 2) in
      add_trees_with t1 t1 (add_trees_with t1 t2 (add_trees_with t2 t1 []))

  let t = hbal_tree 3;;
  let x = 'x';;
  List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
                 Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)))) t;;
  List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
                 Node(x, Node(x, Empty, Empty), Empty))) t;;
  List.length t = 15
```
Construct height-balanced binary trees with a given number of nodes

Consider a height-balanced binary tree of height `h`. What is the
maximum number of nodes it can contain? Clearly, *maxN = 2<sup>`h`</sup>
* 1
*. However, what is the minimum number *minN*? This question is more
difficult. Try to find a recursive statement and turn it into a function
`minNodes` defined as follows: `minNodes h` returns the minimum number
of nodes in a height-balanced binary tree of height `h`.

Solution

On the other hand, we might ask: what is the maximum height H a
height-balanced binary tree with N nodes can have? `maxHeight n` returns
the maximum height of a height-balanced binary tree with `n` nodes.

Now, we can attack the main problem: construct all the height-balanced
binary trees with a given nuber of nodes. `hbal_tree_nodes n` returns a
list of all height-balanced binary tree with `n` nodes.

Find out how many height-balanced trees exist for `n =       15`.

```tryocaml
  List.length (hbal_tree_nodes 15)
```
Count the leaves of a binary tree

A leaf is a node with no successors. Write a function `count_leaves` to
count them.

Solution

```tryocaml
  let rec count_leaves = function
    | Empty -> 0
    | Node(_, Empty, Empty) -> 1
    | Node(_, l, r) -> count_leaves l + count_leaves r

  count_leaves Empty = 0;;
  count_leaves example_tree = 3
```
Collect the leaves of a binary tree in a list

A leaf is a node with no successors. Write a function `leaves` to
collect them in a list.

Solution

```tryocaml
  let rec leaves = function
    | Empty -> []
    | Node(c, Empty, Empty) -> [c]
    | Node(_, l, r) -> leaves l @ leaves r

  leaves Empty = [];;
  leaves example_tree = ['d'; 'e'; 'g']
```
Collect the internal nodes of a binary tree in a list

An internal node of a binary tree has either one or two non-empty
successors. Write a function `internals` to collect them in a list.

Solution

```tryocaml
  let rec internals = function
    | Empty | Node(_, Empty, Empty) -> []
    | Node(c, l, r) -> internals l @ (c :: internals r)

  internals (Node('a', Empty, Empty)) = [];;
  internals example_tree = ['b'; 'a'; 'c'; 'f']
```
Collect the nodes at a given level in a list.

A node of a binary tree is at level N if the path from the root to the
node has length N-1. The root node is at level 1. Write a function
`at_level t l` to collect all nodes of the tree `t` at level `l` in a
list.

Solution

```tryocaml
  let rec at_level t l = match t with
    | Empty -> []
    | Node(c, left, right) ->
       if l = 1 then [c]
       else at_level left (l - 1) @ at_level right (l - 1)

  at_level example_tree 2 = ['b'; 'c'];;
  at_level example_tree 2 = ['b'; 'c'];;
  at_level example_tree 5 = [];;
```
Using `at_level` it is easy to construct a function `levelorder` which
creates the level-order sequence of the nodes. However, there are more
efficient ways to do that.

Construct a complete binary tree

A *complete* binary tree with height H is defined as follows: The levels
1,2,3,...,H-1 contain the maximum number of nodes (i.e 2<sup>i-1</sup>
at the level i, note that we start counting the levels from 1 at the
root). In level H, which may contain less than the maximum possible
number of nodes, all the nodes are "left-adjusted". This means that in a
levelorder tree traversal all internal nodes come first, the leaves come
second, and empty successors (the nil's which are not really nodes!)
come last.

Particularly, complete binary trees are used as data structures (or
addressing schemes) for heaps.

We can assign an address number to each node in a complete binary tree
by enumerating the nodes in levelorder, starting at the root with
number 1. In doing so, we realize that for every node X with address A
the following property holds: The address of X's left and right
successors are 2*A and 2*A+1, respectively, supposed the successors do
exist. This fact can be used to elegantly construct a complete binary
tree structure. Write a function `is_complete_binary_tree` with the
following specification: `is_complete_binary_tree n t` returns `true`
iff `t` is a complete binary tree with `n` nodes.

Solution

Layout a binary tree (1)

As a preparation for drawing the tree, a layout algorithm is required to
determine the position of each node in a rectangular grid. Several
layout methods are conceivable, one of them is shown in the illustration
below.

![grid](https://sites.google.com/site/prologsite/_/rsrc/1264933989828/prolog-problems/4/p64.gif "")

In this layout strategy, the position of a node v is obtained by the
following two rules:

* *x(v)* is equal to the position of the node v in the *inorder*
 sequence;
* *y(v)* is equal to the depth of the node *v* in the tree.

In order to store the position of the nodes, we redefine the OCaml type
representing a node (and its successors) as follows:

```tryocaml
  type 'a pos_binary_tree =
    | E (* represents the empty tree *)
    | N of 'a * int * int * 'a pos_binary_tree * 'a pos_binary_tree
```
`N(w,x,y,l,r)` represents a (non-empty) binary tree with root `w`
"positioned" at `(x,y)`, and subtrees `l` and `r`. Write a function
`layout_binary_tree` with the following specification:
`layout_binary_tree t` returns the "positioned" binary tree obtained
from the binary tree `t`.

Solution

Layout a binary tree (2)

![](https://sites.google.com/site/prologsite/_/rsrc/1264934255598/prolog-problems/4/p65.gif "")

An alternative layout method is depicted in the above illustration. Find
out the rules and write the corresponding OCaml function.

Hint: On a given level, the horizontal distance between neighboring
nodes is constant.

Solution

Layout a binary tree (3)

Yet another layout strategy is shown in the above illustration. The
method yields a very compact layout while maintaining a certain symmetry
in every node. Find out the rules and write the corresponding Prolog
predicate.

Hint: Consider the horizontal distance between a node and its successor
nodes. How tight can you pack together two subtrees to construct the
combined binary tree? This is a difficult problem. Don't give up too
early!

Solution

Which layout do you like most?

A string representation of binary trees

![binary
tree](https://sites.google.com/site/prologsite/_/rsrc/1264934442609/prolog-problems/4/p67.gif "")

Somebody represents binary trees as strings of the following type (see
example): `"a(b(d,e),c(,f(g,)))"`.

* Write an OCaml function which generates this string representation,
 if the tree is given as usual (as `Empty` or `Node(x,l,r)` term).
 Then write a function which does this inverse; i.e. given the string
 representation, construct the tree in the usual form. Finally,
 combine the two predicates in a single function `tree_string` which
 can be used in both directions.
* Write the same predicate `tree_string` using difference lists and a
 single predicate `tree_dlist` which does the conversion between a
 tree and a difference list in both directions.

For simplicity, suppose the information in the nodes is a single letter
and there are no spaces in the string.

Solution

Preorder and inorder sequences of binary trees

We consider binary trees with nodes that are identified by single
lower-case letters, as in the example of the previous problem.

1. Write functions `preorder` and `inorder` that construct the preorder
 and inorder sequence of a given binary tree, respectively. The
 results should be atoms, e.g. 'abdecfg' for the preorder sequence of
 the example in the previous problem.
1. Can you use `preorder` from problem part 1. in the reverse
 direction; i.e. given a preorder sequence, construct a corresponding
 tree? If not, make the necessary arrangements.
1. If both the preorder sequence and the inorder sequence of the nodes
 of a binary tree are given, then the tree is determined
 unambiguously. Write a function `pre_in_tree` that does the job.
1. Solve problems 1. to 3. using difference lists. Cool! Use the
 function `timeit` (defined in problem “[Compare the two methods of
 calculating Euler&#39;s totient function.](#timeit)”) to compare the
 solutions.

What happens if the same character appears in more than one node. Try
for instance `pre_in_tree "aba" "baa"`.

Solution

Dotstring representation of binary trees

We consider again binary trees with nodes that are identified by single
lower-case letters, as in the example of problem “[A string
representation of binary trees](#tree-string)”. Such a tree can be
represented by the preorder sequence of its nodes in which dots (.) are
inserted where an empty subtree (nil) is encountered during the tree
traversal. For example, the tree shown in problem “[A string
representation of binary trees](#tree-string)” is represented as
'abd..e..c.fg...'. First, try to establish a syntax (BNF or syntax
diagrams) and then write a function `tree_dotstring` which does the
conversion in both directions. Use difference lists.

Solution

## Multiway Trees
![multiway
tree](https://sites.google.com/site/prologsite/_/rsrc/1264946214751/prolog-problems/5/p70.gif "")

*A multiway tree is composed of a root element and a (possibly empty)
set of successors which are multiway trees themselves. A multiway tree
is never empty. The set of successor trees is sometimes called a
forest.*

To represent multiway trees, we will use the following type which is a
direct translation of the definition:

```tryocaml
  type 'a mult_tree = T of 'a * 'a mult_tree list
```
The example tree depicted opposite is therefore represented by the
following OCaml expression:

```tryocaml
  T('a', [T('f',[T('g',[])]); T('c',[]); T('b',[T('d',[]); T('e',[])])])
```
Count the nodes of a multiway tree

Solution

```tryocaml
  let rec count_nodes (T(_, sub)) =
    List.fold_left (fun n t -> n + count_nodes t) 1 sub

  count_nodes (T('a', [T('f',[]) ])) = 2
```
![multiway
tree](https://sites.google.com/site/prologsite/_/rsrc/1264946214751/prolog-problems/5/p70.gif "")

Tree construction from a node string

We suppose that the nodes of a multiway tree contain single characters.
In the depth-first order sequence of its nodes, a special character `^`
has been inserted whenever, during the tree traversal, the move is a
backtrack to the previous level.

By this rule, the tree in the figure opposite is represented as:
`afg^^c^bd^e^^^`.

Write functions `string_of_tree : char mult_tree -> string` to construct
the string representing the tree and
`tree_of_string : string -> char mult_tree` to construct the tree when
the string is given.

Solution

```tryocaml
  (* We could build the final string by string concatenation but this is
     expensive due to the number of operations.  We use a buffer instead. *)
  let rec add_string_of_tree buf (T(c, sub)) =
    Buffer.add_char buf c;
    List.iter (add_string_of_tree buf) sub;
    Buffer.add_char buf '^'
  let string_of_tree t =
    let buf = Buffer.create 128 in
    add_string_of_tree buf t;
    Buffer.contents buf;;
  let rec tree_of_substring t s i len =
    if i >= len || s.[i] = '^' then List.rev t, i + 1
    else
      let sub, j = tree_of_substring [] s (i+1) len in
      tree_of_substring (T(s.[i], sub) ::t) s j len
  let tree_of_string s =
    match tree_of_substring [] s 0 (String.length s) with
    | [t], _ -> t
    | _ -> failwith "tree_of_string"

  let t =
    T('a', [T('f',[T('g',[])]); T('c',[]); T('b',[T('d',[]); T('e',[])])]);;
  string_of_tree t = "afg^^c^bd^e^^^";;
  tree_of_string "afg^^c^bd^e^^^" = t;;
```
Determine the internal path length of a tree

We define the internal path length of a multiway tree as the total sum
of the path lengths from the root to all nodes of the tree. By this
definition, the tree `t` in the figure of the previous problem has an
internal path length of 9. Write a function `ipl tree` that returns the
internal path length of `tree`.

Solution

```tryocaml
  let rec ipl_sub len (T(_, sub)) =
    (* [len] is the distance of the current node to the root.  Add the
       distance of all sub-nodes. *)
    List.fold_left (fun sum t -> sum + ipl_sub (len + 1) t) len sub
  let ipl t = ipl_sub 0 t

  ipl t = 9
```
Construct the bottom-up order sequence of the tree nodes

Write a function `bottom_up t` which constructs the bottom-up sequence
of the nodes of the multiway tree `t`.

Solution

```tryocaml
  let rec prepend_bottom_up (T(c, sub)) l =
    List.fold_right (fun t l -> prepend_bottom_up t l) sub (c :: l)
  let bottom_up t = prepend_bottom_up t []

  bottom_up (T('a', [T('b', [])])) = ['b'; 'a'];;
  bottom_up t = ['g'; 'f'; 'c'; 'd'; 'e'; 'b'; 'a']
```
Lisp-like tree representation

There is a particular notation for multiway trees in Lisp. The following
pictures show how multiway tree structures are represented in Lisp.

![Lisp representation of multiway
trees](https://sites.google.com/site/prologsite/_/rsrc/1264946557086/prolog-problems/5/p73.png "")

Note that in the "lispy" notation a node with successors (children) in
the tree is always the first element in a list, followed by its
children. The "lispy" representation of a multiway tree is a sequence of
atoms and parentheses '(' and ')'. This is very close to the way trees
are represented in OCaml, except that no constructor `T` is used. Write
a function `lispy :       char mult_tree -> string` that returns the
lispy notation of the tree.

Solution

```tryocaml
  let rec add_lispy buf = function
    | T(c, []) -> Buffer.add_char buf c
    | T(c, sub) ->
       Buffer.add_char buf '(';
       Buffer.add_char buf c;
       List.iter (fun t -> Buffer.add_char buf ' '; add_lispy buf t) sub;
       Buffer.add_char buf ')'
  let lispy t =
    let buf = Buffer.create 128 in
    add_lispy buf t;
    Buffer.contents buf

  lispy (T('a', [])) = "a";;
  lispy (T('a', [T('b', [])])) = "(a b)";;
  lispy t = "(a (f g) c (b d e))"
```
## Graphs
*A graph is defined as a set of nodes and a set of edges, where each
edge is a pair of different nodes.*

![A
graph](https://sites.google.com/site/prologsite/_/rsrc/1264948248705/prolog-problems/6/graph1.gif "")

There are several ways to represent graphs in OCaml.

* One method is to list all edges, an edge being a pair of nodes. In
 this form, the graph depicted opposite is represented as the
 following expression:

```tryocaml
      ['h', 'g';  'k', 'f';  'f', 'b';  'f', 'c';  'c', 'b']
    
```
We call this **edge-clause form**. Obviously, isolated nodes cannot
be represented.



* Another method is to represent the whole graph as one data object.
 According to the definition of the graph as a pair of two sets
 (nodes and edges), we may use the following OCaml type:

```tryocaml
  type 'a graph_term = { nodes : 'a list;  edges : ('a * 'a) list }
```
Then, the above example graph is represented by:

```tryocaml
  let example_graph =
    { nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
      edges = ['h', 'g';  'k', 'f';  'f', 'b';  'f', 'c';  'c', 'b'] }
```
We call this **graph-term form**. Note, that the lists are kept
sorted, they are really sets, without duplicated elements. Each edge
appears only once in the edge list; i.e. an edge from a node x to
another node y is represented as `(x,y)`, the couple `(y,x)` is not
present. The **graph-term form is our default representation.** You
may want to define a similar type using sets instead of lists.



* A third representation method is to associate with each node the set
 of nodes that are adjacent to that node. We call this the
 **adjacency-list form**. In our example:

* The representations we introduced so far well suited for automated
 processing, but their syntax is not very user-friendly. Typing the
 terms by hand is cumbersome and error-prone. We can define a more
 compact and "human-friendly" notation as follows: A graph (with char
 labelled nodes) is represented by a string of atoms and terms of the
 type X-Y. The atoms stand for isolated nodes, the X-Y terms describe
 edges. If an X appears as an endpoint of an edge, it is
 automatically defined as a node. Our example could be written as:

```tryocaml
  "b-c f-c g-h d f-b k-f h-g"
```
We call this the **human-friendly form**. As the example shows, the
list does not have to be sorted and may even contain the same edge
multiple times. Notice the isolated node `d`.



Conversions

Write functions to convert between the different graph representations.
With these functions, all representations are equivalent; i.e. for the
following problems you can always pick freely the most convenient form.
This problem is not particularly difficult, but it's a lot of work to
deal with all the special cases.

Solution

Path from one node to another one

Write a function `paths g a b` that returns all acyclic path `p` from
node `a` to node `b ≠ a` in the graph `g`. The function should return
the list of all paths via backtracking.

Solution

```tryocaml
  (* The datastructures used here are far from the most efficient ones
     but allow for a straightforward implementation. *)
  (* Returns all neighbors satisfying the condition. *)
  let neighbors g a cond =
    let edge l (b,c) = if b = a && cond c then c :: l
                       else if c = a && cond b then b :: l
                       else l in
    List.fold_left edge [] g.edges
  let rec list_path g a to_b = match to_b with
    | [] -> assert false (* [to_b] contains the path to [b]. *)
    | a' :: _ ->
       if a' = a then [to_b]
       else
         let n = neighbors g a' (fun c -> not(List.mem c to_b)) in
         List.concat(List.map (fun c -> list_path g a (c :: to_b)) n)

  let paths g a b =
    assert(a <> b);
    list_path g a [b]

  paths example_graph 'f' 'b' = [['f'; 'c'; 'b']; ['f'; 'b']]
```
Cycle from a given node

Write a functions `cycle g a` that returns a closed path (cycle) `p`
starting at a given node `a` in the graph `g`. The predicate should
return the list of all cycles via backtracking.

Solution

```tryocaml
  let cycles g a =
    let n = neighbors g a (fun _ -> true) in
    let p = List.concat(List.map (fun c -> list_path g a [c]) n) in
    List.map (fun p -> p @ [a]) p

  cycles example_graph 'f'
  = [['f'; 'b'; 'c'; 'f']; ['f'; 'c'; 'f']; ['f'; 'c'; 'b'; 'f'];
     ['f'; 'b'; 'f']; ['f'; 'k'; 'f']]
```
Construct all spanning trees

![Spanning tree
graph](https://sites.google.com/site/prologsite/_/rsrc/1264949059996/prolog-problems/6/p83.gif "")

Write a function `s_tree g` to construct (by backtracking) all [spanning
trees](http://en.wikipedia.org/wiki/Spanning_tree) of a given graph `g`.
With this predicate, find out how many spanning trees there are for the
graph depicted to the left. The data of this example graph can be found
in the test below. When you have a correct solution for the `s_tree`
function, use it to define two other useful functions: `is_tree graph`
and `is_connected       Graph`. Both are five-minutes tasks!

Solution

```tryocaml
  let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
            edges = [('a', 'b'); ('a', 'd'); ('b', 'c'); ('b', 'e');
                     ('c', 'e'); ('d', 'e'); ('d', 'f'); ('d', 'g');
                     ('e', 'h'); ('f', 'g'); ('g', 'h')] }
```
![Spanning tree
graph](https://sites.google.com/site/prologsite/_/rsrc/1264949163407/prolog-problems/6/p84.gif "")

Construct the minimal spanning tree

Write a function `ms_tree graph` to construct the minimal spanning tree
of a given labelled graph. A labelled graph will be represented as
follows:

```tryocaml
  type ('a, 'b) labeled_graph = { nodes : 'a list;
                                  edges : ('a * 'a * 'b) list }
```
(Beware that from now on `nodes` and `edges` mask the previous fields of
the same name.)

Hint: Use the [algorithm of
Prim](http://en.wikipedia.org/wiki/Prim%27s_algorithm). A small
modification of the solution of P83 does the trick. The data of the
example graph to the right can be found below.

Solution

```tryocaml
  let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
            edges = [('a', 'b', 5); ('a', 'd', 3); ('b', 'c', 2); ('b', 'e', 4);
                     ('c', 'e', 6); ('d', 'e', 7); ('d', 'f', 4); ('d', 'g', 3);
                     ('e', 'h', 5); ('f', 'g', 4); ('g', 'h', 1)] }
```
Graph isomorphism

Two graphs G1(N1,E1) and G2(N2,E2) are isomorphic if there is a
bijection f: N1 → N2 such that for any nodes X,Y of N1, X and Y are
adjacent if and only if f(X) and f(Y) are adjacent.

Write a function that determines whether two graphs are isomorphic.
Hint: Use an open-ended list to represent the function f.

Solution

Node degree and graph coloration

* Write a function `degree graph node` that determines the degree of a
 given node.
* Write a function that generates a list of all nodes of a graph
 sorted according to decreasing degree.
* Use [Welsh-Powell&#39;s
 algorithm](http://en.wikipedia.org/wiki/Graph_coloring#Greedy_coloring)
 to paint the nodes of a graph in such a way that adjacent nodes have
 different colors.

Solution

Depth-first order graph traversal

Write a function that generates a depth-first order graph traversal
sequence. The starting point should be specified, and the output should
be a list of nodes that are reachable from this starting point (in
depth-first order).

Solution

Connected components

Write a predicate that splits a graph into its [connected
components](http://en.wikipedia.org/wiki/Connected_component_%28graph_theory%29).

Solution

Bipartite graphs

Write a predicate that finds out whether a given graph is
[bipartite](http://en.wikipedia.org/wiki/Bipartite_graph).

Solution

Generate K-regular simple graphs with N nodes

In a [K-regular graph](http://en.wikipedia.org/wiki/K-regular_graph) all
nodes have a degree of K; i.e. the number of edges incident in each node
is K. How many (non-isomorphic!) 3-regular graphs with 6 nodes are
there?

See also the [table of
results](https://sites.google.com/site/prologsite/prolog-problems/6/solutions-6/p6_11.txt?attredirects=0&d=1).

Solution

## Miscellaneous Problems
Eight queens problem

This is a classical problem in computer science. The objective is to
place eight queens on a chessboard so that no two queens are attacking
each other; i.e., no two queens are in the same row, the same column, or
on the same diagonal.

Hint: Represent the positions of the queens as a list of numbers 1..N.
Example: `[4;2;7;3;6;8;5;1]` means that the queen in the first column is
in row 4, the queen in the second column is in row 2, etc. Use the
generate-and-test paradigm.

Solution

Knight's tour

Another famous problem is this one: How can a knight jump on an N×N
chessboard in such a way that it visits every square exactly once?

Hints: Represent the squares by pairs of their coordinates `(x,y)`,
where both `x` and `y` are integers between 1 and N. Define the function
`jump n       (x,y)` that returns all coordinates `(u,v)` to which a
knight can jump from `(x,y)` to on a `n`×`n` chessboard. And finally,
represent the solution of our problem as a list knight positions (the
knight's tour).

Solution

Von Koch's conjecture

Several years ago I met a mathematician who was intrigued by a problem
for which he didn't know a solution. His name was Von Koch, and I don't
know whether the problem has been solved since.

![Tree
numbering](https://sites.google.com/site/prologsite/_/rsrc/1264955485190/prolog-problems/7/p92a.gif "")

Anyway, the puzzle goes like this: Given a tree with N nodes (and hence
N-1 edges). Find a way to enumerate the nodes from 1 to N and,
accordingly, the edges from 1 to N-1 in such a way, that for each edge K
the difference of its node numbers equals to K. The conjecture is that
this is always possible.

For small trees the problem is easy to solve by hand. However, for
larger trees, and 14 is already very large, it is extremely difficult to
find a solution. And remember, we don't know for sure whether there is
always a solution!

![Larger
tree](https://sites.google.com/site/prologsite/_/rsrc/1264955528417/prolog-problems/7/p92b.gif "")

Write a function that calculates a numbering scheme for a given tree.
What is the solution for the larger tree pictured above?

Solution

An arithmetic puzzle

Given a list of integer numbers, find a correct way of inserting
arithmetic signs (operators) such that the result is a correct equation.
Example: With the list of numbers `[2;3;5;7;11]` we can form the
equations 2-3+5+7 = 11 or 2 = (3*5+7)/11 (and ten others!).

Solution

English number words

On financial documents, like cheques, numbers must sometimes be written
in full words. Example: 175 must be written as one-seven-five. Write a
function `full_words` to print (non-negative) integer numbers in full
words.

Solution

Syntax checker

![Syntax
graph](https://sites.google.com/site/prologsite/_/rsrc/1264955783053/prolog-problems/7/p96.gif "")

In a certain programming language (Ada) identifiers are defined by the
syntax diagram (railroad chart) opposite. Transform the syntax diagram
into a system of syntax diagrams which do not contain loops; i.e. which
are purely recursive. Using these modified diagrams, write a function
`identifier : string -> bool` that can check whether or not a given
string is a legal identifier.

Solution

Sudoku

Sudoku puzzles go like this:

```tryocaml
   Problem statement                 Solution

    .  .  4 | 8  .  . | .  1  7      9  3  4 | 8  2  5 | 6  1  7
            |         |                      |         |
    6  7  . | 9  .  . | .  .  .      6  7  2 | 9  1  4 | 8  5  3
            |         |                      |         |
    5  .  8 | .  3  . | .  .  4      5  1  8 | 6  3  7 | 9  2  4
    --------+---------+--------      --------+---------+--------
    3  .  . | 7  4  . | 1  .  .      3  2  5 | 7  4  8 | 1  6  9
            |         |                      |         |
    .  6  9 | .  .  . | 7  8  .      4  6  9 | 1  5  3 | 7  8  2
            |         |                      |         |
    .  .  1 | .  6  9 | .  .  5      7  8  1 | 2  6  9 | 4  3  5
    --------+---------+--------      --------+---------+--------
    1  .  . | .  8  . | 3  .  6      1  9  7 | 5  8  2 | 3  4  6
            |         |                      |         |
    .  .  . | .  .  6 | .  9  1      8  5  3 | 4  7  6 | 2  9  1
            |         |                      |         |
    2  4  . | .  .  1 | 5  .  .      2  4  6 | 3  9  1 | 5  7  8
```
Every spot in the puzzle belongs to a (horizontal) row and a (vertical)
column, as well as to one single 3x3 square (which we call "square" for
short). At the beginning, some of the spots carry a single-digit number
between 1 and 9. The problem is to fill the missing spots with digits in
such a way that every number between 1 and 9 appears exactly once in
each row, in each column, and in each square.

Solution

Nonograms

Around 1994, a certain kind of puzzles was very popular in England. The
"Sunday Telegraph" newspaper wrote: "Nonograms are puzzles from Japan
and are currently published each week only in The Sunday Telegraph.
Simply use your logic and skill to complete the grid and reveal a
picture or diagram." As an OCaml programmer, you are in a better
situation: you can have your computer do the work!

The puzzle goes like this: Essentially, each row and column of a
rectangular bitmap is annotated with the respective lengths of its
distinct strings of occupied cells. The person who solves the puzzle
must complete the bitmap given only these lengths.

```tryocaml
          Problem statement:          Solution:

          |_|_|_|_|_|_|_|_| 3         |_|X|X|X|_|_|_|_| 3
          |_|_|_|_|_|_|_|_| 2 1       |X|X|_|X|_|_|_|_| 2 1
          |_|_|_|_|_|_|_|_| 3 2       |_|X|X|X|_|_|X|X| 3 2
          |_|_|_|_|_|_|_|_| 2 2       |_|_|X|X|_|_|X|X| 2 2
          |_|_|_|_|_|_|_|_| 6         |_|_|X|X|X|X|X|X| 6
          |_|_|_|_|_|_|_|_| 1 5       |X|_|X|X|X|X|X|_| 1 5
          |_|_|_|_|_|_|_|_| 6         |X|X|X|X|X|X|_|_| 6
          |_|_|_|_|_|_|_|_| 1         |_|_|_|_|X|_|_|_| 1
          |_|_|_|_|_|_|_|_| 2         |_|_|_|X|X|_|_|_| 2
           1 3 1 7 5 3 4 3             1 3 1 7 5 3 4 3
           2 1 5 1                     2 1 5 1
```
For the example above, the problem can be stated as the two lists
`[[3];[2;1];[3;2];[2;2];[6];[1;5];[6];[1];[2]]` and
`[[1;2];[3;1];[1;5];[7;1];[5];[3];[4];[3]]` which give the "solid"
lengths of the rows and columns, top-to-bottom and left-to-right,
respectively. Published puzzles are larger than this example, e.g.
25×20, and apparently always have unique solutions.

Solution

Crossword puzzle

Given an empty (or almost empty) framework of a crossword puzzle and a
set of words. The problem is to place the words into the framework.

![puzzle](https://sites.google.com/site/prologsite/_/rsrc/1264956149766/prolog-problems/7/p99.gif "")

The particular crossword puzzle is specified in a text file which first
lists the words (one word per line) in an arbitrary order. Then, after
an empty line, the crossword framework is defined. In this framework
specification, an empty character location is represented by a dot (.).
In order to make the solution easier, character locations can also
contain predefined character values. The puzzle above is defined in the
file
[p7_09a.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09a.dat?attredirects=0&d=1),
other examples are
[p7_09b.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09b.dat?attredirects=0&d=1)
and
[p7_09d.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09d.dat?attredirects=0&d=1).
There is also an example of a puzzle
([p7_09c.dat](https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09c.dat?attredirects=0&d=1))
which does not have a solution.

Words are strings (character lists) of at least two characters. A
horizontal or vertical sequence of character places in the crossword
puzzle framework is called a site. Our problem is to find a compatible
way of placing words onto sites.

**Hints:**

1. The problem is not easy. You will need some time to thoroughly
 understand it. So, don't give up too early! And remember that the
 objective is a clean solution, not just a quick-and-dirty hack!
1. For efficiency reasons it is important, at least for larger puzzles,
 to sort the words and the sites in a particular order.

Solution

