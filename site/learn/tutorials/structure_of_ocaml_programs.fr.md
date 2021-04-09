<!-- ((! set title Structure des programmes OCaml !)) ((! set learn !)) -->

*Table of contents*

# Structure des programmes OCaml
Maintenant nous allons passer un peu de temps à observer la structure
d'ensemble de quelque vrais programmes en OCaml. Je veux vous parler des
définitions locales et globales, quand utiliser `;;` ou `;`, les
modules, les fonctions imbriquées, les références. Pour cela nous allons
passer sur plein de concepts d'OCaml qui ne vous diront rien car nous ne
les avons pas encore évoqués. Ne vous embarrassez pas des détails pour
le moment. Occupez-vous uniquement de la forme générale des programmes,
et aux fonctionnalités mises en avant.

## « Variables » locales (*plus exactement* expressions locales)
Prenons la fonction `average` écrite en C, et ajoutons lui une variable
locale. (à comparer avec la première version que nous avions)

```C
double
average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
```
Faisons la même chose avec notre version OCaml :

```ocamltop
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
```
La formule standard `let nom = expression in` sert à définir une
expression locale nommée, et `nom` peut ensuite être utilisé dans la
fonction à la place de `expression` jusqu'au `;;` qui marque la fin du
bloc de code. Remarquez que nous n'avons pas changé l'indentation après
`in`. Considérez `let ... in` comme s'il s'agissait d'une instruction.

Maintenant, traduire les variables locales en C par ces expressions
locales est une supercherie. En fait ils sont un peu différents. La
variable C `sum` a un emplacement réservé dans la pile. Vous pouvez
changer la valeur associée à `sum` plus loin dans la fonction si vous
voulez, ou même prendre l'adresse de `sum`. Ce n'est PAS possible dans
la version OCaml. Dans la version OCaml, `sum` est juste une abréviation
pour l'expression `a +. b`. Il est impossible d'assigner ou de changer
la valeur de `sum`. (Nous verrons comment avoir de vraies variables un
peu plus loin).

Voyons un autre exemple qui devrait clarifier les choses. Les deux bouts
de code suivants devraient retourner la même valeur (à savoir (a+b) +
(a+b)<sup>2</sup>):

```ocamltop
let f a b =
  (a +. b) +. (a +. b) ** 2. ;;

let f a b =
  let x = a +. b in
  x +. x ** 2. ;;
```

Il se peut que la seconde version soit plus rapide (bien que la plupart
des compilateurs devraient être capable de faire cette étape
d'"élimination de sous-expressions communes" à votre place), et en tout
cas elle est plus lisible. Dans le second exemple, `x` est une
abréviation pour l'expression `a +. b`.


## « Variables » globales (*plus précisément* expressions globales)
Vous pouvez aussi donner des noms à des choses dans l'environnement
global, et comme pour les "variables" locales ci-dessus, ce ne sont pas
vraiment des variables, mais des abbréviations pour ces choses. Voici un
exemple pris dans un programme réel :

```ocaml
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
  | true -> html#set_font_style ~enable:[`BOLD] ()
  | false -> html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item "Cut" ~key:_X ~callback: html#cut
  ;;
