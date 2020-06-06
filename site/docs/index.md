<!-- ((! set title Docs !)) ((! set documentation !)) ((! set nobreadcrumb !)) -->

<script type="text/javascript">
 <!--  null;
 // This script changes links depending on the selected ocaml version
 function changeLink(version, right, id) {
   let ref = '/releases/' + version + right;
   let link = document.getElementById(id);
   link.setAttribute("href", ref);
 }

 function setVersion(version) {
   var list = document.getElementsByClassName("form-control");
   for (let item of list) {
     item.value = version;
   }

   changeLink(version, '/htmlman/extn.html', "extref");
   changeLink(version, '/htmlman/extn.html', "extref_b");
   changeLink(version, '/htmlman/index.html', "manual");
   changeLink(version, '/htmlman/core.html', "corref");
   changeLink(version, '/htmlman/index.html#sec286', "toolref");
   changeLink(version, '/htmlman/index.html#sec286', "toolref_b");
   changeLink(version, '/htmlman/index.html#sec6', "tutref");
   changeLink(version, '/htmlman/index.html#sec6', "tutref_b");
   changeLink(version, '/htmlman/stdlib.html', "stdlib");
   changeLink(version, '/htmlman/libref/index.html', "api_b");
   changeLink(version, '/ocaml-' + version + '-refman.pdf', "refman-pdf");
   changeLink(version, '/ocaml-' + version + '-refman.txt', "refman-txt");
   changeLink(version, '/ocaml-' + version + '-refman-html.tar.gz', "refman-html");
   changeLink(version, '/ocaml-' + version + '-refman.info.tar.gz', "refman-info");

   let stdlib = "Stdlib";
   if (parseFloat(version) < 4.08) { stdlib = "Pervasives"; }
   document.getElementById("stdlib_name").textContent=stdlib;
 }

 function refresh(){
   let version = document.Versions.selector.options[document.Versions.selector.selectedIndex].value;
   setVersion(version);
 }
 window.onload = refresh;
 //-->
</script>

<div class="container">
  <h1>Documentation</h1>
  <div class="form-group">
    <form name="Versions">
      <label for="version-selector"
	     style="display:inline;">OCaml version:</label>
      <select class="form-control" id="version-selector" name="selector"
	      style="width: 10ex;vertical-align: baseline;"
	      onChange="refresh()">
	<option>4.10</option>
	<option>4.09</option>
	<option>4.08</option>
	<option>4.07</option>
	<option>4.06</option>
	<option>4.05</option>
	<option>4.04</option>
	<option>4.03</option>
	<option>4.02</option>
	<option>4.01</option>
      </select>
    </form>
  </div>
  <div class="row">
    <section class="span6 condensed">
      <h1 class="ruled">The OCaml Tutorials</h1>
      <p>The official
	<a id="tutref"
	   href="/releases/4.10/htmlman/index.html#sec6">OCaml tutorials</a>
	(chapters 1 to 6 of the manual), written by the creators of
	the language, are the best place to start. They form a
	complete introduction to programming in OCaml, including the
	module system, objects, polymorphism, etc.

	<a id="tutref_b" href="/releases/4.10/htmlman/index.html#sec6">
	  <input type="button" class="btn btn-default"
		 style="float:right;" name="button-tut"
		 value="Read the tutorials"></a>
      </p>
    </section>

    <section class="span6 condensed">
      <h1 class="ruled">The OCaml API</h1>
      <p>This is the place you'll end up most often!  You'll find the
	documentation for all modules that ship with any ocaml
	distribution. These modules form what is called
	the <a id="stdlib" href="/releases/4.10/htmlman/stdlib.html">Standard
	Library</a>. In addition, a special
	module <code id="stdlib_name">Stdlib</code> contains
	the <a id="corref" href="/releases/4.10/htmlman/core.html">core
	library</a>, and is always open.

	<a id="api_b"
	   href="/releases/4.10/htmlman/libref/index.html">
	  <input type="button" class="btn btn-default"
		 style="float:right;" name="button-api"
		 value="OCaml API"></a>
      </p>
    </section>

    <section class="span6 condensed">
      <h1 class="ruled">The Tools</h1>
      <p>
	Many <a id="toolref"
		    href="/releases/4.10/htmlman/index.html#sec286">tools</a>
	are bundled with the OCaml language. Among them, the REPL (or
	`toplevel'), the documentation generator, lexers, the
	debugger, profiling tools, etc.

	<a id="toolref_b"
	   href="/releases/4.10/htmlman/index.html#sec286">
	  <input type="button" class="btn btn-default"
		 style="float:right;" name="button-api"
		 value="OCaml Tools"></a>
      </p>
    </section>

    <section class="span6 condensed">
      <h1 class="ruled">The Language Extensions</h1>

      <p>Don't forget to regulary check the
	<a id="extref"
	   href="/releases/4.10/htmlman/extn.html">Language Extensions</a>,
	they will keep you up-to-date with useful new OCaml idioms
	and constructions.<br>

	<a id="extref_b"
	   href="/releases/4.10/htmlman/extn.html">
	  <input type="button" class="btn btn-default"
		 style="float:right;" name="button-ext"
		 value="OCaml Extensions"></a>

      </p>
    </section>

    <section class="span6 condensed">
      <h1 class="ruled">The OCaml Manual</h1>
      <p>The complete documentation is bundled as a
	large <a id="manual" href="/releases/4.10/htmlman/index.html">
	OCaml Manual</a>.  This manual is also available in
	<a id="refman-pdf"
	   href="/releases/4.10/ocaml-4.10-refman.pdf">PDF</a>,
	<a id="refman-txt"
	   href="/releases/4.10/ocaml-4.10-refman.txt">plain text</a>,
	as a
	<a id="refman-html"
	   href="/releases/4.10/ocaml-4.10-refman-html.tar.gz">bundle of
	  HTML files</a>, and as a
	<a id="refman-info"
	   href="/releases/4.10/ocaml-4.10-refman.info.tar.gz">bundle of
	  Emacs Info files</a>.
      </p>
    </section>


    <section class="span6 condensed">
      <h1 class="ruled">Other docs</h1>
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
      <h1 class="ruled">OPAM and package documentation</h1>
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
      <h1 class="ruled"><a href="/learn/books.html">Books</a> and <a href="/docs/papers.html">Papers</a></h1>
      <div class="row">
	<div class="span2 documentation-book">
	  <a href="https://realworldocaml.org">
	    <img src="/img/real-world-ocaml.jpg" alt="Real Worl OCaml book">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com">
	    <img src="/img/OCaml_from_beginning.png" alt="OCaml from the very beginning">
	  </a>
	</div>
	<div class="span2 documentation-book">
	  <a href="http://ocaml-book.com/more-ocaml-algorithms-methods-diversions/">
	    <img src="/img/more-ocaml-300-376.png" alt="More OCaml: Algorithms, Methods &amp; Diversions">
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
      <h1 class="ruled"><a href="/community/media.html">Videos</a></h1>
      <div class="row">
	<div class="span4">
	  <p class="documentation-video">
	    <iframe width="310" height="175" src="//www.youtube.com/embed/NF2WpWnB-nk?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
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
	    <iframe src="//player.vimeo.com/video/14317442?portrait=0&amp;color=ff9933" width="310" height="233" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
	  </p>
	  <p>Talk at CMU describing the experiences that Jane Street has had using OCaml as its primary development language.</p>
	</div>
	<div class="span4">
	  <p class="documentation-video">
	    <iframe src="//player.vimeo.com/video/6652523?portrait=0&amp;color=ff9933" width="310" height="233" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
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
