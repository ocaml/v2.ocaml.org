<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
  <title>Subversion Repo</title>
</head>
<body>

<h1>Subversion Repository</h1>

<p>OCaml is developed using the Subversion (SVN) version control
system.  Public read-only access to our Subversion repository is
available.  It enables advanced users to track changes and bug-fixes
in real-time, without having to wait for the next release.</p>

<p>Bugs can be reported and followed on <a
href="http://caml.inria.fr/mantis">Mantis</a>.</p>

<p>There is also a <a href="https://github.com/ocaml/ocaml">read-only
mirror on GitHub</a>, which is automatically synchronized with the
official SVN repository on a regular basis.</p>

<h2>Accessing the repository</h2>

<p>The address of the repository is
<code>http://caml.inria.fr/svn</code>.  To check out a local, working
copy of the sources:</p>

<pre>
svn checkout http://caml.inria.fr/svn/<em>dir</em>
</pre>

<p>where <em>dir</em> is the subdirectory of interest (see table
below).  </p>
	<p>To update a local working copy with our latest changes:
        </p>

<pre>
svn update
</pre>

<p>If you are not familiar with Subversion commands, see the <a
href="http://svnbook.red-bean.com/" shape="rect">documentation.</a></p>

<p>If you do not need a local copy of the sources but just wish to see
changes and their history, you can also <a
href="http://caml.inria.fr/cgi-bin/viewvc.cgi" shape="rect">browse the
repository via a Web interface.</a></p>

<h2>Repository structure</h2>

<table class="array">
  <tr><th rowspan="1" colspan="1">
    Directory (<em>dir</em>)</th>
    <th rowspan="1" colspan="1">Contents</th>
  </tr>
  <tr>
    <td rowspan="1" colspan="1"><code>ocaml/trunk</code></td>
    <td rowspan="1" colspan="1">The development version of OCaml.
    It will become the next major release.
    Not very stable; use at your own risk.
    </td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1">
      <code>ocaml/version/</code><em>X</em><code>.</code><em>YY</em>
    </td>
    <td rowspan="1" colspan="1">The bug-fix branch for the major
    release number <em>X</em><code>.</code><em>YY</em>
    (e.g. <code>3.11</code>).  Minor releases are culled from this
    branch.  Only bug-fixes and minor extensions are performed in this
    branch, but not incompatible changes.  Recommended for advanced
    users who wish to track bug fixes.
    </td>
  </tr>
  <tr>
    <td rowspan="1" colspan="1"><code>ocaml/branches/</code></td>
    <td rowspan="1" colspan="1">Various branches containing
    experiments or extensions to OCaml,
    e.g. <code>ocaml/branches/jocamltrunk</code> for JoCaml.  Many of
    the experimental branches have been folded in the development
    sources.

   To explore the contents, use <code>svn list</code> or <a
   href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/branches/"
   shape="rect">browse the repository</a> </td>
  </tr>
</table>

</body>
</html>
