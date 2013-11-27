<!-- ((! set title Une centaine de lignes d'OCaml !)) ((! set learn !)) -->

# Une centaine de lignes d'OCaml

*Table of contents*

## Fonctions élémentaires
Avec le système interactif, définissons la fonction `square` (carré) et
la fonction factorielle dans sa version récursive. Puis, appliquons ces
fonctions à quelques valeurs choisies :

```ocamltop
let square x = x * x;;
  square 3;;
  let rec fact x =
    if x <= 1 then 1 else x * fact (x - 1);;
fact 5;;
square 120;;
```
## Gestion automatique de la mémoire
Toutes les opérations d'allocation et de libération de la mémoire sont
complètement automatiques. Par exemple, considérons les listes
simplement chaînées.

Les listes sont prédéfinies en OCaml. La liste vide est notée `[]`. Le
constructeur d'ajout d'un élément à une liste est noté `::` (sous forme
infixe).

```ocamltop
let l = 1 :: 2 :: 3 :: [];;
[1; 2; 3];;
5 :: l;;
```
## Polymorphisme : le tri des listes
Le tri par insertion est défini à l'aide de deux fonctions récursives.

```ocamltop
let rec sort = function
  | [] -> []
  | x :: l -> insert x (sort l)
and insert elem = function
  | [] -> [elem]
  | x :: l -> if elem < x then elem :: x :: l
              else x :: insert elem l;;
```
On notera que le type des éléments de la liste reste non spécifié: il
est représenté par une *variable de types* `'a`. La fonction `sort` peut
donc être appliquée aussi bien à une liste d'entiers qu'à une liste de
chaînes de caractères.

```ocamltop
sort [2; 1; 0];;
sort ["yes"; "ok"; "sure"; "ya"; "yep"];;
```
## Programmation impérative
Représentons les polynômes des tableaux de coefficients entiers. Alors,
pour ajouter deux polynômes, on alloue d'abord le tableau résultat, puis
on le remplit à l'aide de deux boucles `for` successives.

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
OCaml offre des cellules mémoire modifiables appelées *références* :
`ref init` renvoie une nouvelle cellule, dont le contenu initial est
`init`, `!cell` renvoie le contenu actuel de `cell`, et
`cell     :=       x` met dans `cell` la valeur `x`.

On peut redéfinir `fact` à l'aide d'une référence et d'une boucle `for`
:

```ocamltop
let fact n =
  let result = ref 1 in
  for i = 2 to n do
    result := i * !result
  done;
  !result;;
fact 5;;
```
## Fonctions d'ordre supérieur
Il n'y a pas de restriction sur les fonctions, qui peuvent donc être
passés en argument à d'autres fonctions. Définissons une fonction
`sigma` qui renvoie la somme des résultats de l'application d'une
fonction `f` donnée aux éléments d'une liste :

```ocamltop
let rec sigma f = function
  | [] -> 0
  | x :: l -> f x + sigma f l
```
On peut définir des fonctions anonymes à l'aide de la construction `fun`
ou `function` :

```ocamltop
sigma (fun x -> x * x) [1; 2; 3];;
```
Polymorphisme et fonctions d'ordre supérieur permettent de définir la
composition de fonctions sous sa forme la plus générale :

```ocamltop
let compose f g = fun x -> f (g x);;
let square_o_fact = compose square fact;;
square_o_fact 5;;
```
## La puissance des fonctions
La puissance des fonctions ne peut pas être mieux illustrée que par la
fonction « puissance » :

```ocamltop
let rec power f n = 
  if n = 0 then fun x -> x 
  else compose f (power f (n - 1));;
```
La dérivée `n`<sup>ième</sup> d'une fonction peut alors se définir comme
en mathématiques en élevant la fonction dérivée à la puissance `n` :

```ocamltop
let derivative dx f = fun x -> (f (x +. dx) -. f x) /. dx;;
let sin''' = power (derivative 1e-5) 3 sin;;
let pi = 4.0 *. atan 1.0 in sin''' pi;;
```
## Calcul symbolique
Considérons des expressions symboliques simples comprenant des entiers,
des variables, un opérateur de liaison `let`, et des opérateurs
binaires. Ces expressions peuvent être définies à l'aide d'un nouveau
type de données, de la façon suivante :

```ocamltop
type expression =
  | Num of int
  | Var of string
  | Let of string * expression * expression
  | Binop of string * expression * expression;;
```
L'évaluation de ces expressions utilise un environnement qui à un
identificateur associe une valeur, représenté par une liste de paires.

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
Évaluons par exemple la phrase `let x =   1 in x + x` :

```ocamltop
eval [] (Let ("x", Num 1, Binop ("+", Var "x", Var "x")));;
```
L'emploi du filtrage facilite la définition des fonctions opérant sur
des données symboliques, en donnant aux définitions de fonctions une
forme similaire à celle des déclarations de types. Notez, en effet, la
similitude entre la définition de la fonction `eval` et la définition du
type `expression`.

## Trace des fonctions
Pour terminer, voici le moyen le plus élémentaire pour espionner les
fonctions :

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

Continuez en
[essayant OCaml dans votre navigateur](http://try.ocamlpro.com/) ou
en l'[installant](/docs/install.fr.html) et en lisant des
« [tutoriaux](tutorials/index.fr.html) ».
