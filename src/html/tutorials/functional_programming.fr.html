<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Programmation fonctionnelle</title>
</head>
<body>
  <h1>Programmation fonctionnelle</h1>

<a name="Qu_est_ce_que_la_programmation_fonctionnelle__"></a><h2><span>Qu'est-ce que la programmation fonctionnelle ?</span></h2>

<p class="first_para">Nous sommes arrivé relativement loin dans ce tutorial et nous n'avons pas encore abordé la <strong>programmation fonctionnelle</strong>. Il serait imaginable de voir toutes les fonctionnalités données jusqu'à présent - rich data types, pattern matching, inférence de types, fonctions imbriquées - dans une espèce de «Super langage C». Ce sont certainement des fonctionnalités «cools» qui rendent le code concis, facile à lire et qui permettent d'avoir moins de bugs, mais elles n'ont que très peu à voir avec la programmation fonctionnelle.</p>
<p>En fait, la raison pour laquelle les langages fonctionnels sont si bien n'est <em>pas</em> grâce à la programmation fonctionnelle, mais parce que nous sommes restés avec des langages de type C pendant des années et pendant ce temps la pointe de la programmation a avancé considérablement.</p>

<p>Ainsi pendant que nous écrivions <code>struct { int type; union { ... } }</code> pour la n-ième fois, les programmeurs ML et haskell avaient déjà les safe variants et le pattern matching sur les types de données. Pendant qu'on faisait attention à bien faire des <code>free()</code> pour chaque <code>malloc()</code>, les langages à garbage collectors étaient arrivaient à faire mieux depuis les années 80.</p>
<p>Maintenant, arrêtons de tourner autour du pot, et abordons ce qu'est la programmation fonctionnelle.</p>
<p>La définition de base, bien que pas forcément claire est : «Dans un langage fonctionnel, les fonctions sont des citoyens de première classe»</p>
<p>Que de mots qui n'ont pas vraiment de sens. Voyons plutôt un exemple :</p>
<pre>
# let double x= x *2 in
   List.map double [ 1; 2; 3 ];;
- : int list = [2; 4, 6]
</pre>

<p class="first_para">Dans cet exemple, j'ai d'abord définit une fonction imbriquée appelée <code>double</code> qui prend un argument <code>x</code> et qui retourne <code>x * 2</code>. Puis <code>map</code> appelle <code>double</code> sur chaque  élément de la liste donnée <code>([1; 2; 3])</code> pour produire le résultat : une liste avec chaque nombre doublé.</p>

<p><code>map</code> est appelé une <strong>higher-order function</strong> (HOF). Les HOF sont juste une jolie manière de dire que la fonction prend une fonction parmi ses arguments.</p>
<p>Si vous êtes familiers avec le C/C++, alors cela ressemble au passage d'un pointeur de fonction. Java a une espèce d'abomination qu'on appelle une classe anonyme qui est une clôture stupide, lente et peu pratique. Si vous connaissez Perl alors vous devez déjà avoir utilisé les clôtures de Perl et sa fonction <code>map</code>, qui est exactement ce dont nous parlons. En fait, perl est un plutôt bon langage fonctionnel.</p>
<p>Les <strong>clôtures</strong> sont des fonctions qui portent une partie de l'«environnement» dans lequel elles ont été définies. En particulier, une clôture peut référencer des variables qui sont disponibles au moment de la définition. Généralisons la fonction précédente de façons à prendre n'importe quelle liste d'entiers et multiplier chaque élément par une valeur <code>n</code> arbitraire :</p>

<pre>
let multiply n list =
    let f x =
        n * x
    in
    List.map f list
    ;:
</pre>

<p class="first_para">Ainsi :</p>
<pre>
# multiply 2 [1; 2; 3];;
- : int list = [2; 4; 6]
# multiply 5 [1; 2; 3];;
- : int list = [5; 10; 15]
</pre>

<p class="first_para">Le point important à noter à propos de la fonction <code>multiply</code> est la fonction imbriquée <code>f</code>. C'est une clôture. Regardez comment <code>f</code> utilise la valeur de <code>n</code> qui n'est pas passé en tant qu'argument explicite à <code>f</code>. A la place, <code>f</code> est pris de l'environnement - c'est un argument de la fonction <code>multiply</code>, ainsi disponible au sein de cette fonction.</p>

