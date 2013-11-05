<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>99 Problems (solved) in OCaml</title>
  </head>
  <body>

    <div class="disclaimer">
      <strong>Your Help is Needed</strong><br/>
      <small>Many of the solutions below have been written
	by <a href="https://github.com/VictorNicollet/99-Problems-OCaml"
	      >Victor Nicollet</a>.  Please contribute more solutions or
	improve the existing ones.</small>
    </div>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc"></div>
    </div>

    <h1>99 Problems (solved) in OCaml</h1>

    <p>This section is inspired
      by <a href="http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html"
	    >Ninety-Nine Lisp Problems</a> which in turn was based on
      “<a href="https://sites.google.com/site/prologsite/prolog-problems/"
	  > Prolog
	problem list</a>”.  For each of these questions, some simple tests are
      shown—they may also serve to make the question clearer if needed.
      To work on these problems, we recommend you
      first <a href="../install.html" >install OCaml</a> or use it
      <a href="http://try.ocamlpro.com/" target="_blank" >inside your
      browser</a>. The source of the following problems is available
      on <a href="https://github.com/VictorNicollet/99-Problems-OCaml">GitHub</a>.
    </p>


<script type="text/javascript">
function toggleContent(id) {
  // Get the DOM reference
  var q = document.getElementById(id);
  // Toggle
  solution = new RegExp("(^|\\s)solution(\\s|$)");
  var els = q.getElementsByTagName("*");
  for (var i = 0; i < els.length; i++) {
    if (els[i].tagName.toLowerCase() != "button"
        && solution.test(els[i].getAttribute("class"))) {
      els[i].style.display == "block" ? els[i].style.display = "none"
                                      : els[i].style.display = "block";
    }
  }
}
</script>

<h2><a name="list"></a>Working with lists</h2>

<div class="question easy" id="q1" >
  <div class="title" >Write a function <code>last : 'a list -> 'a
      option</code> that returns the last element of a list.</div>
  <button onclick="toggleContent('q1')" class="solution">Solution</button>

<pre ml:content="ocaml" class="solution">
  let rec last = function
    | [] -> None
    | [x] -> Some x
    | _ :: t -> last t
</pre>
<pre ml:content="ocaml">
  last [ "a" ; "b" ; "c" ; "d" ];;
  last [];;
</pre>
</div>

<div class="question easy"  id="q2">
  <div class="title">Find the last but one (last and penultimate)
    elements of a list.</div>
  <button onclick="toggleContent('q2')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec last_two = function
    | [] | [_] -> None
    | [x;y] -> Some (x,y)
    | _::t -> last_two t
</pre>
<pre ml:content="ocaml">
  last_two [ "a" ; "b" ; "c" ; "d" ];;
  last_two [ "a" ];;
</pre>
</div>

<div class="question easy" id="q3">
  <div class="title">Find the <code>k</code>'th element of a list.</div>
  <button onclick="toggleContent('q3')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec at k = function
    | [] -> None
    | h :: t -> if k = 1 then Some h else at (k-1) t
</pre>
<pre ml:content="ocaml">
  at 3 [ "a" ; "b"; "c"; "d"; "e" ];;
  at 3 [ "a" ];;
</pre>
</div>

<div class="question easy" id="q4">
  <div class="title">Find the number of elements of a list.</div>
  <p>OCaml standard library has <code>List.length</code> but we ask
    that you reimplement it.  Bonus for a
    <a href="http://en.wikipedia.org/wiki/Tail_call" >tail
    recursive</a> solution.</p>
  <button onclick="toggleContent('q4')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* This function is tail-recursive: it uses a constant amount of
     stack memory regardless of list size. *)
  let length list =
    let rec aux n = function
      | [] -> n
      | _::t -> aux (n+1) t
    in aux 0 list
</pre>
<pre ml:content="ocaml">
  length [ "a" ; "b" ; "c"];;
  length [];;
</pre>
</div>

<div class="question easy" id="q5">
  <div class="title">Reverse a list.</div>
  <p>OCaml standard library has <code>List.rev</code> but we ask
    that you reimplement it.</p>
  <button onclick="toggleContent('q5')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rev list =
    let rec aux acc = function
      | [] -> acc
      | h::t -> aux (h::acc) t in
    aux [] list
</pre>
<pre ml:content="ocaml">
  rev ["a" ; "b" ; "c"]
</pre>
</div>

<div class="question easy" id="q6">
  <div class="title">Find out whether a list is a palindrome.</div>
  <p> HINT: a palindrome is its own reverse.</p>
  <button onclick="toggleContent('q6')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let is_palindrome list =
    list = List.rev list
  (* One can use either the rev function from the previous problem, or the
     built-in List.rev *)
</pre>
<pre ml:content="ocaml">
  is_palindrome [ "x" ; "a" ; "m" ; "a" ; "x" ];;
  not (is_palindrome [ "a" ; "b" ]);;
</pre>
</div>

<div class="question medium" id="q7">
  <div class="title">Flatten a nested list structure.</div>
<pre ml:content="ocaml silent">
  (* There is no nested list type in OCaml, so we need to define one
     first. A node of a nested list is either an element, or a list of
     nodes. *)
  type 'a node =
    | One of 'a
    | Many of 'a node list
</pre>
<button onclick="toggleContent('q7')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* This function traverses the list, prepending any encountered elements
    to an accumulator, which flattens the list in inverse order. It can
    then be reversed to obtain the actual flattened list. *)

  let flatten list =
    let rec aux acc = function
      | [] -> acc
      | One x :: t -> aux (x :: acc) t
      | Many l :: t -> aux (aux acc l) t in
    List.rev (aux [] list)
</pre>
<pre ml:content="ocaml">
  flatten [ One "a" ; Many [ One "b" ; Many [ One "c" ; One "d" ] ; One "e" ] ]
</pre>
</div>

<div class="question medium" id="q8">
  <div class="title">Eliminate consecutive duplicates of list
    elements.</div>
  <button onclick="toggleContent('q8')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec compress = function
    | a :: (b :: _ as t) -> if a = b then compress t else a :: compress t
    | smaller -> smaller
</pre>
<pre ml:content="ocaml">
  compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
</pre>
</div>

<div class="question medium" id="q9" ><a name="pack"></a>
  <div class="title">Pack consecutive duplicates
    of list elements into sublists.</div>
  <button onclick="toggleContent('q9')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let pack list =
    let rec aux current acc = function
      | [] -> []    (* Can only be reached if original list is empty *)
      | [x] -> (x :: current) :: acc
      | a :: (b :: _ as t) ->
         if a = b then aux (a :: current) acc t
         else aux [] ((a :: current) :: acc) t  in
    List.rev (aux [] [] list)
</pre>
<pre ml:content="ocaml">
  pack ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"d";"e";"e";"e";"e"]
</pre>
</div>


<div class="question easy" id="q10" >
  <div class="title"><a href="http://en.wikipedia.org/wiki/Run-length_encoding"
			target="_blank" >Run-length encoding</a>
    of a list.</div>
  <button onclick="toggleContent('q10')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let encode list =
    let rec aux count acc = function
      | [] -> [] (* Can only be reached if original list is empty *)
      | [x] -> (count+1, x) :: acc
      | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
                              else aux 0 ((count+1,a) :: acc) t   in
    List.rev (aux 0 [] list)
</pre>
<pre ml:content="ocaml">
  encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
</pre>
</div>

<div class="question easy" id="q11" ><a name="modif-run-length"></a>
  <div class="title">Modified run-length encoding.</div>
  <p>Modify the result of the previous problem in such a way that if
    an element has no duplicates it is simply copied into the result
    list.  Only elements with duplicates are transferred as (N E)
    lists.</p>
  <p>Since OCaml lists are homogeneous, one needs to define a type
    to hold both single elements and sub-lists.</p>
<pre ml:content="ocaml">
  type 'a rle =
    | One of 'a
    | Many of (int * 'a)
</pre>
<button onclick="toggleContent('q11')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
</pre>
</div>

<div class="question medium" id="q12" >
  <div class="title">Decode a run-length encoded list.</div>
  <p>Given a run-length code list generated as specified in the
    previous problem, construct its uncompressed version.</p>
  <button onclick="toggleContent('q12')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let decode list =
    let rec many acc n x =
      if n = 0 then acc else many (x :: acc) (n-1) x in
    let rec aux acc = function
      | [] -> acc
      | One x :: t -> aux (x :: acc) t
      | Many (n,x) :: t -> aux (many acc n x) t  in
    aux [] (List.rev list)
</pre>
<pre ml:content="ocaml">
  decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")]
</pre>
</div>

<div class="question medium" id="q13"><a name="run-length-direct"></a>
  <div class="title">Run-length encoding of a list (direct solution).</div>
  <p>Implement the so-called run-length encoding data compression
    method directly.  I.e.&nbsp;don't explicitly create the sublists
    containing the duplicates, as in problem “<a href="#pack">Pack
    consecutive duplicates of list elements into sublists</a>”, but
    only count them. As in problem
    “<a href="#modif-run-length" >Modified run-length encoding</a>”,
    simplify the result list by replacing the singleton lists (1 X)
    by X.
  </p>
  <button onclick="toggleContent('q13')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let encode list =
    let rle count x = if count = 0 then One x else Many (count + 1, x) in
    let rec aux count acc = function
      | [] -> [] (* Can only be reached if original list is empty *)
      | [x] -> rle count x :: acc
      | a :: (b :: _ as t) -> if a = b then aux (count + 1) acc t
                              else aux 0 (rle count a :: acc) t   in
    List.rev (aux 0 [] list)
</pre>
<pre ml:content="ocaml">
  encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]
