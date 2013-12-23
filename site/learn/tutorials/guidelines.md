<!-- ((! set title OCaml Programming Guidelines !)) ((! set learn !)) -->

*Table of contents*

# OCaml Programming Guidelines
This is a set of reasonable guidelines for formatting OCaml
programs—guidelines which reflect the consensus among veteran OCaml
programmers. Nevertheless, all detailed notifications of possible errors
or omissions will be noted with pleasure. To send your comments using
[GitHub issues](https://github.com/ocaml/ocaml.org/issues?state=open).
<br />
Original translation from French: [Ruchira
Datta](mailto:datta@math.berkeley.edu).

Thanks to all those who have already participated in the critique of
this page: Daniel de Rauglaudre, Luc Maranget, Jacques Garrigue, Damien
Doligez, Xavier Leroy, Bruno Verlyck, Bruno Petazzoni, Francois Maltey,
Basile Starynkevitch, Toby Moth, Pierre Lescanne.

## General guidelines to write programs
###  Be simple and readable
The time you spend typing the programs is neglectable compared to the
time spent reading them. That's the reason why you save a lot of time if
you work hard to optimize readability.

All the time you are "wasting" to get a simpler program today, will
return a hundred times in the future during the uncountably many
modifications and readings of the program (starting with the first
debugging).

> 
> **Writing programs law**: A program is written once, modified ten
> times, and read 100 times. So simplify its writing, always keep future
> modifications in mind, and never jeopardize readability.
> 

## Program formatting guidelines
###  Lexical conventions
> 
> **Pseudo spaces law**: never hesitate to separate words of your
> programs with spaces; the space bar is the easiest key to find on the
> keyboard, press it as often as necessary!
> 

####  Delimiters
A space should always follow a delimiter symbol, and spaces should
surround operator symbols. It has been a great step forward in
typography to separate words by spaces to make written texts easier to
read. Do the same in your programs if you want them to be readable.

####  How to write pairs
A tuple is parenthesized and the commas therein (delimiters) are each
followed by a space: `(1, 2)`, `let   triplet = (x, y, z)`...

* **Commonly accepted exceptions**:
    * **Definition of the components of a pair**: In place of
 `let (x, y) =       ...`, you can write `let x, y = ...`.

> **Justification**: The point is to define several values
> simultaneously, not to construct a tuple. Moreover, the
> pattern is set off nicely between `let` and `=`.

- **Matching several values simultaneously**: It's okay to omit
  parentheses around n-tuples when matching several values
  simultaneously.

        match x, y with
        | 1, _ -> ...
        | x, 1 -> ...
        | x, y -> ...

  > **Justification**: The point is to match several values in
  > parallel, not to construct a tuple. Moreover, the expressions
  > being matched are set off by `match` and `with`, while the
  > patterns are set off nicely by `|` and `->`.


####  How to write lists
Write `x :: l` with spaces around the `::` (since `::` is an infix
operator, hence surrounded by spaces) and `[1; 2; 3]` (since `;` is a
delimiter, hence followed by a space).

####  How to write operator symbols
Be careful to keep operator symbols well separated by spaces: not only
will your formulas be more readable, but you will avoid confusion with
multi-character operators. (Obvious exceptions to this rule: the symbols
`!` and `.` are not separated from their arguments.)<br />
Example: write `x + 1` or `x + !y`.

 
> **Justification**: If you left out the spaces then `x+1` would be
> understood, but `x+!y` would change its meaning since `+!` would
> be interpreted as a multi-character operator.
> 
> **Criticism**: The absence of spaces around an operator improves the
> readability of formulas when you use it to reflect the relative
> precedences of operators. For example `x*y + 2*z` makes it very
> obvious that multiplication takes precedence over addition.
> 
> **Response**: This is a bad idea, a chimera, because nothing in the
> language ensures that the spaces properly reflect the meaning of the
> formula. For example `x * z-1` means `(x * z) - 1`, and not
> `x * (z - 1)` as the proposed interpretation of spaces would seem to
> suggest. Besides, the problem of multi-character symbols would keep
> you from using this convention in a uniform way: you couldn't leave
> out the spaces around the multiplication to write `x*!y + 2*!z`.
> Finally, this playing with the spaces is a subtle and flimsy
> convention, a subliminal message which is difficult to grasp on
> reading. If you want to make the precedences obvious, use the
> expressive means brought to you by the language: write parentheses.
> 
> **Additional justification**: Systematically surrounding operators
> with spaces simplify the treatment of infix operators which are no
> more a complex particular case; in effect, whereas you can write `(+)`
> without spaces, you evidently cannot write `(*)` since `(*` is read as
> the beginning of a comment. You must write at least one space as in
> “`( *)`”, although an extra space after `*` is definitively preferable
> if you want to avoid that `*)` could be read, in some contexts, as the
> end of a comment. All those difficulties are easily avoided if you
> adopt the simple rule proposed here: keep operator symbols well
> separated by spaces.<br />
> In fact you will quickly feel that this rule is not so difficult to
> follow: the space bar is the greatest and best situated key of the
> keyboard, it is the easiest to enter and you cannot miss it!


####  How to write long character strings
Indent long character strings with the convention in force at that line
plus an indication of string continuation at the end of each line (a `\`
character at the end of the line that omits white spaces on the
beginning of next line):

```ocaml
let universal_declaration =
  "-1- Programs are born and remain free and equal under the law;\n\
   distinctions can only be based on the common good." in
  ...
```

## Indentation of programs
> 
> **Landin's pseudo law**: Treat the indentation of your programs as if
> it determines the meaning of your programs.
> 

I would add to this law: carefully treat the indentation of programs
because in some cases it really gives the meaning of the program!

The indentation of programs is an art which excites many strong
opinions. Here several indentation styles are given which are drawn from
experience and which have not been severely criticized.

When a justification for the adopted style has seemed obvious to me, I
have indicated it. On the other hand, criticisms are also noted.

So each time, you have to choose between the different styles
suggested.<br />
 The only absolute rule is the first below.

###  Consistency of indentation
Choose a generally accepted style of indentation, then use it
systematically throughout the whole application.

###  Width of the page
The page is 80 columns wide.

> **Justification**: This width makes it possible to read the code on
> all displays and to print it in a legible font on a standard sheet.
 

###  Height of the page
A function should always fit within one screenful (of about 70 lines),
or in exceptional cases two, at the very most three. To go beyond this
is unreasonable.

 
> **Justification**: When a function goes beyond one screenful, it's
> time to divide it into subproblems and handle them independently.
> Beyond a screenful, one gets lost in the code. The indentation is not
> readable and is difficult to keep correct.


###  How much to indent
The change in indentation between successive lines of the program is
generally 1 or 2 spaces. Pick an amount to indent and stick with it
throughout the program.

###  Using tab stops
Using the tab character (ASCII character 9) is absolutely *not*
recommended.


> **Justification**: Between one display and another, the indentation of
> the program changes completely; it can also becomes completely wrong,
> if the programmer used both tabulations and spaces to indent the
> program.
> 
> **Criticism**: The purpose of using tabulations is just to allow the
> readers of the program to indent more or less by changing the tabs
> stops. The overall indentation remains correct and the reader is glad
> to easily customize the indentation amount.
> 
> **Answer**: It seems almost impossible to use this method since you
> should always use tabulations to indent, which is hard and unnatural.
 

###  How to indent global `let ... ;;` definitions
The body of a function defined globally in a module is generally
indented normally. However, it's okay to treat this case specially to
set off the definition better.

With a regular indentation of 1 or 2 spaces:

```ocaml
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
```
> 
> **Justification**: No exception to the amount of indentation.
> 

Other conventions are acceptable, for example:

* The body is left-justified in the case of pattern-matching.

```ocaml
let f x = function
| C ->
| D ->
...
```
> 
> **Justification**: The vertical bars separating the patterns stop
> when the definition is done, so it's still easy to pass on to the
> following definition.
> 
> **Criticism**: An unpleasant exception to the normal indentation.
> 


* The body is justified just under the name of the defined function.

```ocaml
let f x =
    let tmp = ... in
    try g x with
    | Not_found ->
    ...
```
> 
> **Justification**: The first line of the definition is set off
> nicely, so it's easier to pass from definition to definition.
> 
> **Criticism**: You run into the right margin too quickly.
> 


###  How to indent `let ... in` constructs
The expression following a definition introduced by `let` is indented to
the same level as the keyword `let`, and the keyword `in` which
introduces it is written at the end of the line:

```ocaml
let expr1 = ... in
expr1 + expr1
```
In the case of a series of `let` definitions, the preceding rule implies
that these definitions should be placed at the same indentation level:

```ocaml
let expr1 = ... in
let n = ... in
...
```
> 
> **Justification**: It is suggested that a series of “let ... in”
> constructs is analogous to a set of assumptions in a mathematical
> text, whence the same indentation level for all the assumptions.
> 

Variation: some write the keyword `in` alone on one line to set apart
the final expression of the computation:

```ocaml
let e1 = ... in
let e2 = ... in
let new_expr =
  let e1' = derive_expression e1
  and e2' = derive_expression e2 in
  Add_expression e1' e2'
in
Mult_expression (new_expr, new_expr)
```
> 
> **Criticism**: Lack of consistency.
> 

###  How to indent `if ... then   ... else ... `
####  Multiple branches
Write conditions with multiple branches at the same level of
indentation:

```ocaml
if cond1 ...
if cond2 ...
if cond3 ...
```
> 
> **Justification**: Analogous treatment to pattern-matching clauses,
> all aligned to the same tab stop.
> 

If the sizes of the conditions and the expressions allow, write for
example:

```ocaml
if cond1 then e1 else
if cond2 then e2 else
if cond3 then e3 else
e4
```
If expressions in the branches of multiple conditions have to be
enclosed (when they include statements for instance), write:

```ocaml
if cond then begin
    e1
  end else
if cond2 then begin
    e2
  end else
if cond3 then ...
```
Some suggest another method for multiple conditionals, starting each
line by the keyword `else`:

```ocaml
if cond1 ...
else if cond2 ...
else if cond3 ...
```
> 
> **Justification**: `elsif` is a keyword in many languages, so use
> indentation and `else if` to bring it to mind. Morever, you do not
> have to look to the end of line to know whether the condition is
> continued or another test is performed.
> 
> **Criticism**: Lack of consistency in the treatment of all the
> conditions. Why a special case for the first condition?
> 

Yet again, choose your style and use it systematically.

####  Single branches
Several styles are possible for single branches, according to the size
of the expressions in question and especially the presence of `begin`
`end` or `(` `)` delimiters for these expressions.

In the case of delimiting the branches of a conditional, several styles
are used:

> `(` at end of line:
> 
> ```ocaml
> if cond then (
>   e1
> ) else (
>   e2
> )
> ```
> Or alternatively first `begin` at beginning of line:
> 
> ```ocaml
> if cond then
>   begin
>     e1
>   end else begin
>     e2
>   end
> ```

In fact the indentation of conditionals depends on the sizes of the
expressions which make them up.

> 
> If `cond`, `e1` and `e2` are small, simply write them on one line:
> 
> ```ocaml
> if cond then e1 else e2
> ```
> If the expressions making up a conditional are purely functional
> (without side effects), we advocate binding them within the
> conditional with `let e = ... in` when they're too big to fit on a
> line.
> 
> > 
> > **Justification**: This way you get back the simple indentation on
> > one line which is the most readable. As a side benefit, the naming
> > acts as an aid to comprehension.
> > 
> 
> So now we consider the case in which the expressions in question do
> have side effects, which keeps us from simply binding them with a
> `let e = ... in`.
> 
> > 
> > If `e1` and `cond` are small, but `e2` large:
> > 
> > ```ocaml
> > if cond then e1 else
> >   e2
> > ```
> > 
> > If `e1` and `cond` are large and `e2` small:
> > 
> > ```ocaml
> > if cond then
> >   e1
> > else e2
> > ```
> > 
> > If all the expressions are large:
> > 
> > ```ocaml
> > if cond then
> >   e1
> > else
> >   e2
> > ```
> > 
> > If there are `( )` delimiters
> > 
> > ```ocaml
> > if cond then (
> >   e1
> > ) else (
> >   e2
> > )
> > ```
> > 
> > A mixture where `e1` requires `( )` but `e2` is small
> > 
> > ```ocaml
> > if cond then (
> >     e1
> > ) else e2
> > ```

###  How to indent pattern-matching constructs
####  General principles
All the pattern-matching clauses are introduced by a vertical bar,
*including* the first one.

> 
> **Criticism**: The first vertical bar is not mandatory: hence, there
> is no need to write it.
> 
> **Answer to criticism**: If you omit the first bar the indentation
> seems unnatural : the first case gets an indentation that is greater
> than a normal new line would necessitate. It is thus a useless
> exception to the correct indentation rule. It also insists not to use
> the same syntax for the whole set of clauses, writing the first clause
> as an exception with a slightly different syntax. Last, aesthetic
> value is doubtful dubious (some people would say “awful” instead of
> “doubtful”).
> 

Align all the pattern-matching clauses at the level of the vertical bar
which begins each clause, *including* the first one.

If an expression in a clause is too large to fit on the line, you must
break the line immediately after the arrow of the corresponding clause.
Then indent normally, starting from the beginning of the pattern of the
clause.

Arrows of pattern matching clauses should not be aligned.

####  `match` or `try`
For a `match` or a `try` align the clauses with the beginning of the
construct:

```ocaml
match lam with
| Abs (x, body) -> 1 + size_lambda body
| App (lam1, lam2) -> size_lambda lam1 + size_lambda lam2
| Var v -> 1

try f x with
| Not_found -> ...
| Failure "not yet implemented" -> ...
```
Put the keyword `with` at the end of the line. If the preceding
expression extends beyond one line, put `with` on a line by itself:

```ocaml
try
  let y = f x in
  if ...
with
| Not_found -> ...
| Failure "not yet implemented" -> ...
```
> 
> **Justification**: The keyword `with`, on a line by itself shows that
> the program enters the pattern matching part of the construct.
> 

####  Indenting expressions inside clauses
If the expression on the right of the pattern matching arrow is too
large, cut the line after the arrow.

```ocaml
match lam with
| Abs (x, body) ->
   1 + size_lambda body
| App (lam1, lam2) ->
   size_lambda lam1 + size_lambda lam2
| Var v ->
```
Some programmers generalize this rule to all clauses, as soon as one
expressions overflows. They will then indent the last clause like this:

```ocaml
| Var v ->
   1
```
Other programmers go one step further and apply this rule systematically
to any clause of any pattern matching.

```ocaml
let rec fib = function
  | 0 ->
     1
  | 1 ->
     1
  | n ->
     fib (n - 1) + fib ( n - 2)
```
> 
> **Criticism**: May be not compact enough; for simple pattern matchings
> (or simple clauses in complex matchings), the rule does not add any
> good to readability.
> 
> **Justitification**: I don't see any good reason for this rule, unless
> you are paid proportionally to the number of lines of code: in this
> case use this rule to get more money without adding more bugs in your
> OCaml programs!
> 

####  Pattern matching in anonymous functions
Similarly to `match` or `try`, pattern matching of anonymous functions,
starting by `function`, are indented with respect to the `function`
keyword:

```ocaml
map
  (function
   | Abs (x, body) -> 1 + size_lambda 0 body
   | App (lam1, lam2) -> size_lambda (size_lambda 0 lam1) lam2
   | Var v -> 1)
  lambda_list
```
####  Pattern matching in named functions
Pattern-matching in functions defined by `let` or `let rec` gives rise
to several reasonable styles which obey the preceding rules for pattern
matching (the one for anonymous functions being evidently excepted). See
above for recommanded styles.

```ocaml
let rec size_lambda accu = function
  | Abs (x, body) -> size_lambda (succ accu) body
  | App (lam1, lam2) -> size_lambda (size_lambda accu lam1) lam2
  | Var v -> succ accu

let rec size_lambda accu = function
| Abs (x, body) -> size_lambda (succ accu) body
| App (lam1, lam2) -> size_lambda (size_lambda accu lam1) lam2
| Var v -> succ accu
```
###  Bad indentation of pattern-matching constructs
####  No *beastly* indentation of functions and case analyses.
This consists in indenting normally under the keyword `match` or
`function` which has previously been pushed to the right. Don't write:

```ocaml
let rec f x = function
              | [] -> ...
              ...
```
but choose to indent the line under the `let` keyword:

```ocaml
let rec f x = function
  | [] -> ...
  ...
```
> 
> **Justification**: You bump into the margin. The aesthetic value is
> doubtful...
> 

####  No *beastly* alignment of the `->` symbols in pattern-matching clauses.
Careful alignment of the arrows of a pattern matching is considered bad
practice, as exemplify in the following fragment:

```ocaml
let f = function
  | C1          -> 1
  | Long_name _ -> 2
  | _           -> 3
```
> 
> **Justification**: This makes it harder to maintain the program (the
> addition of a supplementary case can lead the indentations of all the
> lines to change and so ... we often give up alignment at that time,
> then it is better not to align the arrows in the first place!).
> 

###  How to indent function calls
####  Indentation to the function's name:
No problem arises except for functions with many arguments --or very
complicated arguments as well-- which can't fit on the same line. You
must indent the expressions with respect to the name of the function (1
or 2 spaces according to the chosen convention). Write small arguments
on the same line, and change lines at the start of an argument.

As far as possible, avoid arguments which consist of complex
expressions: in these cases define the “large” argument by a `let`
construction.

> 
> **Justification**: No indentation problem; if the name given to the
> expressions is meaningful, the code is more readable as well.
> 
> **Additional justification**: If the evaluation of the arguments
> produces side effects, the `let` binding is in fact necessary to
> explicitly define the order of evaluation.
> 

####  Naming complex arguments:
In place of

```ocaml
let temp =
  f x y z
    “large
    expression”
    “other large
    expression” in
...
```
write

```ocaml
let t =
  “large
  expression”
and u =
  “other large
  expression” in
let temp =
  f x y z t u in
...
```
####  Naming anonymous functions:
In the case of an iterator whose argument is a complex function, define
the function by a `let` binding as well. In place of

```ocaml
List.map
  (function x ->
    blabla
    blabla
    blabla)
  l
```
write

```ocaml
let f x =
  blabla
  blabla
  blabla in
List.map f l
```
> 
> **Justification**: Much clearer, in particular if the name given to
> the function is meaningful.
> 

###  How to indent operations
When an operator takes complex arguments, or in the presence of multiple
calls to the same operator, start the next the line with the operator,
and don't indent the rest of the operation. For example:

```ocaml
x + y + z
+ t + u
```
> 
> **Justification**: When the operator starts the line, it is clear that
> the operation continues on this line.
> 

In the case of a “large expression” in such an operation sequence,
to define the “large expression” with the help of a `let in`
construction is preferable to having to indent the line. In place of

```ocaml
x + y + z
+ “large
  expression”
```
write

```ocaml
let t =
  “large
   expression” in
x + y + z + t
```
You most certainly must bind those expressions too large to be written
in one operation in the case of a combination of operators. In place of
the unreadable expression

```ocaml
(x + y + z * t)
/ (“large
    expression”)
```
write

```ocaml
let u =
  “large
  expression” in
(x + y + z * t) / u
```
These guidelines extend to all operators. For example:

```ocaml
let u =
  “large
  expression” in
x :: y
:: z + 1 :: t :: u
```
## Programming guidelines
###  How to program
> 
> *Always put your handiwork back on the bench,<br />
>  and then polish it and re-polish it.*
> 

####  Write simple and clear programs
When this is done, reread, simplify and clarify. At every stage of
creation, use your head!

####  Subdivide your programs into little functions
Small functions are easier to master.

####  Factor out snippets of repeated code by defining them in separate functions
The sharing of code obtained in this way facilitates maintenance since
every correction or improvement automatically spreads throughout the
program. Besides, the simple act of isolating and naming a snippet of
code sometimes lets you identify an unsuspected feature.

####  Never copy-paste code when programming
Pasting code almost surely indicates introducing a default of code
sharing and neglecting to identify and write a useful auxiliary
function; hence, it means that some code sharing is lost in the program.
Loosing code sharing implies that you will have more problems afterwards
for maintenance: a bug in the pasted code has to be corrected at each
occurrence of the bug in each copy of the code!

Moreover, it is difficult to identify that the same set of 10 lines of
code is repeated 20 times throughout the program. By contrast, if an
auxiliary function defines those 10 lines, it is fairly easy to see and
find where those lines are used: that's simply where the function is
called. If code is copy-pasted all over the place then the program is
more difficult to understand.

In conclusion, copy-pasting code leads to programs that are more
difficult to read and more difficult to maintain: it has to be banished.

###  How to comment programs
####  Don't hesitate to comment when there's a difficulty
####  If there's no difficulty, there's no point in commenting
####  Avoid comments in the bodies of functions
####  Prefer one comment at the beginning of the function...
...which explains how the algorithm that is used works. Once more, if
there is no difficulty, there is no point in commenting.

####  Avoid nocuous comments
A *nocuous* comment is a comment that does not add any value, i.e. no
non-trivial information. The nocuous comment is evidently not of
interest; it is a nuisance since it uselessly distracts the reader. It
is often used to fulfill some strange criteria related to the so-called
*software metrology*, for instance the ratio *number of comments* /
*number of lines of code* that perfectly measures a ratio that I don't
know the theoretical or practical interpretation. Absolutely avoid
nocuous comments.

An example of what to avoid: the following comment uses technical words
and is thus masquerade into a real comment when it has no additional
information of interest;

```ocaml
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
```
####  Usage in module interface
The function's usage must appear in the interface of the module which
exports it, not in the program which implements it. Choose comments as
in the OCaml system's interface modules, which will subsequently allow
the documentation of the interface module to be extracted automatically
if need be.

####  Use assertions
Use assertions as much as possible: they let you avoid verbose comments,
while allowing a useful verification upon execution.

For example, the conditions for the arguments of a function to be valid
are usefully verified by assertions.

```ocaml
let f x =
  assert (x >= 0);
  ...
```
Note as well that an assertion is often preferable to a comment because
it's more trustworthy: an assertion is forced to be pertinent because it
is verified upon each execution, while a comment can quickly become
obsolete and then becomes actually detrimental to the comprehension of
the program.

####  Comments line by line in imperative code
When writing difficult code, and particularly in case of highly
imperative code with a lot of memory modifications (physical mutations
in data structures), it is sometime mandatory to comment inside the body
of functions to explain the implementation of the algorithm encoded
here, or to follow successive modifications of invariants that the
function must maintain. Once more, if there is some difficulty
commenting is mandatory, for each program line if necessary.

###  How to choose identifiers
It's hard to choose identifiers whose name evokes the meaning of the
corresponding portion of the program. This is why you must devote
particular care to this, emphasizing clarity and regularity of
nomenclature.

####  Don't use abbreviations for global names
Global identifiers (including especially the names of functions) can be
long, because it's important to understand what purpose they serve far
from their definition.

####  Separate words by underscores: (`int_of_string`, not `intOfString`)
Case modifications are meaningful in OCaml: in effect capitalized words
are reserved for constructors and module names in OCaml; in contrast
regular variables (functions or identifiers) must start by a lowercase
letter. Those rules prevent proper usage of case modification for words
separation in identifiers: the first word starts the identifier, hence
it must be lower case and it is forbidden to choose `IntOfString` as the
name of a function.

####  Always give the same name to function arguments which have the same meaning
If necessary, make this nomenclature explicit in a comment at the top of
the file); if there are several arguments with the same meaning then
attach numeral suffixes to them.

####  Local identifiers can be brief, and should be reused from one function to another
This augments regularity of style. Avoid using identifiers whose
appearance can lead to confusion such as `l` or `O`, easy to confuse
with `1` and `0`.

Example:

```ocaml
let add_expression expr1 expr2 = ...
let print_expression expr = ...
```
An exception to the recommendation not to use capitalization to separate
words within identifiers is tolerated in the case of interfacing with
existing libraries which use this naming convention: this lets OCaml
users of the library to orient themselves in the original library
documentation more easily.

###  When to use parentheses within an expression
Parentheses are meaningful: they indicate the necessity of using an
unusual precedence. So they should be used wisely and not sprinkled
randomly throughout programs. To this end, you should know the usual
precedences, that is, the combinations of operations which do not
require parentheses. Quite fortunately this is not complicated if you
know a little mathematics or strive to follow the following rules:

####  Arithmetic operators: the same rules as in mathematics
For example: `1 + 2 * x` means `1 + (2 * x)`.

####  Function application: the same rules as those in mathematics for usage of *trigonometric functions*
In mathematics you write `sin x` to mean `sin (x)`. In the same way
`sin x + cos x` means `(sin x) + (cos x)` not `sin (x + (cos x))`. Use
the same conventions in OCaml: write `f x + g x` to mean
`(f x) + (g x)`.<br />
This convention generalizes **to all (infix) operators**: `f x :: g x`
means `(f x) :: (g x)`, `f x @ g x` means `(f x) @ (g x)`, and
`failwith s ^ s'` means `(failwith s) ^ s'`, *not* `failwith (s ^ s')`.

####  Comparisons and boolean operators
Comparisons are infix operators, so the preceding rules apply. This is
why `f x < g x` means `(f x) < (g x)`. For type reasons (no other
sensible interpretation) the expression `f x < x + 2` means
`(f x) < (x + 2)`. In the same way `f x < x + 2 && x > 3` means
`((f x) < (x + 2)) && (x > 3)`.

####  The relative precedences of the boolean operators are those of mathematics
Although mathematicians have a tendency to overuse parens in this case,
the boolean “or” operator is analogous to addition and the “and”
to multiplication. So, just as `1 + 2 * x` means `1 + (2 * x)`,
`true || false && x` means `true || (false && x)`.

###  How to delimit constructs in programs
When it is necessary to delimit syntactic constructs in programs, use as
delimiters the keywords `begin` and `end` rather than parentheses.
However using parentheses is acceptable if you do it in a consistent,
that is, systematic, way.

This explicit delimiting of constructs essentially concerns
pattern-matching constructs or sequences embedded within
`if then     else` constructs.

####  `match` construct in a `match` construct
When a `match ... with` or `try ... with` construct appears in a
pattern-matching clause, it is absolutely necessary to delimit this
embedded construct (otherwise subsequent clauses of the enclosing
pattern-matching construct will automatically be associated with the
enclosed pattern-matching construct). For example:

```ocaml
match x with
| 1 ->
  begin match y with
  | ...
  end
| 2 ->
...
```
####  Sequences inside branches of `if`
In the same way, a sequence which appears in the `then` or `else` part
of a conditional must be delimited:

```ocaml
if cond then begin
  e1;
  e2
end else begin
  e3;
  e4
end
```
###  How to use modules
####  Subdividing into modules
You must subdivide your programs into coherent modules.

For each module, you must explicitly write an interface.

For each interface, you must document the things defined by the module:
functions, types, exceptions, etc.

####  Opening modules
Avoid `open` directives, using instead the qualified identifier
notation. Thus you will prefer short but meaningful module names.

> 
> **Justification**: The use of unqualified identifiers is ambiguous and
> gives rise to difficult-to-detect semantic errors.
> 

```ocaml
let lim = String.length name - 1 in
...
let lim = Array.length v - 1 in
...
... List.map succ ...
... Array.map succ ...
```
####  When to use open modules rather than leaving them closed
You can consider it normal to open a module which modifies the
environment, and brings other versions of an important set of functions.
For example, the `Format` module provides automatically indented
printing. This module redefines the usual printing functions
`print_string`, `print_int`, `print_float`, etc. So when you use
`Format`, open it systematically at the top of the file.<br />
If you don't open `Format` you could miss the qualification of a
printing function, and this could be perfectly silent, since many
`Format`'s functions have a correspondent in the default environment
(`Pervasives`). Mixing printing functions from `Format` and `Pervasives`
leads to subtle bugs in the display, that are difficult to trace. For
instance:

```ocaml
let f () =
  Format.print_string "Hello World!"; print_newline ()
```
is bogus since it does not call `Format.print_newline` to flush the
pretty-printer queue and output `"Hello World!"`. Instead
`"Hello World!"` is stuck into the pretty-printer queue, while
`Pervasives.print_newline` outputs a carriage return on the standard
output ... If `Format` is printing on a file and standard output is the
terminal, the user will have a bad time finding that a carriage return
is missing in the file (and the display of material on the file is
strange, since boxes that should be closed by `Format.print_newline` are
still open), while a spurious carriage return appeared on the screen!

For the same reason, open large libraries such as the one with
arbitrary-precision integers so as not to burden the program which uses
them.

```ocaml
open Num

let rec fib n =
  if n <= 2 then Int 1 else fib (n - 1) +/ fib (n - 2)
```
> 
> **Justification**: The program would be less readable if you had to
> qualify all the identifiers.
> 

In a program where type definitions are shared, it is good to gather
these definitions into one or more module(s) without implementations
(containing only types). Then it's acceptable to systematically open the
module which exports the shared type definitions.

###  Pattern-matching
####  Never be afraid of over-using pattern-matching!
####  On the other hand, be careful to avoid non-exhaustive pattern-matching constructs
Complete them with care, without using a “catch-all” clause such as
`| _ -> ...` or `| x -> ...` when it's possible to do without it (for
example when matching a concrete type defined within the program). See
also the next section: compiler warnings.

###  Compiler warnings
Compiler warnings are meant to prevent potential errors; this is why you
absolutely must heed them and correct your programs if compiling them
produces such warnings. Besides, programs whose compilation produces
warnings have an odor of amateurism which certainly doesn't suit your
own work!

####  Pattern-matching warnings
Warnings about pattern-matching must be treated with the upmost care:

* Those concerning useless clauses should of course be eliminated.


* For non-exhaustive pattern-matching you must complete the
 corresponding pattern-matching construct, without adding a default
 case “catch-all”, such as `| _ -> ... `, but with an explicit
 list of the constructors not examined by the rest of the construct,
 for example `| Cn _ | Cn1 _ -> ... `.

> 
> **Justification**: It's not really any more complicated to write
> it this way, and this allows the program to evolve more safely. In
> effect the addition of a new constructor to the datatype being
> matched will produce an alert anew, which will allow the
> programmer to add a clause corresponding to the new constructor if
> that is warranted. On the contrary, the “catch-all” clause
> will make the function compile silently and it might be thought
> that the function is correct as the new constructor will be
> handled by the default case.
> 


* Non-exhaustive pattern-matches induced by clauses with guards must
 also be corrected. A typical case consists in suppressing a
 redundant guard.

####  De-structuring `let` bindings
[Translator's note: a “de-structuring `let` binding” is one which
binds several names to several expressions simultaneously. You pack all
the names you want bound into a collection such as a tuple or a list,
and you correspondingly pack all the expressions into a collective
expression. When the `let` binding is evaluated, it unpacks the
collections on both sides and binds each expression to its corresponding
name. For example, `let x, y = 1, 2` is a de-structuring `let` binding
which performs both the bindings `let x = 1` and `let y = 2`
simultaneously.]<br />
The `let` binding is not limited to simple identifier definitions: you
can use it with more complex or simpler patterns. For instance

* `let` with complex patterns:<br />
 `let [x; y] as l = ...`<br />
 simultaneously defines a list `l` and its two elements `x` and `y`.
* `let` with simple pattern:<br />
 `let _ = ...` does not define anything, it just evaluate the
 expression on the right hand side of the `=` symbol.

####  The de-structuring `let` must be exhaustive
Only use de-structuring `let` bindings in the case where the
pattern-matching is exhaustive (the pattern can never fail to match).
Typically, you will thus be limited to definitions of product types
(tuples or records) or definitions of variant type with a single case.
In any other case, you should use an explicit `match   ... with`
construct.

* `let ... in`: de-structuring `let` that give a warning must be
 replaced by an explicit pattern matching. For instance, instead of
 `let [x; y] as l = List.map succ     (l1 @ l2) in expression` write:

```ocaml
match List.map succ (l1 @ l2) with
| [x; y] as l -> expression
| _ -> assert false
```


* Global definition with de-structuring lets should be rewritten with
 explicit pattern matching and tuples:

```ocaml
let x, y, l =
  match List.map succ (l1 @ l2) with
  | [x; y] as l -> x, y, l
  | _ -> assert false
```


> 
> **Justification**: There is no way to make the pattern-matching
> exhaustive if you use general de-structuring `let` bindings.
> 

####  Sequence warnings and `let _ = ...`
When the compiler emits a warning about the type of an expression in a
sequence, you have to explicitly indicate that you want to ignore the
result of this expression. To this end:

* use a vacuous binding and suppress the sequence warning of

```ocaml
List.map f l;
print_newline ()
```
write

```ocaml
let _ = List.map f l in
print_newline ()
```


* you can also use the predefined function `ignore : 'a     -> unit`
 that ignores its argument to return `unit`.

```ocaml
ignore (List.map f l);
print_newline ()
```


* In any case, the best way to suppress this warning is to understand
 why it is emitted by the compiler: the compiler warns you because
 your code computes a result that is useless since this result is
 just deleted after computation. Hence, if useful at all, this
 computation is performed only for its side-effects; hence it should
 return unit.<br />
 Most of the time, the warning indicates the use of the wrong
 function, a probable confusion between the side-effect only version
 of a function (which is a procedure whose result is irrelevant) with
 its functional counterpart (whose result is meaningful).<br />
 In the example mentioned above, the first situation prevailed, and
 the programmer should have called `iter` instead of `map`, and
 simply write

```ocaml
List.iter f l;
print_newline ()
```
In actual programs, the suitable (side-effect only) function may not
exist and has to be written: very often, a careful separation of the
procedural part from the functional part of the function at hand
elegantly solves the problem, and the resulting program just looks
better afterwards! For instance, you would turn the problematic
definition:

```ocaml
let add x y =
  if x > 1 then print_int x;
  print_newline ();
  x + y;;
```
into the clearer separate definitions and change old calls to `add`
accordingly.



In any case, use the `let _ = ...` construction exactly in those cases
where you want to ignore a result. Don't systematically replace
sequences with this construction.

> 
> **Justification**: Sequences are much clearer! Compare `e1; e2; e3` to
> 
> ```ocaml
> let _ = e1 in
> let _ = e2 in
> e3
> ```

###  The `hd` and `tl` functions
Don't use the `hd` and `tl` functions, but pattern-match the list
argument explicitly.

> 
> **Justification**: This is just as brief as and much clearer than
> using `hd` and `tl` which must of necessity be protected by
> `try... with...` to catch the exception which might be raised by these
> functions.
> 

###  Loops
####  `for` loops
To simply traverse an array or a string, use a `for` loop.

```ocaml
for i = 0 to Array.length v - 1 do
  ...
done
```
If the loop is complex or returns a result, use a recursive function.

```ocaml
let find_index e v =
  let rec loop i =
    if i >= Array.length v then raise Not_found else
    if v.(i) = e then i else loop (i + 1) in
  loop 0;;
```
> 
> **Justification**: The recursive function lets you code any loop
> whatsoever simply, even a complex one, for example with multiple exit
> points or with strange index steps (steps depending on a data value
> for example).
> 
> Besides, the recursive loop avoids the use of mutables whose value can
> be modified in any part of the body of the loop whatsoever (or even
> outside): on the contrary the recursive loop explicitly takes as
> arguments the values susceptible to change during the recursive calls.
> 

####  `while` loops
> 
> **While loops law**: Beware: usually a while loop is wrong, unless its
> loop invariant has been explicitly written.
> 

The main use of the `while` loop is the infinite loop
`while true do     ...`. You get out of it through an exception,
generally on termination of the program.

Other `while` loops are hard to use, unless they come from canned
programs from algorithms courses where they were proved.

> 
> **Justification**: `while` loops require one or more mutables in order
> that the loop condition change value and the loop finally terminate.
> To prove their correctness, you must therefore discover the loop
> invariants, an interesting but difficult sport.
> 

###  Exceptions
Don't be afraid to define your own exceptions in your programs, but on
the other hand use as much as possible the exceptions predefined by the
system. For example every search function which fails should raise the
predefined exception `Not_found`. Be careful to handle the exceptions
which may be raised by a function call with the help of a
`try ... with`.

Handling all exceptions by `try     ... with _ ->` is usually reserved
for the main function of the program. If you need to catch all
exceptions to maintain an invariant of an algorithm, be careful to name
the exception and re-raise it, after having reset the invariant.
Typically:

```ocaml
let ic = open_in ...
and oc = open_out ... in
try
  treatment ic oc;
  close_in ic; close_out oc
with x -> close_in ic; close_out oc; raise x
```
> 
> **Justification**: `try ... with _     ->` silently catches all
> exceptions, even those which have nothing to do with the computation
> at hand (for example an interruption will be captured and the
> computation will continue anyway!).
> 

###  Data structures
One of the great strengths of OCaml is the power of the data structures
which can be defined and the simplicity of manipulating them. So you
must take advantage of this to the fullest extent; don't hesitate to
define your own data structures. In particular, don't systematically
represent enumerations by whole numbers, nor enumerations with two cases
by booleans. Examples:

```ocaml
type figure =
   | Triangle | Square | Circle | Parallelogram
type convexity =
   | Convex | Concave | Other
type type_of_definition =
   | Recursive | Non_recursive
```
> 
> **Justification**: A boolean value often prevents intuitive
> understanding of the corresponding code. For example, if
> `type_of_definition` is coded by a boolean, what does `true` signify?
> A “normal” definition (that is, non-recursive) or a recursive
> definition?
> 
> In the case of an enumerated type encode by an integer, it is very
> difficult to limit the range of acceptable integers: one must define
> construction functions that will ensure the mandatory invariants of
> the program (and verify afterwards that no values has been built
> directly), or add assertions in the program and guards in pattern
> matchings. This is not good practice, when the definition of a sum
> type elegantly solves this problem, with the additional benefit of
> firing the full power of pattern matching and compiler's verifications
> of exhaustiveness.
> 
> **Criticism**: For binary enumerations, one can systematically define
> predicates whose names carry the semantics of the boolean that
> implements the type. For instance, we can adopt the convention that a
> predicate ends by the letter `p`. Then, in place of defining a new sum
> type for `type_of_definition`, we will use a predicate function
> `recursivep` that returns true if the definition is recursive.
> 
> **Answer**: This method is specific to binary enumeration and cannot
> be easily extended; moreover it is not well suited to pattern
> matching. For instance, for definitions encoded by
> `| Let of bool * string * expression` a typical pattern matching would
> look like:
> 
> ```ocaml
> | Let (_, v, e) as def ->
>    if recursivep def then code_for_recursive_case
>    else code_for_non_recursive_case
> ```
> 
> or, if `recursivep` can be applied to booleans:
> 
> ```ocaml
> | Let (b, v, e) ->
>    if recursivep def then code_for_recursive_case
>    else code_for_non_recursive_case
> ```
> 
> contrast with an explicit encoding:
> 
> ```ocaml
> | Let (Recursive, v, e) -> code_for_recursive_case
> | Let (Non_recursive, v, e) -> code_for_non_recursive_case
> ```
> 
> The difference between the two programs is subtle and you may think
> that this is just a matter of taste; however the explicit encoding is
> definitively more robust to modifications and fits better with the
> language.
> 

*A contrario*, it is not necessary to systematically define new types
for boolean flags, when the interpretation of constructors `true` and
`false` is clear. The usefulness of the definition of the following
types is then questionable:

```ocaml
type switch = On | Off
type bit = One | Zero
```
The same objection is admissible for enumerated types represented as
integers, when those integers have an evident interpretation with
respect to the data to be represented.

###  When to use mutables
Mutable values are useful and sometimes indispensable to simple and
clear programming. Nevertheless, you must use them with discernment:
OCaml's normal data structures are immutable. They are to be preferred
for the clarity and safety of programming which they allow.

###  Iterators
OCaml's iterators are a powerful and useful feature. However you should
not overuse them, nor *a contrario* neglect them: they are provided to
you by libraries and have every chance of being correct and
well-thought-out by the author of the library. So it's useless to
reinvent them.

So write

```ocaml
let square_elements elements = List.map carre elements
```
rather than:

```ocaml
let rec square_elements = function
  | [] -> []
  | elem :: elements -> square elem :: square_elements elements
```
On the other hand avoid writing:

```ocaml
let iterator f x l =
  List.fold_right (List.fold_left f) [List.map x l] l
```
even though you get:

```ocaml
  let iterator f x l =
    List.fold_right (List.fold_left f) [List.map x l] l;;
  iterator (fun l x -> x :: l) (fun l -> List.rev l) [[1; 2; 3]]
```
In case of express need, you must be careful to add an explanatory
comment: in my opinion it's absolutely necessary!

###  How to optimize programs
> 
> **Pseudo law of optimization**: No optimization *a priori*.<br />
>  No optimization *a posteriori* either.
> 

Above all program simply and clearly. Don't start optimizing until the
program bottleneck has been identified (in general a few routines). Then
optimization consists above all of changing *the complexity* of the
algorithm used. This often happens through redefining the data
structures being manipulated and completely rewriting the part of the
program which poses a problem.

> 
> **Justification**: Clarity and correctness of programs take
> precedence. Besides, in a substantial program, it is practically
> impossible to identify *a priori* the parts of the program whose
> efficiency is of prime importance.
> 

###  How to choose between classes and modules
You should use OCaml classes when you need inheritance, that is,
incremental refinement of data and their functionality.

You should use conventional data structures (in particular, variant
types) when you need pattern-matching.

You should modules when the data structures are fixed and their
functionality is equally fixed or it's enough to add new functions in
the programs which use them.

###  Clarity of OCaml code
The OCaml language includes powerful constructs which allow simple and
clear programming. The main problem to obtain crystal clear programs it
to use them appropriately.

The language features numerous programming styles (or programming
paradigms): imperative programming (based on the notion of state and
assignment), functional programming (based on the notion of function,
function results, and calculus), object oriented programming (based of
the notion of objects encapsulating a state and some procedures or
methods that can modify the state). The first work of the programmer is
to choose the programming paradigm that fits the best the problem at
hand. When using one of those programming paradigms, the difficulty is
to use the language construct that expresses in the most natural and
easiest way the computation that implements the algorithm.

####  Style dangers
Concerning programming styles, one can usually observe the two
symmetrical problematic behaviors: on the one hand, the “all
imperative” way (*systematic* usage of loops and assignment), and on
the other hand the “purely functional” way (*never* use loops nor
assignments); the “100% object” style will certainly appear in the
next future, but (fortunately) it is too new to be discussed here.

* **The “Too much imperative” danger**:
    * It is a bad idea to use imperative style to code a function that
 is *naturally* recursive. For instance, to compute the length of
 a list, you should not write:

```ocaml
let list_length l =
  let l = ref l in
  let res = ref 0 in
  while !l <> [] do
    incr res; l := List.tl !l
  done;
  !res;;
```
in place of the following recursive function, so simple and
clear:

```ocaml
let rec list_length = function
  | [] -> 0
  | _ :: l -> 1 + list_length l
```
(For those that would contest the equivalence of those two
versions, see the [note below](#Imperativeandfunctionalversionsoflistlength)).


* Another common “over imperative error” in the imperative world is
  not to systematically choose the simple `for` loop to iter on the
  element of a vector, but instead to use a complex `while` loop, with
  one or two references (too many useless assignments, too many
  opportunity for errors).

* This category of programmer consider that the `mutable` keyword in
  the record type definitions should be implicit.

* **The “Too much functional” danger**:
    * The programmer that adheres to this dogma avoids
 using arrays and assignment. In the most severe case, one
 observes a complete denial of writing any imperative
 construction, even in case it is evidently the most elegant way
 to solve the problem.
    * Characteristic symptoms: systematic rewriting of `for` loops
 with recursive functions, usage of lists in contexts where
 imperative data structures seem to be mandatory to anyone,
 passing numerous global parameters of the problem to every
 functions, even if a global reference would be perfect to avoid
 these spurious parameters that are mainly invariants that must
 be passed all over the place.
    * This programmer think that the `mutable` keyword in the record
 types definitions should be suppressed from the language.

####  OCaml code generally considered unreadable
The OCaml language includes powerful constructs which allow simple and
clear programming. However the power of these constructs also lets you
write uselessly complicated code, to the point where you get a perfectly
unreadable program.

Here are a number of known ways:

* Use useless (hence nocive for readability) `if then else`, as in

```ocaml
let flush_ps () =
  if not !psused then psused := true
```
or (more subtle)

```ocaml
let sync b =
  if !last_is_dvi <> b then last_is_dvi := b
```


* Code one construct with another. For example code a `let ... in` by
 the application of an anonymous function to an argument. You would
 write<br />

```ocaml
(fun x y -> x + y)
   e1 e2
```
instead of simply writing

```ocaml
let x = e1
and y = e2 in
x + y
```


* Systematically code sequences with `let in` bindings.


* Mix computations and side effects, particularly in function calls.
 Recall that the order of evaluation of arguments in a function call
 is unspecified, which implies that you must not mix side effects and
 computations in function calls. However, when there is only one
 argument you might take advantage of this to perform a side effect
 within the argument, which is extremely troublesome for the reader
 albeit without danger to the program semantics. To be absolutely
 forbidden.


* Misuse of iterators and higher-order functions (i.e. overuse or
 under-use them). For example it's better to use `List.map` or
 `List.iter` than to write their equivalents in-line using specific
 recursive functions of your own. Even worse, you don't use
 `List.map` or `List.iter` but write their equivalents in terms of
 `List.fold_right` and `List.fold_left`.


* Another efficient way to write unreadable code is to mix all or some
 of these methods. For example:

```ocaml
(fun u -> print_string "world"; print_string u)
  (let temp = print_string "Hello"; "!" in
   ((fun x -> print_string x; flush stdout) " ";
    temp));;
```


If you naturally write the program `print_string "Hello world!"` in this
way, you can without a doubt submit your work to the [Obfuscated OCaml
Contest](mailto:Pierre.Weis@inria.fr).

## Managing program development
We give here tips from veteran OCaml programmers, which have served in
developing the compilers which are good examples of large complex
programs developed by small teams.

###  How to edit programs
Many developers nurture a kind of veneration towards the Emacs editor
(gnu-emacs in general) which they use to write their programs. The
editor interfaces well with the language since it is capable of syntax
coloring OCaml source code (rendering different categories of words in
color, coloring keywords for example).

The following two commands are considered indispensable:

* `CTRL-C-CTRL-C` or `Meta-X compile`: launches re-compilation from
 within the editor (using the `make` command).
* `` CTRL-X-` ``: puts the cursor in the file and at the exact place
 where the OCaml compiler has signaled an error.

Developers describe thus how to use these features: `CTRL-C-CTRL-C`
combination recompiles the whole application; in case of errors, a
succession of `` CTRL-X-` `` commands permits correction of all the
errors signaled; the cycle begins again with a new re-compilation
launched by `CTRL-C-CTRL-C`.

####  Other emacs tricks
The `ESC-/` command (dynamic-abbrev-expand) automatically completes the
word in front of the cursor with one of the words present in one of the
files being edited. Thus this lets you always choose meaningful
identifiers without the tedium of having to type extended names in your
programs: the `ESC-/` easily completes the identifier after typing the
first letters. In case it brings up the wrong completion, each
subsequent `ESC-/` proposes an alternate completion.

Under Unix, the `CTRL-C-CTRL-C` or `Meta-X     compile` combination,
followed by `` CTRL-X-` `` is also used to find all occurrences of a
certain string in a OCaml program. Instead of launching `make` to
recompile, you launch the `grep` command; then all the “error
messages” from `grep` are compatible with the `` CTRL-X-` `` usage
which automatically takes you to the file and the place where the string
is found.

###  How to edit with the interactive system
Under Unix: use the line editor `ledit` which offers great editing
capabilities “à la emacs” (including `ESC-/`!), as well as a history
mechanism which lets you retrieve previously typed commands and even
retrieve commands from one session in another. `ledit` is written in
OCaml and can be freely down-loaded
[here](ftp://ftp.inria.fr/INRIA/Projects/cristal/caml-light/bazar-ocaml/ledit.tar.gz).

###  How to compile
The `make` utility is indispensable for managing the compilation and
re-compilation of programs. Sample `make` files can be found on [The
Hump](http://caml.inria.fr//cgi-bin/hump.en.cgi). You can also consult
the `Makefiles` for the OCaml compilers.

###  How to develop as a team: version control
Users of the [Git](http://git-scm.com/) software version control system
are never run out of good things to say about the productivity gains it
brings. This system supports managing development by a team of
programmers while imposing consistency among them, and also maintains a
log of changes made to the software.<br />
 Git also supports simultaneous development by several teams, possibly
dispersed among several sites linked on the Net.

An anonymous Git read-only mirror [contains the working sources of the
OCaml compilers](https://github.com/ocaml/ocaml), and the sources of
other software related to OCaml.

##  Notes
###  Imperative and functional versions of `list_length`
The two versions of `list_length` are not completely equivalent in term
of complexity, since the imperative version uses a constant amount of
stack room to execute, whereas the functional version needs to store
return addresses of suspended recursive calls (whose maximum number is
equal to the length of the list argument). If you want to retrieve a
constant space requirement to run the functional program you just have
to write a function that is recursive in its tail (or *tail-rec*), that
is a function that just ends by a recursive call (which is not the case
here since a call to `+` has to be perform after the recursive call has
returned). Just use an accumulator for intermediate results, as in:

```ocaml
let list_length l =
  let rec loop accu = function
    | [] -> accu
    | _ :: l -> loop (accu + 1) l in
  loop 0 l
```
This way, you get a program that has the same computational properties
as the imperative program with the additional clarity and natural
looking of an algorithm that performs pattern matching and recursive
calls to handle an argument that belongs to a recursive sum data type.


