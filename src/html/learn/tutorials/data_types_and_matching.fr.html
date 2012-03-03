<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Types de données et matching</title>
</head>
<body>
<h1>Types de données et filtrage de motif</h1>


<a name="Listes_chaînées"></a><h2><span>Listes chaînées</span></h2>
<p class="first_para">Comme en Perl, la notion de liste est directement supportée dans le langage OCaml. En OCaml, tous les éléments d'une liste doivent avoir le même type. Une liste s'écrit :</p>
<pre>
[1; 2; 3]
</pre>

<p class="first_para">(Remarquez l'utilisation de points-virgules, et non de virgules).</p>

<p><code>[]</code> est la liste vide.</p>
<p>Une liste a une <strong>tête</strong> (le premier élément) et une <strong>queue</strong> (les autres éléments). La tête est un élément, la queue est une liste, donc dans cet exemple la tête est l'entier <code>1</code> alors que la queue est la <em>liste</em> <code>[2; 3]</code>.</p>

<p>Une autre façon d'écrire une liste est d'utiliser l'opérateur <strong>cons</strong> <code><em>tête</em> :: <em>queue</em></code>. Toutes les expressions suivantes sont donc équivalentes :</p>
<pre>
[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []
</pre>

<p class="first_para">Pourquoi mentionner l'opérateur cons ? Et bien nous en aurons besoin un peu plus bas, pour faire du <em>filtrage</em> (<em>pattern matching</em>) sur les listes.</p>

<h3>Le type d'une liste chaînée</h3>
<p class="first_para">Le type d'une liste chaînée d'entiers est <code>int list</code>, et plus généralement le type d'une liste chaînée de <code>toto</code>s est <code>toto list</code>.</p>
<p>Cela implique que tous les éléments d'une liste chaînée doivent avoir le même type; Il existe des types polymorphiques de listes (càd <code>'a list</code>), très utile pour écrire des fonctions manipulant des &quot;listes de n'importe quoi&quot; de manière générique. (Mais <code>'a list</code> ne signifie pas que les différents éléments d'une liste peuvent avoir des types différents - vous ne pouvez pas utiliser ce type polymorphique pour construire, disons, une liste d'entiers et de chaînes. Le sens de cette notation est que les éléments de la liste peuvent être n'importe quoi, mais tous &quot;du même type de n'importe quoi&quot;). </p>

<p>La fonction <code>length</code> définie dans le module standard de OCaml <code>List</code> en est un bon exemple. Peu importe si une liste contient des entiers, des chaînes, des objets ou des ratons-laveurs, la fonction <code>List.length</code> peut être utilisée dessus. Le type de <code>List.length</code> est donc :</p>
<pre>
List.length : 'a list -&gt; int

</pre>

<a name="Structures"></a><h2><span>Structures</span></h2>
<p class="first_para">Le C et le C++ proposent le concept simple de <code>struct</code>, abbréviation de structure. En Java on peut utiliser des classes à la place, mais c'est beaucoup plus laborieux.</p>
<p>Considérons cette simple structure C :</p>
<pre>
struct paire_dentiers {
  int a, b;
};
</pre>

<p class="first_para">L'équivalent le plus simple en OCaml sont les <strong>n-uplets</strong> (tuples), comme la paire <code>(3, 4)</code> qui a pour type <code>int * int</code>. Contrairement aux listes, les n-uplets peuvent contenir des éléments de types différents, par exemple <code>(3, &quot;hello&quot;, 'x')</code> qui a pour type <code>int * string * char</code>.</p>

<p>Une manière légèrement plus complexe de traduire les struct C est d'utiliser un <strong>enregistrement</strong> (record). Les enregistrements, comme les structs C, permettent de nommer leurs composants. Les composants des n-uplets ne peuvent pas être nommées, et il faut se souvenir de l'ordre dans lequel ils apparaissent. Voici l'enregistrement équivalent au struct C ci-dessus : </p>
<pre>
type paire_dentiers = { a : int; b : int };;
</pre>

