<!-- ((! set title Types de données et filtrage de motif !)) ((! set learn !)) -->

# Types de données et filtrage de motif
## Listes chaînées
Comme en Perl, la notion de liste est directement supportée dans le
langage OCaml. En OCaml, tous les éléments d'une liste doivent avoir le
même type. Une liste s'écrit :

```tryocaml
[1; 2; 3]
```
(Remarquez l'utilisation de points-virgules, et non de virgules).

`[]` est la liste vide.

Une liste a une **tête** (le premier élément) et une **queue** (les
autres éléments). La tête est un élément, la queue est une liste, donc
dans cet exemple la tête est l'entier `1` alors que la queue est la
*liste* `[2; 3]`.

Une autre façon d'écrire une liste est d'utiliser l'opérateur **cons**
`tête :: queue`. Toutes les expressions suivantes sont donc équivalentes
:

```tryocaml
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
```
Pourquoi mentionner l'opérateur cons ? Et bien nous en aurons besoin un
peu plus bas, pour faire du *filtrage* (*pattern matching*) sur les
listes.

###  Le type d'une liste chaînée
Le type d'une liste chaînée d'entiers est `int list`, et plus
généralement le type d'une liste chaînée de `toto`s est `toto list`.

Cela implique que tous les éléments d'une liste chaînée doivent avoir le
même type; Il existe des types polymorphiques de listes (càd `'a list`),
très utile pour écrire des fonctions manipulant des "listes de n'importe
quoi" de manière générique. (Mais `'a list` ne signifie pas que les
différents éléments d'une liste peuvent avoir des types différents -
vous ne pouvez pas utiliser ce type polymorphique pour construire,
disons, une liste d'entiers et de chaînes. Le sens de cette notation est
que les éléments de la liste peuvent être n'importe quoi, mais tous "du
même type de n'importe quoi").

La fonction `length` définie dans le module standard de OCaml `List` en
est un bon exemple. Peu importe si une liste contient des entiers, des
chaînes, des objets ou des ratons-laveurs, la fonction `List.length`
peut être utilisée dessus. Le type de `List.length` est donc :

```tryocaml
List.length : 'a list -> int
```
## Structures
Le C et le C++ proposent le concept simple de `struct`, abbréviation de
structure. En Java on peut utiliser des classes à la place, mais c'est
beaucoup plus laborieux.

Considérons cette simple structure C :

```tryocaml
struct paire_dentiers {
  int a, b;
};
```
L'équivalent le plus simple en OCaml sont les **n-uplets** (tuples),
comme la paire `(3, 4)` qui a pour type `int * int`. Contrairement aux
listes, les n-uplets peuvent contenir des éléments de types différents,
par exemple `(3, "hello", 'x')` qui a pour type `int * string * char`.

Une manière légèrement plus complexe de traduire les struct C est
d'utiliser un **enregistrement** (record). Les enregistrements, comme
les structs C, permettent de nommer leurs composants. Les composants des
n-uplets ne peuvent pas être nommées, et il faut se souvenir de l'ordre
dans lequel ils apparaissent. Voici l'enregistrement équivalent au
struct C ci-dessus :

```tryocaml
type paire_dentiers = { a : int; b : int };;
```
Ceci définit le type, et voici comment *créer* effectivement des valeurs
de ce type :

```tryocaml
{ a=3; b=5 }
```
Remarquez l'utilisation de ":" dans la définition du type et de "=" pour
créer des valeurs de ce type.

Voici un exemple d'utilisation des enregistrements, testé avec la boucle
interactive :

```tryocaml
# type paire_dentiers = { a : int; b : int };;
type paire_dentiers = { a : int; b : int; }
# {a=3; b=5};;
- : paire_dentiers = {a = 3; b = 5}
# {a=3};;
Some record field labels are undefined: b
```
Donc OCaml refuse de laisser certains champs d'un enregistrement non
définis.

## Variants (unions marquées et énumérations)
Le concept d'"union marquée" n'existe pas vraiment en C, bien qu'il
existe dans le compileur gcc. Voici comment on traduit d'habitude une
union marquée en C:

```tryocaml
struct foo {
  int type;
#define TYPE_INT 1
#define TYPE_PAIR_OF_INTS 2
#define TYPE_STRING 3
  union {
    int i;        // Si type == TYPE_INT.
    int pair[2];  // Si type == TYPE_PAIR_OF_INTS.
    char *str;    // Si type == TYPE_STRING.
  } u;
};
```
Je suppose que nous avons tous déjà vu ça, et ce n'est pas beau à voir.
Pour commencer, ce n'est pas sûr : le programmeur peut accidentellement
utiliser, disons, le champ `u.i` quand c'est en fait une chaîne qui est
stockée dans la structure. Ensuite, le compilateur ne peut pas
facilement vérifier que tous les types ont été considérés dans les
instructions `switch` (on peut utiliser un type `enum` pour se prémunir
contre ce problème précis). Le programmeur peut aussi oublier de
modifier le champ `type`, ce qui peut procurer des heures de jeu. Pour
finir, c'est lourdingue.

Voici l'équivalent en OCaml, élégant et concis:

```tryocaml
type foo = Nothing | Int of int | Pair of int * int | String of string;;
```
Voilà pour la définition du type. Au début de chacune des sections,
séparées par des `|`, se trouve un constructeur. On peut les nommer
comme on veut, tant que leur nom commence par une capitale. Si un
constructeur peut être utilisé pour définir une valeur, il est suivi de
`of` et d'un type, qui lui commence par une minuscule. Dans l'exemple
ci-dessus, Nothing est utilisé comme une constante, alors que les autres
constructeurs définissent des valeurs.

Pour *créer* effectivement des valeurs de ce type, on peut écrire:

```tryocaml
Nothing
Int 3
Pair (4, 5)
String "hello"
     etc.
```
Toutes ces expressions ont pour type `foo`.

Remarquez l'utilisation de `of` dans la définition du type, qui ne se
retrouve PAS dans l'écriture des valeurs de ce type.

Par extension, un simple `enum` C définit comme

```tryocaml
enum sign { positive, zero, negative };
```
peut être traduit en OCaml par

```tryocaml
type sign = Positive | Zero | Negative;;
```
###  Variants récursifs (utilisés pour les arbres)
Les variants peuvent être récursifs, ce qui est souvent utilisé pour
définir des structures de données arborescentes. C'est vraiment là que
se révèle l'expressivité des langages fonctionnels :

```tryocaml
type binary_tree = Leaf of int | Tree of binary_tree * binary_tree;;
```
Voilà quelques arbres binaires. Comme exercice, essayez de les dessiner
sur un bout de papier.

```tryocaml
Leaf 3

Tree (Leaf 3, Leaf 4)


Tree (Tree (Leaf 3, Leaf 4), Leaf 5)

Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
```
###  Variants paramétrés
L'arbre binaire de la section précédente comporte un entier à chaque
feuille, mais comment faire pour décrire la *forme* de la structure de
données, en laissant le choix de ce qui doit être stocké dans chaque
feuille pour plus tard ? On peut utiliser un variant paramétré (ou
polymorphique), comme ceci :

```tryocaml
type 'a binary_tree = Leaf of 'a | Tree of 'a binary_tree * 'a binary_tree;;
```
C'est le type général. Le type où chaque feuille stocke un entier
s'appelle `int binary_tree`. De la même façon, le type où chaque feuille
stocke une chaîne s'appelle `string binary_tree`. Pour l'exemple suivant
nous allons taper des valeurs dans la boucle interactive, et laisser le
système d'inférence de types nous donner leurs types :

```tryocaml
# Leaf "hello";;
- : string binary_tree = Leaf "hello"
# Leaf 3.0;;
- : float binary_tree = Leaf 3.
```
Remarquez que le nom des types est à l'envers (arbre binaire de
flottants -\> float binary_tree). C'est comparable avec le nom des
types pour les listes, ie `int list`, etc.