```

Dans ce vrai morceau de code, `html` est un "widget" ("contrôle")
d'édition de HTML (un objet provenant de la bibliothèque lablgtk), créé
une fois pour toute au début du programme par la première instruction
`let html =`. Il y est ensuite fait référence dans plusieurs des
fonctions suivantes.

A noter que le nom `html` dans le bout de programme ci-dessus ne devrait
pas être comparé à une vraie variable globale comme en C ou dans
d'autres langages impératifs. Aucun emplacement n'est réservé pour
"stocker" le "pointeur sur `html`". Il n'est pas non plus possible
d'assigner quelque chose à `html`, par exemple pour lui faire désigner
un autre widget. Dans la section suivante nous parlerons des références,
qui sont de vraies variables.

## Let-binding (?)
Les utilisations de `let ...` aussi bien au niveau global que dans une
fonction, sont souvent appellées des **let-binding**.

## Références : les vraies variables
Comment faire si vous voulez une vraie variable que vous pouvez assigner
puis changer à votre gré dans votre programme ? Il vous faut une
**référence**. Les références sont similaires aux pointeurs en C/C++. En
Java, toutes les variables qui stockent des objets sont en fait des
références (pointeurs) sur ces objets. En Perl, les références sont des
références - comme en OCaml.

Voici comment créer une référence sur un entier (`int`) en OCaml :

```ocamltop
ref 0;;
```
En fait cette instruction n'est pas très utile. Nous avons créé une
référence et puis, comme elle n'a pas de nom, le glaneur de cellules a
fait son travail et l'a immédiatement libérée! (Il est même probable que
le compileur ait éliminé cette instruction à la compilation). Donnons un
nom à cette référence :

```ocamltop
let my_ref = ref 0;;
```
Cette référence contient maintenant l'entier 0. Mettons une autre valeur
à la place (assignement) :

```ocamltop
my_ref := 100;;
```
Voyons ce que la référence contient à présent :

```ocamltop
!my_ref;;
```
Donc l'opérateur `:=` est utilisé pour assigner les références, et `!`
pour les déréférencer et accéder au contenu. Voici une comparaison
approximative avec C/C++ :

```text
OCaml                   C/C++

let my_ref = ref 0;;    int a = 0; int *my_ptr = &a;
my_ref := 100;;         *my_ptr = 100;
!my_ref                 *my_ptr
```

Les références ont leurs usages, mais vous vous apercevrez que vous ne
les utiliserez pas si souvent. La plupart du temps, vous utiliserez
`let nom = expression in` pour nommer des expressions locales dans vos
définitions de fonctions.

## Fonctions imbriquées
Le langage C n'a pas réellement de notion de fonctions imbriquées. GCC
les supporte, mais je ne connais pas de programme qui en tire parti. En
tout cas, voici ce que la page info de gcc dit sur les fonctions
imbriquées :

Une « fonction imbriquée » est une fonction définie à l'intérieur d'une
autre fonction (les fonctions imbriquées ne sont pas supportées par GNU
C++.) Le nom de la fonction imbriquée est local au bloc dans lequel il
est défini. Par exemple, définissons une fonction imbriquée nommée
`square`, et appelons-là deux fois :

```C
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
```

La fonction imbriquée a accès à toutes les variables de la fonction
englobante qui sont visibles à l'emplacement de sa définition. Cela
s'appelle la « portée lexicale ». Par exemple, voici une fonction
imbriquée qui utilise une variable héritée nommée `offset` :

```C
bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i < size; i++)
    /* ... */ access (array, i) /* ... */
}
```
Vous comprenez l'idée. Les fonctions imbriquées sont, cependant, très
utiles et largement employées en OCaml. Voici un exemple d'utilisation
réel de fonction imbriquées :

```ocamltop
let read_whole_channel chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let newline = input_line chan in
    Buffer.add_string buf newline;
    Buffer.add_char buf '\n';
    loop ()
  in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf;;