</pre>
</div>

<div class="question easy" id="q14" >
  <div class="title">Duplicate the elements of a list.</div>
  <button onclick="toggleContent('q14')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec duplicate = function
    | [] -> []
    | h :: t -> h :: h :: duplicate t
</pre>
<pre ml:content="ocaml">
  duplicate ["a";"b";"c";"c";"d"]
</pre>
</div>

<div class="question medium" id="q15" >
  <div class="title">Replicate the elements of a list a given number
    of times.</div>
  <button onclick="toggleContent('q15')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let replicate list n =
    let rec prepend n acc x =
      if n = 0 then acc else prepend (n-1) (x :: acc) x in
    let rec aux acc = function
      | [] -> acc
      | h :: t -> aux (prepend n acc h) t  in
    (* This could also be written as:
       List.fold_left (prepend n) [] (List.rev list) *)
    aux [] (List.rev list)
</pre>
<pre ml:content="ocaml">
  replicate ["a";"b";"c"] 3
</pre>
</div>

<div class="question medium" id="q16" >
  <div class="title">Drop every N'th element from a list.</div>
  <button onclick="toggleContent('q16')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let drop list n =
    let rec aux i = function
      | [] -> []
      | h :: t -> if i = n then aux 1 t else h :: aux (i+1) t  in
    aux 1 list
</pre>
<pre ml:content="ocaml">
  drop ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3
</pre>
</div>

<div class="question easy" id="q17" >
  <div class="title">Split a list into two parts; the length of the
    first part is given.</div>
  <p>If the length of the first part is longer than the entire list,
    then the first part is the list and the second part is
    empty.</p>
  <button onclick="toggleContent('q17')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let split list n =
    let rec aux i acc = function
      | [] -> List.rev acc, []
      | h :: t as l -> if i = 0 then List.rev acc, l
                       else aux (i-1) (h :: acc) t  in
    aux n [] list
</pre>
<pre ml:content="ocaml">
  split ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3;;
  split ["a";"b";"c";"d"] 5
</pre>
</div>

<div class="question medium" id="q18" >
  <div class="title">Extract a slice from a list.</div>
  <p>Given two indices, <code>i</code> and <code>k</code>, the slice
    is the list containing the elements between the <code>i</code>'th
    and <code>k</code>'th element of the original list (both limits
    included).  Start counting the elements with 0 (this is the
    way the <code>List</code> module numbers elements).</p>
  <button onclick="toggleContent('q18')" class="solution">Solution</button>
  <div class="solution">
<pre ml:content="ocaml">
  let slice list i k =
    let rec take n = function
      | [] -> []
      | h :: t -> if n = 0 then [] else h :: take (n-1) t
    in
    let rec drop n = function
      | [] -> []
      | h :: t as l -> if n = 0 then l else drop (n-1) t
    in
    take (k - i + 1) (drop i list)
</pre>
  </div>
<pre ml:content="ocaml">
  slice ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 2 6
</pre>
</div>

<div class="question medium" id="q19" >
  <div class="title">Rotate a list N places to the left.</div>
  <button onclick="toggleContent('q19')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
    else let a, b = split list n in b @ a
</pre>
<pre ml:content="ocaml">
  rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
  rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-2)
</pre>
</div>

<div class="question easy" id="q20" >
  <div class="title">Remove the K'th element from a list.</div>
  <p>The first element of the list is numbered 0, the second 1,...</p>
  <button onclick="toggleContent('q20')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec remove_at n = function
    | [] -> []
    | h :: t -> if n = 0 then t else h :: remove_at (n-1) t
</pre>
<pre ml:content="ocaml">
  remove_at 1 ["a";"b";"c";"d"]
</pre>
</div>

<div class="question easy" id="q21" >
  <div class="title">Insert an element at a given position into a
    list.</div>
  <p>Start counting list elements with 0.</p>
  <button onclick="toggleContent('q21')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec insert_at x n = function
    | [] -> []
    | h :: t as l -> if n = 0 then x :: l else h :: insert_at x (n-1) t
</pre>
<pre ml:content="ocaml">
  insert_at "alfa" 1 ["a";"b";"c";"d"]
</pre>
</div>

<div class="question easy" id="q22" >
  <div class="title">Create a list containing all integers within a
    given range.</div>
  <p>If first argument is smaller than second, produce a list in
    decreasing order.</p>
  <button onclick="toggleContent('q22')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let range a b =
    let rec aux a b =
      if a > b then [] else a :: aux (a+1) b  in
    if a > b then List.rev (aux b a) else aux a b
</pre>
<pre ml:content="ocaml">
  range 4 9;;
  range 9 4
</pre>
</div>

<div class="question medium" id="q23" >
  <div class="title">Extract a given number of randomly selected
    elements from a list.</div>
  <p>The selected items shall be returned in a list.  We use the
    <code>Random</code> module but do not initialize it
    with <code>Random.self_init</code> for reproducibility.</p>
  <button onclick="toggleContent('q23')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
    aux (min n len) [] list len
</pre>
<pre ml:content="ocaml">
  rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3
</pre>
</div>

<div class="question easy" id="q24" >
  <div class="title">Lotto: Draw N different random numbers from the
    set 1..M.</div>
  <p>The selected numbers shall be returned in a list.</p>
  <button onclick="toggleContent('q24')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* [range] and [rand_select] defined in problems above *)
  let lotto_select n m = rand_select (range 1 m) n
</pre>
<pre ml:content="ocaml">
  lotto_select 6 49
</pre>
</div>

<div class="question easy" id="q25" >
  <div class="title">Generate a random permutation of the elements
    of a list.</div>
  <button onclick="toggleContent('q25')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
    aux [] list (List.length list)
</pre>
<pre ml:content="ocaml">
  permutation ["a"; "b"; "c"; "d"; "e"; "f"]
</pre>
</div>

<div class="question medium" id="q26" >
  <div class="title">Generate the combinations of K distinct objects
    chosen from the N elements of a list</div>
  <p>In how many ways can a committee of 3 be chosen from a group of
    12 people? We all know that there are C(12,3) = 220 possibilities
    (C(N,K) denotes the well-known binomial coefficients). For pure
    mathematicians, this result may be great. But we want to really
    generate all the possibilities in a list.
  </p>
  <button onclick="toggleContent('q26')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let extract k list =
    let rec aux k acc emit = function
      | [] -> acc
      | h :: t ->
        if k = 1 then aux k (emit [h] acc) emit t else
          let new_emit x = emit (h :: x) in
          aux k (aux (k-1) acc new_emit t) emit t
    in
    let emit x acc = x :: acc in
    aux k [] emit list
</pre>
<pre ml:content="ocaml">
  extract 2 ["a";"b";"c";"d"]
</pre>
</div>

<div class="question medium" id="q27" >
  <div class="title">Group the elements of a set into disjoint
    subsets.</div>
  <p>a) In how many ways can a group of 9 people work in 3 disjoint
    subgroups of 2, 3 and 4 persons? Write a function that generates
    all the possibilities and returns them in a list.</p>
  <p>b) Generalize the above function in a way that we can specify
    a list of group sizes and the function will return a list of
    groups.</p>
  <button onclick="toggleContent('q27')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  group ["a";"b";"c";"d"] [2;1]
</pre>
</div>

<div class="question medium" id="q28"><a name="sort-list-sub"></a>
  <div class="title">Sorting a list of lists
    according to length of sublists</div>
  <p>a) We suppose that a list contains elements that are lists
    themselves. The objective is to sort the elements of this list
    according to their length. E.g. short lists first, longer lists
    later, or vice versa.</p>
  <p>b) Again, we suppose that a list contains elements that are
    lists themselves. But this time the objective is to sort the
    elements of this list according to their <strong>length
    frequency</strong>; i.e., in the default, where sorting is done
    ascendingly, lists with rare lengths are placed first, others with
    a more frequent length come later.</p>
  <button onclick="toggleContent('q28')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  length_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ];;
  frequency_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                   ["i";"j";"k";"l"]; ["m";"n"]; ["o"] ]
