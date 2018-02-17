<!-- ((! set title 99 problems  !)) ((! set learn !)) -->

**Your Help is Needed**   
Many of the solutions below have been written by [Victor
Nicollet](https://github.com/VictorNicollet/99-Problems-OCaml). Please
<a href="https://github.com/ocaml/ocaml.org/tree/master/((! tryget filename !))">contribute</a> more solutions or improve the existing ones.

*Table of contents*

# 99 Problems (solved) in OCaml
This section is inspired by [Ninety-Nine Lisp
Problems](http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html)
which in turn was based on “[Prolog problem
list](https://sites.google.com/site/prologsite/prolog-problems/)”. For
each of these questions, some simple tests are shown—they may also serve
to make the question clearer if needed. To work on these problems, we
recommend you first [install OCaml](/docs/install.html) or use it [inside
your browser](http://try.ocamlpro.com/). The source of the following
problems is available on
[GitHub](https://github.com/VictorNicollet/99-Problems-OCaml).

## Working with lists

#### 1. Write a function `last : 'a list -> 'a option` that returns the last element of a list. (*easy*)

SOLUTION

> ```ocamltop
> let rec last = function
>   | [] -> None
>   | [x] -> Some x
>   | _ :: t -> last t;;
> ```

```ocamltop
last [ "a" ; "b" ; "c" ; "d" ];;
last [];;
```

#### 2. Find the last but one (last and penultimate) elements of a list. (*easy*)

SOLUTION

> ```ocamltop
> let rec last_two = function
>   | [] | [_] -> None
>   | [x;y] -> Some (x,y)
>   | _::t -> last_two t;;
> ```

```ocamltop
last_two [ "a" ; "b" ; "c" ; "d" ];;
last_two [ "a" ];;
```

#### 3. Find the `k`'th element of a list. (*easy*)

SOLUTION

> ```ocamltop
> let rec at k = function
>   | [] -> None
>   | h :: t -> if k = 1 then Some h else at (k-1) t;;
> ```

```ocamltop
at 3 [ "a" ; "b"; "c"; "d"; "e" ];;
at 3 [ "a" ];;
```

REMARK: OCaml has `List.nth` which numbers elements from `0` and
raises an exception if the index is out of bounds.

```ocamltop
List.nth [ "a" ; "b"; "c"; "d"; "e" ] 2;;
List.nth [ "a" ] 2;;
```


#### 4. Find the number of elements of a list. (*easy*)

OCaml standard library has `List.length` but we ask that you reimplement
it. Bonus for a [tail recursive](http://en.wikipedia.org/wiki/Tail_call)
solution.

SOLUTION

> ```ocamltop
> (* This function is tail-recursive: it uses a constant amount of
>    stack memory regardless of list size. *)
> let length list =
>   let rec aux n = function
>     | [] -> n
>     | _::t -> aux (n+1) t
>   in aux 0 list;;
> ```

```ocamltop
length [ "a" ; "b" ; "c"];;
length [];;
```

#### 5. Reverse a list. (*easy*)

OCaml standard library has `List.rev` but we ask that you reimplement
it.

SOLUTION

> ```ocamltop
> let rev list =
>   let rec aux acc = function
>     | [] -> acc
>     | h::t -> aux (h::acc) t in
>   aux [] list;;
> ```

```ocamltop
rev ["a" ; "b" ; "c"];;
```

#### 6. Find out whether a list is a palindrome. (*easy*)

HINT: a palindrome is its own reverse.

SOLUTION

> ```ocamltop
> let is_palindrome list =
>   list = List.rev list
> (* One can use either the rev function from the previous problem, or the
>    built-in List.rev *);;
> ```

```ocamltop
is_palindrome [ "x" ; "a" ; "m" ; "a" ; "x" ];;
not (is_palindrome [ "a" ; "b" ]);;
```

#### 7. Flatten a nested list structure. (*medium*)

```ocamltop
(* There is no nested list type in OCaml, so we need to define one
   first. A node of a nested list is either an element, or a list of
   nodes. *)
type 'a node =
  | One of 'a 
  | Many of 'a node list;;
```

SOLUTION

> ```ocamltop
> (* This function traverses the list, prepending any encountered elements
>   to an accumulator, which flattens the list in inverse order. It can
>   then be reversed to obtain the actual flattened list. *)
> 
> let flatten list =
>   let rec aux acc = function
>     | [] -> acc
>     | One x :: t -> aux (x :: acc) t
>     | Many l :: t -> aux (aux acc l) t in
>   List.rev (aux [] list);;
> ```

```ocamltop
flatten [ One "a" ; Many [ One "b" ; Many [ One "c" ; One "d" ] ; One "e" ] ];;
```

#### 8. Eliminate consecutive duplicates of list elements. (*medium*)

SOLUTION

> ```ocamltop
> let rec compress = function
>   | a :: (b :: _ as t) -> if a = b then compress t else a :: compress t
>   | smaller -> smaller;;
> ```

```ocamltop
compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
```

#### 9. Pack consecutive duplicates of list elements into sublists. (*medium*)

SOLUTION

> ```ocamltop
> let pack list =
>   let rec aux current acc = function
>     | [] -> []    (* Can only be reached if original list is empty *)
>     | [x] -> (x :: current) :: acc
>     | a :: (b :: _ as t) ->
>        if a = b then aux (a :: current) acc t
>        else aux [] ((a :: current) :: acc) t  in
>   List.rev (aux [] [] list);;
> ```

```ocamltop
pack ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"d";"e";"e";"e";"e"];;
```


#### 10. Run-length encoding of a list. (*easy*)

If you need so, refresh your memory about
[run-length encoding](http://en.wikipedia.org/wiki/Run-length_encoding).

SOLUTION

> ```ocamltop
> let encode list =
>   let rec aux count acc = function
>     | [] -> [] (* Can only be reached if original list is empty *)
>     | [x] -> (count+1, x) :: acc
>     | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
>                             else aux 0 ((count+1,a) :: acc) t in
>   List.rev (aux 0 [] list);;
> ```
> An alternative solution, which is shorter but requires more memory, is to use
> the [pack](#Packconsecutiveduplicatesoflistelementsintosublistsmedium)
> function declared above:
> ```ocamltop
> let encode list =
>   List.map (fun l -> (List.length l, List.hd l)) (pack list)
> ```

Here is an example:

```ocamltop
encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
```

#### 11. Modified run-length encoding. (*easy*)

Modify the result of the previous problem in such a way that if an
element has no duplicates it is simply copied into the result list. Only
elements with duplicates are transferred as (N E) lists.

Since OCaml lists are homogeneous, one needs to define a type to hold
both single elements and sub-lists.

```ocamltop
type 'a rle =
  | One of 'a
  | Many of int * 'a;;
```

SOLUTION

> ```ocamltop
> let encode l =
>   let create_tuple cnt elem =
>     if cnt = 1 then One elem
>     else Many (cnt, elem) in
>   let rec aux count acc = function
>     | [] -> []
>     | [x] -> (create_tuple (count+1) x) :: acc
>     | hd :: (snd :: _ as tl) ->
>         if hd = snd then aux (count + 1) acc tl
>         else aux 0 ((create_tuple (count + 1) hd) :: acc) tl in
>     List.rev (aux 0 [] l)
> ```

```ocamltop
encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
```

#### 12. Decode a run-length encoded list. (*medium*)

Given a run-length code list generated as specified in the previous
problem, construct its uncompressed version.

SOLUTION

> ```ocamltop
> let decode list =
>   let rec many acc n x =
>     if n = 0 then acc else many (x :: acc) (n-1) x in
>   let rec aux acc = function
>     | [] -> acc
>     | One x :: t -> aux (x :: acc) t
>     | Many (n,x) :: t -> aux (many acc n x) t  in
>   aux [] (List.rev list);;
> ```

```ocamltop
 decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")];;
```

#### 13. Run-length encoding of a list (direct solution). (*medium*)

Implement the so-called run-length encoding data compression method
directly. I.e. don't explicitly create the sublists containing the
duplicates, as in problem "[Pack consecutive duplicates of list elements into sublists](#Packconsecutiveduplicatesoflistelementsintosublistsmedium)", but only count them. As in problem 
"[Modified run-length encoding](#Modifiedrunlengthencodingeasy)", simplify the result list by replacing the singleton lists (1 X) by X.

SOLUTION

> ```ocamltop
> let encode list =
>   let rle count x = if count = 0 then One x else Many (count + 1, x) in
>   let rec aux count acc = function
>     | [] -> [] (* Can only be reached if original list is empty *)
>     | [x] -> rle count x :: acc
>     | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
>                             else aux 0 (rle count a :: acc) t  in
>   List.rev (aux 0 [] list);;
> ```

```ocamltop
encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
```

#### 14. Duplicate the elements of a list. (*easy*)

SOLUTION

> ```ocamltop
> let rec duplicate = function
>   | [] -> []
>   | h :: t -> h :: h :: duplicate t;;
> ```
> Remark: this function is not tail recursive.  Can you modify it so
> it becomes so?

```ocamltop
duplicate ["a";"b";"c";"c";"d"];;
```


#### 15. Replicate the elements of a list a given number of times. (*medium*)

SOLUTION

> ```ocamltop
> let replicate list n =
>   let rec prepend n acc x =
>     if n = 0 then acc else prepend (n-1) (x :: acc) x in
>   let rec aux acc = function
>     | [] -> acc
>     | h :: t -> aux (prepend n acc h) t  in
>   (* This could also be written as:
>      List.fold_left (prepend n) [] (List.rev list) *)
>   aux [] (List.rev list);;
> ```
> Note that `List.rev list` is needed only because we want `aux` to be
> [tail recursive](http://en.wikipedia.org/wiki/Tail_call).

```ocamltop
replicate ["a";"b";"c"] 3;;
```

#### 16. Drop every N'th element from a list. (*medium*)

SOLUTION

> ```ocamltop
> let drop list n =
>   let rec aux i = function
>     | [] -> []
>     | h :: t -> if i = n then aux 1 t else h :: aux (i+1) t  in
>   aux 1 list;;
> ```

```ocamltop
drop ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3;;
```

#### 17. Split a list into two parts; the length of the first part is given. (*easy*)

If the length of the first part is longer than the entire list, then the
first part is the list and the second part is empty.

SOLUTION

> ```ocamltop
> let split list n =
>   let rec aux i acc = function
>     | [] -> List.rev acc, []
>     | h :: t as l -> if i = 0 then List.rev acc, l
>                      else aux (i-1) (h :: acc) t  in
>   aux n [] list
> ```

```ocamltop
split ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3;;
split ["a";"b";"c";"d"] 5;;
```


#### 18. Extract a slice from a list. (*medium*)

Given two indices, `i` and `k`, the slice is the list containing the
elements between the `i`'th and `k`'th element of the original list
(both limits included). Start counting the elements with 0 (this is the
way the `List` module numbers elements).

SOLUTION

> ```ocamltop
> let slice list i k =
>   let rec take n = function
>     | [] -> []
>     | h :: t -> if n = 0 then [] else h :: take (n-1) t
>   in
>   let rec drop n = function
>     | [] -> []
>     | h :: t as l -> if n = 0 then l else drop (n-1) t
>   in
>   take (k - i + 1) (drop i list);;
> ```
>
> This solution has a drawback, namely that the `take` function is not
> [tail recurvive](https://en.wikipedia.org/wiki/Tail_call) so it may
> exhaust the stack when given a very long list.  You may also notice that
> the structure of `take` and `drop` is similar and you may want to
> abstract their common skeleton in a single function.  Here is a solution.
>
> ```ocamltop
> let rec fold_until f acc n = function
>   | [] -> (acc, [])
>   | h :: t as l -> if n = 0 then (acc, l)
>                    else fold_until f (f acc h) (n-1) t
>
> let slice list i k =
>   let _, list = fold_until (fun _ _ -> []) [] i list in
>   let taken, _ = fold_until (fun acc h -> h :: acc) [] (k - i + 1) list in
>   List.rev taken
> ```

```ocamltop
slice ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 2 6;;
```


#### 19. Rotate a list N places to the left. (*medium*)

SOLUTION

> ```ocamltop
> let split list n =
>   let rec aux i acc = function
>     | [] -> List.rev acc, []
>     | h :: t as l -> if i = 0 then List.rev acc, l
>                      else aux (i-1) (h :: acc) t  in
>   aux n [] list
> 
> let rotate list n =
>   let len = List.length list in
>   (* Compute a rotation value between 0 and len-1 *)
>   let n = if len = 0 then 0 else (n mod len + len) mod len in
>   if n = 0 then list
>   else let a, b = split list n in b @ a;;
> ```

```ocamltop
rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-2);;
```


#### 20. Remove the K'th element from a list. (*easy*)

The first element of the list is numbered 0, the second 1,...

SOLUTION

> ```ocamltop
> let rec remove_at n = function
>   | [] -> []
>   | h :: t -> if n = 0 then t else h :: remove_at (n-1) t;;
> ```

```ocamltop
remove_at 1 ["a";"b";"c";"d"];;
```


#### 21. Insert an element at a given position into a list. (*easy*)

Start counting list elements with 0.  If the position is larger or
equal to the length of the list, insert the element at the end.  (The
behavior is unspecified if the position is negative.)

SOLUTION

> ```ocamltop
> let rec insert_at x n = function
>   | [] -> [x]
>   | h :: t as l -> if n = 0 then x :: l else h :: insert_at x (n-1) t;;
> ```

```ocamltop
insert_at "alfa" 1 ["a";"b";"c";"d"];;
insert_at "alfa" 3 ["a";"b";"c";"d"];;
insert_at "alfa" 4 ["a";"b";"c";"d"];;
```


#### 22. Create a list containing all integers within a given range. (*easy*)

If first argument is greater than second, produce a list in decreasing
order.

SOLUTION

> ```ocamltop
> let range a b =
>   let rec aux a b =
>     if a > b then [] else a :: aux (a+1) b  in
>   if a > b then List.rev (aux b a) else aux a b;;
> ```
>
> A tail recursive implementation:
>
> ```ocamltop
> let range a b =
>   let rec aux acc high low =
>     if high >= low then
>       aux (high::acc) (high - 1) low
>     else acc
>   in if a < b then aux [] b a else List.rev (aux [] a b)
> ```

```ocamltop
range 4 9;;
range 9 4;;
```


#### 23. Extract a given number of randomly selected elements from a list. (*medium*)

The selected items shall be returned in a list. We use the `Random`
module but do not initialize it with `Random.self_init` for
reproducibility.

SOLUTION

> ```ocamltop
> let rec rand_select list n =
>   let rec extract acc n = function
>     | [] -> raise Not_found
>     | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
>   in
>   let extract_rand list len =
>     extract [] (Random.int len) list
>   in
>   let rec aux n acc list len =
>     if n = 0 then acc else
>       let picked, rest = extract_rand list len in
>       aux (n-1) (picked :: acc) rest (len-1)
>   in
>   let len = List.length list in
>   aux (min n len) [] list len;;
> ```

```ocamltop
rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3;;
```


#### 24. Lotto: Draw N different random numbers from the set 1..M. (*easy*)

The selected numbers shall be returned in a list.

SOLUTION

> ```ocamltop
> (* [range] and [rand_select] defined in problems above *)
> let lotto_select n m = rand_select (range 1 m) n;;
> ```

```ocamltop
lotto_select 6 49;;
```


#### 25. Generate a random permutation of the elements of a list. (*easy*)

SOLUTION

> ```ocamltop
> let rec permutation list =
>   let rec extract acc n = function
>     | [] -> raise Not_found
>     | h :: t -> if n = 0 then (h, acc @ t) else extract (h::acc) (n-1) t
>   in
>   let extract_rand list len =
>     extract [] (Random.int len) list
>   in
>   let rec aux acc list len =
>     if len = 0 then acc else
>       let picked, rest = extract_rand list len in
>       aux (picked :: acc) rest (len-1)
>   in
>   aux [] list (List.length list);;
> ```

```ocamltop
permutation ["a"; "b"; "c"; "d"; "e"; "f"];;
```


#### 26. Generate the combinations of K distinct objects chosen from the N elements of a list. (*medium*)

In how many ways can a committee of 3 be chosen from a group of 12
people? We all know that there are C(12,3) = 220 possibilities (C(N,K)
denotes the well-known binomial coefficients). For pure mathematicians,
this result may be great. But we want to really generate all the
possibilities in a list.

SOLUTION

> ```ocamltop
> let rec extract k list =
>   if k <= 0 then [ [] ]
>   else match list with
>        | [] -> []
>        | h :: tl ->
>           let with_h = List.map (fun l -> h :: l) (extract (k-1) tl) in
>           let without_h = extract k tl in
>           with_h @ without_h
> ```

```ocamltop
extract 2 ["a";"b";"c";"d"];;
```

#### 27. Group the elements of a set into disjoint subsets. (*medium*)

1. In how many ways can a group of 9 people work in 3 disjoint subgroups
of 2, 3 and 4 persons? Write a function that generates all the
possibilities and returns them in a list.
2. Generalize the above function in a way that we can specify a list of
group sizes and the function will return a list of groups.

SOLUTION

> ```ocamltop
>   (* This implementation is less streamlined than the one-extraction
>   version, because more work is done on the lists after each
>   transform to prepend the actual items. The end result is cleaner
>   in terms of code, though. *)
> 
>   let group list sizes =
>     let initial = List.map (fun size -> size, []) sizes in
>
>   (* The core of the function. Prepend accepts a list of groups,
>      each with the number of items that should be added, and
>      prepends the item to every group that can support it, thus
>      turning [1,a ; 2,b ; 0,c] into [ [0,x::a ; 2,b ; 0,c ];
>      [1,a ; 1,x::b ; 0,c]; [ 1,a ; 2,b ; 0,c ]]
> 
>      Again, in the prolog language (for which these questions are
>      originally intended), this function is a whole lot simpler.  *)
>   let prepend p list =
>     let emit l acc = l :: acc in
>     let rec aux emit acc = function
>       | [] -> emit [] acc
>       | (n,l) as h :: t ->
>          let acc = if n > 0 then emit ((n-1, p::l) :: t) acc
>                    else acc in
>          aux (fun l acc -> emit (h :: l) acc) acc t
>     in
>     aux emit [] list
>   in
>   let rec aux = function
>     | [] -> [ initial ]
>     | h :: t -> List.concat (List.map (prepend h) (aux t))
>   in
>   let all = aux list in
>   (* Don't forget to eliminate all group sets that have non-full
>      groups *)
>   let complete = List.filter (List.for_all (fun (x,_) -> x = 0)) all in
>   List.map (List.map snd) complete
> ```

```ocamltop
group ["a";"b";"c";"d"] [2;1]
```

#### 28. Sorting a list of lists according to length of sublists. (*medium*)

1. We suppose that a list contains elements that are lists themselves.
The objective is to sort the elements of this list according to their
length. E.g. short lists first, longer lists later, or vice versa.

2. Again, we suppose that a list contains elements that are lists
themselves. But this time the objective is to sort the elements of this
list according to their **length frequency**; i.e., in the default,
where sorting is done ascendingly, lists with rare lengths are placed
first, others with a more frequent length come later.

SOLUTION

> ```ocamltop
> (* We might not be allowed to use built-in List.sort, so here's an
>    eight-line implementation of insertion sort — O(n²) time
>    complexity. *)
> let rec insert cmp e = function
>   | [] -> [e]
>   | h :: t as l -> if cmp e h <= 0 then e :: l else h :: insert cmp e t
> 
> let rec sort cmp = function
>   | [] -> []
>   | h :: t -> insert cmp h (sort cmp t)
> 
> (* Sorting according to length : prepend length, sort, remove length *)
> let length_sort lists =
>   let lists = List.map (fun list -> List.length list, list) lists in
>   let lists = sort (fun a b -> compare (fst a) (fst b)) lists in
>   List.map snd lists
> ;;
> 
> (* Sorting according to length frequency : prepend frequency, sort,
>    remove frequency. Frequencies are extracted by sorting lengths
>    and applying RLE to count occurences of each length (see problem
>    "Run-length encoding of a list.") *)
> let rle list =
>   let rec aux count acc = function
>     | [] -> [] (* Can only be reached if original list is empty *)
>     | [x] -> (x, count + 1) :: acc
>     | a :: (b :: _ as t) ->
>        if a = b then aux (count + 1) acc t
>        else aux 0 ((a, count + 1) :: acc) t in
>   aux 0 [] list
> 
> let frequency_sort lists =
>   let lengths = List.map List.length lists in
>   let freq = rle (sort compare lengths) in
>   let by_freq =
>     List.map (fun list -> List.assoc (List.length list) freq , list) lists in
>   let sorted = sort (fun a b -> compare (fst a) (fst b)) by_freq in
>   List.map snd sorted
> ```

```ocamltop
length_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
              ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ];;
frequency_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                 ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ];;
```


<!-- No problem 29 and 30 -->

## Arithmetic

#### 31. Determine whether a given integer number is prime. (*medium*)

SOLUTION

> Recall that `d` divides `n` iff `n mod d = 0`.  This is a naive
> solution.  See the [Sieve of
> Eratosthenes](http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) for a
> more clever one.
> 
> ```ocamltop
> let is_prime n =
>   let n = abs n in
>   let rec is_not_divisor d =
>     d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
>   n <> 1 && is_not_divisor 2
> ```

```ocamltop
not(is_prime 1);;
is_prime 7;;
not (is_prime 12)
```

#### 32. Determine the greatest common divisor of two positive integer numbers. (*medium*)

Use Euclid's algorithm.

SOLUTION

> ```ocamltop
> let rec gcd a b =
>   if b = 0 then a else gcd b (a mod b)
> ```

```ocamltop
gcd 13 27;;
gcd 20536 7826
```

#### 33. Determine whether two positive integer numbers are coprime. (*easy*)

Two numbers are coprime if their greatest common divisor equals 1.

SOLUTION

> ```ocamltop
> (* [gcd] is defined in the previous question *)
> let coprime a b = gcd a b = 1
> ```

```ocamltop
coprime 13 27;;
not (coprime 20536 7826)
```


#### 34. Calculate Euler's totient function φ(m). (*medium*)

Euler's so-called totient function φ(m) is defined as the number of
positive integers r (1 ≤ r < m) that are coprime to m. We let φ(1) = 1.

Find out what the value of φ(m) is if m is a prime number.  Euler's
totient function plays an important role in one of the most widely used
public key cryptography methods (RSA). In this exercise you should use
the most primitive method to calculate this function (there are smarter
ways that we shall discuss later).

SOLUTION

> ```ocamltop
> (* [coprime] is defined in the previous question *)
> let phi n =
>   let rec count_coprime acc d =
>     if d < n then
>       count_coprime (if coprime n d then acc + 1 else acc) (d + 1)
>     else acc
>   in
>   if n = 1 then 1 else count_coprime 0 1
> ```

```ocamltop
phi 10;;
phi 13;;
```


#### 35. Determine the prime factors of a given positive integer. (*medium*)

Construct a flat list containing the prime factors in ascending order.

SOLUTION

> ```ocamltop
> (* Recall that d divides n iff [n mod d = 0] *)
> let factors n =
>   let rec aux d n =
>     if n = 1 then [] else
>       if n mod d = 0 then d :: aux d (n / d) else aux (d+1) n
>   in
>   aux 2 n
> ```

```ocamltop
factors 315;;
```


#### 36. Determine the prime factors of a given positive integer (2). (*medium*)

Construct a list containing the prime factors and their multiplicity.
*Hint:* The problem is similar to problem 
[Run-length encoding of a list (direct solution)](#Runlengthencodingofalistdirectsolutionmedium).

SOLUTION

> ```ocamltop
> let factors n =
>   let rec aux d n =
>     if n = 1 then [] else
>       if n mod d = 0 then
>         match aux d (n / d) with
>         | (h,n) :: t when h = d -> (h,n+1) :: t
>         | l -> (d,1) :: l
>       else aux (d+1) n
>   in
>   aux 2 n
> ```

```ocamltop
factors 315;;
```


#### 37. Calculate Euler's totient function φ(m) (improved). (*medium*)

See problem "[Calculate Euler&#39;s totient function φ(m)][totient]" for
the definition of Euler's totient function. If the list of the prime
factors of a number m is known in the form of the previous problem then
the function phi(m) can be efficiently calculated as follows: Let
`[(p1, m1); (p2, m2); (p3, m3); ...]` be the list of prime factors
(and their multiplicities) of a given number m. Then φ(m) can be
calculated with the following formula:

φ(m) = (p1 - 1) × p1<sup>m1 - 1</sup> × (p2 - 1) ×
p2<sup>m2 - 1</sup> × (p3 - 1) × p3<sup>m3 - 1</sup> × ⋯

[totient]: #CalculateEuler39stotientfunctionmmedium

SOLUTION

> ```ocamltop
> (* Naive power function. *)
> let rec pow n p = if p < 1 then 1 else n * pow n (p-1) ;;
> (* [factors] is defined in the previous question. *)
> let phi_improved n =
>   let rec aux acc = function
>     | [] -> acc
>     | (p,m) :: t -> aux ((p - 1) * pow p (m - 1) * acc) t in
>   aux 1 (factors n)
> ```

```ocamltop
phi_improved 10;;
phi_improved 13;;
```


#### 38. Compare the two methods of calculating Euler's totient function. (*easy*)

Use the solutions of problems 
"[Calculate Euler&#39;s totient function φ(m)][totient]" and 
"[Calculate Euler&#39;s totient function φ(m) (improved)][totient-improved]" 
to compare the algorithms. Take the number of logical inferences as a measure for efficiency. Try to calculate φ(10090) as an example.

[totient-improved]: #CalculateEuler39stotientfunctionmimprovedmedium

SOLUTION

> ```ocamltop
> (* Naive [timeit] function.  It requires the [Unix] module to be loaded. *)
> let timeit f a =
>   let t0 = Unix.gettimeofday() in
>   ignore(f a);
>   let t1 = Unix.gettimeofday() in
>   t1 -. t0
> ```

```ocamltop
timeit phi 10090;;
timeit phi_improved 10090
```


#### 39. A list of prime numbers. (*easy*)

Given a range of integers by its lower and upper limit, construct a list
of all prime numbers in that range.

SOLUTION

> ```ocamltop
> let is_prime n =
>   let n = max n (-n) in
>   let rec is_not_divisor d =
>     d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
>   is_not_divisor 2
> 
> let rec all_primes a b =
>   if a > b then [] else
>     let rest = all_primes (a + 1) b in
>     if is_prime a then a :: rest else rest
> ```

```ocamltop
List.length (all_primes 2 7920);;
```


#### 40. Goldbach's conjecture. (*medium*)

Goldbach's conjecture says that every positive even number greater than
2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of
the most famous facts in number theory that has not been proved to be
correct in the general case. It has been *numerically confirmed* up to
very large numbers. Write a function to find the two prime numbers that
sum up to a given even integer.

SOLUTION

> ```ocamltop
> (* [is_prime] is defined in the previous solution *)
> let goldbach n =
>   let rec aux d =
>     if is_prime d && is_prime (n - d) then (d, n-d)
>     else aux (d+1) in
>   aux 2
> ```

```ocamltop
goldbach 28;;
```


#### 41. A list of Goldbach compositions. (*medium*)

Given a range of integers by its lower and upper limit, print a list of
all even numbers and their Goldbach composition.

In most cases, if an even number is written as the sum of two prime
numbers, one of them is very small. Very rarely, the primes are both
bigger than say 50. Try to find out how many such cases there are in the
range 2..3000.

SOLUTION

> ```ocamltop
> (* [goldbach] is defined in the previous question. *)
> let rec goldbach_list a b =
>   if a > b then [] else
>     if a mod 2 = 1 then goldbach_list (a+1) b
>     else (a, goldbach a) :: goldbach_list (a+2) b
> 
> let goldbach_limit a b lim =
>   List.filter (fun (_,(a,b)) -> a > lim && b > lim) (goldbach_list a b)
> ```

```ocamltop
goldbach_list 9 20;;
goldbach_limit 1 2000 50;;
```

<!-- No problem 42–45 -->

## Logic and Codes

Let us define a small "language" for boolean expressions containing
variables:

```ocamltop
type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr
```

A logical expression in two variables can then be written in prefix
notation.  For example, `(a ∨ b) ∧ (a ∧ b)` is written:

```ocamltop
And(Or(Var "a", Var "b"), And(Var "a", Var "b"))
```

#### 46 & 47. Truth tables for logical expressions (2 variables). (*medium*)

Define a function, `table2` which returns the truth table of a given
logical expression in two variables (specified as arguments). The return
value must be a list of triples containing
`(value_of_a, balue_of_b,     value_of_expr)`.

SOLUTION

> ```ocamltop
> let rec eval2 a val_a b val_b = function
>   | Var x -> if x = a then val_a
>              else if x = b then val_b
>              else failwith "The expression contains an invalid variable"
>   | Not e -> not(eval2 a val_a b val_b e)
>   | And(e1, e2) -> eval2 a val_a b val_b e1 && eval2 a val_a b val_b e2
>   | Or(e1, e2) -> eval2 a val_a b val_b e1 || eval2 a val_a b val_b e2
> let table2 a b expr =
>   [(true,  true,  eval2 a true  b true  expr);
>    (true,  false, eval2 a true  b false expr);
>    (false, true,  eval2 a false b true  expr);
>    (false, false, eval2 a false b false expr) ]
> ```

```ocamltop
table2 "a" "b" (And(Var "a", Or(Var "a", Var "b")));;
```


#### 48. Truth tables for logical expressions. (*medium*)

Generalize the previous problem in such a way that the logical
expression may contain any number of logical variables. Define `table`
in a way that `table variables expr` returns the truth table for the
expression `expr`, which contains the logical variables enumerated in
`variables`.

SOLUTION

> ```ocamltop
> (* [val_vars] is an associative list containing the truth value of
>    each variable.  For efficiency, a Map or a Hashtlb should be
>    preferred. *)
> 
> let rec eval val_vars = function
>   | Var x -> List.assoc x val_vars
>   | Not e -> not(eval val_vars e)
>   | And(e1, e2) -> eval val_vars e1 && eval val_vars e2
>   | Or(e1, e2) -> eval val_vars e1 || eval val_vars e2
> 
> (* Again, this is an easy and short implementation rather than an
>    efficient one. *)
> let rec table_make val_vars vars expr =
>   match vars with
>   | [] -> [(List.rev val_vars, eval val_vars expr)]
>   | v :: tl ->
>      table_make ((v, true) :: val_vars) tl expr
>      @ table_make ((v, false) :: val_vars) tl expr
> 
> let table vars expr = table_make [] vars expr
> ```

```ocamltop
table ["a"; "b"] (And(Var "a", Or(Var "a", Var "b")));;
let a = Var "a" and b = Var "b" and c = Var "c" in
table ["a"; "b"; "c"] (Or(And(a, Or(b,c)), Or(And(a,b), And(a,c))));;
```


#### 49. Gray code. (*medium*)

An n-bit Gray code is a sequence of n-bit strings constructed according
to certain rules. For example,

```text
n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
```
Find out the construction rules and write a function with the following
specification: `gray n` returns the `n`-bit Gray code.

SOLUTION

> ```ocamltop
>   let gray n =
>     let rec gray_next_level k l =
>       if k<n then
>         (* This is the core part of the Gray code construction.
>          * first_half is reversed and has a "0" attached to every element.
>          * Second part is reversed (it must be reversed for correct gray code).
>          * Every element has "1" attached to the front.*)
>         let (first_half,second_half) =
>           List.fold_left (fun (acc1,acc2) x ->
>               (("0"^x)::acc1, ("1"^x)::acc2 )) ([],[]) l
>         in
>         (* List.rev_append turns first_half around and attaches it to second_half.
>          * The result is the modified first_half in correct order attached to
>          * the second_half modified in reversed order.*)
>         gray_next_level (k+1) (List.rev_append first_half second_half)
>       else l
>     in
>     gray_next_level 1 ["0"; "1"];;
> ```

```ocamltop
gray 1;;
gray 2;;
gray 3;;
```


#### 50. Huffman code (*hard*)

First of all, consult a good book on discrete mathematics or algorithms
for a detailed description of Huffman codes (you can start with the
[Wikipedia page](http://en.wikipedia.org/wiki/Huffman_coding))!

We consider a set of symbols with their frequencies.
For example, if the alphabet is `"a"`,..., `"f"`
(represented as the positions 0,...5) and
respective frequencies are 45, 13, 12, 16, 9, 5:

```ocamltop
let fs = [ ("a", 45); ("b", 13); ("c", 12); ("d", 16);
           ("e", 9); ("f", 5) ]
```

Our objective is to construct the
Huffman code `c` word for all symbols `s`. In our example, the result could
be
`hs = [("a", "0"); ("b", "101"); ("c", "100"); ("d", "111");
("e", "1101"); ("f", "1100")]`
(or `hs = [ ("a", "1");...]`). The task shall be performed by the function
`huffman` defined as follows: `huffman(fs)` returns the Huffman code
table for the frequency table `fs`

SOLUTION

> ```ocamltop
> (* Simple priority queue where the priorities are integers 0..100.
>    The node with the lowest probability comes first. *)
> module Pq = struct
>   type 'a t = { data: 'a list array;  mutable first: int }
>   let make() = { data = Array.make 101 [];  first = 101 }
>
>   let add q p x =
>     q.data.(p) <- x :: q.data.(p);  q.first <- min p q.first
>
>   let get_min q =
>     if q.first = 101 then None
>     else
>       match q.data.(q.first) with
>       | [] -> assert false
>       | x :: tl ->
>          let p = q.first in
>          q.data.(q.first) <- tl;
>          while q.first < 101 && q.data.(q.first) = [] do
>            q.first <- q.first + 1
>          done;
>          Some(p, x)
> end
>
> type tree =
>   | Leaf of string
>   | Node of tree * tree
>
> let rec huffman_tree q =
>   match Pq.get_min q, Pq.get_min q with
>   | Some(p1, t1), Some(p2, t2) -> Pq.add q (p1 + p2) (Node(t1, t2));
>                                  huffman_tree q
>   | Some(_, t), None | None, Some(_, t) -> t
>   | None, None -> assert false
>
> (* Build the prefix-free binary code from the tree *)
> let rec prefixes_of_tree prefix = function
>   | Leaf s -> [(s, prefix)]
>   | Node(t0, t1) -> prefixes_of_tree (prefix ^ "0") t0
>                    @ prefixes_of_tree (prefix ^ "1") t1
>
> let huffman fs =
>   if List.fold_left (fun s (_,p) -> s + p) 0 fs <> 100 then
>     failwith "huffman: sum of weights must be 100";
>   let q = Pq.make() in
>   List.iter (fun (s,f) -> Pq.add q f (Leaf s)) fs;
>   prefixes_of_tree "" (huffman_tree q)
> ```

```ocamltop
huffman fs;;
huffman ["a", 10;  "b", 15;  "c", 30;  "d", 16;  "e", 29];;
```

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/binary-tree.gif" title="Binary Tree"></img>

<!-- No problems 51–54 -->

## Binary Trees

*A binary tree is either empty or it is composed of a root element and
two successors, which are binary trees themselves.*

In OCaml, one can define a new type `binary_tree` that carries an
arbitrary value of type `'a` (thus is polymorphic) at each node.

```ocamltop
type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree
```

An example of tree carrying `char` data is:

```ocamltop
let example_tree =
  Node('a', Node('b', Node('d', Empty, Empty), Node('e', Empty, Empty)),
       Node('c', Empty, Node('f', Node('g', Empty, Empty), Empty)));;
let example_int_tree =
  Node(1, Node(2, Node(4, Empty, Empty), Node(5, Empty, Empty)),
       Node(3, Empty, Node(6, Node(7, Empty, Empty), Empty)))
```

In OCaml, the strict type discipline *guarantees* that, if you get a
value of type `binary_tree`, then it must have been created with the two
constructors `Empty` and `Node`.

#### 55. Construct completely balanced binary trees. (*medium*)

In a completely balanced binary tree, the following property holds for
every node: The number of nodes in its left subtree and the number of
nodes in its right subtree are almost equal, which means their
difference is not greater than one.

Write a function `cbal_tree` to construct completely balanced binary
trees for a given number of nodes. The function should generate all
solutions via backtracking. Put the letter `'x'` as information into all
nodes of the tree.

SOLUTION

> ```ocamltop
> (* Build all trees with given [left] and [right] subtrees. *)
> let add_trees_with left right all =
>   let add_right_tree all l =
>     List.fold_left (fun a r -> Node('x', l, r) :: a) all right in
>   List.fold_left add_right_tree all left
> 
> let rec cbal_tree n =
>   if n = 0 then [Empty]
>   else if n mod 2 = 1 then
>     let t = cbal_tree (n / 2) in
>     add_trees_with t t []
>   else (* n even: n-1 nodes for the left & right subtrees altogether. *)
>     let t1 = cbal_tree (n / 2 - 1) in
>     let t2 = cbal_tree (n / 2) in
>     add_trees_with t1 t2 (add_trees_with t2 t1 [])
> ```

```ocamltop
cbal_tree 4;;
List.length(cbal_tree 40)
```


#### 56. Symmetric binary trees. (*medium*)

Let us call a binary tree symmetric if you can draw a vertical line
through the root node and then the right subtree is the mirror image of
the left subtree. Write a function `is_symmetric` to check whether a
given binary tree is symmetric.

Hint: Write a function `is_mirror` first to check whether one tree is
the mirror image of another. We are only interested in the structure,
not in the contents of the nodes.

SOLUTION

> ```ocamltop
> let rec is_mirror t1 t2 =
>   match t1, t2 with
>   | Empty, Empty -> true
>   | Node(_, l1, r1), Node(_, l2, r2) ->
>      is_mirror l1 r2 && is_mirror r1 l2
>   | _ -> false
> 
> let is_symmetric = function
>   | Empty -> true
>   | Node(_, l, r) -> is_mirror l r
> ```


#### 57. Binary search trees (dictionaries). (*medium*)

Construct a 
[binary search tree](http://en.wikipedia.org/wiki/Binary_search_tree) 
from a list of integer numbers.

SOLUTION

> ```ocamltop
> let rec insert tree x = match tree with
>   | Empty -> Node(x, Empty, Empty)
>   | Node(y, l, r) ->
>      if x = y then tree
>      else if x < y then Node(y, insert l x, r)
>      else Node(y, l, insert r x)
> let construct l = List.fold_left insert Empty l;;
> ```

```ocamltop
construct [3;2;5;7;1];;
```

Then use this function to test the solution of the previous problem.

```ocamltop
is_symmetric(construct [5;3;18;1;4;12;21]);;
not(is_symmetric(construct [3;2;5;7;4]))
```


#### 58. Generate-and-test paradigm. (*medium*)

Apply the generate-and-test paradigm to construct all symmetric,
completely balanced binary trees with a given number of nodes.

SOLUTION

> ```ocamltop
> let sym_cbal_trees n =
>   List.filter is_symmetric (cbal_tree n)
> ```

```ocamltop
sym_cbal_trees 5;;
```

How many such trees are there with 57 nodes? Investigate about how many
solutions there are for a given number of nodes? What if the number is
even? Write an appropriate function.

```ocamltop
List.length (sym_cbal_trees 57);;
List.map (fun n -> n, List.length(sym_cbal_trees n)) (range 10 20)
```


#### 59. Construct height-balanced binary trees. (*medium*)

In a height-balanced binary tree, the following property holds for every
node: The height of its left subtree and the height of its right subtree
are almost equal, which means their difference is not greater than one.

Write a function `hbal_tree` to construct height-balanced binary trees
for a given height. The function should generate all solutions via
backtracking. Put the letter `'x'` as information into all nodes of the
tree.

SOLUTION

> The function `add_trees_with` is defined in the solution of
> [Construct completely balanced binary trees](#Constructcompletelybalancedbinarytreesmedium).
>
> ```ocamltop
> let rec hbal_tree n =
>   if n = 0 then [Empty]
>   else if n = 1 then [Node('x', Empty, Empty)]
>   else
>   (* [add_trees_with left right trees] is defined in a question above. *)
>     let t1 = hbal_tree (n - 1)
>     and t2 = hbal_tree (n - 2) in
>     add_trees_with t1 t1 (add_trees_with t1 t2 (add_trees_with t2 t1 []))
> ```


```ocamltop
let t = hbal_tree 3;;
let x = 'x';;
List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
               Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)))) t;;
List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
               Node(x, Node(x, Empty, Empty), Empty))) t;;
List.length t;;
```


#### 60. Construct height-balanced binary trees with a given number of nodes. (*medium*)

Consider a height-balanced binary tree of height `h`. What is the
maximum number of nodes it can contain? Clearly,
max_nodes = 2<sup>`h`</sup> - 1.

```ocamltop
let max_nodes h = 1 lsl h - 1
```

However, what is the minimum number min_nodes? This question is more
difficult. Try to find a recursive statement and turn it into a function
`min_nodes` defined as follows: `min_nodes h` returns the minimum number
of nodes in a height-balanced binary tree of height `h`.

SOLUTION

> The following solution comes directly from translating the question.
> ```ocamltop
> let rec min_nodes h =
>   if h <= 0 then 0 
>   else if h = 1 then 1
>   else min_nodes (h - 1) + min_nodes (h - 2) + 1
> ```
> It is not the more efficient one however.  One should use the last
> two values as the state to avoid the double recursion.
> ```ocamltop
> let rec min_nodes_loop m0 m1 h =
>   if h <= 1 then m1
>   else min_nodes_loop m1 (m1 + m0 + 1) (h - 1)
>
> let min_nodes h =
>   if h <= 0 then 0 else min_nodes_loop 0 1 h
> ```
>
> It is not difficult to show that `min_nodes h` = F<sub>h+2‌</sub> - 1,
> where (F<sub>n</sub>) is the
> [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number).

On the other hand, we might ask: what are the minimum (resp. maximum)
height H a
height-balanced binary tree with N nodes can have?
`min_height` (resp. `max_height n`) returns
the minimum (resp. maximum) height of a height-balanced binary tree
with `n` nodes.

SOLUTION

> Inverting the formula max_nodes = 2<sup>`h`</sup> - 1, one directly
> find that Hₘᵢₙ(n) = ⌈log₂(n+1)⌉ which is readily
> implemented:
>
> ```ocamltop
> let min_height n = int_of_float(ceil(log(float(n + 1)) /. log 2.))
> ```
>
> Let us give a proof that the formula for Hₘᵢₙ is valid.  First, if h
> = `min_height` n, there exists a height-balanced tree of height h
> with n nodes.  Thus 2ʰ - 1 = `max_nodes h` ≥ n i.e., h ≥ log₂(n+1).
> To establish equality for Hₘᵢₙ(n), one has to show that, for any n,
> there exists a height-balanced tree with height Hₘᵢₙ(n).  This is
> due to the relation Hₘᵢₙ(n) = 1 + Hₘᵢₙ(n/2) where n/2 is the integer
> division.  For n odd, this is readily proved — so one can build a
> tree with a top node and two sub-trees with n/2 nodes of height
> Hₘᵢₙ(n) - 1.  For n even, the same proof works if one first remarks
> that, in that case, ⌈log₂(n+2)⌉ = ⌈log₂(n+1)⌉ — use log₂(n+1) ≤ h ∈
> ℕ ⇔ 2ʰ ≥ n + 1 and the fact that 2ʰ is even for that.  This allows
> to have a sub-tree with n/2 nodes.  For the other sub-tree with
> n/2-1 nodes, one has to establish that Hₘᵢₙ(n/2-1) ≥ Hₘᵢₙ(n) - 2
> which is easy because, if h = Hₘᵢₙ(n/2-1), then h+2 ≥ log₂(2n) ≥
> log₂(n+1).
>
> The above function is not the best one however.  Indeed, not every
> 64 bits integer can be represented exactly as a floating point
> number.  Here is one that only uses integer operations:
>
> ```ocamltop
> let rec ceil_log2_loop log plus1 n =
>   if n = 1 then if plus1 then log + 1 else log
>   else ceil_log2_loop (log + 1) (plus1 || n land 1 <> 0) (n / 2)
>
> let ceil_log2 n = ceil_log2_loop 0 false n
> ```
>
> This algorithm is still not the fastest however.  See for example
> the [Hacker's Delight](http://www.hackersdelight.org/), section 5-3
> (and 11-4).
>
> Following the same idea as above, if h = `max_height` n, then one
> easily deduces that `min_nodes` h ≤ n < `min_nodes`(h+1).  This
> yields the following code:
>
> ```ocamltop
> let rec max_height_search h n =
>  if min_nodes h <= n then max_height_search (h+1) n else h-1
> let max_height n = max_height_search 0 n
> ```
>
> Of course, since `min_nodes` is computed recursively, there is no
> need to recompute everything to go from `min_nodes h` to
> `min_nodes(h+1)`:
>
> ```ocamltop
> let rec max_height_search h m_h m_h1 n =
>   if m_h <= n then max_height_search (h+1) m_h1 (m_h1 + m_h + 1) n else h-1
>
> let max_height n = max_height_search 0 0 1 n
> ```

Now, we can attack the main problem: construct all the height-balanced
binary trees with a given number of nodes. `hbal_tree_nodes n` returns a
list of all height-balanced binary tree with `n` nodes.

SOLUTION

> First, we define some convenience functions `fold_range` that folds
> a function `f` on the range `n0`...`n1` i.e., it computes
> `f (... f (f (f init n0) (n0+1)) (n0+2) ...) n1`.  You can think it
> as performing the assignment `init ← f init n` for `n = n0,..., n1`
> except that there is no mutable variable in the code.
>
> ```ocamltop
> let rec fold_range ~f ~init n0 n1 =
>   if n0 > n1 then init else fold_range ~f ~init:(f init n0) (n0 + 1) n1
> ```
>
> When constructing trees, there is an obvious symmetry: if one swaps
> the left and right sub-trees of a balanced tree, we still have a
> balanced tree.  The following function returns all trees in `trees`
> together with their permutation.
>
> ```ocamltop
> let rec add_swap_left_right trees =
>   List.fold_left (fun a n -> match n with
>                              | Node(v, t1, t2) -> Node(v, t2, t1) :: a
>                              | Empty -> a) trees trees
> ```
>
> Finally we generate all trees recursively, using a priori the bounds
> computed above.  It could be further optimized but our aim is to
> straightforwardly express the idea.
>
> ```ocamltop
> let rec hbal_tree_nodes_height h n =
>   assert(min_nodes h <= n && n <= max_nodes h);
>   if h = 0 then [Empty]
>   else
>     let acc = add_hbal_tree_node [] (h-1) (h-2) n in
>     let acc = add_swap_left_right acc in
>     add_hbal_tree_node acc (h-1) (h-1) n
> and add_hbal_tree_node l h1 h2 n =
>   let min_n1 = max (min_nodes h1) (n - 1 - max_nodes h2) in
>   let max_n1 = min (max_nodes h1) (n - 1 - min_nodes h2) in
>   fold_range min_n1 max_n1 ~init:l ~f:(fun l n1 ->
>       let t1 = hbal_tree_nodes_height h1 n1 in
>       let t2 = hbal_tree_nodes_height h2 (n - 1 - n1) in
>       List.fold_left (fun l t1 ->
>           List.fold_left (fun l t2 -> Node('x', t1, t2) :: l) l t2) l t1
>     )
>
> let hbal_tree_nodes n =
>   fold_range (min_height n) (max_height n) ~init:[] ~f:(fun l h ->
>       List.rev_append (hbal_tree_nodes_height h n) l)
> ```

Find out how many height-balanced trees exist for `n = 15`.

```ocamltop
List.length (hbal_tree_nodes 15);;
List.map hbal_tree_nodes [0; 1; 2; 3];;
```


#### 61. Count the leaves of a binary tree. (*easy*)

A leaf is a node with no successors. Write a function `count_leaves` to
count them.

SOLUTION

> ```ocamltop
> let rec count_leaves = function
>   | Empty -> 0
>   | Node(_, Empty, Empty) -> 1
>   | Node(_, l, r) -> count_leaves l + count_leaves r
> ```

```ocamltop
count_leaves Empty;;
count_leaves example_tree;;
```


#### 61A. Collect the leaves of a binary tree in a list. (*easy*)

A leaf is a node with no successors. Write a function `leaves` to
collect them in a list.

SOLUTION

> ```ocamltop
> (* Having an accumulator acc prevents using inefficient List.append.
>  * Every Leaf will be pushed directly into accumulator.
>  * Not tail-recursive, but that is no problem since we have a binary tree and
>  * and stack depth is logarithmic. *)
> let leaves t = 
>   let rec leaves_aux t acc = match t with
>     | Empty -> acc
>     | Node(x, Empty, Empty) -> x::acc
>     | Node(x, l, r) -> leaves_aux l (leaves_aux r acc)
>   in
>   leaves_aux t [];;
> ```

```ocamltop
  leaves Empty;;
  leaves example_tree;;
```


#### 62. Collect the internal nodes of a binary tree in a list. (*easy*)

An internal node of a binary tree has either one or two non-empty
successors. Write a function `internals` to collect them in a list.

SOLUTION

> ```ocamltop
> (* Having an accumulator acc prevents using inefficient List.append.
>  * Every internal node will be pushed directly into accumulator.
>  * Not tail-recursive, but that is no problem since we have a binary tree and
>  * and stack depth is logarithmic. *)
> let internals t = 
>   let rec internals_aux t acc = match t with
>     | Empty -> acc
>     | Node(x, Empty, Empty ) -> acc
>     | Node(x, l, r) -> internals_aux l (x::(internals_aux r acc))
>   in
>   internals_aux t [];;
> ```

```ocamltop
internals (Node('a', Empty, Empty));;
internals example_tree;;
```


#### 62B. Collect the nodes at a given level in a list. (*easy*)

A node of a binary tree is at level N if the path from the root to the
node has length N-1. The root node is at level 1. Write a function
`at_level t l` to collect all nodes of the tree `t` at level `l` in a
list.

SOLUTION

> ```ocamltop
> (* Having an accumulator acc prevents using inefficient List.append.
>  * Every node at level N will be pushed directly into accumulator.
>  * Not tail-recursive, but that is no problem since we have a binary tree and
>  * and stack depth is logarithmic. *)
> let at_level t level =
>   let rec at_level_aux t acc counter = match t with
>     | Empty -> acc
>     | Node(x, l, r) ->
>       if counter=level then
>         x::acc
>       else
>         at_level_aux l (at_level_aux r acc (counter+1)) (counter+1)
>   in
>   at_level_aux t [] 1;;
> ```

```ocamltop
at_level example_tree 2;;
at_level example_tree 5;;
```

Using `at_level` it is easy to construct a function `levelorder` which
creates the level-order sequence of the nodes. However, there are more
efficient ways to do that.

#### 63. Construct a complete binary tree. (*medium*)

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
successors are 2\*A and 2\*A+1, respectively, supposed the successors do
exist. This fact can be used to elegantly construct a complete binary
tree structure. Write a function `is_complete_binary_tree` with the
following specification: `is_complete_binary_tree n t` returns `true`
iff `t` is a complete binary tree with `n` nodes.

SOLUTION

> ```ocamltop
> let rec split_n lst acc n = match (n, lst) with
>   | (0, _) -> (List.rev acc, lst)
>   | (_, []) -> (List.rev acc, [])
>   | (_, h::t) -> split_n t (h::acc) (n-1)
> 
> let rec myflatten p c = 
>   match (p, c) with
>   | (p, []) -> List.map (fun x -> Node (x, Empty, Empty)) p
>   | (x::t, [y]) -> Node (x, y, Empty)::myflatten t []
>   | (ph::pt, x::y::t) -> (Node (ph, x, y))::(myflatten pt t)
>   | _ -> invalid_arg "myflatten"
> 
> let complete_binary_tree = function
>   | [] -> Empty
>   | lst ->
>      let rec aux l = function
>        | [] -> []
>        | lst -> let p, c = split_n lst [] (1 lsl l) in
>                 myflatten p (aux (l+1) c) in
>      List.hd (aux 0 lst)
> ```

```ocamltop
complete_binary_tree [1;2;3;4;5;6];;
```


#### 64. Layout a binary tree (1). (*medium*)

As a preparation for drawing the tree, a layout algorithm is required to
determine the position of each node in a rectangular grid. Several
layout methods are conceivable, one of them is shown in the illustration.

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/tree-layout1.gif" title="Binary Tree Grid"></img>

In this layout strategy, the position of a node v is obtained by the
following two rules:

* *x(v)* is equal to the position of the node v in the *inorder*
 sequence;
* *y(v)* is equal to the depth of the node *v* in the tree.

In order to store the position of the nodes, we will enrich the value
at each node with the position `(x,y)`.

The tree pictured above is
```ocamltop
let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
  Node('n', Node('k', Node('c', leaf 'a',
                           Node('h', Node('g', leaf 'e',Empty), Empty)),
                 leaf 'm'),
       Node('u', Node('p', Empty, Node('s', leaf 'q', Empty)), Empty))
```
SOLUTION

> ```ocamltop
> let layout_binary_tree_1 t =
>   let rec layout depth x_left = function
>     (* This function returns a pair: the laid out tree and the first
>      * free x location *)
>     | Empty -> (Empty, x_left)
>     | Node (v,l,r) ->
>        let (l',l_x_max) = layout (depth + 1) x_left l in
>        let (r',r_x_max) = layout (depth + 1) (l_x_max + 1) r in
>        (Node ((v, l_x_max, depth), l',r'), r_x_max)
>   in fst (layout 1 1 t)
> ```

```ocamltop
layout_binary_tree_1 example_layout_tree ;;
```

#### 65. Layout a binary tree (2). (*medium*)

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/tree-layout2.gif" title="Binary Tree Grid"></img>

An alternative layout method is depicted in this illustration. Find
out the rules and write the corresponding OCaml function.

Hint: On a given level, the horizontal distance between neighbouring
nodes is constant.

The tree shown is 
```ocamltop
let example_layout_tree =
  let leaf x = Node (x,Empty,Empty) in
  Node('n', Node('k', Node('c', leaf 'a',
                           Node('e', leaf 'd', leaf 'g')),
                 leaf 'm'),
       Node('u', Node('p', Empty, leaf 'q'), Empty))
```

SOLUTION

> ```ocamltop
> let layout_binary_tree_2 t =
>   let rec height = function
>     | Empty -> 0
>     | Node (_,l,r) -> 1 + max (height l) (height r) in
>   let tree_height = height t in
>   let rec find_missing_left depth = function
>     | Empty -> tree_height - depth
>     | Node (_,l,_) -> find_missing_left (depth + 1) l in
>   let translate_dst = 1 lsl (find_missing_left 0 t) - 1 in
>                       (* remember than 1 lsl a = 2ᵃ *)
>   let rec layout depth x_root = function
>     | Empty -> Empty
>     | Node (x,l,r) ->
>        let spacing = 1 lsl (tree_height - depth - 1) in
>        let l' = layout (depth + 1) (x_root - spacing) l
>        and r' = layout (depth + 1) (x_root + spacing) r in
>        Node((x, x_root, depth), l',r') in
>   layout 1 ((1 lsl (tree_height - 1)) - translate_dst) t
> ```

```ocamltop
layout_binary_tree_2 example_layout_tree ;;
let example2_layout_tree =
  let leaf x = Node (x,Empty,Empty) in
  Node('n', Empty,
       Node('u', Node('p', Empty, leaf 'q'), Empty));;
layout_binary_tree_2 example2_layout_tree ;;
```


#### 66. Layout a binary tree (3). (*hard*)

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/tree-layout3.gif" title="Binary Tree Grid"></img>

Yet another layout strategy is shown in the above illustration. The
method yields a very compact layout while maintaining a certain symmetry
in every node. Find out the rules and write the corresponding
predicate.

Hint: Consider the horizontal distance between a node and its successor
nodes. How tight can you pack together two subtrees to construct the
combined binary tree? This is a difficult problem. Don't give up too
early!

SOLUTION

> In order to pack the tree tightly, the layout function will return
> in addition to the layout of the tree the left and right profiles of
> the tree, that is lists of offsets relative to the position of the
> root node of the tree.
>
> ```ocamltop
> let layout_binary_tree_3 =
>   let rec translate_x d = function
>     | Empty -> Empty
>     | Node((v, x, y), l, r) ->
>        Node((v, x + d, y), translate_x d l, translate_x d r) in
>   (* Distance between a left subtree given by its right profile [lr]
>      and a right subtree given by its left profile [rl]. *)
>   let rec dist lr rl = match lr, rl with
>     | lrx :: ltl, rlx :: rtl -> max (lrx - rlx) (dist ltl rtl)
>     | [], _ | _, [] -> 0 in
>   let rec merge_profiles p1 p2 = match p1, p2 with
>     | x1 :: tl1, _ :: tl2 -> x1 :: merge_profiles tl1 tl2
>     | [], _ -> p2
>     | _, [] -> p1 in
>   let rec layout depth = function
>     | Empty -> ([], Empty, [])
>     | Node(v, l, r) ->
>        let (ll, l', lr) = layout (depth + 1) l in
>        let (rl, r', rr) = layout (depth + 1) r in
>        let d = 1 + dist lr rl / 2 in
>        let ll = List.map (fun x -> x - d) ll
>        and lr = List.map (fun x -> x - d) lr
>        and rl = List.map ((+) d) rl
>        and rr = List.map ((+) d) rr in
>        (0 :: merge_profiles ll rl,
>         Node((v, 0, depth), translate_x (-d) l', translate_x d r'),
>         0 :: merge_profiles rr lr) in
>   fun t -> let (l, t', _) = layout 1 t in
>            let x_min = List.fold_left min 0 l in
>            translate_x (1 - x_min) t'
> ```

```ocamltop
layout_binary_tree_3 example_layout_tree ;;
let example3_layout_tree =
  Node('a', Node('b', Empty, Node('e', Empty, Node('f', Empty, Empty))),
       Node('c', Empty, Node('d', Node('g', Empty, Empty), Empty)));;
layout_binary_tree_3 example3_layout_tree;;
```

Which layout do you like most?


#### 67. A string representation of binary trees. (*medium*)

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/binary-tree.gif" title="Binary Tree"></img>

Somebody represents binary trees as strings of the following type (see
example): `"a(b(d,e),c(,f(g,)))"`.

* Write an OCaml function `string_of_tree` which generates this
 string representation,
 if the tree is given as usual (as `Empty` or `Node(x,l,r)` term).
 Then write a function `tree_of_string` which does this inverse;
 i.e. given the string
 representation, construct the tree in the usual form. Finally,
 combine the two predicates in a single function `tree_string` which
 can be used in both directions.
* Write the same predicate `tree_string` using difference lists and a
 single predicate `tree_dlist` which does the conversion between a
 tree and a difference list in both directions.

For simplicity, suppose the information in the nodes is a single letter
and there are no spaces in the string.

SOLUTION

> A simple solution is:
> ```ocamltop
> let rec string_of_tree = function
>   | Empty -> ""
>   | Node(data, l, r) ->
>      let data = String.make 1 data in
>      match l, r with
>      | Empty, Empty -> data
>      | _, _ -> data ^ "(" ^ (string_of_tree l)
>                ^ "," ^ (string_of_tree r) ^ ")"
> ```
>
> One can also use a buffer to allocate a lot less memory:
>
> ```ocamltop
> let rec buffer_add_tree buf = function
>   | Empty -> ()
>   | Node(data, l, r) ->
>      Buffer.add_char buf data;
>      match l, r with
>      | Empty, Empty -> ()
>      | _, _ -> Buffer.add_char buf '(';
>                buffer_add_tree buf l;
>                Buffer.add_char buf ',';
>                buffer_add_tree buf r;
>                Buffer.add_char buf ')'
>
> let string_of_tree t =
>   let buf = Buffer.create 128 in
>   buffer_add_tree buf t;
>   Buffer.contents buf
> ```
>
> For the reverse conversion, we assume that the string is well formed
> and do not deal with error reporting.
>
> ```ocamltop
> let tree_of_string =
>   let rec make ofs s =
>     if ofs >= String.length s || s.[ofs] = ',' || s.[ofs] = ')' then
>       Empty, ofs
>     else
>       let v = s.[ofs] in
>       if ofs + 1 < String.length s && s.[ofs + 1] = '(' then
>         let l, ofs = make (ofs + 2) s in (* skip "v(" *)
>         let r, ofs = make (ofs + 1) s in (* skip "," *)
>         Node(v, l, r), ofs + 1 (* skip ")" *)
>       else Node(v, Empty, Empty), ofs + 1 in
>   fun s -> fst(make 0 s)
> ```


```ocamltop
let example_layout_tree =
  let leaf x = Node (x, Empty, Empty) in
  Node('a', Node('b', leaf 'd', leaf 'e'),
  Node('c', Empty, Node('f', leaf 'g', Empty)));;
string_of_tree example_layout_tree;;
tree_of_string "a(b(d,e),c(,f(g,)))" = example_layout_tree;;
tree_of_string "";;
```


#### 68. Preorder and inorder sequences of binary trees. (*medium*)

We consider binary trees with nodes that are identified by single
lower-case letters, as in the example of the previous problem.

1. Write functions `preorder` and `inorder`
   that construct the
   [preorder](https://en.wikipedia.org/wiki/Tree_traversal#Pre-order)
   and
   [inorder](https://en.wikipedia.org/wiki/Tree_traversal#In-order_.28symmetric.29)
 sequence of a given binary tree, respectively. The
 results should be atoms, e.g. 'abdecfg' for the preorder sequence of
 the example in the previous problem.
1. Can you use `preorder` from problem part 1 in the reverse
 direction; i.e. given a preorder sequence, construct a corresponding
 tree? If not, make the necessary arrangements.
1. If both the preorder sequence and the inorder sequence of the nodes
 of a binary tree are given, then the tree is determined
 unambiguously. Write a function `pre_in_tree` that does the job.
1. Solve problems 1 to 3 using
   [difference lists](https://en.wikipedia.org/wiki/Difference_list).
   Cool!  Use the
 function `timeit` (defined in problem “[Compare the two methods of
 calculating Euler&#39;s totient function.](#ComparethetwomethodsofcalculatingEuler39stotientfunctioneasy)”) to compare the
 solutions.

What happens if the same character appears in more than one node. Try
for instance `pre_in_tree "aba" "baa"`.

SOLUTION

> We use lists to represent the result. Note that `preorder` and `inorder` can be made more efficient by avoiding list concatenations.
>
> ```ocamltop
> let rec preorder = function
>   | Empty -> []
>   | Node (v, l, r) -> v :: (preorder l @ preorder r)
>
> let rec inorder = function
>   | Empty -> []
>   | Node (v, l, r) -> inorder l @ (v :: inorder r)
>
> let rec split_pre_in p i x accp acci = match (p, i) with
>   | [], [] -> (List.rev accp, List.rev acci), ([], [])
>   | h1::t1, h2::t2 ->
>      if x=h2 then
>        (List.tl (List.rev (h1::accp)), t1),
>        (List.rev (List.tl (h2::acci)), t2)
>      else
>        split_pre_in t1 t2 x (h1::accp) (h2::acci)
>   | _ -> assert false
>
> let rec pre_in_tree p i = match (p, i) with
>   | [], [] -> Empty
>   | (h1::t1), (h2::t2) ->
>      let (lp, rp), (li, ri) = split_pre_in p i h1 [] [] in
>      Node (h1, pre_in_tree lp li, pre_in_tree rp ri)
>   | _ -> invalid_arg "pre_in_tree"
> ```

```ocamltop
preorder (Node (1, Node (2, Empty, Empty), Empty));;
preorder (Node (1, Empty, Node (2, Empty, Empty)));;
let p = preorder example_tree;;
let i = inorder example_tree;;
pre_in_tree p i = example_tree
```

Solution using
[difference lists](https://en.wikipedia.org/wiki/Difference_list).

```ocaml
  (* solution pending *)
```


#### 69. Dotstring representation of binary trees. (*medium*)

We consider again binary trees with nodes that are identified by single
lower-case letters, as in the example of problem “[A string
representation of binary trees][tree-string]”. Such a tree can be
represented by the preorder sequence of its nodes in which dots (.) are
inserted where an empty subtree (nil) is encountered during the tree
traversal. For example, the tree shown in problem “[A string
representation of binary trees][tree-string]” is represented as
'abd..e..c.fg...'. First, try to establish a syntax (BNF or syntax
diagrams) and then write a function `tree_dotstring` which does the
conversion in both directions. Use difference lists.

[tree-string]: #Astringrepresentationofbinarytreesmedium

<!-- SOLUTION -->

```ocaml
  (* solution pending *)
```

## Multiway Trees
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/multiway-tree.gif" title="Multiway Tree"></img>

*A multiway tree is composed of a root element and a (possibly empty)
set of successors which are multiway trees themselves. A multiway tree
is never empty. The set of successor trees is sometimes called a
forest.*

To represent multiway trees, we will use the following type which is a
direct translation of the definition:

```ocamltop
type 'a mult_tree = T of 'a * 'a mult_tree list
```

The example tree depicted opposite is therefore represented by the
following OCaml expression:

```ocamltop
T('a', [T('f',[T('g',[])]); T('c',[]); T('b',[T('d',[]); T('e',[])])])
```


#### 70C. Count the nodes of a multiway tree. (*easy*)

SOLUTION

> ```ocamltop
> let rec count_nodes (T(_, sub)) =
>   List.fold_left (fun n t -> n + count_nodes t) 1 sub
> ```

```ocamltop
count_nodes (T('a', [T('f',[]) ]))
```


#### 70. Tree construction from a node string. (*medium*)
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/multiway-tree.gif" title="Multiway Tree"></img>

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

SOLUTION

> ```ocamltop
> (* We could build the final string by string concatenation but
>    this is expensive due to the number of operations.  We use a
>    buffer instead. *)
> let rec add_string_of_tree buf (T(c, sub)) =
>   Buffer.add_char buf c;
>   List.iter (add_string_of_tree buf) sub;
>   Buffer.add_char buf '^'
> let string_of_tree t =
>   let buf = Buffer.create 128 in
>   add_string_of_tree buf t;
>   Buffer.contents buf;;
> let rec tree_of_substring t s i len =
>   if i >= len || s.[i] = '^' then List.rev t, i + 1
>   else
>     let sub, j = tree_of_substring [] s (i+1) len in
>     tree_of_substring (T(s.[i], sub) ::t) s j len
> let tree_of_string s =
>   match tree_of_substring [] s 0 (String.length s) with
>   | [t], _ -> t
>   | _ -> failwith "tree_of_string"
> ```

```ocamltop
let t = T('a', [T('f',[T('g',[])]); T('c',[]);
          T('b',[T('d',[]); T('e',[])])]);;
string_of_tree t;;
tree_of_string "afg^^c^bd^e^^^";;
```


#### 71. Determine the internal path length of a tree. (*easy*)

We define the internal path length of a multiway tree as the total sum
of the path lengths from the root to all nodes of the tree. By this
definition, the tree `t` in the figure of the previous problem has an
internal path length of 9. Write a function `ipl tree` that returns the
internal path length of `tree`.

SOLUTION

> ```ocamltop
> let rec ipl_sub len (T(_, sub)) =
>   (* [len] is the distance of the current node to the root.  Add the
>      distance of all sub-nodes. *)
>   List.fold_left (fun sum t -> sum + ipl_sub (len + 1) t) len sub
> let ipl t = ipl_sub 0 t
> ```

```ocamltop
ipl t
```


#### 72. Construct the bottom-up order sequence of the tree nodes. (*easy*)

Write a function `bottom_up t` which constructs the bottom-up sequence
of the nodes of the multiway tree `t`.

SOLUTION

> ```ocamltop
> let rec prepend_bottom_up (T(c, sub)) l =
>   List.fold_right (fun t l -> prepend_bottom_up t l) sub (c :: l)
> let bottom_up t = prepend_bottom_up t []
> ```

```ocamltop
bottom_up (T('a', [T('b', [])]));;
bottom_up t;;
```


#### 73. Lisp-like tree representation. (*medium*)

There is a particular notation for multiway trees in Lisp. The
picture shows how multiway tree structures are represented in Lisp.

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/lisp-like-tree.png" title="Lisp representation of multiway
trees"></img>

Note that in the "lispy" notation a node with successors (children) in
the tree is always the first element in a list, followed by its
children. The "lispy" representation of a multiway tree is a sequence of
atoms and parentheses '(' and ')'. This is very close to the way trees
are represented in OCaml, except that no constructor `T` is used. Write
a function `lispy :       char mult_tree -> string` that returns the
lispy notation of the tree.

SOLUTION

> ```ocamltop
> let rec add_lispy buf = function
>   | T(c, []) -> Buffer.add_char buf c
>   | T(c, sub) ->
>      Buffer.add_char buf '(';
>      Buffer.add_char buf c;
>      List.iter (fun t -> Buffer.add_char buf ' '; add_lispy buf t) sub;
>      Buffer.add_char buf ')'
> let lispy t =
>   let buf = Buffer.create 128 in
>   add_lispy buf t;
>   Buffer.contents buf
> ```

```ocamltop
lispy (T('a', []));;
lispy (T('a', [T('b', [])]));;
lispy t;;
```

## Graphs
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/graph1.gif" title="A graph"></img>

*A graph is defined as a set of nodes and a set of edges, where each
edge is a pair of different nodes.*

There are several ways to represent graphs in OCaml.

* One method is to list all edges, an edge being a pair of nodes. In
 this form, the graph depicted opposite is represented as the
 following expression:

```ocamltop
['h', 'g';  'k', 'f';  'f', 'b';  'f', 'c';  'c', 'b']
```

We call this **edge-clause form**. Obviously, isolated nodes cannot
be represented.


* Another method is to represent the whole graph as one data object.
 According to the definition of the graph as a pair of two sets
 (nodes and edges), we may use the following OCaml type:

```ocamltop
type 'a graph_term = { nodes : 'a list;  edges : ('a * 'a) list }
```

Then, the above example graph is represented by:

```ocamltop
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

    ```ocaml
    (* example pending *)
    ```

* The representations we introduced so far well suited for automated
 processing, but their syntax is not very user-friendly. Typing the
 terms by hand is cumbersome and error-prone. We can define a more
 compact and "human-friendly" notation as follows: A graph (with char
 labelled nodes) is represented by a string of atoms and terms of the
 type X-Y. The atoms stand for isolated nodes, the X-Y terms describe
 edges. If an X appears as an endpoint of an edge, it is
 automatically defined as a node. Our example could be written as:

    ```ocamltop
    "b-c f-c g-h d f-b k-f h-g"
    ```

 We call this the **human-friendly form**. As the example shows, the
 list does not have to be sorted and may even contain the same edge
 multiple times. Notice the isolated node `d`.


#### 80. Conversions. (*easy*)

Write functions to convert between the different graph representations.
With these functions, all representations are equivalent; i.e. for the
following problems you can always pick freely the most convenient form.
This problem is not particularly difficult, but it's a lot of work to
deal with all the special cases.

<!-- SOLUTION -->

```ocaml
(* example pending *)
```


#### 81. Path from one node to another one. (*medium*)

Write a function `paths g a b` that returns all acyclic path `p` from
node `a` to node `b ≠ a` in the graph `g`. The function should return
the list of all paths via backtracking.

SOLUTION

> ```ocamltop
> (* The datastructures used here are far from the most efficient ones
>    but allow for a straightforward implementation. *)
> (* Returns all neighbors satisfying the condition. *)
> let neighbors g a cond =
>   let edge l (b,c) = if b = a && cond c then c :: l
>                      else if c = a && cond b then b :: l
>                      else l in
>   List.fold_left edge [] g.edges
> let rec list_path g a to_b = match to_b with
>   | [] -> assert false (* [to_b] contains the path to [b]. *)
>   | a' :: _ ->
>      if a' = a then [to_b]
>      else
>        let n = neighbors g a' (fun c -> not(List.mem c to_b)) in
>        List.concat(List.map (fun c -> list_path g a (c :: to_b)) n)
> 
> let paths g a b =
>   assert(a <> b);
>   list_path g a [b]
> ```

```ocamltop
paths example_graph 'f' 'b'
```


#### 82. Cycle from a given node. (*easy*)

Write a functions `cycle g a` that returns a closed path (cycle) `p`
starting at a given node `a` in the graph `g`. The predicate should
return the list of all cycles via backtracking.

SOLUTION

> ```ocamltop
> let cycles g a =
>   let n = neighbors g a (fun _ -> true) in
>   let p = List.concat(List.map (fun c -> list_path g a [c]) n) in
>   List.map (fun p -> p @ [a]) p
> ```

```ocamltop
cycles example_graph 'f'
```


#### 83. Construct all spanning trees. (*medium*)
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/spanning-tree-graph1.gif" title="Spanning tree graph"></img>

Write a function `s_tree g` to construct (by backtracking) all [spanning
trees](http://en.wikipedia.org/wiki/Spanning_tree) of a given graph `g`.
With this predicate, find out how many spanning trees there are for the
graph depicted to the left. The data of this example graph can be found
in the test below. When you have a correct solution for the `s_tree`
function, use it to define two other useful functions: `is_tree graph`
and `is_connected Graph`. Both are five-minutes tasks!

<!-- SOLUTION -->

```ocaml
(* solution pending *);;
```

```ocamltop
let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
          edges = [('a', 'b'); ('a', 'd'); ('b', 'c'); ('b', 'e');
                   ('c', 'e'); ('d', 'e'); ('d', 'f'); ('d', 'g');
                   ('e', 'h'); ('f', 'g'); ('g', 'h')] }
```


#### 84. Construct the minimal spanning tree. (*medium*)
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/spanning-tree-graph2.gif" title="Spanning tree graph"></img>

Write a function `ms_tree graph` to construct the minimal spanning tree
of a given labelled graph. A labelled graph will be represented as
follows:

```ocamltop
type ('a, 'b) labeled_graph = { nodes : 'a list;
                                labeled_edges : ('a * 'a * 'b) list }
```

(Beware that from now on `nodes` and `edges` mask the previous fields of
the same name.)

Hint: Use the [algorithm of Prim](http://en.wikipedia.org/wiki/Prim%27s_algorithm). 
A small modification of the solution of P83 does the trick. The data of the
example graph to the right can be found below.

<!-- SOLUTION -->

```ocaml
(* solution pending *);;
```

```ocamltop
let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
          labeled_edges = [('a', 'b', 5); ('a', 'd', 3); ('b', 'c', 2);
		                   ('b', 'e', 4); ('c', 'e', 6); ('d', 'e', 7);
				           ('d', 'f', 4); ('d', 'g', 3); ('e', 'h', 5);
				           ('f', 'g', 4); ('g', 'h', 1)] }
```


#### 85. Graph isomorphism. (*medium*)

Two graphs G1(N1,E1) and G2(N2,E2) are isomorphic if there is a
bijection f: N1 → N2 such that for any nodes X,Y of N1, X and Y are
adjacent if and only if f(X) and f(Y) are adjacent.

Write a function that determines whether two graphs are isomorphic.
Hint: Use an open-ended list to represent the function f.

<!-- SOLUTION -->

```ocaml
(* solution pending *);;
```

```ocamltop
let g = { nodes = [1; 2; 3; 4; 5; 6; 7; 8];
          edges = [(1,5); (1,6); (1,7); (2,5); (2,6); (2,8); (3,5);
                   (3,7); (3,8); (4,6); (4,7); (4,8)] };;
let h = { nodes = [1; 2; 3; 4; 5; 6; 7; 8];
          edges = [(1,2); (1,4); (1,5); (6,2); (6,5); (6,7); (8,4);
                   (8,5); (8,7); (3,2); (3,4); (3,7)] };;
iso g h
```


#### 86. Node degree and graph coloration. (*medium*)

* Write a function `degree graph node` that determines the degree of a
 given node.
* Write a function that generates a list of all nodes of a graph
 sorted according to decreasing degree.
* Use [Welsh-Powell&#39;s
 algorithm](http://en.wikipedia.org/wiki/Graph_coloring#Greedy_coloring)
 to paint the nodes of a graph in such a way that adjacent nodes have
 different colors.

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


#### 87. Depth-first order graph traversal. (*medium*)

Write a function that generates a
[depth-first order graph traversal](https://en.wikipedia.org/wiki/Depth-first_search)
sequence. The starting point should be specified, and the output should
be a list of nodes that are reachable from this starting point (in
depth-first order).

Specifically, the graph will be provided by its
[adjacency-list representation](https://en.wikipedia.org/wiki/Adjacency_list)
and you must create a module `M` with the following signature:

```ocamltop
module type GRAPH = sig
  type node = char
  type t
  val of_adjacency : (node * node list) list -> t
  val dfs_fold : t -> node -> ('a -> node -> 'a) -> 'a -> 'a
end
```

where `M.dfs_fold g n f a` applies `f` on the nodes of the graph
`g` in depth first order, starting with node `n`.

SOLUTION

> In a depth-first search you fully explore the edges of the most
> recently discovered node *v* before 'backtracking' to explore edges
> leaving the node from which *v* was discovered. To do a depth-first
> search means keeping careful track of what vertices have been visited
> and when.
> 
> We compute timestamps for each vertex discovered in the search. A
> discovered vertex has two timestamps associated with it : its
> discovery time (in map `d`) and its finishing time (in map `f`) (a
> vertex is finished when its adjacency list has been completely
> examined). These timestamps are often useful in graph algorithms and
> aid in reasoning about the behavior of depth-first search.
> 
> We color nodes during the search to help in the bookkeeping (map
> `color`). All vertices of the graph are initially `White`. When a
> vertex is discovered it is marked `Gray` and when it is finished, it
> is marked `Black`.
> 
> If vertex *v* is discovered in the adjacency list of previously
> discovered node *u*, this fact is recorded in the predecessor subgraph
> (map `pred`).
>
> ```ocamltop
> module M : GRAPH = struct
> 
>   module Char_map = Map.Make (Char)
>   type node = char
>   type t = (node list) Char_map.t
> 
>   let of_adjacency l = 
>     List.fold_right (fun (x, y) -> Char_map.add x y) l Char_map.empty
> 
>   type colors = White|Gray|Black
> 
>   type 'a state = {
>     d : int Char_map.t ; (*discovery time*)
>     f : int Char_map.t ; (*finishing time*)
>     pred : char Char_map.t ; (*predecessor*)
>     color : colors Char_map.t ; (*vertex colors*)
>     acc : 'a ; (*user specified type used by 'fold'*)
>   }
> 
>   let dfs_fold g c fn acc =
>     let rec dfs_visit t u {d; f; pred; color; acc} =
>       let edge (t, state) v =
>         if Char_map.find v state.color = White then
>           dfs_visit t v {state with pred=Char_map.add v u state.pred;}
>         else  (t, state)
>       in
>       let t, {d; f; pred; color; acc} =
>         let t = t + 1 in
>         List.fold_left edge
>           (t, {d=Char_map.add u t d; f;
>                pred; color=Char_map.add u Gray color; acc = fn acc u})
>           (Char_map.find u g)
>       in
>       let t = t + 1 in
>       t , {d; f=(Char_map.add u t f); pred;
>            color=Char_map.add u Black color; acc}
>     in
>     let v = List.fold_left (fun k (x, _) -> x :: k) []
>                            (Char_map.bindings g) in
>     let initial_state= 
>       {d=Char_map.empty;
>        f=Char_map.empty;
>        pred=Char_map.empty;
>        color=List.fold_right (fun x->Char_map.add x White)
>                              v Char_map.empty;
>        acc=acc}
>     in
>     (snd (dfs_visit 0 c initial_state)).acc
> end
> ```

```ocamltop
let g = M.of_adjacency
          ['u', ['v'; 'x'];
           'v',      ['y'];
           'w', ['z'; 'y'];
           'x',      ['v'];
           'y',      ['x'];
           'z',      ['z'];
          ];;
List.rev (M.dfs_fold g 'w' (fun acc c -> c :: acc) [])
```

#### 88. Connected components. (*medium*)

Write a predicate that splits a graph into its [connected
components](http://en.wikipedia.org/wiki/Connected_component_%28graph_theory%29).

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


#### 89. Bipartite graphs. (*medium*)

Write a predicate that finds out whether a given graph is
[bipartite](http://en.wikipedia.org/wiki/Bipartite_graph).

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


#### 90. Generate K-regular simple graphs with N nodes. (*hard*)

In a [K-regular graph](http://en.wikipedia.org/wiki/K-regular_graph) all
nodes have a degree of K; i.e. the number of edges incident in each node
is K. How many (non-isomorphic!) 3-regular graphs with 6 nodes are
there?

See also the [table of
results](https://sites.google.com/site/prologsite/prolog-problems/6/solutions-6/p6_11.txt?attredirects=0&d=1).

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```

## Miscellaneous Problems

#### 91. Eight queens problem. (*medium*)

This is a classical problem in computer science. The objective is to
place eight queens on a chessboard so that no two queens are attacking
each other; i.e., no two queens are in the same row, the same column, or
on the same diagonal.

Hint: Represent the positions of the queens as a list of numbers 1..N.
Example: `[4;2;7;3;6;8;5;1]` means that the queen in the first column is
in row 4, the queen in the second column is in row 2, etc. Use the
generate-and-test paradigm.

SOLUTION

> This is a brute force algorithm enumerating all possible solutions.
> For a deeper analysis, look for example to
> [Wikipedia](https://en.wikipedia.org/wiki/Eight_queens_puzzle).
>
> ```ocamltop
> let possible row col used_rows usedD1 usedD2 =
>   not (List.mem row used_rows
>        || List.mem (row + col) usedD1
>        || List.mem (row - col) usedD2)
>
> let queens_positions n =
>   let rec aux row col used_rows usedD1 usedD2 =
>     if col > n then [List.rev used_rows]
>     else
>       (if row < n then aux (row + 1) col used_rows usedD1 usedD2
>        else [])
>       @ (if possible row col used_rows usedD1 usedD2 then
>            aux 1 (col + 1) (row :: used_rows) (row + col :: usedD1)
>                (row - col :: usedD2)
>          else [])
>   in aux 1 1 [] [] []
> ```

```ocamltop
queens_positions 4;;
List.length (queens_positions 8);;
```

#### 92. Knight's tour. (*medium*)

Another famous problem is this one: How can a knight jump on an N×N
chessboard in such a way that it visits every square exactly once?

Hints: Represent the squares by pairs of their coordinates `(x,y)`,
where both `x` and `y` are integers between 1 and N. Define the function
`jump n       (x,y)` that returns all coordinates `(u,v)` to which a
knight can jump from `(x,y)` to on a `n`×`n` chessboard. And finally,
represent the solution of our problem as a list knight positions (the
knight's tour).

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


#### 93. Von Koch's conjecture. (*hard*)

Several years ago I met a mathematician who was intrigued by a problem
for which he didn't know a solution. His name was Von Koch, and I don't
know whether the problem has been solved since.

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/von-koch1.gif" title="Tree numbering"></img>

Anyway, the puzzle goes like this: Given a tree with N nodes (and hence
N-1 edges). Find a way to enumerate the nodes from 1 to N and,
accordingly, the edges from 1 to N-1 in such a way, that for each edge K
the difference of its node numbers equals to K. The conjecture is that
this is always possible.

For small trees the problem is easy to solve by hand. However, for
larger trees, and 14 is already very large, it is extremely difficult to
find a solution. And remember, we don't know for sure whether there is
always a solution!

<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/von-koch2.gif" title="Larger tree"></img>

Write a function that calculates a numbering scheme for a given tree.
What is the solution for the larger tree pictured here?

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


#### 94. An arithmetic puzzle. (*hard*)

Given a list of integer numbers, find a correct way of inserting
arithmetic signs (operators) such that the result is a correct equation.
Example: With the list of numbers `[2;3;5;7;11]` we can form the
equations 2-3+5+7 = 11 or 2 = (3*5+7)/11 (and ten others!).

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```

#### 95. English number words. (*medium*)

On financial documents, like cheques, numbers must sometimes be written
in full words. Example: 175 must be written as one-seven-five. Write a
function `full_words` to print (non-negative) integer numbers in full
words.

SOLUTION

> ```ocamltop
> let full_words =
>   let digit = [|"zero"; "one"; "two"; "three"; "four"; "five"; "six";
>                 "seven"; "eight"; "nine" |] in
>   let rec words w n =
>     if n = 0 then (match w with [] -> [digit.(0)] | _ -> w)
>     else words (digit.(n mod 10) :: w) (n / 10) in
>   fun n ->
>   String.concat "-" (words [] n)
> ```

```ocamltop
full_words 175;;
full_words 23485;;
full_words 0;;
```


#### 96. Syntax checker. (*medium*)
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/syntax-graph.gif" title="Syntax graph"></img>

In a certain programming language (Ada) identifiers are defined by the
syntax diagram (railroad chart) opposite. Transform the syntax diagram
into a system of syntax diagrams which do not contain loops; i.e. which
are purely recursive. Using these modified diagrams, write a function
`identifier : string -> bool` that can check whether or not a given
string is a legal identifier.

SOLUTION

> ```ocamltop
> let identifier =
>   let is_letter c = 'a' <= c && c <= 'z' in
>   let is_letter_or_digit c = is_letter c || ('0' <= c && c <= '9') in
>   let rec is_valid s i not_after_dash =
>     if i < 0 then not_after_dash
>     else if is_letter_or_digit s.[i] then is_valid s (i - 1) true
>     else if s.[i] = '-' && not_after_dash then is_valid s (i - 1) false
>     else false in
>   fun s -> (
>     let n = String.length s in
>     n > 0 && is_letter s.[n - 1] && is_valid s (n - 2) true)
> ```

```ocamltop
identifier "this-is-a-long-identifier";;
identifier "this-ends-in-";;
identifier "two--hyphens";;
identifier "-dash-first";;
```

#### 97. Sudoku. (*medium*)

Sudoku puzzles go like this:

```text
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

<!-- A better solution is desirable -->

SOLUTION

> A simple way of resolving this is to use brute force.
> The idea is to start filling with available values in each case and
> test if it works.  When there is no available values, it means we
> made a mistake so we go back to the last choice we made, and try a
> different choice.
>
> ```ocamltop
> open Printf
> 
> module Board = struct
>   type t = int array (* 9×9, row-major representation.  A value of 0
>                         means undecided. *)
> 
>   let is_valid c = c >= 1
> 
>   let get (b: t) (x, y) = b.(x + y * 9)
> 
>   let get_as_string (b: t) pos =
>     let i = get b pos in
>     if is_valid i then string_of_int i else "."
> 
>   let with_val (b: t) (x, y) v =
>     let b = Array.copy b in
>     b.(x + y * 9) <- v;
>     b
> 
>   let of_list l : t =
>     let b = Array.make 81 0 in
>     List.iteri (fun y r -> List.iteri (fun x e ->
>       b.(x + y * 9) <- if e >= 0 && e <= 9 then e else 0) r) l;
>     b
> 
>   let print b =
>     for y = 0 to 8 do
>       for x = 0 to 8 do
>         printf (if x = 0 then "%s" else if x mod 3 = 0 then " | %s"
>                 else "  %s")  (get_as_string b (x, y))
>       done;
>       if y < 8 then
>         if y mod 3 = 2 then printf "\n--------+---------+--------\n"
>         else printf "\n        |         |        \n"
>       else printf "\n"
>     done
> 
>   let available b (x, y) =
>     let avail = Array.make 10 true in
>     for i = 0 to 8 do
>       avail.(get b (x, i)) <- false;
>       avail.(get b (i, y)) <- false;
>     done;
>     let sq_x = x - x mod 3 and sq_y = y - y mod 3 in
>     for x = sq_x to sq_x + 2 do
>       for y = sq_y to sq_y + 2 do
>         avail.(get b (x, y)) <- false;
>       done;
>     done;
>     let av = ref [] in
>     for i = 1 (* not 0 *) to 9 do if avail.(i) then av := i :: !av done;
>     !av
> 
>   let next (x,y) = if x < 8 then (x+1, y) else (0, y+1)
> 
>   (** Try to fill the undecided entries. *)
>   let rec fill b ((x,y) as pos) =
>     if y > 8 then Some b (* filled all entries *)
>     else if is_valid(get b pos) then fill b (next pos)
>     else match available b pos with
>          | [] -> None (* no solution *)
>          | l -> try_values b pos l
>   and try_values b pos = function
>     | v :: l ->
>        (match fill (with_val b pos v) (next pos) with
>         | Some _ as res -> res
>         | None -> try_values b pos l)
>     | [] -> None
> end
> 
> let sudoku b = match Board.fill b (0,0) with
>   | Some b -> b
>   | None -> failwith "sudoku: no solution"
> ```

```ocamltop
(* The board representation is not imposed.  Here "0" stands for "." *)
let initial_board =
  Board.of_list [[0; 0; 4;  8; 0; 0;  0; 1; 7];
                 [6; 7; 0;  9; 0; 0;  0; 0; 0];
                 [5; 0; 8;  0; 3; 0;  0; 0; 4];
                 [3; 0; 0;  7; 4; 0;  1; 0; 0];
                 [0; 6; 9;  0; 0; 0;  7; 8; 0];
                 [0; 0; 1;  0; 6; 9;  0; 0; 5];
                 [1; 0; 0;  0; 8; 0;  3; 0; 6];
                 [0; 0; 0;  0; 0; 6;  0; 9; 1];
                 [2; 4; 0;  0; 0; 1;  5; 0; 0]];;

Board.print (sudoku initial_board);;
```


#### 98. Nonograms. (*hard*)

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

```text
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

SOLUTION

> Brute force solution: construct boards trying all the fill
> possibilities for the columns given the prescribed patterns for them
> and reject the solution if it does not satisfy the row patterns.
>
> ```ocamltop
> type element = Empty | X (* ensure we do not miss cases in patterns *)
>
> (* Whether [row.(c)] for [col0 ≤ c < col1] are all set to [X]. *)
> let rec is_set_range row col0 col1 =
>   col0 >= col1 || (row.(col0) = X && is_set_range row (col0 + 1) col1)
>
> (* Whether all [row.(ncol)] .. [row.(ncol + width - 1)] equal [X]. *)
> let is_set_sub row col0 width =
>   col0 + width <= Array.length row
>   && is_set_range row col0 (col0 + width)
>
> (* Check that [row.(col0 ..)] conforms the pattern [patt_row]. *)
> let rec check_row row col0 patt_row =
>   if col0 >= Array.length row then
>     patt_row = [] (* row exhausted, no pattern must remain *)
>   else
>     match row.(col0) with
>     | Empty -> check_row row (col0 + 1) patt_row
>     | X ->
>        match patt_row with
>        | [] -> false
>        | nX :: tl ->
>           if is_set_sub row col0 nX then
>             let col0 = col0 + nX in
>             (col0 >= Array.length row || row.(col0) = Empty)
>             && check_row row (col0 + 1) tl
>           else false
>
> (* Check that each row of the table conforms [patts_row].  It is
>    assumed that the length of [patts_row] is equal to the number of
>    lines of [table]. *)
> let rec check_rows table row0 patts_row =
>   row0 >= Array.length table
>   || (match patts_row with
>      | patt_row :: tl -> check_row table.(row0) 0 patt_row
>                         && check_rows table (row0 + 1) tl
>      | [] -> assert false)
>
> let char_of_element = function
>   | Empty -> '_'
>   | X -> 'X'
>
> let print_tbl table =
>   let print_row r =
>     Array.iter (fun e -> print_char '|';
>                        print_char(char_of_element e)) r;
>     print_string "|\n" in
>   Array.iter print_row table
>
> let solve patts_row patts_col =
>   let height = List.length patts_row
>   and width  = List.length patts_col in
>   let table = Array.make_matrix height width Empty in
>   (* Generate all possibilities for columns and filter according
>      to row patterns.  [patts_col] are the patterns left for the
>      current column. *)
>   let rec gen col row patts_col =
>     if col >= width then (
>       if check_rows table 0 patts_row then
>         print_tbl table
>     )
>     else
>       match patts_col with
>       | [] :: rest_patt ->
>          (* No pattern left for this column, go to the next one. *)
>          gen (col + 1) 0 rest_patt
>       | (nX :: tl) :: rest_patt ->
>          assert(nX > 0);
>          if row + nX <= height then (
>            for r = row to row + nX - 1 do
>              table.(r).(col) <- X
>            done;
>            gen col (row + nX + 1) (tl :: rest_patt);
>            for r = row to row + nX - 1 do
>              table.(r).(col) <- Empty
>            done;
>            (* Try the same pattern from next row: *)
>            gen col (row + 1) patts_col;
>          )
>       | [] -> assert false
>   in gen 0 0 patts_col
> ```
> You may want to look at
> [more efficient algorithms](http://link.springer.com/article/10.1007%2Fs10489-009-0200-0)
> and implement them so you can solve the following within resonable time:
>
> ```ocaml
> solve [[14]; [1;1]; [7;1]; [3;3]; [2;3;2];
>        [2;3;2]; [1;3;6;1;1]; [1;8;2;1]; [1;4;6;1]; [1;3;2;5;1;1];
>        [1;5;1]; [2;2]; [2;1;1;1;2]; [6;5;3]; [12] ]
>       [[7]; [2;2]; [2;2]; [2;1;1;1;1]; [1;2;4;2];
>        [1;1;4;2]; [1;1;2;3]; [1;1;3;2]; [1;1;1;2;2;1]; [1;1;5;1;2];
>        [1;1;7;2]; [1;6;3]; [1;1;3;2]; [1;4;3]; [1;3;1];
>        [1;2;2]; [2;1;1;1;1]; [2;2]; [2;2]; [7] ]
> ```

```ocamltop
solve [[3];[2;1];[3;2];[2;2];[6];[1;5];[6];[1];[2]]
      [[1;2];[3;1];[1;5];[7;1];[5];[3];[4];[3]];;
```


#### 99. Crossword puzzle. (*hard*)
<img style="float: right; margin-left: 15px; margin-bottom: 15px;" src="/img/crossword.gif" title="Crossword"></img>

Given an empty (or almost empty) framework of a crossword puzzle and a
set of words. The problem is to place the words into the framework.

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

<!-- SOLUTION -->

```ocaml
(* example pending *);;
```


