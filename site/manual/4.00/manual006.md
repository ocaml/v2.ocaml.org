<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="tutos_menu"><li><a href="manual003.html">The core language</a></li><li><a href="manual004.html">The module system</a></li><li><a href="manual005.html">Objects in OCaml</a></li><li class="active"><a href="manual006.html">Labels and variants</a></li><li><a href="manual007.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="tutorial"><a name="htoc36"><span>Tutorial 4</span></a>&nbsp;&nbsp;Labels and variants</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><ul><div class="toc_title"><a href="/docs" id="version-select">Version 4.00</a></div><li class="top"><a href="#">Top</a></li>
<li><a href="#toc35">Labels</a>
</li><li><a href="#toc36">Polymorphic variants</a>
</li></ul></nav></header>
<p> <a name="c:labl-examples"></a>
</p><p></p><p><br>
<br>
</p><p>This tutorial gives an overview of the new features in
OCaml 3: labels, and polymorphic variants.</p><h2 class="section"><a name="toc35"></a><a name="htoc37">1</a>&nbsp;&nbsp;Labels</h2><p>If you have a look at modules ending in <tt>Labels</tt> in the standard
library, you will see that function types have annotations you did not
have in the functions you defined yourself.</p><pre><font color="black">#</font><font color="#006000"> ListLabels.map;;
<font color="maroon">- : f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list = &lt;fun&gt;

</font><font color="black">#</font> StringLabels.sub;;
</font><font color="maroon">- : string -&gt; pos:int -&gt; len:int -&gt; string = &lt;fun&gt;
</font></pre><p>Such annotations of the form <tt>name:</tt> are called <em>labels</em>. They are
meant to document the code, allow more checking, and give more
flexibility to function application.
You can give such names to arguments in your programs, by prefixing them
with a tilde <tt>~</tt>.</p><pre><font color="black">#</font><font color="#006000"> let f ~x ~y = x - y;;
<font color="maroon">val f : x:int -&gt; y:int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> let x = 3 and y = 2 in f ~x ~y;;
</font><font color="maroon">- : int = 1
</font></pre><p>When you want to use distinct names for the variable and the label
appearing in the type, you can use a naming label of the form
<tt>~name:</tt>. This also applies when the argument is not a variable.</p><pre><font color="black">#</font><font color="#006000"> let f ~x:x1 ~y:y1 = x1 - y1;;
<font color="maroon">val f : x:int -&gt; y:int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> f ~x:3 ~y:2;;
</font><font color="maroon">- : int = 1
</font></pre><p>Labels obey the same rules as other identifiers in OCaml, that is you
cannot use a reserved keyword (like <tt>in</tt> or <tt>to</tt>) as label.</p><p>Formal parameters and arguments are matched according to their
respective labels<sup><a name="text1" href="#note1">1</a></sup>, the absence of label
being interpreted as the empty label.
This allows commuting arguments in applications. One can also
partially apply a function on any argument, creating a new function of
the remaining parameters.</p><pre><font color="black">#</font><font color="#006000"> let f ~x ~y = x - y;;
<font color="maroon">val f : x:int -&gt; y:int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> f ~y:2 ~x:3;;
<font color="maroon">- : int = 1

