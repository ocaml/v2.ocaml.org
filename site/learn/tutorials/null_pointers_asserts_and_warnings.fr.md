<!-- ((! set title Pointeurs nuls, asserts et warnings !)) ((! set learn !)) -->

# Pointeurs nuls, asserts et warnings

*Table of contents*

## Pointeurs nuls
Supposons que votre site web dispose d'un sondage, demandant à vos
lecteurs leurs noms et leurs âges. Le problème, c'est que pour une
raison quelconque certains de vos lecteurs refusent de donner leur âge -
ils refusent avec obstination de remplir ce champ. Que doit faire
l'administrateur de la base de données ?

Supposons que l'âge soit représenté par un entier (`int`), il y a deux
façons de régler le problème. La façon la plus commune (et la plus
*incorrecte*) est d'utiliser une valeur "magique" pour l'âge pour
signifier que cette information c'est pas disponible. Si, par exemple,
age = -1, alors l'âge n'a pas été saisi, sinon il a été saisi (même
incorrectement !). Tout se passe bien jusqu'au moment de calculer, par
exemple, l'âge moyen de votre audience. Si vous oubliez de traiter
spécialement la valeur magique, vous allez conclure que l'âge moyen de
vos visiteurs est 7 ans et demi, supprimer tous les mots compliqués de
votre site, et demander à votre graphiste d'employer davantage les
couleurs primaires.

L'autre méthode, plus correcte, est de stocker les âges dans un champ de
type "entier ou NULL". Par exemple, en SQL, la table pour stocker les
âges ressemblerait à :

```SQL
create table users
(
  userid serial,
  name text not null,
  age int             -- may be null
);
```
Si l'âge n'est pas connu, c'est la valeur spéciale SQL `NULL` qui est
enregistrée. SQL ne tient pas compte de ces entrées si on demande à
calculer la moyenne des âges, etc.

Les langages de programmation ont aussi leurs valeurs nulles, mais leur
facilité d'utilisation est variable. En Perl, n'importe quel scalaire
(nombre ou chaîne) peut prendre la valeur `undef` (la valeur nulle en
Perl). C'est la source de beaucoup d'avertissements (warnings), souvent
ignorés par les programmeurs inexpérimentés, bien que ce soit souvent le
signe d'un problème réel. En Java, les références vers des objets
peuvent prendre la valeur nulle, et il peut être judicieux dans notre
cas de stocker les âges avec des `Integer`, et d'admettre que les
références vers un âge puissent prendre la valeur `null`. En C les
pointeurs peuvent, bien sûr, être nuls, mais pour utiliser cette
fonctionalité avec un bête entier, il faut tout d'abord l'encapsuler
dans une structure allouée dynamiquement dans le tas (`malloc()`).

OCaml propose une solution élégante pour les valeurs nulles, en
utilisant un simple type variant polymorphique, défini (jusqu'à
récemment, dans le module `Pervasives`) comme :

```ocaml
type 'a option = None | Some of 'a
```
Une « valeur nulle » s'écrit `None`. Le type de age dans notre exemple (un
entier ou la valeur nulle) est `int option` (le type est écrit « à
l'envers », comme `int list` ou `int binary_tree` dans le chapitre
précédent).

```ocamltop
Some 3;;
```
Une liste d'entiers optionels ?

```ocamltop
[ None; Some 3; Some 6; None ];;
```
Et une liste optionelle d'entiers ?

```ocamltop
Some [1; 2; 3];;
```

## Assertions, avertissements, erreurs fatales, et écriture vers stderr
Perl se distingue par un riche ensemble de commandes pour déboguer les
programmes et gérer les erreurs inattendues, en particulier la
possibilité d'imprimer l'état de la pile d'appels, de lever et de
ratrapper des exceptions, etc. OCaml n'est pas aussi bien doté en
fonctionnalités de débogage - mieux que Java, à peu près équivalent au
C, mais loin d'égaler Perl. (Nous reparlerons des exceptions en détail
plus tard.)

Tout d'abord, les assertions. `assert` prend comme argument une
expression booléenne, et lève une exception si elle est fausse. En
supposant que vous ne rattrapiez pas cette exception (ce qui est
recommandé, tout particulièrement pour les débutants), son effet sera de
stopper le programme, et d'afficher l'emplacement (nom du fichier,
numéro de ligne et de colonne) où l'erreur est survenue. Par exemple :

```ocamltop
assert (Sys.os_type = "Win32");;
```
(Bien entendu, cette exception ne sera pas levée sous Win32.)

Vous pouvez utiliser `assert false` pour stopper votre programme dans
les situations critiques, mais il est souvent préférable d'utiliser...

`failwith "message d'erreur"`, pour lever une exception `Failure`, qui
elle aussi, à moins d'être rattrappée, va stopper le programme et
afficher le message d'erreur fourni. `failwith` est souvent utilisé lors
du filtrage, comme dans cet exemple réel :

```ocaml
match Sys.os_type with
| "Unix" | "Cygwin" ->   (* code omit *)
| "Win32" ->             (* code omit *)
| "MacOS" ->             (* code omit *)
| _ -> failwith "Ce système n'est pas supporté"
```
A noter l'utilisation d'un couple de fonctionnalités supplémentaires du
système de filtrage. L'union de motifs est utilisée pour reconnaître
`"Unix"` ou `"Cygwin"`, et le motif spécial `_` pour reconnaître
"n'importe quoi d'autre".

Si vous voulez déboguer votre programme mais, comme moi, avez une
aversion pour les débogueurs autres que gdb, vous voudrez sûrement faire
afficher des avertissements par vos fonctions. Voici un exemple (notez
le code surligné) :

```ocaml
open Graphics;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  <em>prerr_endline ("radius is " ^ (string_of_int radius));</em>
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
```

Si vous préférez le style `printf` du langage C, essayez plutôt le
module `Printf` d'OCaml :

```ocaml
open Graphics;;
open Printf;;

open_graph " 640x480";;
for i = 12 downto 1 do
  let radius = i * 20 in
  <em>eprintf "radius is %d\n" radius;</em>

  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
```
