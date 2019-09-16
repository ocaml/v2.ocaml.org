<!-- ((! set title Modules !)) ((! set learn !)) -->

*Table of contents*

# Modules

## Usage standard

Avec OCaml, tout programme est contenu dans un module. Un module peut
même être, plus rarement, un sous-module d'un autre, à la manière d'une
arborescence de dossiers imbriqués les uns dans les autres.

Lorsqu'on écrit un programme, avec par exemple deux fichiers
`amodule.ml` et `bmodule.ml`, ceux ci définissent deux
modules, intitulés respectivement `Amodule` et `Bmodule`,
possédant le même contenu que nos fichiers.

Prenons par exemple le fichier amodule.ml suivant :

```ocaml
let hello () = print_endline "Hello"
```

ainsi que le fichier bmodule.ml :

```ocaml
Amodule.hello ()
```

En général, les fichiers sont compilés un par un, comme ceci :

```shell
ocamlopt -c amodule.ml
ocamlopt -c bmodule.ml
ocamlopt -o hello amodule.cmx bmodule.cmx
```

Nous avons à présent un petit exécutable pouvant afficher
« Hello ».  Comme on l'a constaté, on accède à n'importe quoi dans un
module donné en appelant le nom du module (qui commence toujours par
une majuscule) suivi d'un point et du nom de l'objet utilisé. Cet
objet peut être une variable, un type ou tout autre chose définie au
sein du module.

Les librairies (bibliothèques), notament la bibliothèque standard,
fournit un certain nombre de modules. Par exemple, `List.iter`
désigne la fonction `iter` définie au sein du module `List`.
Si jamais on souhaite utiliser de façon intensive un module, on peut
désirer se passer de l'appel de son nom; il suffit pour cela d'utiliser
l'instruction `open`.  En poursuivant notre exemple,
`bmodule.ml` pourrait contenir :

```ocaml
open Amodule;;
hello ()
```

Notons que beaucoup de programmeurs « oublient » les `;;`, il est plus
courant d'écrire

```ocaml
open Amodule
let _ = hello ()
```

L'usage de l'instruction `open` n'est qu'une question de goût.
Certains modules proposent des noms déjà utilisés dans d'autres modules.
Ainsi le module `List` contient des fonctions aux noms assez
courants dans les autres modules, aussi on n'écrit assez rarement
`open List`. D'autres comme `Printf` utilise des noms très
spécifiques, suffisament rares pour ne pas créer de conflits avec
d'autres modules; pour éviter d'écrire `Printf.printf` on préfera
utiliser `open Printf` en début de fichier :

```ocaml
open Printf
let my_data = [ "a"; "beautiful"; "day" ]
let _ = List.iter (fun s -> printf "%s\n" s) my_data
```

## Interfaces modulaires et signatures.

Un module peut fournir un grand nombre d'éléments (fonctions, types,
sous modules, variables...) au programme qui l'utilise. Par défaut, tous
les objets définis au sein du module seront accessibles depuis
« l'extérieur ». Ceci peut être utile dans de petits programmes, mais il
est préférable qu'un module ne propose que ce qu'il est conçu pour
proposer, sans le fouillis des fonctions auxiliaires ou variables
temporaires. Pour cela, nous pouvons définir une interface modulaire,
qui se comporte comme un filtre entourant le module. De la même façon
qu'un module vient d'un fichier `.ml`, l'interface corespondante
(et sa signature) viennent d'un fichier `.mli`. Il contient la
liste des valeurs avec leur type (ou signature pour les fonctions).
Réécrivons notre `amodule.ml` :

```ocaml
let message = "Hello"
let hello () = print_endline message
```

Tel quel, l'interface de `Amodule` est la suivante :

```ocaml
val message : string
val hello : unit -> unit
```

Supposons que nous souhaitions que personne de l'exterieur ne puisse
accéder à la variable `message`. Alors, nous choisissons de la
« cacher » en créant une interface restreinte; le `amodule.mli` est
alors :

```ocaml
val hello : unit -> unit
(** Displays a greeting message. *)
```