<p>Ceci peut paraître un peu trop raccourci, mais regardons de plus près à cet appel à <code>map</code> : <code>List.map f list</code></p>
<p><code>map</code> est défini dans le module <code>List</code>, très loin du code courrant. En d'autres mots, nous passons <code>f</code> dans un module défini «a long time ago, in a galaxy far far away». Tout ce que nous pouvons savoir c'est que ce code peut passer f à d'autres modules ou en garder une référence quelque part et l'appeler ultérieurement. Que ce soit le cas ou non, cette clôture va assurer que <code>f</code> aie toujours accès à l'environnement hérité, donc à <code>n</code>.</p>

<p>Voici un exemple concret de lablgtk. Ceci est une méthode d'une classe (nous n'avons pas encore abordé les classes et les objets pour l'instant, mais considérons juste cela comme une définition de fonction pour l'instant).</p>
<p><code> class html_skel obj = object (self)</code></p>
<pre>
 ...
 ...
 method save_to_channel chan =
   let receiver_fn content =
     output_string chan content;
     true
   in
   save obj receiver_fn
</pre>

<p>Tout d'abord, il faut savoir que la fonction <code>save</code> appelée à la fin de la méthode prend en second argument une fonction, en l'occurence <code>receiver_fn</code>. Il l'appelle à répétition avec des morceaux de textes que du widget qu'il essaye d'enregistrer.</p>

<p>Maintenant, jettons un oeil à <code>receiver_fn</code>. Cette fonction est une clôture correcte parce qu'elle garde une référence à <code>chan</code> venant de son environnement.</p>
<a name="Application_partielle_et_curryfication"></a><h2><span>Application partielle et curryfication</span></h2>
<p class="first_para">Définissons une fonction plus qui ne fait qu'ajouter deux entiers :</p>
<pre>
let plus a b = a + b ;;
</pre>

<p class="first_para">Quelques questions pour les endormis du fond de la classe :</p>

<ol><li>Qu'est-ce que <code>plus</code> ?</li>
<li>Qu'est-ce que <code>plus 2 3</code> ?</li>
<li>Qu'est-ce que <code>plus 2</code> ?</li></ol>
<p class="first_para">La première réponse est facile. <code>plus</code> est uen fonction qui prend deux arguments qui sont entiers et qui retourne un entier. Son type s'écrit ainsi :</p>

<pre>
plus : int -&gt; int -&gt; int
</pre>

<p class="first_para">La deuxième réponse est encore plus évidente. <code>plus 2 3</code> est un nombre, l'entier <code>5</code>. Sa valeur et son type s'écrivent :</p>
<pre>
5 : int

</pre>

<p class="first_para">Mais quid de la question 3 ? Il semblerait que <code>plus 2</code> soit une erreur, un bug. Alors qu'en fait, il n'en est point. Si nous typons cela dans le toplevel d'OCaml, nous obtenons :</p>
<pre>
# plus 2;;
- : int -&gt; int = &lt;fun&gt;
</pre>

<p class="first_para">Ceci n'est pas une erreur. Il nous dit que <code>plus 2</code> est en fait une <em>fonction</em>, qui prend un <code>int</code> et qui retourne un <code>int</code>. Quelle genre de fonction cela est-il ? Essayons d'abord de lui donner un nom, puis de lui donner quelques entiers en argument, pour voir ce que ça donne :</p>

<pre>
# let f = plus 2;;
val f : int -&gt; int = &lt;fun&gt;
# f 10;;
- : int = 12
# f 15;;
- : int = 17
# f 99;;
- : int = 101
</pre>

<p class="first_para">Ceci est une <a href="http://www.princeton.edu/~sacm/humor/proof.html" class="external" title="http://www.princeton.edu/~sacm/humor/proof.html">preuve par l'exemple</a> suffisante pour nous dire que <code>plus 2</code> est la fonction qu'ajoute 2 à des choses.</p>

