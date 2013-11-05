<!-- ((! set title OCaml !)) ((! set core !)) -->

<header id="home-header">
    <div class="container">
        <div class="row">
            <h1 class="span9">OCaml is an industrial strength programming language supporting functional, imperative and object-oriented styles</h1>
            <div class="span3">
                <div>
                    <a class="btn" href="/platform">Download OCaml</a>
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
                    <a href="/learn">
                        <img src="/img/learn-large.png" alt="Learn">
                    </a>
                    <h1><a href="/learn">Learn</a></h1>
                    <p>Find out <a href="/learn/description.html">about OCaml</a>, read about <a href="/learn/success.html">users</a>, see <a href="learn/taste.html">code examples</a>, go through <a href="/learn/tutorials">tutorials</a> and <a href="/learn">more</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/docs">
                        <img src="/img/documentation-large.png" alt="Documentation">
                    </a>
                    <h1><a href="/docs">Documentation</a></h1>
                    <p>Look up <a href="#">package docs</a>, access the <a href="#">Manual</a>, get the <a href="/docs/cheat_sheets.html">cheat sheets</a> and <a href="/docs">more</a>.</p>
                </section>
            </div>
            <div class="row">
                <section class="span4 home-feature">
                    <a href="/platform">
                        <img src="/img/platform-large.png" alt="Platform">                    </a>
                    <h1><a href="/platform">Platform</a></h1>
                    <p>The best way to get started for newcomers and a flexible base for experienced users.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/community">
                        <img src="/img/community-large.png" alt="Community">
                    </a>
                    <h1><a href="/community">Community</a></h1>
                    <p>Read the <a href="/community/planet.html">news feed</a>, join the <a href="/community/mailing_lists.html">mailing lists</a>, get <a href="/community/support.html">support</a> and find OCaml <a href="/community">around the web</a>.</p>
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
                <a href="/community/planet.html">
                    News
                </a>
                <a href="/community/planet.html">
                    <img src="/img/rss.png" alt="RSS">
                </a>
            </h1>
            ((! input tpl/front_news.mpp !))
            <p><a href="/community/planet.html">More...</a></p>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1>A taste of OCaml</h1>
            ((! cat tpl/tryocaml.html !))
            ((! input tpl/front_code_snippet.html !))
        </section>
        <section class="span6 condensed">
            <h1>Packages</h1>
            ((! input tpl/front_package.mpp !))
        </section>
    </div>
</div>