</pre>
</div>

<!------------------------------------------------------------------------>
<h2><a name="arithmetic" ></a>Arithmetic</h2>

<div class="question medium" id="q31">
  <div class="title">Determine whether a given integer number is prime.</div>
  <button onclick="toggleContent('q31')" class="solution">Solution</button>

  <div class="solution">
    <p>Recall that <code>d</code> divides <code>n</code> iff <code>n mod d =
	0</code>.  This is a naive solution.  See
      the <a href="http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes"
	     >Sieve of Eratosthenes</a> for a more clever one.</p>
<pre ml:content="ocaml" >
  let is_prime n =
    let n = abs n in
    let rec is_not_divisor d =
      d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
    n <> 1 && is_not_divisor 2
</pre>
  </div> <!-- solution -->
<pre ml:content="ocaml">
  not(is_prime 1);;
  is_prime 7;;
  not (is_prime 12)
</pre>
</div>

<div class="question medium" id="q32">
  <div class="title">Determine the greatest common divisor of two
    positive integer numbers.</div>
  <p>Use Euclid's algorithm.</p>
  <button onclick="toggleContent('q32')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec gcd a b =
    if b = 0 then a else gcd b (a mod b)
</pre>
<pre ml:content="ocaml">
  gcd 13 27 ;;
  gcd 20536 7826
</pre>
</div>

<div class="question easy" id="q33" >
  <div class="title">Determine whether two positive integer numbers
    are coprime.</div>
  <p>Two numbers are coprime if their greatest common divisor equals
    1.</p>
  <button onclick="toggleContent('q33')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* [gcd] is defined in the previous question *)
  let coprime a b = gcd a b = 1
</pre>
<pre ml:content="ocaml">
  coprime 13 27;;
  not (coprime 20536 7826)
</pre>
</div>

<div class="question medium" id="q34"><a name="totient"></a>
  <div class="title">Calculate Euler's totient function
    phi(m).</div>
  <p>Euler's so-called totient function φ(m) is defined as the number
    of positive integers r (1 &le; r &lt; m) that are coprime to
    m.  We let φ(1) = 1.</p>
  <p>Find out what the value of phi(m) is if m is a prime
    number. Euler's totient function plays an important role in one of
    the most widely used public key cryptography methods (RSA). In this
    exercise you should use the most primitive method to calculate this
    function (there are smarter ways that we shall discuss later).
  </p>
  <button onclick="toggleContent('q34')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* [coprime] is defined in the previous question *)
  let phi n =
    let rec count_coprime acc d =
      if d < n then
        count_coprime (if coprime n d then acc + 1 else acc) (d + 1)
      else acc
    in
    if n = 1 then 1 else count_coprime 0 1
</pre>
<pre ml:content="ocaml">
  phi 10;;
  phi 13
</pre>
</div>

<div class="question medium" id="q35" >
  <div class="title"> Determine the prime factors of a given positive
    integer.</div>
  <p>Construct a flat list containing the prime factors in ascending
    order.</p>
  <button onclick="toggleContent('q35')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* Recall that d divides n iff [n mod d = 0] *)
  let factors n =
    let rec aux d n =
      if n = 1 then [] else
        if n mod d = 0 then d :: aux d (n / d) else aux (d+1) n
    in
    aux 2 n
</pre>
<pre ml:content="ocaml">
  factors 315
</pre>
</div>

<div class="question medium" id="q36" >
  <div class="title">Determine the prime factors of a given positive
    integer (2).</div>
  <p>Construct a list containing the prime factors and their
    multiplicity.  <em>Hint:</em> The problem is similar to problem
    <a href="#run-length-direct" >Run-length encoding of a list
    (direct solution)</a>.</p>
  <button onclick="toggleContent('q36')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  factors 315
</pre>
</div>


<div class="question medium" id="q37"><a name="totient-improved"></a>
  <div class="title">Calculate Euler's totient function phi(m)
    (improved).</div>
  <p>See problem “<a href="#totient">Calculate Euler's totient
  function phi(m)</a>” for the definition of Euler's totient function.
  If the list of the prime factors of a number m is known in the form
  of the previous problem then the function phi(m) can be efficiently
  calculated as follows: Let <code>[(p1, m1); (p2, m2);
  (p3, m3); ...]</code> be the list of prime factors (and their
  multiplicities) of a given number m. Then φ(m) can be calculated
  with the following formula:
  </p>
  <center>
    φ(m) = (p1 - 1) × p1<sup>m1 - 1</sup>
    × (p2 - 1) × p2<sup>m2 - 1</sup>
    × (p3 - 1) × p3<sup>m3 - 1</sup> × ...
  </center>
  <button onclick="toggleContent('q37')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* Naive power function. *)
  let rec pow n p = if p < 1 then 1 else n * pow n (p-1) ;;
  (* [factors] is defined in the previous question. *)
  let phi_improved n =
    let rec aux acc = function
      | [] -> acc
      | (p,m) :: t -> aux ((p - 1) * pow p (m - 1) * acc) t in
    aux 1 (factors n)
</pre>
<pre ml:content="ocaml">
  phi_improved 10;;
  phi_improved 13
</pre>
</div>

<div class="question easy" id="q38"><a name="timeit"></a>
  <div class="title">Compare the two methods of
    calculating Euler's totient function.</div>
  <p>Use the solutions of problems “<a href="#totient">Calculate
      Euler's totient function phi(m)</a>” and
    “<a href="#totient-improved">Calculate Euler's totient function
      phi(m) (improved)</a>” to compare the algorithms. Take the number of
    logical inferences as a measure for efficiency. Try to calculate
    φ(10090) as an example.</p>
  <button onclick="toggleContent('q38')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* Naive [timeit] function.  It requires the [Unix] module to be loaded. *)
  let timeit f a =
    let t0 = Unix.gettimeofday() in
    ignore(f a);
    let t1 = Unix.gettimeofday() in
    t1 -. t0
</pre>
<pre ml:content="ocaml">
  timeit phi 10090;;
  timeit phi_improved 10090
</pre>
</div>

<div class="question easy" id="q39" >
  <div class="title">A list of prime numbers.</div>
  <p>Given a range of integers by its lower and upper limit, construct
    a list of all prime numbers in that range.</p>
  <button onclick="toggleContent('q39')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let is_prime n =
    let n = max n (-n) in
    let rec is_not_divisor d =
      d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
    is_not_divisor 2

  let rec all_primes a b =
    if a > b then [] else
      let rest = all_primes (a + 1) b in
      if is_prime a then a :: rest else rest
</pre>
<pre ml:content="ocaml">
  List.length (all_primes 2 7920)
</pre>
</div>

<div class="question medium" id="q40" >
  <div class="title">Goldbach's conjecture.</div>
  <p>Goldbach's conjecture says that every positive even number
    greater than 2 is the sum of two prime numbers. Example: 28 =
    5 + 23. It is one of the most famous facts in number theory that has
    not been proved to be correct in the general case. It has been
    <em>numerically confirmed</em> up to very large numbers.  Write a
    function to find the two prime numbers that sum up to a given
    even integer.
  </p>
  <button onclick="toggleContent('q40')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* [is_prime] is defined in the previous solution *)
  let goldbach n =
    let rec aux d =
      if is_prime d && is_prime (n - d) then (d, n-d)
      else aux (d+1) in
    aux 2
</pre>
<pre ml:content="ocaml">
  goldbach 28
</pre>
</div>


<div class="question medium" id="q41" >
  <div class="title">A list of Goldbach compositions.</div>
  <p>Given a range of integers by its lower and upper limit, print a
    list of all even numbers and their Goldbach composition.</p>
  <p>In most cases, if an even number is written as the sum of two
    prime numbers, one of them is very small. Very rarely, the primes
    are both bigger than say 50. Try to find out how many such cases
    there are in the range 2..3000.
  </p>
  <button onclick="toggleContent('q41')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  (* [goldbach] is defined in the previous question. *)
  let rec goldbach_list a b =
    if a > b then [] else
      if a mod 2 = 1 then goldbach_list (a+1) b
      else (a, goldbach a) :: goldbach_list (a+2) b

  let goldbach_limit a b lim =
    List.filter (fun (_,(a,b)) -> a > lim && b > lim) (goldbach_list a b)
</pre>
<pre ml:content="ocaml">
  goldbach_list 9 20;;
  goldbach_limit 1 2000 50
</pre>
</div>

<!------------------------------------------------------------------------>
<h2><a name="logic" ></a>Logic and Codes</h2>

Let us define a small “language” for boolean expressions containing
variables:
<pre ml:content="ocaml">
  type bool_expr =
    | Var of string
    | Not of bool_expr
    | And of bool_expr * bool_expr
    | Or of bool_expr * bool_expr
