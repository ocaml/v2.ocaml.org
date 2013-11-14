<!-- ((! set title Community !)) ((! set community !)) -->

<div class="container">
    <h1>Community</h1>
    <div class="row">
        <div class="span2">
            <img src="/img/community-large.png" alt="Community">
        </div>
        <section id="community-leader" class="span6">
            <p>OCaml has a diverse, worldwide community and one of the main benefits is the ability to easily reach each other.  Mailing lists are the most common way people interact although you will always find users on IRC and around the web.</p>
        </section>
        <div class="span4">
            <img src="/img/ocaml-large.png" alt="OCaml">
            <p><a href="/docs/logos.html">More logos</a></p>
        </div>
    </div>
    <div class="row">
        <section class="span12 condensed">
            <h1 class="ruled">Mailing Lists</h1>
            <div class="row">
            <section class="span4 condensed">
                <p><strong><a href="https://sympa.inria.fr/sympa/arc/caml-list">caml-list@inria.fr</a></strong><br />
                <strong><em>Main OCaml List</em></strong><br />
                Intended for all users of OCaml. The purpose of this list is to share experience, exchange ideas and code, and discuss applications of the language.</p>
                <p><strong><a href="http://yquem.inria.fr/cgi-bin/mailman/listinfo/caml-announce">caml-announce@inria.fr</a></strong><br />
                <strong><em>Low volume annoncements</em></strong><br />
                This is a low-traffic, moderated list for announcements of OCaml releases and new OCaml-related software, libraries, documents, etc.</p>
            </section>
            <section class="span4 condensed">
                <p><strong><a href="http://groups.yahoo.com/neo/groups/ocaml_beginners/info">ocaml_beginners@yahoogroups.com</a></strong><br />
                <strong><em>Beginners' List</em></strong><br />
                Everything you wanted to ask about OCaml, but were afraid to submit in the main list can be asked, answered and discussed here.</p>
                <p><strong><a href="http://lists.ocaml.org">lists.ocaml.org</a></strong><br />
                <strong><em>Community lists and working groups</em></strong><br />
                User-interest lists and working groups convened with specific goals.</p>
                <p><small><a href="/community/mailing_lists.html">Browse all the lists</a></small></p>
            </section>
            <section class="span4 condensed">
                <h4>Recent email threads</h4>
            <ul class="news-feed">
((! input template/last_ml_topics.mpp !))
            </ul>
            <footer>
                <p><a href="https://sympa.inria.fr/sympa/arc/caml-list/">See archives</a></p>
            </footer>
            </section>

            </div>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Support</h1>
            <p>A great way to get free support is by using the active <a href="/community/mailing_lists.html">mailing lists</a>
			as well as the IRC channels
			(<a href="irc://irc.freenode.net/ocaml">en</a>,
			<a href="irc://irc.freenode.net/ocaml-fr">fr</a>).
			When you need to go beyond this and get professional support, you have a number of
			<a href="support.html">options available</a>.</p>
            <p>If you would like to give support to OCaml, you can join the Consortium or support the work of OCaml Labs. <a href="/community/support.html">Find out more</a>.</p>
        </section>
        <section class="span4 condensed">
           <h1 class="ruled">Upcoming Events</h1>
            <ul class="news-feed">
                <li class="announcement">
                    <article>
                        <h1><a href="#">OCaml 2013</a></h1>
                        <p>24 September 2013</p>
                        <a href="/meetings/ocaml/2013/">
                            <img src="/img/announcement.png" alt="Announcement">
                        </a>
                    </article>
                <li>
                    <article>
                        <h1><a href="#">Cambridge NonDysFunctional Programmers</a></h1>
                        <p>18 September 2013</p>
                        <a href="http://www.meetup.com/Cambridge-NonDysFunctional-Programmers/events/138406202/">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="http://www.meetup.com/ocaml-paris/events/128514752/">OCaml Users in Paris</a></h1>
                        <p>XX October 2013</p>
                        <a href="#">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="#">Consortium Meeting</a></h1>
                        <p>XX November 2013</p>
                        <a href="">
                            <img src="/img/news.png" alt="News">
                        </a>
                    </article>
                </li>
            </ul>
            <footer>
                <p><a href="/meetings">See full calendar</a></p>
            </footer>
        </section>
        <section class="span4 condensed">
           <h1 class="ruled">News</h1>
            {{! cmd script/rss2html -n 4 --headlines http://planet.ocaml.org/rss20.xml !}}
            <footer>
                <p><a href="planet.html">See full list</a></p>
            </footer>
        </section>
    </div>
    <div class="row">
        <section class="span12 condensed">
            <h1 class="ruled">OCaml around the web</h1>
                <div class="g-community" data-href="https://plus.google.com/u/0/communities/100872177392545601885" data-showtagline="false" data-showphoto="false"></div>
                <script type="text/javascript">
                    (function() {
                        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                        po.src = 'https://apis.google.com/js/plusone.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                    })();
                </script>
                <p>[Insert logos here]</p>
                <p><a href=""></a></p>
                <p><a href=""></a></p>
                <p><a href=""></a></p>
                <p><a href=""></a></p>
                <p><a href=""></a></p>
                <p><a href=""></a></p>

        </section>

    </div>
</div>

