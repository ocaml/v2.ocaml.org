<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>Utiliser le module Format</title>
  </head>
  <body>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table des matières</em>
      <div ml:replace="toc"></div>
    </div>

    <h1>Utiliser le module Format</h1>

    <p>Le module Format des librairies standard de Caml Light et OCaml
    propose une méthode d'impression enjolivée. Ce module implémente
    un moteur d'impression qui coupe « bien » les lignes (« bien »
    signifie à-peu-près ici « automatiquement et quand nécessaire »).
    </p>


    <h2><a name="principles" ></a>Principes</h2>

    <p> La coupure des lignes repose sur trois concepts:
    </p>
    <ul>
      <li>
	<b>Les boîtes</b> : une boîte est une unité logique
	d'impression, qui définit un comportement du moteur d'impression
	pour présenter l'intérieur de la boîte.
      </li>
      <li>
        <b>Les indications de coupures</b> : une indication de coupure
	est une directive au moteur d'impression, qui lui propose de couper la
	ligne à cet endroit si cela s'avère nécessaire. Sinon, le moteur
	d'impression ne coupe jamais les lignes (sauf en « cas
	d'urgence » pour éviter les trop mauvaises sorties).
      </li>
      <li>
        <b>Les règles d'indentation</b> : Quand le moteur d'impression
        démarre une nouvelle ligne, il fixe l'indentation de la
        nouvelle ligne (c'est-à-dire le nombre de blancs insérés en
        début de ligne) en suivant des règles qui dépendent à la fois
        de l'indication de coupure et de la définition de la boîte où
        la ligne est coupée :
	<ul>
	  <li>Une boîte peut définir le montant de l'indentation ajoutée à
            chaque nouvelle ligne de son corps. Cette valeur est appelée
            <b>indentation additionnelle de boîte</b>.
          </li>
	  <li>Une indication de coupure peut aussi définir une
	    indentation additionelle pour la nouvelle ligne qu'elle peut
	    occasionner.  Cette valeur est appelée <b>indentation
	      additionnelle de coupure</b>.
          </li>
	  <li>Si l'indication de coupure <code>bh</code> engendre une
            nouvelle ligne à l'intérieur de la boîte <code>b</code>,
            alors l'indentation de la nouvelle ligne est la somme de:
            l'indentation courante de la boîte <code>b</code>
            <code>+</code> l'indentation additionnelle de boîte
            définie par la boîte <code>b</code>
            <code>+</code>
            l'indication additionnelle de coupure définie par l'indication de
            coupure <code>bh</code>.
          </li>
	</ul>
    </li>
    </ul>


    <h2><a name="boxes"></a>Les boîtes</h2>

    <p> Il y a 4 types de boîtes. (La plus communément utilisée est la
      boîte « hov », laissez tomber les autres types en première lecture.)
    </p>

    <ul>
      <li>
        <b>Boîte horizontale</b> (boîte <em>h</em>, ouverte par la
	procédure <code>open_hbox</code>) : dans cette boîte les
	indications de coupures ne donnent pas lieu à retour à la
	ligne.
      </li>
      <li>
	<b>Boîte verticale</b> (boîte <em>v</em>, ouverte par la procédure
	<code>open_vbox</code>): toute indication de coupure provoque
	un retour à la ligne.
      </li>
      <li>
        <b>Boîte verticale/horizontale</b> (boîte <em>hv</em>, ouverte par
	la procédure <code>open_hvbox</code>) : si c'est possible, toute
	la boîte est imprimée sur une seule ligne; sinon toute
	indication de coupure provoque un retour à la ligne.
      </li>
      <li>
	<b>Boîte verticale ou horizontale</b> (boîte <em>hov</em>, ouverte
	par l'une des procédures <code>open_box</code> ou
	<code>open_hovbox</code>) ou boîte « tassante »: les
	indications de coupure sont utilisées pour aller à la ligne
	quand il n'y a plus de place sur la ligne courante. Il existe
	deux espèces légèrement différentes de boîtes « hov » qui sont
	décrites
	<a href="#hov-boxes" >plus bas</a>. En première
	approximation nous confondrons ces deux types de boîtes
	« hov » et ne considérerons que celles obtenues avec la
	procédure
	<code>open_box</code>.
      </li>
    </ul>

    <p> Donnons un exemple. Supposons que nous voulions écrire 10
      caractères avant la marge droite (qui indique qu'il n'y a plus de
      place sur la ligne courante). Je représente chaque caractère par une
      marque <code>-</code>, les ouvertures et fermetures de boîtes sont
      indiquées respectivement par <code><b></b>[</code> et
      <code><b></b>]</code>, et <code>b</code> signifie une indication de
      coupure (blanc ou « break »).
    </p>

    <p> La sortie "--b--b--" est imprimée comme suit (le symbole b
      vaut la valeur de la coupure comme expliqué ci-après) :
    </p>

    <ul>
      <li>dans une boîte « h » :
