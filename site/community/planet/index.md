<!-- ((! set title OCaml Planet !)) ((! set news !)) -->
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

<p style="clear:both; padding-top: 6ex">
View <a href="older.html" >older blog posts</a>.
</p>

</section>
<section class="span4">
<div class="subscribers" style="float:right">

<h3 class="syndication" >Syndications
  <a href="/opml.xml" title="OPML"
  ><img class="svg opml" src="/img/Opml-icon.svg" alt="OPML"
  /><img class="png ompl" src="/img/Opml-icon.png" alt="OPML" /></a>
  <a href="/feed.xml" title="Aggregated feed"
  ><img class="svg" src="/img/rss.svg" alt="Atom"
  /><img class="png" src="/img/rss.png" alt="Atom" /></a>
</h3>

((! cmd script/rss2html --subscribers !))

</div>
</section>
</div>
</div>
