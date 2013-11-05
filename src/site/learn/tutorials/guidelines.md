<html>
  <head>
    <title>OCaml Programming Guidelines</title>
  </head>
  <body>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc 2 2"></div>
    </div>

    <h1>OCaml Programming Guidelines</h1>

<p>
  This is a set of reasonable guidelines for formatting OCaml
  programs—guidelines which reflect the consensus among veteran OCaml
  programmers.  Nevertheless, all detailed notifications of possible
  errors or omissions will be noted with pleasure.  To send your
  comments
  using <a href="https://github.com/ocaml/ocaml.org/issues?state=open"
	   >GitHub issues</a>.
  <br />Original translation from French:
  <a href="mailto:datta@math.berkeley.edu" shape="rect">Ruchira Datta</a>.
</p>
<p>
Thanks to all those who have already participated in the critique of this
page:

Daniel de Rauglaudre,
Luc Maranget,
Jacques Garrigue,
Damien Doligez,
Xavier Leroy,
Bruno Verlyck,
Bruno Petazzoni,
Francois Maltey,
Basile Starynkevitch,
Toby Moth,
Pierre Lescanne.
</p>


<h2><a name="generalwriting"></a>
  General guidelines to write programs</h2>

<h3><a name="id148094" id="id148094"><!--0--></a>
  Be simple and readable
  
</h3>
<p>
  The time you spend typing the programs is neglectable compared to
the time spent reading them. That's the reason why you save a lot of
time if you work hard to optimize readability.</p>

<p>All the time you are "wasting" to get a simpler program today, will
return a hundred times in the future during the uncountably many
modifications and readings of the program (starting with the first
debugging).</p>

<blockquote><p>
    <strong>Writing programs law</strong>:
    A program is written once, modified ten times, and read 100 times. So
    simplify its writing, always keep future modifications in mind, and
    never jeopardize readability.
</p></blockquote>

<h2><a name="formatting"></a>
   Program formatting guidelines</h2>

<h3><a name="id148172"></a>Lexical conventions</h3>

<blockquote><p>
    <strong>Pseudo spaces law</strong>:
    never hesitate to separate words of your programs with spaces; the
    space bar is the easiest key to find on the keyboard, press it as
    often as necessary!
</p></blockquote>

<h4>Delimiters</h4>

A space should always follow a delimiter symbol, and spaces should
surround operator symbols.  It has been a great step forward in
typography to separate words by spaces to make written texts easier to
read.  Do the same in your programs if you want them to be readable.

<h4>How to write pairs</h4>

A tuple is parenthesized and the commas therein (delimiters) are each
followed by a space:
 
<code>(1, 2)</code>, <code ml:content="ocaml noeval">let
  triplet = (x, y, z)</code>...

<ul><li><strong>Commonly accepted exceptions</strong>:
    <ul><li><strong>Definition of the components of a pair</strong>:
	In place of <code ml:content="ocaml noeval">let (x, y) =
	  ...</code>, you can write
	<code ml:content="ocaml noeval">let x, y = ...</code>.
       
	<blockquote><p><strong>Justification</strong>: The point is to
	    define several values simultaneously, not to construct a
	    tuple. Moreover, the pattern is set off nicely
	    between <code ml:content="ocaml noeval">let</code>
	    and <code>=</code>.
	</p></blockquote>
      </li><li>
	<strong>Matching several values simultaneously</strong>: It's
	okay to omit parentheses around n-tuples when matching several
	values simultaneously.
      
	<pre ml:content="ocaml noeval">
match x, y with
| 1, _ -> ...
| x, 1 -> ...
| x, y -> ...</pre>
	<blockquote><p><strong>Justification</strong>: The point is to
            match several values in parallel, not to construct a
            tuple. Moreover, the expressions being matched are set off
            by <code><strong>match</strong></code>
            and <code><strong>with</strong></code>, while the patterns
            are set off nicely by <code>|</code> and
            <code>-&gt;</code>.
        </p></blockquote>
    </li></ul>
</li></ul>

<h4>How to write lists</h4>

Write <code>x :: l</code> with spaces around the <code>::</code>
(since
<code>::</code> is an infix operator, hence surrounded by spaces) and
<code>[1; 2; 3]</code> (since <code>;</code> is a delimiter, hence
followed by a space).
  
  
<h4>How to write operator symbols</h4>
  
Be careful to keep operator symbols well separated by spaces: not only
will your formulas be more readable, but you will avoid confusion with
multi-character operators.  (Obvious exceptions to this rule: the
symbols ``<code>!</code>'' and ``<code>.</code>'' are not separated
from their arguments.)  <br />Example: write <code>x + 1</code>
or <code>x + !y</code>.
  
  
<blockquote><p><strong>Justification</strong>:
    If you left out the spaces then <code>x+1</code> would be
    understood, but <code>x+!y</code> would change its meaning since
    ``<code>+!</code>'' would be interpreted as a multi-character
    operator.
</p></blockquote>
<blockquote><p><strong>Criticism</strong>:
    The absence of spaces around an operator
    improves the readability of formulas when you use it to reflect
    the relative precedences of operators. For example
    <code>x*y + 2*z</code> makes it very obvious that multiplication takes
    precedence over addition.
</p></blockquote>
<blockquote><p><strong>Response</strong>: This is a bad idea, a
    chimera, because nothing in the language ensures that the spaces
    properly reflect the meaning of the formula. For example
    <code>x * z-1</code> means <code>(x * z) - 1</code>,
    and not <code>x * (z - 1)</code> as the proposed interpretation of
    spaces would seem to suggest. Besides, the problem of
    multi-character symbols would keep you from using this convention in
    a uniform way: you couldn't leave out the spaces around the
    multiplication to write <code>x*!y + 2*!z</code>. Finally,
    this playing with the spaces is a subtle and flimsy convention, a
    subliminal message which is difficult to grasp on reading. If you
    want to make the precedences obvious, use the expressive means
    brought to you by the language: write parentheses.
</p></blockquote>
<blockquote><p><strong>Additional justification</strong>:
  Systematically surrounding operators with spaces simplify the
  treatment of infix operators which are no more a complex particular
  case; in effect, whereas you can write <code>(+)</code> without
  spaces, you evidently cannot write <code>(*)</code>
  since <code>(*</code> is read as the beginning of a comment. You
  must write at least one space as in “<code>( *)</code>”, although an
  extra space after <code>*</code> is definitively preferable if you
  want to avoid that <code>*)</code> could be read, in some contexts, as
  the end of a comment. All those difficulties are easily avoided if
  you adopt the simple rule proposed here:
  keep operator symbols well separated by spaces.<br />
  In fact you will quickly feel that this rule is not so difficult to
  follow: the space bar is the greatest and best situated key of
  the keyboard, it is the easiest to enter and you cannot miss
  it!
</p></blockquote>

<h4>How to write long character strings</h4>
 
Indent long character strings with the convention in force at that line plus
an indication of string continuation at the end of each line (a
<code>\</code> character at the end of the line that omits white
spaces on the beginning of next line):
<pre ml:content="ocaml noeval">
let universal_declaration =
  "-1- Programs are born <strong>and</strong> remain free <strong>and</strong> equal under the law;\n\
   distinctions can only be based on the common good." in
  ...
</pre>
 
 

<h2><a name="indentation"></a>Indentation of programs</h2>

<blockquote><p>
    <strong>Landin's pseudo law</strong>:
    Treat the indentation of your programs as if it determines the meaning
    of your programs.
</p></blockquote>

<p>I would add to this law: carefully treat the indentation of
  programs because in some cases it really gives the meaning of the program!
</p>

<p>
  The indentation of programs is an art which excites many strong
  opinions.  Here several indentation styles are given which are drawn
  from experience and which have not been severely criticized.
</p>

<p>When a justification for the adopted style has seemed obvious to
  me, I have indicated it. On the other hand, criticisms are also noted.
</p>

<p>So each time, you have to choose between the different styles
  suggested.<br /> The only absolute rule is the first below.
</p>

<h3><a name="indentation-consistency"></a>Consistency of indentation</h3>

Choose a generally accepted style of indentation, then use it
systematically throughout the whole application.

<h3><a name="page-width"></a>Width of the page</h3>
The page is 80 columns wide.

<blockquote><p>
    <strong>Justification</strong>:
    This width makes it possible to read the
    code on all displays and to print it in a legible font on a
    standard sheet.
</p></blockquote>

<h3><a name="page-height"></a>Height of the page</h3>

A function should always fit within one screenful (of about 70 lines),
or in exceptional cases two, at the very most three. To go beyond this
is unreasonable.