<p class="first_para">Ceci définit le type, et voici comment <em>créer</em> effectivement des valeurs de ce type :</p>
<pre>
{ a=3; b=5 }
</pre>

<p class="first_para">Remarquez l'utilisation de &quot;:&quot; dans la définition du type et de &quot;=&quot; pour créer des valeurs de ce type.</p>
<p>Voici un exemple d'utilisation des enregistrements, testé avec la boucle interactive :</p>
<pre>
# type paire_dentiers = { a : int; b : int };;
type paire_dentiers = { a : int; b : int; }
# {a=3; b=5};;
- : paire_dentiers = {a = 3; b = 5}
# {a=3};;
Some record field labels are undefined: b
</pre>

<p class="first_para">Donc OCaml refuse de laisser certains champs d'un enregistrement non définis.</p>

<a name="Variants__unions_marquées_et_énumérations_"></a><h2><span>Variants (unions marquées et énumérations)</span></h2>
<p class="first_para">Le concept d'&quot;union marquée&quot; n'existe pas vraiment en C, bien qu'il existe dans le compileur gcc. Voici comment on traduit d'habitude une union marquée en C:</p>
<pre>
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
</pre>

<p class="first_para">Je suppose que nous avons tous déjà vu ça, et ce n'est pas beau à voir. Pour commencer, ce n'est pas sûr : le programmeur peut accidentellement utiliser, disons, le champ <code>u.i</code> quand c'est en fait une chaîne qui est stockée dans la structure. Ensuite, le compilateur ne peut pas facilement vérifier que tous les types ont été considérés dans les instructions <code>switch</code> (on peut utiliser un type <code>enum</code> pour se prémunir contre ce problème précis). Le programmeur peut aussi oublier de modifier le champ <code>type</code>, ce qui peut procurer des heures de jeu. Pour finir, c'est lourdingue.</p>

<p>Voici l'équivalent en OCaml, élégant et concis:</p>
<pre>
type foo = Nothing | Int of int | Pair of int * int | String of string;;
</pre>

<p class="first_para">Voilà pour la définition du type. Au début de chacune des sections, séparées par des <code>|</code>, se trouve un constructeur. On peut les nommer comme on veut, tant que leur nom commence par une capitale. Si un constructeur peut être utilisé pour définir une valeur, il est suivi de <code>of</code> et d'un type, qui lui commence par une minuscule. Dans l'exemple ci-dessus, Nothing est utilisé comme une constante, alors que les autres constructeurs définissent des valeurs.</p>
<p>Pour <em>créer</em> effectivement des valeurs de ce type, on peut écrire:</p>

<pre>
Nothing
Int 3
Pair (4, 5)
String &quot;hello&quot;
     etc.
</pre>

<p class="first_para">Toutes ces expressions ont pour type <code>foo</code>.</p>
<p>Remarquez l'utilisation de <code>of</code> dans la définition du type, qui ne se retrouve PAS dans l'écriture des valeurs de ce type.</p>

<p>Par extension, un simple <code>enum</code> C définit comme</p>
<pre>
enum sign { positive, zero, negative };
</pre>

<p class="first_para">peut être traduit en OCaml par</p>
<pre>
type sign = Positive | Zero | Negative;;
</pre>

<h3>Variants récursifs (utilisés pour les arbres)</h3>

<p class="first_para">Les variants peuvent être récursifs, ce qui est souvent utilisé pour définir des structures de données arborescentes. C'est vraiment là que se révèle l'expressivité des langages fonctionnels :</p>
<pre>
type binary_tree = Leaf of int | Tree of binary_tree * binary_tree;;
</pre>

<p class="first_para">Voilà quelques arbres binaires. Comme exercice, essayez de les dessiner sur un bout de papier.</p>
<pre>
Leaf 3
</pre>

<pre>
Tree (Leaf 3, Leaf 4)
</pre>

<pre>

Tree (Tree (Leaf 3, Leaf 4), Leaf 5)
</pre>