</font><font color="black">#</font> ListLabels.fold_left;;
<font color="maroon">- : f:('a -&gt; 'b -&gt; 'a) -&gt; init:'a -&gt; 'b list -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> ListLabels.fold_left [1;2;3] ~init:0 ~f:(+);;
<font color="maroon">- : int = 6

</font><font color="black">#</font> ListLabels.fold_left ~init:0;;
</font><font color="maroon">- : f:(int -&gt; 'a -&gt; int) -&gt; 'a list -&gt; int = &lt;fun&gt;
</font></pre><p>If several arguments of a function bear the same label (or no label),
they will not commute among themselves, and order matters. But they
can still commute with other arguments.</p><pre><font color="black">#</font><font color="#006000"> let hline ~x:x1 ~x:x2 ~y = (x1, x2, y);;
<font color="maroon">val hline : x:'a -&gt; x:'b -&gt; y:'c -&gt; 'a * 'b * 'c = &lt;fun&gt;

</font><font color="black">#</font> hline ~x:3 ~y:2 ~x:5;;
</font><font color="maroon">- : int * int * int = (3, 5, 2)
</font></pre><p>As an exception to the above parameter matching rules, if an
application is total (omitting all optional arguments), labels may be
omitted.
In practice, many applications are total, so that labels can often be
omitted.
</p><pre><font color="black">#</font><font color="#006000"> f 3 2;;
<font color="maroon">- : int = 1

</font><font color="black">#</font> ListLabels.map succ [1;2;3];;
</font><font color="maroon">- : int list = [2; 3; 4]
</font></pre><p>
But beware that functions like <tt>ListLabels.fold_left</tt> whose result
type is a type variable will never be considered as totally applied.
</p><pre><font color="black">#</font><font color="#006000"> ListLabels.fold_left <u>(+)</u> 0 [1;2;3];;
</font><font color="maroon">Error: This expression has type int -&gt; int -&gt; int
       but an expression was expected of type 'a list
</font></pre><p>When a function is passed as an argument to a higher-order function,
labels must match in both types. Neither adding nor removing labels
are allowed.
</p><pre><font color="black">#</font><font color="#006000"> let h g = g ~x:3 ~y:2;;
<font color="maroon">val h : (x:int -&gt; y:int -&gt; 'a) -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> h f;;
<font color="maroon">- : int = 1

</font><font color="black">#</font> h <u>(+)</u>;;
</font><font color="maroon">Error: This expression has type int -&gt; int -&gt; int
       but an expression was expected of type x:int -&gt; y:int -&gt; 'a
</font></pre><p>
Note that when you don’t need an argument, you can still use a wildcard
pattern, but you must prefix it with the label.
</p><pre><font color="black">#</font><font color="#006000"> h (fun ~x:_ ~y -&gt; y+1);;
</font><font color="maroon">- : int = 3
</font></pre><h3 class="subsection"><a name="htoc38">4.1.1</a>&nbsp;&nbsp;Optional arguments</h3><p>An interesting feature of labeled arguments is that they can be made
optional. For optional parameters, the question mark <tt>?</tt> replaces the
tilde <tt>~</tt> of non-optional ones, and the label is also prefixed by <tt>?</tt>
in the function type.
Default values may be given for such optional parameters.</p><pre><font color="black">#</font><font color="#006000"> let bump ?(step = 1) x = x + step;;
<font color="maroon">val bump : ?step:int -&gt; int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> bump 2;;
<font color="maroon">- : int = 3

</font><font color="black">#</font> bump ~step:3 2;;
</font><font color="maroon">- : int = 5
</font></pre><p>A function taking some optional arguments must also take at least one
non-optional argument. The criterion for deciding whether an optional
argument has been omitted is the non-labeled application of an
argument appearing after this optional argument in the function type.
Note that if that argument is labeled, you will only be able to
eliminate optional arguments through the special case for total
applications.</p><pre><font color="black">#</font><font color="#006000"> let test ?(x = 0) ?(y = 0) () ?(z = 0) () = (x, y, z);;
<font color="maroon">val test : ?x:int -&gt; ?y:int -&gt; unit -&gt; ?z:int -&gt; unit -&gt; int * int * int =
  &lt;fun&gt;

</font><font color="black">#</font> test ();;
<font color="maroon">- : ?z:int -&gt; unit -&gt; int * int * int = &lt;fun&gt;

</font><font color="black">#</font> test ~x:2 () ~z:3 ();;
</font><font color="maroon">- : int * int * int = (2, 0, 3)
</font></pre><p>Optional parameters may also commute with non-optional or unlabeled
ones, as long as they are applied simultaneously. By nature, optional
arguments do not commute with unlabeled arguments applied
independently.
</p><pre><font color="black">#</font><font color="#006000"> test ~y:2 ~x:3 () ();;
<font color="maroon">- : int * int * int = (3, 2, 0)

</font><font color="black">#</font> test () () ~z:1 ~y:2 ~x:3;;
<font color="maroon">- : int * int * int = (3, 2, 1)

</font><font color="black">#</font> <u>(test () ())</u> ~z:1;;
</font><font color="maroon">Error: This expression is not a function; it cannot be applied
</font></pre><p>
Here <tt>(test () ())</tt> is already <tt>(0,0,0)</tt> and cannot be further
applied.</p><p>Optional arguments are actually implemented as option types. If
you do not give a default value, you have access to their internal
representation, <tt>type 'a option = None | Some of 'a</tt>. You can then
provide different behaviors when an argument is present or not.</p><pre><font color="black">#</font><font color="#006000"> let bump ?step x =
    match step with
    | None -&gt; x * 2
    | Some y -&gt; x + y
  ;;
</font><font color="maroon">val bump : ?step:int -&gt; int -&gt; int = &lt;fun&gt;
</font></pre><p>It may also be useful to relay an optional argument from a function
call to another. This can be done by prefixing the applied argument
with <tt>?</tt>. This question mark disables the wrapping of optional
argument in an option type.</p><pre><font color="black">#</font><font color="#006000"> let test2 ?x ?y () = test ?x ?y () ();;
<font color="maroon">val test2 : ?x:int -&gt; ?y:int -&gt; unit -&gt; int * int * int = &lt;fun&gt;

</font><font color="black">#</font> test2 ?x:None;;
</font><font color="maroon">- : ?y:int -&gt; unit -&gt; int * int * int = &lt;fun&gt;
</font></pre><h3 class="subsection"><a name="htoc39">4.1.2</a>&nbsp;&nbsp;Labels and type inference</h3><p>
<a name="ss:label-inference"></a></p><p>While they provide an increased comfort for writing function
applications, labels and optional arguments have the pitfall that they
cannot be inferred as completely as the rest of the language.</p><p>You can see it in the following two examples.
</p><pre><font color="black">#</font><font color="#006000"> let h' g = g ~y:2 ~x:3;;
<font color="maroon">val h' : (y:int -&gt; x:int -&gt; 'a) -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> h' <u>f</u>;;
<font color="maroon">Error: This expression has type x:int -&gt; y:int -&gt; int
       but an expression was expected of type y:int -&gt; x:int -&gt; 'a

</font><font color="black">#</font> let bump_it bump x =
    bump ~step:2 x;;
<font color="maroon">val bump_it : (step:int -&gt; 'a -&gt; 'b) -&gt; 'a -&gt; 'b = &lt;fun&gt;

</font><font color="black">#</font> bump_it <u>bump</u> 1;;
</font><font color="maroon">Error: This expression has type ?step:int -&gt; int -&gt; int
       but an expression was expected of type step:int -&gt; 'a -&gt; 'b
</font></pre><p>
The first case is simple: <tt>g</tt> is passed <tt>~y</tt> and then <tt>~x</tt>, but <tt>f</tt>
expects <tt>~x</tt> and then <tt>~y</tt>. This is correctly handled if we know the
type of <tt>g</tt> to be <tt>x:int -&gt; y:int -&gt; int</tt> in advance, but otherwise
this causes the above type clash. The simplest workaround is to apply
formal parameters in a standard order.</p><p>The second example is more subtle: while we intended the argument
<tt>bump</tt> to be of type <tt>?step:int -&gt; int -&gt; int</tt>, it is inferred as
<tt>step:int -&gt; int -&gt; 'a</tt>.
These two types being incompatible (internally normal and optional
arguments are different), a type error occurs when applying <tt>bump_it</tt>
to the real <tt>bump</tt>.</p><p>We will not try here to explain in detail how type inference works.
One must just understand that there is not enough information in the
above program to deduce the correct type of <tt>g</tt> or <tt>bump</tt>. That is,
there is no way to know whether an argument is optional or not, or
which is the correct order, by looking only at how a function is
applied. The strategy used by the compiler is to assume that there are
no optional arguments, and that applications are done in the right
order.</p><p>The right way to solve this problem for optional parameters is to add
a type annotation to the argument <tt>bump</tt>.
</p><pre><font color="black">#</font><font color="#006000"> let bump_it (bump : ?step:int -&gt; int -&gt; int) x =
    bump ~step:2 x;;
<font color="maroon">val bump_it : (?step:int -&gt; int -&gt; int) -&gt; int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> bump_it bump 1;;
</font><font color="maroon">- : int = 3
</font></pre><p>
In practice, such problems appear mostly when using objects whose
methods have optional arguments, so that writing the type of object
arguments is often a good idea.</p><p>Normally the compiler generates a type error if you attempt to pass to
a function a parameter whose type is different from the expected one.
However, in the specific case where the expected type is a non-labeled
function type, and the argument is a function expecting optional
parameters, the compiler will attempt to transform the argument to
have it match the expected type, by passing <tt>None</tt> for all optional
parameters.</p><pre><font color="black">#</font><font color="#006000"> let twice f (x : int) = f(f x);;
<font color="maroon">val twice : (int -&gt; int) -&gt; int -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> twice bump 2;;
</font><font color="maroon">- : int = 8
</font></pre><p>This transformation is coherent with the intended semantics,
including side-effects. That is, if the application of optional
parameters shall produce side-effects, these are delayed until the
received function is really applied to an argument.</p><h3 class="subsection"><a name="htoc40">4.1.3</a>&nbsp;&nbsp;Suggestions for labeling</h3><p>Like for names, choosing labels for functions is not an easy task. A
good labeling is a labeling which</p><ul class="itemize"><li class="li-itemize">
makes programs more readable,
</li><li class="li-itemize">is easy to remember,
</li><li class="li-itemize">when possible, allows useful partial applications.
</li></ul><p>We explain here the rules we applied when labeling OCaml
libraries.</p><p>To speak in an “object-oriented” way, one can consider that each
function has a main argument, its <em>object</em>, and other arguments
related with its action, the <em>parameters</em>. To permit the
combination of functions through functionals in commuting label mode, the
object will not be labeled. Its role is clear from the function
itself. The parameters are labeled with names reminding of
their nature or their role. The best labels combine nature and
role. When this is not possible the role is to be preferred, since the
nature will
often be given by the type itself. Obscure abbreviations should be
avoided.
</p><pre><tt>ListLabels.map : f:('a -&gt; 'b) -&gt; 'a list -&gt; 'b list</tt>
UnixLabels.write : file_descr -&gt; buf:string -&gt; pos:int -&gt; len:int -&gt; unit
</pre><p>When there are several objects of same nature and role, they are all
left unlabeled.
</p><pre><tt>ListLabels.iter2 : f:('a -&gt; 'b -&gt; 'c) -&gt; 'a list -&gt; 'b list -&gt; unit</tt>
</pre><p>When there is no preferable object, all arguments are labeled.
</p><pre>StringLabels.blit :
  src:string -&gt; src_pos:int -&gt; dst:string -&gt; dst_pos:int -&gt; len:int -&gt; unit
</pre><p>However, when there is only one argument, it is often left unlabeled.
</p><pre>StringLabels.create : int -&gt; string
</pre><p>
This principle also applies to functions of several arguments whose
return type is a type variable, as long as the role of each argument
is not ambiguous. Labeling such functions may lead to awkward error
messages when one attempts to omit labels in an application, as we
have seen with <tt>ListLabels.fold_left</tt>.</p><p>Here are some of the label names you will find throughout the
libraries.</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Label</b></td><td align="center" nowrap=""><b>Meaning</b></td></tr>
<tr><td align="left" nowrap="">
<tt>f:</tt></td><td align="left" nowrap="">a function to be applied</td></tr>
<tr><td align="left" nowrap=""><tt>pos:</tt></td><td align="left" nowrap="">a position in a string or array</td></tr>
<tr><td align="left" nowrap=""><tt>len:</tt></td><td align="left" nowrap="">a length</td></tr>
<tr><td align="left" nowrap=""><tt>buf:</tt></td><td align="left" nowrap="">a string used as buffer</td></tr>
<tr><td align="left" nowrap=""><tt>src:</tt></td><td align="left" nowrap="">the source of an operation</td></tr>
<tr><td align="left" nowrap=""><tt>dst:</tt></td><td align="left" nowrap="">the destination of an operation</td></tr>
<tr><td align="left" nowrap=""><tt>init:</tt></td><td align="left" nowrap="">the initial value for an iterator</td></tr>
<tr><td align="left" nowrap=""><tt>cmp:</tt></td><td align="left" nowrap="">a comparison function, <i>e.g.</i> <tt>Pervasives.compare</tt></td></tr>
<tr><td align="left" nowrap=""><tt>mode:</tt></td><td align="left" nowrap="">an operation mode or a flag list</td></tr>
</tbody></table></div><p>All these are only suggestions, but keep in mind that the
choice of labels is essential for readability. Bizarre choices will
make the program harder to maintain.</p><p>In the ideal, the right function name with right labels sould be
enough to understand the function’s meaning. Since one can get this
information with OCamlBrowser or the <tt>ocaml</tt> toplevel, the documentation
is only used when a more detailed specification is needed.</p><h2 class="section"><a name="toc36"></a><a name="htoc41">2</a>&nbsp;&nbsp;Polymorphic variants</h2><p>Variants as presented in section&nbsp;<a href="manual003.html#s:tut-recvariants">1.4</a> are a
powerful tool to build data structures and algorithms. However they
sometimes lack flexibility when used in modular programming. This is
due to the fact every constructor reserves a name to be used with a
unique type. One cannot use the same name in another type, or consider
a value of some type to belong to some other type with more
constructors.</p><p>With polymorphic variants, this original assumption is removed. That
is, a variant tag does not belong to any type in particular, the type
system will just check that it is an admissible value according to its
use. You need not define a type before using a variant tag. A variant
type will be inferred independently for each of its uses.</p><h3 class="subsection">Basic use</h3><p>In programs, polymorphic variants work like usual ones. You just have
to prefix their names with a backquote character <tt>`</tt>.
</p><pre><font color="black">#</font><font color="#006000"> [`On; `Off];;
<font color="maroon">- : [&gt; `Off | `On ] list = [`On; `Off]

</font><font color="black">#</font> `Number 1;;
<font color="maroon">- : [&gt; `Number of int ] = `Number 1

</font><font color="black">#</font> let f = function `On -&gt; 1 | `Off -&gt; 0 | `Number n -&gt; n;;
<font color="maroon">val f : [&lt; `Number of int | `Off | `On ] -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> List.map f [`On; `Off];;
</font><font color="maroon">- : int list = [1; 0]
</font></pre><p>
<tt>[&gt;`Off|`On] list</tt> means that to match this list, you should at
least be able to match <tt>`Off</tt> and <tt>`On</tt>, without argument.
<tt>[&lt;`On|`Off|`Number of int]</tt> means that <tt>f</tt> may be applied to <tt>`Off</tt>,
<tt>`On</tt> (both without argument), or <tt>`Number</tt> <i>n</i> where
<i>n</i> is an integer.
The <tt>&gt;</tt> and <tt>&lt;</tt> inside the variant types show that they may still be
refined, either by defining more tags or by allowing less. As such, they
contain an implicit type variable. Because each of the variant types
appears only once in the whole type, their implicit type variables are
not shown.</p><p>The above variant types were polymorphic, allowing further refinement.
When writing type annotations, one will most often describe fixed
variant types, that is types that cannot be refined. This is
also the case for type abbreviations. Such types do not contain <tt>&lt;</tt> or
<tt>&gt;</tt>, but just an enumeration of the tags and their associated types,
just like in a normal datatype definition.
</p><pre><font color="black">#</font><font color="#006000"> type 'a vlist = [`Nil | `Cons of 'a * 'a vlist];;
<font color="maroon">type 'a vlist = [ `Cons of 'a * 'a vlist | `Nil ]

</font><font color="black">#</font> let rec map f : 'a vlist -&gt; 'b vlist = function
    | `Nil -&gt; `Nil
    | `Cons(a, l) -&gt; `Cons(f a, map f l)
  ;;
</font><font color="maroon">val map : ('a -&gt; 'b) -&gt; 'a vlist -&gt; 'b vlist = &lt;fun&gt;
</font></pre><h3 class="subsection">Advanced use</h3><p>Type-checking polymorphic variants is a subtle thing, and some
expressions may result in more complex type information.</p><pre><font color="black">#</font><font color="#006000"> let f = function `A -&gt; `C | `B -&gt; `D | x -&gt; x;;
<font color="maroon">val f : ([&gt; `A | `B | `C | `D ] as 'a) -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> f `E;;
</font><font color="maroon">- : [&gt; `A | `B | `C | `D | `E ] = `E
</font></pre><p>
Here we are seeing two phenomena. First, since this matching is open
(the last case catches any tag), we obtain the type <tt>[&gt; `A | `B]</tt>
rather than <tt>[&lt; `A | `B]</tt> in a closed matching. Then, since <tt>x</tt> is
returned as is, input and return types are identical. The notation <tt>as 'a</tt> denotes such type sharing. If we apply <tt>f</tt> to yet another tag
<tt>`E</tt>, it gets added to the list.</p><pre><font color="black">#</font><font color="#006000"> let f1 = function `A x -&gt; x = 1 | `B -&gt; true | `C -&gt; false
  let f2 = function `A x -&gt; x = "a" | `B -&gt; true ;;
<font color="maroon">val f1 : [&lt; `A of int | `B | `C ] -&gt; bool = &lt;fun&gt;
val f2 : [&lt; `A of string | `B ] -&gt; bool = &lt;fun&gt;

</font><font color="black">#</font> let f x = f1 x &amp;&amp; f2 x;;
</font><font color="maroon">val f : [&lt; `A of string &amp; int | `B ] -&gt; bool = &lt;fun&gt;
</font></pre><p>
Here <tt>f1</tt> and <tt>f2</tt> both accept the variant tags <tt>`A</tt> and <tt>`B</tt>, but the
argument of <tt>`A</tt> is <tt>int</tt> for <tt>f1</tt> and <tt>string</tt> for <tt>f2</tt>. In <tt>f</tt>’s
type <tt>`C</tt>, only accepted by <tt>f1</tt>, disappears, but both argument types
appear for <tt>`A</tt> as <tt>int &amp; string</tt>. This means that if we
pass the variant tag <tt>`A</tt> to <tt>f</tt>, its argument should be <em>both</em>
<tt>int</tt> and <tt>string</tt>. Since there is no such value, <tt>f</tt> cannot be
applied to <tt>`A</tt>, and <tt>`B</tt> is the only accepted input.</p><p>Even if a value has a fixed variant type, one can still give it a
larger type through coercions. Coercions are normally written with
both the source type and the destination type, but in simple cases the
source type may be omitted.
</p><pre><font color="black">#</font><font color="#006000"> type 'a wlist = [`Nil | `Cons of 'a * 'a wlist | `Snoc of 'a wlist * 'a];;
<font color="maroon">type 'a wlist = [ `Cons of 'a * 'a wlist | `Nil | `Snoc of 'a wlist * 'a ]

</font><font color="black">#</font> let wlist_of_vlist  l = (l : 'a vlist :&gt; 'a wlist);;
<font color="maroon">val wlist_of_vlist : 'a vlist -&gt; 'a wlist = &lt;fun&gt;

</font><font color="black">#</font> let open_vlist l = (l : 'a vlist :&gt; [&gt; 'a vlist]);;
<font color="maroon">val open_vlist : 'a vlist -&gt; [&gt; 'a vlist ] = &lt;fun&gt;

</font><font color="black">#</font> fun x -&gt; (x :&gt; [`A|`B|`C]);;
</font><font color="maroon">- : [&lt; `A | `B | `C ] -&gt; [ `A | `B | `C ] = &lt;fun&gt;
</font></pre><p>You may also selectively coerce values through pattern matching.
</p><pre><font color="black">#</font><font color="#006000"> let split_cases = function
    | `Nil | `Cons _ as x -&gt; `A x
    | `Snoc _ as x -&gt; `B x
  ;;
</font><font color="maroon">val split_cases :
  [&lt; `Cons of 'a | `Nil | `Snoc of 'b ] -&gt;
  [&gt; `A of [&gt; `Cons of 'a | `Nil ] | `B of [&gt; `Snoc of 'b ] ] = &lt;fun&gt;
</font></pre><p>
When an or-pattern composed of variant tags is wrapped inside an
alias-pattern, the alias is given a type containing only the tags
enumerated in the or-pattern. This allows for many useful idioms, like
incremental definition of functions.</p><pre><font color="black">#</font><font color="#006000"> let num x = `Num x
  let eval1 eval (`Num x) = x
  let rec eval x = eval1 eval x ;;
<font color="maroon">val num : 'a -&gt; [&gt; `Num of 'a ] = &lt;fun&gt;
val eval1 : 'a -&gt; [&lt; `Num of 'b ] -&gt; 'b = &lt;fun&gt;
val eval : [&lt; `Num of 'a ] -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> let plus x y = `Plus(x,y)
  let eval2 eval = function
    | `Plus(x,y) -&gt; eval x + eval y
    | `Num _ as x -&gt; eval1 eval x
  let rec eval x = eval2 eval x ;;
</font><font color="maroon">val plus : 'a -&gt; 'b -&gt; [&gt; `Plus of 'a * 'b ] = &lt;fun&gt;
val eval2 : ('a -&gt; int) -&gt; [&lt; `Num of int | `Plus of 'a * 'a ] -&gt; int = &lt;fun&gt;
val eval : ([&lt; `Num of int | `Plus of 'a * 'a ] as 'a) -&gt; int = &lt;fun&gt;
</font></pre><p>To make this even more comfortable, you may use type definitions as
abbreviations for or-patterns. That is, if you have defined <tt>type myvariant = [`Tag1 int | `Tag2 bool]</tt>, then the pattern <tt>#myvariant</tt> is
equivalent to writing <tt>(`Tag1(_ : int) | `Tag2(_ : bool))</tt>.</p><p>Such abbreviations may be used alone,
</p><pre><font color="black">#</font><font color="#006000"> let f = function
    | #myvariant -&gt; "myvariant"
    | `Tag3 -&gt; "Tag3";;
</font><font color="maroon">val f : [&lt; `Tag1 of int | `Tag2 of bool | `Tag3 ] -&gt; string = &lt;fun&gt;
</font></pre><p>
or combined with with aliases.
</p><pre><font color="black">#</font><font color="#006000"> let g1 = function `Tag1 _ -&gt; "Tag1" | `Tag2 _ -&gt; "Tag2";;
<font color="maroon">val g1 : [&lt; `Tag1 of 'a | `Tag2 of 'b ] -&gt; string = &lt;fun&gt;

</font><font color="black">#</font> let g = function
    | #myvariant as x -&gt; g1 x
    | `Tag3 -&gt; "Tag3";;
</font><font color="maroon">val g : [&lt; `Tag1 of int | `Tag2 of bool | `Tag3 ] -&gt; string = &lt;fun&gt;
</font></pre><h3 class="subsection"><a name="htoc42">4.2.1</a>&nbsp;&nbsp;Weaknesses of polymorphic variants</h3><p>After seeing the power of polymorphic variants, one may wonder why
they were added to core language variants, rather than replacing them.</p><p>The answer is twofold. One first aspect is that while being pretty
efficient, the lack of static type information allows for less
optimizations, and makes polymorphic variants slightly heavier than
core language ones. However noticeable differences would only
appear on huge data structures.</p><p>More important is the fact that polymorphic variants, while being
type-safe, result in a weaker type discipline. That is, core language
variants do actually much more than ensuring type-safety, they also
check that you use only declared constructors, that all constructors
present in a data-structure are compatible, and they enforce typing
constraints to their parameters.</p><p>For this reason, you must be more careful about making types explicit
when you use polymorphic variants. When you write a library, this is
easy since you can describe exact types in interfaces, but for simple
programs you are probably better off with core language variants.</p><p>Beware also that some idioms make trivial errors very hard to find.
For instance, the following code is probably wrong but the compiler
has no way to see it.
</p><pre><font color="black">#</font><font color="#006000"> type abc = [`A | `B | `C] ;;
<font color="maroon">type abc = [ `A | `B | `C ]

</font><font color="black">#</font> let f = function
    | `As -&gt; "A"
    | #abc -&gt; "other" ;;
<font color="maroon">val f : [&lt; `A | `As | `B | `C ] -&gt; string = &lt;fun&gt;

</font><font color="black">#</font> let f : abc -&gt; string = f ;;
</font><font color="maroon">val f : abc -&gt; string = &lt;fun&gt;
</font></pre><p>
You can avoid such risks by annotating the definition itself.
</p><pre><font color="black">#</font><font color="#006000"> let f : abc -&gt; string = function
    | <u>`As</u> -&gt; "A"
    | #abc -&gt; "other" ;;
</font><font color="maroon">Warning 11: this match case is unused.
val f : abc -&gt; string = &lt;fun&gt;
</font></pre><hr class="ffootnoterule"><dl class="thefootnotes"><dt class="dt-thefootnotes">
<a name="note1" href="#text1">1</a></dt><dd class="dd-thefootnotes">This correspond to the commuting label mode
of Objective Caml 3.00 through 3.02, with some additional flexibility
on total applications. The so-called classic mode (<tt>-nolabels</tt>
options) is now deprecated for normal use.
</dd></dl>
<hr>





<i class="authors">(Tutorial written by Jacques Garrigue)</i><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>