<blockquote><p>
    <strong>Justification</strong>:
    When a function goes beyond one screenful, it's time to divide
    it into subproblems and handle them independently. Beyond
    a screenful, one gets lost in the code. The indentation is not
    readable and is difficult to keep correct.
</p></blockquote>

<h3><a name="indentation-val"></a>How much to indent</h3>

The change in indentation between successive lines of the program is
generally 1 or 2 spaces. Pick an amount to indent and stick with it
throughout the program.

<h3><a name="identation-tabs"></a>Using tab stops</h3>

Using the tab character (ASCII character 9) is absolutely <em>not</em>
recommended.

<blockquote><p>
    <strong>Justification</strong>:
    Between one display and another, the indentation of the program
    changes completely; it can also becomes completely wrong, if the
    programmer used both tabulations and spaces to indent the
    program.
</p></blockquote>

<blockquote><p>
    <strong>Criticism</strong>: The purpose of using tabulations is
    just to allow the readers of the program to indent more or less by
    changing the tabs stops.  The overall indentation remains correct
    and the reader is glad to easily customize the indentation amount.
</p></blockquote>

<blockquote><p>
    <strong>Answer</strong>: It seems almost impossible to use this
    method since you should always use tabulations to indent, which is
    hard and unnatural.
</p></blockquote>

<h3><a name="indentation-let"></a>How to indent global
  <code><strong>let</strong> ... ;;</code> definitions</h3>

<p>
  The body of a function defined globally in a module is generally indented
  normally. However, it's okay to treat this case specially to set off the
  definition better.
</p>
<p>
  With a regular indentation of 1 or 2 spaces:
</p>
<pre ml:content="ocaml noeval">
let f x = function
  | C ->
  | D ->
  ...

let g x =
  let tmp =
    match x with
    | C -> 1
    | x -> 0 in
  tmp + 1
</pre>

<blockquote><p>
    <strong>Justification</strong>:
    No exception to the amount of indentation.
</p></blockquote>
<p>
Other conventions are acceptable, for example:
</p>
<ul><li>
    The body is left-justified in the case of pattern-matching.
    
    <pre ml:content="ocaml noeval">
let f x = function
| C ->
| D ->
...
</pre>
    <blockquote><p>
	<strong>Justification</strong>:
	The vertical bars separating the patterns stop when the
	definition is done, so it's still easy to pass on to the
	following definition.
      </p><p><strong>Criticism</strong>:
	An unpleasant exception to the normal indentation.
    </p></blockquote>
  </li><li>
    The body is justified just under the name of the defined function.
    
    <pre ml:content="ocaml noeval">
let f x =
    let tmp = ... in
    try g x with
    | Not_found ->
    ...
</pre>
    <blockquote><p>
	<strong>Justification</strong>:
	The first line of the definition is set off
	nicely, so it's easier to pass from definition to definition.
      </p><p><strong>Criticism</strong>:
	You run into the right margin too quickly.
    </p></blockquote>
</li></ul>

<h3><a name="indentation-letin"></a>How to indent
  <code><strong>let</strong> ... <strong>in</strong></code> constructs</h3>

<p>The expression following a definition introduced
  by <code>let</code> is indented to the same level as the
  keyword <code>let</code>, and the keyword
  <code>in</code> which introduces it is written at the end of the line:
</p>
<pre ml:content="ocaml noeval">
let expr1 = ... in
expr1 + expr1
</pre>
<p>
  In the case of a series of <code>let</code> definitions, the
  preceding rule implies that these definitions should be placed at
  the same indentation level:
</p>
<pre ml:content="ocaml noeval">
let expr1 = ... in
let n = ... in
...
</pre>

<blockquote><p>
    <strong>Justification</strong>:
    It is suggested that a series of “let ...  in” constructs is
    analogous to a set of assumptions in a mathematical text, whence
    the same indentation level for all the assumptions.
</p></blockquote>

<p>
  Variation: some write the keyword <code>in</code> alone on one line to set
  apart the final expression of the computation:
</p>
<pre ml:content="ocaml noeval">
let e1 = ... in
let e2 = ... in
let new_expr =
  let e1' = derive_expression e1
  and e2' = derive_expression e2 in
  Add_expression e1' e2'
in
Mult_expression (new_expr, new_expr)
</pre>
<blockquote><p>
    <strong>Criticism</strong>:
    Lack of consistency.
</p></blockquote>

<h3><a name="indentation-if"></a>How to indent
  <code><strong>if</strong> ... <strong>then</strong>
  ... <strong>else</strong> ... </code></h3>

<h4>Multiple branches</h4>

<p>
  Write conditions with multiple branches at the same level of
  indentation:
</p>
<pre ml:content="ocaml noeval">
if cond1 ...
if cond2 ...
if cond3 ...
</pre>
<blockquote><p>
    <strong>Justification</strong>:
    Analogous treatment to pattern-matching clauses, all
    aligned to the same tab stop.
</p></blockquote>
<p>
  If the sizes of the conditions and the expressions allow,
  write for example:
</p>
<pre ml:content="ocaml noeval">
if cond1 then e1 else
if cond2 then e2 else
if cond3 then e3 else
e4
</pre>
<p>
  If expressions in the branches of multiple conditions have
  to be enclosed (when they include statements for instance),
  write:
</p>
<pre ml:content="ocaml noeval">
if cond then begin
    e1
  end else
if cond2 then begin
    e2
  end else
if cond3 then ...
</pre>

<p>
  Some suggest another method for multiple conditionals,
  starting each line by the keyword <code><strong>else</strong></code>:
</p>
<pre ml:content="ocaml noeval">
if cond1 ...
else if cond2 ...
else if cond3 ...
</pre>

<blockquote><p>
    <strong>Justification</strong>:
    <code>elsif</code> is a keyword in many languages, so use indentation
    and <code><strong>else</strong> <strong>if</strong></code> to bring it
    to mind.  Morever, you do not have to look to the end of line
    to know whether the condition is continued or another test
    is performed.
</p></blockquote>
<blockquote><p>
    <strong>Criticism</strong>: Lack of consistency in the treatment
    of all the conditions.  Why a special case for the first
    condition?
</p></blockquote>

Yet again, choose your style and use it systematically.


<h4>Single branches</h4>
<p>
  Several styles are possible for single branches, according to the
  size of the expressions in question and especially the presence of
  <code><strong>begin</strong></code> <code><strong>end</strong></code>
  or <code><strong>(</strong></code> <code><strong>)</strong></code>
  delimiters
  for these expressions.
</p>

<p>
  In the case of delimiting the branches of a conditional,
  several styles are used:
