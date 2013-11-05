<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
  <title>Caml Light - FAQ</title>
  <link href="ocaml.css" media="all" type="text/css" rel="stylesheet" />
</head>
<body>
<h1>Caml Light - FAQ</h1>

<div class="Q">Is it possible to get error message in my own
language?</div>

<div class="A">You can choose the language that Caml Light uses to
write its messages. For this:

<ul>
  <li>under Unix: define the <code>LANG</code> environment variable,
  or call the Caml Light system with option <code>-lang</code>.</li>

  <li>under Windows use the <code>-lang</code> option on the command
  line, or in the <code>CAMLWIN.INI</code> file.</li>

  <li>with a Macintosh, edit the resource of the Caml
  application.</li>
</ul>

Language currently available are:

<ul>
  <li><code>fr</code>: french.</li>
  <li><code>es</code>: spanish.</li>
  <li><code>de</code>: german.</li>
  <li><code>it</code>: italian.</li>
  <li><code>src</code>: english.</li>
</ul>

English is the default language for messages that cannot be
translated. If your language is not yet available, and if you want to
translate Caml Light messages (about 50 messages), you're welcome to
contact the Caml team (mail to caml-light@inria.fr).
</div>

</body>
</html>
