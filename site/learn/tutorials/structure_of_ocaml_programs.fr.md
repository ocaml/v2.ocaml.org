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

## Utiliser et omettre `;;` et `;`
Maintenant nous allons aborder un problème important. Quand utiliser
`;;`, quand utiliser `;`, et quand n'utiliser aucun des deux ? C'est une
question tordue, qui m'a également embêté pendant longtemps alors que
j'apprenais le langage OCaml.

La règle n°1 est que vous devriez utiliser `;;` pour séparer les
instructions de niveau général dans votre code, et *jamais* au milieu
d'une définition de fonction ou d'aucune autre instruction.

Reprenons un bout du second exemple graphique précédent:

```ocamltop
Random.self_init ();;
Graphics.open_graph " 640x480";;

let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x);;
```

Nous avons deux instructions au niveau global et une définition de
fonction (la fonction nommée `iterate`). Chacune est suivie par `;;`.

La règle n°2 est que *parfois* vous pouvez omettre `;;`. En tant que
débutant vous pouvez vous dispenser de cette règle - et toujours
utiliser `;;` comme prescrit par la règle n°1. Mais puisque vous aurez
sûrement à lire du code écrit par d'autres, vous devez savoir que `;;`
peut parfois être omis. Les endroits où cela est possible sont :

* Avant le mot clé `let`.
* Avant le mot clé `open`.
* Avant le mot clé `type`.
* À la toute fin du fichier
* À quelques (très rares) endroits où OCaml peut deviner que ce qui
 vient ensuite est une nouvelle instruction et non la suite de
 l'instruction courante.

Voici un exemple de code correct, où `;;` a été omis quand c'était
possible :

```ocaml
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph " 640x480"         (* ;; *)

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

read_line ()                  (* ;; *)
```

Les règles n°3 et n°4 concernent le simple `;`. Il n'a rien à voir avec
`;;`. Le point-virgule simple `;` est le **séparateur de séquence**,
c'est à dire qu'il a le même rôle que le point-virgule en C, C++, Java
ou Perl. Il signifie "fait ce qu'il y a avant en premier, et quand c'est
terminé, fait ce qu'il y a après". Je suis sûr que vous l'ignoriez.

La règle n°3 est : Considérez `let ... in` comme une instruction, et ne
mettez jamais un simple `;` après lui.

La règle n°4 est : Pour tous les autres instructions dans un bloc de
code, faites-les suivre par un simple `;`, *à l'exception* de la
dernière.

La boucle for interne de notre exemple ci-dessus est une bonne
démonstration. Remarquez que nous n'utilisons jamais de simple `;` dans
ce code :

```ocaml
for i = 0 to 39 do
  let x_init = Random.float 1.0 in
  let x_final = iterate r x_init 500 in
  let y = int_of_float (x_final *. 480.) in
  Graphics.plot x y
done
```
Le seul endroit dans ce code où on pourrait imaginer mettre un `;` est
après `Graphics.plot x y`, mais comme c'est la dernière instruction de
son bloc, la règle n°4 nous dit qu'il ne faut pas le faire.

**Remarque à propos de ";"** Brian Hurt m'a écrit pour me corriger au
sujet de ";"

`;` est un opérateur, au même titre que `+` est un opérateur. Enfin,
peut-être pas tout à fait, mais conceptuellement ils sont de même
nature. `+` est de type `int -> int -> int` - il prend deux entiers et
retourne un entier (leur somme). `;` est de type `unit -> 'b -> 'b` - il
prend deux valeurs et retourne uniquement la seconde. Un peu comme
l'opérateur `,` (virgule) en C. Ecrire `a ; b ; c ; d` est aussi naturel
que d'écrire ` a + b + c + d`.

C'est un de ces "sauts conceptuels" qui ne sont jamais explicités
clairement - en OCaml, quasiment tout est une expression. `if/then/else`
est une expression. `a ; b` est une expression. `match foo with ...` est
une expression. Les codes suivants sont parfaitement légaux (et tous
font la même chose) :

```ocaml
let f x b y = if b then x+y else x+0

let f x b y = x + (if b then y else 0)

let f x b y = x + (match b with true -> y | false -> 0)

let f x b y = x + (let g z = function true -> z | false -> 0 in g y b)

let f x b y = x + (let _ = y + 3 in (); if b then y else 0)
```

Notez tout particulièrement la dernière fonction — j'utilise `;` comme
opérateur pour "joindre" deux instructions. En OCaml, toutes les
fonctions peuvent être exprimées par :

```ocaml
let nom [paramètres] = expression
```
La définition de ce qu'est une expression en OCaml est juste un peu plus
large qu'en C. En fait, C a un concept d'"instruction" - mais toutes les
instructions du C sont des expressions en OCaml (combinées avec
l'opérateur `;`).

Une différence entre `;` et `+` est que je peux utiliser `+` comme une
fonction. Par exemple, je peux définir une fonction `sum_list` pour
calculer la somme d'une liste d'entier comme ceci :

```ocamltop
let sum_list = List.fold_left ( + ) 0
```
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
