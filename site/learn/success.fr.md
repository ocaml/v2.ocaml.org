<!-- ((! set title Quelques succès !)) ((! set learn !)) -->

# Quelques succès
*Contenu*

## Le synchroniseur de fichiers Unison
[<img src='http://caml.inria.fr/about/successes-images/unison-thumb.jpg' alt='Screenshot'  title='Screenshot of Unison&#39;s main window' />](http://caml.inria.fr/about/successes-images/unison.jpg)

[Unison](http://www.cis.upenn.edu/%7Ebcpierce/unison/) est un outil de
synchronisation de fichiers populaire, qui fonctionne sous Windows et
sous la plupart des variantes d'Unix. Il permet de stocker deux
répliques d'une collection de fichiers et de répertoires sur deux
machines différentes, ou bien sur deux disques différents d'une même
machine, et de les mettre à jour en propageant les changements de
chacune des répliques vers l'autre. À la différence d'un simple outil de
sauvegarde ou de maintien d'une image miroir, Unison est capable de
gérer la situation où les deux répliques ont été modifiées : les
changements qui n'entrent pas en conflit sont propagés automatiquement,
tandis que les changements incompatibles sont détectés et signalés.
Unison est également résistant aux échecs : il prend soin de laisser les
deux répliques, ainsi que ses propres structures privées, dans un état
cohérent à tout instant, même en cas d'arrêt abrupt ou de panne de
communication.

*[Benjamin C. Pierce](http://www.cis.upenn.edu/%7Ebcpierce/) (University
of Pennsylvania), chef du projet Unison :* « Je pense qu'Unison est un
succès très clair pour OCaml – en particulier, grâce à l'extrême
portabilité et l'excellente conception générale du compilateur et de
l'environnement d'exécution. Le typage statique fort d'OCaml, ainsi que
son puissant système de modules, nous ont aidés à organiser un logiciel
complexe et de grande taille avec un haut degré d'encapsulation. Ceci
nous a permis de préserver un haut niveau de robustesse, au cours de
plusieurs années de travail, et avec la participation de nombreux
programmeurs. En fait, Unison présente la caractéristique, peut-être
unique parmi les projets de grande taille écrits en OCaml, d'avoir été
*traduit* de Java vers OCaml à mi-chemin au cours de son développement.
L'adoption d'OCaml a été comme une bouffée d'air pur. »

## Le client pair-à-pair MLdonkey
[<img src='http://caml.inria.fr/about/successes-images/mldonkey-thumb.jpg' alt='Screenshot'  title='Screenshot of one of MLdonkey&#39;s windows' />](http://caml.inria.fr/about/successes-images/mldonkey.jpg)

[MLdonkey](http://mldonkey.sourceforge.net/Main_Page) est un client
pair-à-pair multi-plateformes et multi-réseaux. Il a été le premier
client « open source » à permettre l'accès au réseau eDonkey.
Aujourd'hui, MLdonkey autorise également l'accès à plusieurs autres
réseaux importants, parmi lesquels Overnet, Bittorrent, Gnutella,
Gnutella2, Fasttrack, Soulseek, Direct-Connect et Opennap. Il permet
d'effectuer une recherche en parallèle sur plusieurs réseaux, et échange
des fichiers avec de multiples pairs en parallèle.

*Un des développeurs de MLdonkey :* « Début 2002, nous avons décidé
d'utiliser OCaml pour programmer une application réseau dans le monde
émergent des systèmes pair-à-pair. Le résultat de notre travail,
MLdonkey, a surpassé nos espérances : MLdonkey est aujourd'hui le client
de partage de fichiers pair-à-pair le plus populaire, d'après
[freshmeat.net](http://freshmeat.net/), avec environ dix mille
utilisateurs quotidiens. De plus, MLdonkey est le seul client capable de
se connecter à plusieurs réseaux pair-à-pair pour télécharger et
échanger des fichiers. Il fonctionne en tant que démon, c'est-à-dire en
tâche de fond et sans surveillance humaine, et peut être contrôlé à
l'aide d'une interface au choix parmi trois : GTK, web et telnet. »

## Le Langage de Modélisation Financière de LexiFi
[<img src='http://caml.inria.fr/about/successes-images/lexifi-thumb.png' alt='Screenshot'  title='A report produced by LexiFi software' />](http://caml.inria.fr/about/successes-images/lexifi.png)

Développé par la société [LexiFi](http://www.lexifi.com/), le Langage de
Modélisation Financière (MLFi) est le premier langage formel capable de
décrire les produits d'investissement, de crédit et de marché de
capitaux les plus sophistiqués. MLFi est implanté comme une extension
d'OCaml.

Les utilisateurs de MLFi retirent deux importants bénéfices de
l'approche par programmation fonctionnelle. D'abord, le formalisme
déclaratif des langages de programmation fonctionnels est adapté à la
*spécification* de structures de données et d'algorithmes complexes.
Ensuite, ces langages offrent de nombreuses facilités pour la
manipulation des listes. Or, les listes jouent un rôle central en
finance, où elles sont utilisées de façon intensive pour définir des
agendas d'événements de contrats et de paiements.

De plus, MLFi est doté de capacités d'intégration cruciales, héritées
d'OCaml et des outils et librairies qui l'accompagnent, Cela permet aux
utilisateurs, par exemple, d'interopérer avec des programmes C et Java,
de manipuler des schémas et documents XML, et de s'interfacer avec des
bases de données SQL.

Des modèles de données et modèles objets visant à encapsuler les
définitions et le comportement des instruments financiers ont été
développés par l'industrie bancaire depuis deux décennies, mais font
face à des limitations inhérentes qu'OCaml a aidé à surpasser.

L'approche de LexiFi pour la modélisation de contrats financiers
complexes a reçu une récompense académique en 2000, et l'implantation de
MLFi a été nommée « Produit Logiciel de l'Année 2001 » par le magazine
*Risk*, la principale publication dans le domaine des échanges
financiers et de la gestion des risques. Les solutions basées sur MLFi
gagnent en reconnaissance à travers l'Europe et contribuent à répandre
l'utilisation d'OCaml dans l'industrie des services financiers.

## Le système de communication distribuée Ensemble
*Ohad Rodeh (IBM Haifa), un des développeurs d'Ensemble :*
« [Ensemble](http://dsl.cs.technion.ac.il/projects/Ensemble/) est un
système de communication de groupe écrit en OCaml, développé à Cornell
et à Hebrew University. À l'auteur d'applications, Ensemble fournit une
librairie de protocoles que l'on peut utiliser pour construire
rapidement des applications distribuées complexes. Pour un chercheur en
systèmes distribués, Ensemble est une boîte à outils hautement modulaire
et reconfigurable : les protocoles de haut niveau fournis aux
applications sont en réalité des piles de minuscules « couches » de
protocoles, dont chacune peut être modifiée ou reconstruite à des fins
d'expérimentation. OCaml a été choisi initialement pour que le code
puisse être vérifié par un prouveur de théorèmes semi-automatique. Ce
code a ensuite fait ses preuves sur le terrain, et nous avons continué à
développer en OCaml. Le système de types fort, les types de données
algébriques, la récupération automatique de la mémoire et
l'environnement d'exécution sont les principales raisons de notre
intérêt pour OCaml. »

## L'assistant de preuve Coq
[<img src='http://caml.inria.fr/about/successes-images/coq-thumb.jpg' alt='Screenshot'  title='Screenshot of Coq&#39;s integrated development environment' />](http://caml.inria.fr/about/successes-images/coq.jpg)

*[Jean-Christophe Filliâtre](http://www.lri.fr/%7Efilliatr/) (CNRS), un
des développeurs de Coq :* « L'outil [Coq](http://coq.inria.fr/) est un
système de manipulation de preuves mathématiques formelles ; une preuve
réalisée avec Coq est mécaniquement vérifiée par la machine. Outre ses
applications en mathématiques, l'outil Coq permet également de certifier
la correction de programmes informatiques. »

« L'intérêt de OCaml du point de vue de Coq est multiple. D'une part, le
langage OCaml est parfaitement adapté aux manipulations symboliques, qui
sont prépondérantes dans un assistant de preuve. D'autre part, le
système de types de OCaml, et notamment sa notion de type abstrait,
permet une réelle encapsulation de la partie critique du code de Coq,
garantissant ainsi la cohérence logique de l'ensemble du système. Enfin,
le typage fort de OCaml assure de fait une grande qualité au code de Coq
(tel que l'absence d'erreurs à l'exécution du type « segmentation
fault »), ce qui est indispensable à un outil dont le but premier est
justement la rigueur. »

## L'analyseur statique ASTRÉE
[<img src='http://caml.inria.fr/about/successes-images/astree.gif' alt='A340'  title='ASTRÉE has been used to certify the Airbus A340 flight control software' />](http://www.airbus.com/product/a330_a340_backgrounder.asp)

*[David Monniaux](http://www-verimag.imag.fr/~monniaux/) (CNRS), membre
du projet ASTRÉE :* « [ASTRÉE](http://www.astree.ens.fr/) est un
*analyseur statique* basé sur [l&#39;interprétation
abstraite](http://www.di.ens.fr/%7Ecousot/aiintro.shtml) et qui vise à
établir l'absence d'erreurs d'exécution dans des logiciels critiques
écrits dans un sous-ensemble du langage C. »

« Une analyse automatique et exacte visant à vérifier des propriétés
telles que l'absence d'erreurs d'exécution est impossible en général,
pour des raisons mathématiques. L'analyse statique par interprétation
abstraite contourne cette impossibilité, et permet de prouver des
propriétés de programmes, en sur-estimant l'ensemble des comportements
possibles d'un programme. Il est possible de concevoir des
approximations pessimistes qui, en pratique, permettent d'établir la
propriété souhaitée pour une large gamme de logiciels. »

« À ce jour, ASTRÉE a prouvé l'absence d'erreurs d'exécution dans le
logiciel de contrôle primaire de la [famille Airbus
A340](http://www.airbus.com/product/a330_a340_backgrounder.asp). Cela
serait impossible par de simples *tests*, car le test ne considère qu'un
*sous-ensemble* limité des cas, tandis que l'interprétation abstraite
considère un *sur-ensemble* de tous les comportements possibles du
système. »

« [ASTRÉE](http://www.astree.ens.fr/) est écrit en OCaml et mesure
environ 44000 lignes (plus des librairies externes). Nous avions besoin
d'un langage doté d'une bonne performance (en termes de vitesse et
d'occupation mémoire) sur un matériel raisonnable, favorisant l'emploi
de structures de données avancées, et garantissant la sûreté mémoire.
OCaml permet également d'organiser le code source de façon modulaire,
claire et compacte, et facilite la gestion de structures de données
récursives comme les arbres de syntaxe abstraite. »

## SLAM
Le projet [SLAM](http://research.microsoft.com/en-us/projects/slam/) a
débuté à Microsoft Research début 2000. Son but était de vérifier
automatiquement qu'un programme C utilise correctement l'interface d'une
bibliothèque extérieure. Pour répondre à cette question, SLAM utilise de
manière novatrice des idées provenant de la vérification symbolique de
modèles, de l'analyse statique de programmes et de la démonstration
automatique. Le moteur d'analyse SLAM est au coeur d'un nouvel outil
appelé SDV (Vérification Statique de Drivers) qui analyse
systématiquement le code source des drivers (pilotes de périphériques)
Windows et vérifie leur conformité vis-à-vis d'un ensemble de règles qui
caractérisent les interactions correctes entre un driver et le noyau du
système d'exploitation Windows.

*Dans le rapport technique
[MSR-TR-2004-08](http://research.microsoft.com/apps/pubs/default.aspx?id=70038),
T.Ball, B.Cook, V.Levin and S.K.Rajamani, les auteurs de SLAM,
écrivent:* “The Right Tools for the Job: We developed SLAM using Inria's
OCaml functional programming language. The expressiveness of this
language and robustness of its implementation provided a great
productivity boost.”

## FFTW
[FFTW](http://www.fftw.org/) est une librairie C [très
rapide](http://www.fftw.org/benchfft/) permettant d'effectuer des
Transformées de Fourier Discrètes (DFT). Elle emploie un puissant
optimiseur symbolique écrit en OCaml qui, étant donné un entier N,
produit du code C hautement optimisé pour effectuer des DFTs de taille
N. FFTW a reçu en 1999 le [prix
Wilkinson](http://www.mcs.anl.gov/research/opportunities/wilkinsonprize/3rd-1999.php)
pour les logiciels de calcul numérique.

Des mesures effectuées sur diverses plate-formes montrent que les
performances de FFTW sont typiquement supérieures à celles des autres
logiciels de DFT disponibles publiquement, et peuvent même concurrencer
le code optimisé proposé par certains fabriquants de processeurs. À la
différence de ce code propriétaire, cependant, les performances de FFTW
sont portables : un même programme donnera de bons résultats sur la
plupart des architectures sans modification. D'où le nom « FFTW, » qui
signifie « Fastest Fourier Transform in the West. »


