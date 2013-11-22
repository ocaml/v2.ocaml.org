<!-- ((! set title Format !)) ((! set learn !)) -->

*Table of contents*

# Utiliser le module Format
Le module Format des librairies standard de Caml Light et OCaml propose
une méthode d'impression enjolivée. Ce module implémente un moteur
d'impression qui coupe « bien » les lignes (« bien » signifie à-peu-près
ici « automatiquement et quand nécessaire »).

## Principes
La coupure des lignes repose sur trois concepts:

* **Les boîtes** : une boîte est une unité logique d'impression, qui
 définit un comportement du moteur d'impression pour présenter
 l'intérieur de la boîte.
* **Les indications de coupures** : une indication de coupure est une
 directive au moteur d'impression, qui lui propose de couper la ligne
 à cet endroit si cela s'avère nécessaire. Sinon, le moteur
 d'impression ne coupe jamais les lignes (sauf en « cas d'urgence »
 pour éviter les trop mauvaises sorties).
* **Les règles d'indentation** : Quand le moteur d'impression démarre
 une nouvelle ligne, il fixe l'indentation de la nouvelle ligne
 (c'est-à-dire le nombre de blancs insérés en début de ligne) en
 suivant des règles qui dépendent à la fois de l'indication de
 coupure et de la définition de la boîte où la ligne est coupée :
    * Une boîte peut définir le montant de l'indentation ajoutée à
 chaque nouvelle ligne de son corps. Cette valeur est appelée
 **indentation additionnelle de boîte**.
    * Une indication de coupure peut aussi définir une indentation
 additionelle pour la nouvelle ligne qu'elle peut occasionner.
 Cette valeur est appelée **indentation additionnelle de
 coupure**.
    * Si l'indication de coupure `bh` engendre une nouvelle ligne à
 l'intérieur de la boîte `b`, alors l'indentation de la nouvelle
 ligne est la somme de: l'indentation courante de la boîte `b`
 `+` l'indentation additionnelle de boîte définie par la boîte
 `b` `+` l'indication additionnelle de coupure définie par
 l'indication de coupure `bh`.

## Les boîtes
Il y a 4 types de boîtes. (La plus communément utilisée est la boîte
« hov », laissez tomber les autres types en première lecture.)

* **Boîte horizontale** (boîte *h*, ouverte par la procédure
 `open_hbox`) : dans cette boîte les indications de coupures ne
 donnent pas lieu à retour à la ligne.
* **Boîte verticale** (boîte *v*, ouverte par la procédure
 `open_vbox`): toute indication de coupure provoque un retour à la
 ligne.
* **Boîte verticale/horizontale** (boîte *hv*, ouverte par la
 procédure `open_hvbox`) : si c'est possible, toute la boîte est
 imprimée sur une seule ligne; sinon toute indication de coupure
 provoque un retour à la ligne.
* **Boîte verticale ou horizontale** (boîte *hov*, ouverte par l'une
 des procédures `open_box` ou `open_hovbox`) ou boîte « tassante »:
 les indications de coupure sont utilisées pour aller à la ligne
 quand il n'y a plus de place sur la ligne courante. Il existe deux
 espèces légèrement différentes de boîtes « hov » qui sont décrites
 [plus bas](#hov-boxes). En première approximation nous confondrons
 ces deux types de boîtes « hov » et ne considérerons que celles
 obtenues avec la procédure `open_box`.

Donnons un exemple. Supposons que nous voulions écrire 10 caractères
avant la marge droite (qui indique qu'il n'y a plus de place sur la
ligne courante). Je représente chaque caractère par une marque `-`, les
ouvertures et fermetures de boîtes sont indiquées respectivement par `[`
et `]`, et `b` signifie une indication de coupure (blanc ou « break »).

La sortie "--b--b--" est imprimée comme suit (le symbole b vaut la
valeur de la coupure comme expliqué ci-après) :

* dans une boîte « h » :

    ```text
    --b--b--
    ```

* dans une boîte « v » :

    ```text
    --b
    --b
    --
    ```

* dans une boîte « hv » :

    S'il y a assez de place pour imprimer toute la boîte sur la ligne :

    ```text
    --b--b--
    ```
    Mais si `---b---b---` ne peut tenir sur la ligne, la sortie est

    ```text
    ---b
    ---b
    ---
    ```

* dans une boîte « hov » :

    S'il y a assez de place pour imprimer toute la boîte sur la ligne :

    ```text
    --b--b--
    ```
    Mais si `---b---b---` ne peut tenir sur la ligne, la sortie est

    ```text
    ---b---b
    ---
    ```
    La première indication de coupure ne donne pas lieu à un retour à la
    ligne, puisque la ligne n'est pas pleine. La seconde indication de
    coupure entraîne un retour à la ligne, puisqu'il n'y a plus la place
    d'imprimer ce qui suit l'indication de coupure. Si la place restante
    sur la ligne était encore plus courte, la première indication de
    coupure aurait aussi donné lieu à un retour à la ligne et
    `---b---b---` aurait été imprimé ainsi:

    ```text
    ---b
    ---b
    ---
    ```


## Impression des espaces
Les indications de coupure sont aussi utilisées pour imprimer des
espaces (si la ligne n'est pas coupée quand l'indication de coupure est
traitée, sinon le retour à la ligne sépare correctement les éléments à
imprimer). Vous donnez une indication de coupure en appelant
`print_break sp indent`, où `sp` est l'entier qui indique le nombre
d'espaces à imprimer.<br />
 Donc `print_break sp ...` signifie imprimer `sp` espaces ou aller à la
ligne.

Par exemple, si l'on imprime "--b--b--" (où `b` est `print_break 1 0`,
ce qui correspond à l'impression d'un espace), on obtient la sortie
suivante :

* dans une boîte « h » :

    ```text
    -- -- --
    ```

* dans une boîte « v » :

    ```text
    --
    --
    --
    ```

* dans une boîte « hv » :

    ```text
    -- -- --
    ```
    ou, suivant la place restante sur la ligne :

    ```text
    --
    --
    --
    ```

* et de même pour les boîtes « hov ».

De façon générale, un programme qui utilise `format`, n'écrit pas
d'espaces lui-même mais émet des indications de coupure. (Par exemple à
l'aide de `print_space ()` qui est synonyme de `print_break     1 0` et
écrit un espace ou déclenche une coupure de ligne.)