```
Ne vous inquiétez pas de ce que ce code fait — il utilise beaucoup de
concepts que nous n'avons pas encore vu dans ce tutorial.
Concentrez-vous plutôt sur la fonction imbriquée principale nommée
`loop` qui ne prend qu'un argument unit. On peut appeler `loop ()`
depuis l'intérieur de la fonction `read_whole_channel`, mais elle n'est
pas définie en dehors de cette fonction. La fonction imbriquée peut
accéder aux variables définies dans la fonction principale (ici `loop`
accède au nom local `buf`.)

La syntaxe des fonctions imbriquées est la même que pour nommer les
expressions locales : `let nom arguments = définition de fonction in`.

Normalement, vous indenterez la définition de fonction, après être passé
à la ligne comme dans l'exemple précédent, et n'oubliez pas d'utiliser
`let rec` à la place de `let` si votre fonction est récursive (comme
dans cet exemple).

## Modules et `open`
OCaml est accompagné d'une quantité de modules amusants et intéressants,
de bibliothèques de code utile. Par exemple on y trouve une bibliothèque
pour dessiner des graphismes, interagir avec la collection de contrôles
de l'interface-utilisateur graphique, pour manipuler des grands nombres,
des structures de données, ou pour faire des appels systèmes POSIX. Ces
bibliothèques se trouvent dans `/usr/lib/ocaml/` (sous Unix en
tout cas). Pour ces exemples, nous allons nous concentrer sur un module
relativement simple appelé `Graphics`.

Le module `Graphics` est constitué de sept fichiers (sur mon système) :

```text
/usr/lib/ocaml/graphics.a
/usr/lib/ocaml/graphics.cma
/usr/lib/ocaml/graphics.cmi
/usr/lib/ocaml/graphics.cmx
/usr/lib/ocaml/graphics.cmxa
/usr/lib/ocaml/graphics.cmxs
/usr/lib/ocaml/graphics.mli
```
Pour l'instant occupons-nous de `graphics.mli`. C'est un fichier texte,
que vous pouvez donc lire dès à présent. Notez que son nom est
`graphics.mli` et non `Graphics.mli`. OCaml met automatiquement une
capitale au nom du fichier pour obtenir le nom du module. C'est
déroutant quand on ne le sait pas !

Il y a deux moyens pour utiliser les fonctions de `Graphics`. Ou bien on
commence son programme par la déclaration `open Graphics;;`, ou bien on
préfixe tous les appels de fonctions comme ceci : `Graphics.open_graph`.
`open` ressemble un peu à l'instruction `import` en Java, ou plus encore
comme l'instruction `use` en Perl.

Pour utiliser les module `Graphics` dans la boucle interactive, il
faut au préalable charger la librairie avec

```ocaml
#load "graphics.cma";;
```

Une paire d'exemples devrait éclaircir ce point. (Les deux exemples
dessinent des choses différentes — essayez-les). Remarquez que le
premier exemple appelle `open_graph` et le second `Graphics.open_graph`.

```ocaml
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)

open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;

(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
        if i = 1 then x_init
        else
                let x = iterate r x_init (i-1) in
                r *. x *. (1.0 -. x);;

for x = 0 to 639 do
        let r = 4.0 *. (float_of_int x) /. 640.0 in
        for i = 0 to 39 do
                let x_init = Random.float 1.0 in
                let x_final = iterate r x_init 500 in
                let y = int_of_float (x_final *. 480.) in
                Graphics.plot x y
        done
done;;

read_line ();;
```
Ces deux exemples utilisent des fonctionnalités dont nous n'avons pas
encore parlé : boucles "for" dans le style impératif, if-then-else, et
récursion. Nous en parlerons plus tard. Examinez-les cependant, et
essayez de comprendre (1) comment ils fonctionnent, et (2) comment
l'inférence de type aide à éliminer des bugs.

## Le module `Pervasives`
Il y a un module que vous n'avez jamais besoin d'ouvrir avec `open`,
c'est le module `Pervasives` (allez jeter un oeil sur
`/usr/lib/ocaml/VERSION/pervasives.mli`). Tous les symboles définis dans
le module `Pervasives` sont implicitement importés dans tous les
programmes OCaml.

## Renommage de modules
Que faire si vous voulez utiliser des symboles en provenance du module
`Graphics`, mais ne voulez pas tous les importer, et n'avez pas envie de
taper `Graphics.` à chaque fois ? Renommez le module avec cette astuce :

```ocaml
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
```
Cela devient vraiment utile quand vous voulez utiliser les symboles d'un
module imbriqué (les modules peuvent être imbriqués les uns dans les
autres, eux-aussi), mais ne voulez pas avoir à taper à chaque fois le
chemin d'accès au module imbriqué.

## L'opérateur de séquence `;`

Le point-virgule `;` est un opérateur, comme `+`.  Bon, pas tout à
fait comme `+` mais conceptuellement le même.  L'opérateur `+` a pour
type `int -> int -> int` — il prend deux entiers et retourne un entier
(la somme des deux entrées).  Le point-virgule `;` peut être vu comme
ayant le type `unit -> 'b -> 'b` — il prend deux valeurs et simplement
retourne la seconde, la première expression étant garantie d'être
évaluée avant la seconde.  C'est donc comme l'opérateur `,` (virgule)
en C.  Vous pouvez écrire `a; b; c; d` de la même manière que vous
pouvez écrire `a + b + c + d`.

C'est un de ces « sauts conceptuels » qui n'est pas toujours explicité
très bien : en OCaml, presque tout est une expression.  `if/then/else`
est une expression.  `a; b` est une expression.  `match foo with ...`
est une expression.  Le code qui suit est parfaitement légal (et
toutes les lignes font la même chose);

 ```ocamltop
 let f x b y = if b then x+y else x+0
 let f x b y = x + (if b then y else 0)
 let f x b y = x + (match b with true -> y | false -> 0)
 let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)
 let f = fun x -> fun b -> fun y -> if b then x+y else x+0
 let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
