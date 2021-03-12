<!-- ((! set title Apprendre !)) ((! set learn !)) ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>Apprendre</h1>
    <div class="row">
        <div id="platform-logo" class="span2">
            <img src="/img/learn-large.svg" alt="OCaml" class="svg">
            <img src="/img/learn-large.png" alt="OCaml" class="png">
        </div>
        <section id="learn-leader" class="span7">
            <p><strong style="font-size: 110%">Qu'est-ce que OCaml ?</strong>
OCaml est un langage générique de programmation, de puissance industrielle, qui met l'accent sur l'expressivité et la sûreté. C'est la technologie de choix pour les <a href="companies.html">entreprises</a> où la qualité du code, sa performance et sa maintenabilité sont critiques. La <a href="/community/">communauté</a> est très active, et a développé un <a href="https://opam.ocaml.org/packages/">riche écosystème de bibliothèques</a>.</p>
<em><a href="description.html" class="btn planet-toggle">Lire plus...</a></em>
        </section>
        <div id="platform-download" class="span3"
		  style="padding-top:2ex">
            <p><a href="/docs/install.fr.html" class="btn">Installer OCaml</a></p>
        </div>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled"><a href="taste.html">Exemples de code</a></h1>
            ((! input template/learn_code_snippet.fr.html !))
            <footer>
              <p>Voir <a href="taste.html">plus d'exemples ici</a>, ou
		<a href="http://pleac.sourceforge.net/pleac_ocaml/" >sur Pleac</a>, et
		<a href="http://rosettacode.org/wiki/Category:OCaml"
		   >sur Rosetta</a>.</p>
            </footer>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled"><a href="tutorials/">Tutoriaux</a> &amp; <a href="faq.html">FAQ</a></h1>
            <ul>
                <li><a href="tutorials/up_and_running.html">Opérationnel avec OCaml</a></li>
                <li><a href="tutorials/basics.fr.html">Les bases syntaxiques</a></li>
                <li><a href="tutorials/structure_of_ocaml_programs.fr.html">Les constructions de base</a></li>
                <li><a href="tutorials/modules.fr.html">Les modules</a></li>
                <li><a href="tutorials/map.fr.html">Les dictionnaires</a></li>
                <li><a href="tutorials/set.fr.html">Les ensembles</a></li>
                <li><a href="tutorials/hashtbl.html">Les tables de hachage</a></li>
                <li><a href="tutorials/comparison_of_standard_containers.html">Une comparaison des structures de données</a></li>
                <li><a href="faq.html">Questions frequentes (FAQ)</a></li>
            </ul>
            <footer>
                <p><a href="tutorials/">Voir la liste complète des tutoriels sur OCaml</a></p>
            </footer>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled"><a href="books.html">Livres anglais et français</a></h1>
                <a href="https://realworldocaml.org"><img style="float:
                left; margin-right: 2px; margin-bottom: 10px"
                src="/img/real-world-ocaml.jpg" width="48%"
				alt="Real World OCaml book"></a><a
				href="http://ocaml-book.com"><img style="float:
                right; margin-left: 2px; margin-bottom: 10px"
                src="/img/OCaml_from_beginning.png" width="48%"
				alt="OCaml from the very beginning"></a>
				<p style="clear:both"
>De nombreux livres sont disponibles sur OCaml, dont deux publiés récemment.
		</p>
		<footer>
                  <p><a href="books.html">Voir la liste complète des livres sur OCaml</a></p>
		</footer>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
          <h1 class="ruled"><a href="/community/media.html">Présentations &amp; Videos</a></h1>
		  <p class="documentation-video" style="margin-bottom:0">