</pre>
A logical expression in two variables can then be written in prefix
notation, as in the following example:
<pre ml:content="ocaml">
  And(Or(Var "a", Var "b"), And(Var "a", Var "b"))
</pre>

<div class="question medium" id="q46" >
  <div class="title">Truth tables for logical expressions (2
    variables).</div>
  <p>Define a function, <code>table2</code> which returns the truth
    table of a given logical expression in two variables (specified as
    arguments).  The return value must be a
    list of triples containing <code>(value_of_a, balue_of_b,
    value_of_expr)</code>.</p>
  <button onclick="toggleContent('q46')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  table2 "a" "b" (And(Var "a", Or(Var "a", Var "b")))
</pre>
</div>

<div class="question medium" id="q48" >
  <div class="title">Truth tables for logical expressions.</div>
  <p>Generalize the previous problem in such a way that the logical
    expression may contain any number of logical variables.  Define
      <code>table</code> in a way that <code>table variables
	expr</code> returns the truth table for the
      expression <code>expr</code>, which contains the logical
      variables enumerated in <code>variables</code>.</p>
  <button onclick="toggleContent('q48')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  table ["a"; "b"] (And(Var "a", Or(Var "a", Var "b")));;
  let a = Var "a" and b = Var "b" and c = Var "c" in
  table ["a"; "b"; "c"] (Or(And(a, Or(b,c)), Or(And(a,b), And(a,c))))
</pre>
</div>

<div class="question medium" id="q49" >
  <div class="title">Gray code.</div>
  <p>An n-bit Gray code is a sequence of n-bit strings constructed
    according to certain rules. For example,</p>
<pre>
n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
</pre>
  <p>Find out the construction rules and write a function with the
    following specification: <code>gray n</code> returns
    the <code>n</code>-bit Gray code.</p>
  <button onclick="toggleContent('q49')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  gray 1;;
  gray 2;;
  gray 3
</pre>
</div>

<div class="question hard" id="q50" >
  <div class="title">Huffman code.</div>
  <p>First of all, consult a good book on discrete mathematics or
    algorithms for a detailed description of Huffman codes (you can
    start with
    the <a href="http://en.wikipedia.org/wiki/Huffman_coding"
    >Wikipedia page</a>)!</p>
  <p>We suppose a set of symbols with their frequencies, given as a
    list of <code>Fr(S,F)</code> terms. Example:
    <code>fs = [Fr(a,45); Fr(b,13); Fr(c,12); Fr(d,16); Fr(e,9);
      Fr(f,5)]</code>. Our objective is to construct a
      list <code>Hc(S,C)</code> terms, where <code>C</code> is the
      Huffman code word for the symbol <code>S</code>. In our example,
      the result could be <code>hs = [Hc(a,'0'); Hc(b,'101'); Hc(c,'100');
      Hc(d,'111'); Hc(e,'1101'); hc(f,'1100')]</code>
      [hc(a,'01'),...etc.]. The task shall be performed by the
      function <code>huffman</code> defined as follows:
    <code>huffman(fs)</code> returns the Huffman code table for the
    frequency table <code>fs</code></p>
<button onclick="toggleContent('q50')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<!------------------------------------------------------------------------>
<h2><a name="bin-tree" ></a>Binary Trees</h2>

<div style="float: right"
     >&nbsp;<img src="https://sites.google.com/site/prologsite/_/rsrc/1264934442609/prolog-problems/4/p67.gif"
       alt="Binary tree" />
</div>
<p><em>A binary tree is either empty or it is composed of a root element
    and two successors, which are binary trees themselves.</em></p>
<p>In OCaml, one can define a new type <code>binary_tree</code> that
  carries an arbitrary value of type <code>'a</code> at each node.
<!-- FIXME: rewrite -->
</p>
<pre ml:content="ocaml" style="width: 75%">
  type 'a binary_tree =
    | Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree
</pre>
  <p>An example of tree carrying <code>char</code> data is:</p>
<pre ml:content="ocaml">
  let example_tree =
    Node('a', Node('b', Node('d', Empty, Empty), Node('e', Empty, Empty)),
         Node('c', Empty, Node('f', Node('g', Empty, Empty), Empty)))
</pre>
  <p>In OCaml, the strict type discipline <em>guarantees</em> that, if
  you get a value of type <code>binary_tree</code>, then it must have
  been created with the two constructors <code>Empty</code>
  and <code>Node</code>.
</p>

<div class="question medium" id="q55" >
  <div class="title">Construct completely balanced binary
    trees</div>
  <p>In a completely balanced binary tree, the following property
    holds for every node: The number of nodes in its left subtree and
    the number of nodes in its right subtree are almost equal, which
    means their difference is not greater than one.</p>
  <p>Write a function <code>cbal_tree</code> to construct completely
    balanced binary trees for a given number of nodes.  The function
    should generate all solutions via backtracking.  Put the
    letter <code>'x'</code> as information into all nodes of the
    tree.</p>
  <!-- FIXME: picture of the tree below desired. -->
  <button onclick="toggleContent('q55')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  cbal_tree 4;;
  List.length(cbal_tree 40)
</pre>
</div>

<div class="question medium" id="q56" >
  <div class="title">Symmetric binary trees</div>
  <p>Let us call a binary tree symmetric if you can draw a vertical
    line through the root node and then the right subtree is the
    mirror image of the left subtree. Write a
    function <code>is_symmetric</code> to check whether a given binary
    tree is symmetric.</p>
  <p>Hint: Write a function
    <code>is_mirror</code> first to check whether one tree is the mirror
    image of another.  We are only interested in the structure, not in
    the contents of the nodes.</p>
  <button onclick="toggleContent('q56')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec is_mirror t1 t2 =
    match t1, t2 with
    | Empty, Empty -> true
    | Node(_, l1, r1), Node(_, l2, r2) ->
       is_mirror l1 r2 && is_mirror r1 l2
    | _ -> false

  let is_symmetric = function
    | Empty -> true
    | Node(_, l, r) -> is_mirror l r
</pre>
</div>

<div class="question medium" id="q57" >
  <div class="title">Binary search trees (dictionaries)</div>
  <p>Construct
    a <a href="http://en.wikipedia.org/wiki/Binary_search_tree"
	 target="_blank" >binary search tree</a> from a list of integer
    numbers.</p>
  <button onclick="toggleContent('q57')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec insert tree x = match tree with
    | Empty -> Node(x, Empty, Empty)
    | Node(y, l, r) ->
       if x = y then tree
       else if x < y then Node(y, insert l x, r)
       else Node(y, l, insert r x)

  let construct l = List.fold_left insert Empty l
</pre>
<pre ml:content="ocaml">
  construct [3;2;5;7;1]
</pre>
  <p>Then use this function to test the solution of the previous
    problem.</p>
<pre ml:content="ocaml">
  is_symmetric(construct [5;3;18;1;4;12;21]);;
  not(is_symmetric(construct [3;2;5;7;4]))
</pre>
</div>

<div class="question medium" id="q58" >
  <div class="title">Generate-and-test paradigm</div>
  <p>Apply the generate-and-test paradigm to construct all symmetric,
    completely balanced binary trees with a given number of nodes.</p>
  <button onclick="toggleContent('q58')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let sym_cbal_trees n =
    List.filter is_symmetric (cbal_tree n)
</pre>
<pre ml:content="ocaml">
  sym_cbal_trees 5
</pre>
<p>
  How many such trees are there with 57 nodes? Investigate about how
  many solutions there are for a given number of nodes? What if the
  number is even?  Write an appropriate function.
</p>
<pre ml:content="ocaml" class="solution">
  List.length (sym_cbal_trees 57);;
  List.map (fun n -> n, List.length(sym_cbal_trees n)) (range 10 20)
  = [(10, 0); (11, 4); (12, 0); (13, 4); (14, 0); (15, 1);
     (16, 0); (17, 8); (18, 0); (19, 16); (20, 0)]
</pre>
</div>

<div class="question medium" id="q59" >
  <div class="title">Construct height-balanced binary trees</div>
  <p>In a height-balanced binary tree, the following property holds
    for every node: The height of its left subtree and the height of its
    right subtree are almost equal, which means their difference is not
    greater than one.</p>
  <p>Write a function <code>hbal_tree</code> to construct
    height-balanced binary trees for a given height. The function
    should generate all solutions via backtracking. Put the
    letter <code>'x'</code> as information into all nodes of the
    tree.</p>
  <button onclick="toggleContent('q59')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec hbal_tree n =
    if n = 0 then [Empty]
    else if n = 1 then [Node('x', Empty, Empty)]
    else
      (* [add_trees_with left right trees] is defined in a question above. *)
      let t1 = hbal_tree (n - 1)
      and t2 = hbal_tree (n - 2) in
      add_trees_with t1 t1 (add_trees_with t1 t2 (add_trees_with t2 t1 []))
