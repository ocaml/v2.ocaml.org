<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>Une centaine de lignes d'OCaml</title>
    <link href="ocaml.css" media="all" type="text/css" rel="stylesheet" />
  </head>
  <body>
    <h1>Une centaine de lignes d'OCaml</h1>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Sur cette page</em>
      <div ml:replace="toc"></div>
    </div>

    <h2><a name="elementary"></a>Fonctions élémentaires</h2>

    <!-- FIXME: paragraph like the English version -->
    <p>Avec le système interactif, définissons la fonction
      <code>square</code> (carré) et la fonction factorielle dans sa
      version récursive. Puis, appliquons ces fonctions à quelques
      valeurs choisies :
  </p>

    <pre class="listing" ml:content="ocaml">
let square x = x * x;;
  square 3;;
  let rec fact x =
    if x <= 1 then 1 else x * fact (x - 1);;
fact 5;;
square 120;;
</pre>


  <h2><a name="memory"</a>Gestion automatique de la mémoire</h2>

  <p>Toutes les opérations d'allocation et de libération de la mémoire
    sont complètement automatiques. Par exemple, considérons les
    listes simplement chaînées.
  </p>
  <p>Les listes sont prédéfinies en OCaml.  La liste vide est notée
      <code>[]</code>. Le constructeur d'ajout d'un élément à une
      liste est noté <code>::</code> (sous forme infixe).
  </p>

<pre class="listing" ml:content="ocaml">
let l = 1 :: 2 :: 3 :: [];;
[1; 2; 3];;
5 :: l;;
</pre>


  <h2><a name="polymorphism"></a>Polymorphisme : le tri des listes</h2>

  <p>Le tri par insertion est défini à l'aide de deux fonctions
  récursives.
  </p>
<pre class="listing" ml:content="ocaml">
let rec sort = function
  | [] -> []
  | x :: l -> insert x (sort l)
and insert elem = function
  | [] -> [elem]
  | x :: l -> if elem < x then elem :: x :: l
              else x :: insert elem l;;
</pre>

  <p>On notera que le type des éléments de la liste reste non
  spécifié: il est représenté par une <em>variable de
  types</em> <code>'a</code>. La fonction <code>sort</code> peut donc
  être appliquée aussi bien à une liste d'entiers qu'à une liste de
  chaînes de caractères.
  </p>
<pre class="listing" ml:content="ocaml">
sort [2; 1; 0];;
sort ["yes"; "ok"; "sure"; "ya"; "yep"];;
</pre>


  <h2><a name="imperative"</a>Programmation impérative</h2>

  <p>Représentons les polynômes des tableaux de coefficients
  entiers. Alors, pour ajouter deux polynômes, on alloue d'abord le
  tableau résultat, puis on le remplit à l'aide de deux
  boucles <code><b>for</b></code> successives.
  </p>

<pre class="listing" ml:content="ocaml">
let add_polynom p1 p2 =
  let n1 = Array.length p1
  and n2 = Array.length p2 in
  let result = Array.create (max n1 n2) 0 in
  for i = 0 to n1 - 1 do result.(i) <- p1.(i) done;
  for i = 0 to n2 - 1 do result.(i) <- result.(i) + p2.(i) done;
  result;;
add_polynom [| 1; 2 |] [| 1; 2; 3 |];;
</pre>

  <p>OCaml offre des cellules mémoire modifiables
  appelées <em>références</em> :
    <code>ref init</code> renvoie une nouvelle cellule, dont le
    contenu initial est <code>init</code>, <code>!cell</code> renvoie
    le contenu actuel de <code>cell</code>,
    et <code>cell
    :=<b></b> <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> x</code>
    met dans <code>cell</code> la valeur <code>x</code>.
  </p>
  <p>On peut redéfinir <code>fact</code> à l'aide d'une référence et
    d'une boucle
    <code><b>for</b></code> :
  </p>
<pre class="listing" ml:content="ocaml">
  let fact n =
    let result = ref 1 in
    for i = 2 to n do
      result := i * !result
    done;
    !result;;
  fact 5;;
