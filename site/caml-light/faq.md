<!-- ((! set title Caml Light - FAQ !)) -->

# Caml Light — FAQ

#### Is it possible to get error message in my own language?

You can choose the language that Caml Light uses to
write its messages. For this:

- under Unix: define the `LANG` environment variable, or call the Caml
  Light system with option `-lang`.
- under Windows use the `-lang` option on the command line, or in the
  `CAMLWIN.INI` file.
- with a Macintosh, edit the resource of the Caml application.

Language currently available are:

- `fr`: french.
- `es`: spanish.
- `de`: german.
- `it`: italian.
- `src`: english.
</ul>

English is the default language for messages that cannot be
translated. If your language is not yet available, and if you want to
translate Caml Light messages (about 50 messages), you're welcome to
contact the Caml team (mail to caml-light@inria.fr).