<p>Revenons à la définition originelle, et remplaçons le premier argument, soit <code>a</code>, par la valeur <code>2</code> pour obtenir :</p>
<pre>
let plus 2 b = 2 + b ;;
(* /!\ Ce n'est pas du code OCaml valide *)
</pre>

<p class="first_para">On peut maintenant mieux voir pourquoi <code>plus 2</code> est la fonction qui ajoute <code>2</code> à quelque chose.</p>

<p>En regardant le type de ces expressions, on peut démystifier la notation flèchée bizarre utilisée pour les types de fonctions :</p>
<pre>
     plus : int -&gt; int -&gt; int
   plus 2 : int -&gt; int
 plus 2 3 : int
</pre>

<p class="first_para">Ce processus est appelé <strong><a href="http://fr.wikipedia.org/wiki/Curryfication" class="external" title="http://fr.wikipedia.org/wiki/Curryfication">curryfication</a></strong>. Le nom vient de Haskell Curry qui a été à l'origine de choses importantes sur le lambda calcul. Comme j'essaye d'éviter d'entrer dans les mathématiques derrière OCaml, parce que ça rendrait le tutorial très ennuyeux et inutile, je n'irai pas plus loin sur le sujet. Pour trouver plus d'informations sur le sujet, une simple <a href="http://www.google.com/search?q=currying" class="external" title="http://www.google.com/search?q=currying">recherche google</a> suffit.</p>

<p>Vous rappelez-vous des fonctions <code>double</code> et <code>multiply</code> vues précédemment ? <code>multiply</code> était définit ainsi :</p>
<pre>
let multiply n list =
    let f x = n * x in
    List.map f list
    ;;
</pre>

<p class="first_para">Nous pouvons maintenant définir <code>double</code>, <code>triple</code>, etc, très facilement comme suit :</p>

<pre>
let double = multiply 2;;
let triple = multiply 3;;
</pre>

<p class="first_para">Ce sont de réelles fonctions, la preuve :</p>
<pre>
# double [1; 2; 3];;
- : int list = [2; 4; 6]
# triple [1; 2; 3];;
- : int list = [3; 6; 9]
</pre>

<p class="first_para">On peut aussi utiliser l'application partielle (sans la fonction intermédiaire <code>f</code>) de cette façon :</p>
<pre>
# let multiply n = List.map (( * ) n);;
val multiply : int -&gt; int list -&gt; int list = &lt;fun&gt;

# let double = multiply 2;;
val double : int list -&gt; int list = &lt;fun&gt;
# let triple = multiply 3;;
val triple : int list -&gt; int list = &lt;fun&gt;
# double [1; 2; 3];;
- : int list = [2; 4; 6]
# triple [1; 2; 3];;
- : int list = [3; 6; 9]
</pre>

<p class="first_para">Dans l'exemple ci-dessus, <code>((*) n) est l'application partielle de la fonction <code>(*)</code>, c'est-à-dire, multiplier. À noter les espaces ajoutés pour qu'OCaml ne croit pas que c'est un début de commentaire.</code></p>

<p>On peut mettre des opérateurs infixes entre parenthèses pour faire des fonction. Voici une définition identique à la précédente avec la fonction <code>plus</code> :</p>
<pre>
# let plus = (+);;
val plus : int -&gt; int -&gt; int = &lt;fun&gt;
# plus 2 3;;
- : int = 5
</pre>

<p class="first_para">Voici encore plus de curryfication :</p>

<pre>
# List.map (plus 2) [1; 2; 3];;
- : int list = [3; 4; 5]
# let list_of_functions = List.map plus [1; 2; 3];;
val list_of_functions : (int -&gt; int) list = [&lt;fun&gt;; &lt;fun&gt;; &lt;fun&gt;]
</pre>

<a name="En_quoi_la_programmation_fonctionnelle_est_utile__"></a><h2><span>En quoi la programmation fonctionnelle est utile ?</span></h2>
<p class="first_para">La programmation fonctionnelle, comme n'importe quelle technique de programmation, est un outil utile dans votre boite à outils pour résoudre certaines classes de problèmes. Très utile pour les callbacks, qui sont utilisés dans les IHMs pour les boucles d'évènements. C'est excellent pour exprimer des algorithmes génériques. <code>List.map</code> est une fonction générique pour appliquer des fonction sur n'importe quel type de liste. De la même manière, on peut définir des fonctions génériques sur les arbres. Certains types de problèmes d'arithmétique peuvent être résolus plus rapidement avec la programmation fonctionnelle (par exemple calculer la dérivé d'une fonction mathématique).</p>

