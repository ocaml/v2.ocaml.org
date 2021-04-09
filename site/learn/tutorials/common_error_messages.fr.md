<!-- ((! set title Messages d'erreur courants !)) ((! set learn !)) -->

*Table of contents*

Messages d'erreurs les plus courants
====================================

Cette page fournit une brève explication à propos de certains messages
d'erreurs ou d'avertissements des compilateurs OCaml. De plus amples
informations sont généralement accessibles sur les pages spécifiques de
ce tutorial.

## Erreurs de types.

### This expression has type... but is here used with type...

(cette expression est du type... mais est considérée ici comme étant du
type...)

Lorsque le type d'un objet est incohérent dans le contexte
d'utilisation, on obtient souvent ce type de message:

```ocamltop
1 + 2.5
```

« This expression has type X but is here used with type Y » signifie que
le contenu de la seule expression `2.5` est de type X (ici `float`).
Cependant le contexte (c'est-à-dire ce qui entoure l'expression, ici :
« 1 + ... ») indique que le type de l'objet à insérer à la place des ...
est de type Y (`int`) qui n'est pas compatible avec le type X.

Le message suivant est plus étonnant :

    This expression has type my_type but is here used with type my_type

Cette erreur apparaît souvent lors des tests de définition de type en
toplevel. OCaml accepte volontiers de définir un type portant le même
nom qu'un type déjà existant. Prenons par exemple les instructions
suivantes:

```ocamltop
type my_type = A | B;;
let a = A;;
type my_type = A | B;;
let b = B;;
a = b;;
```

Pour le compilateur, la seconde définition de `my_type` est indépendante
de la première. Nous avons donc deux types portant le même nom. Puisque
`a` est défini avant le second `my_type`, il appartient à la première
catégorie de `my_type`.  `b` en revanche appartient à la seconde.  Dans cet
exemple, nous pouvons régler le problème en redéfinissant `a` après la
seconde définition de `my_type`.  Ce genre de problème ne devrait pas
apparaître dans de véritables programmes, du moment que l'on n'utilise
pas le même nom pour des types différents au sein du même module, ce qui
est fortement déconseillé !

### Warning: This optional argument cannot be erased

(Avertissement: Cet argument ne peut être omis)

Les fonctions utilisant des arguments optionnels doivent posséder au
moins un argument non facultatif. Ainsi, l'exemple suivant est
incorrect:

```ocamltop
let f ?(x = 0) ?(y = 0) = print_int (x + y);;
```

La solution consiste simplement à ajouter un argument de type unit:

```ocamltop
let f ?(x = 0) ?(y = 0) () = print_int (x + y);;
```

(Cf. la page Etiquettes pour plus de détails sur les arguments
optionnels.)

### The type of this expression, ..., contains type variables that cannot be generalized

(Le type de cette expression, ..., contient des variables dont le type
ne peut être identifié)

Ceci ce produit lorsque le type complet d'un objet reste en partie
inconnu du compilateur quand celui-ci atteint la fin de la compilation.
Par exemple:

```ocaml
let x = ref None
```
soulève le message suivant lors de la compilation :

    The type of this expression, '_a option ref,
    contains type variables that cannot be generalized

La solution consiste alors à aider le compilateur en précisant le type,
ici:

```ocaml
let x : string option ref = ref None
```
ou bien:

```ocaml
let x = ref (None : string option)
```
Cependant les données de type `'_a` peuvent être autorisées
temporairement, en toplevel par exemple. Un objet donné possède ainsi un
type inconnu mais il ne peut pas être n'importe lequel, il n'est donc
pas polymorphique. En toplevel, notre exemple donne alors:

```ocamltop
let x = ref None
```

Le compilateur nous indique que le type de x n'est pas totalement connu
jusqu'à présent. Cependant, une utilisation ultérieure de x permettra au
compilateur de le préciser:

```ocamltop
x := Some 0
```

x est à présent de type connu:

```ocamltop
x
```

Des détails supplémentaires sont disponibles dans la [FAQ
OCaml](http://mirror.ocamlcore.org/caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles "http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html#variables_de_types_faibles").

## Erreurs et avertissement des pattern matching (filtrage de motifs)

### This pattern is unused

(Ce cas ne sera pas utilisé)

Cet avertissement peut être considéré comme une erreur puisqu'il n'y
aucune raison de garder une telle ligne de code. Elle apparaît, par
exemple, lorsque le programmeur utilise un cas 'attrape-tout' avant un
autre cas:

```ocamltop
let test_member x tup =
  match tup with
  | (y, _) | (_, y) when y = x -> true
  | _ -> false
```

Manifestement, le programmeur a une mauvaise conception de la
reconnaissance de motifs en OCaml. Il faut se rappeler des règles
suivantes :

-   L'arbres des cas est parcouru de façon linéaire, de droite à gauche.
    Il n'y a en aucun cas de *backtracking* (retour en arrière) sembable à
    la reconnaisance d'expression régulière.
-   Une clause de garde (`when`) ne fait pas partie du motif. Il s'agit
    d'une condition, évaluée au plus une fois, permettant de
    poursuivre ou non dans le traitement du motif reconnu.
-   Les identifiants en minuscules (ici `y`) sont juste des noms et sont
	donc toujours reconnus.

Dans l'exemple précédent, il est désormais évident que seul le premier
morceau sera testé. On obtient ainsi :

```ocamltop
test_member 1 (1, 0);;
test_member 1 (0, 1);;
```

### This pattern matchnig is not exhausive

(La disjonction de cas n'est pas exhaustive, complète)

La reconnaissance de motifs d'OCaml permet de vérifier si une
disjonction de cas traite l'ensemble des possibilités offertes par le
type du motif. Dans l'exemple qui suit, le compilateur ignore quel est
l'ensemble des résultats possibles de l'opérateur `mod` (car `mod`
renvoie des entiers, donc pour le compilateur, tous les entiers
devraient être traités) :

```ocamltop
let is_even x =
  match x mod 2 with
  | 0 -> true
  | 1 | -1 -> false
```

Une solution spécifique sans reconnaissance de motif serait ici:

```ocaml
let is_even x = x mod 2 = 0
```
De façon générale, une telle solution n'est pas envisageable et on
préfèrera ajouter une ligne « attrape-tout » qui ne devrait pas être
atteinte (même si le compilateur l'ignore) :

```ocaml
let is_even x =
  match x mod 2 with 
  | 0 -> true
  | 1 | -1 -> false
  | _ -> assert false
```

## Problèmes de recompilation de programmes corrects

### x.cmi is not a compiled interface

(le module `x.cmi` n'est pas un fichier interface compilé)

Lors de la recompilation de vieux programmes il est possible d'obtenir
le messge suivant:

    some_module.cmi is not a compiled interface

Ceci siginfie que le module `some_module` n'est pas valide, selon la
*version actuelle* du compilateur OCaml. La plupart du temps,
retirer les vieux fichiers (`*.cmi`, `*.cmo`, `*.cmx`,...) et recompiler
suffit à résoudre le probème.

### Warning: Illegal backslash escape in string

(Attention: La chaîne contient un caractère d'échappement illégal)

Les versions récente d'OCaml nous mettent en garde contre les
backslashes (`\\`) dans les chaînes de caractères qui devraient être
doublés. Ceci apparaît lorsque un motif `\\x` est trouvé par le
compilateur ou `\\x` n'est pas un caractère reconnu, le programmeur doit
alors écrire `\\\\x` afin de faire apparaître `\\x` à l'écran.

```ocamltop
"\e\n" (* bad practice *);;
"\\e\n" (* good practice *)
```

Ce genre de message apparait lors de la recompilation de vieux
programmes, et peut etre désactivé à l'aide l'argument `-w x` en ligne
de commande.