</pre>
<pre ml:content="ocaml">
  let t = hbal_tree 3;;
  let x = 'x';;
  List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
                 Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)))) t;;
  List.mem (Node(x, Node(x, Node(x, Empty, Empty), Node(x, Empty, Empty)),
                 Node(x, Node(x, Empty, Empty), Empty))) t;;
  List.length t = 15
</pre>
</div>

<div class="question medium" id="q60">
  <div class="title">Construct height-balanced binary trees with a
    given number of nodes</div>
  <p>Consider a height-balanced binary tree of height <code>h</code>.
    What is the maximum number of nodes it can contain?
    Clearly, <em>maxN = 2<sup><code>h</code></sup> - 1</em>. However,
    what is the minimum number <em>minN</em>? This question is more
    difficult.  Try to find a recursive statement and turn it into a
    function
    <code>minNodes</code> defined as follows:
    <code>minNodes h</code> returns the minimum number of nodes in a
    height-balanced binary tree of height <code>h</code>.</p>
  <button onclick="toggleContent('q60')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
  <p>On the other hand, we might ask: what is the maximum height H a
    height-balanced binary tree with N nodes can have?
    <code>maxHeight n</code> returns the maximum height of a
    height-balanced binary tree with <code>n</code> nodes.
  </p>
<pre ml:content="ocaml" class="solution">
</pre>
  <p>Now, we can attack the main problem: construct all the
    height-balanced binary trees with a given nuber of nodes.
    <code>hbal_tree_nodes n</code> returns a list of all height-balanced
    binary tree with <code>n</code> nodes.
  </p>
<pre ml:content="ocaml" class="solution">
</pre>
  <p>Find out how many height-balanced trees exist for <code>n =
      15</code>.</p>
<pre ml:content="ocaml">
  List.length (hbal_tree_nodes 15)
</pre>
</div>

<div class="question easy" id="q61" >
  <div class="title">Count the leaves of a binary tree</div>
  <p>A leaf is a node with no successors. Write a function
    <code>count_leaves</code> to count them. </p>
  <button onclick="toggleContent('q61')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec count_leaves = function
    | Empty -> 0
    | Node(_, Empty, Empty) -> 1
    | Node(_, l, r) -> count_leaves l + count_leaves r
</pre>
<pre ml:content="ocaml">
  count_leaves Empty;;
  count_leaves example_tree
</pre>
</div>

<div class="question easy" id="q61_a" >
  <div class="title">Collect the leaves of a binary tree in a
    list</div>
  <p>A leaf is a node with no successors. Write a
    function <code>leaves</code> to collect them in a list.</p>
  <button onclick="toggleContent('q61_a')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec leaves = function
    | Empty -> []
    | Node(c, Empty, Empty) -> [c]
    | Node(_, l, r) -> leaves l @ leaves r
</pre>
<pre ml:content="ocaml">
  leaves Empty;;
  leaves example_tree
</pre>
</div>

<div class="question easy" id="q62" >
  <div class="title">Collect the internal nodes of a binary tree in
    a list</div>
  <p>An internal node of a binary tree has either one or two non-empty
    successors.  Write a function <code>internals</code> to collect them
    in a list. </p>
  <button onclick="toggleContent('q62')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec internals = function
    | Empty | Node(_, Empty, Empty) -> []
    | Node(c, l, r) -> internals l @ (c :: internals r)
</pre>
<pre ml:content="ocaml">
  internals (Node('a', Empty, Empty));;
  internals example_tree;;
</pre>
</div>

<div class="question easy" id="q62_b" >
  <div class="title">Collect the nodes at a given level in a
    list.</div>
  <p>A node of a binary tree is at level N if the path from the root to
    the node has length N-1.  The root node is at level 1.  Write a
    function <code>at_level t l</code> to collect all nodes of the
    tree <code>t</code> at  level <code>l</code> in a list. </p>
  <button onclick="toggleContent('q62_b')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec at_level t l = match t with
    | Empty -> []
    | Node(c, left, right) ->
       if l = 1 then [c]
       else at_level left (l - 1) @ at_level right (l - 1)
</pre>
<pre ml:content="ocaml">
  at_level example_tree 2;;
  at_level example_tree 2;;
  at_level example_tree 5;;
</pre>
  <p>Using <code>at_level</code> it is easy to construct a function
    <code>levelorder</code> which creates the level-order sequence of
    the nodes. However, there are more efficient ways to do that. </p>
</div>

