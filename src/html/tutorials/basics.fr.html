<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Notions de base</title>
  </head>
  <body>
    <h1>Notions de base</h1>

<h2>Commentaires</h2>
<p>Les commentaires OCaml sont délimités par <code>(*</code> et <code>*)</code>, comme ceci:</p>

<pre>
(* Ceci est une ligne de commentaire. *)

(* Ceci est
 * un commentaire
 * multi-ligne.
 *)
</pre>

<p class="first_para">Autrement dit, les commentaires ressemblent fortement aux commentaires du C traditionnel (<code>/* ... */</code>).</p>
<p>Il n'y a pas actuellement de syntaxe pour les commentaires de fin de ligne comme <code># ...</code> en Perl ou <code>// ...</code> en C99/C++/Java. L'emploi de <code>## ...</code> a été évoqué à quelques occasions, et je recommande fortement à l'équipe d'OCaml d'ajouter ça dans les versions à venir.</p>

<p>OCaml prend en compte les commentaires imbriqués, ce qui permet facilement de mettre des portions de code en commentaire:</p>
<pre>
(* Ce code n'est pas au point...

(* Test de primalité. *)
let is_prime n =
  (* pense-bête: demander ça aux mailing lists *) XXX;;

*)
</pre>

<a name="Appels_de_fonctions"></a><h2><span>Appels de fonctions</span></h2>
<p class="first_para">Supposons que vous ayez écrit une fonction nommée <code>repeated</code>, qui prend en argument une chaîne de caractères <code>s</code> et un nombre <code>n</code> et renvoie une nouvelle chaîne de caractères qui contient l'originale répétée <code>n</code> fois.</p>

<p>Dans la plupart des languages dérivés du C, un appel de fonction ressemble à ça :</p>
<pre>
repeated (&quot;hello&quot;, 3)  /* c'est du code C */
</pre>

