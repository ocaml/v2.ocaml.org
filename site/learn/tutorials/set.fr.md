<!-- ((! set title Set !)) ((! set learn !)) -->
<!-- ((! set center !)) -->

# Set

## Le Module Set
Pour faire une structure de donnée de type ensemble ("set" en anglais) :

```ocamltop
module SS = Set.Make(String) ;;
```
Ici il s'agit d'un ensemble de chaîne de caractère (String en anglais).

Pour créer un ensemble vous pouvez commencer par un ensemble vide
auquel vous pourrez ajouter des éléments par la suite :

```ocamltop
let s = SS.empty;;
```
Ou vous pouvez créer un ensemble contenant un élément en fournissant 
cet élément ce cette façon :

```ocamltop
let s = SS.singleton "hello";;
```
Puis ajouter une série d'éléments à un ensemble peut se faire comme ceci :

```ocamltop
let s =
  List.fold_right SS.add ["bonjour"; "le"; "monde"; "communaute"; "gestionaire";
                          "truc"; "bleu"; "vert"] s ;;
```
Maintenant pour pouvoir nous amuser avec nos ensembles nous allons 
vraissemblablement vouloir regarder ce qu'ils contiennent. Pour ce faire 
nous allons écrire une fonction qui affiche le contenu d'un ensemble :

```ocamltop
(* Afficher un retours à la ligne "\n" apres l'affichage de chaque ligne *)
let print_set s = 
  SS.iter print_endline s ;;
```

Si nous souhaitons enlever un élément en particulier d'un ensemble il y a la 
fonction "remove". Cependant si nous souhaitons enlever plusieurs éléments
spécifiques en une passe nous pouvons utiliser un filtre ("filter" en anglais).
Voici comment filtrer tous les mots constitués de plus de 5 caractères :

```ocamltop
let my_filter str =
  String.length str <= 5 ;;
let s2 = SS.filter my_filter s ;;
```
ou en utilisant une fonction anonyme :

```ocamltop
let s2 = SS.filter (fun str -> String.length str <= 5) s ;;
```
Pour vérifier si un élément est déjà présent dans un ensemble nous 
pouvons faire :

```ocamltop
SS.mem "bonjour" s2 ;;
```

Le module `Set` fournit également les fonctions correspondant aux opérations 
théoriques : union, intersection et différence.
Par exemple la différence entre l'ensemble original et l'ensemble de mots
courts (≤ 5 caractères) est un ensemble de mots longs :

```ocamltop
print_set (SS.diff s s2) ;;
```
Notez que le module `Set` fournit une structure de donnée fonctionnelle 
pure, ce qui veut dire que supprimer un élément n'altère en aucune 
façon l'ensemble original mais à la place renvoie un nouvel ensemble 
très proche de celui de départ (et qui partage la plupart de sa 
structure interne).

