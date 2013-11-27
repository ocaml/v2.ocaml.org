<!-- ((! set title Notions de base  !)) ((! set learn !)) -->

*Table of contents*

# Notions de base
## Commentaires
Les commentaires OCaml sont délimités par `(*` et `*)`, comme ceci:

```ocaml
(* Ceci est une ligne de commentaire. *)

(* Ceci est
 * un commentaire
 * multi-ligne.
 *)
```
Autrement dit, les commentaires ressemblent fortement aux commentaires
du C traditionnel (`/* ... */`).

Il n'y a pas actuellement de syntaxe pour les commentaires de fin de
ligne comme `# ...` en Perl ou `// ...` en C99/C++/Java. L'emploi de
`## ...` a été évoqué à quelques occasions, et je recommande fortement à
l'équipe d'OCaml d'ajouter ça dans les versions à venir.

OCaml prend en compte les commentaires imbriqués, ce qui permet
facilement de mettre des portions de code en commentaire:

```ocaml
(* Ce code n'est pas au point...

(* Test de primalité. *)
let is_prime n =
  (* pense-bête: demander ça aux mailing lists *) XXX;;

*)
```

## Appels de fonctions
Supposons que vous ayez écrit une fonction nommée `repeated`, qui prend
en argument une chaîne de caractères `s` et un nombre `n` et renvoie une
nouvelle chaîne de caractères qui contient l'originale répétée `n` fois.

Dans la plupart des languages dérivés du C, un appel de fonction
ressemble à ça :

```C
repeated ("hello", 3)  /* c'est du code C */
```

Ca veut dire « appelle la fonction `repeated` avec deux arguments, le
premier étant la chaîne de caractères hello et le second étant le nombre
3 ».

OCaml, tout comme d'autres langages fonctionnels, écrit et parenthèse
différemment les appels de fonctions, ce qui entraîne bien des erreurs
au début. Voici le même appel de fonction en OCaml :

```ocaml
repeated "hello" 3  (* c'est du code OCaml *)
```
Notez-bien : **pas** de parenthèses, et **pas** de virgule entre les
arguments.

Maintenant ce qui est source de confusion est que
`repeated ("hello", 3)` **a un sens** particulier en OCaml. Cela
signifie « appelle la fonction `repeated` avec UN argument, cet argument
étant une structure représentant un couple d'éléments ». Bien sûr ce
serait ici une erreur puisque la fonction `repeated` attend 2 arguments
et non un seul, et que quoi qu'il en soit le premier argument doit être
une chaîne de caractères et non un couple. Mais laissons de côté les
couples (n-uplets) pour le moment. Retenez plutôt que c'est une erreur
de mettre des parenthèses et des virgules autour des arguments de
fonctions.

Intéressons-nous maintenant à une autre fonction -
`get_string_from_user` - qui prend en argument une chaîne de caractères
qui demande à l'utilisateur de taper quelque chose et renvoie la chaîne
de caractère ainsi entrée. Nous voulons passer cette chaîne de
caractères à la fonction `repeated`. Voici les versions C et OCaml :

```C
/* code C: */
repeated (get_string_from_user
           ("Veuillez entrer une chaîne de caractères."), 3)
```
```ocaml
(* code OCaml: *)
repeated (get_string_from_user
           "Veuillez entrer une chaîne de caractères.") 3
```
Soyez attentif au parenthésage et à l'absence de virgules. En général la
règle est la suivante : « mettez des parenthèses autour de tout l'appel
de fonction - ne mettez pas de parenthèses autour des arguments passés à
une fonction ». Voici quelques exemples supplémentaires :

```
f 5 (g "hello") 3    (* f a 3 arguments, g a un argument *)
f (g 3 4)            (* f a un argument, g a 2 arguments *)

# repeated ("hello", 3);;     (* OCaml va repérer l'erreur *)
This expression has type string * int but is here used with type string
```

## Définir une fonction
Vous savez tous comment on définit une fonction (ou une méthode
statique, pour ceux qui pensent en Java) dans d'autres langages. Comment
fait-on ça en OCaml ?

La syntaxe d'OCaml est agréablement concise. Voici une fonction qui
prend deux nombres flottants et calcule leur moyenne :

```ocaml
let average a b =
  (a +. b) /. 2.0
```
Tapez ceci dans le « toplevel » OCaml (sous Unix, tapez `ocaml` depuis
le shell) et voici ce que vous verrez :

```ocamltop
let average a b =
  (a +. b) /. 2.0
```
Si vous regardez la définition de fonction d'un peu plus près, et aussi
ce qu'OCaml vous affiche, vous devez vous posez un certain nombre de
questions :

