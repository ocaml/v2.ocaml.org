<!-- ((! set title Docs !)) ((! set documentation !)) ((! set nobreadcrumb !)) -->

<div class="container">
  <h1>Documentation</h1>
  <div class="form-group">
    <form name="Versions">
      <label for="version-selector"
	     style="display:inline;">Version OCaml:</label>
      <select class="form-control" id="version-selector" name="selector"
	      style="width: 10ex;vertical-align: baseline;"
	      onChange="refresh()">
	<option>4.10</option>
      </select>
    </form>
  </div>

  <!-- this will fill-in the select above with all versions -->
  <script src="version_selector.js"></script>

  <div class="row">
    <section class="span6 condensed">
      <h2 class="ruled">Les Tutoriels OCaml</h2>
      <p>Les
	<a id="tutref"
	   href="/manual/index.html#sec6">tutoriels OCaml</a>
	officiels (chapitres 1 à 6 du manuel), écrits par les
	inventeurs du langage, sont le meilleur point de
	départ. Ils constituent une introduction complète à la
	programmation OCaml, avec le système des modules, les
	objets, le polymorphisme, etc.
    </p>
	<p class="doc-link-wrapper">
        <a id="tutref_b" href="/manual/index.html#sec6" class="btn btn-default">
			Lire les tutoriels</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">L'API OCaml</h2>
      <p>Incontournable! Contient la documentation pour l'ensemble
	des modules inclus dans toute distribution OCaml. Ces
	modules forment ce qu'on appelle la
	<a id="stdlib" href="/manual/stdlib.html">Standard
	  Library</a>. En outre, le module spécial
	<code id="stdlib_name">Stdlib</code> contient
	la <a id="corref" href="/manual/core.html">"core
	  library"</a>, et est toujours ouvert.
      </p>
	  <p class="doc-link-wrapper">
		<a id="api_b"
		href="/api/index.html" class="btn btn-default">
		API OCaml</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">Les outils</h2>
      <p>
	De nombreux
	<a id="toolref"
	   href="/manual/index.html#sec286">outils</a>
	sont distribués avec le langage OCaml. Parmi eux,
	l'interpréteur interactif (REPL ou `toplevel'), le
	générateur de documentation, le lexer, le débogueur,
	les outils de profilage, etc.
      </p>
	  <p class="doc-link-wrapper">
		<a id="toolref_b"
		href="/manual/index.html#sec286" class="btn btn-default">
		Outils OCaml</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">Les Extensions du langage</h2>

      <p>N'oubliez pas de vérifier régulièrement les
	<a id="extref"
	   href="/manual/extn.html">Extensions du langage</a>,
	afin de rester à jour avec les nouvelles constructions
	qui vont vous simplifier la vie.
	<br>
    </p>
	  
	<p class="doc-link-wrapper">
		<a id="extref_b"
		href="/manual/extn.html" class="btn btn-default" >
		Extensions OCaml</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">Le Manuel OCaml</h2>
      <p>L'ensemble de la documentation est regroupé dans un important
	<a id="manual" href="/manual/index.html">
	  Manuel OCaml</a>.  Le manuel est également disponible aux formats
	<a id="refman-pdf"
	   href="/releases/4.12/ocaml-4.12-refman.pdf">PDF</a>,
	<a id="refman-txt"
	   href="/releases/4.12/ocaml-4.12-refman.txt">texte</a>,
	comme
	<a id="refman-html"
	   href="/releases/4.12/ocaml-4.12-refman-html.tar.gz">archive HTML</a>, et comme
	<a id="refman-info"
	   href="/releases/4.12/ocaml-4.12-refman.info.tar.gz">archive de fichiers Emacs Info</a>.
      </p>
    </section>


    <section class="span6 condensed">
      <h2 class="ruled">Autres documents</h2>
      <div class="row">
	<a href="license.html" class="span3 documentation-highlight">
	  <img src="/img/license.svg" alt="" class="svg">
	  <img src="/img/license.png" alt="" class="png">
	  License OCaml
	</a>
	<a href="cheat_sheets.html"
	   class="span3 documentation-highlight">
	  <img src="/img/cheat.svg" alt="" class="svg" />
	  <img src="/img/cheat.png" alt="" class="png" />
	  Aide-mémoire
	</a>
      </div>
    </section>
  </div>



  <div class="row">
    <section class="span6 condensed">
      <h2 class="ruled">Documentation d'OPAM</h2>
      <p>(<a href="https://opam.ocaml.org">OPAM</a>) permet de gérer l'installation de paquets sources en OCaml. Il permet l'installation de plusieurs versions du compilateur, tolère des contraintes complexes de dépendances entre les paquets et repose sur des mises à jour via un dépôt Github. La documentation sur l'utilisation d'OPAM pour installer des paquets ou créer vos propres paquets, <a href="https://opam.ocaml.org/doc/Install.html">lire ici</a>. Les paquets sont automatiquement testés lors de leur soumission et un rapport est envoyé au mainteneur. Si vous soumettez un paquet, cela vous permettra de recevoir régulièrement les résultats de tests de non-régression sur une multitude de systèmes d'exploitation et de plateformes.</p>
      <p>OPAM a été créé et est maintenu par OCamlPro, tandis qu'OCaml Labs gère le dépôt de paquets. Les rapports de bugs et suggestions pour l'outil doivent être déposés sur le <a href="https://github.com/OCaml/opam/issues">bug tracker d'OPAM</a>. Les problèmes concernant les paquets doivent être soumis sur le <a href="https://github.com/OCaml/opam-repository/issues">bug tracker du dépôt principal</a>. Les questions générales sur l'outil et les paquets peuvent être envoyées sur <a href="http://lists.ocaml.org/listinfo/platform">la liste de la plateforme OCaml</a> et les détails ou l'évolution d'OPAM peuvent être discutés sur <a href="http://lists.ocaml.org/listinfo/opam-devel">la liste OPAM-devel</a>.</p>
    </section>
    <section class="span6 condensed">
      <h2 class="ruled"><a href="/learn/books.html">Livres</a> et <a href="/docs/papers.html">articles</a></h2>
      <div class="row">
	<div class="span2 documentation-book">
	  <a href="https://realworldocaml.org">
	    <img src="/img/real-world-ocaml.jpg" alt="Real Worl OCaml book">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com">
	    <img src="/img/OCaml_from_beginning.png" alt="OCaml from the very beginning">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com/more-ocaml-algorithms-methods-diversions/">
	    <img src="/img/more-ocaml-300-376.png" alt="More OCaml: Algorithms, Methods &amp; Diversions">
	  </a>
	</div>
      </div>
      <footer>
	<p><a href="/learn/books.html">Autres livres</a> / <a href="/docs/papers.html">Articles</a> / <a href="https://realworldocaml.org">Read Real World OCaml online</a></p>
      </footer>
    </section>

  </div>
  <div class="row">
    <section class="span12 condensed">
      <h2 class="ruled"><a href="/community/media.html">Vidéos</a></h2>
      <div class="row">
        <div class="span4">
          <p class="documentation-video">
	    <iframe width="310" height="175" src="//www.youtube.com/embed/NF2WpWnB-nk?feature=player_detailpage" title="Dans cet exposé, Mark Shinwell explique comment trouver des bugs difficiles dans les programmes OCaml" allowfullscreen></iframe>
          </p>
          <p>Dans cet exposé, Mark Shinwell explique comment
	    trouver des bugs difficiles dans les programmes OCaml.
	    Cela nécessite l'utilisation du nouveau support de gdb,
	    récemment développé par OCamlPro et d'autres contributeurs.
	    (<a href="http://oud.ocaml.org/2012/slides/oud2012-paper5-slides.pdf"
	     >PDF</a>)</p>
        </div>
        <div class="span4">
          <p class="documentation-video">
            <iframe src="//player.vimeo.com/video/14317442?portrait=0&amp;color=ff9933" width="310" height="233" title="Exposé de Yaron Minsky à CMU présentant le retour d'expérience de Jane Street sur l'utilisation d'OCaml comme principal langage de développement" allowfullscreen></iframe>
          </p>
          <p>Exposé de Yaron Minsky à CMU présentant
	    le retour d'expérience de Jane Street sur l'utilisation d'OCaml comme
	    principal langage de développement.</p>
        </div>
        <div class="span4">
          <p class="documentation-video">
            <iframe src="//player.vimeo.com/video/6652523?portrait=0&amp;color=ff9933" width="310" height="233" title="Rapport d'expérience: OCaml utilisé pour une plateforme d'analyse statique de niveau industriel, par Pascal Cuoq et Julien Signoles du CEA LIST, à ICFP'2009" allowfullscreen></iframe>
          </p>
          <p>Rapport d'expérience: OCaml utilisé pour une
	    plateforme d'analyse statique de niveau industriel, par
            Pascal Cuoq et Julien Signoles du CEA LIST, à ICFP'2009.</p>
        </div>
      </div>
      <footer>
        <p><a href="/community/media.html">Voir plus de vidéos</a></p>
      </footer>
    </section>
  </div>
</div>
