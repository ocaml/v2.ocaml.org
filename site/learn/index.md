<!-- ((! set title Learn !)) ((! set learn !)) ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>Learn</h1>
    <div class="row">
        <div id="platform-logo" class="span2">
            <img src="/img/learn-large.png" alt="OCaml">
        </div>
        <section id="learn-leader" class="span7">
            <p><strong style="font-size: 110%">What is OCaml?</strong>
			OCaml is a general purpose industrial-strength programming language with an emphasis on expressiveness and safety. It is the technology of choice in <a href="companies.html">companies</a> where a single mistake can cost millions and speed matters, and there is an <a href="/community/">active community</a> that has developed a <a href="https://opam.ocaml.org/pkg/">rich set of libraries</a>. <small><em><a href="description.html">Read more</a></em></small>.</p>
        </section>
        <div id="platform-download" class="span3"
		  style="padding-top:2ex">
            <p><a href="/docs/install.html" class="btn">Download OCaml</a></p>
<!--
            <p>
                <a href="#">Other systems</a> |
                <a href="#">What's new?</a>
            </p>
-->
        </div>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled"><a href="taste.html">Code examples</a></h1>
            ((! input template/front_code_snippet.html !))
            <footer>
              <p>See <a href="taste.html">a Hundred Lines of OCaml</a>,
		<a href="http://pleac.sourceforge.net/pleac_ocaml/" >Pleac</a>,
		<a href="http://rosettacode.org/wiki/Category:OCaml"
		   >Rosetta</a>, or
		<a href="http://langref.org/ocaml" >langref.org</a></p>
            </footer>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled"><a href="tutorials/">Tutorials</a> &amp; <a href="faq.html">FAQ</a></h1>
            <ul>
                <li><a href="tutorials/basics.html">Basics</a></li>
                <li><a href="tutorials/structure_of_ocaml_programs.html">Structure of OCaml Programs</a></li>
                <li><a href="tutorials/map.html">Maps (Dictionaries)</a></li>
                <li><a href="tutorials/set.html">Sets</a></li>
                <li><a href="tutorials/hashtbl.html">Hash Tables</a></li>
                <li><a href="tutorials/comparison_of_standard_containers.html">Comparison of Standard Containers</a></li>
                <li><a href="tutorials/data_types_and_matching.html">Data Types and Matching</a></li>
                <li><a href="faq.html">Frequently Asked Questions</a></li>
            </ul>
            <footer>
                <p><a href="tutorials/">See full list</a></p>
            </footer>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled"><a href="books.html">Books</a></h1>
                <a href="https://realworldocaml.org"><img style="float:
                left; margin-right: 2px; margin-bottom: 10px"
                src="/img/real-world-ocaml.jpg" width="48%"
				alt="Real World OCaml book"></a><a
				href="http://ocaml-book.com"><img style="float:
                right; margin-left: 2px; margin-bottom: 10px"
                src="/img/OCaml_from_beginning.png" width="48%"
				alt="OCaml from the very beginning"></a>
				<p style="clear:both">There are a number of excellent
				books, with two new titles published in 2013.
		</p>
		<footer>
                  <p><a href="books.html">See full list</a></p>
		</footer>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
          <h1 class="ruled"><a href="/community/media.html">Slides &amp; Videos</a></h1>
			<p class="documentation-video">
			<script async class="speakerdeck-embed"
			data-id="fb192c802f520131128906fa6ec08ea7"
			data-ratio="1.33333333333333"
			src="//speakerdeck.com/assets/embed.js"></script></p>
		    <p>An invited talk by Xavier Leroy explaining the current state
			of OCaml at the
			<a href="/meetings/ocaml/2013/" >OCaml Users and Developers
			Workshop 2013</a> in Boston
			(<a href="/meetings/ocaml/2013/slides/leroy.pdf"
			    target="_blank">PDF slides</a>).
			</p>
	        <p class="documentation-video">
			<iframe src="//player.vimeo.com/video/14313378?portrait=0&amp;color=ff9933" width="310" height="175" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
			</p>
			<p>A guest lecture given by Yaron Minsky of Jane Street about how to program effectively in ML. The talk was given as part of the intro computer science class at Harvard, CS51, where the students had spent much of the semester programming in OCaml.</p>
          <footer>
            <p>
              <a href="/community/media.html">See more slides and videos</a></p>
          </footer>
        </section>
        <section class="span4 condensed">
          <h1 class="ruled"><a href="companies.html">Industrial
          Users</a></h1> <p><a href="http://janestreet.com"><img style="float:
          left; margin-right: 10px; margin-bottom: 10px"
          src="/img/jane-street.jpg"></a>Jane Street is a quantitative
          proprietary trading firm with a unique focus on technology
          and collaborative problem solving.  Almost all of our
          systems are written in OCaml: from statistical research code
          operating over terabytes of data to systems management tools
          to our real-time trading infrastructure.  And those systems
          are deployed at real scale: on an average day, our trading
          represents between 1% and 2% of US equity volume. </p>

          <p><a href="https://www.facebook.com"><img style="float:
          left; margin-right: 10px; margin-bottom: 10px"
          src="https://www.facebookbrand.com/img/assets/asset.f.logo.lg.png"
						     ></a>To
            handle their huge PHP codebase, Facebook developed
            <a href="https://github.com/facebook/pfff/wiki/Main"
			 >pfff</a>,
            a set of tools and APIs to perform static analysis,
            dynamic analysis, code visualizations, code navigations,
            and style-preserving source-to-source transformations such
            as refactorings on source code.  They also designed
	    <em>Hack</em>, a new statically typed
	    programming language for HHVM, a fast PHP runtime.
	    See Julien Verlaguet's
	    <a href="http://www.youtube.com/watch?v=gKWNjFagR9k"
	       >CUFP talk</a> and
	    <a href="http://cufp.org/sites/all/files/slides/2013/verlaguet.pdf"
	       >slides</a>.</p>

	  <footer>
            <p><a href="companies.html"
		  >See more companies using OCaml</a></p>
          </footer>
        </section>
        <section class="span4 condensed">
	  <h1 class="ruled"><a href="success.html">Success stories</a></h1>
          <p><a href="http://caml.inria.fr/about/successes-images/unison.jpg"><img style="float: left; margin-right: 10px; margin-bottom: 10px" src="http://caml.inria.fr/about/successes-images/unison-thumb.jpg" alt="Screenshot" title="Screenshot of Unison's main window"></a>
	    <a href="http://www.cis.upenn.edu/%7Ebcpierce/unison/"
	       >Unison</a> is an innovative <em>two-way</em>
	    file synchronizer stemming from the
	       <a href="http://www.cis.upenn.edu/~bcpierce/papers/index.shtml#Synchronization"
		  target="_blank"
		  >latest research</a>.  It is resilent to failures
	       and  runs on Windows as well as most flavors of Unix,
	       including MacOSX.
	       OCaml helped the authors to
	       “organize a large and intricate codebase”.
	  </p>

          <p><a href="http://caml.inria.fr/about/successes-images/lexifi.png"
		><img style="float: left; margin-right: 10px;
			     margin-bottom: 3px"
		      src="http://caml.inria.fr/about/successes-images/lexifi-thumb.png"
		      title="Screenshot of Unison's main window"></a>
	    Developed by <a href="http://www.lexifi.com/"
			    >LexiFi</a>, the Modeling Language
	    for Finance (MLFi) is the first formal language that
	    accurately describes the most sophisticated capital
	    market, credit, and investment products. MLFi is
	    implemented as an extension of OCaml.
	  </p>

	  <p><img src="/img/fftw-thumb.png"
		  style="float: left; margin-right: 10px; margin-bottom: 3px"
		  title="FFTW" />
	    <a href="http://www.fftw.org/" >FFTW</a>
	    is a very Fast Fourier Transform library developed ay MIT
	    that competes with the with vendor-tuned codes
	    while remaining platform independent.
	    The code is generated by <code>genfft</code>,
	    written in OCaml, that
	    <a href="http://www.fftw.org/pldi99.ps.gz"
	       >“discovered” algorithms that were previously unknown</a>.
	    It was awarded the
	    <a href="http://www.mcs.anl.gov/research/opportunities/wilkinsonprize/3rd-1999.php"
	       >J. H. Wilkinson Prize for Numerical Software</a>
	    that rewards software that "best addresses all phases of
	    the preparation of high quality numerical software."
	  </p>
	  <footer>
            <p><a href="success.html"
		  >See more success stories</a></p>
          </footer>
        </section>
    </div>
</div>