<a name="Programmation_fonctionnelle_pure_et_impure"></a><h2><span>Programmation fonctionnelle pure et impure</span></h2>
<p class="first_para">Une <strong>fonction pure</strong> est une fonction sans aucun <strong>effet de bord</strong>. Un effet de bord signifie que la fonction garde une sorte d'état caché en son sein. <code>strlen()</code> est un exemple de fonction pure en C. Si on appelle <code>strlen()</code> avec la même chaîne, elle retournera toujours la même taille. La sortie de <code>strlen()</code> (la taille) ne dépend que des entrées (la chaîne) et rien d'autre. Plein de fonctions en C sont, malheureusement, impures. Par exemple, <code>malloc()</code>, évidemment, repose sur beaucoup d'éléments d'états internes (les objets alloués sur le tas, le type d'allocation utilisé, la façon de prendre des pages de l'OS, etc..).</p>

<p>Les langages dérivés de ML tel que OCaml sont «presque purs». Ils autorisent des effets de bord au travers des références et des tableaux, mais la plupart des codes que vous écrirez seront fonctionnels purs parce qu'ils encouragent cette pensée. Haskell, un autre langage fonctionnel, est pur fonctionnel. OCaml est donc plus pratique parce qu'écrire des fonctions impures est parfois utile.</p>
<p>Voici les avantages théoriques d'avoir des fonctions pures. Un avantage est que si une fonction est pure, alors elle peut être appelée plusieurs fois avec les même arguments, le compilateur n'aura qu'a appeler la fonction qu'une seule fois. Un bon exemple en C est :</p>
<pre>
for (i = 0; i &lt; strlen(s); ++i) {
    // Du code qui n'affecte pas s
}
</pre>

<p class="first_para">Si nativement compilé, la boucle est en O(n²) sur la taille de s parce que <code>strlen(s)</code> est appelé à chaque fois et <code>strlen()</code> doit itérer sur tout <code>s</code>. Si le compilateur est assez intelligent pour se rendre compte que <code>strlen()</code> est purement fonctionnel <em>et</em> que <code>s</code> n'est pas modifié dans la boucle, alors il peut retirer les appels redondants à <code>strlen()</code> et passer la boucle en O(n). Les compilateurs font-ils vraiment cela ? Dans le cas de <code>strlen</code> très certainement, mais dans d'autres, probablement pas.</p>

<p>Se concentrer en écrivant des fonctions fonctionnelles pures permettent d'écrire du code réutilisable en utilisant l'approche bottom-up, testant chaque petite fonction au fur et à mesure de l'avancement. La mode actuelle est de projeter les programmes en utilisant une approche top-bottom, mais dans l'opinion de l'auteur, cela résulte souvent à des échecs de projets.</p>
<a name="Evaluation_stricte___paresseuse__strictness_vs_laziness_"></a><h2><span>Evaluation stricte / paresseuse (strictness vs laziness)</span></h2>
<p class="first_para">Les langages dérivés de C et de ML sont stricts. Haskell et Miranda ne sont pas stricts, ie ce sont des langages à évaluation paresseuse. OCaml est stricte par défaut mais autorise l'évaluation paresseuse lorsque nécessaire.</p>
<p>Dans un langage à évaluation stricte, les arguments des fonctions sont toujours évalués en premier, et le résultat est alors passé à la fonction. Par exemple dans un langage à évaluation stricte, cet appel va toujours sortir par une erreur de division par zéro :</p>
<pre>
 give_me_a_three (1/0);;
</pre>

