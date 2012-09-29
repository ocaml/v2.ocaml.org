<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>Using the Format module</title>
  </head>
  <body>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc"></div>
    </div>

    <h1>Using the Format module</h1>

    <p> The <code>Format</code> module of Caml Light and OCaml's
      standard libraries provides pretty-printing facilities to get a
      fancy display for printing routines. This module implements a
      &#8220;pretty-printing engine&#8221; that is intended to break
      lines in a nice way (let's say &#8220;automatically when it is
      necessary&#8221;).
    </p>


    <h2><a name="principles"></a>Principles</h2>

    <p>Line breaking is based on three concepts:
    </p>
    <ul>
      <li>
	<b>boxes</b>: a box is a logical pretty-printing unit, which
	defines a behaviour of the pretty-printing engine to display
	the material inside the box.
      </li>
      <li>
	<b>break hints</b>: a break hint is a directive to the
	pretty-printing engine that proposes to break the line here,
	if it is necessary to properly print the rest of the material.
	Otherwise, the pretty-printing engine never break lines
	(except &#8220;in case of emergency&#8221; to avoid very bad
	output).  In short, a break hint tells the pretty printer that
	a line break here may be appropriate.
      </li>
      <li>
	<b>Indentation rules</b>: When a line break occurs, the
	pretty-printing engines fixes the indentation (or amount of
	leading spaces) of the new line using indentation rules, as
	follows:
	<ul>
	  <li>A box can state the extra indentation of every new line
	  opened in its scope. This extra indentation is named <b>box
	  breaking indentation</b>.
          </li>
	  <li>A break hint can also set the additional indentation of
	  the new line it may fire. This extra indentation is
	  named <b>hint breaking indentation</b>.
          </li>
	  <li>If break hint <code>bh</code> fires a new line within box
            <code>b</code>, then the indentation of the new line is
            simply the sum of: the current indentation of
            box <code>b</code>
            <code>+</code> the additional box breaking indentation, as
            defined by box <code>b</code>
            <code>+</code> the additional hint breaking indentation,
            as defined by break hint <code>bh</code>.
          </li>
	</ul>
      </li>
    </ul>


    <h2><a name="boxes"></a>Boxes</h2>

    <p>There are 4 types of boxes. (The most often used is the
      &#8220;hov&#8221; box type, so skip the rest at first reading).
    </p>

    <ul>
      <li>
	<b>horizontal box</b> (<em>h</em> box, as obtained by the
	<code>open_hbox</code> procedure): within this box, break hints do not
	lead to line breaks.
      </li>
      <li>
	<b>vertical box</b> (<em>v</em> box, as obtained by the
	<code>open_vbox</code> procedure): within this box, every
	break hint lead to a new line.
      </li>
      <li>
	<b>vertical/horizontal box</b> (<em>hv</em> box, as obtained
	by the <code>open_hvbox</code> procedure): if it is possible,
	the entire box is written on a single line; otherwise, every
	break hint within the box leads to a new line.
      </li>
      <li>
	<b>vertical or horizontal box</b> (<em>hov</em> box, as
	obtained by the open_box or open_hovbox procedures): within
	this box, break hints are used to cut the line when there is
	no more room on the line.  There are two kinds of
	&#8220;hov&#8221; boxes, you can find the details
	<a href="#hov-boxes" >below</a>. In first
	approximation, let me consider these two kinds of
	&#8220;hov&#8221; boxes as equivalent and obtained by calling
	the <code>open_box</code> procedure.
      </li>
    </ul>

    <p>Let me give an example. Suppose we can write 10 chars before
    the right margin (that indicates no more room). We represent any
    char as a <code>-</code> sign; characters <code><b></b>[</code>
    and <code><b></b>]</code> indicates the opening and closing of a
    box and <code>b</code> stands for a break hint given to the
    pretty-printing engine.
    </p>

    <p> The output "--b--b--" is displayed like this (the b symbol
    stands for the value of the break that is explained below):
    </p>

    <ul>
      <li>within a &#8220;h&#8221; box:
<pre xml:space="preserve">
   --b--b--
</pre>
  </li>
      <li>within a &#8220;v&#8221; box:

<pre xml:space="preserve">
   --b
   --b
   --
</pre>
      </li>
      <li>within a &#8220;hv&#8221; box:
	<p>If there is enough room to print the box on the line:
        </p>
<pre xml:space="preserve">
   --b--b--
</pre>

    <p>But "---b---b---" that cannot fit on the line is
        written
    </p>
<pre xml:space="preserve">
   ---b
   ---b
   ---
</pre>
      </li>
      <li>within a &#8220;hov&#8221; box:
	<p>If there is enough room to print the box on the line:
        </p>

<pre xml:space="preserve">
   --b--b--
</pre>
    <p>But if "---b---b---" cannot fit on the line, it is written
        as
    </p>
<pre xml:space="preserve">
   ---b---b
   ---
</pre>
    <p>
      The first break hint does not lead to a new line, since there is
      enough room on the line. The second one leads to a new line
      since there is no more room to print the material following
      it. If the room left on the line were even shorter, the first
      break hint may lead to a new line and "---b---b---" is written
      as:
    </p>

<pre xml:space="preserve">
    ---b
    ---b
    ---
</pre>
      </li>
    </ul>

    <h2><a name="spaces"></a>Printing spaces</h2>

    <p>Break hints are also used to output spaces (if the line is not
    split when the break is encountered, otherwise the new line
    indicates properly the separation between printing items). You
    output a break hint using <code>print_break sp indent</code>, and
    this <code>sp</code> integer is used to print &#8220;sp&#8221;
    spaces. Thus
    <code>print_break sp ...</code> may be thought as: print
    <code>sp</code> spaces or output a new line.
    </p>

    <p> For instance, if b is <code>break 1 0</code> in the output
      "--b--b--", we get
    </p>

    <ul>
      <li>within a &#8220;h&#8221; box:
<pre xml:space="preserve">
   -- -- --

</pre>
      </li>
      <li>within a &#8220;v&#8221; box:
<pre xml:space="preserve">
   --
   --
   --
</pre>
      </li>
      <li>within a &#8220;hv&#8221; box:
<pre xml:space="preserve">
   -- -- --

</pre>
   or, according to the remaining room on the line:

<pre xml:space="preserve">
   --
   --
   --
</pre>
  </li>
      <li>
	and similarly for &#8220;hov&#8221; boxes.
    </li>
    </ul>

    <p>Generally speaking, a printing routine using "format", should
    not directly output white spaces: the routine should use break
    hints instead. (For
    instance <code>print_space <b></b>(<b></b>)</code> that is a
    convenient abbreviation for <code>print_break 1 0</code> and
    outputs a single space or break the line.)
    </p>



    <h2><a name="new-lines"></a>Indentation of new lines</h2>

    <p>The user gets 2 ways to fix the indentation of new lines:
    </p>
    <ul>
      <li>
	<b>when defining the box</b>: when you open a box, you can fix
	the indentation added to each new line opened within that
	box.<br /> For instance: <code>open_hovbox 1</code> opens a
	&#8220;hov&#8221; box with new lines indented 1 more than the
	initial indentation of the box. With output "---[--b--b--b--",
	we get:

<pre xml:space="preserve">
   ---[--b--b
        --b--
</pre>
    with <code>open_hovbox 2</code>, we get

<pre xml:space="preserve">
   ---[--b--b
         --b--
</pre>

    Note: the <code><b></b>[</code> sign in the display is not visible
    on the screen, it is just there to materialise the aperture of the
    pretty-printing box. Last &#8220;screen&#8221; stands for:

<pre xml:space="preserve">
    -----b--b
         --b--
</pre>
      </li>
      <li>
	<b>when defining the break that makes the new line</b>. As
	said above, you output a break hint using <code>print_break
	sp <b></b> <b></b> <b></b> <b></b> <b></b> <b></b>
	indent</code>. The <code>indent</code> integer is used to fix
	the additional indentation of the new line. Namely, it is
	added to the default indentation offset of the box where the
	break occurs.<br />

	For instance, if <code><b></b>[</code> stands for the opening
	of a &#8220;hov&#8221; box with 1 as extra indentation (as
	obtained by
      <code>open_hovbox 1</code>), and b is <code>print_break
      1 <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> 2</code>, then
      from output "---[--b--b--b--", we get:

<pre xml:space="preserve">
   ---[-- --
         --
         --
</pre>
      </li>
    </ul>

    <h2><a name="hov-boxes"></a>Refinement on &#8220;hov&#8221; boxes</h2>

    <h3><a name="packing" ></a>Packing and structural
      &#8220;hov&#8221; boxes</h3>

    <p>The &#8220;hov&#8221; box type is refined into two categories.
    </p>
    <ul>
      <li>
	<strong>the vertical or horizontal <em>packing</em>
	box</strong> (as obtained by the open_hovbox procedure): break
	hints are used to cut the line when there is no more room on
	the line; no new line occurs if there is enough room on the
	line.
      </li>
      <li>
	<b>vertical or horizontal <em>structural</em> box</b> (as
	obtained by the open_box procedure): similar to the
	&#8220;hov&#8221; packing box, the break hints are used to cut
	the line when there is no more room on the line; in addition,
	break hints that can show the box structure lead to new lines
	even if there is enough room on the current line.
      </li>
    </ul>

    <h3><a name="packing-and-hov" ></a>Differences between a packing
      and a structural &#8220;hov&#8221; box</h3>

    <p>The difference between a packing and a structural
    &#8220;hov&#8221; box is shown by a routine that closes boxes and
    parentheses at the end of printing: with packing boxes, the
    closure of boxes and parentheses do not lead to new lines if there
    is enough room on the line, whereas with structural boxes each
    break hint will lead to a new line. For instance, when printing
    "[(---[(----[(---b)]b)]b)]", where "b" is a break hint without
    extra indentation (<code>print_cut <b></b>(<b></b>)</code>). If
    "[" means opening of a packing &#8220;hov&#8221; box
    (open_hovbox), "[(---[(----[(---b)]b)]b)]" is printed as follows:
    </p>
<pre xml:space="preserve">
(---
 (----
  (---)))
</pre>

    <p>If we replace the packing boxes by structural boxes (open_box),
    each break hint that precedes a closing parenthesis can show the
    boxes structure, if it leads to a new line; hence
    "[(---[(----[(---b)]b)]b)]" is printed like this:
</p>

<pre xml:space="preserve">
(---
 (----
  (---
  )
 )
)
</pre>



<h2><a name="practice"></a>Practical advice</h2>

    <p> When writing a pretty-printing routine, follow these simple
    rules:
    </p>
    <ol>
      <li>
	Boxes must be opened and closed consistently (<code>open_*</code>
	and <code>close_box</code> must be nested like parentheses).
      </li>
      <li>
	Never hesitate to open a box.
      </li>
      <li>
	Output many break hints, otherwise the pretty-printer is in
	a bad situation where it tries to do its best, which is always
	&#8220;worse than your bad&#8221;.
      </li>
      <li>
	Do not try to force spacing using explicit spaces in the
	character strings. For each space you want in the output emit
	a break hint (<code>print_space <b></b>(<b></b>)</code>),
	unless you explicitly don't want the line to be broken
	here. For instance, imagine you want to pretty print an OCaml
	definition, more precisely a <code>let rec ident =
	expression</code> value definition. You will probably treat
	the first three spaces as &#8220;unbreakable spaces&#8221; and
	write them directly in the string constants for keywords, and
	print <code>"let rec "</code> before the identifier, and
	similarly write <code> =</code> to get an unbreakable space
	after the identifier; in contrast, the space after
	the <code><b></b>=</code> sign is certainly a break hint,
	since breaking the line after <code><b></b>=</code> is a usual
	(and elegant) way to indent the expression part of a
	definition.  In short, it is often necessary to print
	unbreakable spaces; however, most of the time a space should
	be considered a break hint.
      </li>
      <li>
	Do not try to force new lines, let the pretty-printer do it
	for you: that's its only job.  In particular, do not
	use <code>force_newline</code>: this procedure effectively
	leads to a newline, but it also as the unfortunate side effect
	to partially reinitialise the pretty-printing engine, so that
	the rest of the printing material is noticeably messed up.
      </li>
      <li>
	Never put newline characters directly in the strings to be
	printed: pretty printing engine will consider this newline
	character as any other character written on the current line
	and this will completely mess up the output. Instead of new
	line characters use line break hints: if those break hints
	must always result in new lines, it just means that the
	surrounding box must be a vertical box!
      </li>
      <li>
	End your main program by
	a <code>print_newline <b></b>(<b></b>)</code> call, that
	flushes the pretty-printer tables (hence the output).  (Note
	that the top-level loop of the interactive system does it as
	well, just before a new input.)
      </li>
    </ol>


    <h2><a name="printf"></a>
      Printing to <code>stdout</code>: using <code>printf</code>
    </h2>

    <p>The <code>format</code> module provides a general printing
    facility &#8220;à la&#8221; <code>printf</code>. In addition to
    the usual conversion facility provided by <code>printf</code>, you
    can write pretty-printing indications directly inside the format
    string (opening and closing boxes, indicating breaking hints,
    etc).
    </p>

    <p>Pretty-printing annotations are introduced by the
    <code>@</code> symbol, directly into the string format. Almost
    any function of the <code>format</code> module can be called from
    within a <code>printf</code> format string. For instance
    </p>
    <ul>
      <li>
	&#8220;<code>@[</code>&#8221; open a box (<code>open_box
	0</code>).  You may precise the type as an extra argument. For
	instance
	<code>@[&lt;hov n&gt;</code> is equivalent to <code>open_hovbox <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> n</code>.
      </li>
      <li>
	&#8220;<code>@]</code>&#8221; close a box
	(<code>close_box <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> <b></b>(<b></b>)</code>).
      </li><li>
    &#8220;<code>@</code> &#8221; output a breakable space
      (<code>print_space <b></b>(<b></b>)</code>).
      </li>
      <li>
	&#8220;<code>@,</code>&#8221; output a break hint (<code>print_cut <b></b> <b></b> <b></b> <b></b> <b></b> <b></b> <b></b>(<b></b>)</code>).
      </li>
      <li>
	&#8220;<code>@;&lt;n m&gt;</code>&#8221; emit a
	&#8220;full&#8221; break hint (<code>print_break n m</code>).
      </li>
      <li>
	&#8220;<code>@.</code>&#8221; end the pretty-printing, closing all
	the boxes still opened (<code>print_newline <b></b>(<b></b>)</code>).
      </li>
    </ul>

    <p>For instance
    </p>

<pre class="listing">
printf "@[&lt;1&gt;%s@ <b></b>=@ %d@ %s@]@." "Prix TTC" 100 "Euros";;
Prix TTC <b></b>=<b></b> 100 Euros

<span class="output">- : unit <b></b>=<b></b> <b></b>(<b></b>)</span>
</pre>


<h2><a name="example"></a>A concrete example</h2>

    <p>Let me give a full example: the shortest non trivial example
      you could imagine, that is the λ-calculus :)
    </p>

    <p> Thus the problem is to pretty-print the values of a concrete
      data type that models a language of expressions that defines
      functions and their applications to arguments.
    </p>

    <p> First, I give the abstract syntax of lambda-terms (we
      illustrate is in the <a href="../description.html#interactive" >
      interactive system</a>):
    </p>

<pre class="listing" ml:content="ocaml silent">
  type lambda =
    | Lambda of string * lambda
    | Var of string
    | Apply of lambda * lambda
</pre>

    <p>I use the format library to print the lambda-terms:
    </p>

<pre class="listing" ml:content="ocaml">
  open Format;;

  let ident = print_string
  let kwd = print_string;;

  let rec print_exp0 = function
    | Var s ->  ident s
    | lam -> open_hovbox 1; kwd "("; print_lambda lam; kwd ")"; close_box ()
  and print_app = function
    | e -> open_hovbox 2; print_other_applications e; close_box ()
  and print_other_applications f =
    match f with
    | Apply (f, arg) -> print_app f; print_space (); print_exp0 arg
    | f -> print_exp0 f
  and print_lambda = function
    | Lambda (s, lam) ->
        open_hovbox 1;
        kwd "\\"; ident s; kwd "."; print_space(); print_lambda lam;
        close_box()
    | e -> print_app e
</pre>

<p> In Caml Light, replace the first line by:
</p>

<pre class="listing">
#open "format";;
</pre>



<h3><a name="example-fprintf"></a>
  Most general pretty-printing: using <code>fprintf</code>
</h3>

<p>We use the <code>fprintf</code> function to write the most
  versatile version of the pretty-printing functions for lambda-terms.
  Now, the functions get an extra argument, namely a pretty-printing
  formatter (the <code>ppf</code> argument) where printing will
  occur. This way the printing routines are more general, since they can
  print on any formatter defined in the program (either printing to a
  file, or to <code>stdout</code>, to <code>stderr</code>, or even to a
  string).  Furthermore, the pretty-printing functions are now
  compositional, since they may be used in conjunction with the
  special <code>%a</code>
  conversion, that prints a <code>fprintf</code> argument with a user's
  supplied function (these user's supplied functions also have a formatter
  as first argument).
</p>

<p>
  Using <code>fprintf</code>, the lambda-terms printing
  routines can be written as follows:
</p>

<pre class="listing" ml:content="ocaml">
  open Format;;

  let ident ppf s = fprintf ppf "%s" s
  let kwd ppf s = fprintf ppf "%s" s;;

  let rec pr_exp0 ppf = function
    | Var s -> fprintf ppf "%a" ident s
    | lam -> fprintf ppf "@[<1>(%a)@]" pr_lambda lam
  and pr_app ppf e =
    fprintf ppf "@[<2>%a@]" pr_other_applications e
  and pr_other_applications ppf f =
    match f with
    | Apply (f, arg) -> fprintf ppf "%a@ %a" pr_app f pr_exp0 arg
    | f -> pr_exp0 ppf f
  and pr_lambda ppf = function
    | Lambda (s, lam) ->
       fprintf ppf "@[<1>%a%a%a@ %a@]"
               kwd "\\" ident s kwd "." pr_lambda lam
    | e -> pr_app ppf e
</pre>

<p>
  Given those general printing routines, procedures to print
  to <code>stdout</code> or
  <code>stderr</code> is just a matter of partial application:
</p>

<pre class="listing" ml:content="ocaml">
  let print_lambda = pr_lambda std_formatter
  let eprint_lambda = pr_lambda err_formatter
</pre>

  </body>
</html>
