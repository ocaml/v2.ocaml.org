<!-- ((! set title OCaml Planet !)) ((! set community !)) -->
<!-- ((! set advertise_rss true !)) -->

#OCaml Planet

The OCaml Planet aggregates various blogs
from the OCaml community. If you would like to be added, read the
[Planet subscription HOWTO](syndication.html).

<div class="container">
<div class="row">
<section class="span8">

((! cmd script/rss2html --posts http://planet.ocaml.org/rss20.xml --subscribers http://planet.ocaml.org/opml.xml !))

</section>
<section class="span4">
<div class="subscribers">

<h3>Subscriptions</h3>

((! cmd script/rss2html --subscribers http://planet.ocaml.org/opml.xml !))

<a href="http://planet.ocaml.org/rss20.xml"
><img src='../img/rss20.png' alt='' /></a>
<a href="http://planet.ocaml.org/opml.xml"
><img src='../img/opml.png' alt='' /></a>

</div>
</section>
</div>
</div>
