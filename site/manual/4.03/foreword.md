<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.03<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 April&nbsp;25, 2016<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.03</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual045.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">




<h1 class="chapter" id="sec2">Foreword</h1>
<ul>
<li><a href="foreword.html#sec3">Conventions</a>
</li><li><a href="foreword.html#sec4">License</a>
</li><li><a href="foreword.html#sec5">Availability</a>
</li></ul>
<p>This manual documents the release 4.03 of the OCaml
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

</li></ul><h2 class="section" id="sec3">Conventions</h2>
<p>OCaml runs on several operating systems. The parts of
this manual that are specific to one operating system are presented as
shown below:</p><blockquote class="quote"><span class="c010">Unix:</span>&nbsp;&nbsp; This is material specific to the Unix family of operating
systems, including Linux and MacOS&nbsp;X.
</blockquote><blockquote class="quote"><span class="c010">Windows:</span>&nbsp;&nbsp; This is material specific to Microsoft Windows (2000,
XP, Vista, Seven).
</blockquote><h2 class="section" id="sec4">License</h2>
<p>The OCaml system is copyright © 1996–2013
Institut National de Recherche en Informatique et en
Automatique (INRIA).
INRIA holds all ownership rights to the OCaml system.</p><p>The OCaml system is open source and can be freely
redistributed. See the file <span class="c006">LICENSE</span> in the distribution for
licensing information.</p><p>The present documentation is copyright © 2013
Institut National de Recherche en Informatique et en
Automatique (INRIA). The OCaml documentation and user’s
manual may be reproduced and distributed in whole or
in part, subject to the following conditions:
</p><ul class="itemize"><li class="li-itemize">
The copyright notice above and this permission notice must be
preserved complete on all complete or partial copies.
</li><li class="li-itemize">Any translation or derivative work of the OCaml
documentation and user’s manual must be approved by the authors in
writing before distribution.
</li><li class="li-itemize">If you distribute the OCaml
documentation and user’s manual in part, instructions for obtaining
the complete version of this manual must be included, and a
means for obtaining a complete version provided.
</li><li class="li-itemize">Small portions may be reproduced as illustrations for reviews or
quotes in other works without this permission notice if proper
citation is given.
</li></ul><h2 class="section" id="sec5">Availability</h2>
<p>
The complete OCaml distribution can be accessed via the
<a href="http://caml.inria.fr/">Caml Web site</a>.
The <a href="http://caml.inria.fr/">Caml Web site</a>
contains a lot of additional information on OCaml.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>