## Indentation des lignes nouvelles
On dispose de deux moyens de fixer l'indentation des lignes :

* **En définissant la boîte où la ligne apparaît**: à l'ouverture de
 la boîte, on peut fixer l'indentation ajoutée à chaque ligne ouverte
 dans la boîte.<br />
 Par exemple: `open_hovbox 1` ouvre une boîte hovbox dont les lignes
 seront indentées de 1 par rapport à l'indentation initiale de la
 boîte. Ainsi avec `---[--b--b--b--`, on obtient :

    ```text
    ---[--b--b
         --b--
    ```
    tandis qu'avec `open_hovbox 2`, on obtient :

    ```text
    ---[--b--b
          --b--
    ```
    Note: le symbole `[` n'est évidemment pas visible sur la sortie
    écran, je l'écris pour matérialiser l'ouverture de la boîte
    d'impression. Ainsi le dernier « écran » est en fait :

    ```text
    -----b--b
         --b--
    ```

* En définissant l'indication de coupure qui a provoqué le retour à la
 ligne. On émet une indication de coupure avec
 `print_break sp indent`. L'entier `indent` fixe l'indentation
 additionnelle de la nouvelle ligne qui peut être émise par
 l'indication de coupure. C'est-à-dire que `indent` est ajouté à
 l'indentation par défaut de la boîte où la coupure a lieu.<br />
 Par exemple, en indiquant par `[` l'ouverture d'une boîte `hov 1`
 (obtenue par `open_hovbox       1`), et par `b`
 `print_break       1       2`, alors la sortie de "---[--b--b--b--",
 sera imprimée :

    ```text
    ---[-- --
          --
          --
    ```


## Raffinement sur les boîtes « hov »
###  Boîte « hov » tassante et boîte « hov » structurelle
Les boîtes « hov » se subdivisent en deux catégories au comportement
légèrement différent en ce qui concerne les coupures qui interviennent
après la fermeture d'une boîte dont l'indentation est différente de la
boîte qui l'englobe. On distingue :

* **la boîte « hov » *tassante*** (ouverte par la procédure
 `open_hovbox`): les indications de coupure sont utilisées pour aller
 à la ligne quand il n'y a plus de place sur la ligne courante; il
 n'y a pas de passage à la ligne s'il y a assez de place sur la ligne
 courante.