<pre>
Tree (Tree (Leaf 3, Leaf 4), Tree (Tree (Leaf 3, Leaf 4), Leaf 5))
</pre>

<h3>Variants paramétrés</h3>
<p class="first_para">L'arbre binaire de la section précédente comporte un entier à chaque feuille, mais comment faire pour décrire la <em>forme</em> de la structure de données, en laissant le choix de ce qui doit être stocké dans chaque feuille pour plus tard ? On peut utiliser un variant paramétré (ou polymorphique), comme ceci :</p>
<pre>
type 'a binary_tree = Leaf of 'a | Tree of 'a binary_tree * 'a binary_tree;;
</pre>

<p class="first_para">C'est le type général. Le type où chaque feuille stocke un entier s'appelle <code>int binary_tree</code>. De la même façon, le type où chaque feuille stocke une chaîne s'appelle <code>string binary_tree</code>. Pour l'exemple suivant nous allons taper des valeurs dans la boucle interactive, et laisser le système d'inférence de types nous donner leurs types :</p>
<pre>
# Leaf &quot;hello&quot;;;
- : string binary_tree = Leaf &quot;hello&quot;
# Leaf 3.0;;
- : float binary_tree = Leaf 3.
</pre>

<p class="first_para">Remarquez que le nom des types est à l'envers (arbre binaire de flottants -&gt; float binary_tree). C'est comparable avec le nom des types pour les listes, ie <code>int list</code>, etc.</p>

<p>En fait ce n'est pas une coïncidence si <code>'a list</code> est écrit lui aussi &quot;à l'envers&quot;. Les types listes ne sont que des types variants paramétrés, avec une définition légèrement spéciale :  </p>
<pre>
 type 'a list = [] | :: of 'a * 'a list   (* ceci n'est pas du vrai code OCaml *)
</pre>

<p class="first_para">En fait la définition ci-dessus ne compile pas. La définition suivante, très similaire, compile correctement :</p>
<pre>
# type 'a list = Nil | :: of 'a * 'a list;;
type 'a list = Nil | :: of 'a * 'a list
# Nil;;
- : 'a list = Nil
# 1 :: Nil;;
- : int list = :: (1, Nil)
# 1 :: 2 :: Nil;;
- : int list = :: (1, :: (2, Nil))
</pre>

<p class="first_para">Rappelez vous quand nous avons dit précédemment que les listes pouvaient être écrites de deux façons, soit sous la forme syntaxiquement édulcorée <code>[1; 2; 3]</code> ou sous la forme plus formelle <code>1 :: 2 :: 3 :: []</code>. En regardant la définition de <code>'a list</code> ci-dessus, l'origine de la syntaxe formelle devrait vous paraître plus clairement.</p>

<a name="Listes__structures_et_variants___Résumé"></a><h2><span>Listes, structures et variants — Résumé</span></h2>
<p class="first_para">tableau en 3 colonnes avec nom et exemples de définition et de valeur. </p>
<pre>
nom OCaml        Example de définition de type          Exemple(s) de valeur(s) 
liste            int list                               [1; 2; 3]
n-uplet          int * string                           (3, &quot;hello&quot;)
enregistrement   type pair = { a : int; b : string }    { a = 3; b = &quot;hello&quot; }
variant          type foo = Int of int                  Int 3
                           | Pair of int * string                                                                      
variant          type sign = Positive | Zero            Positive
                           | Negative                   Zero
variant          type 'a my_list = Empty                Cons (1, Cons (2, Empty))
  paramétré                | Cons of 'a * 'a my_list

</pre>