<pre xml:space="preserve">
   --b--b--
</pre>
      </li>
      <li>dans une boîte « v » :
<pre xml:space="preserve">
   --b
   --b
   --
</pre>
      </li>
      <li>dans une boîte « hv » :
	<p>
          S'il y a assez de place pour imprimer toute la boîte sur
          la ligne :
	</p>

<pre xml:space="preserve">
   --b--b--
</pre>
    <p>
      
      Mais si "---b---b---" ne peut tenir sur la ligne, la sortie est
    </p>
<pre xml:space="preserve">
   ---b
   ---b
   ---
</pre>
      </li>
      <li>dans une boîte « hov » :
    <p>
      S'il y a assez de place pour imprimer toute la boîte sur
      la ligne :
    </p>

<pre xml:space="preserve">
   --b--b--
</pre>
	<p>
	  Mais si "---b---b---" ne peut tenir sur la ligne, la sortie est
	</p>
<pre xml:space="preserve">
   ---b---b
   ---
</pre>
    <p>
      La première indication de coupure ne donne pas lieu à un
      retour à la ligne, puisque la ligne n'est pas pleine. La
      seconde indication de coupure entraîne un retour à la ligne,
      puisqu'il n'y a plus la place d'imprimer ce qui suit
      l'indication de coupure. Si la place restante sur la ligne
      était encore plus courte, la première indication de coupure
      aurait aussi donné lieu à un retour à la ligne et
        "---b---b---" aurait été imprimé ainsi:
    </p>

<pre xml:space="preserve">
    ---b
    ---b
    ---
</pre>
      </li>
    </ul>

    <h2><a name="spaces"</a>Impression des espaces</h2>

    <p> Les indications de coupure sont aussi utilisées pour imprimer
    des espaces (si la ligne n'est pas coupée quand l'indication de
    coupure est traitée, sinon le retour à la ligne sépare
    correctement les éléments à imprimer).  Vous donnez une indication
    de coupure en appelant
    <code>print_break sp indent</code>, où <code>sp</code> est
    l'entier qui indique le nombre d'espaces à imprimer.<br />

    Donc <code>print_break sp ...</code> signifie imprimer
    <code>sp</code> espaces ou aller à la ligne.
    </p>

<p> Par exemple, si l'on imprime "--b--b--" (où <code>b</code> est
    <code>print_break 1 0</code>, ce qui correspond à l'impression
    d'un espace), on obtient la sortie suivante :
</p>

<ul><li>dans une boîte « h » :
<pre xml:space="preserve">
   -- -- --
</pre>
  </li><li>dans une boîte « v » :
<pre xml:space="preserve">
   --
   --
   --
</pre>
  </li><li>dans une boîte « hv » :
<pre xml:space="preserve">
   -- -- --

</pre>
   
   ou, suivant la place restante sur la ligne :
<pre xml:space="preserve">
   --
   --
   --
</pre>
  </li><li>
    
    et de même pour les boîtes « hov ».
</li></ul>

<p>
  De façon générale, un programme qui utilise
  <code>format</code>, n'écrit pas d'espaces lui-même mais émet des
  indications de coupure. (Par exemple à l'aide de
  <code>print_space <b></b>(<b></b>)</code> qui est synonyme
  de <code>print_break <b></b> <b></b> <b></b> <b></b> 1 0</code> et
  écrit un espace ou déclenche une coupure de ligne.)
</p>



<h2><a name="new-lines"</a>Indentation des lignes nouvelles</h2>

