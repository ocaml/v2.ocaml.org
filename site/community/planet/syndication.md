<!-- ((! set title OCaml Planet Syndication !)) ((! set news !)) -->

*Table of contents*

# OCaml Planet Syndication

## Guidelines

Two types of feeds are aggregated by the [OCaml Planet](.):
personal and institutional.

Personal feeds are for individuals working with OCaml.  Writing
about OCaml in every entry is not mandatory.  On the contrary, this is
an opportunity to broaden the discussion.  However, entries must respect the
terms of use and the philosophy of `ocaml.org`. Posts should avoid focusing
on overtly commercial topics. If you write a personal blog that also has
many posts on other topics, we will be thankful if you provide us with an
already filtered feed (e.g., tagging posts and using a tag subfeed).

Institutional feeds are those that only handle OCaml information.  The best
way to define what they are is by giving some examples:

- NEWS of an ocaml project (release of OCaml, release of PXP...)
- [Caml Weekly News](http://alan.petitepomme.net/cwn/index.html)
- ...

## How to syndicate your feed

Due to spam, the `ocaml.org` team has disabled automatic planet
syndication. You can still ask to be added to the planet by editing
the
[planet feed file](https://github.com/ocaml/ocaml.org/blob/master/planet_feeds.txt)
and submitting a *pull request*.  In the comment to the pull request,
please provide the following three pieces of information:

- A name for the feed: this can be your name if the feed is about a
  person (e.g. "Sylvain Le Gall"), or the name of the official OCaml
  information channel (e.g. "Caml Weekly News")

- An URL for downloading the feed: this URL must give access to the
  RSS feed itself

- Whether this feed is Personal or an official OCaml
  information channel (Institutional). See the above guidelines
  concerning syndication for these two different kinds of feed.

If you are unable to do that, an alternative slower route is to
[submit an issue](https://github.com/ocaml/ocaml.org/issues) with the
title "Add URL to planet" and the above three pieces of information.

Once you have provided this information, your syndication will be
reviewed by an administrator and put online. If you want to have a
good chance to join the feed there must be at least one post about
OCaml in the most recent entries.

## How to read planet from your RSS reader

We provide the following kinds of feed:

- [Atom](/feed.xml)
<!-- - [FOAF](http://planet.ocaml.org/foafroll.xml) -->
- [OPML](/opml.xml)

Copy/paste one of these links into your favorite feed reader to enjoy
planet news.