<a name="Filtrage__sur_les_structures_de_données_"></a><h2><span>Filtrage (sur les structures de données)</span></h2>
<p class="first_para">Une &quot;Fonctionnalité Vraiment Cool&quot;(tm) des langages fonctionnels est leur capacité à démonter les structures de données et à effectuer du filtrage (pattern matching) sur les données. Ce n'est pas à proprement parler une propriété &quot;fonctionnelle&quot; - on pourrait très bien imaginer une nouvelle sorte de C qui offrirait ces mêmes services. Mais c'est tout de même une &quot;Fonctionnalité Vraiment Cool&quot;.</p>
<p>Commençons par un problème réel : je veux représenter des expressions mathématiques simples comme <code>n * (x + y)</code> et effectuer les multiplications symboliquement pour obtenir <code>n * x + n * y</code>.</p>

<p>Définissons un type pour ces expressions:</p>
<pre>
type expr = Plus of expr * expr        (* pour a + b *)
          | Minus of expr * expr       (* pour a - b *)
          | Times of expr * expr       (* pour a * b *)
	  | Divide of expr * expr      (* pour a / b *)
          | Value of string            (* &quot;x&quot;, &quot;y&quot;, &quot;n&quot;, etc. *)
	  ;;
</pre>

<p class="first_para">L'expression <code>n * (x + y)</code> s'écrirait:</p>

<pre>
Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))
</pre>

