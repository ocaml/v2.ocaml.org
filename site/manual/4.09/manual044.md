<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual023.html#start-section">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="manual024.html#start-section">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="manual025.html#start-section">3&nbsp;&nbsp;Private types</a>
</li><li><a href="manual026.html#start-section">4&nbsp;&nbsp;Local opens for patterns</a>
</li><li><a href="manual027.html#start-section">5&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="manual028.html#start-section">6&nbsp;&nbsp;First-class modules</a>
</li><li><a href="manual029.html#start-section">7&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="manual030.html#start-section">8&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="manual031.html#start-section">9&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="manual032.html#start-section">10&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="manual033.html#start-section">11&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="manual034.html#start-section">12&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="manual035.html#start-section">13&nbsp;&nbsp;Attributes</a>
</li><li><a href="manual036.html#start-section">14&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="manual037.html#start-section">15&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="manual038.html#start-section">16&nbsp;&nbsp;Generative functors</a>
</li><li><a href="manual039.html#start-section">17&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="manual040.html#start-section">18&nbsp;&nbsp;Inline records</a>
</li><li><a href="manual041.html#start-section">19&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="manual042.html#start-section">20&nbsp;&nbsp;Extended indexing operators  </a>
</li><li><a href="manual043.html#start-section">21&nbsp;&nbsp;Empty variant types </a>
</li><li><a href="manual044.html#start-section">22&nbsp;&nbsp;Alerts  </a>
</li><li><a href="manual045.html#start-section">23&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="manual046.html#start-section">24&nbsp;&nbsp;Binding operators </a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="s:alerts">22&nbsp;&nbsp;Alerts  </h2>
<p>
(Introduced in 4.08)</p><p>Since OCaml 4.08, it is possible to mark components (such as value or
type declarations) in signatures with “alerts” that will be reported
when those components are referenced. This generalizes the notion of
“deprecated” components which were previously reported as warning 3.
Those alerts can be used for instance to report usage of unsafe
features, or of features which are only available on some platforms,
etc.</p><p>Alert categories are identified by a symbolic identifier (a lowercase
identifier, following the usual lexical rules) and an optional
message. The identifier is used to control which alerts are enabled,
and which ones are turned into fatal errors. The message is reported
to the user when the alert is triggered (i.e. when the marked
component is referenced).</p><p>The <span class="c003">ocaml.alert</span> or <span class="c003">alert</span> attribute serves two purposes: (i) to
mark component with an alert to be triggered when the component is
referenced, and (ii) to control which alert names are enabled. In the
first form, the attribute takes an identifier possibly
followed by a message. Here is an example of a value declaration marked
with an alert:</p><pre>module U: sig
  val fork: unit -&gt; bool
    [@@alert unix "This function is only available under Unix."]
end
</pre><p>
Here <span class="c003">unix</span> is the identifier for the alert. If this alert category
is enabled, any reference to <span class="c003">U.fork</span> will produce a message at
compile time, which can be turned or not into a fatal error.</p><p>And here is another example as a floating attribute on top
of an “.mli” file (i.e. before any other non-attribute item)
or on top of an “.ml” file without a corresponding interface file,
so that any reference to that unit will trigger the alert:</p><pre>[@@@alert unsafe "This module is unsafe!"]
</pre><p>Controlling which alerts are enabled and whether they are turned into
fatal errors is done either through the compiler’s command-line option
<span class="c003">-alert &lt;spec&gt;</span> or locally in the code through the <span class="c003">alert</span> or
<span class="c003">ocaml.alert</span> attribute taking a single string payload <span class="c003">&lt;spec&gt;</span>. In
both cases, the syntax for <span class="c003">&lt;spec&gt;</span> is a concatenation of items of the
form:</p><ul class="itemize"><li class="li-itemize">
<span class="c003">+id</span> enables alert <span class="c003">id</span>.
</li><li class="li-itemize"><span class="c003">-id</span> disables alert <span class="c003">id</span>.
</li><li class="li-itemize"><span class="c003">++id</span> turns alert <span class="c003">id</span> into a fatal error.
</li><li class="li-itemize"><span class="c003">--id</span> turns alert <span class="c003">id</span> into non-fatal mode.
</li><li class="li-itemize"><span class="c003">@id</span> equivalent to <span class="c003">++id+id</span> (enables <span class="c003">id</span> and turns it into a fatal-error)
</li></ul><p>As a special case, if <span class="c003">id</span> is <span class="c003">all</span>, it stands for all alerts.</p><p>Here are some examples:</p><pre>(* Disable all alerts, reenables just unix (as a soft alert) and window
   (as a fatal-error), for the rest of the current structure *)

[@@@alert "-all--all+unix@window"]
 ...

let x =
  (* Locally disable the window alert *)
  begin[@alert "-window"]
      ...
  end
</pre><p>
Before OCaml 4.08, there was support for a single kind of deprecation
alert. It is now known as the <span class="c003">deprecated</span> alert, but legacy
attributes to trigger it and the legacy ways to control it as warning
3 are still supported. For instance, passing <span class="c003">-w +3</span> on the
command-line is equivant to <span class="c003">-alert +deprecated</span>, and:</p><pre>val x: int
  [@@@ocaml.deprecated "Please do something else"]
</pre><p>
is equivalent to:</p><pre>val x: int
  [@@@ocaml.alert deprecated "Please do something else"]
</pre>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>