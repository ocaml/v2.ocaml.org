<!-- ((! set title Learn !)) ((! set learn !)) -->

<div class="container">
    <h1>Learn</h1>
    <div class="row">
        <div id="platform-logo" class="span2">
            <img src="/img/ocaml-large.png" alt="OCaml">
        </div>
        <section id="learn-leader" class="span7">
            <h1>What is OCaml?</h1>
            <p>OCaml is a general purpose industrial-strength programming language with an emphasis on expressiveness and safety. <a href="/learn/companies">Used</a> in environments where a single mistake can cost millions and speed matters, it is supported by an <a href="/community">active community</a> that has developed a <a href="/packages">rich set of libraries</a>. <small><em><a href="/learn/description">Read more</a></em></small>.</p>
        </section>
        <div id="platform-download" class="span3">
            <p><a href="#" class="btn">Install on Mac OSX</a></p>
            <p>
                <a href="#">Other systems</a> |
                <a href="#">What's new?</a>
            </p>
        </div>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Code examples</h1>
            ((! cat tpl/tryocaml.html !))
            ((! input tpl/front_code_snippet.html !))
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Tutorials</h1>
            <ul>
                <li><a href="/learn/tutorials/basics">Basics</a></li>
                <li><a href="/learn/tutorials/structure_of_ocaml_programs">Structure of OCaml Programs</a></li>
                <li><a href="/learn/tutorials/map">Maps (Dictionaries)</a></li>
                <li><a href="/learn/tutorials/set">Sets</a></li>
                <li><a href="/learn/tutorials/hashtbl">Hash Tables</a></li>
                <li><a href="/learn/tutorials/comparison_of_standard_containers">Comparison of Standard Containers</a></li>
                <li><a href="/learn/tutorials/data_types_and_matching">Data Types and Matching</a></li>
            </ul>
            <footer>
                <p><a href="/learn/tutorials">See full list</a></p>
            </footer>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Books</h1>
                <a href="https://realworldocaml.org"><img style="float: left; margin-right: 10px; margin-bottom: 10px" src="/img/real-world-ocaml.png" alt="Real World OCaml book"></a><p>This hands-on book shows you how to take advantage of OCaml’s functional, imperative and object-oriented programming styles with recipes for many real-world tasks.</p>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Common Questions</h1>
            <ul>
                <li><a href="/learn/faq">General Questions</a></li>
                <li><a href="/learn/faq">Core Language</a></li>
                <li><a href="/learn/faq">Module Language</a></li>
                <li><a href="/learn/faq">Development Tools</a></li>
            </ul>
            <footer>
                <p><a href="/learn/faq">See full list</a></p>
            </footer>
        </section>
        <section class="span8 condensed">
            <h1 class="ruled">Industrial Users</h1>
            <div class="row">
            <section class="span4 condensed">
                <p><a href=""><img style="float: left; margin-right: 10px; margin-bottom: 10px" src="/img/jane-street.jpg"></a>Jane Street is a quantitative proprietary trading firm with a unique focus on technology and collaborative problem solving. Almost all of our systems are written in OCaml: from statistical research code operating over terabytes of data to systems-administration tools to our real-time trading infrastructure. On our busiest days, we trade over 200 million equity shares in the US alone.</p>

                <p><a href="https://www.facebook.com"><img style="float: left; margin-right: 10px; margin-bottom: 10px" src="https://www.facebookbrand.com/img/assets/asset.f.logo.lg.png"></a>To handle their huge PHP codebase, Facebook developed <a href="https://github.com/facebook/pfff/wiki/Main">pfff</a>, a set of tools and APIs to perform static analysis, dynamic analysis, code visualizations, code navigations, and style-preserving source-to-source transformations such as refactorings on source code.</p>
            </section>
            <section class="span4 condensed">
                <p><a href="http://caml.inria.fr/about/successes-images/unison.jpg"><img style="float: left; margin-right: 10px; margin-bottom: 10px" src="http://caml.inria.fr/about/successes-images/unison-thumb.jpg" alt="Screenshot" title="Screenshot of Unison's main window"></a></p>
            </section>
            </div>
        </section>
    </div>
</div>