(Notons que commenter les fichiers `.mli` en utilisant le format
d'`ocamldoc` est une très bonne habitude à prendre).

Les fichiers `.mli` doivent être compilés juste avant les
`.ml` correspondants. On peut les compiler à l'aide
d'`ocamlc`, même si les `.ml `sont écrit en code natif avec
`ocamlopt`.

```shell
ocamlc -c amodule.mli
ocamlopt -c amodule.ml
...
```

## Types abstraits (virtuels)

Passons à présent aux définitions de types. Nous avons vu que les
valeurs telles que les fonctions, peuvent être exportées en donnant leur
noms et signatures dans un fichier `.mli`, par exemple :

```ocaml
val hello : unit -> unit
```
Cependant, on définit souvent au sein d'un module de nouveaux types.
Prenons par exemple un enregistrement d'une date :

```ocaml
type date = { day : int;  month : int;  year : int }
```
Il n'y a plus 2 mais 4 options possibles dans l'écriture du fichier
`.mli` :

1. Le type n'est pas précisé dans le `.mli`
2. La définition du type est copiée-collée dans le `.mli`
3. Le type est rendu virtuel, seul son nom est précisé. (il est connu
   du compilateur mais on ne peut y toucher)
4. Les champs d'un enregistrement sont rendus seulement lisibles
   et non plus modifiables (lecture seule) `type date = private { ... }`.

Dans le troisieme cas, on obtient le code suivant :

```ocaml
type date
```
Les utilisateurs de ce module peuvent désormais manipuler des données de
type `date` mais ne peuvent accéder aux champs de
l'enregistrement, seules les fonctions du modules sont autorisées à le
faire. Supposons que notre module contienne trois fonctions, une pour
créer une date, une pour calculer la différence entre deux dates et une
pour convertir une date en années :

```ocaml
type date
val create : ?days:int -> ?months:int -> ?years:int -> unit -> date
val sub : date -> date -> date
val years : date -> float
```
On remarque alors que seuls `create` et `sub` peuvent être
utilisés pour créer des enregistrements de dates. Il n'est ainsi pas
possible pour l'utilisateur de créer des enregistrements difformes.
Il s'ensuit que, bien que notre implémentation utilise un enregistrement, 
nous pouvons le modifier sans qu'aucun fichier utilisant ce module n'en soit
perturbé. Ceci est particulièrement utile dans le cas des librairies,
qui peuvent ainsi être modifiées tout en gardant une utilisation
identique.

## Sous modules

### Création d'un sous module

Nous avons vu qu'un fichier unique `exemple.ml` se compilait un un
module unique `Exemple`. Sa signature est automatiquement générée
et est la plus exhaustive possible, sauf si elle est restreinte par
l'écriture d'un fichier `.mli`. Ceci dit, un module donné peut
être défini explicitement au sein même d'un fichier, il est ainsi un
sous module du module principal. Prenons l'exemple suivant :

```ocaml
module Hello = 
struct
  let message = "Hello"
  let hello () = print_endline message
end
  
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

Depuis un autre fichier, nous avons désormais deux niveaux de modules.
Nous pouvons écrire alors :

```ocaml
let () =
  Example.Hello.hello ();
  Example.goodbye ()
```
     

#### Interface submodulaire

Nous pouvons de même restreindre l'interface d'un sous module. On
appelle cela un type modulaire. Dans notre `exemple.ml` cela
donne :

```ocaml
module Hello : 
sig
 val hello : unit -> unit
end = 
struct
  let message = "Hello"
  let hello () = print_endline message
end
  
(* At this point, Hello.message is not accessible anymore. *)
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
```

La définition du module `Hello` est équivalente au couple de
fichiers `hello.mli/hello.ml`. Cependant, écrire tout cela dans
un même bloc de code n'est pas très élégant, nous préférons donc définir
la signature séparement.

```ocaml
module type Hello_type =
sig
  val hello : unit -> unit
end
  
module Hello : Hello_type =
struct
  ...
end
```

`Hello_type` est un type modulaire et peut donc être réutilisé
pour définir d'autres interfaces de modules.

Bien que l'utilisation des sous modules peut se révéler pratique dans
certains cas spécifiques, leur utilité réelle se révèle avec les
foncteurs, développés dans la section suivante.

## Foncteurs

Les foncteurs sont probablement une des fonctionnalités les plus
complexes d'OCaml, même s'il n'est pas nécessaire de les utiliser de
façon intensive pour être un bon programmeur. En réalité, il est
possible que nous n'ayons jamais à définir nous-mêmes de foncteurs, mais
nous serons sûrement appelés à les rencontrer dans la librairie
standard. Ils sont la seule façon d'utiliser les modules `Set` et
`Map`, mais leur utilisation reste à notre portée.

Un foncteur est un module qui est paramétré par un autre module, tout
comme une fonction n'est qu'une valeur paramétrée par d'autres valeurs
(les arguments). En gros, cela permet de paramétrer un type par une
valeur, ce qui est impossible à faire directement en OCaml. Par exemple,
nous pourrions définir un foncteur prenant un entier `n` et
retournant un ensemble d'opérations sur des tableaux de longeurs
`n` uniquement. Si par erreur, un programmeur donne un tableau
normal à une de ces fonctions, le compilateur soulèvera une erreur. Si
nous n'utilisions pas un foncteur mais le type standard des tableaux, le
compilateur ne sera pas capable de détecter l'erreur, et nous
obtiendrions une erreur à l'exécution bien après la compilation, ce qui
est bien pire !

### Comment utiliser un foncteur ?

La librairie standard définit le module `Set`, qui fournit un
foncteur `Make`. Ce foncteur requiert un argument, qui est un
module contenant (au moins) deux choses : le type des éléments donné par
`t` et la fonction de comparaison donnée par `compare`.
L'important est de s'assurer que la même fonction de comparaison sera
toujours utilisée, même si le programmeur commet une erreur.

Par exemple, si nous voulons un ensemble d'entiers, il faut utiliser
ceci :

```ocaml
module Int_set = Set.Make (struct
                             type t = int
                             let compare = compare
                           end) 
```
Pour les ensembles de chaînes, cela est même plus simple car la
librairie standard fournit un module `String` avec un type
`t` et une fonction `compare`. On peut donc créer, à peu de
frais, un module pour la manipulation des ensembles de chaînes de
caractères :

```ocaml
module String_set = Set.Make (String)
```
(les parenthèses sont obligatoires !)

### Comment définir un foncteur ?

Un foncteur avec un argument peut être défini comme ceci :

```ocaml
module F (X : X_type) =
struct
  ...
end
```
où `X` est le module passé en argument, et `X\_type` est sa
signature, qui est obligatoire.

La signature du module obtenu peut elle même être restreinte à l'aide la
syntaxe habituelle :

```ocaml
module F (X : X_type) : Y_type =
struct
  ...
end
```
ou bien en le spécifiant dans le fichier `.mli` :

```ocaml
module F (X : X_type) : Y_type
```
La syntaxe des foncteurs reste cependant difficile à assimiler. Il est
donc préférable de jeter un coup d'oeil aux fichier sources
`set.ml` ou `map.ml` dans la librairie standard. Une
dernière remarque : les foncteurs ont été conçus pour aider les
programmeurs et non pas pour améliorer les performances. L'exécution est
même plus lente, à moins d'utiliser un défoncteur comme
`ocamldefun`, qui requiert un accès au code source du foncteur.

## Manipulation pratique des modules

### Afficher l'interface d'un module

En `toplevel`, il est possible de visualiser le contenu d'un
module en tapant :

```ocaml
module M = List
```

On obtient alors :

```ocamltop
module M = List
```

De toute façon, il existe une documentation pour la plupart des modules
(on peut aussi utiliser `ocamlbrowser`, fourni avec `labltk`).

### Insertion dans un module

Supposons que nous sentions qu'une fonction manque au module standard
`List` et que nous désirions qu'elle en fasse partie intégrante.
Il est possible d'utiliser l'instruction `include` au sein d'un
fichier `extensions.ml` afin d'insérer notre fonction :

```ocaml
module List =
struct
  include List
  let rec optmap f = function
    | [] -> []
    | hd :: tl ->
       match f hd with
       | None -> optmap f tl
       | Some x -> x :: optmap f tl
end
```
Nous avons créé un nouveau module `Extensions.List` contenant , en
plus des fonctions habituelles du module `List`, une nouvelle
fonction `optmap`.  Depuis un autre fichier, il nous suffit
d'ouvrir notre module `Extensions` pour que celui-ci « écrase » le
module `List` standard :

```ocaml
open Extensions
...
List.optmap ...
```