<div class="question medium" id="q63" >
  <div class="title">Construct a complete binary tree</div>
  <p>A <em>complete</em> binary tree with height H is defined as
    follows: The levels 1,2,3,...,H-1 contain the maximum number of nodes
    (i.e 2<sup>i-1</sup> at the level i, note that we start counting the levels
    from 1 at the root). In level H, which may contain less than the
    maximum possible number of nodes, all the nodes are
    "left-adjusted". This means that in a levelorder tree traversal all
    internal nodes come first, the leaves come second, and empty
    successors (the nil's which are not really nodes!) come last.</p>
  <p>Particularly, complete binary trees are used as data structures (or
    addressing schemes) for heaps.</p>
  <p>We can assign an address number to each node in a complete binary
    tree by enumerating the nodes in levelorder, starting at the root with
    number 1. In doing so, we realize that for every node X with address A
    the following property holds: The address of X's left and right
    successors are 2*A and 2*A+1, respectively, supposed the successors do
    exist. This fact can be used to elegantly construct a complete binary
    tree structure.  Write a function <code>is_complete_binary_tree</code>
    with the following specification:
    <code>is_complete_binary_tree n t</code> returns <code>true</code>
    iff <code>t</code> is a complete binary tree with <code>n</code>
    nodes.</p>
<button onclick="toggleContent('q63')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q64" >
  <div class="title">Layout a binary tree (1)</div>
  <p>As a preparation for drawing the tree, a layout algorithm is
    required to determine the position of each node in a rectangular
    grid. Several layout methods are conceivable, one of them is shown in
    the illustration below.</p>
  <center>
    <img src="https://sites.google.com/site/prologsite/_/rsrc/1264933989828/prolog-problems/4/p64.gif"
	 alt="grid" />
  </center>
  <p>In this layout strategy, the position of a node v is obtained by
    the following two rules:</p>
  <ul>
    <li><em>x(v)</em> is equal to the position of the node v in the
      <em>inorder</em> sequence;</li>
    <li><em>y(v)</em> is equal to the depth of the node <em>v</em> in
      the tree.</li>
  </ul>
  <p>In order to store the position of the nodes, we redefine the OCaml
    type representing a node (and its successors) as follows: </p>
<pre ml:content="ocaml">
  type 'a pos_binary_tree =
    | E (* represents the empty tree *)
    | N of 'a * int * int * 'a pos_binary_tree * 'a pos_binary_tree
</pre>
  <p><code>N(w,x,y,l,r)</code> represents a (non-empty) binary tree with
    root <code>w</code> "positioned" at <code>(x,y)</code>, and
    subtrees <code>l</code> and <code>r</code>.  Write a function
    <code>layout_binary_tree</code> with the following
    specification: <code>layout_binary_tree t</code> returns the
    "positioned" binary tree obtained from the binary tree <code>t</code>.
  </p>
  <button onclick="toggleContent('q64')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q65" >
  <div class="title">Layout a binary tree (2)</div>
  <center>
    <img src="https://sites.google.com/site/prologsite/_/rsrc/1264934255598/prolog-problems/4/p65.gif" />
  </center>
  <p>An alternative layout method is depicted in the above illustration.
    Find out the rules and write the corresponding OCaml function.</p>
  <p>Hint: On a given level, the horizontal distance between neighboring
    nodes is constant.</p>
  <button onclick="toggleContent('q65')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q66" >
  <div class="title">Layout a binary tree (3)</div>
  <p>Yet another layout strategy is shown in the above illustration. The
    method yields a very compact layout while maintaining a certain
    symmetry in every node. Find out the rules and write the corresponding
    Prolog predicate.</p>
  <p>Hint: Consider the horizontal distance between a node and its
    successor nodes. How tight can you pack together two subtrees to
    construct the combined binary tree?  This is a difficult
    problem.  Don't give up too early!</p>
  <button onclick="toggleContent('q66')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
  <p>Which layout do you like most?</p>
</div>

<div class="question medium" id="q67"><a name="tree-string" ></a>
  <div class="title">A string representation
    of binary trees</div>
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264934442609/prolog-problems/4/p67.gif"
       alt="binary tree"
       style="float:right" />
  <p>Somebody represents binary trees as strings of the following type
    (see example):
    <code>"a(b(d,e),c(,f(g,)))"</code>.</p>
  <ul>
    <li>Write an OCaml function which generates this string
      representation, if the tree is given as usual
      (as <code>Empty</code> or <code>Node(x,l,r)</code> term).  Then
      write a function which does this inverse; i.e. given the string
      representation, construct the tree in the usual form.  Finally,
      combine the two predicates in a single
      function <code>tree_string</code> which can be used in both
      directions.</li>
    <li>Write the same predicate <code>tree_string</code> using
      difference lists and a single predicate <code>tree_dlist</code>
      which does the conversion between a tree and a difference list in
      both directions.</li>
  </ul>
  <p>For simplicity, suppose the information in the nodes is a single
    letter and there are no spaces in the string. </p>
  <button onclick="toggleContent('q67')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q68" >
  <div class="title">Preorder and inorder sequences of binary
    trees</div>
  <p>We consider binary trees with nodes that are identified by single
    lower-case letters, as in the example of the previous problem.</p>
  <ol>
    <li>Write functions <code>preorder</code> and <code>inorder</code>
      that construct the preorder and inorder sequence of a given binary
      tree, respectively.  The results should be atoms, e.g. 'abdecfg' for
      the preorder sequence of the example in the previous problem.
    </li>
    <li>Can you use <code>preorder</code> from problem part 1. in the reverse
      direction; i.e. given a preorder sequence, construct a corresponding
      tree? If not, make the necessary arrangements.</li>
    <li>If both the preorder sequence and the inorder sequence of the
      nodes of a binary tree are given, then the tree is determined
      unambiguously. Write a function <code>pre_in_tree</code> that does
      the job.</li>
    <li>Solve problems 1. to 3. using difference lists.  Cool!  Use the
      function <code>timeit</code> (defined in problem
      “<a href="#timeit" >Compare the two methods of calculating Euler's
	totient function.</a>”) to compare the solutions.</li>
  </ol>
  <p>What happens if the same character appears in more than one
    node. Try for instance <code>pre_in_tree "aba" "baa"</code>. </p>
  <button onclick="toggleContent('q68')" class="solution">Solution</button>
  <pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q69" >
  <div class="title">Dotstring representation of binary trees</div>
  <p>We consider again binary trees with nodes that are identified by
    single lower-case letters, as in the example of problem
    “<a href="#tree-string" >A string representation of binary
      trees</a>”. Such a tree can be represented by the preorder sequence
    of its nodes in which dots (.) are inserted where an empty subtree
    (nil) is encountered during the tree traversal. For example, the
    tree shown in problem “<a href="#tree-string" >A string
      representation of binary trees</a>” is represented as
    'abd..e..c.fg...'.  First, try to establish a syntax (BNF or syntax
    diagrams) and then write a function <code>tree_dotstring</code>
    which does the conversion in both directions.  Use difference
    lists. </p>
  <button onclick="toggleContent('q69')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>


<!------------------------------------------------------------------------>
<h2><a name="mult-tree" ></a>Multiway Trees</h2>

<img src="https://sites.google.com/site/prologsite/_/rsrc/1264946214751/prolog-problems/5/p70.gif"
     alt="multiway tree"
     style="float:right; padding-left: 1em" />
<p><em>A multiway tree is composed of a root element and a (possibly
    empty) set of successors which are multiway trees themselves.  A
    multiway tree is never empty. The set of successor trees is sometimes
    called a forest.</em></p>
<p>To represent multiway trees, we will use the following type which
  is a direct translation of the definition:</p>
<pre ml:content="ocaml" style="width: 80%">
  type 'a mult_tree = T of 'a * 'a mult_tree list
</pre>
<p>The example tree depicted opposite is therefore represented by the
  following OCaml expression:</p>
<pre ml:content="ocaml">
  T('a', [T('f',[T('g',[])]); T('c',[]); T('b',[T('d',[]); T('e',[])])])
</pre>

<div class="question easy" id="q70_c" >
  <div class="title">Count the nodes of a multiway tree</div>
  <button onclick="toggleContent('q70_c')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec count_nodes (T(_, sub)) =
    List.fold_left (fun n t -> n + count_nodes t) 1 sub
</pre>
<pre ml:content="ocaml">
  count_nodes (T('a', [T('f',[]) ]))
</pre>
</div>

<div class="question medium" id="q70" >
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264946214751/prolog-problems/5/p70.gif"
       alt="multiway tree"
       style="float:right" />
  <div class="title">Tree construction from a node string</div>
  <p>We suppose that the nodes of a multiway tree contain single
    characters.  In the depth-first order sequence of its nodes, a
    special character <code>^</code> has been inserted whenever, during
    the tree traversal, the move is a backtrack to the previous
    level.</p>
  <p>By this rule, the tree in the figure opposite is represented as:
    <code>afg^^c^bd^e^^^</code>.</p>
  <p>Write functions
    <code>string_of_tree : char mult_tree -> string</code> to construct
    the string representing the tree and
    <code>tree_of_string : string -> char mult_tree</code> to construct
    the tree when the string is given.  </p>
  <button onclick="toggleContent('q70')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  let t =
    T('a', [T('f',[T('g',[])]); T('c',[]); T('b',[T('d',[]); T('e',[])])]);;
  string_of_tree t;;
  tree_of_string "afg^^c^bd^e^^^" = t;;
</pre>
</div>

<div class="question easy" id="q71" >
  <div class="title">Determine the internal path length of a
    tree</div>
  <p>We define the internal path length of a multiway tree as the total
    sum of the path lengths from the root to all nodes of the tree.  By
    this definition, the tree <code>t</code> in the figure of the
    previous problem has an internal path length of 9.  Write a
    function <code>ipl tree</code> that returns the internal path length
    of <code>tree</code>.</p>
  <button onclick="toggleContent('q71')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec ipl_sub len (T(_, sub)) =
    (* [len] is the distance of the current node to the root.  Add the
       distance of all sub-nodes. *)
    List.fold_left (fun sum t -> sum + ipl_sub (len + 1) t) len sub
  let ipl t = ipl_sub 0 t
</pre>
<pre ml:content="ocaml">
  ipl t
</pre>
</div>

<div class="question easy" id="q72" >
  <div class="title">Construct the bottom-up order sequence of the
    tree nodes</div>
  <p>Write a function <code>bottom_up t</code> which constructs the
    bottom-up sequence of the nodes of the multiway
    tree <code>t</code>.</p>
  <button onclick="toggleContent('q72')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let rec prepend_bottom_up (T(c, sub)) l =
    List.fold_right (fun t l -> prepend_bottom_up t l) sub (c :: l)
  let bottom_up t = prepend_bottom_up t []
</pre>
<pre ml:content="ocaml">
  bottom_up (T('a', [T('b', [])]));;
  bottom_up t
</pre>
</div>

<div class="question medium" id="q73" >
  <div class="title">Lisp-like tree representation</div>
  <p>There is a particular notation for multiway trees in Lisp.  The
    following pictures show how multiway tree structures are represented
    in Lisp.</p>
  <center>
    <img src="https://sites.google.com/site/prologsite/_/rsrc/1264946557086/prolog-problems/5/p73.png"
	 alt="Lisp representation of multiway trees" />
  </center>
  <p>Note that in the "lispy" notation a node with successors (children)
    in the tree is always the first element in a list, followed by its
    children.  The "lispy" representation of a multiway tree is a sequence
    of atoms and parentheses '(' and ')'.  This is very close to the way
    trees are represented in OCaml, except that no
    constructor <code>T</code> is used.  Write a function <code>lispy :
      char mult_tree -> string</code> that returns the lispy notation of
    the tree.</p>
  <button onclick="toggleContent('q73')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  lispy (T('a', []));;
  lispy (T('a', [T('b', [])]));;
  lispy t
</pre>
</div>

<!------------------------------------------------------------------------>
<h2><a name="graphs" ></a>Graphs</h2>

<p><em>A graph is defined as a set of nodes and a set of edges, where
    each edge is a pair of different nodes.</em></p>

<img src="https://sites.google.com/site/prologsite/_/rsrc/1264948248705/prolog-problems/6/graph1.gif"
     alt="A graph"
     style="float:right; padding-left: 1em" />
<p>There are several ways to represent graphs in OCaml.</p>
<ul>
  <li style="padding-bottom: 2ex"
      >One method is to list all edges, an edge being a pair of nodes.
    In this form, the graph depicted opposite is represented as the
    following expression:
    <pre ml:content="ocaml" style="width: 75%" >
      ['h', 'g';  'k', 'f';  'f', 'b';  'f', 'c';  'c', 'b']
    </pre>
    We call this <strong>edge-clause form</strong>.
    Obviously, isolated nodes cannot be represented.
  </li>

  <li style="padding-bottom: 2ex"
      >Another method is to represent the whole graph as one data
    object.  According to the definition of the graph as a pair of two
    sets (nodes and edges), we may use the following OCaml type:
<pre ml:content="ocaml">
  type 'a graph_term = { nodes : 'a list;  edges : ('a * 'a) list }