```

Notez particulièrement la dernière ligne où j'utilise l'opérateur `;`
pour « joindre » deux instructions.  Toutes les fonctions en OCaml
peuvent être déclarées sous la forme :

```ocaml
 let name [parameters] = expression ;;
```
En OCaml, la définition de ce qu'est une expression est simplement un
peu plus large qu'en C.  En fait, C a le concept d'« instructions » —
mais toutes les instructions en C sont simplement des expressions en
OCaml de type `unit` (combinées avec l'opérateur `;`).

La différence entre `;` et `+` est qu'on peut utiliser `+` comme une
fonction.  Par exemple, on peut définir une fonction `sum_list`, qui
somme une liste d'entier, par

```ocamltop
let sum_list = List.fold_left ( + ) 0 ;;
```

## La disparition de `;;`

Maintenant, nous allons nous pencher sur un point très important.
Tous les exemples ci-dessus finissaient par un double point-virgule
`;;`.  Cependant, si vous regardez à du code OCaml en dehors de ces
tutoriaux, vous trouverez de codes complets qui n'utilisent pas `;;`,
pas même une seule fois.

La vérité est que `;;` est principalement utilisé dans la boucle
interactive (*toplevel*) et les tutoriaux pour marquer la fin d'une
phrase OCaml et l'envoyer au toplevel pour évaluation.

En dehors du toplevel, l'usage de `;;` est, au mieux, infréquent et
n'est _jamais requis_ pour du code bien écrit.
En bref, le double point-virgule `;;` peut être utilisé pour trois
raisons :

* compatibilité avec le toplevel ;
* couper le code pour faciliter de débogage;
* introduire une expression « au plus haut niveau ».

Insérer `;;` peut parfois se révéler utile pour les débutants lors du
débogage vu qu'il conclut la définition en cours.  Dans l'exemple
suivant, la définition de `f` ne s'arrête pas à la ligne 1 à cause de
la virgule `,`.  Par conséquent, le compilateur va générer une erreur
à la fin de la seconde ligne :

```ocaml
let f x = x,
let g = x * x
```

Insérer un double point-virgule entre `f` et `g` sépare les
définitions de `f` de `g` :

```ocaml
let f x = x,
;;
let g = x * x
```

Un autre usage de `;;` est d'introduire une expression après des
définitions :

```ocaml
let b = "This started with"
let s = "a very nonsensical message.";;
print_endline b; print_endline s
open String
let s = concat "" ["Fortunately"; ", "; "the"; "end"; "is"; "near"; "."];;
print_endline s;;
let s = "let end here" in print_endline s
```

En particulier, dans les exemples ci-dessus, toutes les lignes
démarrant après un `;;` produisent des effets de bord et les effacer
changerait uniquement l'effet du code, pas des définitions.

Cependant, cette utilisation de `;;` peut (devrait) toujours être
remplacée par soit

```ocaml
let () = expression ()
```

si le résultat est de type `unit`, soit

```ocaml
let _ = expression ()
```

sinon.  Notez que la première forme est plus sure puisqu'elle requiert
que le type retourné par l'expression est `unit`, nous prémunissant,
par exemple, de l'oubli d'un argument comme dans

```ocaml
let () =
  print_newline
  (* Ici, nous avons oublié () et le compilateur va se plaindre. *)
