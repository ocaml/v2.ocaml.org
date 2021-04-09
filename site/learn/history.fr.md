<!-- ((! set title Une histoire d'OCaml !)) ((! set learn !)) -->

# Une histoire d'OCaml
« Caml » était à l'origine un acronyme pour *Categorical Abstract
Machine Language*. C'était un jeu de mots sur CAM, la Machine Abstraite
Catégorique, et ML, la famille de langages de programmation à laquelle
Caml appartient. Le nom Caml est resté à travers l'évolution du langage,
bien que l'implantation actuelle n'ait rien à voir avec la CAM.

Caml fut d'abord conçu et implanté par l'équipe *Formel* de
l'[Inria](http://www.inria.fr/index.fr.html), dirigée par [Gérard
Huet](http://cristal.inria.fr/~huet/). Son développement a continué dans
l'équipe [Cristal](http://cristal.inria.fr/), et aujourd'hui dans son
successeur, [Gallium](http://gallium.inria.fr/).

## L'origine
L'équipe Formel commença à s'intéresser au langage ML en 1980–81. ML
était le *métalangage* de la version d'Édimbourg de l'assistant de
preuve LCF, tous deux conçus par [Robin
Milner](http://www.cl.cam.ac.uk/~rm135/). Il était implanté par une
sorte d'interprète écrit en Lisp par [Mike
Gordon](http://www.cl.cam.ac.uk/users/mjcg/), [Robin
Milner](http://www.cl.cam.ac.uk/~rm135/) et Christopher Wadsworth. LCF
lui-même était écrit partiellement en ML et partiellement en Lisp. Pour
pouvoir utiliser l'assistant de preuve LCF sur les divers systèmes alors
exploités chez Formel (Multics, Berkeley Unix sur Vax, Symbolics),
[Gérard Huet](http://cristal.inria.fr/~huet/) décida de rendre
l'implantation de ML compatible avec les différents compilateurs Lisp
(MacLisp, FranzLisp, LeLisp, ZetaLisp). [Guy
Cousineau](http://www.pps.jussieu.fr/~cousinea/) et [Larry
Paulson](http://www.cl.cam.ac.uk/users/lcp/) participèrent à ce travail.
Les performances de cette implantation de ML furent améliorés par
l'ajout d'un compilateur. [Guy
Cousineau](http://www.pps.jussieu.fr/~cousinea/) ajouta également les
types de données algébriques et le filtrage, d'après des idées de
Milner, que lui-même avait empruntées à Hope, un langage de
programmation conçu par [Rod Burstall](http://www.dcs.ed.ac.uk/home/rb/)
et [Dave McQueen](http://people.cs.uchicago.edu/~dbm/). À un certain
moment, cette implantation fut nommée Le_ML, appellation qui ne
survécut pas. Elle fut utilisée par [Larry
Paulson](http://www.cl.cam.ac.uk/users/lcp/) pour développer Cambridge
LCF et par [Mike Gordon](http://www.cl.cam.ac.uk/users/mjcg/) pour la
première version de HOL, comme le rappelle la [courte histoire de
HOL](http://www.cl.cam.ac.uk/users/mjcg/papers/HolHistory.html) de
Gordon.

Vers 1984, trois événements nous encouragèrent à prendre une part plus
grande dans le développement de ML:

* À Édimbourg, [Luca Cardelli](http://lucacardelli.name/) développa
 une implantation beaucoup plus rapide de ML à l'aide de sa
 *Functional Abstract Machine (FAM)*. Il conçut également sa propre
 version du langage, connue à l'époque sous le nom de *Cardelli's
 ML*.
* [Robin Milner](http://www.cl.cam.ac.uk/~rm135/) pensait que le
 moment était venu de proposer une nouvelle définition de ML, de
 façon à éviter la divergence entre les diverses implantations. Il
 définit le noyau du langage Standard ML, qui fut ensuite complété
 par un système de modules conçu par [Dave
 McQueen](http://people.cs.uchicago.edu/~dbm/).
* Au même moment, [Pierre-Louis
 Curien](http://www.pps.jussieu.fr/~curien/) développa un calcul de
 combinateurs catégoriques, ainsi qu'une correspondance entre
 lambda-calcul et combinateurs catégoriques, qui, comme le remarqua
 [Guy Cousineau](http://www.pps.jussieu.fr/~cousinea/), pouvait être
 vue comme une technique de compilation pour ML. En effet, elle était
 assez proche de la technique d'implantation originelle du ML
 d'Édimbourg, mais pouvait être décrite, vérifiée, et optimisée de
 façon simple. Ceci mena à la définition de la Machine Abstraite
 Catégorique (CAM).

Ceci poussa [Guy Cousineau](http://www.pps.jussieu.fr/~cousinea/) à
développer une nouvelle implantation de ML, basée sur la CAM. Cependant,
le langage que nous implantâmes finalement ne fut pas Standard ML,
mais... Caml. Pourquoi? Notre principale raison pour développer Caml
était de l'utiliser pour développer le système
[Coq](https://coq.inria.fr), qui, suite à la thèse
de [Thierry Coquand](http://www.cs.chalmers.se/~coquand/) en 1985,
devint le principal objectif de l'équipe. Nous n'étions pas pressés
d'adopter un standard qui risquait ensuite de nous empêcher d'adapter le
langage à nos besoins en tant que programmeurs. En particulier, Philippe
Le Chenadec et [Michel Mauny](http://michel.mauny.net/index.fr.php)
développèrent des outils de manipulation syntaxique, qui furent jugés
utiles et incorporés dans Caml. Devoir nous synchroniser avec l'équipe
Standard ML avant de pouvoir adopter les modifications du langage qui
nous semblaient utiles aurait retardé notre travail de façon trop
importante. De plus, notre philosophie entrait en conflit avec celle
d'un langage « standard », qui n'est pas censé évoluer trop rapidement.
Néanmoins, nous incorporâmes effectivement dans Caml la plupart des
améliorations apportées par Standard ML vis-à-vis du ML d'Édimbourg.

## La première implantation
La première implantation de Caml fut publiée en 1987, et développée
jusqu'en 1992. Elle était principalement l'œuvre d'Ascander Suarez.
Après le départ d'Ascander en 1988, [Pierre
Weis](http://cristal.inria.fr/~weis/) et [Michel
Mauny](http://michel.mauny.net/index.fr.php) continuèrent le
développement et la maintenance du système. Cette implantation compilait
Caml vers LLM3, la machine virtuelle du système Le_Lisp.

[Guy Cousineau](http://www.pps.jussieu.fr/~cousinea/) se souvient
modestement: « Je dois admettre que lorsque le développement de Caml
commença, mon expérience de l'implémentation des langages de
programmation était très limitée. S'appuyer sur la machine abstraite
LLM3 et sur le système d'allocation et de gestion de mémoire de Le_Lisp
nous évitait un gros travail, mais ne permettait pas d'atteindre une
grande efficacité. Le modèle CAM permettait la construction rapide des
clôtures et un bon partage des environnements mais pénalisait l'accès à
l'environnement et rendait les optimisations difficiles. De plus, il
introduisait potentiellement des fuites de mémoire, puisque des valeurs
inutiles étaient conservées à l'intérieur des clôtures. Par ailleurs, je
n'avais pas réalisé qu'il était plus important d'offrir de bonnes
performances aux programmes non fonctionnels qu'aux programmes très
fonctionnels. Par-dessus tout, j'avais négligé l'importance de la
portabilité et de l'ouverture. Malgré ces inadéquations, dont je suis
initialement responsable, Ascander, Pierre et Michel ont fait du beau
travail. »

## Caml Light
En 1990 et 1991, [Xavier Leroy](http://cristal.inria.fr/~xleroy/) mit au
point une implantation totalement nouvelle de Caml, basée sur un
interprète de code-octets écrit en C. [Damien
Doligez](http://cristal.inria.fr/~doligez/) fournit un excellent système
de gestion de la mémoire. Cette nouvelle implantation, connue sous le
nom de Caml Light, était hautement portable et fonctionnait aisément sur
de petites machines de bureau comme les Macs et PCs. Elle remplaça
l'ancienne implantation de Caml et aida beaucoup à répandre l'emploi de
Caml dans l'enseignement et la recherche. Sa notion de flux de données
et ses facilités pour l'analyse syntaxique, dues à [Michel
Mauny](http://michel.mauny.net/index.fr.php), faisaient suite à un
effort de longue haleine de l'équipe Formel pour promouvoir les outils
de manipulation syntaxique.

## Caml Special Light
En 1995, [Xavier Leroy](http://cristal.inria.fr/~xleroy/) publia Caml
Special Light, qui surpassait Caml Light de plusieurs façons. En premier
lieu, un compilateur optimisant produisant du code natif est venu
complémenter le compilateur code-octets. Ce compilateur natif égalait ou
surpassait les performances des meilleurs compilateurs existants pour
les langages fonctionnels, et a permis à Caml d'être davantage
compétitif, en termes de performances, vis-à-vis des langages de
programmation impératifs classiques tels que C++. Par ailleurs, Caml
Special Light proposait un système de modules de haut niveau, conçu par
[Xavier Leroy](http://cristal.inria.fr/~xleroy/) et inspiré par les
modules de Standard ML. Ce système de modules fournit de puissants
mécanismes d'abstraction et de paramétrisation, essentiels pour la
programmation à grande échelle.

## Objective Caml
Les systèmes de types et l'inférence de types pour la programmation par
objets sont un domaine actif de recherche depuis le début des années


1. [Didier Rémy](http://cristal.inria.fr/~remy/) et ensuite [Jérôme
Vouillon](http://www.pps.jussieu.fr/~vouillon/) ont conçu un système de
types élégant et très expressif pour les objets et les classes. Ce
design fut intégré à et implémenté dans Caml Special Light, donnant
naissance au langage Objective Caml et à son implémentation, publiée
pour la première fois en 1996 et renommée en OCaml en 2011. Objective
Caml fut le premier langage de programmation a combiner toute la
puissance de la programmation par objets avec un typage statique avec
inférence dans le style de ML. Il est capable de reconnaître
statiquement comme bien typés de nombreux idiomes difficiles de la
programmation par objets (classes paramétrées par des types, méthodes
binaires, spécialisation du type de l'objet), idiomes qui sont traités
de manière non sûre ou à l'aide de vérifications dynamiques de types
dans d'autres langages à objets comme C++ et Java.

En 2000, [Jacques
Garrigue](http://www.math.nagoya-u.ac.jp/~garrigue/home-f.html) ajouta à
Objective Caml plusieurs nouveaux traits, qu'il avait expérimentés
pendant quelques années dans le dialecte Objective Label. Parmi ceux-ci
se trouvaient les méthodes polymorphes, les arguments de fonctions
étiquetés et optionnels, et les variantes polymorphes.

## La montée en puissance d'OCaml
Depuis la fin des années 1990, OCaml a régulièrement gagné en popularité
et a attiré une communauté significative d'utilisateurs. En plus de
programmes complets de haute technicité écrits en OCaml, cette
communauté d'utilisateur a également contribué un bon nombre de
bibliothèques, d'infrastructures et d'outils de haute qualité, allant
des interfaces utilisateur graphiques et des interfaces avec des SGBD, à
la programmation du Web et des réseaux, l'interopérabilité avec d'autres
langages, et l'analyse statique de programmes. En parallèle, l'équipe
initiale de développement d'OCaml travaille toujours activement sur le
système de base, améliorant sans cesse la qualité de l'implémentation et
l'adaptant aux architectures et systèmes les plus récents.

## Quelques parents proches
En plus de ces versions officielles de Caml, il faut mentionner de
nombreux compilateurs voisins. [Michel
Mauny](http://michel.mauny.net/index.fr.php) et [Daniel de
Rauglaudre](http://cristal.inria.fr/~ddr/) ont conçu Chamau, qui offre
des possibilités de manipulation syntaxique uniques que l'on retrouve
maintenant sous forme de pré-processeur dans le système Camlp4. [Manuel
Serrano](http://www-sop.inria.fr/members/Manuel.Serrano/) et [Pierre
Weis](http://cristal.inria.fr/~weis/) ont créé BIGLOO. Régis Cridlig a
produit Camlot. Jean Goubault-Larrecq a écrit HimML, qui est doté de «
hash-consing » implicite et d'opérations efficaces sur les ensembles et
cartes associatives. [Emmanuel
Chailloux](http://www.pps.jussieu.fr/~emmanuel/) a publié CeML. Dans
l'équipe *Para*, Francis Dupont a implanté Caml pour des machines
parallèles, tandis que [Luc
Maranget](http://cristal.inria.fr/~maranget/) a construit Gaml, un
compilateur pour un langage de programmation fonctionnel paresseux.

## Citation finale
En 1996, [Guy Cousineau](http://www.pps.jussieu.fr/~cousinea/) écrivait:
« L'histoire de Caml aurait certainement pu être plus linéaire.
Néanmoins, à travers une série de tâtonnements, une capacité à produire
des implantations de haute performance, portables et flexibles, pour les
langages de programmation fonctionnels a émergé en France. »