* Que font ces points insérés après + et / ?
* Qu'est-ce `float -> float -> float` peut bien vouloir dire ?

Je vais répondre à toutes ces questions dans les sections qui viennent,
mais commençons plutôt par définir la même fonction en C (la version
Java serait très semblable à la version C), et normalement ça devrait
soulever encore plus d'interrogations. Voici notre version C de
`average`:

```C
double average (double a, double b)
{
  return (a + b) / 2;
}
```
Maintenant revenez sur la définition OCaml vue précédemment. Vous
devriez vous demander :

* Pourquoi n'a-t-on pas besoin de définir les types de `a` et `b` dans
 la version OCaml ? Comment OCaml fait-il pour connaître leurs types,
 et au fait le sait-il au moins, ou est-ce que OCaml est typé
 dynamiquement ?
* En C, le `2` est implicitement converti en un `double`, mais
 pourquoi OCaml ne fait-il pas la même chose ?
* Comment écrit-on un `return` en OCaml ?

OK, voyons ça.

* OCaml est un langage fortement typé (en d'autres mots, il n'y a rien
 de dynamique concernant les types, comme ce serait le cas en Perl).
* OCaml utilise un mécanisme d'*inférence de types*, c'est-à-dire
 qu'il devine les types tout seul. Si vous utilisez le toplevel OCaml
 comme précédemment, alors OCaml vous donnera [ce qu'il pense
 être...] le type correct de votre fonction.
* OCaml ne fait pas de conversions de types implicites. Si vous voulez
 un flottant, vous devez écrire `2.0` parce que `2` est un entier.
* Parce qu'OCaml ne permet pas la surcharge (overloading)
 d'opérateurs, il a deux opérateurs différents pour signifier «
 ajoute deux entiers » (c'est +) et « ajoute deux flottants » (c'est
 +. - notez bien le point). Et c'est la même chose pour les autres
 opérateurs arithmétiques.
* OCaml renvoie la dernière expression de la fonction, donc pas besoin
 d'écrire `return` comme en C.

Les détails sur tout ça vont être expliqués dans les sections et
chapitres qui suivent.

## Types de base
En OCaml les types de base sont:

```
Type OCaml     Intervalle de définition

int            Entier avec signe 31 bits (environ +/- 1 milliard) avec processeurs 32 bits
               ou bien 63 bits avec processeurs 64 bits
float          Nombre à virgule flottante double-précision IEEE, équivalent au type double du C
bool           Un booléen, noté true (vrai) ou false (faux)
char           Un caractère à 8 bits
string         Une chaîne de caractères à 8 bits
unit           Valeur unique notée ()
```

Un des bits de chaque `int` est utilisé en interne par OCaml pour la
gestion de la mémoire (garbage collection ou récupération automatique de
mémoire). C'est pourquoi le type `int` a 31 bits au lieu de 32 (63 si
vous utilisez une plate-forme 64 bits). En pratique ce n'est un problème
que dans quelques cas très spécifiques. Par exemple si vous comptez des
choses en utilisant une boucle, OCaml vous limite à compter un milliard
d'éléments au lieu de 2 milliards. Ce n'est pas un problème parce que si
vous comptez autant de choses dans n'importe quel langage vous devriez
de toute façon utiliser des entiers à précision infinie (modules `Nat`
et `Big_int` en OCaml). Néanmoins si vous avez besoin de manipuler des
types avec exactement 32 bits (par exemple si vous écrivez du code pour
faire de la cryptographie ou pour des protocoles réseau), OCaml fournit
un type `nativeint` qui correspond exactement au type d'entiers
correspondant à votre plate-forme.

OCaml n'a pas de type de base pour les entiers sans signe (unsigned),
mais vous pouvez obtenir le même effet en utilisant `nativeint`. OCaml
n'a pas non plus de type flottant simple précision.