</p>
<blockquote><p>
    style <code><strong>(</strong></code> at end of line:
  </p><pre ml:content="ocaml noeval">
if cond then (
  e1
) else (
  e2
)
</pre></blockquote>

<blockquote><p> Or alternatively
    first <code><strong>begin</strong></code> at beginning of line:
  </p><pre ml:content="ocaml noeval">
if cond then
  begin
    e1
  end else begin
    e2
  end
</pre></blockquote>

<p>
  In fact the indentation of conditionals depends on the sizes of the
  expressions which make them up.
</p>
<blockquote><p>
    If <code>cond</code>, <code>e1</code> and <code>e2</code>
    are small, simply write them on one line:
  </p><pre ml:content="ocaml noeval">
if cond then e1 else e2
</pre></blockquote>

<blockquote><p> If the expressions making up a conditional are purely
    functional (without side effects), we advocate binding them within the
    conditional with <code ml:content="ocaml noeval">let e = ... in</code>
    when they're too big to fit on a line.

  </p><blockquote><p>
      <strong>Justification</strong>: This way you get back the simple
      indentation on one line which is the most readable. As a side benefit,
      the naming acts as an aid to comprehension.
  </p></blockquote>
</blockquote>

<blockquote><p>
    So now we consider the case in which the expressions in
    question do have side effects, which keeps us from simply binding
    them with a <code ml:content="ocaml noeval">let e = ... in</code>.
  </p><blockquote><p>
      If <code>e1</code> and <code>cond</code> are small, but
      <code>e2</code> large:
    </p><pre ml:content="ocaml noeval">
if cond then e1 else
  e2
</pre></blockquote><blockquote><p>
      If <code>e1</code> and <code>cond</code> are large and
      <code>e2</code> small:
    </p><pre ml:content="ocaml noeval">
if cond then
  e1
else e2
</pre></blockquote><blockquote><p>
      If all the expressions are large:
    </p><pre ml:content="ocaml noeval">
if cond then
  e1
else
  e2
</pre></blockquote><blockquote><p>
      If there
      are <code><strong>(</strong> <strong>)</strong></code>
      delimiters
    </p><pre ml:content="ocaml noeval">
if cond then (
  e1
) else (
  e2
)
</pre></blockquote><blockquote><p>
      A mixture where <code>e1</code> requires
      <code><strong>(</strong> <strong>)</strong></code>
      but <code>e2</code> is small
    </p><pre ml:content="ocaml noeval">
if cond then (
    e1
) else e2
</pre></blockquote></blockquote>


<h3><a name="indentation-pattern"></a>How to indent
  pattern-matching constructs</h3>

<h4>General principles</h4>

All the pattern-matching clauses are introduced by a vertical
bar, <i>including</i> the first one.

<blockquote><p>
    <strong>Criticism</strong>:
    The first vertical bar is not mandatory: hence, there is no
    need to write it.
</p></blockquote>
<blockquote><p>
    <strong>Answer to criticism</strong>: If you omit the first bar
    the indentation seems unnatural : the first case gets an
    indentation that is greater than a normal new line would
    necessitate. It is thus a useless exception to the correct
    indentation rule. It also insists not to use the same syntax for
    the whole set of clauses, writing the first clause as an exception
    with a slightly different syntax. Last, aesthetic value is
    doubtful dubious (some people would say “awful” instead of
    “doubtful”).
</p></blockquote>

<p>
  Align all the pattern-matching clauses at the level of the vertical
  bar which begins each clause, <i>including</i> the first one.
</p>

<p>
  If an expression in a clause is too large to fit on the
  line, you must break the line immediately after the arrow of the
  corresponding clause. Then indent normally, starting from the
  beginning of the pattern of the clause.
</p>

<p>
  Arrows of pattern matching clauses should not be aligned.
</p>

<h4><code><strong>match</strong></code>
  or <code><strong>try</strong></code></h4>

For a <code><strong>match</strong></code> or a
<code><strong>try</strong></code> align the clauses with the beginning of the
construct:

<pre ml:content="ocaml noeval">
match lam with
| Abs (x, body) -> 1 + size_lambda body
| App (lam1, lam2) -> size_lambda lam1 + size_lambda lam2
| Var v -> 1
</pre>
<pre ml:content="ocaml noeval">
try f x with
| Not_found -> ...
| Failure "not yet implemented" -> ...
</pre>

Put the keyword <code><strong>with</strong></code> at the end of the
line. If the preceding expression extends beyond one line, put
<code><strong>with</strong></code> on a line by itself:
<pre ml:content="ocaml noeval">
try
  let y = f x in
  if ...
with
| Not_found -> ...
| Failure "not yet implemented" -> ...
</pre>
<blockquote><p>
    <strong>Justification</strong>: The
    keyword <code><strong>with</strong></code>, on a line by itself shows
    that the program enters the pattern matching part of the construct.
</p></blockquote>

<h4>Indenting expressions inside clauses</h4>

If the expression on the right of the pattern matching arrow is too
large, cut the line after the arrow.

<pre ml:content="ocaml noeval">
match lam with
| Abs (x, body) ->
   1 + size_lambda body
| App (lam1, lam2) ->
   size_lambda lam1 + size_lambda lam2
| Var v ->
</pre>

<p>
  Some programmers generalize this rule to all clauses, as soon
  as one expressions overflows. They will then indent the last clause
  like this:
</p>
<pre ml:content="ocaml noeval">
| Var v ->
   1
</pre>

<p>
  Other programmers go one step further and apply this rule
  systematically to any clause of any pattern matching.
</p>
<pre ml:content="ocaml noeval">
let rec fib = function
  | 0 ->
     1
  | 1 ->
     1
  | n ->
     fib (n - 1) + fib ( n - 2)
</pre>
<blockquote><p>
    <strong>Criticism</strong>: May be not compact enough; for simple
    pattern matchings (or simple clauses in complex matchings), the
    rule does not add any good to readability.
</p></blockquote>
<blockquote><p>
    <strong>Justitification</strong>:
    I don't see any good reason for this rule, unless you are
    paid proportionally to the number of lines of code: in this case
    use this rule to get more money without adding more bugs in your
    OCaml programs!
</p></blockquote>


<h4>Pattern matching in anonymous functions</h4>

Similarly to <code><strong>match</strong></code>
or <code><strong>try</strong></code>, pattern matching of
anonymous functions, starting
by <code><strong>function</strong></code>, are indented with
respect to the <code><strong>function</strong></code> keyword:

<pre ml:content="ocaml noeval">
map
  (function
   | Abs (x, body) -> 1 + size_lambda 0 body
   | App (lam1, lam2) -> size_lambda (size_lambda 0 lam1) lam2
   | Var v -> 1)
  lambda_list
</pre>

<h4>Pattern matching in named functions</h4>

Pattern-matching in functions defined
by <code><strong>let</strong></code> or
<code><strong>let</strong> <strong>rec</strong></code> gives rise
to several reasonable styles which obey the
preceding rules for pattern matching (the one for anonymous
functions being evidently excepted). See above for recommanded styles.

<pre ml:content="ocaml noeval">
let rec size_lambda accu = function
  | Abs (x, body) -> size_lambda (succ accu) body
  | App (lam1, lam2) -> size_lambda (size_lambda accu lam1) lam2
  | Var v -> succ accu
</pre>

<pre ml:content="ocaml noeval">
let rec size_lambda accu = function
| Abs (x, body) -> size_lambda (succ accu) body
| App (lam1, lam2) -> size_lambda (size_lambda accu lam1) lam2
| Var v -> succ accu
</pre>


<h3><a name="indentation-pattern-bad"></a>Bad indentation
  of pattern-matching constructs</h3>

<h4>No <em>beastly</em> indentation of functions and case analyses.</h4>

This consists in indenting normally under the keyword
<code><strong>match</strong></code> or
<code><strong>function</strong></code> which has previously
been pushed to the right. Don't write:

<pre ml:content="ocaml noeval">
let rec f x = function
              | [] -> ...
              ...
</pre>
but choose to indent the line under
the <code><strong>let</strong></code> keyword:

<pre ml:content="ocaml noeval">
let rec f x = function
  | [] -> ...
  ...
</pre>
<blockquote><p>
    <strong>Justification</strong>:
    You bump into the margin. The aesthetic value is doubtful...
</p></blockquote>

<h4>No <em>beastly</em> alignment of the
  <code>-&gt;</code> symbols in pattern-matching clauses.
</h4>
Careful alignment of the arrows of a pattern matching is
considered bad practice, as exemplify in the following fragment:

<pre ml:content="ocaml noeval">
let f = function
  | C1          -> 1
  | Long_name _ -> 2
  | _           -> 3
</pre>

<blockquote><p>
<strong>Justification</strong>:
This makes it harder to maintain the program
       (the addition of a supplementary case can lead the indentations
       of all the lines to change and so ... we often give up
       alignment at that time, then it is better not to align the
       arrows in the first place!).


</p></blockquote>

<h3><a name="indentation-fun"></a>How to indent function calls</h3>

<h4>Indentation to the function's name:</h4>

No problem arises except for functions with many arguments --or very
complicated arguments as well-- which can't fit on the same line.  You
must indent the expressions with respect to the name of the function
(1 or 2 spaces according to the chosen convention). Write small
arguments on the same line, and change lines at the start of an
argument.

<p>
  As far as possible, avoid arguments which consist of complex
  expressions: in these cases define the ``large'' argument by
  a <code><strong>let</strong></code> construction.
</p>
<blockquote><p>
    <strong>Justification</strong>:
    No indentation problem; if the name given to
    the expressions is meaningful, the code is more readable as
    well.
</p></blockquote>
<blockquote><p>
    <strong>Additional justification</strong>: If the evaluation of
    the arguments produces side effects,
    the <code><strong>let</strong></code> binding is in fact necessary
    to explicitly define the order of evaluation.
</p></blockquote>

<h4>Naming complex arguments:</h4>

In place of
<pre ml:content="ocaml noeval">
let temp =
  f x y z
    ``large
    expression''
    ``other large
    expression'' in
...
</pre>
write
<pre ml:content="ocaml noeval">
let t =
  ``large
  expression''
and u =
  ``other large
  expression'' in
let temp =
  f x y z t u in
...
</pre>

<h4>Naming anonymous functions:</h4>

In the case of an iterator whose argument is a complex function,
define the function by a <code><strong>let</strong></code> binding as
well.

In place of
<pre ml:content="ocaml noeval">
List.map
  (function x ->
    blabla
    blabla
    blabla)
  l
</pre>
write
<pre ml:content="ocaml noeval">
let f x =
  blabla
  blabla
  blabla in
List.map f l
</pre>
<blockquote><p>
    <strong>Justification</strong>: Much clearer, in particular if the
    name given to the function is meaningful.
</p></blockquote>

<h3><a name="indent-op"></a>How to indent operations</h3>

When an operator takes complex arguments, or in the presence of
multiple calls to the same operator, start the next the line with the
operator, and don't indent the rest of the operation.  For example:

<pre ml:content="ocaml noeval">
x + y + z
+ t + u
</pre>
<blockquote><p>
    <strong>Justification</strong>: When the operator starts the line,
    it is clear that the operation continues on this line.
</p></blockquote>

In the case of a ``large expression'' in such an operation sequence,
to define the ``large expression'' with the help of
a <code><strong>let</strong> <strong>in</strong></code> construction
is preferable to having to indent the line.

In place of
<pre ml:content="ocaml noeval">
x + y + z
+ ``large
  expression''
</pre>
write
<pre ml:content="ocaml noeval">
let t =
  ``large
   expression'' in
x + y + z + t
</pre>
You most certainly must bind those expressions too large to be
written in one operation in the case of a combination of operators.

In place of the unreadable expression
<pre ml:content="ocaml noeval">
(x + y + z * t)
/ (``large
    expression'')
</pre>
write
<pre ml:content="ocaml noeval">
let u =
  ``large
  expression'' in
(x + y + z * t) / u
</pre>
These guidelines extend to all operators. For example:
<pre ml:content="ocaml noeval">
let u =
  ``large
  expression'' in
x :: y
:: z + 1 :: t :: u
</pre>


<h2><a name="programming"></a>Programming guidelines</h2>

<h3><a name="programming-how"></a>How to program</h3>

<blockquote><p>
    <em>Always put your handiwork back on the bench,<br />
      and then polish it and re-polish it.
    </em>
</p></blockquote>

<h4>Write simple and clear programs</h4>

When this is done, reread, simplify and clarify.  At every stage of
creation, use your head!

<h4>Subdivide your programs into little functions</h4>

Small functions are easier to master.

<h4>Factor out snippets of repeated code by defining them in
  separate functions</h4>

The sharing of code obtained in this way facilitates maintenance since
every correction or improvement automatically spreads throughout the
program.  Besides, the simple act of isolating and naming a snippet of
code sometimes lets you identify an unsuspected feature.

<h4>Never copy-paste code when programming</h4>

Pasting code almost surely indicates introducing a default of
code sharing and neglecting to identify and write a useful auxiliary
function; hence, it means that some code sharing is lost in the
program. Loosing code sharing implies that you will have more problems
afterwards for maintenance: a bug in the pasted code has to be
corrected at each occurrence of the bug in each copy of the code!

<p>
  Moreover, it is difficult to identify that the same set of 10
  lines of code is repeated 20 times throughout the program. By
  contrast, if an auxiliary function defines those 10 lines, it is
  fairly easy to see and find where those lines are used: that's simply
  where the function is called. If code is copy-pasted all over the
  place then the program is more difficult to understand.
</p>

<p>In conclusion, copy-pasting code leads to programs that are more
  difficult to read and more difficult to maintain: it has to be
  banished.
</p>


<h3><a name="programming-comments"</a>How to comment programs</h3>

<h4>Don't hesitate to comment when there's a difficulty</h4>

<h4>If there's no difficulty, there's no point in commenting</h4>

<h4>Avoid comments in the bodies of functions</h4>

<h4>Prefer one comment at the beginning of the function...</h4>

...which explains how the algorithm that is used works. Once more, if
there is no difficulty, there is no point in commenting.

<h4>Avoid nocuous comments</h4>

A <em>nocuous</em> comment is a comment that does not add any
value, i.e. no non-trivial information. The nocuous comment is
evidently not of interest; it is a nuisance since it uselessly
distracts the reader. It is often used to fulfill some strange
criteria related to the so-called <em>software metrology</em>, for
instance the ratio <em>number of comments</em> / <em>number of lines
  of code</em> that perfectly measures a ratio that I don't know the
theoretical or practical interpretation. Absolutely avoid nocuous
comments.

<p>An example of what to avoid: the following comment uses technical
  words and is thus masquerade into a real comment when it has no
  additional information of interest;
</p>
<pre ml:content="ocaml noeval">
(*
  Function print_lambda:
  print a lambda-expression given as argument.

  Arguments: lam, any lambda-expression.
  Returns: nothing.

  Remark: print_lambda can only be used for its side effect.
*)
let rec print_lambda lam =
  match lam with
  | Var s -> printf "%s" s
  | Abs l -> printf "\\ %a" print_lambda l
  | App (l1, l2) ->
     printf "(%a %a)" print_lambda l1 print_lambda l2
</pre>

<h4>Usage in module interface</h4>

The function's usage must appear in the interface of the module which
exports it, not in the program which implements it. Choose comments as
in the OCaml system's interface modules, which will subsequently allow
the documentation of the interface module to be extracted
automatically if need be.

<h4>Use assertions</h4>

<p>
  Use assertions as much as possible: they let you avoid verbose
  comments, while allowing a useful verification upon execution.
</p>
<p>
  For example, the conditions for the arguments of a function to be valid are
  usefully verified by assertions.
</p>
<pre ml:content="ocaml noeval">
let f x =
  assert (x >= 0);
  ...
</pre>
<p>
  Note as well that an assertion is often preferable to a comment
  because it's more trustworthy: an assertion is forced to be pertinent
  because it is verified upon each execution, while a comment can
  quickly become obsolete and then becomes actually detrimental to
  the comprehension of the program.
</p>

<h4>Comments line by line in imperative code</h4>

<p>
  When writing difficult code, and particularly in case of highly
  imperative code with a lot of memory modifications (physical
  mutations in data structures), it is sometime mandatory to comment inside
  the body of functions to explain the implementation of the algorithm
  encoded here, or to follow successive modifications of invariants
  that the function must maintain. Once more, if there is some
  difficulty commenting is mandatory, for each program line if necessary.
</p>


<h3><a name="programming-id"></a>How to choose identifiers</h3>

<p>
  It's hard to choose identifiers whose name evokes the meaning of the
  corresponding portion of the program.  This is why you must devote particular
  care to this, emphasizing clarity and regularity of nomenclature.
</p>

<h4>Don't use abbreviations for global names</h4>

<p>
  Global identifiers (including
  especially the names of functions) can be long, because it's important to
  understand what purpose they serve far from their definition.
</p>

<h4>Separate words by underscores: (<code>int_of_string</code>,
  not <code>intOfString</code>)</h4>

<p>
  Case modifications are meaningful in OCaml: in effect capitalized
  words are reserved for constructors and module names in OCaml;
  in contrast regular variables (functions or identifiers) must
  start by a lowercase letter.  Those rules prevent proper usage of
  case modification for words separation in identifiers: the first word
  starts the identifier, hence it must be lower case and it is forbidden
  to choose <code>IntOfString</code> as the name of a function.
</p>

<h4>Always give the same name to function arguments which have the same
  meaning</h4>
<p>
  If necessary, make this nomenclature explicit in a comment at the
  top of the file); if there are several arguments with the same meaning then
  attach numeral suffixes to them.