</pre>
    Then, the above example graph is represented by:
<pre ml:content="ocaml">
  let example_graph =
    { nodes = ['b'; 'c'; 'd'; 'f'; 'g'; 'h'; 'k'];
      edges = ['h', 'g';  'k', 'f';  'f', 'b';  'f', 'c';  'c', 'b'] }
</pre>
    <p>We call this <strong>graph-term form</strong>. Note, that the
    lists are kept sorted, they are really sets, without duplicated
    elements. Each edge appears only once in the edge list; i.e. an
    edge from a node x to another node y is represented
    as <code>(x,y)</code>, the couple <code>(y,x)</code> is not
    present. The <strong>graph-term form is our default
    representation.</strong> You may want to define a similar type
    using sets instead of lists.
    </p>
  </li>

  <li style="padding-bottom: 2ex">
    A third representation method is to associate with each node the set
    of nodes that are adjacent to that node. We call this the
    <strong>adjacency-list form</strong>.  In our example:
<pre ml:content="ocaml">
</pre>
  </li>

  <li>The representations we introduced so far well suited for
    automated processing, but their syntax is not very user-friendly.
    Typing the terms by hand is cumbersome and error-prone.  We can
    define a more compact and "human-friendly" notation as follows: A
    graph (with char labelled nodes) is represented by a string of
    atoms and terms of the type X-Y.  The atoms stand for isolated
    nodes, the X-Y terms describe edges.  If an X appears as an
    endpoint of an edge, it is automatically defined as a node. Our
    example could be written as:
<pre ml:content="ocaml">
  "b-c f-c g-h d f-b k-f h-g"
</pre>
    <p>We call this the <strong>human-friendly form</strong>.  As the
      example shows, the list does not have to be sorted and may even
      contain the same edge multiple times. Notice the isolated node
      <code>d</code>. </p>
  </li>
</ul>

<div class="question easy" id="q80" >
  <div class="title">Conversions</div>
  <p>Write functions to convert between the different graph
    representations. With these functions, all representations are
    equivalent; i.e. for the following problems you can always pick freely
    the most convenient form.   This problem is
    not particularly difficult,  but it's a lot of
    work to deal with all the special cases. </p>
  <button onclick="toggleContent('q80')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q81" >
  <div class="title">Path from one node to another one</div>
  <p>Write a function <code>paths g a b</code> that returns all acyclic
    path <code>p</code> from node <code>a</code> to node <code>b ≠ a</code>
    in the graph <code>g</code>. The function should return the list of
    all paths via backtracking. </p>
  <button onclick="toggleContent('q81')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
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
</pre>
<pre ml:content="ocaml">
  paths example_graph 'f' 'b'
</pre>
</div>

<div class="question easy" id="q82" >
  <div class="title">Cycle from a given node</div>
  <p>Write a functions <code>cycle g a</code> that returns a closed path
    (cycle) <code>p</code> starting at a given node <code>a</code> in
    the graph <code>g</code>. The predicate should return the list of
    all cycles via backtracking. </p>
  <button onclick="toggleContent('q82')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
  let cycles g a =
    let n = neighbors g a (fun _ -> true) in
    let p = List.concat(List.map (fun c -> list_path g a [c]) n) in
    List.map (fun p -> p @ [a]) p
</pre>
<pre ml:content="ocaml">
  cycles example_graph 'f'
</pre>
</div>

<div class="question medium" id="q83" >
  <div class="title">Construct all spanning trees</div>
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264949059996/prolog-problems/6/p83.gif"
       alt="Spanning tree graph"
       style="float: right; padding-left: 1em" />
  <p>Write a function <code>s_tree g</code> to construct (by
    backtracking) all
    <a href="http://en.wikipedia.org/wiki/Spanning_tree"
       target="_blank" >spanning
      trees</a> of a given graph <code>g</code>.  With this predicate,
    find out how many spanning trees there are for the graph depicted to
    the left.  The data of this example graph can be found in the test
    below.  When you have a correct solution for the
    <code>s_tree</code> function, use it to define two other useful
    functions: <code>is_tree graph</code> and <code>is_connected
      Graph</code>.  Both are five-minutes tasks! </p>
  <button onclick="toggleContent('q83')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
  let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
            edges = [('a', 'b'); ('a', 'd'); ('b', 'c'); ('b', 'e');
                     ('c', 'e'); ('d', 'e'); ('d', 'f'); ('d', 'g');
                     ('e', 'h'); ('f', 'g'); ('g', 'h')] }
</pre>
</div>


<div class="question medium" id="q84" >
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264949163407/prolog-problems/6/p84.gif"
       alt="Spanning tree graph"
       style="float: right; padding-left: 1em" />
  <div class="title">Construct the minimal spanning tree</div>
  <p> Write a function <code>ms_tree graph</code> to construct
    the minimal spanning tree of a given labelled graph.  A labelled
    graph will be represented as follows:</p>
