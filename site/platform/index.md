<!-- ((! set title OCaml Platform !)) ((! set platform !)) -->
<!-- ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>The OCaml Platform</h1>
    <div class="row">
        <div id="platform-logo" class="span2">
            <img src="/img/ocaml-large.png" alt="OCaml">
        </div>
        <section id="platform-leader" class="span7">
            <p>The <strong>OCaml Platform</strong> represents the best way for developers, both new and old, to write software in OCaml. It combines the core OCaml compiler with a coherent set of tools, documentation, libraries and testing resources. It’s a project led by the <a href="/community/support.html">OCaml Labs</a> group in Cambridge, working closely with <a href="/community/support.html">OCaml-Pro</a> in France, and the requirements of the Platform are being guided by the industrial OCaml Consortium.</p>
            <p>Creating and maintaining the Platform is an ambitious, long-term project. The v0.1 is not taking arbitrary decisions about which packages are included. Instead, we are first placing the industrial contributors on a common tool-chain and workflow so that it's easier to work together and share code. We expect a standard set of libraries to emerge from consensus over time as this workflow rises in adoption.</p>
        </section>
        <div id="platform-download" class="span3">
            <p><a href="/docs/install.html" class="btn">Install</a></p>
            <p>
                <!-- <a href="#">Other systems</a> |
                <a href="#">What's new?</a> -->
            </p>
        </div>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Solid foundation</h1>
            <p>The core of the platform is the OCaml compiler, which has been developed for more than 20 years at Inria by a group of leading researchers.  OCaml supports functional, imperative and object-oriented styles of programming which ease the development of flexible and reliable software.  It benefits from one of the most powerful type systems, equipped with parametric polymorphism and type inference.  Also, in addition to its bytecode compiler, OCaml offers a compiler that produces efficient machine code for many architectures, which is extremely useful for creating software that can run in multiple environments.</p>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Advanced tools</h1>
            <p>A platform is more than just the compiler and packages. The OCaml Platform combines the compiler with a set of tools and resources that make writing OCaml more productive and fun.  OPAM, the OCaml Package Manager, provides a robust way to obtain packages, manage dependencies, and different versions of the compiler.  OCamlot provides a distributed, continuous testing service for OPAM package quality and compatibility.  This ensures that, before being merged, patches submitted to the OPAM repository are thoroughly tested on the variety of supported configurations, architectures, and systems. The resulting improved build and metadata quality in turn speeds up development for all OCaml developers through earlier error feed- back.</p>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Essential packages</h1>
    <ul class="news-feed">
                <li>
                    <article>
                        <h1><a href="/pkg/TBD">TBD</a></h1>
                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                        <a href="/pkg/TBD">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="/pkg/TBD">TBD</a></h1>
                        <p>Sed ut perspiciatis unde omnis iste natus</p>
                        <a href="/pkg/TBD">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="/pkg/TBD">TBD</a></h1>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation</p>
                        <a href="/pkg/TBD">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="/pkg/TBD">TBD</a></h1>
                        <p>Laboris nisi ut aliquip ex ea commodo consequat</p>
                        <a href="/pkg/TBD">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
            </ul>
            <footer>
                <p><a href="#">See full list</a></p>
            </footer>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Room to grow</h1>
            <p>The OCaml Platform makes it quick and easy to be productive as it provides a set of well tested, and well documented packages that work on a range of supported platforms.  Growing beyond those packages is trivially simple as OPAM allows you to easily access multiple versions of hundreds of packages, all of which have test information available and news feeds.  The  OCaml Platform represents the best way for developers, both new and old, to write software in OCaml.</p>
        </section>
        <section class="span8 condensed">
            <h1>Packages</h1>
        ((! input template/front_package.mpp !))
        </section>
    </div>
</div>

