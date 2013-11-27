<!-- ((! set title A Hundred Lines of OCaml !)) ((! set learn !)) -->

*Table of contents*

# A Hundred Lines of OCaml

OCaml possesses an [interactive system](description.html#interactive),
called “toploop”, that lets you type OCaml code and have it evaluated
immediately. It is a great way to learn the language and to quickly
experiment with ideas. Below, we demonstrate the use of the toploop to
illustrate basic capabilities of the language.

Some indications for the code below. The prompt at which you type is
“`#`”. The code must end with “`;;`” (this is only an indication to the
interactive system that the input has to be evaluated and is not really
part of the OCaml code). The output of the system is displayed in
<code class="ocaml-output">this color</code>.

## Elementary functions
Let us define the square function and the recursive factorial function.
Then, let us apply these functions to sample values. Unlike the majority
of languages, OCaml uses parentheses for grouping but not for the
arguments of a function.

```ocamltop
let square x = x * x;;
square 3;;
let rec fact x =
  if x <= 1 then 1 else x * fact (x - 1);;
fact 5;;
square 120;;
```
## Automatic memory management
All allocation and deallocation operations are fully automatic. For
example, let us consider simply linked lists.

Lists are predefined in OCaml. The empty list is written `[]`. The
constructor that allows prepending an element to a list is written `::`
(in infix form).

```ocamltop
let l = 1 :: 2 :: 3 :: [];;
[1; 2; 3];;
5 :: l;;
```
## Polymorphism: sorting lists
Insertion sort is defined using two recursive functions.

```ocamltop
let rec sort = function
  | [] -> []
  | x :: l -> insert x (sort l)
and insert elem = function
  | [] -> [elem]
  | x :: l -> if elem < x then elem :: x :: l
              else x :: insert elem l;;
```
Note that the type of the list elements remains unspecified: it is
represented by a *type variable* `'a`. Thus, `sort` can be applied both
to a list of integers and to a list of strings.

```ocamltop
sort [2; 1; 0];;
sort ["yes"; "ok"; "sure"; "ya"; "yep"];;
```
## Imperative features
Let us encode polynomials as arrays of integer coefficients. Then, to
add two polynomials, we first allocate the result array, then fill its
slots using two successive `for` loops.

```ocamltop
let add_polynom p1 p2 =
  let n1 = Array.length p1
  and n2 = Array.length p2 in
  let result = Array.create (max n1 n2) 0 in
  for i = 0 to n1 - 1 do result.(i) <- p1.(i) done;
  for i = 0 to n2 - 1 do result.(i) <- result.(i) + p2.(i) done;
  result;;
add_polynom [| 1; 2 |] [| 1; 2; 3 |];;
```
OCaml offers updatable memory cells, called *references*: `ref init`
returns a new cell with initial contents `init`, `!cell` returns the
current contents of `cell`, and `cell := v` writes the value `v` into
`cell`.

We may redefine `fact` using a reference cell and a `for` loop:

```ocamltop
let fact n =
  let result = ref 1 in
  for i = 2 to n do
    result := i * !result
  done;
  !result;;
fact 5;;
```
## Higher-order functions
There is no restriction on functions, which may thus be passed as
arguments to other functions. Let us define a function `sigma` that
returns the sum of the results of applying a given function `f` to each
element of a list:

```ocamltop
let rec sigma f = function
  | [] -> 0
  | x :: l -> f x + sigma f l
```
Anonymous functions may be defined using the `fun` or `function`
construct:

```ocamltop
sigma (fun x -> x * x) [1; 2; 3];;
```
Polymorphism and higher-order functions allow defining function
composition in its most general form:

```ocamltop
let compose f g = fun x -> f (g x);;
let square_o_fact = compose square fact;;
square_o_fact 5;;
```
## The power of functions
The power of functions cannot be better illustrated than by the `power`
function:

```ocamltop
let rec power f n = 
  if n = 0 then fun x -> x 
  else compose f (power f (n - 1));;
```
The `n`<sup>th</sup> derivative of a function can be computed as in
mathematics by raising the derivative function to the `n`<sup>th</sup>
power:

```ocamltop
let derivative dx f = fun x -> (f (x +. dx) -. f x) /. dx;;
let sin''' = power (derivative 1e-5) 3 sin;;
let pi = 4.0 *. atan 1.0 in sin''' pi;;
```
## Symbolic computation
Let us consider simple symbolic expressions made up of integers,
variables, `let` bindings, and binary operators. Such expressions can be
defined as a new data type, as follows:

```ocamltop
type expression =
  | Num of int
  | Var of string
  | Let of string * expression * expression
  | Binop of string * expression * expression;;
```
Evaluation of these expressions involves an environment that maps
identifiers to values, represented as a list of pairs.

```ocamltop
let rec eval env = function
  | Num i -> i
  | Var x -> List.assoc x env
  | Let (x, e1, in_e2) ->
     let val_x = eval env e1 in
     eval ((x, val_x) :: env) in_e2
  | Binop (op, e1, e2) ->
     let v1 = eval env e1 in
     let v2 = eval env e2 in
     eval_op op v1 v2
and eval_op op v1 v2 =
  match op with
  | "+" -> v1 + v2
  | "-" -> v1 - v2
  | "*" -> v1 * v2
  | "/" -> v1 / v2
  | _ -> failwith ("Unknown operator: " ^ op);;
```
As an example, we evaluate the phrase `let   x = 1 in x   +       x`:

```ocamltop
eval [] (Let ("x", Num 1, Binop ("+", Var "x", Var "x")));;
```
Pattern matching eases the definition of functions operating on symbolic
data, by giving function definitions and type declarations similar
shapes. Indeed, note the close resemblance between the definition of the
`eval` function and that of the `expression` type.

## Elementary debugging
To conclude, here is the simplest way of spying over functions:

```ocaml
let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
# #trace fib;;
fib is now traced.
# fib 3;;
fib <-- 3
fib <-- 1
fib --> 1
fib <-- 2
fib <-- 0
fib --> 1
fib <-- 1
fib --> 1
fib --> 2
fib --> 3
- : int = 3
```
Go and [try it in your browser](http://try.ocamlpro.com/) or
[install](/docs/install.html) it and read some [tutorials](tutorials/).


