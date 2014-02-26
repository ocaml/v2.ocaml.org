<!-- ((! set title OCaml !)) ((! set core !)) -->
<!-- ((! set advertise_rss true !)) -->

<header id="home-header">
    <div class="container">


    <ul class="translations">
      <li><a href="index.html"><img src="img/flag_en.png"/></a></li>
      <li class="active"><img src="img/flag_fr.png"/></li>
    </ul>

        <div class="row">
            <h1 class="span9">OCaml est un langage de programmation de classe industrielle, permettant des styles de programmation fonctionels, impératifs et orienté objet.</h1>
            <div class="span3">
                <div>
                    <a class="btn" href="/docs/install.html">Installer OCaml</a>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <div class="row home-hero">
        <div class="span8">
            <div class="row">
                <section class="span4 home-feature">
                    <a href="/learn/">
                        <img src="/img/learn-large.png" alt="Apprendre">
                    </a>
                    <h1><a href="/learn/">Apprendre</a></h1>
                    <p>Une <a href="/learn/description.html">description d'OCaml</a>, ses <a href="/learn/success.html">utilisateurs</a>, des <a href="learn/taste.html">exemples de code</a>, des <a href="/learn/tutorials/">tutoriaux à lire</a> et <a href="/learn/">bien plus</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/docs/">
                        <img src="/img/documentation-large.png" alt="Documentation">
                    </a>
                    <h1><a href="/docs/">Documentation</a></h1>
                    <p><a href="docs/install.html" >Installer</a> OCaml,
					trouver des <a href="https://opam.ocaml.org/pkg/">docs de paquets</a>, accéder au
					<a href="http://caml.inria.fr/pub/docs/manual-ocaml/"
					target="_blank"
					>Manuel</a>, obtenir <a href="/docs/cheat_sheets.html">des mémentos</a> et <a href="/docs/">bien plus</a>.</p>
                </section>
            </div>
            <div class="row">
                <section class="span4 home-feature">
                    <a href="https://opam.ocaml.org">
                        <img src="/img/platform-large.png" alt="Contributions">                    </a>
                    <h1><a href="https://opam.ocaml.org">Contributions</a></h1>
                    <p>Le gestionnaire de paquets <a href="https://opam.ocaml.org">OPAM</a> vous donne accès aux multiples versions de
					<a href="https://opam.ocaml.org/pkg/">centaines de paquets</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/community/">
                        <img src="/img/community-large.png" alt="Communauté">
                    </a>
                    <h1><a href="/community/">Communauté</a></h1>
                    <p>Lire <a href="/community/planet/">les fils de news</a>,  <a href="/community/mailing_lists.fr.html">discuter et échanger</a>, obtenir <a href="/community/support.fr.html">du support</a> et retrouver <a href="/community/#ocaml-around-web">OCaml sur le web</a>.</p>
                </section>
            </div>
            <div id="home-learn">
                <a href="http://try.ocamlpro.com">
                    <img class="hidden-phone" src="/img/learn-ocaml.png" alt="">
                    Apprendre OCaml dans son navigateur avec TryOCaml
                </a>
            </div>
        </div>
        <section id="home-news" class="span4 condensed">
            <h1 class="ruled">
                <a href="/community/planet/"
				title="See planet posts">Nouvelles</a>
                <a href="http://planet.ocaml.org/rss20.xml"
				title="Planet RSS feed"
				><img src="/img/rss.png" alt="RSS"></a>
            </h1>
			<ul class="news-feed" style="margin-bottom: 0px">
			<li><article>
			  <h1><a title="OCaml Users and Developers Workshop"
			       href="/meetings/ocaml/2014/">OCaml 2014</a></h1>
			  <p>September 5, 2014</p>
			  <a title="OCaml Users and Developers Workshop"
			     href="/meetings/ocaml/2014/">
			  <img alt="" src="/img/announcement.png" /></a>
			</article></li>
	        </ul>
            {{! cmd script/rss2html -n 5 --headlines http://planet.ocaml.org/rss20.xml !}}
            <p><a href="community/planet/">More...</a></p>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1><a href="learn/taste.html">Un peu d'OCaml</a></h1>
            ((! cat template/tryocaml.html !))
            ((! input template/front_code_snippet.html !))
            <p>OCaml est bien plus puissant que ce petit exemple. Découvrez <a href="/learn/taste.html">d'autres exemples</a>!</p>
        </section>
        <section class="span6 condensed">
            <h1><a href='http://opam.ocaml.org/pkg/index-date.html'>Paquets</a></h1>
            ((! input template/front_package.mpp !))
        </section>
    </div>
</div>