<p class="first_para">Ecrivons une fonction qui affiche <code>Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))</code> comme <code>n * (x + y)</code>.  En fait, je vais écrire deux fonctions, l'une qui convertit une expression en une jolie chaîne, et une autre qui l'affiche (comme ça si j'ai envie d'écrire la même chaîne dans un fichier, je n'aurais pas à réécrire la fonction en entier juste pour ça).</p>

<pre>
let rec to_string e =
  match e with
    Plus (left, right)   -&gt; &quot;(&quot; ^ (to_string left) ^ &quot; + &quot; ^ (to_string right) ^ &quot;)&quot;
  | Minus (left, right)  -&gt; &quot;(&quot; ^ (to_string left) ^ &quot; - &quot; ^ (to_string right) ^ &quot;)&quot;

  | Times (left, right)  -&gt; &quot;(&quot; ^ (to_string left) ^ &quot; * &quot; ^ (to_string right) ^ &quot;)&quot;
  | Divide (left, right) -&gt; &quot;(&quot; ^ (to_string left) ^ &quot; / &quot; ^ (to_string right) ^ &quot;)&quot;

  | Value v -&gt; v
  ;;

let print_expr e =
  print_endline (to_string e);;
</pre>

<p class="first_para">(NB: L'opérateur <code>^</code> sert à concaténer les chaînes.)</p>
<p>Voilà la fonction d'affichage à l'oeuvre:</p>
<pre>
# print_expr (Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;)));;
(n * (x + y))

</pre>

<p class="first_para">La forme générale pour le filtrage est:</p>
<pre>
match valeur with
  motif    -&gt;  résultat
| motif    -&gt;  résultat
    ...
</pre>

<p class="first_para">Les motifs dans la colonne de gauche peuvent être simples, comme dans la fonction <code>to_string</code> ci-dessus, ou plus complexe et imbriqués. L'exemple suivant est notre fonction de distribution symbolique de la multiplication des expressions de la forme <code>n * (x + y)</code> ou <code>(x + y) * n</code>, et pour cela on va utiliser un motif imbriqué :</p>

<pre>
let rec multiply_out e =
  match e with
    Times (e1, Plus (e2, e3)) -&gt;
      Plus (Times (multiply_out e1, multiply_out e2),
            Times (multiply_out e1, multiply_out e3))
  | Times (Plus (e1, e2), e3) -&gt;
      Plus (Times (multiply_out e1, multiply_out e3),
            Times (multiply_out e2, multiply_out e3))
  | Plus (left, right) -&gt; Plus (multiply_out left, multiply_out right)
  | Minus (left, right) -&gt; Minus (multiply_out left, multiply_out right)
  | Times (left, right) -&gt; Times (multiply_out left, multiply_out right)
  | Divide (left, right) -&gt; Divide (multiply_out left, multiply_out right)
  | Value v -&gt; Value v
  ;;

</pre>

<p class="first_para">La voilà en action:</p>
<pre>
# print_expr (multiply_out (Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))));;
((n * x) + (n * y))
</pre>

<p class="first_para">Comment est-ce que marche la fonction <code>multiply_out</code> ? L'essentiel se trouve dans les deux premiers motifs. Le premier est <code>Times (e1, Plus (e2, e3))</code> qui filtre les expressions de la forme <code>e1 * (e2 + e3)</code>. Regardez la colonne de droite en face de ce motif, et assurez vous que son contenu équivaut à <code>(e1 * e2) + (e1 * e3)</code>.</p>

<p>Le second motif fait la même chose pour les expressions de la forme <code>(e1 + e2) * e3</code>.</p>
<p>Les autres motifs ne modifient pas la forme de l'expression, mais font le travail nécessaire d'appeler la fonction <code>multiply_out</code> récursivement sur leurs sous-expressions. Cela garantit que toutes les sous-expressions de l'expression sont correctement transformées. (Si vous n'étiez concernés que par la transformation de l'expression la plus externe, tous ces motifs auraient pu être remplacés par une simple règle <code>e -&gt; e</code>).</p>
<p>Est-ce que l'on peut effectuer l'opération inverse (càd factoriser au lieu de distribuer) ? Bien sûr ! (Mais c'est un peu plus compliqué...). La version suivante ne marche que pour l'expression la plus externe. Vous pourriez certainement l'améliorer pour gérer tous les niveaux de sous-expressions, et des cas plus complexes :</p>
<pre>
let factorize e =
  match e with
    Plus (Times (e1, e2), Times (e3, e4)) when e1 = e3 -&gt; Times (e1, Plus (e2, e4))
  | Plus (Times (e1, e2), Times (e3, e4)) when e2 = e4 -&gt; Times (Plus (e1, e3), e4)
  | e -&gt; e
  ;;

</pre>

<pre>
# factorize (Plus (Times (Value &quot;n&quot;, Value &quot;x&quot;), Times (Value &quot;n&quot;, Value &quot;y&quot;)));;
- : expr = Times (Value &quot;n&quot;, Plus (Value &quot;x&quot;, Value &quot;y&quot;))

</pre>

<p class="first_para">La fonction de factorisation ci-dessus introduit une paire de nouvelles fonctionnalités. Vous pouvez ajouter ce qui s'appelle une <strong>garde</strong> à chaque motif. Une garde est une condition précédée de <code>when</code>, et qui signifie que le filtrage n'est fructueux que si le motif correspond <em>et</em> la condition après la clause <code>when</code> est satisfaite.</p>
<pre>
match valeur with
  motif      [ when condition ]   -&gt;  résultat
  motif      [ when condition ]   -&gt;  résultat
    ...

</pre>

<p class="first_para">La seconde fonctionalité est l'opérateur <code>=</code> qui teste l'&quot;égalité structurelle&quot; de deux expressions. Cela signifie qu'il descend récursivement dans chacune de deux expressions pour vérifier qu'elles sont identiques à tous les niveaux.</p>
<p>OCaml est capable de vérifier au moment de la compilation que tous les cas sont couverts par vos motifs. J'ai modifié la définition du <code>type expr</code> précédent pour y ajouter le constructeur <code>Product</code> :</p>

<pre>
type expr = Plus of expr * expr        (* pour a + b *)
          | Minus of expr * expr       (* pour a - b *)
          | Times of expr * expr       (* pour a * b *)
	  | Divide of expr * expr      (* pour a / b *)
	  | Product of expr list       (* pour a * b * c * ... *)
          | Value of string            (* &quot;x&quot;, &quot;y&quot;, &quot;n&quot;, etc. *)
	  ;;
</pre>

<p class="first_para">J'ai ensuite recompilé la fonction <code>to_string</code> sans modifications. OCaml a renvoyé l'avertissement suivant :</p>
<pre>
Warning: this pattern-matching is not exhaustive.
Here is an example of a value that is not matched:
Product _
</pre>


</div>

</body>
</html>
