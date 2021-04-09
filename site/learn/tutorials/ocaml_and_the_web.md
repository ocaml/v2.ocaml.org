<!-- ((! set title OCaml and the Web !)) ((! set learn !)) -->

*Table of contents*

# OCaml and the Web

**Deprecation Warning:** this tutorial is outdated and largely irrelevant unless you have an odd fascination with CGI Programming.

## Advantages and Disadvantages
Like any other language, OCaml can be used to write CGI programs. The
advantages of using OCaml for CGI scripting are the same as using OCaml
for programming. The disadvantages are the fact that few CGI libraries
exist for the language. One that sticks out in my mind comes as part of
the [OCamlNet
library](http://projects.camlcity.org/projects/ocamlnet.html).

More to come...

## OCaml as a Scripting Language
It is almost trivial to set up OCaml scripting with Apache. The
interactive top-level can be set up as a helper program and can
therefore be used as an impromptu script interpreter.

Exact details on this to come...

It would not be hard to write a preprocessor in Camlp4 and build an true
scripting engine (via a custom top level) in order to have OCaml
function like a true scripting language, similar, albeit much more
powerful than, to PHP. Code could be surrounded by special tags (maybe
"\<?caml" and "?\>") and anything not within those tags would be echoed
unchanged. Any takers? :)

Answer: It exists already, and it's called
[Camlmix](http://mjambon.com/camlmix/index.html "http://mjambon.com/camlmix/index.html")
:-) The latest version (1.3) allows one to compile such programs either
as-is (the text is printed when the module is evaluated) or embedded
into a `render` function that can be called by other modules.

## CGI Programming
For more permanent "deep-web" content, or for actions that need to be
executed with significant speed (i.e., performing complex calculations),
scripting may not be the solution. Compilation of scripts into binary
format (especially native code) can give a significant boost in speed.
[Ocamlscript](http://mjambon.com/ocamlscript.html "http://mjambon.com/ocamlscript.html")
allows one to write one-file scripts that would be transparently
compiled, when needed, using the native code compiler. So you actually
**can** have your cake and eat it too. [Ocamlscript version
2](http://mjambon.com/ocamlscript.html "http://mjambon.com/ocamlscript.html")
fully supports packages installed with [ocamlfind
(Findlib)](http://www.camlcity.org/),
so that lots of fancy libraries could be loaded very easily, from the
script.

## Web Servers and Frameworks
The [PPS Computer Science
Laboratory](http://www.pps.univ-paris-diderot.fr/ "Jussieu") has
created [Ocsigen](http://ocsigen.org/), a
web server and framework written in and for OCaml. The scheme is
functions registered to a url, with pattern matching allowed on GET
arguments, among other neat features.