<p class="first_para">Ca veut dire « appelle la fonction <code>repeated</code> avec deux arguments, le premier étant la chaîne de caractères hello et le second étant le nombre 3 ».</p>
<p>OCaml, tout comme d'autres langages fonctionnels, écrit et parenthèse différemment les appels de fonctions, ce qui entraîne bien des erreurs au début. Voici le même appel de fonction en OCaml :</p>
<pre>
repeated &quot;hello&quot; 3  (* c'est du code OCaml *)

</pre>

<p class="first_para">Notez-bien : <strong>pas</strong> de parenthèses, et <strong>pas</strong> de virgule entre les arguments.</p>
<p>Maintenant ce qui est source de confusion est que <code>repeated (&quot;hello&quot;, 3)</code> <strong>a un sens</strong> particulier en OCaml. Cela signifie « appelle la fonction <code>repeated</code> avec UN argument, cet argument étant une structure représentant un couple d'éléments ». Bien sûr ce serait ici une erreur puisque la fonction <code>repeated</code> attend 2 arguments et non un seul, et que quoi qu'il en soit le premier argument doit être une chaîne de caractères et non un couple. Mais laissons de côté les couples (n-uplets) pour le moment. Retenez plutôt que c'est une erreur de mettre des parenthèses et des virgules autour des arguments de fonctions.</p>

<p>Intéressons-nous maintenant à une autre fonction - <code>get_string_from_user</code> - qui prend en argument une chaîne de caractères qui demande à l'utilisateur de taper quelque chose et renvoie la chaîne de caractère ainsi entrée. Nous voulons passer cette chaîne de caractères à la fonction <code>repeated</code>. Voici les versions C et OCaml :</p>
<pre>
/* code C: */
repeated (get_string_from_user (&quot;Veuillez entrer une chaîne de caractères.&quot;), 3)
</pre>

<pre>
(* code OCaml: *)
repeated (get_string_from_user &quot;Veuillez entrer une chaîne de caractères.&quot;) 3

</pre>

<p class="first_para">Soyez attentif au parenthésage et à l'absence de virgules. En général la règle est la suivante : « mettez des parenthèses autour de tout l'appel de fonction - ne mettez pas de parenthèses autour des arguments passés à une fonction ». Voici quelques exemples supplémentaires :</p>
<pre>
f 5 (g &quot;hello&quot;) 3    (* f a 3 arguments, g a un argument *)
f (g 3 4)            (* f a un argument, g a 2 arguments *)

# repeated (&quot;hello&quot;, 3);;     (* OCaml va repérer l'erreur *)
This expression has type string * int but is here used with type string
</pre>

<a name="Définir_une_fonction"></a><h2><span>Définir une fonction</span></h2>
<p class="first_para">Vous savez tous comment on définit une fonction (ou une méthode statique, pour ceux qui pensent en Java) dans d'autres langages. Comment fait-on ça en OCaml ?</p>
<p>La syntaxe d'OCaml est agréablement concise. Voici une fonction qui prend deux nombres flottants et calcule leur moyenne :</p>

<pre>
let average a b =
  (a +. b) /. 2.0;;
</pre>

<p class="first_para">Tapez ceci dans le « toplevel » OCaml (sous Unix, tapez <code>ocaml</code> depuis le shell) et voici ce que vous verrez :</p>
<pre>
# let average a b =
  (a +. b) /. 2.0;;
val average : float -&gt; float -&gt; float = &lt;fun&gt;

</pre>

<p class="first_para">Si vous regardez la définition de fonction d'un peu plus près, et aussi ce qu'OCaml vous affiche, vous devez vous posez un certain nombre de questions :</p>
<ul><li>Que font ces points insérés après + et / ?</li>
<li>Qu'est-ce <code>float -&gt; float -&gt; float</code> peut bien vouloir dire ?</li></ul>
<p class="first_para">Je vais répondre à toutes ces questions dans les sections qui viennent, mais commençons plutôt par définir la même fonction en C (la version Java serait très semblable à la version C), et normalement ça devrait soulever encore plus d'interrogations. Voici notre version C de <code>average</code>:</p>

<pre>
double
average (double a, double b)
{
  return (a + b) / 2;
}
</pre>

<p class="first_para">Maintenant revenez sur la définition OCaml vue précédemment. Vous devriez vous demander :</p>
<ul><li>Pourquoi n'a-t-on pas besoin de définir les types de <code>a</code> et <code>b</code> dans la version OCaml ? Comment OCaml fait-il pour connaître leurs types, et au fait le sait-il au moins, ou est-ce que OCaml est typé dynamiquement ?</li>
<li>En C, le <code>2</code> est implicitement converti en un <code>double</code>, mais pourquoi OCaml ne fait-il pas la même chose ?</li>

<li>Comment écrit-on un <code>return</code> en OCaml ?</li></ul>
<p class="first_para">OK, voyons ça.</p>
<ul><li>OCaml est un langage fortement typé (en d'autres mots, il n'y a rien de dynamique concernant les types, comme ce serait le cas en Perl).</li>
<li>OCaml utilise un mécanisme d'<em>inférence de types</em>, c'est-à-dire qu'il devine les types tout seul. Si vous utilisez le toplevel OCaml comme précédemment, alors OCaml vous donnera [ce qu'il pense être...] le type correct de votre fonction.</li>
<li>OCaml ne fait pas de conversions de types implicites. Si vous voulez un flottant, vous devez écrire <code>2.0</code> parce que <code>2</code> est un entier.</li>

<li>Parce qu'OCaml ne permet pas la surcharge (overloading) d'opérateurs, il a deux opérateurs différents pour signifier « ajoute deux entiers » (c'est +) et « ajoute deux flottants » (c'est +. - notez bien le point). Et c'est la même chose pour les autres opérateurs arithmétiques.</li>
<li>OCaml renvoie la dernière expression de la fonction, donc pas besoin d'écrire <code>return</code> comme en C.</li></ul>
<p class="first_para">Les détails sur tout ça vont être expliqués dans les sections et chapitres qui suivent.</p>
<a name="Types_de_base"></a><h2><span>Types de base</span></h2>
<p class="first_para">En OCaml les types de base sont:</p>
<pre>
Type OCaml     Intervalle de définition
</pre>

<pre>
int            Entier avec signe 31 bits (environ +/- 1 milliard) avec processeurs 32 bits
               ou bien 63 bits avec processeurs 64 bits
float          Nombre à virgule flottante double-précision IEEE, équivalent au type double du C
bool           Un booléen, noté true (vrai) ou false (faux)
char           Un caractère à 8 bits
string         Une chaîne de caractères à 8 bits
unit           Valeur unique notée ()
</pre>

