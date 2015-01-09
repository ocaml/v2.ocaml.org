<!-- ((! set title OCaml Planet !)) ((! set community !)) -->
<!-- ((! set advertise_rss true !)) -->

#OCaml Planet

The OCaml Planet aggregates various blogs
from the OCaml community. If you would like to be added, read the
[Planet syndication HOWTO](syndication.html).

<div class="container">
<div class="row">
<section class="span8 planet">

((! cmd script/rss2html --nposts !)) blog posts are available.
You can read the 30 more recent ones below
or view <a href="older.html" >older ones</a>.

((! cmd script/rss2html --posts -n 30 !))

View <a href="older.html" >older blog posts</a>.

</section>
<section class="span4">
<div class="subscribers" style="float:right">

<h3>Syndications
  <a href="/opml.xml" title="OPML"
  ><img class="svg opml" src="/img/Opml-icon.svg" alt="OPML"
  /><img class="png ompl" src="/img/Opml-icon.png" alt="OPML" /></a></h3>

((! cmd script/rss2html --subscribers !))

<a href="http://planet.ocaml.org/rss20.xml"
><img src='../img/rss20.png' alt='' /></a>
<a href="http://planet.ocaml.org/opml.xml"
><img src='../img/opml.png' alt='' /></a>

</div>
</section>
</div>
</div>
