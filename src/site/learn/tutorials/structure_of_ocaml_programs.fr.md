<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Structure des programmes OCaml</title>
</head>
<body>
  <h1>Structure des programmes OCaml</h1>

<p class="first_para">Maintenant nous allons passer un peu de temps à observer la structure d'ensemble de quelque vrais programmes en OCaml. Je veux vous parler des définitions locales et globales, quand utiliser <code>;;</code> ou <code>;</code>, les modules, les fonctions imbriquées, les références. Pour cela nous allons passer sur plein de concepts d'OCaml qui ne vous diront rien car nous ne les avons pas encore évoqués. Ne vous embarrassez pas des détails pour le moment. Occupez-vous uniquement de la forme générale des programmes, et aux fonctionnalités mises en avant.</p>

<h2>« Variables » locales (<em>plus exactement</em>
  expressions locales)</h2>

<p class="first_para">Prenons la fonction <code>average</code> écrite en C, et ajoutons lui une variable locale. (à comparer avec la première version que nous avions)</p>
<pre>
double
average (double a, double b)
{
  double sum = a + b;
  return sum / 2;
}
</pre>

<p class="first_para">Faisons la même chose avec notre version OCaml :</p>
<pre>
let average a b =
  let sum = a +. b in
  sum /. 2.0;;
</pre>

<p class="first_para">La formule standard <code>let nom = expression in</code> sert à définir une expression locale nommée, et <code>nom</code> peut ensuite être utilisé dans la fonction à la place de <code>expression</code> jusqu'au <code>;;</code> qui marque la fin du bloc de code. Remarquez que nous n'avons pas changé l'indentation après <code>in</code>. Considérez <code>let ... in</code> comme s'il s'agissait d'une instruction.</p>

<p>Maintenant, traduire les variables locales en C par ces expressions locales est une supercherie. En fait ils sont un peu différents. La variable C <code>sum</code> a un emplacement réservé dans la pile. Vous pouvez changer la valeur associée à <code>sum</code> plus loin dans la fonction si vous voulez, ou même prendre l'adresse de <code>sum</code>. Ce n'est PAS possible dans la version OCaml. Dans la version OCaml, <code>sum</code> est juste une abréviation pour l'expression <code>a +. b</code>. Il est impossible d'assigner ou de changer la valeur de <code>sum</code>. (Nous verrons comment avoir de vraies variables un peu plus loin).</p>

<p>Voyons un autre exemple qui devrait clarifier les choses. Les deux bouts de code suivants devraient retourner la même valeur (à savoir (a+b) + (a+b)<sup>2</sup>):</p>
<pre>
let f a b =
  (a +. b) +. (a +. b) ** 2.
  ;;
</pre>

<pre>
let f a b =
  let x = a +. b in
  x +. x ** 2.
  ;;
</pre>