OCaml fournit un type `char` qui est utilisé pour les caractères, comme
par exemple `'x'`. Malheureusement le type `char` ne permet pas de
représenter les caractères Unicode puisqu'il ne supporte que 256
caractères différents. C'est un problème important qui n'est pas résolu
au niveau d'OCaml directement, mais cependant il y a des
[bibliothèques](http://camomile.sourceforge.net/ "http://camomile.sourceforge.net/")
qui fournissent des types et des fonctions pour manipuler les caractères
Unicode et leurs différents encodages.

Les strings ne sont pas des listes de caractères. Elles ont leur propre
représentation interne qui est particulièrement efficace.

Le type `unit` est en quelque sorte l'équivalent de `void` en C, nous en
reparlerons plus tard.

## Conversions de types implicites ou explicites
Dans les langages dérivés du C, les ints se retrouvent convertis en
flottants dans certaines circonstances. Par exemple si vous écrivez
`1 + 2.5` le premier argument (qui est un entier) est converti en
flottant, et le résultat est également un flottant. C'est comme si vous
aviez écrit `((double) 1) + 2.5`, mais cela s'est fait implicitement.

OCaml ne fait jamais ce genre de conversion implicites (implicit casts).
En OCaml, `1 + 2.5` est une erreur de type. L'opérateur `+` en OCaml
requiert deux arguments entiers, et si on lui donne un int et un float,
il indique cette erreur :

```ocamltop
1 + 2.5;;
```
Cela signifie "ceci est un float, mais ici j'attendais un int".

Pour ajouter deux floats, il faut utiliser un opérateur différent, `+.`
(notez le point qui suit le plus).

OCaml ne convertit pas les ints en floats automatiquement, donc le code
suivant est également incorrect :

```ocamltop
1 +. 2.5;;
```
Dans ce cas OCaml se plaint du premier argument.

Comment faire alors si on veut vraiment ajouter un int à un float ?
(Supposons qu'ils soient stockés dans des variables appelées `i` et
`f`). En OCaml la conversion doit être explicite :

```ocaml
float_of_int i +. f;;
```
`float_of_int` est une fonction qui prend un `int` et renvoie un
`float`. Il y a toute une collection de fonctions de ce genre, comme par
exemple `int_of_float`, `char_of_int`, `int_of_char`, `string_of_int` et
ainsi de suite, et elle font essentiellement ce qu'on attend d'elles.

Puisque convertir un `int` en un `float` est une opération
particulièrement courante, la fonction `float_of_int` a également un
autre nom, plus court : l'exemple ci-dessus aurait pu simplement être
écrit

```ocaml
float i +. f;;
```
(Remarquez bien que contrairement au C, en OCaml il est parfaitement
possible qu'un type et qu'une fonction portent le même nom.)

###  Qu'est-ce qui est mieux, conversion implicite ou explicite ?
Vous être peut-être en train de vous dire que ces conversions explicites
sont lourdes, peut-être même qu'elles font perdre du temps, et c'est
justifié, mais il y a au moins deux arguments en leur faveur.
Premièrement, OCaml a besoin de cette conversion explicite pour
l'inférence de type (voir plus bas), et l'inférence de type permet de
gagner énormément de temps de développement, et taper un peu plus au
clavier est une perte insignifiante à côté. Deuxièmement, si vous avez
passé du temps à débugger des programmes C vous devez savoir que (a) les
conversions (« casts ») implicites entraînent des erreurs qui sont
difficiles à détecter, et (b) vous passez alors une bonne partie du
temps à vous demander où les conversions ont lieu. Les rendre explicites
vous aide donc pour le débuggage. Troisièmement, certaines conversions
(notamment int \<-\> float) sont vraiment des opérations coûteuses. Cela
ne vous rapporte pas grand-chose de les cacher.

## Fonctions ordinaires et fonctions récursives
Contrairement au langage C et ses dérivés, une fonction en OCaml n'est
récursive que si vous le précisez en utilisant `let rec` au lieu de
seulement `let`. Voici un exemple de fonction récursive :

```ocamltop
let rec range a b =
  if a > b then []
  else a :: range (a+1) b
  ;;
```
Remarquez que `range` s'appelle elle-même.

La seule différence entre `let` et `let rec` est au niveau de la
visibilité du nom de la fonction. Si la fonction ci-dessus avait été
définie avec `let` tout seul, alors l'appel à `range` aurait essayé de
trouver une fonction nommée `range` précédemment définie, et pas la
fonction en cours de définition. Il n'y a pas de différence de
performance entre les fonctions définies avec `let` et celles définies
avec `let rec`, donc si vous préférez vous pouvez toujours utiliser la
forme `let rec` et vous aurez ainsi la même sémantique qu'en C et
dérivés.

## Types des fonctions
Du fait de l'inférence de type, vous n'aurez presque jamais à écrire le
type de vos fonctions. Cependant OCaml affiche fréquemment ce qu'il
pense être le type de vos fonctions, donc il vous faut connaître la
syntax qu'il utilise. Pour une fonction `f` qui prend comme arguments
`arg1`, `arg2`, ... `argn`, et retourne quelque chose de type `rettype`,
le compilateur affichera :

```ocaml
f : arg1 -> arg2 -> ... -> argn -> rettype
```
Cette syntaxe avec des flèches peut vous paraître étrange pour
l'instant, mais lorsque nous parlerons de l'application partielle, vous
verrez pourquoi ça a été choisi comme ça. Pour le moment, voici
simplement quelques exemples.

Notre fonction `repeated` qui prend une chaîne de caractères et un
entier et renvoie une chaîne de caractères a le type suivant :

```ocaml
repeated : string -> int -> string
```
Notre fonction `average` qui prend deux flottants et renvoie un flottant
a le type suivant :

```ocaml
average : float -> float -> float
```
La fonction de conversion OCaml standard `int_of_char` a le type suivant
:

```ocaml
int_of_char : char -> int
```
Si une fonction ne renvoie rien (`void` pour les programmeurs C et
Java), on écrit qu'elle renvoie le type `unit`. Voici par exemple
l'équivalent OCaml de `fputc` :

```ocaml
output_char : out_channel -> char -> unit
```
###  Fonctions polymorphes
Voyons maintenant quelqu'un d'un peu plus étrange. Que pensez-vous d'une
fonction qui prend *n'importe quoi* comme argument ? Voici une fonction
bizarre qui prend un argument, l'ignore et renvoie toujours 3 :

```ocaml
let give_me_a_three x = 3;;
```
Quel est le type de cette fonction ? En OCaml on utilise une notation
spéciale pour dire « le type que vous voulez ». C'est un caractères
apostrophe suivi d'une lettre. Le type de la fonction ci-dessus s'écrit
donc normalement comme ceci :

```ocaml
give_me_a_three : 'a -> int
```
où `'a` est mis pour n'importe quel type. Vous pouvez par exemple
utiliser cette fonction comme ceci: `give_me_a_three "foo"`, ou comme
cela: `give_me_a_three 2.0`, et les deux sont tout-à-fait valides en
OCaml.

Pour le moment l'utilité des fonctions polymorphes n'est pas évidente,
mais elles sont vraiment très utiles et très communes, nous en parlerons
plus tard. (nous verrons que c'est un peu comme les templates en C++ ou
les generics en Java 1.5).

## Inférence de types
Donc le thème de ce tutoriel est que les langages fonctionnels ont un
tas de Fonctionnalités Vraiment Cool, et OCaml est un langage qui a tous
ces Trucs Bien Sympas en même temps, ce qui en fait un langage très
pratique pour les programmeurs. Mais le plus bizarre est sans doute que
la plupart de ces propriétés avantageuses n'ont en fait rien à voir avec
la « programmation fonctionnelle ». Quoi qu'il en soit, voici donc le
premier de ces Trucs Bien Sympas: l'inférence de types.

En deux mots : vous n'avez pas besoin de déclarer le type de vos
fonctions et variables puisqu'OCaml fait ça pour vous.

En plus OCaml vérifie que tous vos types collent bien entre eux, même
entre différents fichiers.

Et comme OCaml est aussi un langage pratique, il fournit également
certains moyens pour contourner le système de types et ses
vérifications, pour les (très) rares cas où cela est nécessaire. Il n'y
a probablement que les gourous qui auront éventuellement besoin de
pratiquer ce genre de sport.

Retournons maintenant à la fonction `average` que nous avions tapé ainsi
dans le toplevel :

```ocamltop
let average a b =
  (a +. b) /. 2.0
```
Oh merveille ! OCaml a deviné tout seul que la fonction prend deux
arguments de type `float` et renvoie un `float`.

Comment a-t-il fait ? Tout d'abord il regarde où `a` et `b` sont
utilisés, en l'occurrence dans l'expression `(a +. b)`. Ensuite, étant
donné que `+.` est lui-même une fonction qui prend deux arguments de
type `float`, il en déduit simplement que `a` et `b` doivent être de
type `float`.

Après ça, la fonction `/.` renvoie un `float`, qui est également la
valeur de retour de la fonction `average`. Donc `average` doit renvoyer
un `float`. En conclusion, le type de `average` correspond à la
signature suivante :

```ocaml
average : float -> float -> float
```
L'inférence de types est bien sûr assez simple pour un programme aussi
court, mais elle fonctionne aussi pour les programmes de grande taille.
C'est une des qualités majeures du langage parce que ça supprime toute
une classe d'erreurs qui produisent des segfaults,
`NullPointerException`s et autres `ClassCastException`s dans d'autres
langages (ou bien des warnings bien souvent ignorés comme en Perl).