<iframe title="Un exposé de Xavier Leroy présentant OCaml 4.02" src="//www.slideshare.net/slideshow/embed_code/43836300" width="340" height="290" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>
          </p>

         <p>Un exposé de Xavier Leroy présentant les dernières
         nouveautés d'OCaml à la 
		 <a href="/meetings/ocaml/2014/"
         >réunion annuelle des développeurs OCaml 2014</a>
         à Gothenburg, Suède
		 (<a href="/meetings/ocaml/2014/OCaml2014-Leroy-slides.pdf"
		 target="_blank">en PDF</a>,
         <a href="https://www.youtube.com/watch?v=DMzZy1bqj6Q&list=UUP9g4dLR7xt6KzCYntNqYcw"
         target="_blank">Vidéo</a>).
		 </p>
	  <p class="documentation-video video16-9"
	     style="padding-bottom: 50%"><!-- Adjust => avoid horiz bars -->
	    <iframe title="Yaron Minsky explique en anglais comment programmer efficacement en ML" src="//player.vimeo.com/video/14313378?portrait=0&amp;color=ff9933"
		    frameborder="0" webkitallowfullscreen
		    mozallowfullscreen allowfullscreen></iframe>
	  </p>
			<p>Un cours invité donné par Yaron Minsky, de Jane Street, sur comment programmer efficacement en ML. L'exposé a été donné à Harvard, pendant le cours d'introduction à l'informatique, CS51, où les étudiants passent un semestre à programmer en OCaml.</p>
          <footer>
            <p>
              <a href="/community/media.html">Voir plus de présentations et de vidéos</a></p>
          </footer>
        </section>
        <section class="span4 condensed">
          <h1 class="ruled"><a href="companies.html">Utilisateurs industriels</a></h1> <p><a href="http://janestreet.com"><img style="float:
          left; margin-right: 10px; margin-bottom: 10px"
					alt="Logo de Jane Street"
          src="/img/users/jane-street.jpg"></a>Jane Street est une société
	  d'arbitrage financier qui met l'accent sur la résolution
	  de problèmes technologiques et collaboratifs. Presque tous
	  leurs systèmes sont écrits en OCaml : du code de recherche
	  statistique qui opère sur des téra-octects de données aux
	  outils de gestion système, comme l'infrastructure
	  de transactions en temps réel. Et la plupart de ces systèmes
	  sont déployés à l'échelle réelle : dans une journée
	  classique, leurs transactions représentent entre 1% et 2%
	  du volume du marché américain.</p>

          <p><a href="https://www.facebook.com"><img style="float:
          left; margin-right: 10px; margin-bottom: 10px"
          src="/img/users/facebook.png"
					alt="Logo de facebook"></a>Pour gérer
            son énorme base de code PHP, Facebook a développé
            <a href="https://github.com/facebook/pfff/wiki/Main"
			 >pfff</a>,
            un ensemble d'outils et d'APIs pour effectuer des analyses
	    statiques, des analyses dynamiques, de la visualisation de
	    code, naviguer dans le code, et des transformations
	    source-à-source préservant le style. Facebook a aussi
	    conçu <em>Hack</em>, un nouveau langage de programmation
	    statiquement typé pour HHVM, une machine PHP très rapide.
	    Voir
	    <a href="http://www.youtube.com/watch?v=gKWNjFagR9k"
	       >l'exposé à CUFP</a> de Julien Verlaguet et
	    <a href="http://cufp.org/2013/slides/verlaguet.pdf"
	       >sa présentation</a>.</p>

	  <footer>
            <p><a href="companies.html"
		  >Voir plus de sociétés qui utilisent OCaml</a></p>
          </footer>
        </section>

        <section class="span4 condensed">
	  <h1 class="ruled"><a href="success.html">Les réussites d'OCaml</a></h1>
      <p><a href="/img/unison.png"
      ><img style="float: left; margin-right: 10px; margin-bottom: 10px"
      src="/img/unison-thumb.jpg"
      alt="Screenshot" title="La fenêtre principale d'Unison"></a>
	    <a href="http://www.cis.upenn.edu/%7Ebcpierce/unison/"
	       >Unison</a> est un synchroniseur de fichiers innovant, basé
	       sur
	       <a href="http://www.cis.upenn.edu/~bcpierce/papers/index.shtml#Synchronization"
		  target="_blank"
		  >la plus récente recherche</a>. Il tolère les pannes
	       et fonctionne aussi bien sous Windows que sous la plupart
	       des variantes d'Unix, en incluant MacOSX.
	       OCaml a permis à ses auteurs d'
	       « organiser une base de code importante et complexe ».
	  </p>

      <p><a href="/img/lexifi.jpg"
		><img style="float: left; margin-right: 10px; margin-bottom: 3px"
		      src="/img/lexifi-thumb.jpg"
		      title="Screenshot of Lexifi's application"></a>
	    Développé par <a href="http://www.lexifi.com/"
			    >LexiFi</a>, le "Modeling Language
	    for Finance" (MLFi) est le premier langage formel qui
	    décrit précisément les produits financiers les plus
	    sophistiqués. MLFi est développé comme un extension
	    du langage OCaml.
	  </p>

	  <p><img src="/img/fftw-thumb.png"
		  style="float: left; margin-right: 10px; margin-bottom: 3px"
		  title="FFTW" />
	    <a href="http://www.fftw.org/">FFTW</a>
	    est une bibliothèque pour effectuer la transformée de Fourier,
	    développée au MIT, qui rivalise avec les meilleures
	    bibliothèques propriétaires, tout en restant
	    plateforme indépendante.
	    Le code est généré par <code>genfft</code>,
	    développé en OCaml, qui
	    <a href="http://www.fftw.org/pldi99.ps.gz"
	       >« découvre » des algorithmes qui étaient inconnus
	       auparavant</a>.
	    Elle a été couronnée
	    <a href="https://en.wikipedia.org/wiki/J._H._Wilkinson_Prize_for_Numerical_Software"
	       >par le prix J. H. Wilkinson du logiciel numérique</a>,
	    qui prime les développements qui excèlent dans toutes les phases
	    de la préparation d'un logiciel numérique de haute qualité.
	  </p>
	  <footer>
            <p><a href="success.html">Voir plus de réussites d'OCaml</a></p>
          </footer>
        </section>
    </div>
</div>