</pre>


  <h2><a name="functionality"</a>Fonctions d'ordre supérieur</h2>

  <p>Il n'y a pas de restriction sur les fonctions, qui peuvent donc
  être passés en argument à d'autres fonctions. Définissons une
  fonction
      <code>sigma</code> qui renvoie la somme des résultats de
      l'application d'une fonction <code>f</code> donnée aux éléments
      d'une liste :
  </p>

<pre class="listing" ml:content="ocaml">
  let rec sigma f = function
    | [] -> 0
    | x :: l -> f x + sigma f l
</pre>

  <p>On peut définir des fonctions anonymes à l'aide de la
  construction <code><b>fun</b></code> ou <code><b>function</b></code> :
  </p>
<pre class="listing" ml:content="ocaml">
sigma (fun x -> x * x) [1; 2; 3];;
</pre>

  <p>Polymorphisme et fonctions d'ordre supérieur permettent de
    définir la composition de fonctions sous sa forme la plus générale :
  </p>
<pre class="listing" ml:content="ocaml">
  let compose f g = fun x -> f (g x);;
  let square_o_fact = compose square fact;;
  square_o_fact 5;;
</pre>


  <h2><a name="power"</a>La puissance des fonctions</h2>

  <p>La puissance des fonctions ne peut pas être mieux illustrée que
      par la fonction « puissance » :
  </p>

<pre class="listing" ml:content="ocaml">
  let rec power f n = 
    if n = 0 then fun x -> x 
    else</b> compose f (power f (n - 1));;
</pre>

    <p>La dérivée <code>n</code><sup>ième</sup> d'une fonction peut
      alors se définir comme en mathématiques en élevant la fonction
      dérivée à la puissance <code>n</code> :
  </p>

<pre class="listing" ml:content="ocaml">
  let derivative dx f = fun x -> (f (x +. dx) -. f x) /. dx;;
  let sin''' = power (derivative 1e-5) 3 sin;;
  let pi = 4.0 *. atan 1.0 in sin''' pi;;
</pre>


  <h2><a name="symbolic"</a>Calcul symbolique</h2>

  <p>Considérons des expressions symboliques simples comprenant des
  entiers, des variables, un opérateur de
  liaison <code><b>let</b></code>, et des opérateurs binaires. Ces
  expressions peuvent être définies à l'aide d'un nouveau type de
  données, de la façon suivante :
  </p>
<pre class="listing" ml:content="ocaml">
  type expression =
    | Num of int
    | Var of string
    | Let of string * expression * expression
    | Binop of string * expression * expression;;
</pre>

  <p>L'évaluation de ces expressions utilise un environnement
      qui à un identificateur associe une valeur, représenté par
      une liste de paires.
  </p>
<pre class="listing" ml:content="ocaml">
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
</pre>

  <p>Évaluons par exemple la phrase <code><b>let</b> x <b></b>=<b></b>
  1 <b>in</b> x + x</code> :
  </p>

<pre class="listing" ml:content="ocaml">
  eval [] (Let ("x", Num 1, Binop ("+", Var "x", Var "x")));;
</pre>

  <p>L'emploi du filtrage facilite la définition des fonctions opérant
      sur des données symboliques, en donnant aux définitions de
      fonctions une forme similaire à celle des déclarations de
      types. Notez, en effet, la similitude entre la définition de la
      fonction <code>eval</code> et la définition du type
      <code>expression</code>.
  </p>


  <h2><a name="debugging"</a>Trace des fonctions</h2>

  <p>Pour terminer, voici le moyen le plus élémentaire pour espionner
  les fonctions :
  </p>
<pre class="listing">
<code ml:replace="ocaml">
  let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
</code
><span class="ocamltop-prompt"># </span>#trace fib<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output">fib is now traced.</span>
<span class="ocamltop-prompt"># </span>fib 3<span class="ocamltop-prompt">;;</span>
<span class="ocamltop-output"
>fib &lt;-- 3
fib &lt;-- 1
fib --&gt; 1
fib &lt;-- 2
fib &lt;-- 0
fib --&gt; 1
fib &lt;-- 1
fib --&gt; 1
fib --&gt; 2
fib --&gt; 3
- : int = 3
</pre>


  </body>
</html>