* **la boîte « hov » *structurelle*** (ouverte par la procédure
 `open_box`): très similaire à la boîte « hov » tassante, les
 indications de coupure sont également utilisées pour aller à la
 ligne quand il n'y a plus de place sur la ligne courante, mais de
 surcroît les indications de coupures qui permettent de mettre en
 évidence la structure de boîtes sont effectuées même s'il reste
 assez de place sur la ligne courante.


###  Différences entre boîte « hov » tassante et boîte « hov » structurelle
La différence de comportement entre la boîte « hov » tassante et la
boîte « hov » structurelle (ou « box ») est mise en évidence par la
fermeture des boîtes et la fermeture des parenthèses en fin
d'impression: avec la boîte « hov » tassante les boîtes et les
parenthèses sont fermées sur la même ligne (si la place disponible le
permet), tandis qu'avec la boîte « hov » structurelle chaque indication
de coupure produira un saut de ligne. Prenons l'exemple de la sortie de
`[(---[(----[(---b)]b)]b)]` où `b` représente une indication de coupure
sans indentation supplémentaire (`print_cut     ()`). Ainsi, si "["
représente l'ouverture de boîtes « hov » tassantes (`open_hovbox`),
`[(---[(----[(---b)]b)]b)]` est imprimé ainsi:

```text
(---
 (----
  (---)))
```
Si maintenant on remplace les boîtes « hov » tassantes par des boîtes «
hov » structurelles (`open_box`), chaque indication de coupure placée
avant chaque parenthèse fermante est susceptible de montrer la structure
de boîte et produit donc une coupure; on obtient alors :

```text
(---
 (----
  (---
  )
 )
)
```


## Conseils pratiques
En écrivant vos fonctions d'impression, suivez les règles simples
suivantes :

1. Les boîtes doivent être ouvertes et fermées de façon cohérente (les
 appels à `open_*` et à `close_box` doivent être parenthésés).
1. N'hésitez pas à ouvrir des boîtes.
1. Donnez beaucoup d'indications de coupures, sinon l'imprimeur se
 retrouve dans une situation anormale (coincé sur la marge droite),
 où il essaie de faire de son mieux, ce qui n'est pas toujours très
 bon.
1. N'essayez pas de forcer l'espacement à l'aide de blancs explicites
 dans les chaînes de caractères à imprimer. Pour chaque espace
 nécessaire, utilisez une indication de coupure (`print_space ()`), à
 moins que vous ne vouliez pas que la ligne soit coupée à cet
 endroit. Par exemple, imaginez que vous vouliez imprimer une
 définition OCaml, disons `let rec ident = expression`. Vous allez
 probablement considérer les 3 premiers blancs comme des « blancs
 insécables » et les inclure directement dans une chaîne de
 caractères, et écrire la chaîne `"let rec "` avant l'identificateur
 et la chaîne ` =` après lui; en revanche, l'espace qui suit le
 caractère `=` doit être une indication de coupure, puisqu'il est
 d'usage (et élégant) de couper la ligne à cet endroit pour indenter
 la partie expression d'une définition. En conclusion, il est bien
 sûr souvent nécessaire d'imprimer des caractères « espace », ou
 blancs insécables, mais la plupart du temps un espace correspond
 plutôt à une indication de coupure.)
1. Ne forcez jamais de coupures de ligne, laissez le moteur
 d'impression le faire pour vous: c'est son travail! En particulier,
 n'utilisez pas la procédure `force_newline`: son usage provoque bien
 une coupure de ligne, mais il provoque aussi une réinitialisation
 partielle du moteur d'impression qui déséquilibre tout le reste de
 l'impression.
1. N'imprimez jamais de retour à la ligne dans les chaînes de
 caractères : le moteur d'impression considèrera à juste titre ce
 retour chariot comme un caractère quelconque émis sur la ligne
 courante, ce qui dérangera complètement la sortie. Utilisez à la
 place des coupures de ligne: si celles-ci doivent se produire à tout
 coup, c'est que la boîte englobante doit être une boîte verticale!
1. Terminez votre programme principal d'impression par un appel à
 `print_newline ()`, qui vide les tables de l'imprimeur (et donc
 termine l'impression). (Notez que le système interactif le fait
 également à la fin de chaque phrase entrée.)

## Impression sur la sortie standard: utilisation de `printf`
Le module `format` vous propose une fonction générale de formattage à la
`printf`. En plus des indications de format habituelles à la primitive
`printf`, on dispose dans le format de caractères qui commandent
ouvertures et fermetures de boîtes ainsi que l'émission d'indications de
coupure de ligne.