En fait ce n'est pas une coïncidence si `'a list` est écrit lui aussi "à
l'envers". Les types listes ne sont que des types variants paramétrés,
avec une définition légèrement spéciale :

```tryocaml
 type 'a list = [] | :: of 'a * 'a list   (* ceci n'est pas du vrai code OCaml *)
```
En fait la définition ci-dessus ne compile pas. La définition suivante,
très similaire, compile correctement :

```tryocaml
# type 'a list = Nil | :: of 'a * 'a list;;
type 'a list = Nil | :: of 'a * 'a list
# Nil;;
- : 'a list = Nil
# 1 :: Nil;;
- : int list = :: (1, Nil)
# 1 :: 2 :: Nil;;
- : int list = :: (1, :: (2, Nil))
```
Rappelez vous quand nous avons dit précédemment que les listes pouvaient
être écrites de deux façons, soit sous la forme syntaxiquement édulcorée
`[1; 2; 3]` ou sous la forme plus formelle `1 :: 2 :: 3 :: []`. En
regardant la définition de `'a list` ci-dessus, l'origine de la syntaxe
formelle devrait vous paraître plus clairement.

## Listes, structures et variants — Résumé
tableau en 3 colonnes avec nom et exemples de définition et de valeur.

```tryocaml
nom OCaml        Example de définition de type          Exemple(s) de valeur(s) 
liste            int list                               [1; 2; 3]
n-uplet          int * string                           (3, "hello")
enregistrement   type pair = { a : int; b : string }    { a = 3; b = "hello" }
variant          type foo = Int of int                  Int 3
                           | Pair of int * string                                                                      
variant          type sign = Positive | Zero            Positive
                           | Negative                   Zero
variant          type 'a my_list = Empty                Cons (1, Cons (2, Empty))
  paramétré                | Cons of 'a * 'a my_list
```
## Filtrage (sur les structures de données)
Une "Fonctionnalité Vraiment Cool"(tm) des langages fonctionnels est
leur capacité à démonter les structures de données et à effectuer du
filtrage (pattern matching) sur les données. Ce n'est pas à proprement
parler une propriété "fonctionnelle" - on pourrait très bien imaginer
une nouvelle sorte de C qui offrirait ces mêmes services. Mais c'est
tout de même une "Fonctionnalité Vraiment Cool".

