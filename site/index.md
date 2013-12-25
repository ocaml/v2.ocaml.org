<!-- ((! set title OCaml !)) ((! set core !)) -->

<header id="home-header">
    <div class="container">
        <div class="row">
            <h1 class="span9">OCaml is an industrial strength programming language supporting functional, imperative and object-oriented styles</h1>
            <div class="span3">
                <div>
                    <a class="btn" href="/docs/install.html">Download OCaml</a>
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
                        <img src="/img/learn-large.png" alt="Learn">
                    </a>
                    <h1><a href="/learn/">Learn</a></h1>
                    <p>Find out <a href="/learn/description.html">about OCaml</a>, read about <a href="/learn/success.html">users</a>, see <a href="learn/taste.html">code examples</a>, go through <a href="/learn/tutorials/">tutorials</a> and <a href="/learn/">more</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/docs/">
                        <img src="/img/documentation-large.png" alt="Documentation">
                    </a>
                    <h1><a href="/docs/">Documentation</a></h1>
                    <p><a href="docs/install.html" >Install</a> OCaml,
					look up <a href="https://opam.ocaml.org/pkg/">package docs</a>, access the
					<a href="http://caml.inria.fr/pub/docs/manual-ocaml/"
					target="_blank"
					>Manual</a>, get the <a href="/docs/cheat_sheets.html">cheat sheets</a> and <a href="/docs/">more</a>.</p>
                </section>
            </div>
            <div class="row">
                <section class="span4 home-feature">
                    <a href="https://opam.ocaml.org">
                        <img src="/img/platform-large.png" alt="Platform">                    </a>
                    <h1><a href="https://opam.ocaml.org">Packages</a></h1>
                    <p>The <a href="https://opam.ocaml.org">OCaml Package
					Manager</a>, gives you access to multiple versions of
					<a href="https://opam.ocaml.org/pkg/">hundreds of
					packages</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/community/">
                        <img src="/img/community-large.png" alt="Community">
                    </a>
                    <h1><a href="/community/">Community</a></h1>
                    <p>Read the <a href="/community/planet.html">news feed</a>, join the <a href="/community/mailing_lists.html">mailing lists</a>, get <a href="/community/support.html">support</a> and find OCaml <a href="/community/#ocaml-around-web">around the web</a>.</p>
                </section>
            </div>
            <div id="home-learn">
                <a href="http://try.ocamlpro.com">
                    <img class="hidden-phone" src="/img/learn-ocaml.png" alt="">
                    Learn OCaml in your browser with TryOCaml
                </a>
            </div>
        </div>
        <section id="home-news" class="span4 condensed">
            <h1 class="ruled">
                <a href="/community/planet.html"
				title="See planet posts">News</a>
                <a href="http://planet.ocaml.org/rss20.xml"
				title="Planet RSS feed"
				><img src="/img/rss.png" alt="RSS"></a>
            </h1>
            {{! cmd script/rss2html -n 6 --headlines http://planet.ocaml.org/rss20.xml !}}
            <p><a href="community/planet.html">More...</a></p>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1><a href="learn/taste.html">A taste of OCaml</a></h1>
            ((! cat template/tryocaml.html !))
            ((! input template/front_code_snippet.html !))
            <p>OCaml is a lot more powerful than this simple example shows. See <a href="/learn/taste.html">more examples</a>!</p>
        </section>
        <section class="span6 condensed">
            <h1><a href='http://opam.ocaml.org/pkg/index-date.html'>Packages</a></h1>
            ((! input template/front_package.mpp !))
        </section>
    </div>
</div>