<pre ml:content="ocaml" style="width: 80%">
  type ('a, 'b) labeled_graph = { nodes : 'a list;
                                  edges : ('a * 'a * 'b) list }
</pre>
  <p>(Beware that from now on <code>nodes</code> and <code>edges</code>
    mask the previous fields of the same name.)</p>
  <p>Hint: Use the
    <a href="http://en.wikipedia.org/wiki/Prim%27s_algorithm" >algorithm
      of Prim</a>.  A small modification of the solution of P83 does the
    trick. The data of the example graph to the right can be found
    below.</p>
  <button onclick="toggleContent('q84')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
  let g = { nodes = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'];
            edges = [('a', 'b', 5); ('a', 'd', 3); ('b', 'c', 2); ('b', 'e', 4);
                     ('c', 'e', 6); ('d', 'e', 7); ('d', 'f', 4); ('d', 'g', 3);
                     ('e', 'h', 5); ('f', 'g', 4); ('g', 'h', 1)] }
</pre>
</div>

<div class="question medium" id="q85" >
  <div class="title">Graph isomorphism</div>
  <p>Two graphs G1(N1,E1) and G2(N2,E2) are isomorphic if there is a
    bijection f: N1 → N2 such that for any nodes X,Y of N1, X and Y are
    adjacent if and only if f(X) and f(Y) are adjacent.</p>
  <p>Write a function that determines whether two graphs are isomorphic.
    Hint: Use an open-ended list to represent the function f. </p>
  <button onclick="toggleContent('q85')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q86" >
  <div class="title">Node degree and graph coloration</div>
  <ul>
    <li>Write a function <code>degree graph node</code> that determines the
      degree of a given node.</li>
    <li>Write a function that generates a list of all nodes of a graph
      sorted according to decreasing degree.</li>
    <li>Use <a href="http://en.wikipedia.org/wiki/Graph_coloring#Greedy_coloring"
	       >Welsh-Powell's algorithm</a> to paint the nodes of a graph in
      such a way that adjacent nodes have different colors.</li>
  </ul>
  <button onclick="toggleContent('q86')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q87" >
  <div class="title">Depth-first order graph traversal</div>
  <p>Write a function that generates a depth-first order graph
    traversal sequence.  The starting point should be specified, and the
    output should be a list of nodes that are reachable from this starting
    point (in depth-first order). </p>
  <button onclick="toggleContent('q87')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q88" >
  <div class="title">Connected components</div>
  <p>Write a predicate that splits a graph into its
    <a href="http://en.wikipedia.org/wiki/Connected_component_%28graph_theory%29"
       >connected components</a>.</p>
  <button onclick="toggleContent('q88')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q89" >
  <div class="title">Bipartite graphs</div>
  <p> Write a predicate that finds out whether a given graph is
    <a href="http://en.wikipedia.org/wiki/Bipartite_graph" >bipartite</a>.</p>
  <button onclick="toggleContent('q89')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q89+1" >
  <div class="title">Generate K-regular simple graphs with N
    nodes</div>
  <p>In
    a <a href="http://en.wikipedia.org/wiki/K-regular_graph" >K-regular
      graph</a> all nodes have a degree of K; i.e. the number of edges
    incident in each node is K. How many (non-isomorphic!)  3-regular
    graphs with 6 nodes are there?</p>
  <p>See also
    the <a href="https://sites.google.com/site/prologsite/prolog-problems/6/solutions-6/p6_11.txt?attredirects=0&d=1"
	   >table of results</a>.</p>
  <button onclick="toggleContent('q89+1')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>


<!------------------------------------------------------------------------>
<h2><a name="misc" ></a>Miscellaneous Problems</h2>


<div class="question medium" id="q90" >
  <div class="title">Eight queens problem</div>
  <p>This is a classical problem in computer science. The objective is
    to place eight queens on a chessboard so that no two queens are
    attacking each other; i.e., no two queens are in the same row, the
    same column, or on the same diagonal.</p>
  <p>
    Hint: Represent the positions of the queens as a list of numbers
    1..N. Example: <code>[4;2;7;3;6;8;5;1]</code> means that the queen
    in the first column is in row 4, the queen in the second column is
    in row 2, etc. Use the generate-and-test paradigm.</p>
  <button onclick="toggleContent('q90')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q91" >
  <div class="title">Knight's tour</div>
  <p>Another famous problem is this one: How can a knight jump on an N×N
    chessboard in such a way that it visits every square exactly
    once?</p>
  <p>
    Hints: Represent the squares by pairs of their coordinates
    <code>(x,y)</code>, where both <code>x</code> and <code>y</code> are
    integers between 1 and N.  Define the function <code>jump n
      (x,y)</code> that returns all coordinates <code>(u,v)</code> to
    which a knight can jump from <code>(x,y)</code> to on
    a <code>n</code>×<code>n</code> chessboard.  And finally, represent
    the solution of our problem as a list knight positions (the
    knight's tour). </p>
  <button onclick="toggleContent('q91')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q92" >
  <div class="title">Von Koch's conjecture</div>
  <p>Several years ago I met a mathematician who was intrigued by a
    problem for which he didn't know a solution. His name was Von Koch,
    and I don't know whether the problem has been solved since.</p>
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264955485190/prolog-problems/7/p92a.gif"
       alt="Tree numbering"
       style="float: right; padding-left: 1em" />
  <p>Anyway, the puzzle goes like this: Given a tree with N nodes (and
    hence N-1 edges). Find a way to enumerate the nodes from 1 to N and,
    accordingly, the edges from 1 to N-1 in such a way, that for each edge
    K the difference of its node numbers equals to K. The conjecture is
    that this is always possible.</p>
  <p>For small trees the problem is easy to solve by hand. However, for
    larger trees, and 14 is already very large, it is extremely difficult
    to find a solution.  And remember, we don't know for sure whether there
    is always a solution!</p>
  <center>
    <img src="https://sites.google.com/site/prologsite/_/rsrc/1264955528417/prolog-problems/7/p92b.gif"
	 alt="Larger tree"
	 />
  </center>
  <p>Write a function that calculates a numbering scheme for a given
    tree.  What is the solution for the larger tree pictured above?</p>
  <button onclick="toggleContent('q92')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q93" >
  <div class="title">An arithmetic puzzle</div>
  <p>
    Given a list of integer numbers, find a correct way of inserting
    arithmetic signs (operators) such that the result is a correct
    equation.  Example: With the list of
    numbers <code>[2;3;5;7;11]</code> we can form the equations 2-3+5+7
    = 11 or 2 = (3*5+7)/11 (and ten others!).</p>
  <button onclick="toggleContent('q93')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q94" >
  <div class="title">English number words</div>
  <p>On financial documents, like cheques, numbers must sometimes be
    written in full words.  Example: 175 must be written as
    one-seven-five.  Write a function <code>full_words</code> to print
    (non-negative) integer numbers in full words. </p>
  <button onclick="toggleContent('q94')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q95" >
  <div class="title">Syntax checker</div>
  <img src="https://sites.google.com/site/prologsite/_/rsrc/1264955783053/prolog-problems/7/p96.gif"
       alt="Syntax graph"
       />
  <p>In a certain programming language (Ada) identifiers are defined by
    the syntax diagram (railroad chart) opposite. Transform the syntax
    diagram into a system of syntax diagrams which do not contain loops;
    i.e. which are purely recursive. Using these modified diagrams,
    write a function <code>identifier : string -> bool</code> that can
    check whether or not a given string is a legal identifier.</p>
  <button onclick="toggleContent('q95')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question medium" id="q96" >
  <div class="title">Sudoku</div>
  <p>Sudoku puzzles go like this: </p>
<pre>
   Problem statement                 Solution

    .  .  4 | 8  .  . | .  1  7	     9  3  4 | 8  2  5 | 6  1  7
            |         |                      |         |
    6  7  . | 9  .  . | .  .  .	     6  7  2 | 9  1  4 | 8  5  3
            |         |                      |         |
    5  .  8 | .  3  . | .  .  4      5  1  8 | 6  3  7 | 9  2  4
    --------+---------+--------      --------+---------+--------
    3  .  . | 7  4  . | 1  .  .      3  2  5 | 7  4  8 | 1  6  9
            |         |                      |         |
    .  6  9 | .  .  . | 7  8  .      4  6  9 | 1  5  3 | 7  8  2
            |         |                      |         |
    .  .  1 | .  6  9 | .  .  5      7  8  1 | 2  6  9 | 4  3  5
    --------+---------+--------      --------+---------+--------
    1  .  . | .  8  . | 3  .  6	     1  9  7 | 5  8  2 | 3  4  6
            |         |                      |         |
    .  .  . | .  .  6 | .  9  1	     8  5  3 | 4  7  6 | 2  9  1
            |         |                      |         |
    2  4  . | .  .  1 | 5  .  .      2  4  6 | 3  9  1 | 5  7  8
</pre>
  <p>Every spot in the puzzle belongs to a (horizontal) row and a
    (vertical) column, as well as to one single 3x3 square (which we call
    "square" for short). At the beginning, some of the spots carry a
    single-digit number between 1 and 9. The problem is to fill the
    missing spots with digits in such a way that every number between 1
    and 9 appears exactly once in each row, in each column, and in each
    square.</p>
  <button onclick="toggleContent('q96')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q97" >
  <div class="title">Nonograms</div>
  <p>Around 1994, a certain kind of puzzles was very popular in
    England. The "Sunday Telegraph" newspaper wrote: "Nonograms are
    puzzles from Japan and are currently published each week only in The
    Sunday Telegraph. Simply use your logic and skill to complete the grid
    and reveal a picture or diagram." As an OCaml programmer, you are in a
    better situation: you can have your computer do the work!
  </p>
  <p>The puzzle goes like this: Essentially, each row and column of a
    rectangular bitmap is annotated with the respective lengths of its
    distinct strings of occupied cells. The person who solves the puzzle
    must complete the bitmap given only these lengths. </p>
<pre>
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
</pre>
  <p>For the example above, the problem can be stated as the two lists
    <code>[[3];[2;1];[3;2];[2;2];[6];[1;5];[6];[1];[2]]</code> and
    <code>[[1;2];[3;1];[1;5];[7;1];[5];[3];[4];[3]]</code> which give
    the "solid" lengths of the rows and columns, top-to-bottom and
    left-to-right, respectively. Published puzzles are larger than this
    example, e.g. 25×20, and apparently always have unique
    solutions. </p>
  <button onclick="toggleContent('q97')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>

<div class="question hard" id="q98" >
  <div class="title">Crossword puzzle</div>
  <p>Given an empty (or almost empty) framework of a crossword puzzle
    and a set of words. The problem is to place the words into the
    framework.</p>
  <center>
    <img src="https://sites.google.com/site/prologsite/_/rsrc/1264956149766/prolog-problems/7/p99.gif"
	 alt="puzzle"
	 />
  </center>
  <p>The particular crossword puzzle is specified in a text file which
    first lists the words (one word per line) in an arbitrary
    order. Then, after an empty line, the crossword framework is
    defined. In this framework specification, an empty character
    location is represented by a dot (.). In order to make the solution
    easier, character locations can also contain predefined character
    values. The puzzle above is defined in the
    file <a href="https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09a.dat?attredirects=0&d=1"
	    >p7_09a.dat</a>, other examples
    are <a href="https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09b.dat?attredirects=0&d=1"
	   >p7_09b.dat</a>
    and <a href="https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09d.dat?attredirects=0&d=1"
	   >p7_09d.dat</a>.  There is also an example of a puzzle
    (<a href="https://sites.google.com/site/prologsite/prolog-problems/7/solutions-7/p7_09c.dat?attredirects=0&d=1"
	>p7_09c.dat</a>) which does not have a solution.</p>
  <p>Words are strings (character lists) of at least two characters. A
    horizontal or vertical sequence of character places in the crossword
    puzzle framework is called a site. Our problem is to find a compatible
    way of placing words onto sites. </p>
  <p><strong>Hints:</strong></p>
  <ol>
    <li>The problem is not easy. You will need some time to thoroughly
      understand it.  So, don't give up too early!  And remember that
      the objective is a clean solution, not just a quick-and-dirty
      hack!</li>
    <li>For efficiency reasons it is important, at least for larger
      puzzles, to sort the words and the sites in a particular
      order. </li>
  </ol>
  <button onclick="toggleContent('q98')" class="solution">Solution</button>
<pre ml:content="ocaml" class="solution">
</pre>
<pre ml:content="ocaml">
</pre>
</div>


  </body>
</html>