<p class="first_para">Si vous avez programmé dans n'importe quel langage conventionnel, c'est le comportement auquel vous vous attendrez, et vous serez surpris qu'il en soit autrement.</p>
<p>Dans un langage à évaluation paresseuse, des choses bizarres se passent. Les arguments de fonctions ne sont évalués que si la fonction les utilise. Vous rappelez-vous que la fonction <code>give_me_a_three</code> n'utilise pas ses arguments, et retourne toujours 3 ? Dans un langage à évaluation paresseuse, cet appel précédent ne fera <em>pas</em> d'erreur, simplement parce que <code>give_me_a_three</code> ne regarde jamais à ses arguments, donc si l'argument n'est jamais évalué, la division par zéro n'arrive pas.</p>

<p>Les langages à analyse paresseuse permettent de faire d'autres choses bizarres, comme la définition d'une liste infinie. Tant qu'on essaye pas d'itérer sur la totalité de la liste, cela fonctionne.</p>
<p>OCaml est un langage à évaluation stricte, mais a un module d'évaluation paresseuse (<code>Lazy</code>) qui permettent d'écrire des expressions paresseuses. Voici un exemple. D'abord nous créons une expression paresseuse pour <code>1/0</code> :</p>
<pre>
# let lazy_expr = lazy (1/0);;
val lazy_expr : int lazy_t = &lt;lazy&gt;
</pre>

<p class="first_para">A noter que le type de l'expression est <code>int lazy_t</code></p>

<p>Parce que <code>give_me_a_three</code> prend un <code>'a</code> (tout type) nous pouvons passé cette expression à la fonction :</p>
<pre>

# give_me_a_three lazy_expr;;
- : int = 3;;
</pre>

<p class="first_para">Pour évaluer une expression paresseuse, nous devons utiliser la fonction <code>Lazy.force</code> :</p>

<pre>
# Lazy.force lazy_expr;;
Exception : Division_by_zero.
</pre>

<a name="Boxed_vs__unboxed_types"></a><h2><span>Boxed vs. unboxed types</span></h2>
<p class="first_para">(NDT: trouver une traduction correcte pour «boxed» et «unboxed»)</p>
<p>Un terme qu'on entend beaucoup lorsqu'on parle de langages fonctionnels est «boxed». J'étais très confus lorsque j'ai entendu ce terme pour la première fois, mais en fait la distinction entre types «boxed» et «unboxed» est très simple si vous avez déjà fait du C, du C++ ou du java avant (en Perl tout est «boxed»).</p>
<p>La façon de voir un objet «boxed» est de penser à un objet qui a été alloué dans le tas en utilisant <code>malloc()</code> en C (ou <code>new</code> en C++), et/ou qui est y est réferré via un pointeur. Prenons ce programme C :</p>

<pre>
#include &lt;stdio.h&gt;
</pre>

<pre>
void printit (int* ptr) {
    printf(&quot;the number is %d\n&quot;, *ptr);
}
</pre>

<pre>
int main () {
    int a = 3;
    int *p = &amp;a;
</pre>

<pre>
    printit (p);
</pre>

<pre>
    return 0;
}
</pre>

<p class="first_para">La variable <code>a</code> est allouée dans la pile, et est clairement «unboxed».</p>
<p>La fonction <code>printit()</code> prends un entier «boxed» et l'affiche.</p>

<p>Le diagramme ci-dessous (NDT: non-existant à l'écriture de la traduction) montre un tableau de «unboxed» (en haut) face à des entiers «unboxed» (en bas) :</p>
<p><img src="../img/boxedarray.png" alt="Boxed Array" /></p>
<p>Pas de prix pour avoir deviné que le tableau d'entiers «unboxed» est plus rapide que le tableau d'entiers «boxed». De plus, parce qu'il y a moins d'allocations séparés, le garbage collector est plus rapide à nettoyer et plus simple sur le tableau d'objets «unboxed».</p>
<p>En C ou C++ vous n'aurez aucun problème pour construire chacun des tableaux ci-dessus. En java, on a deux types, <code>int</code> qui est «unboxed» et <code>Integer</code> qui est «boxed», et donc considérablement moins efficace. En OCaml, tous les types primitifs sont «unboxed».</p>

</div>

</body>
</html>