Commençons par un problème réel : je veux représenter des expressions
mathématiques simples comme `n * (x + y)` et effectuer les
multiplications symboliquement pour obtenir `n * x + n * y`.

Définissons un type pour ces expressions:

```tryocaml
type expr = Plus of expr * expr        (* pour a + b *)
          | Minus of expr * expr       (* pour a - b *)
          | Times of expr * expr       (* pour a * b *)
      | Divide of expr * expr      (* pour a / b *)
          | Value of string            (* "x", "y", "n", etc. *)
      ;;
```
L'expression `n * (x + y)` s'écrirait:

```tryocaml
Times (Value "n", Plus (Value "x", Value "y"))
```
Ecrivons une fonction qui affiche
`Times (Value "n", Plus (Value "x", Value "y"))` comme `n * (x + y)`. En
fait, je vais écrire deux fonctions, l'une qui convertit une expression
en une jolie chaîne, et une autre qui l'affiche (comme ça si j'ai envie
d'écrire la même chaîne dans un fichier, je n'aurais pas à réécrire la
fonction en entier juste pour ça).

```tryocaml
let rec to_string e =
  match e with
    Plus (left, right)   -> "(" ^ (to_string left) ^ " + " ^ (to_string right) ^ ")"
  | Minus (left, right)  -> "(" ^ (to_string left) ^ " - " ^ (to_string right) ^ ")"

  | Times (left, right)  -> "(" ^ (to_string left) ^ " * " ^ (to_string right) ^ ")"
  | Divide (left, right) -> "(" ^ (to_string left) ^ " / " ^ (to_string right) ^ ")"

  | Value v -> v
  ;;

let print_expr e =
  print_endline (to_string e);;
```
(NB: L'opérateur `^` sert à concaténer les chaînes.)

Voilà la fonction d'affichage à l'oeuvre:

```tryocaml
# print_expr (Times (Value "n", Plus (Value "x", Value "y")));;
(n * (x + y))
```
La forme générale pour le filtrage est:

```tryocaml
match valeur with
  motif    ->  résultat
| motif    ->  résultat
    ...
```
Les motifs dans la colonne de gauche peuvent être simples, comme dans la
fonction `to_string` ci-dessus, ou plus complexe et imbriqués. L'exemple
suivant est notre fonction de distribution symbolique de la
multiplication des expressions de la forme `n * (x + y)` ou
`(x + y) * n`, et pour cela on va utiliser un motif imbriqué :

```tryocaml
let rec multiply_out e =
  match e with
    Times (e1, Plus (e2, e3)) ->
      Plus (Times (multiply_out e1, multiply_out e2),
            Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) ->
      Plus (Times (multiply_out e1, multiply_out e3),
            Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) -> Plus (multiply_out left, multiply_out right)
  | Minus (left, right) -> Minus (multiply_out left, multiply_out right)
  | Times (left, right) -> Times (multiply_out left, multiply_out right)
  | Divide (left, right) -> Divide (multiply_out left, multiply_out right)
  | Value v -> Value v
  ;;
```
La voilà en action:

```tryocaml
# print_expr (multiply_out (Times (Value "n", Plus (Value "x", Value "y"))));;
((n * x) + (n * y))
```
Comment est-ce que marche la fonction `multiply_out` ? L'essentiel se
trouve dans les deux premiers motifs. Le premier est
`Times (e1, Plus (e2, e3))` qui filtre les expressions de la forme
`e1 * (e2 + e3)`. Regardez la colonne de droite en face de ce motif, et
assurez vous que son contenu équivaut à `(e1 * e2) + (e1 * e3)`.

Le second motif fait la même chose pour les expressions de la forme
`(e1 + e2) * e3`.

Les autres motifs ne modifient pas la forme de l'expression, mais font
le travail nécessaire d'appeler la fonction `multiply_out` récursivement
sur leurs sous-expressions. Cela garantit que toutes les
sous-expressions de l'expression sont correctement transformées. (Si
vous n'étiez concernés que par la transformation de l'expression la plus
externe, tous ces motifs auraient pu être remplacés par une simple règle
`e -> e`).