<p> On dispose de deux moyens de fixer l'indentation des lignes :
</p>

<ul>
  <li>
    <b>En définissant la boîte où la ligne apparaît</b>: à l'ouverture
    de la boîte, on peut fixer l'indentation ajoutée à chaque ligne
    ouverte dans la boîte.<br />
    
      Par exemple: <code>open_hovbox 1</code> ouvre une boîte
    hovbox dont les lignes seront indentées de 1 par rapport à
    l'indentation initiale de la boîte.
    Ainsi avec "---[--b--b--b--", on obtient :
<pre xml:space="preserve">
   ---[--b--b
        --b--
</pre>
    
tandis qu'avec <code>open_hovbox 2</code>, on obtient :
<pre xml:space="preserve">
   ---[--b--b
         --b--
</pre>

Note: le symbole <code><b></b>[</code> n'est évidemment pas visible
sur la sortie écran, je l'écris pour matérialiser l'ouverture de la
boîte d'impression. Ainsi le dernier « écran » est en
fait :
<pre xml:space="preserve">
    -----b--b
         --b--
</pre>
  </li><li> En définissant l'indication de coupure qui a provoqué le
  retour à la ligne. On émet une indication de coupure avec
    <code>print_break sp indent</code>. L'entier
    <code>indent</code> fixe l'indentation additionnelle de la
    nouvelle ligne qui peut être émise par l'indication de
    coupure. C'est-à-dire que
    <code>indent</code> est ajouté à l'indentation par défaut de la
    boîte où la coupure a lieu.
    <br />

    Par exemple, en indiquant par <code><b></b>[</code> l'ouverture
    d'une boîte <code>hov 1</code> (obtenue
    par <code>open_hovbox <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> 1</code>),
    et par <code>b</code> <code>print_break
      1 <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> 2</code>,
    alors la sortie de "---[--b--b--b--", sera imprimée :

<pre xml:space="preserve">
   ---[-- --
         --
         --
</pre>
  </li></ul>

<h2><a name="hov-boxes" id="hov-boxes"><!--0--></a>
  
  Raffinement sur les boîtes « hov »
</h2>

<h3><a name="packing" ></a>Boîte « hov » tassante et boîte « hov »
  structurelle</h3>

<p>
  Les boîtes « hov » se subdivisent en deux catégories au comportement
  légèrement différent en ce qui concerne les coupures qui
  interviennent après la fermeture d'une boîte dont l'indentation est
  différente de la boîte qui l'englobe. On distingue :
</p>

<ul>
  <li>
    <b>la boîte « hov » <em>tassante</em></b> (ouverte par la
    procédure <code>open_hovbox</code>): les indications de coupure
    sont utilisées pour aller à la ligne quand il n'y a plus de
    place sur la ligne courante; il n'y a pas de passage à la ligne
    s'il y a assez de place sur la ligne courante.
  </li>
  <li>
    <b>la boîte « hov » <em>structurelle</em></b> (ouverte par la
    procédure <code>open_box</code>): très similaire à la boîte
    « hov » tassante, les indications de coupure sont également
    utilisées pour aller à la ligne quand il n'y a plus de place
    sur la ligne courante, mais de surcroît les indications de
    coupures qui permettent de mettre en évidence la structure de
    boîtes sont effectuées même s'il reste assez de place sur la
    ligne courante.
  </li>
</ul>

<h3><a name="packing-hov"></a>Différences entre boîte « hov » tassante
    et boîte « hov » structurelle</h3>

<p> La différence de comportement entre la boîte « hov » tassante et
la boîte « hov » structurelle (ou « box ») est mise en évidence par la
fermeture des boîtes et la fermeture des parenthèses en fin
d'impression: avec la boîte « hov » tassante les boîtes et les
parenthèses sont fermées sur la même ligne (si la place disponible le
permet), tandis qu'avec la boîte « hov » structurelle chaque
indication de coupure produira un saut de ligne. Prenons l'exemple de
la sortie de "[(---[(----[(---b)]b)]b)]" où "b" représente une
indication de coupure sans indentation supplémentaire
(<code>print_cut <b></b> <b></b> <b></b> <b></b> <b></b>(<b></b>)</code>). Ainsi,
si "[" représente l'ouverture de boîtes « hov » tassantes
(<code>open_hovbox</code>), "[(---[(----[(---b)]b)]b)]" est imprimé
ainsi:
</p>
<pre xml:space="preserve">
(---
 (----
  (---)))
</pre>
<p>
  
  Si maintenant on remplace les boîtes « hov » tassantes par
    des boîtes « hov » structurelles (<code>open_box</code>), chaque
    indication de coupure placée avant chaque parenthèse fermante est
    susceptible de montrer la structure de boîte et produit donc une
    coupure; on obtient alors :
</p>

<pre xml:space="preserve">
(---
 (----
  (---
  )
 )
)
</pre>



<h2><a name="practice"</a>Conseils pratiques</h2>

<p>
  En écrivant vos fonctions d'impression, suivez les règles
  simples suivantes :
</p>

<ol>
  <li>
    Les boîtes doivent être ouvertes et fermées de façon cohérente
    (les appels à <code>open_*</code> et à
    <code>close_box</code> doivent être parenthésés).
  </li>
  <li>
    N'hésitez pas à ouvrir des boîtes.
  </li>
  <li>
    Donnez beaucoup d'indications de coupures, sinon
    l'imprimeur se retrouve dans une situation anormale (coincé sur
    la marge droite), où il essaie de faire de son mieux, ce qui
    n'est pas toujours très bon.
  </li>
  <li>
    N'essayez pas de forcer l'espacement à l'aide de blancs explicites
    dans les chaînes de caractères à imprimer. Pour chaque espace
    nécessaire, utilisez une indication de coupure
    (<code>print_space <b></b>(<b></b>)</code>), à moins que vous ne
    vouliez pas que la ligne soit coupée à cet endroit. Par exemple,
    imaginez que vous vouliez imprimer une définition OCaml, disons
    <code>let rec ident = expression</code>. Vous allez probablement
    considérer les 3 premiers blancs comme des « blancs insécables »
    et les inclure directement dans une chaîne de caractères, et
    écrire la chaîne <code>"let rec "</code> avant l'identificateur
    et la chaîne
    <code> <b></b>=</code> après lui; en revanche, l'espace qui suit
    le caractère
    <code><b></b>=</code> doit être une indication de coupure,
    puisqu'il est d'usage (et élégant) de couper la ligne à cet
    endroit pour indenter la partie expression d'une définition.  En
    conclusion, il est bien sûr souvent nécessaire d'imprimer des
    caractères « espace », ou blancs insécables, mais la plupart du
    temps un espace correspond plutôt à une indication de coupure.)
  </li>
  <li>
    Ne forcez jamais de coupures de ligne, laissez le moteur d'impression
    le faire pour vous: c'est son travail!
    En particulier, n'utilisez pas la procédure <code>force_newline</code>:
    son usage provoque bien une coupure de ligne, mais il provoque aussi une
    réinitialisation partielle du moteur d'impression qui déséquilibre tout
    le reste de l'impression.
  </li>
  <li>
    N'imprimez jamais de retour à la ligne dans les chaînes de
    caractères : le moteur d'impression considèrera à juste titre ce
    retour chariot comme un caractère quelconque émis sur la ligne
    courante, ce qui dérangera complètement la sortie. Utilisez à la
    place des coupures de ligne: si celles-ci doivent se produire à
    tout coup, c'est que la boîte englobante doit être une boîte
    verticale!
  </li>
  <li>
    Terminez votre programme principal d'impression par un appel
    à <code>print_newline <b></b>(<b></b>)</code>, qui vide les tables
    de l'imprimeur (et donc termine l'impression). (Notez que le
    système interactif le fait également à la fin de chaque phrase
    entrée.)
  </li>
</ol>


<h2><a name="printf"></a>Impression sur la sortie standard:
  utilisation de <code>printf</code></h2>

<p>
  Le module <code>format</code> vous propose une fonction générale de
  formattage à la <code>printf</code>. En plus des indications de
  format habituelles à la primitive
  <code>printf</code>, on dispose dans le format de caractères qui
  commandent ouvertures et fermetures de boîtes ainsi que l'émission
  d'indications de coupure de ligne.
</p>

<p>
  Les indications spécifiques au moteur d'impression sont toutes
  introduites par le caractère <code>@</code>. À peu près toutes les
  fonctions du module <code>format</code> peuvent être appelées depuis
  un format de <code>printf</code>. Ainsi :
</p>

<ul>
  <li>
    « <code>@[</code> » ouvre une boîte
    (<code>open_box <b></b> <b></b> <b></b> <b></b> <b></b> <b></b>
      0</code>). On peut préciser le type de la boîte en argument
    supplémentaire. Par exemple <code>@[&lt;hov n&gt;</code> est
    équivalent à <code>open_hovbox n</code>.
  </li>
  <li>
    « <code>@]</code> » ferme la dernière boîte ouverte
    (<code>close_box <b></b>(<b></b>)</code>).
  </li>
  <li>
    « <code>@</code>  » émet un espace sécable
    (<code>print_space <b></b>(<b></b>)</code>).
  </li>
  <li>
    « <code>@,</code> » émet une indication de coupure sans
    espace ni indentation supplémentaire en cas de coupure
    (<code>print_cut <b></b>(<b></b>)</code>).
  </li>
  <li>
    « <code>@;&lt;n m&gt;</code> » émet une indication de
    coupure la plus générale, avec ses deux arguments entiers
    (<code>print_break n m</code>).
  </li>
  <li>
    « <code>@.</code> » termine l'impression en fermant toutes les
    boîtes encore ouvertes
    (<code>print_newline <b></b>(<b></b>)</code>).
  </li>
</ul>

<p> Par exemple</p>

<pre class="listing">
printf "@[&lt;1&gt;%s@ <b></b>=@ %d@ %s@]@." "Prix TTC" 100 "Euros";;
Prix TTC <b></b>=<b></b> 100 Euros

<span class="output">- : unit <b></b>=<b></b> <b></b>(<b></b>)</span>
</pre>


<h2><a name="example"</a>Un exemple concret</h2>
 
<p> Voici un exemple complet : le plus petit exemple non trivial qu'on
  puisse imaginer, c'est-à-dire le $\lambda-$calculus :)
</p>

<p> Le problème est donc d'imprimer les valeurs d'un type concret qui
  modélise un langage d'expressions qui définissent les fonctions et
  leur application à des arguments.
</p>

<p> D'abord, je donne la syntaxe abstraite des lambda-termes (nous
  utilisons le <a href="../description.html#interactive" >système
  interactif</a> pour évaluer ce code) :
</p>

<pre class="listing" ml:content="ocaml">
  type lambda =
    | Lambda of string * lambda
    | Var of string
    | Apply of lambda * lambda
</pre>

<p> J'utilise le module format pour imprimer les lambda-termes:
</p>

<pre class="listing" ml:content="ocaml">
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
</pre>

<p> En Caml Light, remplacez la première ligne par :
</p>

<pre class="listing">
#open "format";;
</pre>



<h3><a name="example-fprintf"</a>Impression la plus générale:
       utilisation de <code>fprintf</code></h3>

<p> On utilise maintenant la fonction <code>fprintf</code> et toutes
  les fonctions d'impression prennent en argument supplémentaire le
  formatteur (c'est l'argument <code>ppf</code>) où l'impression se
  produira. Cela généralise les fonctions d'impression qui peuvent
  maintenant imprimer sur n'importe quel formateur défini dans le
  programme, et cela permet en outre d'utiliser la conversion
  <code>%a</code>, celle qu'on utilise pour imprimer un argument de
  <code>fprintf</code> avec une fonction d'impression spécialisée
  qu'on a préalablement définie dans le programme (ces fonctions
  d'impression de l'utilisateur prennent aussi un
  formatteur en premier argument).
</p>

<p> Voici la fonction d'impression des lambda-termes à l'aide des
  formats d'impression à la <code>fprintf</code>.
</p>

<pre class="listing" ml:content="ocaml">
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
</pre>

<p> Armés de ces fonctions d'impression générales, les procédures
  d'impression sur la sortie standard ou la sortie d'erreur s'obtiennent
  facilement par application partielle:.
</p>

<pre class="listing" ml:content="ocaml">
  let print_lambda = pr_lambda std_formatter
  let eprint_lambda = pr_lambda err_formatter
</pre>

  </body>
</html>
