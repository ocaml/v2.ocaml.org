<!-- ((! set title OCaml !)) ((! set core !)) ((! set nobreadcrumb !)) -->
<!-- ((! set advertise_rss true !)) -->

<header id="home-header">
    <div class="container">
        <div class="row">
            <h1 class="span9">OCaml is an industrial strength programming language supporting functional, imperative and object-oriented styles</h1>
            <div class="span3">
                <div>
                    <a class="btn" href="/docs/install.html">Install OCaml</a>
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
                    <a href="/learn/">
                        <img src="/img/learn-large.svg" alt="Learn" class="svg" />
                        <img src="/img/learn-large.png" alt="Learn" class="png" />
                    </a>
                    <h1><a href="/learn/">Learn</a></h1>
                    <p>Find out <a href="/learn/description.html">about OCaml</a>, read about <a href="/learn/companies.html">users</a>, see <a href="learn/taste.html">code examples</a>, go through <a href="/learn/tutorials/">tutorials</a> and <a href="/learn/">more</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/docs/">
                        <img src="/img/documentation-large.svg"
						alt="Documentation" class="svg" />
                        <img src="/img/documentation-large.png"
						alt="Documentation" class="png" />
                    </a>
                    <h1><a href="/docs/">Documentation</a></h1>
                    <p><a href="docs/install.html" >Install</a> OCaml,
					look up <a href="https://opam.ocaml.org/packages/">package docs</a>, access the
					<a
    href="http://caml.inria.fr/pub/docs/manual-ocaml-{{! get LATEST_OCAML_VERSION_MAIN !}}"
					>Manual</a>, get the <a href="/docs/cheat_sheets.html">cheat sheets</a> and <a href="/docs/">more</a>.</p>
                </section>
            </div>
            <div class="row">
                <section class="span4 home-feature">
                    <a href="https://opam.ocaml.org">
                        <img src="/img/platform-large.svg" alt="Platform"
						 class="svg" />
                        <img src="/img/platform-large.png" alt="Platform"
						 class="png" />
					</a>
                    <h1><a href="https://opam.ocaml.org">Packages</a></h1>
                    <p>The <a href="https://opam.ocaml.org">OCaml Package
					Manager</a>, gives you access to multiple versions of
					<a href="https://opam.ocaml.org/packages/">hundreds of
					packages</a>.</p>
                </section>
                <section class="span4 home-feature">
                    <a href="/community/">
                        <img src="/img/community-large.svg" alt="Community"
						 class="svg" />
                        <img src="/img/community-large.png" alt="Community"
						 class="png" />
                    </a>
                    <h1><a href="/community/">Community</a></h1>
                    <p>Read the <a href="/community/planet/">news feed</a>, join the <a href="/community/mailing_lists.html">mailing lists</a>, get <a href="/community/support.html">support</a>,
                    attend <a href="/meetings/">meetings</a>, and find OCaml
                    <a href="/community/#ocaml-around-web"
                        >around the web</a>.</p>
                </section>
            </div>
            <div id="home-learn">
			     <a href="https://discuss.ocaml.org/"
                   target="_blank"
			      ><img src="/img/chat.svg" alt="chat" class="svg"
                    style="width: 4ex;" />
                   <img src="/img/chat.png" alt="chat" class="png"
                    style="width: 4ex;" />
                   Got a question?
                   Ask OCaml experts!</a>
			   <br/>
			   <div style="margin-top: 2ex;" >
                <a href="http://try.ocamlpro.com">
                    <img class="svg hidden-phone" src="/img/try-ocaml.svg"
					  alt="" />
                    <img class="png hidden-phone" src="/img/try-ocaml.png"
					 alt="" />
                    Learn OCaml in your browser with TryOCaml
                </a>
			   </div>
            </div>
        </div>
        <section id="home-news" class="span4 condensed">
            <h1 class="ruled">
                <a href="/community/planet/"
				title="See planet posts">News</a>
                <a href="/feed.xml"
				title="Planet RSS feed"
				><img class="svg rss" src="/img/rss.svg" alt="RSS"
				/><img class="png" src="/img/rss.png" alt="RSS" /></a>
            </h1>
			<ul class="news-feed" style="margin-bottom: 0px">

                        <!-- Commented out until next workshop is announced -->
			<!-- <li class="announcement"><article>
			  <h1><a title="OCaml Users and Developers Workshop"
			       href="/meetings/ocaml/2017/">OCaml 2017</a></h1>
			  <p>September 8, 2017</p>
			  <a title="OCaml Users and Developers Workshop"
			     href="/meetings/ocaml/2017/">
			    <img alt="" src="/img/announcement.svg" class="svg" />
			    <img alt="" src="/img/announcement.png" class="png" />
			  </a>
			</article></li> -->
			<li class="announcement"><article>
			  <h1><a title="OCaml Weekly News"
			       href="/community/cwn/" >OCaml Weekly News</a></h1>
			   <p>{{! cmd script/weekly_news --date !}}</p>
			   <a title="OCaml Weekly News" href="/community/cwn/">
			    <img alt="" src="/img/announcement.svg" class="svg" />
			    <img alt="" src="/img/announcement.png" class="png" />
			  </a>
			</article></li>
                        
	        </ul>
            {{! cmd script/rss2html -n 4 --headlines http://planet.ocaml.org/rss20.xml !}}
            <p><a href="community/planet/">More...</a></p>
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
            <h1><a href='http://opam.ocaml.org/packages/index-date.html'>Packages</a></h1>
            ((! input template/front_package.mpp !))
        </section>
    </div>
</div>