</p>

<h4>Local identifiers can be brief, and should be reused from one
  function to another</h4>
<p>
  This augments regularity of style.  Avoid using identifiers
  whose appearance can lead to confusion such as <code>l</code> or
  <code>O</code>, easy to confuse with <code>1</code> and <code>0</code>.
</p>

<p>
  Example:
</p>
<pre ml:content="ocaml noeval">
let add_expression expr1 expr2 = ...
let print_expression expr = ...
</pre>

<p>
  An exception to the recommendation not to use capitalization to separate
  words within identifiers is tolerated in the case of interfacing with existing
  libraries which use this naming convention: this lets OCaml users of the
  library to orient themselves in the original library documentation more
  easily.
</p>

<h3><a name="programming-paren"></a>When to use parentheses
  within an expression</h3>
<p>
  Parentheses are meaningful: they indicate the necessity of using
  an unusual precedence. So they should be used wisely and not sprinkled
  randomly throughout programs. To this end, you should know the usual
  precedences, that is, the combinations of operations which do not
  require parentheses. Quite fortunately this is not complicated if you
  know a little mathematics or strive to follow the following rules:
</p>

<h4>Arithmetic operators: the same rules as in mathematics</h4>
<p>
For example:
<code>1 + 2 * x</code> means <code>1 + (2 * x)</code>.
</p>

<h4>Function application: the same rules as those in mathematics for
  usage of <em>trigonometric functions</em></h4>