```

Avec cette convention, il n'y a plus d'expressions « au plus haut
niveau » : tout module peut être écrit comme une suite de
définitions.  Par conséquent, des directives de style considèrent que
`;;` ne devrait jamais être utilisé en dehors de la boucle interactive
(voir par exemple « [style guidelines](guidelines.html) »).


## Toutes ces notions ensemble : un exemple de code réel
Dans cette section nous allons regarder quelques fragments de vrai code
pris dans la bibliothèque lablgtk 1.2. (Lablgtk est la bibliothèque
OCaml d'interfaçage avec la bibliothèque de widgets Gtk, native sous
Unix). Un avertissement : ces fragments utilisent beaucoup de concepts
que nous n'avons pas encore abordé. Ne vous arrêtez pas sur les détails,
regardez plutôt la forme générale du code, comment les auteurs ont
utilisé `;;`, où ils ont utilisé `;` et où ils ont utilisé `open`,
comment ils ont indenté le code, et utilisé des expressions nommées
locales ou globales.

... Je vais quand même vous donner quelques indices pour que vous ne
soyez pas totalement perdus !

* `?foo` et `~foo` est la façon de passer des paramètres optionels et
 nommés en OCaml. Il n'y a pas vraiment d'équivalent dans les
 langages de la famille de C, mais Perl, Python et Smalltalk
 permettent tous de nommer les arguments d'un appel de fonction, en
 oublier certains, et fournir les autres dans n'importe quel ordre.
* `foo#bar` est un appel de méthode (appel de la méthode nommée `bar`
 de l'objet nommé `foo`). C'est l'équivalent de `foo->bar`, ou
 `foo.bar` ou `$foo->bar` en C++, Java et Perl, respectivement.

Premier fragment : Le programmeur ouvre une paire de modules standards
(en omettant le `;;` parce que les mots clés suivants sont `open` et
`let`, respectivement). Il crée ensuite une fonction nommée
`file_dialog`. Dans cette fonction il définit une expression nommée
appelée `sel` en utilisant une instruction `let sel = ... in` de deux
lignes. Puis il appelle plusieurs méthodes de `sel`.

```ocaml
(* First snippet *)
open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
```
Deuxième fragment : Juste une longue liste de définitions au niveau
global. Remarquez que l'auteur a omis toutes les occurrences de `;;`
grâce à la règle n°2.

```ocaml
(* Second snippet *)

let window = GWindow.window ~width:500 ~height:300 ~title:"editor" ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu "File"
let edit_menu = factory#add_submenu "Edit"

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
```

Troisième fragment : L'auteur importe tous les symboles du module
`GdkKeysyms`. Puis nous avons un let-binding inhabituel.
`let _ = expression` signifie "évalue la valeur de expression (avec tous
les effets de bords que cela comporte), puis jette le résultat". En
l'occurrence, "calcule la valeur de l'expression" signifie exécuter
`Main.main ()` qui est la boucle principale de Gtk, qui a pour effet de
bord d'ouvrir la fenêtre de l'application à l'écran. Le "résultat" de
`Main.main ()` est sans importance - probablement la valeur `unit`, mais
je n'ai pas vérifié - et elle n'est retournée que quand l'application
est en train de se terminer.

Remarquez que dans ce fragment nous avons de longues successions de
commandes procédurales. C'est un programme impératif classique.

```ocaml
(* Third snippet *)

open GdkKeysyms

let _ =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item "Open..." ~key:_O ~callback:editor#open_file;
  factory#add_item "Save" ~key:_S ~callback:editor#save_file;
  factory#add_item "Save as..." ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item "Quit" ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item "Copy" ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item "Cut" ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item "Paste" ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item "Word wrap" ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev ->

      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
```