Est-ce que l'on peut effectuer l'opération inverse (càd factoriser au
lieu de distribuer) ? Bien sûr ! (Mais c'est un peu plus compliqué...).
La version suivante ne marche que pour l'expression la plus externe.
Vous pourriez certainement l'améliorer pour gérer tous les niveaux de
sous-expressions, et des cas plus complexes :

```tryocaml
let factorize e =
  match e with
    Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 -> Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 -> Times (Plus (e1, e3), e4)
  | e -> e
  ;;

# factorize (Plus (Times (Value "n", Value "x"), Times (Value "n", Value "y")));;
- : expr = Times (Value "n", Plus (Value "x", Value "y"))
```
La fonction de factorisation ci-dessus introduit une paire de nouvelles
fonctionnalités. Vous pouvez ajouter ce qui s'appelle une **garde** à
chaque motif. Une garde est une condition précédée de `when`, et qui
signifie que le filtrage n'est fructueux que si le motif correspond *et*
la condition après la clause `when` est satisfaite.

```tryocaml
match valeur with
  motif      [ when condition ]   ->  résultat
  motif      [ when condition ]   ->  résultat
    ...
```
La seconde fonctionalité est l'opérateur `=` qui teste l'"égalité
structurelle" de deux expressions. Cela signifie qu'il descend
récursivement dans chacune de deux expressions pour vérifier qu'elles
sont identiques à tous les niveaux.

OCaml est capable de vérifier au moment de la compilation que tous les
cas sont couverts par vos motifs. J'ai modifié la définition du
`type expr` précédent pour y ajouter le constructeur `Product` :

```tryocaml
type expr = Plus of expr * expr        (* pour a + b *)
          | Minus of expr * expr       (* pour a - b *)
          | Times of expr * expr       (* pour a * b *)
      | Divide of expr * expr      (* pour a / b *)
      | Product of expr list       (* pour a * b * c * ... *)
          | Value of string            (* "x", "y", "n", etc. *)
      ;;
```
J'ai ensuite recompilé la fonction `to_string` sans modifications. OCaml
a renvoyé l'avertissement suivant :

```tryocaml
Warning: this pattern-matching is not exhaustive.
Here is an example of a value that is not matched:
Product _

```
