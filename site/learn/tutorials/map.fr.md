<!-- ((! set title Map !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Map

## Le Module Map

Ce module permet de créer des « associations ». Par exemple, disons que
nous ayons des données constituées de noms d'utilisateurs avec leur
mots de passe respectifs. Nous pouvons avec le module Map créer une
structure de donnée associant le nom d'utilisateur à son mot de passe.
De plus ce module s'aquite de sa tâche de manière assez efficace. Et
aussi il le fait de manière fonctionnelle. Dans l'exemple ci-dessous
nous allons réaliser des associations (mapping en anglais) du type
`string` vers `string`. Cependant il est possible de faire des
associations avec presque n'importe quel type de donnée.

Pour créer une structure de type Map:

```ocamltop
module MyUsers = Map.Make(String);;
```

Bon, nous avons créé le module `MyUsers` en fixant le type des clefs
au type `string` car c'est le module `String` qui est passé en paramètre.
Maintenant entrons des données dans celui-ci.
Vous vous demandez peut-être par où commencer ?
Eh bien c'est très simple, nous démarrons avec une structure vide
comme ceci :

```ocamltop
let m = MyUsers.empty;;
```
Hummm. Une structure d'association vide, c'est pas très intéressant,
alors ajoutons-y quelques éléments :

```ocamltop
let m = MyUsers.add "fred" "pruneausucre" m;;
```
Nous avons créé une nouvelle association appelée `m`, ce faisant comme elle
porte le même nom elle masquera la précédente. Cette nouvelle association
a ajouté « fred » et son mot de passe « pruneausucre » à la précédente
association vide. Il y a un point important ici, lorsque l'on ajoute
la première donnée « pruneausucre » dans la structure d'association
on fixe alors le type de donnée que cette structure peut recevoir.
Ce qui signifie que l'association de notre module `MyUsers` est
du type string _to strings_. Si nous désirons une association du type
string vers entier ou une association du type entier vers quoi que ce soit
d'autre nous devrons créer une autre structure d'association.

Maintenant ajoutons quelques données pour peupler notre association.

```ocamltop
let m = MyUsers.add "tom" "ilovelucy" m;;
let m = MyUsers.add "mark" "ocamlrules" m;;
let m = MyUsers.add "pete" "linux" m;;
```
Maintenant que nous avons des données dans notre association, ne serait-ce
pas intéressant de voir son contenu ? Alors commençons par écrire une
fonction d'affichage simple :
```ocamltop
let print_user key password =
  print_string (key ^ " " ^ password ^ "\n");;
```
Nous avons ici une fonction qui prend deux chaines de caractères en
paramètre, une clef et un mot de passe, et qui les affiche. Maintenant
nous devons appliquer cette fonction à notre association. Voici comment
le faire :

```ocamltop
MyUsers.iter print_user m;;
```
La raison qui nous a poussé à mettre nos données dans une structure
d'association est probablement que nous pouvons rapidement retrouver nos
données. Aussi voyons maintenant comment faire cela :

```ocamltop
MyUsers.find "fred" m;;
```
Ceci devrait rapidement et efficacement retourner le mot de passe de Fred :
"pruneausucre".

