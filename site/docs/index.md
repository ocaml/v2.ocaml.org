<!-- ((! set title Docs !)) ((! set documentation !)) ((! set nobreadcrumb !)) -->

<div class="container">
  <h1>Documentation</h1>
  <div class="row">
    <section class="span6 condensed">
      <h1 class="ruled">The OCaml Tutorials</h1>
      <p>The official <a id="tutref"
	href="../manual/4.09/coreexamples.html">OCaml tutorials</a> ,
	written by the creators of the language, are the best place to
	start. They form a complete introduction to programming in
	OCaml, including the module system, objects, polymorphism,
	etc.
	<div class="form-group">
	  <form name="Versions">
	    <label for="version-selector"
	    style="display:inline;">Select your version:</label>
	    <select class="form-control" id="version-selector" name="selector"
		    style="width: 10ex;vertical-align: baseline;"
		    onChange="goTUT()">
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
	    <script type="text/javascript">
	      <!--
		  function setVersion(version){
		  var list = document.getElementsByClassName("form-control");
		  for (let item of list) {
		  item.value = version;}
		  }

		  function setREF (version) {
		  let link = document.getElementById("refref");
		  let ref = 'http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/language.html'
		  link.setAttribute("href", ref);

		  link = document.getElementById("extref");
		  ref = 'http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/extn.html'
		  link.setAttribute("href", ref);

		  link = document.getElementById("corref");
		  ref = 'http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/core.html'
		  link.setAttribute("href", ref);

		  link = document.getElementById("toolref");
		  ref = 'http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/comp.html'
		  link.setAttribute("href", ref);

		  link = document.getElementById("tutref");
		  ref = '../manual/' + version + '/coreexamples.html'
		  link.setAttribute("href", ref);

		  link = document.getElementById("stdref");
		  ref = 'http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/stdlib.html'
		  link.setAttribute("href", ref);

		  let stdlib = "Stdlib";
		  if (parseFloat(version) < 4.08) { stdlib = "Pervasives"; }
		  document.getElementById("stdlib").textContent=stdlib;
		  }

		  function goTUT(){
		  let version = document.Versions.selector.options[document.Versions.selector.selectedIndex].value;
		  setVersion(version);
		  location='../manual/' + version + '/coreexamples.html'
		  }
		  //-->
	    </script>
	    <input type="button" class="btn btn-default"
		   style="float:right;"
		   name="button-tut" onClick="goTUT()" value="Read the tutorials">
	  </form>
	</div>
      </p>
    </section>

    <section class="span6 condensed">
      <h1 class="ruled">The OCaml API</h1>
      <p>This is the place you'll end up most often!  You'll find the
	documentation for all modules that ship with any ocaml
	distribution. These modules form what is called
	the <a id="stdref"
	href="http://caml.inria.fr/pub/docs/manual-ocaml/stdlib.html">Standard
	Library</a>. In addition, a special
	module <code id="stdlib">Stdlib</code> contains
	the <a id="corref"
	href="http://caml.inria.fr/pub/docs/manual-ocaml/core.html">Core
	Library</a> , and is always open.

	<div class="form-group">
	  <form name="VersionsAPI">
	    <label for="api-version-selector"
	    style="display:inline;">Select your version:</label>
	    <select class="form-control" id="api-version-selector" name="selectorapi"
		    style="width: 10ex;vertical-align: baseline;"
		    onChange="goAPI()">
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
	    <script type="text/javascript">
 <!-- 
function goAPI(){
let version = document.VersionsAPI.selectorapi.options[document.VersionsAPI.selectorapi.selectedIndex].value;
setVersion(version);
setREF(version);
location='http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/stdlib.html'
 } 
//-->
	    </script>
	    <input type="button" class="btn btn-default" style="float:right;"
		   name="button-api" onClick="goAPI()" value="OCaml API">
	  </form>
	</div>
	
      </p>
    </section>

    
    <section class="span6 condensed">
      <h1 class="ruled">The Tools</h1>
      <p>
	Many <a id="toolref" href="http://caml.inria.fr/pub/docs/manual-ocaml/comp.html">tools</a>
	are bundled with the OCaml language. Among them, the REPL (or
	`toplevel'), the documentation generator, lexers, the
	debugger, profiling tools, etc.

	<div class="form-group">
	  <form name="VersionsTOOL">
	    <label for="tool-version-selector"
		   style="display:inline;">Select your version:</label>
	    <select class="form-control" id="tool-version-selector"
		    name="selectortool"
		    style="width: 10ex;vertical-align: baseline;"
		    onChange="goTOOL()">
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
	    <script type="text/javascript">
	      <!-- 
		   function goTOOL(){
		   let version = document.VersionsTOOL.selectortool.options[document.VersionsTOOL.selectortool.selectedIndex].value;
		   setVersion(version);
		   setREF(version);
		   location='http://caml.inria.fr/pub/docs/manual-ocaml-' + version + '/libref/comp.html'
		   } 
		   //-->
	    </script>
	    <input type="button" class="btn btn-default" style="float:right;"
		   name="button-api" onClick="goTOOL()" value="OCaml Tools">
	  </form>
	</div>
      </p>

    </section>


    
    <section class="span6 condensed">
      <h1 class="ruled">The Language Reference and Extensions</h1>
      <p>

<div class="form-group">
	  <form name="VersionsREF">
	    <label for="version-selector"
	    style="display:inline;">Select your version:</label>
	    <select class="form-control" id="version-selector" name="selectorref"
		    style="width: 10ex;vertical-align: baseline;"
		    onChange="goREF()">
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
	    <script type="text/javascript">
 <!-- 
      function goREF(){
      let version = document.VersionsREF.selectorref.options[document.VersionsREF.selectorref.selectedIndex].value;
      setVersion(version);
      setREF(version);
      } 

      // finally:
document.addEventListener("DOMContentLoaded", function(event) { 
goREF();
});
//-->
	    </script>
	  </form>
	</div>
	
	Once you have a good working knowledge of OCaml,
	  the <a id="refref" href="http://caml.inria.fr/pub/docs/manual-ocaml/language.html">Language
	  Reference</a> can help you understand a particular syntax or
	  behaviour.</p>

      <p>Also, don't forget to regulary check
	the <a id="extref" href="http://caml.inria.fr/pub/docs/manual-ocaml/extn.html">Language
	Extensions</a>, they will keep you up-to-date with useful new
	OCaml idioms and constructions.	
      </p>
    </section>







    
    <section class="span6 condensed">
      <h1 class="ruled">Reference</h1>
      <div class="row">
        <a href="http://caml.inria.fr/pub/docs/manual-ocaml/"
	   target="_blank" class="span3 documentation-highlight">
          <img src="/img/manual.svg" alt="" class="svg">
          <img src="/img/manual.png" alt="" class="png">
          OCaml Manual
        </a>
        <a href="license.html" class="span3 documentation-highlight">
          <img src="/img/license.svg" alt="" class="svg">
          <img src="/img/license.png" alt="" class="png">
          OCaml License
        </a>
      </div>
      <div class="row">
        <a href="https://opam.ocaml.org/packages/"
	   class="span3 documentation-highlight">
          <img src="/img/documents.svg" alt="" class="svg" />
          <img src="/img/documents.png" alt="" class="png" />
          Package Documents
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

