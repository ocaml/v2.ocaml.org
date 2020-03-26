<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="maintitle">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.10<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 February&nbsp;21, 2020<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2020 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.10/ocaml-4.10-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual071.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">




<h1 class="chapter" id="sec2">Foreword</h1>
<ul>
<li><a href="foreword.html#conventions">Conventions</a>
</li><li><a href="foreword.html#license">License</a>
</li><li><a href="foreword.html#availability">Availability</a>
</li></ul>
<p>This manual documents the release 4.10 of the OCaml
system. It is organized as follows.
</p><ul class="itemize"><li class="li-itemize">
Part&nbsp;<a href="index.html#p%3Atutorials">I</a>, “An introduction to OCaml”,
gives an overview of the language.
</li><li class="li-itemize">Part&nbsp;<a href="index.html#p%3Arefman">II</a>, “The OCaml language”, is the
reference description of the language.
</li><li class="li-itemize">Part&nbsp;<a href="index.html#p%3Acommands">III</a>, “The OCaml tools”, documents
the compilers, toplevel system, and programming utilities.
</li><li class="li-itemize">Part&nbsp;<a href="index.html#p%3Alibrary">IV</a>, “The OCaml library”, describes the
modules provided in the standard library.

</li></ul><h2 class="section" id="conventions"><a class="section-anchor" href="#conventions" aria-hidden="true"></a>Conventions</h2>
<p>OCaml runs on several operating systems. The parts of
this manual that are specific to one operating system are presented as
shown below:</p><blockquote class="quote"><span class="c007">Unix:</span>&nbsp;&nbsp; This is material specific to the Unix family of operating
systems, including Linux and MacOS&nbsp;X.
</blockquote><blockquote class="quote"><span class="c007">Windows:</span>&nbsp;&nbsp; This is material specific to Microsoft Windows
(XP, Vista, 7, 8, 10).
</blockquote><h2 class="section" id="license"><a class="section-anchor" href="#license" aria-hidden="true">﻿</a>License</h2>
<p>The OCaml system is copyright © 1996–2020
Institut National de Recherche en Informatique et en
Automatique (INRIA).
INRIA holds all ownership rights to the OCaml system.</p><p>The OCaml system is open source and can be freely
redistributed. See the file <span class="c003">LICENSE</span> in the distribution for
licensing information.</p><p>The OCaml documentation and user’s manual is
copyright © 2020
Institut National de Recherche en Informatique et en
Automatique (INRIA).</p><p>
<a id="cc_license_logo" rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png"></a>
The OCaml documentation and user's manual is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

</p><h2 class="section" id="availability"><a class="section-anchor" href="#availability" aria-hidden="true">﻿</a>Availability</h2>
<p>
The complete OCaml distribution can be accessed via the
<a href="http://www.ocaml.org/">community Caml Web site</a> and the
<a href="http://caml.inria.fr/">older Caml Web site</a>.
The <a href="http://www.ocaml.org/">community Caml Web site</a>
contains a lot of additional information on OCaml.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>