<p class="first_para">Un des bits de chaque <code>int</code> est utilisé en interne par OCaml pour la gestion de la mémoire (garbage collection ou récupération automatique de mémoire). C'est pourquoi le type <code>int</code> a 31 bits au lieu de 32 (63 si vous utilisez une plate-forme 64 bits). En pratique ce n'est un problème que dans quelques cas très spécifiques. Par exemple si vous comptez des choses en utilisant une boucle, OCaml vous limite à compter un milliard d'éléments au lieu de 2 milliards. Ce n'est pas un problème parce que si vous comptez autant de choses dans n'importe quel langage vous devriez de toute façon utiliser des entiers à précision infinie (modules <code>Nat</code> et <code>Big_int</code> en OCaml). Néanmoins si vous avez besoin de manipuler des types avec exactement 32 bits (par exemple si vous écrivez du code pour faire de la cryptographie ou pour des protocoles réseau), OCaml fournit un type <code>nativeint</code> qui correspond exactement au type d'entiers correspondant à votre plate-forme.</p>

<p>OCaml n'a pas de type de base pour les entiers sans signe (unsigned), mais  vous pouvez obtenir le même effet en utilisant <code>nativeint</code>. OCaml n'a pas non plus de type flottant simple précision.</p>
<p>OCaml fournit un type <code>char</code> qui est utilisé pour les caractères,  comme par exemple <code>'x'</code>. Malheureusement le type <code>char</code> ne permet pas de représenter les caractères Unicode puisqu'il ne supporte que 256 caractères différents. C'est un problème important qui n'est pas résolu au niveau d'OCaml directement, mais cependant il y a des <a href="http://camomile.sourceforge.net/" class="external" title="http://camomile.sourceforge.net/">bibliothèques</a> qui fournissent des types et des fonctions pour manipuler les caractères Unicode et leurs différents encodages.</p>

<p>Les strings ne sont pas des listes de caractères. Elles ont leur propre représentation interne qui est particulièrement efficace.</p>
<p>Le type <code>unit</code> est en quelque sorte l'équivalent de <code>void</code> en C, nous en reparlerons plus tard.</p>
<a name="Conversions_de_types_implicites_ou_explicites"></a><h2><span>Conversions de types implicites ou explicites</span></h2>
<p class="first_para">Dans les langages dérivés du C, les ints se retrouvent convertis en flottants dans certaines circonstances. Par exemple si vous écrivez <code>1 + 2.5</code> le premier argument (qui est un entier) est converti en flottant, et le résultat est également un flottant. C'est comme si vous aviez écrit <code>((double) 1) + 2.5</code>, mais cela s'est fait implicitement.</p>

<p>OCaml ne fait jamais ce genre de conversion implicites (implicit casts). En OCaml, <code>1 + 2.5</code> est une erreur de type. L'opérateur <code>+</code> en OCaml requiert deux arguments entiers, et si on lui donne un int et un float, il indique cette erreur :</p>
<pre>
# 1 + 2.5;;
      ^^^
This expression has type float but is here used with type int
</pre>

<p class="first_para">Cela signifie &quot;ceci est un float, mais ici j'attendais un int&quot;.</p>
<p>Pour ajouter deux floats, il faut utiliser un opérateur différent,  <code>+.</code> (notez le point qui suit le plus).</p>

<p>OCaml ne convertit pas les ints en floats automatiquement, donc le code suivant est également incorrect :</p>
<pre>
# 1 +. 2.5;;
  ^
This expression has type int but is here used with type float
</pre>

