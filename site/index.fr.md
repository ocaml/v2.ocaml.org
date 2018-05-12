<!-- ((! set title OCaml !)) ((! set core !)) ((! set nobreadcrumb !)) -->
<!-- ((! set advertise_rss true !)) -->

<header id="home-header">
    <div class="container">
        <div class="row">
            <h1 class="span9">OCaml est un langage de programmation de niveau industriel supportant les styles fonctionnel, impératif et orienté-objet</h1>
            <div class="span3">
                <div>
                    <a class="btn" href="/docs/install.fr.html">Installer OCaml</a>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container core-running-header">
((! input template/running-header.mpp !))
</div>
<div class="container">
    <div class="row home-hero">
        <div class="span8">
            <div class="row">
                <section class="span4 home-feature">
                    <a href="/learn/index.fr.html">
                        <img src="/img/learn-large.svg" alt="Apprendre"
						 class="svg">
                        <img src="/img/learn-large.png" alt="Apprendre"
						 class="png">
                    </a>
                    <h1><a href="/learn/index.fr.html">Apprendre</a></h1>
                    <p>Une <a href="/learn/description.html">description d'OCaml</a>, ses <a href="/learn/success.fr.html">utilisateurs</a>, des <a href="learn/taste.fr.html">exemples de code</a>, des <a href="/learn/tutorials/">tutoriaux à lire</a> et <a href="/learn/index.fr.html">bien plus</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/docs/index.fr.html">
                        <img src="/img/documentation-large.svg"
						 alt="Documentation" class="svg">
                        <img src="/img/documentation-large.png"
						 alt="Documentation" class="png">
                    </a>
                    <h1><a href="/docs/index.fr.html">Documentation</a></h1>
                    <p><a href="docs/install.fr.html" >Installer</a> OCaml,
					trouver des <a href="https://opam.ocaml.org/packages/">docs de paquets</a>, accéder au
					<a href="http://caml.inria.fr/pub/docs/manual-ocaml/"
					target="_blank"
					>Manuel</a>, obtenir <a href="/docs/cheat_sheets.html">des mémentos</a> et <a href="/docs/index.fr.html">bien plus</a>.</p>
                </section>
            </div>
            <div class="row">
                <section class="span4 home-feature">
                    <a href="https://opam.ocaml.org">
                        <img src="/img/platform-large.svg"
						 alt="Contributions" class="svg">
                        <img src="/img/platform-large.png"
						 alt="Contributions" class="png">
					</a>
                    <h1><a href="https://opam.ocaml.org">Contributions</a></h1>
                    <p>Le gestionnaire de paquets <a href="https://opam.ocaml.org">OPAM</a> vous donne accès aux multiples versions de
					<a href="https://opam.ocaml.org/packages/">centaines de paquets</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/community/index.fr.html">
                        <img src="/img/community-large.svg"
						 alt="Communauté" class="svg">
                        <img src="/img/community-large.png"
						 alt="Communauté" class="png">
                    </a>
                    <h1><a href="/community/index.fr.html">Communauté</a></h1>
                    <p>Lire <a href="/community/planet/">les fils de news</a>,  <a href="/community/mailing_lists.fr.html">discuter et échanger</a>, obtenir <a href="/community/support.fr.html">du support</a>,
                    <a href="/meetings/index.fr.html" >rencontrer</a>
                    d'autres utilisateurs
                    et trouver <a href="/community/index.fr.html#ocaml-around-web">OCaml sur le web</a>.</p>
                </section>
            </div>
            <div id="home-learn">
			     <a href="https://discuss.ocaml.org/"
                   target="_blank"
			      ><img src="/img/chat.svg" alt="chat" class="svg"
                    style="width: 4ex;" />
                   <img src="/img/chat.png" alt="chat" class="png"
                    style="width: 4ex;" />
                   Une question ?
                   Discutez avec des experts OCaml !</a>
               <br/>
			   <div style="margin-top: 2ex;" >
                <a href="http://try.ocamlpro.com">
                    <img class="svg hidden-phone" src="/img/try-ocaml.svg"
					 alt="">
                    <img class="png hidden-phone" src="/img/try-ocaml.png"
					 alt="">
                    Apprendre OCaml dans son navigateur avec TryOCaml
                </a>
               </div>
            </div>
        </div>
        <section id="home-news" class="span4 condensed">
            <h1 class="ruled">
                <a href="/community/planet/"
				title="See planet posts">Nouvelles</a>
                <a href="/feed.xml"
				title="Planet RSS feed"
				><img class="svg rss" src="/img/rss.svg" alt="RSS"
				/><img class="png" src="/img/rss.png" alt="RSS" /></a>
            </h1>
			<ul class="news-feed" style="margin-bottom: 0px">
			<li class="announcement"><article>
			  <h1><a title="OCaml Users and Developers Workshop"
			       href="/meetings/ocaml/2017/">OCaml 2017</a></h1>
			  <p>September 8, 2017</p>
			  <a title="OCaml Users and Developers Workshop"
			     href="/meetings/ocaml/2017/">
			    <img alt="" src="/img/announcement.svg" class="svg" />
			    <img alt="" src="/img/announcement.png" class="png" />
			  </a>
			</article></li>
	        </ul>
            {{! cmd script/rss2html -n 5 --locale fr_FR.utf8 --headlines http://planet.ocaml.org/rss20.xml !}}
            <p><a href="community/planet/">Plus...</a></p>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1><a href="learn/taste.fr.html">Un peu d'OCaml</a></h1>
            ((! cat template/tryocaml.html !))
            ((! input template/front_code_snippet.html !))
            <p>OCaml est bien plus puissant que ce petit exemple le
			montre. Découvrez
			<a href="learn/taste.fr.html">d'autres exemples</a>!</p>
        </section>
        <section class="span6 condensed">
            <h1><a href='http://opam.ocaml.org/packages/index-date.html'>Nouveautés dans OPAM</a></h1>
            ((! input template/front_package.mpp !))
        </section>
    </div>
</div>
