<!-- ((! set title Docs !)) ((! set documentation !)) ((! set nobreadcrumb !)) -->

<div class="container">
  <h1>Documentation</h1>
  <div class="form-group">
    <form name="Versions">
      <label for="version-selector"
	     style="display:inline;">OCaml version:</label>
      <select class="form-control" id="version-selector" name="selector"
	      style="width: 10ex;vertical-align: baseline;"
	      onChange="refresh()">
	<option>latest</option>
      </select>
    </form>
  </div>

  <!-- this will fill-in the select above with all versions -->
  <script src="version_selector.js"></script>

  <div class="row">
    <section class="span6 condensed">
      <h2 class="ruled">The OCaml Tutorials</h2>
      <p>The official
	<a id="tutref"
	   href="/manual/index.html#sec6">OCaml tutorials</a>
	(chapters 1 to 6 of the manual), written by the creators of
	the language, are the best place to start. They form a
	complete introduction to programming in OCaml, including the
	module system, objects, polymorphism, etc.
      
   </p>
   <p class="doc-link-wrapper">
	<a id="tutref_b" href="/manual/index.html#sec6" class="btn btn-default">
		Read the tutorials</a>
  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">The OCaml API</h2>
      <p>This is the place you'll end up most often!  You'll find the
	documentation for all modules that ship with any OCaml
	distribution. These modules form what is called
	the <a id="stdlib" href="/manual/stdlib.html">Standard
	Library</a>. In addition, a special
	module <code id="stdlib_name">Stdlib</code> contains
	the <a id="corref" href="/manual/core.html">core
	library</a>, and is always open.
   </p>
   <p class="doc-link-wrapper">
	<a id="api_b"
	href="/api/index.html" class="btn btn-default">
	OCaml API</a>
  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">The Tools</h2>
      <p>
	Many <a id="toolref"
		    href="/manual/index.html#sec286">tools</a>
	are bundled with the OCaml language. Among them, the REPL (or
	`toplevel'), the documentation generator, lexers, the
	debugger, profiling tools, etc.
    </p>
	<p class="doc-link-wrapper">
		<a id="toolref_b"
		href="/manual/index.html#sec286" class="btn btn-default">
	   OCaml Tools</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">The Language Extensions</h2>

      <p>Don't forget to regularly check the
	<a id="extref"
	   href="/manual/extn.html">Language Extensions</a>,
	they will keep you up-to-date with useful new OCaml idioms
	and constructions.<br>
      </p>
	  <p class="doc-link-wrapper">
		<a id="extref_b"
		href="/manual/extn.html" class="btn btn-default" >
	   OCaml Extensions</a>
	  </p>
    </section>

    <section class="span6 condensed">
      <h2 class="ruled">The OCaml Manual</h2>
      <p>The complete documentation is bundled as a
	large <a id="manual" href="/manual/index.html">
	OCaml Manual</a>.  This manual is also available in
	<a id="refman-pdf"
	   href="/releases/4.12/ocaml-4.12-refman.pdf">PDF</a>,
	<a id="refman-txt"
	   href="/releases/4.12/ocaml-4.12-refman.txt">plain text</a>,
	as a
	<a id="refman-html"
	   href="/releases/4.12/ocaml-4.12-refman-html.tar.gz">bundle of
	  HTML files</a>, and as a
	<a id="refman-info"
	   href="/releases/4.12/ocaml-4.12-refman.info.tar.gz">bundle of
	  Emacs Info files</a>.
      </p>
    </section>


    <section class="span6 condensed">
      <h2 class="ruled">Other docs</h2>
      <div class="row">
	<a href="license.html" class="span3 documentation-highlight">
	  <img src="/img/license.svg" alt="" class="svg">
	  <img src="/img/license.png" alt="" class="png">
	  OCaml License
	</a>
	<a href="cheat_sheets.html"
	   class="span3 documentation-highlight">
	  <img src="/img/cheat.svg" alt="" class="svg" />
	  <img src="/img/cheat.png" alt="" class="png" />
	  Cheat Sheets
	</a>
      </div>
    </section>
  </div>


  <div class="row">
    <section class="span6 condensed">
      <h2 class="ruled">OPAM and package documentation</h2>
      <p>OPAM is the source-based package manager for OCaml.
	It allows you to install OCaml and packages.
	See the <a href="install.html">installation
	instructions.</a> and the
	<a href="https://opam.ocaml.org/doc/">OPAM documentation</a>.
      </p>
      <p>The <a href="https://opam.ocaml.org/packages/">list of
	OPAM packages</a> has links to their homepage
	and documentation. The distribution and API documentation
	of the packages you install locally with OPAM can be accessed
	via <a href="http://erratique.ch/software/odig">odig</a>.
      </p>
    </section>
    <section class="span6 condensed">
      <h2 class="ruled"><a href="/learn/books.html">Books</a> and <a href="/docs/papers.html">Papers</a></h2>
      <div class="row">
	<div class="span2 documentation-book">
	  <a href="https://realworldocaml.org">
	    <img class="book-img" src="/img/real-world-ocaml.jpg" alt="Real World OCaml book">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com">
	    <img class="book-img" src="/img/OCaml_from_beginning.png" alt="OCaml from the very beginning">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com/more-ocaml-algorithms-methods-diversions/">
	    <img class="book-img" src="/img/more-ocaml-300-376.png" alt="More OCaml: Algorithms, Methods &amp; Diversions">
	  </a>
	</div>
      </div>
      <footer>
	<p><a href="/learn/books.html">See more books</a> / <a href="/docs/papers.html">See more papers</a> / <a href="https://realworldocaml.org">Read Real World OCaml online</a></p>
      </footer>
    </section>
  </div>
  <div class="row">
    <section class="span12 condensed">
      <h2 class="ruled"><a href="/community/media.html">Videos</a></h2>
      <div class="row">
	<div class="span4">
	  <p class="documentation-video">
	    <iframe width="310" height="233" src="//www.youtube.com/embed/NF2WpWnB-nk?feature=player_detailpage" title="In this talk, Mark Shinwell explains how to track down hard-to-find bugs in OCaml programs" allowfullscreen></iframe>
	  </p>
	  <p>In this talk, Mark Shinwell explains how to
	    track down hard-to-find bugs in OCaml programs.
	    It involves the new gdb functionality
	    which OCamlPro and others have worked on recently.
	    (<a href="http://oud.ocaml.org/2012/slides/oud2012-paper5-slides.pdf"
	     >PDF slides</a>)</p>
	</div>
	<div class="span4">
	  <p class="documentation-video">
	    <iframe src="//player.vimeo.com/video/14317442?portrait=0&amp;color=ff9933" width="310" height="233" title="Talk at CMU describing the experiences that Jane Street has had using OCaml as its primary development language" allowfullscreen></iframe>
	  </p>
	  <p>Talk at CMU describing the experiences that Jane Street has had using OCaml as its primary development language.</p>
	</div>
	<div class="span4">
	  <p class="documentation-video">
	    <iframe src="//player.vimeo.com/video/6652523?portrait=0&amp;color=ff9933" width="310" height="233" title="Experience Report: OCaml for an Industrial-strength Static Analysis Framework Pascal Cuoq and Julien Signoles; CEA LIST International Conference on Functional Programming (ICFP) Edinburgh 2009" allowfullscreen></iframe>
	  </p>
	  <p>Experience Report: OCaml for an Industrial-strength Static Analysis Framework
	    Pascal Cuoq and Julien Signoles; CEA LIST
	    International Conference on Functional Programming (ICFP) Edinburgh 2009.</p>
	</div>
      </div>
      <footer>
	<p><a href="/community/media.html">See more videos</a></p>
      </footer>
    </section>
  </div>
</div>