<p class="first_para">Dans ce cas OCaml se plaint du premier argument.</p>
<p>Comment faire alors si on veut vraiment ajouter un int à un float ? (Supposons qu'ils soient stockés dans des variables appelées <code>i</code> et <code>f</code>). En OCaml la conversion doit être explicite :</p>
<pre>
float_of_int i +. f;;

</pre>

<p class="first_para"><code>float_of_int</code> est une fonction qui prend un <code>int</code> et renvoie un <code>float</code>.  Il y a toute une collection de fonctions de ce genre, comme par exemple <code>int_of_float</code>, <code>char_of_int</code>,  <code>int_of_char</code>, <code>string_of_int</code> et ainsi de suite, et elle font essentiellement ce qu'on attend d'elles.</p>

<p>Puisque convertir un <code>int</code> en un <code>float</code> est une opération particulièrement courante, la fonction <code>float_of_int</code> a également un autre nom, plus court : l'exemple ci-dessus aurait pu simplement être écrit</p>
<pre>
float i +. f;;
</pre>

<p class="first_para">(Remarquez bien que contrairement au C, en OCaml il est parfaitement possible qu'un type et qu'une fonction portent le même nom.)</p>

<h3>Qu'est-ce qui est mieux, conversion implicite ou explicite ?</h3>
<p class="first_para">Vous être peut-être en train de vous dire que ces conversions explicites sont lourdes, peut-être même qu'elles font perdre du temps, et c'est justifié, mais il y a au moins deux arguments en leur faveur. Premièrement, OCaml a besoin de cette conversion explicite pour l'inférence de type (voir plus bas), et l'inférence de type permet de gagner énormément de temps de développement, et taper un peu plus au clavier est une perte insignifiante à côté. Deuxièmement, si vous avez passé du temps à débugger des programmes C vous devez savoir que (a) les conversions (« casts ») implicites entraînent des erreurs qui sont difficiles à détecter, et (b) vous passez alors une bonne partie du temps à vous demander où les conversions ont lieu. Les rendre explicites vous aide donc pour le débuggage. Troisièmement, certaines conversions (notamment int &lt;-&gt; float) sont vraiment des opérations coûteuses. Cela ne vous rapporte pas grand-chose de les cacher.</p>
<a name="Fonctions_ordinaires_et_fonctions_récursives"></a><h2><span>Fonctions ordinaires et fonctions récursives</span></h2>
<p class="first_para">Contrairement au langage C et ses dérivés, une fonction en OCaml n'est récursive que si vous le précisez en utilisant <code>let rec</code> au lieu de seulement <code>let</code>. Voici un exemple de fonction récursive :</p>
<pre>

let rec range a b =
  if a &gt; b then []
  else a :: range (a+1) b
  ;;
</pre>

<p class="first_para">Remarquez que <code>range</code> s'appelle elle-même.</p>
<p>La seule différence entre <code>let</code> et <code>let rec</code> est au niveau de la visibilité du nom de la fonction. Si la fonction ci-dessus avait été définie avec <code>let</code> tout seul, alors l'appel à <code>range</code> aurait essayé de trouver une fonction nommée <code>range</code> précédemment définie, et pas la fonction en cours de définition. Il n'y a pas de différence de performance entre les fonctions définies avec <code>let</code> et celles définies avec <code>let rec</code>, donc si vous préférez vous pouvez toujours utiliser la forme <code>let rec</code> et vous aurez ainsi la même sémantique qu'en C et dérivés.</p>

<a name="Types_des_fonctions"></a><h2><span>Types des fonctions</span></h2>
<p class="first_para">Du fait de l'inférence de type, vous n'aurez presque jamais à écrire le type de vos fonctions. Cependant OCaml affiche fréquemment ce qu'il pense être le type de vos fonctions, donc il vous faut connaître la syntax qu'il utilise. Pour une fonction <code>f</code> qui prend comme arguments <code>arg<sub>1</sub></code>, <code>arg<sub>2</sub></code>, ...  <code>arg<sub>n</sub></code>, et retourne quelque chose de  type <code>rettype</code>, le compilateur affichera :</p>

<pre>
f : arg1 -&gt; arg2 -&gt; ... -&gt; argn -&gt; rettype
</pre>

<p class="first_para">Cette syntaxe avec des flèches peut vous paraître étrange pour l'instant, mais lorsque nous parlerons de l'application partielle, vous verrez pourquoi ça a été choisi comme ça. Pour le moment, voici simplement quelques exemples.</p>
<p>Notre fonction <code>repeated</code> qui prend une chaîne de caractères et un entier et renvoie une chaîne de caractères a le type suivant :</p>

<pre>
repeated : string -&gt; int -&gt; string
</pre>

<p class="first_para">Notre fonction <code>average</code> qui prend deux flottants et renvoie un flottant a le type suivant :</p>
<pre>
average : float -&gt; float -&gt; float

</pre>

<p class="first_para">La fonction de conversion OCaml standard <code>int_of_char</code> a le type suivant :</p>
<pre>
int_of_char : char -&gt; int
</pre>

<p class="first_para">Si une fonction ne renvoie rien (<code>void</code> pour les programmeurs C et Java), on écrit qu'elle renvoie le type <code>unit</code>. Voici par exemple l'équivalent OCaml de <code>fputc</code> :</p>

<pre>
output_char : out_channel -&gt; char -&gt; unit
</pre>

<h3>Fonctions polymorphes</h3>
<p class="first_para">Voyons maintenant quelqu'un d'un peu plus étrange. Que pensez-vous d'une fonction qui prend <em>n'importe quoi</em> comme argument ? Voici une fonction bizarre qui prend un argument, l'ignore et renvoie toujours 3 :</p>
<pre>
let give_me_a_three x = 3;;

</pre>

<p class="first_para">Quel est le type de cette fonction ? En OCaml on utilise une notation spéciale pour dire « le type que vous voulez ». C'est un caractères apostrophe suivi d'une lettre. Le type de la fonction ci-dessus s'écrit donc normalement comme ceci :</p>
<pre>
give_me_a_three : 'a -&gt; int
</pre>

<p class="first_para">où <code>'a</code> est mis pour n'importe quel type. Vous pouvez par exemple utiliser cette fonction comme ceci: <code>give_me_a_three &quot;foo&quot;</code>, ou comme cela: <code>give_me_a_three 2.0</code>, et les deux sont tout-à-fait valides en OCaml.</p>

<p>Pour le moment l'utilité des fonctions polymorphes n'est pas évidente, mais elles sont vraiment très utiles et très communes, nous en parlerons plus tard. (nous verrons que c'est un peu comme les templates en C++ ou les generics en Java 1.5).</p>
<a name="Inférence_de_types"></a><h2><span>Inférence de types</span></h2>
<p class="first_para">Donc le thème de ce tutoriel est que les langages fonctionnels ont un tas de Fonctionnalités Vraiment Cool, et OCaml est un langage qui a tous ces Trucs Bien Sympas en même temps, ce qui en fait un langage très pratique pour les programmeurs. Mais le plus bizarre est sans doute que la plupart de ces propriétés avantageuses n'ont en fait rien à voir avec la « programmation fonctionnelle ». Quoi qu'il en soit, voici donc le premier de ces Trucs Bien Sympas: l'inférence de types.</p>
<p>En deux mots : vous n'avez pas besoin de déclarer le type de vos fonctions et variables puisqu'OCaml fait ça pour vous.</p>
<p>En plus OCaml vérifie que tous vos types collent bien entre eux, même entre différents fichiers.</p>
<p>Et comme OCaml est aussi un langage pratique, il fournit également certains moyens pour contourner le système de types et ses vérifications, pour les (très) rares cas où cela est nécessaire. Il n'y a probablement que les gourous qui auront éventuellement besoin de pratiquer ce genre de sport.</p>
<p>Retournons maintenant à la fonction <code>average</code> que nous avions tapé ainsi dans le toplevel :</p>

<pre>
# let average a b =
  (a +. b) /. 2.0;;
val average : float -&gt; float -&gt; float = &lt;fun&gt;
</pre>

<p class="first_para">Oh merveille ! OCaml a deviné tout seul que la fonction prend deux arguments de type <code>float</code> et renvoie un <code>float</code>.</p>

<p>Comment a-t-il fait ? Tout d'abord il regarde où <code>a</code> et <code>b</code> sont utilisés, en l'occurrence dans l'expression  <code>(a +. b)</code>. Ensuite, étant donné que <code>+.</code> est lui-même une fonction qui prend deux arguments de type <code>float</code>, il en déduit simplement que <code>a</code> et <code>b</code> doivent être de type <code>float</code>.</p>

<p>Après ça, la fonction <code>/.</code> renvoie un <code>float</code>, qui est également la valeur de retour de la fonction <code>average</code>. Donc <code>average</code> doit renvoyer un <code>float</code>. En conclusion, le type de <code>average</code> correspond à la signature suivante :</p>

<pre>
average : float -&gt; float -&gt; float
</pre>

<p class="first_para">L'inférence de types est bien sûr assez simple pour un programme aussi court, mais elle fonctionne aussi pour les programmes de grande taille. C'est une des qualités majeures du langage parce que ça supprime toute une classe d'erreurs qui produisent des segfaults, <code>NullPointerException</code>s et autres <code>ClassCastException</code>s dans d'autres langages (ou bien des warnings bien souvent ignorés comme en Perl).</p>

</div>

</body>
</html>