Les indications spécifiques au moteur d'impression sont toutes
introduites par le caractère `@`. À peu près toutes les fonctions du
module `format` peuvent être appelées depuis un format de `printf`.
Ainsi :

* « `@[` » ouvre une boîte (`open_box             0`). On peut
 préciser le type de la boîte en argument supplémentaire. Par exemple
 `@[<hov n>` est équivalent à `open_hovbox n`.
* « `@]` » ferme la dernière boîte ouverte (`close_box ()`).
* « `@` » émet un espace sécable (`print_space ()`).
* « `@,` » émet une indication de coupure sans espace ni indentation
 supplémentaire en cas de coupure (`print_cut ()`).
* « `@;<n m>` » émet une indication de coupure la plus générale, avec
 ses deux arguments entiers (`print_break n m`).
* « `@.` » termine l'impression en fermant toutes les boîtes encore
 ouvertes (`print_newline ()`).

Par exemple

```ocamltop
Format.printf "@[<1>%s@ =@ %d@ %s@]@." "Prix TTC" 100 "Euros";;
```


## Un exemple concret
Voici un exemple complet : le plus petit exemple non trivial qu'on
puisse imaginer, c'est-à-dire le \$\lambda-\$calculus :)

Le problème est donc d'imprimer les valeurs d'un type concret qui
modélise un langage d'expressions qui définissent les fonctions et leur
application à des arguments.

D'abord, je donne la syntaxe abstraite des lambda-termes (nous utilisons
le [système interactif](../description.html#interactive) pour évaluer ce
code) :

```ocamltop
  type lambda =
    | Lambda of string * lambda
    | Var of string
    | Apply of lambda * lambda
```
J'utilise le module format pour imprimer les lambda-termes:

```ocamltop
  open Format;;

  let ident = print_string
  let kwd = print_string;;

  let rec print_exp0 = function
    | Var s ->  ident s
    | lam -> open_hovbox 1; kwd "("; print_lambda lam; kwd ")"; close_box ()
  and print_app = function
    | e -> open_hovbox 2; print_other_applications e; close_box ()
  and print_other_applications f =
    match f with
    | Apply (f, arg) -> print_app f; print_space (); print_exp0 arg
    | f -> print_exp0 f
  and print_lambda = function
    | Lambda (s, lam) ->
        open_hovbox 1;
        kwd "\\"; ident s; kwd "."; print_space(); print_lambda lam;
        close_box()
    | e -> print_app e
```
En Caml Light, remplacez la première ligne par :

```ocaml
#open "format";;
```

###  Impression la plus générale: utilisation de `fprintf`
On utilise maintenant la fonction `fprintf` et toutes les fonctions
d'impression prennent en argument supplémentaire le formatteur (c'est
l'argument `ppf`) où l'impression se produira. Cela généralise les
fonctions d'impression qui peuvent maintenant imprimer sur n'importe
quel formateur défini dans le programme, et cela permet en outre
d'utiliser la conversion `%a`, celle qu'on utilise pour imprimer un
argument de `fprintf` avec une fonction d'impression spécialisée qu'on a
préalablement définie dans le programme (ces fonctions d'impression de
l'utilisateur prennent aussi un formatteur en premier argument).

Voici la fonction d'impression des lambda-termes à l'aide des formats
d'impression à la `fprintf`.

```ocamltop
  open Format;;

  let ident ppf s = fprintf ppf "%s" s
  let kwd ppf s = fprintf ppf "%s" s;;

  let rec pr_exp0 ppf = function
    | Var s -> fprintf ppf "%a" ident s
    | lam -> fprintf ppf "@[<1>(%a)@]" pr_lambda lam
  and pr_app ppf e =
    fprintf ppf "@[<2>%a@]" pr_other_applications e
  and pr_other_applications ppf f =
    match f with
    | Apply (f, arg) -> fprintf ppf "%a@ %a" pr_app f pr_exp0 arg
    | f -> pr_exp0 ppf f
  and pr_lambda ppf = function
    | Lambda (s, lam) ->
       fprintf ppf "@[<1>%a%a%a@ %a@]"
               kwd "\\" ident s kwd "." pr_lambda lam
    | e -> pr_app ppf e
```
Armés de ces fonctions d'impression générales, les procédures
d'impression sur la sortie standard ou la sortie d'erreur s'obtiennent
facilement par application partielle:.

```ocamltop
  let print_lambda = pr_lambda std_formatter
  let eprint_lambda = pr_lambda err_formatter

```