<p class="first_para">Il se peut que la seconde version soit plus rapide (bien que la plupart des compilateurs devraient être capable de faire cette étape d'&quot;élimination de sous-expressions communes&quot; à votre place), et en tout cas elle est plus lisible. Dans le second exemple, <code>x</code> est une abréviation pour l'expression <code>a +. b</code>.</p>

<h2>« Variables » globales (<em>plus précisément</em> expressions
  globales)</h2>

<p class="first_para">Vous pouvez aussi donner des noms à des choses dans l'environnement global, et comme pour les &quot;variables&quot; locales ci-dessus, ce ne sont pas vraiment des variables, mais des abbréviations pour ces choses. Voici un exemple pris dans un programme réel :</p>
<pre>
let html =
  let content = read_whole_file file in
  GHtml.html_from_string content
  ;;

let menu_bold () =
  match bold_button#active with
    true -&gt; html#set_font_style ~enable:[`BOLD] ()
  | false -&gt; html#set_font_style ~disable:[`BOLD] ()
  ;;

let main () =
  (* code omitted *)
  factory#add_item &quot;Cut&quot; ~key:_X ~callback: html#cut
  ;;

</pre>

<p class="first_para">Dans ce vrai morceau de code, <code>html</code> est un &quot;widget&quot; (&quot;contrôle&quot;) d'édition de HTML (un objet provenant de la bibliothèque lablgtk), créé une fois pour toute au début du programme par la première instruction <code>let html =</code>. Il y est ensuite fait référence dans plusieurs des fonctions suivantes.</p>
<p>A noter que le nom <code>html</code> dans le bout de programme ci-dessus ne devrait pas être comparé à une vraie variable globale comme en C ou dans d'autres langages impératifs. Aucun emplacement n'est réservé pour &quot;stocker&quot; le &quot;pointeur sur <code>html</code>&quot;. Il n'est pas non plus possible d'assigner quelque chose à <code>html</code>, par exemple pour lui faire désigner un autre widget. Dans la section suivante nous parlerons des références, qui sont de vraies variables.</p>

<a name="Let_binding____"></a><h2><span>Let-binding (?)</span></h2>
<p class="first_para">Les utilisations de <code>let ...</code> aussi bien au niveau global que dans une fonction, sont souvent appellées des <strong>let-binding</strong>.</p>

<a name="Références___les_vraies_variables"></a><h2><span>Références : les vraies variables</span></h2>
<p class="first_para">Comment faire si vous voulez une vraie variable que vous pouvez assigner puis changer à votre gré dans votre programme ? Il vous faut une <strong>référence</strong>. Les références sont similaires aux pointeurs en C/C++. En Java, toutes les variables qui stockent des objets sont en fait des références (pointeurs) sur ces objets. En Perl, les références sont des références - comme en OCaml.</p>
<p>Voici comment créer une référence sur un entier (<code>int</code>) en OCaml :</p>

<pre>
ref 0;;
</pre>

<p class="first_para">En fait cette instruction n'est pas très utile. Nous avons créé une référence et puis, comme elle n'a pas de nom, le glaneur de cellules a fait son travail et l'a immédiatement libérée! (Il est même probable que le compileur ait éliminé cette instruction à la compilation). Donnons un nom à cette référence :</p>
<pre>
let my_ref = ref 0;;
</pre>

<p class="first_para">Cette référence contient maintenant l'entier 0. Mettons une autre valeur à la place (assignement) :</p>
<pre>
my_ref := 100;;
</pre>

<p class="first_para">Voyons ce que la référence contient à présent :</p>

<pre>
# !my_ref;;
- : int = 100
</pre>

<p class="first_para">Donc l'opérateur <code>:=</code> est utilisé pour assigner les références, et <code>!</code> pour les déréférencer et accéder au contenu. Voici une comparaison approximative avec C/C++ :</p>
<pre>
OCaml                   C/C++

let my_ref = ref 0;;    int a = 0; int *my_ptr = &amp;a;
my_ref := 100;;         *my_ptr = 100;
!my_ref                 *my_ptr
</pre>

<p class="first_para">Les références ont leurs usages, mais vous vous apercevrez que vous ne les utiliserez pas si souvent. La plupart du temps, vous utiliserez <code>let nom = expression in</code> pour nommer des expressions locales dans vos définitions de fonctions.</p>

<a name="Fonctions_imbriquées"></a><h2><span>Fonctions imbriquées</span></h2>
<p class="first_para">Le langage C n'a pas réellement de notion de fonctions imbriquées. GCC les supporte, mais je ne connais pas de programme qui en tire parti. En tout cas, voici ce que la page info de gcc dit sur les fonctions imbriquées :</p>
<p>Une &quot;fonction imbriquée&quot; est une fonction définie à l'intérieur d'une autre fonction (les fonctions imbriquées ne sont pas supportées par GNU C++.) Le nom de la fonction imbriquée est local au bloc dans lequel il est défini.  Par exemple, définissons une fonction imbriquée nommée `square', et appelons-là deux fois :</p>
<pre>
foo (double a, double b)
{
  double square (double z) { return z * z; }

  return square (a) + square (b);
}
</pre>

<p class="first_para">La fonction imbriquée a accès à toutes les variables de la fonction englobante qui sont visibles à l'emplacement de sa définition.  Cela s'appelle la &quot;portée lexicale&quot;.  Par exemple, voici une fonction imbriquée qui utilise une variable héritée nommée `offset' :</p>
<pre>

bar (int *array, int offset, int size)
{
  int access (int *array, int index)
    { return array[index + offset]; }
  int i;
  /* ... */
  for (i = 0; i &lt; size; i++)
    /* ... */ access (array, i) /* ... */
}
</pre>

<p class="first_para">Vous comprenez l'idée. Les fonctions imbriquées sont, cependant, très utiles et largement employées en OCaml. Voici un exemple d'utilisation réel de fonction imbriquées :</p>
<pre>
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
    End_of_file -&gt; Buffer.contents buf;;

</pre>

<p class="first_para">Ne vous inquiétez pas de ce que ce code fait - il utilise beaucoup de concepts que nous n'avons pas encore vu dans ce tutorial. Concentrez-vous plutôt sur la fonction imbriquée principale nommée <code>loop</code> qui ne prend qu'un argument unit.  On peut appeler <code>loop ()</code> depuis l'intérieur de la fonction <code>read_whole_channel</code>, mais elle n'est pas définie en dehors de cette fonction. La fonction imbriquée peut accéder aux variables définies dans la fonction principale (ici <code>loop</code> accède au nom local <code>buf</code>.)</p>

<p>La syntaxe des fonctions imbriquées est la même que pour nommer les expressions locales : <code>let nom <em>arguments</em> = <em>définition de fonction</em> in</code>.</p>
<p>Normalement, vous indenterez la définition de fonction, après être passé à la ligne comme dans l'exemple précédent, et n'oubliez pas d'utiliser <code>let rec</code> à la place de <code>let</code> si votre fonction est récursive (comme dans cet exemple).</p>

<a name="Modules_et__code_open__code_"></a><h2><span>Modules
    et <code>open</code></span></h2>

<p class="first_para">OCaml est accompagné d'une quantité de modules amusants et intéressants, de bibliothèques de code utile. Par exemple on y trouve une bibliothèque pour dessiner des graphismes, interagir avec la collection de contrôles de l'interface-utilisateur graphique, pour manipuler des grands nombres, des structures de données, ou pour faire des appels systèmes POSIX. Ces bibliothèques se trouvent dans <code>/usr/lib/ocaml/<em>VERSION</em>/</code> (sous Unix en tout cas). Pour ces exemples, nous allons nous concentrer sur un module relativement simple appelé <code>Graphics</code>.</p>
<p>Le module <code>Graphics</code> est constitué de cinq fichiers (sur mon système) :</p>

<pre>
/usr/lib/ocaml/graphics.a
/usr/lib/ocaml/graphics.cma
/usr/lib/ocaml/graphics.cmi
/usr/lib/ocaml/graphics.cmxa
/usr/lib/ocaml/graphics.mli
</pre>

<p class="first_para">Pour l'instant occupons-nous de <code>graphics.mli</code>. C'est un fichier texte, que vous pouvez donc lire dès à présent. Notez que son nom est <code>graphics.mli</code> et non <code>Graphics.mli</code>. OCaml met automatiquement une capitale au nom du fichier pour obtenir le nom du module. C'est déroutant quand on ne le sait pas !</p>
<p>Il y a deux moyens pour utiliser les fonctions de <code>Graphics</code>. Ou bien on commence son programme par la déclaration <code>open Graphics;;</code>, ou bien on préfixe tous les appels de fonctions comme ceci : <code>Graphics.open_graph</code>. <code>open</code> ressemble un peu à l'instruction <code>import</code> en Java, ou plus encore comme l'instruction <code>use</code> en Perl.</p>

<p>Une paire d'exemples devrait éclaircir ce point. (Les deux exemples dessinent des choses différentes - essayez-les). Remarquez que le premier exemple appelle <code>open_graph</code> et le second <code>Graphics.open_graph</code>.</p>
<pre>
(* To compile this example: ocamlc graphics.cma grtest1.ml -o grtest1 *)

open Graphics;;

open_graph &quot; 640x480&quot;;;
for i = 12 downto 1 do
  let radius = i * 20 in
  set_color (if (i mod 2) = 0 then red else yellow);
  fill_circle 320 240 radius
done;;
read_line ();;
</pre>

<pre>
(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

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

</pre>

<p class="first_para">Ces deux exemples utilisent des fonctionnalités dont nous n'avons pas encore parlé : boucles &quot;for&quot; dans le style impératif, if-then-else, et récursion. Nous en parlerons plus tard. Examinez-les cependant, et essayez de comprendre (1) comment ils fonctionnent, et (2) comment l'inférence de type aide à éliminer des bugs.</p>

<a name="Le_module__code_Pervasives__code_"></a><h2><span>Le
    module <code>Pervasives</code></span></h2>

<p class="first_para">Il y a un module que vous n'avez jamais besoin d'ouvrir avec <code>open</code>, c'est le module <code>Pervasives</code> (allez jeter un oeil sur <code>/usr/lib/ocaml/<em>VERSION</em>/pervasives.mli</code>). Tous les symboles définis dans le module <code>Pervasives</code> sont implicitement importés dans tous les programmes OCaml.</p>

<a name="Renommage_de_modules"></a><h2><span>Renommage de modules</span></h2>
<p class="first_para">Que faire si vous voulez utiliser des symboles en provenance du module <code>Graphics</code>, mais ne voulez pas tous les importer, et n'avez pas envie de taper <code>Graphics.</code> à chaque fois ? Renommez le module avec cette astuce :</p>
<pre>
module Gr = Graphics;;

Gr.open_graph &quot; 640x480&quot;;;
Gr.fill_circle 320 240 240;;
read_line ();;
</pre>

<p class="first_para">Cela devient vraiment utile quand vous voulez utiliser les symboles d'un module imbriqué (les modules peuvent être imbriqués les uns dans les autres, eux-aussi), mais ne voulez pas avoir à taper à chaque fois le chemin d'accès au module imbriqué.</p>

<a name="Utiliser_et_omettre__code_____code__et__code____code_"></a><h2>Utiliser et omettre <code>;;</code> et <code>;</code></h2>

<p class="first_para">Maintenant nous allons aborder un problème important. Quand utiliser <code>;;</code>, quand utiliser <code>;</code>, et quand n'utiliser aucun des deux ? C'est une question tordue, qui m'a également embêté pendant longtemps alors que j'apprenais le langage OCaml. </p>
<p>La règle n°1 est que vous devriez utiliser <code>;;</code> pour séparer les instructions de niveau général dans votre code, et <em>jamais</em> au milieu d'une définition de fonction ou d'aucune autre instruction.</p>

<p>Reprenons un bout du second exemple graphique précédent:</p>
<pre>
Random.self_init ();;
Graphics.open_graph &quot; 640x480&quot;;;

let rec iterate r x_init i =
        if i = 1 then x_init
        else
                let x = iterate r x_init (i-1) in
                r *. x *. (1.0 -. x);;
</pre>

<p class="first_para">Nous avons deux instructions au niveau global et une définition de fonction (la fonction nommée <code>iterate</code>). Chacune est suivie par <code>;;</code>.</p>
<p>La règle n°2 est que <em>parfois</em> vous pouvez omettre <code>;;</code>. En tant que débutant vous pouvez vous dispenser de cette règle - et toujours utiliser <code>;;</code> comme prescrit par la règle n°1. Mais puisque vous aurez sûrement à lire du code écrit par d'autres, vous devez savoir que <code>;;</code> peut parfois être omis. Les endroits où cela est possible sont :</p>

<ul><li>Avant le mot clé <code>let</code>.</li>
<li>Avant le mot clé <code>open</code>.</li>
<li>Avant le mot clé <code>type</code>.</li>
<li>À la toute fin du fichier</li>
<li>À quelques (très rares) endroits où OCaml peut deviner que ce qui vient ensuite est une nouvelle instruction et non la suite de l'instruction courante.</li></ul>
<p class="first_para">Voici un exemple de code correct, où <code>;;</code> a été omis quand c'était possible :</p>

<pre>
open Random                   (* ;; *)
open Graphics;;

self_init ();;
open_graph &quot; 640x480&quot;         (* ;; *)

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
</pre>

<p class="first_para">Les règles n°3 et n°4 concernent le simple <code>;</code>. Il n'a rien à voir avec <code>;;</code>. Le point-virgule simple <code>;</code> est le <strong>séparateur de séquence</strong>, c'est à dire qu'il a le même rôle que le point-virgule en C, C++, Java ou Perl. Il signifie &quot;fait ce qu'il y a avant en premier, et quand c'est terminé, fait ce qu'il y a après&quot;. Je suis sûr que vous l'ignoriez.</p>

<p>La règle n°3 est : Considérez <code>let ... in</code> comme une instruction, et ne mettez jamais un simple <code>;</code> après lui.</p>
<p>La règle n°4 est : Pour tous les autres instructions dans un bloc de code, faites-les suivre par un simple <code>;</code>, <em>à l'exception</em> de la dernière.</p>
<p>La boucle for interne de notre exemple ci-dessus est une bonne démonstration. Remarquez que nous n'utilisons jamais de simple <code>;</code> dans ce code :</p>

<pre>
        for i = 0 to 39 do
                let x_init = Random.float 1.0 in
                let x_final = iterate r x_init 500 in
                let y = int_of_float (x_final *. 480.) in
                Graphics.plot x y
        done
</pre>

<p class="first_para">Le seul endroit dans ce code où on pourrait imaginer mettre un <code>;</code> est après <code>Graphics.plot x y</code>, mais comme c'est la dernière instruction de son bloc, la règle n°4 nous dit qu'il ne faut pas le faire.</p>
<p><strong>Remarque à propos de &quot;;&quot;</strong> Brian Hurt m'a écrit pour me corriger au sujet de &quot;;&quot;</p>

<p><code>;</code> est un opérateur, au même titre que <code>+</code> est un opérateur. Enfin, peut-être pas tout à fait, mais conceptuellement ils sont de même nature. <code>+</code> est de type <code>int -&gt; int -&gt; int</code> - il prend deux entiers et retourne un entier (leur somme). <code>;</code> est de type <code>unit -&gt; 'b -&gt; 'b</code> - il prend deux valeurs et retourne uniquement la seconde.  Un peu comme l'opérateur <code>,</code> (virgule) en C. Ecrire <code>a ; b ; c ; d</code> est aussi naturel que d'écrire <code> a + b + c + d</code>.</p>

<p>C'est un de ces &quot;sauts conceptuels&quot; qui ne sont jamais explicités clairement - en OCaml, quasiment tout est une expression. <code>if/then/else</code> est une expression.  <code>a ; b</code> est une expression.  <code>match foo with ...</code> est une expression.  Les codes suivants sont parfaitement légaux (et tous font la même chose) :</p>
<pre>
let f x b y = if b then x+y else x+0

let f x b y = x + (if b then y else 0)

let f x b y = x + (match b with true -&gt; y | false -&gt; 0)

let f x b y = x + (let g z = function true -&gt; z | false -&gt; 0 in g y b)

let f x b y = x + (let _ = y + 3 in (); if b then y else 0)

</pre>

<p class="first_para">Notez tout particulièrement la dernière fonction - j'utilise <code>;</code> comme opérateur pour &quot;joindre&quot; deux instructions. En OCaml, toutes les fonctions peuvent être exprimées par :</p>
<pre>
let nom [paramètres] = expression
</pre>

<p class="first_para">La définition de ce qu'est une expression en OCaml est juste un peu plus large qu'en C. En fait, C a un concept d'&quot;instruction&quot; - mais toutes les instructions du C sont des expressions en OCaml (combinées avec l'opérateur <code>;</code>).</p>

<p>Une différence entre <code>;</code> et <code>+</code> est que je peux utiliser <code>+</code> comme une fonction.  Par exemple, je peux définir une fonction <code>sum_list</code> pour calculer la somme d'une liste d'entier comme ceci :</p>
<pre>
let sum_list = List.fold_left ( + ) 0
</pre>

<a name="Toutes_ces_notions_ensemble___un_exemple_de_code_réel"></a><h2><span>Toutes ces notions ensemble : un exemple de code réel</span></h2>
<p class="first_para">Dans cette section nous allons regarder quelques fragments de vrai code pris dans la bibliothèque lablgtk 1.2. (Lablgtk est la bibliothèque OCaml d'interfaçage avec la bibliothèque de widgets Gtk, native sous Unix). Un avertissement : ces fragments utilisent beaucoup de concepts que nous n'avons pas encore abordé. Ne vous arrêtez pas sur les détails, regardez plutôt la forme générale du code, comment les auteurs ont utilisé <code>;;</code>, où ils ont utilisé <code>;</code> et où ils ont utilisé <code>open</code>, comment ils ont indenté le code, et utilisé des expressions nommées locales ou globales.</p>
<p>... Je vais quand même vous donner quelques indices pour que vous ne soyez pas totalement perdus !</p>
<ul><li><code>?foo</code> et <code>~foo</code> est la façon de passer des paramètres optionels et nommés en OCaml. Il n'y a pas vraiment d'équivalent dans les langages de la famille de C, mais Perl, Python et Smalltalk permettent tous de nommer les arguments d'un appel de fonction, en oublier certains, et fournir les autres dans n'importe quel ordre.</li>

<li><code>foo#bar</code> est un appel de méthode (appel de la méthode nommée <code>bar</code> de l'objet nommé <code>foo</code>).  C'est l'équivalent de <code>foo-&gt;bar</code>, ou <code>foo.bar</code> ou <code>$foo-&gt;bar</code> en C++, Java et Perl, respectivement.</li></ul>

<p class="first_para">Premier fragment : Le programmeur ouvre une paire de modules standards (en omettant le <code>;;</code> parce que les mots clés suivants sont <code>open</code> et <code>let</code>, respectivement). Il crée ensuite une fonction nommée <code>file_dialog</code>. Dans cette fonction il définit une expression nommée appelée <code>sel</code> en utilisant une instruction <code>let sel = ... in</code> de deux lignes. Puis il appelle plusieurs méthodes de <code>sel</code>.</p>

<pre>
(* First snippet *)

open StdLabels
open GMain

let file_dialog ~title ~callback ?filename () =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:do_ok;
  sel#show ()
</pre>

<p class="first_para">Deuxième fragment : Juste une longue liste de définitions au niveau global. Remarquez que l'auteur a omis toutes les occurrences de <code>;;</code> grâce à la règle n°2.</p>
<pre>
(* Second snippet *)

let window = GWindow.window ~width:500 ~height:300 ~title:&quot;editor&quot; ()
let vbox = GPack.vbox ~packing:window#add ()

let menubar = GMenu.menu_bar ~packing:vbox#pack ()
let factory = new GMenu.factory menubar
let accel_group = factory#accel_group
let file_menu = factory#add_submenu &quot;File&quot;
let edit_menu = factory#add_submenu &quot;Edit&quot;

let hbox = GPack.hbox ~packing:vbox#add ()
let editor = new editor ~packing:hbox#add ()
let scrollbar = GRange.scrollbar `VERTICAL ~packing:hbox#pack ()
</pre>

<p class="first_para">Troisième fragment : L'auteur importe tous les symboles du module <code>GdkKeysyms</code>. Puis nous avons un let-binding inhabituel. <code>let _ = expression</code> signifie &quot;évalue la valeur de expression (avec tous les effets de bords que cela comporte), puis jette le résultat&quot;. En l'occurrence, &quot;calcule la valeur de l'expression&quot; signifie exécuter <code>Main.main ()</code> qui est la boucle principale de Gtk, qui a pour effet de bord d'ouvrir la fenêtre de l'application à l'écran. Le &quot;résultat&quot; de <code>Main.main ()</code> est sans importance - probablement la valeur <code>unit</code>, mais je n'ai pas vérifié - et elle n'est retournée que quand l'application est en train de se terminer.</p>

<p>Remarquez que dans ce fragment nous avons de longues successions de commandes procédurales. C'est un programme impératif classique.</p>
<pre>
(* Third snippet *)

open GdkKeysyms

let _ =
  window#connect#destroy ~callback:Main.quit;
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item &quot;Open...&quot; ~key:_O ~callback:editor#open_file;
  factory#add_item &quot;Save&quot; ~key:_S ~callback:editor#save_file;
  factory#add_item &quot;Save as...&quot; ~callback:editor#save_dialog;
  factory#add_separator ();
  factory#add_item &quot;Quit&quot; ~key:_Q ~callback:window#destroy;
  let factory = new GMenu.factory edit_menu ~accel_group in
  factory#add_item &quot;Copy&quot; ~key:_C ~callback:editor#text#copy_clipboard;
  factory#add_item &quot;Cut&quot; ~key:_X ~callback:editor#text#cut_clipboard;
  factory#add_item &quot;Paste&quot; ~key:_V ~callback:editor#text#paste_clipboard;
  factory#add_separator ();
  factory#add_check_item &quot;Word wrap&quot; ~active:false
    ~callback:editor#text#set_word_wrap;
  factory#add_check_item &quot;Read only&quot; ~active:false
    ~callback:(fun b -&gt; editor#text#set_editable (not b));
  window#add_accel_group accel_group;
  editor#text#event#connect#button_press
    ~callback:(fun ev -&gt;

      let button = GdkEvent.Button.button ev in
      if button = 3 then begin
        file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
      end else false);
  editor#text#set_vadjustment scrollbar#adjustment;
  window#show ();
  Main.main ()
</pre>


</div>


</body>
</html>