<p>
  In mathematics you write
  <code>sin x</code> to mean <code>sin (x)</code>. In the same way
  <code>sin x + cos x</code> means
  <code>(sin x) + (cos x)</code> not
  <code>sin (x + (cos x))</code>. Use the same conventions in OCaml: write
  <code>f x + g x</code> to mean <code>(f x) + (g x)</code>.
  <br />This convention generalizes <strong>to all (infix) operators</strong>:
  <code>f x :: g x</code> means <code>(f x) :: (g x)</code>,
  <code>f x @ g x</code> means <code>(f x) @ (g x)</code>, and
  <code>failwith s ^ s'</code> means <code>(failwith s) ^ s'</code>,
  <em>not</em> <code>failwith (s ^ s')</code>.
</p>

<h4>Comparisons and boolean operators</h4>
<p>
  Comparisons are infix operators, so
  the preceding rules apply.
  This is why <code>f x &lt; g x</code> means
  <code>(f x) &lt; (g x)</code>.
  For type reasons (no other sensible interpretation) the expression
  <code>f x &lt; x + 2</code> means <code>(f x) &lt; (x + 2)</code>.
  In the same way <code>f x &lt; x + 2 &amp;&amp; x &gt; 3</code> means
  <code>((f x) &lt; (x + 2)) &amp;&amp; (x &gt; 3)</code>.
</p>

<h4>The relative precedences of the boolean operators are those of
  mathematics</h4>
<p>
  Although mathematicians have a tendency to overuse parens in
  this case, the boolean ``or'' operator is analogous to addition and the
  ``and'' to multiplication.  So, just as
  <code>1 + 2 * x</code> means
  <code>1 + (2 * x)</code>,
  <code><strong>true</strong> || <strong>false</strong> &amp;&amp; x</code>
  means
  <code><strong>true</strong> || (<strong>false</strong> &amp;&amp; x)</code>.
</p>

<h3><a name="programming-delim"></a>How to delimit
  constructs in programs</h3>
<p>
  When it is necessary to delimit syntactic constructs in programs, use as
  delimiters the keywords
  <code><strong>begin</strong></code>
  and <code><strong>end</strong></code> rather than parentheses.
  However using parentheses is acceptable if you do it in a consistent,
  that is, systematic, way.
</p>
<p>
  This explicit delimiting of constructs essentially concerns
  pattern-matching constructs or sequences embedded
  within <code><strong>if</strong> <strong>then</strong>
    <strong>else</strong></code> constructs.
</p>

<h4><code><strong>match</strong></code> construct in
  a <code><strong>match</strong></code> construct</h4>
<p>
  When a <code><strong>match</strong> ... <strong>with</strong></code> or
  <code><strong>try</strong> ... <strong>with</strong></code> construct
  appears in a pattern-matching clause, it is absolutely necessary to
  delimit this embedded construct (otherwise subsequent clauses of the
  enclosing pattern-matching construct will automatically be associated
  with the enclosed pattern-matching construct).  For example:
</p>
<pre ml:content="ocaml noeval">
match x with
| 1 ->
  begin match y with
  | ...
  end
| 2 ->
...
</pre>

<h4>Sequences inside branches of <code><strong>if</strong></code></h4>
<p>
  In the same way, a sequence which appears in
  the <code><strong>then</strong></code>
  or <code><strong>else</strong></code> part of a conditional must be
  delimited:
</p>
<pre ml:content="ocaml noeval">
if cond then begin
  e1;
  e2
end else begin
  e3;
  e4
end
</pre>


<h3><a name="programming-mod"></a>How to use modules</h3>

<h4>Subdividing into modules</h4>
<p>
  You must subdivide your programs into coherent modules.
</p>
<p>
  For each module, you must explicitly write an interface.
</p>
<p>
  For each interface, you must document the things defined by the
  module: functions, types, exceptions, etc.
</p>

<h4>Opening modules</h4>
<p>
  Avoid <code><strong>open</strong></code> directives, using instead
  the qualified identifier notation.  Thus you will prefer short but
  meaningful module names.
</p>
<blockquote><p>
    <strong>Justification</strong>:
    The use of unqualified identifiers is
    ambiguous and gives rise to difficult-to-detect semantic errors.
</p></blockquote>
<pre ml:content="ocaml noeval">
let lim = String.length name - 1 in
...
let lim = Array.length v - 1 in
...
... List.map succ ...
... Array.map succ ...
</pre>

<h4>When to use open modules rather than leaving them closed</h4>
<p>
  You can consider it normal to open a module which modifies the environment,
  and brings other versions of an important set of functions. For example, the
  <code>Format</code> module provides automatically indented printing.  This
  module redefines the usual printing functions <code>print_string</code>,
  <code>print_int</code>, <code>print_float</code>, etc. So when you use
  <code>Format</code>, open it systematically at the top of the file.
  <br />If you don't open <code>Format</code> you could miss the
  qualification of a printing function, and this could be perfectly
  silent, since many <code>Format</code>'s functions have a
  correspondent in the default environment
  (<code>Pervasives</code>). Mixing printing functions from
  <code>Format</code> and <code>Pervasives</code> leads to subtle bugs
  in the display, that are difficult to trace. For instance:
</p>
<pre ml:content="ocaml noeval">
let f () =
  Format.print_string "Hello World!"; print_newline ()
</pre>
<p>
  is bogus since it does not call <code>Format.print_newline</code> to
  flush the pretty-printer queue and output <code>"Hello World!"</code>.
  Instead <code>"Hello World!"</code> is stuck into the pretty-printer
  queue, while <code>Pervasives.print_newline</code> outputs a carriage
  return on the standard output ... If <code>Format</code> is printing
  on a file and standard output is the terminal, the user will have a
  bad time finding that a carriage return is missing in the file (and
  the display of material on the file is strange, since boxes that
  should be closed by <code>Format.print_newline</code> are still open),
  while a spurious carriage return appeared on the screen!
</p>
<p>
  For the same reason, open large libraries such as the one with
  arbitrary-precision integers so as not to burden the program which
  uses them.
</p>
<pre ml:content="ocaml noeval">
open Num

let rec fib n =
  if n <= 2 then Int 1 else fib (n - 1) +/ fib (n - 2)
</pre>
<blockquote><p>
    <strong>Justification</strong>:
    The program would be less readable if you had to qualify all the
    identifiers.
</p></blockquote>
<p>
  In a program where type definitions are shared, it is good to gather
  these definitions into one or more module(s) without implementations
  (containing only types). Then it's acceptable to systematically open
  the module which exports the shared type definitions.
</p>

<h3><a name="programming-pattern"></a>Pattern-matching</h3>

<h4>Never be afraid of over-using pattern-matching!</h4>

<h4>On the other hand, be careful to avoid non-exhaustive
  pattern-matching constructs</h4>
<p>
  Complete them with care, without using a “catch-all” clause such
  as
  <code>| _ -&gt; ...</code> or <code>| x -&gt; ...</code> when it's
  possible to do without it (for example when matching a concrete type
  defined within the program). See also the next section:
  compiler warnings.
</p>

<h3><a name="programming-warnings"></a>Compiler warnings</h3>
<p>
  Compiler warnings are meant to prevent potential errors; this is why
  you absolutely must heed them and correct your programs if compiling
  them produces such warnings.  Besides, programs whose compilation
  produces warnings have an odor of amateurism which certainly doesn't
  suit your own work!
</p>

<h4>Pattern-matching warnings</h4>
<p>
  Warnings about pattern-matching must be treated with the upmost care:
</p>
<ul><li> Those concerning useless clauses should of course be
    eliminated.
  </li>
  <li> For non-exhaustive pattern-matching you must complete the
    corresponding pattern-matching construct, without adding a default
    case ``catch-all'', such as <code>| _ -&gt; ... </code>, but with an
    explicit list of the constructors not examined by the rest of the
    construct, for example <code>| Cn _ | Cn1 _ -&gt; ... </code>.
        
    <blockquote><p>
	<strong>Justification</strong>: It's not really any more
	complicated to write it this way, and this allows the program
	to evolve more safely.  In effect the addition of a new
	constructor to the datatype being matched will produce an
	alert anew, which will allow the programmer to add a clause
	corresponding to the new constructor if that is warranted.  On
	the contrary, the ``catch-all'' clause will make the function
	compile silently and it might be thought that the function is
	correct as the new constructor will be handled by the default
	case.
    </p></blockquote>
  </li>
  <li> Non-exhaustive pattern-matches induced by clauses with guards
    must also be corrected.  A typical case consists in suppressing a
    redundant guard.
</li></ul>


<h4>De-structuring <code><strong>let</strong></code> bindings</h4>
<p>
  [Translator's note: a
  ``de-structuring <code><strong>let</strong></code> binding'' is one
  which binds several names to several expressions simultaneously. You
  pack all the names you want bound into a collection such as a tuple or
  a list, and you correspondingly pack all the expressions into a
  collective expression. When the
  <code><strong>let</strong></code> binding is evaluated, it unpacks
  the collections on both sides and binds each expression to its
  corresponding name. For example,
  <code><strong>let</strong> x, y = 1, 2</code> is a
  de-structuring <code><strong>let</strong></code> binding which
  performs both the bindings <code><strong>let</strong> x = 1</code>
  and <code><strong>let</strong> y = 2</code> simultaneously.]
  <br />The <code><strong>let</strong></code> binding is not limited to
  simple identifier definitions: you can use it with more complex or
  simpler patterns. For instance
</p>
<ul><li>
    <code><strong>let</strong></code> with complex patterns:<br />
    <code><strong>let</strong> [x; y] <strong>as</strong> l = ...</code><br />
    simultaneously defines a list <code>l</code> and its two elements
    <code>x</code> and <code>y</code>.
  </li>
  <li>
    <code><strong>let</strong></code> with simple pattern:<br />
    <code><strong>let</strong> _ = ...</code> does not define anything,
    it just evaluate the expression on the right hand side of
    the <code>=</code> symbol.
</li></ul>


<h4>The de-structuring <code><strong>let</strong></code> must be
  exhaustive</h4>
<p>
  Only use de-structuring <code><strong>let</strong></code> bindings
  in the case where the pattern-matching is exhaustive (the pattern
  can never fail to match).  Typically, you will thus be limited to
  definitions of product types (tuples or records) or definitions of
  variant type with a single case. In any other case, you should use
  an explicit <code><strong>match</strong>
  ... <strong>with</strong></code> construct.
</p>
<ul><li>
    <code><strong>let</strong> ... <strong>in</strong></code>:
    de-structuring <code><strong>let</strong></code> that give a
    warning must be replaced by an explicit pattern matching. For
    instance, instead of
    <code ml:content="ocaml noeval">let [x; y] as l = List.map succ
    (l1 @ l2) in expression</code> write:
    
    <pre ml:content="ocaml noeval">
match List.map succ (l1 @ l2) with
| [x; y] as l -> expression
| _ -> assert false
</pre>
  </li><li>
    Global definition with de-structuring lets should be rewritten
    with explicit pattern matching and tuples:
    
    <pre ml:content="ocaml noeval">
let x, y, l =
  match List.map succ (l1 @ l2) with
  | [x; y] as l -> x, y, l
  | _ -> assert false
</pre>
</li></ul>
<blockquote><p>
    <strong>Justification</strong>: There is no way to make the
    pattern-matching exhaustive if you use general
    de-structuring <code><strong>let</strong></code> bindings.
</p></blockquote>

<h4>Sequence warnings and <code><strong>let</strong> _ = ...</code></h4>

<p>
  When the compiler emits a warning about the type of an expression in
  a sequence, you have to explicitly indicate that you want to ignore
  the result of this expression. To this end:
</p>
<ul><li>
    use a vacuous binding and suppress the sequence warning of
    
  <pre ml:content="ocaml noeval">
List.map f l;
print_newline ()
</pre>
  write
  <pre ml:content="ocaml noeval">
let _ = List.map f l in
print_newline ()
</pre>
  </li><li> you can also use the predefined function <code>ignore : 'a
    -&gt; unit</code> that ignores its argument to
    return <code>unit</code>.
    
  <pre ml:content="ocaml noeval">
ignore (List.map f l);
print_newline ()
</pre>
  </li><li> In any case, the best way to suppress this warning is to
    understand why it is emitted by the compiler: the compiler warns
    you because your code computes a result that is useless since this
    result is just deleted after computation. Hence, if useful at all,
    this computation is performed only for its side-effects; hence it
    should return unit.  <br />Most of the time, the warning indicates
    the use of the wrong function, a probable confusion between the
    side-effect only version of a function (which is a procedure whose
    result is irrelevant) with its functional counterpart (whose
    result is meaningful).  <br />In the example mentioned above, the
    first situation prevailed, and the programmer should have
    called <code>iter</code> instead of
    <code>map</code>, and simply write
    
  <pre ml:content="ocaml noeval">
List.iter f l;
print_newline ()
</pre>
  In actual programs, the suitable (side-effect only) function may
  not exist and has to be written: very often, a careful separation of
  the procedural part from the functional part of the function at hand
  elegantly solves the problem, and the resulting program just looks
  better afterwards! For instance, you would turn the problematic
  definition:
    
  <pre ml:content="ocaml noeval">
let add x y =
  if x > 1 then print_int x;
  print_newline ();
  x + y;;
</pre>
  into the clearer separate definitions    
  and change old calls to <code>add</code> accordingly.
</li></ul>
<p>
  In any case, use the <code><strong>let</strong> _ = ...</code>
  construction exactly in those cases where you want to ignore a
  result. Don't systematically replace sequences with this
  construction.
</p>
<blockquote><p>
    <strong>Justification</strong>: Sequences are much clearer!
    Compare <code>e1; e2; e3</code> to
  </p><pre ml:content="ocaml noeval">
let _ = e1 in
let _ = e2 in
e3
</pre></blockquote>

<h3><a name="programming-hd"</a>The <code>hd</code>
       and <code>tl</code> functions</h3>
<p>
  Don't use the <code>hd</code> and <code>tl</code> functions, but
  pattern-match the list argument explicitly.
</p>
<blockquote><p>
    <strong>Justification</strong>: This is just as brief as and much
    clearer than using <code>hd</code> and <code>tl</code> which must
    of necessity be protected by <code>try... with...</code> to catch
    the exception which might be raised by these functions.
</p></blockquote>


<h3><a name="programming-loops"></a>Loops</h3>

<h4><code><strong>for</strong></code> loops</h4>
<p>
  To simply traverse an array or a string, use
  a <code><strong>for</strong></code> loop.
</p>
<pre ml:content="ocaml noeval">
for i = 0 to Array.length v - 1 do
  ...
done
</pre>
<p>
  If the loop is complex or returns a result, use a recursive function.
</p>
<pre ml:content="ocaml noeval">
let find_index e v =
  let rec loop i =
    if i >= Array.length v then raise Not_found else
    if v.(i) = e then i else loop (i + 1) in
  loop 0;;
</pre>
<blockquote><p>
    <strong>Justification</strong>: The recursive function lets you
    code any loop whatsoever simply, even a complex one, for example
    with multiple exit points or with strange index steps (steps
    depending on a data value for example).
  </p><p> Besides, the recursive loop avoids the use of mutables whose
    value can be modified in any part of the body of the loop whatsoever
    (or even outside): on the contrary the recursive loop explicitly
    takes as arguments the values susceptible to change during the
    recursive calls.
</p></blockquote>

<h4><code><strong>while</strong></code> loops</h4>

<blockquote><p>
    <strong>While loops law</strong>: Beware: usually a while loop is
    wrong, unless its loop invariant has been explicitly written.
</p></blockquote>

<p>The main use of the <code><strong>while</strong></code> loop is the
  infinite loop
  <code><strong>while</strong> <strong>true</strong> <strong>do</strong>
    ...</code>.  You get out of it through an exception, generally on
  termination of the program.
</p>

<p>Other <code><strong>while</strong></code> loops are hard to use,
  unless they come from canned programs from algorithms courses where
  they were proved.
</p>

<blockquote><p>
    <strong>Justification</strong>:
    <code><strong>while</strong></code> loops require one or more
    mutables in order that the loop condition change value and the
    loop finally terminate.  To prove their correctness, you must
    therefore discover the loop invariants, an interesting but
    difficult sport.
</p></blockquote>


<h3><a name="programming-exn"></a>Exceptions</h3>
<p>
  Don't be afraid to define your own exceptions in your programs, but
  on the other hand use as much as possible the exceptions predefined by
  the system.  For example every search function which fails should
  raise the predefined exception <code>Not_found</code>. Be careful to
  handle the exceptions which may be raised by a function call with the
  help of a <code><strong>try</strong> ... <strong>with</strong></code>.
</p>

<p>
  Handling all exceptions by <code><strong>try</strong>
    ... <strong>with</strong> _ -&gt;</code> is usually reserved for the
  main function of the program.  If you need to catch all exceptions to
  maintain an invariant of an algorithm, be careful to name the
  exception and re-raise it, after having reset the invariant.
  Typically:
</p>
<pre ml:content="ocaml noeval">
let ic = open_in ...
and oc = open_out ... in
try
  treatment ic oc;
  close_in ic; close_out oc
with x -> close_in ic; close_out oc; raise x
</pre>
<blockquote><p>
    <strong>Justification</strong>:
    <code><strong>try</strong> ... <strong>with</strong> _
    -&gt;</code> silently catches all exceptions, even those which
    have nothing to do with the computation at hand (for example an
    interruption will be captured and the computation will continue
    anyway!).
</p></blockquote>


<h3><a name="programming-data"></a>Data structures</h3>
<p>
  One of the great strengths of OCaml is the power of the data
  structures which can be defined and the simplicity of manipulating
  them. So you must take advantage of this to the fullest extent; don't
  hesitate to define your own data structures. In particular, don't
  systematically represent enumerations by whole numbers, nor
  enumerations with two cases by booleans. Examples:
</p>
<pre ml:content="ocaml noeval">
type figure =
   | Triangle | Square | Circle | Parallelogram
type convexity =
   | Convex | Concave | Other
type type_of_definition =
   | Recursive | Non_recursive
</pre>
<blockquote><p>
    <strong>Justification</strong>: A boolean value often prevents
    intuitive understanding of the corresponding code. For example, if
    <code>type_of_definition</code> is coded by a boolean, what does
    <code><strong>true</strong></code> signify? A “normal” definition
    (that is, non-recursive) or a recursive definition?
  </p><p> In the case of an enumerated type encode by an integer, it
    is very difficult to limit the range of acceptable integers: one
    must define construction functions that will ensure the mandatory
    invariants of the program (and verify afterwards that no values has
    been built directly), or add assertions in the program and guards in
    pattern matchings. This is not good practice, when the definition of
    a sum type elegantly solves this problem, with the additional
    benefit of firing the full power of pattern matching and compiler's
    verifications of exhaustiveness.
</p></blockquote>
<blockquote><p>
    <strong>Criticism</strong>: For binary enumerations, one can
    systematically define predicates whose names carry the semantics
    of the boolean that implements the type. For instance, we can
    adopt the convention that a predicate ends by the
    letter <code>p</code>. Then, in place of defining a new sum type
    for <code>type_of_definition</code>, we will use a predicate
    function <code>recursivep</code> that returns true if the
    definition is recursive.
</p></blockquote>
<blockquote><p>
    <strong>Answer</strong>: This method is specific to binary
    enumeration and cannot be easily extended; moreover it is not well
    suited to pattern matching.  For instance, for definitions encoded
    by
    <code>| Let <strong>of</strong> bool * string * expression</code>
    a typical pattern matching would look like:
  </p><pre ml:content="ocaml noeval">
| Let (_, v, e) as def ->
   if recursivep def then code_for_recursive_case
   else code_for_non_recursive_case
</pre><p>
    or, if <code>recursivep</code> can be applied to booleans:
  </p><pre ml:content="ocaml noeval">
| Let (b, v, e) ->
   if recursivep def then code_for_recursive_case
   else code_for_non_recursive_case
</pre><p>
contrast with an explicit encoding:
  </p><pre ml:content="ocaml noeval">
| Let (Recursive, v, e) -> code_for_recursive_case
| Let (Non_recursive, v, e) -> code_for_non_recursive_case
</pre><p>
    The difference between the two programs is subtle and you may
    think that this is just a matter of taste; however the explicit
    encoding is definitively more robust to modifications and fits better
    with the language.
</p></blockquote>

<p>
  <em>A contrario</em>, it is not necessary to systematically define
  new types for boolean flags, when the interpretation of constructors
  <code><strong>true</strong></code>
  and <code><strong>false</strong></code> is clear. The usefulness of
  the definition of the following types is then questionable:
</p>
<pre ml:content="ocaml noeval">
type switch = On | Off
type bit = One | Zero
</pre>
<p>
  The same objection is admissible for enumerated types represented
  as integers, when  those integers have an evident interpretation with
  respect to the data to be represented.
</p>


<h3><a name="programming-mutable"></a>When to use mutables</h3>
<p>
  Mutable values are useful and sometimes indispensable to simple and clear
  programming. Nevertheless, you must use them with discernment: OCaml's normal
  data structures are immutable. They are to be preferred for the clarity and
  safety of programming which they allow.
</p>


<h3><a name="programming-iter"></a>Iterators</h3>
<p>
  OCaml's iterators are a powerful and useful feature. However you
  should not overuse them, nor <i>a contrario</i> neglect them: they
  are provided to you by libraries and have every chance of being
  correct and well-thought-out by the author of the library. So it's
  useless to reinvent them.
</p>
<p>So write
</p>
<pre ml:content="ocaml noeval">
let square_elements elements = List.map carre elements
</pre>
<p>
  rather than:</p>
<pre ml:content="ocaml noeval">
let rec square_elements = function
  | [] -> []
  | elem :: elements -> square elem :: square_elements elements
</pre>
<p>
  On the other hand avoid writing:</p>
<pre ml:content="ocaml noeval">
let iterator f x l =
  List.fold_right (List.fold_left f) [List.map x l] l
</pre>
<p>
  even though you get:</p>
<pre ml:content="ocaml">
  let iterator f x l =
    List.fold_right (List.fold_left f) [List.map x l] l;;
  iterator (fun l x -> x :: l) (fun l -> List.rev l) [[1; 2; 3]]
</pre>
<p>
  In case of express need, you must be careful to add an explanatory
  comment: in my opinion it's absolutely necessary!
</p>


<h3><a name="programming-opt"></a>How to optimize programs</h3>
<blockquote><p>
    <strong>Pseudo law of optimization</strong>: No optimization <i>a
    priori</i>.<br />
    No optimization <i>a posteriori</i> either.
</p></blockquote>

<p>
  Above all program simply and clearly. Don't start optimizing until
  the program bottleneck has been identified (in general a few
  routines). Then optimization consists above all of changing <em>the
  complexity</em> of the algorithm used. This often happens through
  redefining the data structures being manipulated and completely
  rewriting the part of the program which poses a problem.
</p>
<blockquote><p>
    <strong>Justification</strong>: Clarity and correctness of
    programs take precedence. Besides, in a substantial program, it is
    practically impossible to identify <i>a priori</i> the parts of
    the program whose efficiency is of prime importance.
</p></blockquote>

<h3><a name="programming-classes"></a>How to choose between classes
  and modules</h3>
<p>
  You should use OCaml classes when you need inheritance,
  that is, incremental refinement of data and their functionality.
</p>
<p>
  You should use conventional data structures (in particular, variant
  types) when you need pattern-matching.
</p>
<p>
  You should modules when the data structures are fixed and their
  functionality is equally fixed or it's enough to add new functions
  in the programs which use them.
</p>


<h3><a name="programming-clarity"></a>Clarity of OCaml code</h3>
<p>
  The OCaml language includes powerful constructs which allow simple
  and clear programming. The main problem to obtain crystal clear
  programs it to use them appropriately.
</p>
<p>
  The language features numerous programming styles (or programming
  paradigms): imperative programming (based on the notion of state and
  assignment), functional programming (based on the notion of
  function, function results, and calculus), object oriented
  programming (based of the notion of objects encapsulating a state
  and some procedures or methods that can modify the state). The first
  work of the programmer is to choose the programming paradigm that
  fits the best the problem at hand. When using one of those
  programming paradigms, the difficulty is to use the language
  construct that expresses in the most natural and easiest way the
  computation that implements the algorithm.
</p>

<h4>Style dangers</h4>
<p>
  Concerning programming styles, one can usually observe the two
  symmetrical problematic behaviors: on the one hand, the ``all
  imperative'' way (<em>systematic</em> usage of loops and
  assignment), and on the other hand the ``purely functional'' way
  (<em>never</em> use loops nor assignments); the ``100% object''
  style will certainly appear in the next future, but (fortunately) it
  is too new to be discussed here.
</p>
<ul><li>
    <strong>The ``Too much imperative'' danger</strong>:

    <ul><li> It is a bad idea to use imperative style to code a
      function that is <i>naturally</i> recursive. For instance, to
      compute the length of a list, you should not write:
<pre ml:content="ocaml noeval">
let list_length l =
  let l = ref l in
  let res = ref 0 in
  while !l &lt;&gt; [] do
    incr res; l := List.tl !l
  done;
  !res;;
</pre>
in place of the following recursive function, so simple and clear:
<pre ml:content="ocaml noeval">
let rec list_length = function
  | [] -> 0
  | _ :: l -> 1 + list_length l
</pre>
(For those that would contest the equivalence of those two
versions, see the <a href="#equivalenceprogrammes">note
below</a>).

      </li><li> Another common “over imperative error” in the
      imperative world is not to systematically choose the
      simple <code><strong>for</strong></code> loop to iter on the
      element of a vector, but instead to use a complex
	<code><strong>while</strong></code> loop, with one or two
	references (too many useless assignments, too many opportunity
	for errors).

      </li><li> This category of programmer consider that
      the <code><strong>mutable</strong></code> keyword in the record
      type definitions should be implicit.
    </li></ul>
  </li><li>
    <strong>The “Too much functional” danger</strong>:
    
    <ul><li> The programmer that suffers from this disease carefully
	avoids to use arrays and assignment. In the most severe forms, one
	observe a complete denial of writing any imperative construction,
	even in case it is evidently the most elegant way to solve the
	problem.
      </li><li> Characteristic symptoms: systematic rewriting
	of <code><strong>for</strong></code> loops with recursive
	functions, usage of lists in contexts where imperative data
	structures seem to be mandatory to anyone, passing numerous
	global parameters of the problem to every functions, even if a
	global reference would be perfect to avoid these spurious
	parameters that are mainly invariants that must be passed all
	over the place.
      </li><li> This programmer think that
	the <code><strong>mutable</strong></code> keyword in the record
	types definitions should be suppressed from the language.
    </li></ul>
</li></ul>


<h4>OCaml code generally considered unreadable</h4>

<p>The OCaml language includes powerful constructs which allow simple
  and clear programming.  However the power of these constructs also
  lets you write uselessly complicated code, to the point where you get
  a perfectly unreadable program.
</p>
<p>
  Here are a number of known ways:
</p>
<ul><li> Use useless (hence nocive for
    readability) <code><strong>if</strong> <strong>then</strong> <strong>else</strong></code>,
    as in
    
    <pre ml:content="ocaml noeval">
let flush_ps () =
  if not !psused then psused := true
</pre>
    or (more subtle)
    <pre ml:content="ocaml noeval">
let sync b =
  if !last_is_dvi <> b then last_is_dvi := b
</pre>
  </li><li> Code one construct with another. For example code a
    <code><strong>let</strong> ... <strong>in</strong></code> by the
    application of an anonymous function to an
    argument. You would write<br />
    <pre ml:content="ocaml noeval">
(fun x y -> x + y)
   e1 e2
</pre>
    instead of simply writing
    <pre ml:content="ocaml noeval">
let x = e1
and y = e2 in
x + y
</pre>
  </li><li> Systematically code sequences
    with <code><strong>let</strong> <strong>in</strong></code>
    bindings.
  </li><li> Mix computations and side effects, particularly in
    function calls.  Recall that the order of evaluation of arguments
    in a function call is unspecified, which implies that you must not
    mix side effects and computations in function calls. However, when
    there is only one argument you might take advantage of this to
    perform a side effect within the argument, which is extremely
    troublesome for the reader albeit without danger to the program
    semantics. To be absolutely forbidden.

  </li><li> Misuse of iterators and higher-order functions
    (i.e. overuse or under-use them). For example it's better to
    use <code ml:content="ocaml noeval">List.map</code>
    or <code ml:content="ocaml noeval">List.iter</code> than to write
    their equivalents in-line using specific recursive functions of
    your own. Even worse, you don't use
    <code ml:content="ocaml noeval">List.map</code>
    or <code ml:content="ocaml noeval">List.iter</code> but write
    their equivalents in terms of <code ml:content="ocaml
    noeval">List.fold_right</code> and
    <code>List.fold_left</code>.

  </li><li> Another efficient way to write unreadable code is to mix
    all or some of these methods. For example:
    <pre ml:content="ocaml noeval">
(fun u -> print_string "world"; print_string u)
  (let temp = print_string "Hello"; "!" in
   ((fun x -> print_string x; flush stdout) " ";
    temp));;
</pre>
  </li></ul>
<p>
  If you naturally write the program
  <code>print_string "Hello world!"</code> in this way, you can without
  a doubt submit your work to the <a href="mailto:Pierre.Weis@inria.fr"
				     >Obfuscated OCaml Contest</a>.
</p>

<h2><a name="programming-dev"</a>Managing program development</h2>
<p>
  We give here tips from veteran OCaml programmers, which have served
  in developing the compilers which are good examples of large complex
  programs developed by small teams.
</p>

<h3><a name="programming-edit"></a>How to edit programs</h3>

<p>Many developers nurture a kind of veneration towards the Emacs
  editor (gnu-emacs in general) which they use to write their programs.
  The editor interfaces well with the language since it is capable of
  syntax coloring OCaml source code (rendering different categories of
  words in color, coloring keywords for example).
</p>

<p>The following two commands are considered indispensable:</p>
<ul><li>
    <code>CTRL-C-CTRL-C</code> or <code>Meta-X compile</code>:
    launches re-compilation from within the editor (using the
    <code>make</code> command).
  </li><li>
    <code>CTRL-X-`</code>: puts the cursor in the file and at the
    exact place where the OCaml compiler has signaled an error.
</li></ul>

<p>
  Developers describe thus how to use these features:
  <code>CTRL-C-CTRL-C</code> combination recompiles the whole
  application; in case of errors, a succession of
  <code>CTRL-X-`</code> commands permits correction of all the errors
  signaled; the cycle begins again with a new re-compilation launched
  by <code>CTRL-C-CTRL-C</code>.
</p>

<h4>Other emacs tricks</h4>

<p>
  The <code>ESC-/</code> command (dynamic-abbrev-expand) automatically
  completes the word in front of the cursor with one of the words
  present in one of the files being edited.  Thus this lets you always
  choose meaningful identifiers without the tedium of having to type
  extended names in your programs: the
  <code>ESC-/</code> easily completes the identifier after typing the first
  letters.  In case it brings up the wrong completion, each subsequent
  <code>ESC-/</code> proposes an alternate completion.
</p>
<p>Under Unix, the <code>CTRL-C-CTRL-C</code> or <code>Meta-X
    compile</code> combination, followed by <code>CTRL-X-`</code> is also
  used to find all occurrences of a certain string in a OCaml program.
  Instead of launching <code>make</code> to recompile, you launch the
  <code>grep</code> command; then all the ``error messages'' from
  <code>grep</code> are compatible with the <code>CTRL-X-`</code> usage
  which automatically takes you to the file and the place where the
  string is found.
</p>


<h3><a name="programming-edit-interactive"</a>
       How to edit with the interactive system</h3>
<p>
  Under Unix: use the line editor <code>ledit</code> which offers
  great editing capabilities ``à la emacs'' (including
  <code>ESC-/</code>!), as well as a history mechanism which lets you
  retrieve previously typed commands and even retrieve commands from one
  session in another. <code>ledit</code> is written in OCaml and can be
  freely down-loaded
  <a href="ftp://ftp.inria.fr/INRIA/Projects/cristal/caml-light/bazar-ocaml/ledit.tar.gz">here</a>.
</p>

<h3><a name="programming-compile"</a>How to compile</h3>

<p>
  The <code>make</code> utility is indispensable for managing the
  compilation and re-compilation of programs. Sample <code>make</code>
  files can be found
  on <a href="http://caml.inria.fr//cgi-bin/hump.en.cgi" >The
  Hump</a>.  You can also consult the <code>Makefiles</code> for the
  OCaml compilers.
</p>


<h3><a name="programming-SCM"</a>How to develop as a team: version
       control</h3>

<p>
  Users of the <a href="http://git-scm.com/" >Git</a> software version
  control system are never run out of good things to say about the
  productivity gains it brings. This system supports managing
  development by a team of programmers while imposing consistency
  among them, and also maintains a log of changes made to the
  software.  <br /> Git also supports simultaneous development by
  several teams, possibly dispersed among several sites linked on the
  Net.
</p>
<p>
  An anonymous Git read-only
  mirror <a href="https://github.com/ocaml/ocaml" >contains the
    working sources of the OCaml compilers</a>, and the sources of
  other software related to OCaml.
</p>

<h3><a name="programming-notes"</a>Notes</h3>

<h4><a name="equivalenceprogrammes" ></a>Imperative and functional
  versions of <code>list_length</code></h4>

<p>
  The two versions of <code>list_length</code> are not completely
  equivalent in term of complexity, since the imperative version uses
  a constant amount of stack room to execute, whereas the functional
  version needs to store return addresses of suspended recursive calls
  (whose maximum number is equal to the length of the list argument).
  If you want to retrieve a constant space requirement to run the
  functional program you just have to write a function that is
  recursive in its tail (or <em>tail-rec</em>), that is a function
  that just ends by a recursive call (which is not the case here since
  a call to
  <code>+</code> has to be perform after the recursive call has
  returned). Just use an accumulator for intermediate results, as in:
</p>
<pre ml:content="ocaml noeval">
let list_length l =
  let rec loop accu = function
    | [] -> accu
    | _ :: l -> loop (accu + 1) l in
  loop 0 l
</pre>

<p>This way, you get a program that has the same computational
  properties as the imperative program with the additional clarity and
  natural looking of an algorithm that performs pattern matching and
  recursive calls to handle an argument that belongs to a recursive sum
  data type.
</p>


  </body>
</html>
