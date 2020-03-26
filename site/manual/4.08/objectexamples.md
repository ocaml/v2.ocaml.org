<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="coreexamples.html">The core language</a></li><li><a href="moduleexamples.html">The module system</a></li><li class="active"><a href="objectexamples.html">Objects in OCaml</a></li><li><a href="lablexamples.html">Labels and variants</a></li><li><a href="polymorphism.html">Polymorphism and its limitations</a></li><li><a href="advexamples.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter" id="sec26"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">Objects in OCaml</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="objectexamples.html#sec27">1&nbsp;&nbsp;Classes and objects</a>
</li><li><a href="objectexamples.html#sec28">2&nbsp;&nbsp;Immediate objects</a>
</li><li><a href="objectexamples.html#sec29">3&nbsp;&nbsp;Reference to self</a>
</li><li><a href="objectexamples.html#sec30">4&nbsp;&nbsp;Initializers</a>
</li><li><a href="objectexamples.html#sec31">5&nbsp;&nbsp;Virtual methods</a>
</li><li><a href="objectexamples.html#sec32">6&nbsp;&nbsp;Private methods</a>
</li><li><a href="objectexamples.html#sec33">7&nbsp;&nbsp;Class interfaces</a>
</li><li><a href="objectexamples.html#sec34">8&nbsp;&nbsp;Inheritance</a>
</li><li><a href="objectexamples.html#sec35">9&nbsp;&nbsp;Multiple inheritance</a>
</li><li><a href="objectexamples.html#sec36">10&nbsp;&nbsp;Parameterized classes</a>
</li><li><a href="objectexamples.html#sec37">11&nbsp;&nbsp;Polymorphic methods</a>
</li><li><a href="objectexamples.html#sec38">12&nbsp;&nbsp;Using coercions</a>
</li><li><a href="objectexamples.html#sec39">13&nbsp;&nbsp;Functional objects</a>
</li><li><a href="objectexamples.html#sec40">14&nbsp;&nbsp;Cloning objects</a>
</li><li><a href="objectexamples.html#sec41">15&nbsp;&nbsp;Recursive classes</a>
</li><li><a href="objectexamples.html#sec42">16&nbsp;&nbsp;Binary methods</a>
</li><li><a href="objectexamples.html#sec43">17&nbsp;&nbsp;Friends</a>
</li></ul></nav></header>
<p>
<a id="c:objectexamples"></a>
</p><p>
</p><p><br>
<br>
</p><p>This chapter gives an overview of the object-oriented features of
OCaml.</p><p>Note that the relationship between object, class and type in OCaml is
different than in mainstream object-oriented languages such as Java and
C++, so you shouldn’t assume that similar keywords mean the same thing.
Object-oriented features are used much less frequently in OCaml than
in those languages. OCaml has alternatives that are often more appropriate,
such as modules and functors. Indeed, many OCaml programs do not use objects
at all.</p><p><a href="#ss%3Aclasses-and-objects">3.1</a> Classes and objects <br>
<a href="#ss%3Aimmediate-objects">3.2</a> Immediate objects <br>
<a href="#ss%3Areference-to-self">3.3</a> Reference to self <br>
<a href="#ss%3Ainitializers">3.4</a> Initializers <br>
<a href="#ss%3Avirtual-methods">3.5</a> Virtual methods <br>
<a href="#ss%3Aprivate-methods">3.6</a> Private methods <br>
<a href="#ss%3Aclass-interfaces">3.7</a> Class interfaces <br>
<a href="#ss%3Ainheritance">3.8</a> Inheritance <br>
<a href="#ss%3Amultiple-inheritance">3.9</a> Multiple inheritance <br>
<a href="#ss%3Aparameterized-classes">3.10</a> Parameterized classes <br>
<a href="#ss%3Apolymorphic-methods">3.11</a> Polymorphic methods <br>
<a href="#ss%3Ausing-coercions">3.12</a> Using coercions <br>
<a href="#ss%3Afunctional-objects">3.13</a> Functional objects <br>
<a href="#ss%3Acloning-objects">3.14</a> Cloning objects <br>
<a href="#ss%3Arecursive-classes">3.15</a> Recursive classes <br>
<a href="#ss%3Abinary-methods">3.16</a> Binary methods <br>
<a href="#ss%3Afriends">3.17</a> Friends <br>

</p>
<h2 class="section" id="sec27">1&nbsp;&nbsp;Classes and objects</h2>
<p>
<a id="ss:classes-and-objects"></a></p><p>The class <span class="c003">point</span> below defines one instance variable <span class="c003">x</span> and two methods
<span class="c003">get_x</span> and <span class="c003">move</span>. The initial value of the instance variable is <span class="c003">0</span>.
The variable <span class="c003">x</span> is declared mutable, so the method <span class="c003">move</span> can change
its value.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</code></pre>


</div><p>We now create a new point <span class="c003">p</span>, instance of the <span class="c003">point</span> class.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text">;;
</span></code><code class="caml-output ok">val p : point = &lt;obj&gt;
</code></pre>


</div><p>

Note that the type of <span class="c003">p</span> is <span class="c003">point</span>. This is an abbreviation
automatically defined by the class definition above. It stands for the
object type <span class="c003">&lt;get_x : int; move : int -&gt; unit&gt;</span>, listing the methods
of class <span class="c003">point</span> along with their types.</p><p>We now invoke some methods of <span class="c003">p</span>:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 0
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">3</span><span class="text">;;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 3
</code></pre>


</div><p>The evaluation of the body of a class only takes place at object
creation time. Therefore, in the following example, the instance
variable <span class="c003">x</span> is initialized to different values for two different
objects.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">x0</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val x0 : int ref = {contents = 0}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">incr</span><span class="text"> </span><span class="id">x0</span><span class="text">; !</span><span class="id">x0</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 1
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 2
</code></pre>


</div><p>The class <span class="c003">point</span> can also be abstracted over the initial values of
the <span class="c003">x</span> coordinate.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> </span><span class="id">x_init</span><span class="text"> -&gt;
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  int -&gt;
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</code></pre>


</div><p>

Like in function definitions, the definition above can be
abbreviated as:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  int -&gt;
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</code></pre>


</div><p>

An instance of the class <span class="c003">point</span> is now a function that expects an
initial parameter to create a point object:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text">;;
</span></code><code class="caml-output ok">- : int -&gt; point = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="numeric">7</span><span class="text">;;
</span></code><code class="caml-output ok">val p : point = &lt;obj&gt;
</code></pre>


</div><p>

The parameter <span class="c003">x_init</span> is, of course, visible in the whole body of the
definition, including methods. For instance, the method <span class="c003">get_offset</span>
in the class below returns the position of the object relative to its
initial position.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_offset</span><span class="text"> = </span><span class="id">x</span><span class="text"> - </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>

Expressions can be evaluated and bound before defining the object body
of the class. This is useful to enforce invariants. For instance,
points can be automatically adjusted to the nearest point on a grid,
as follows:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">adjusted_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">origin</span><span class="text"> = (</span><span class="id">x_init</span><span class="text"> / </span><span class="numeric">10</span><span class="text">) * </span><span class="numeric">10</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">origin</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_offset</span><span class="text"> = </span><span class="id">x</span><span class="text"> - </span><span class="id">origin</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class adjusted_point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>

(One could also raise an exception if the <span class="c003">x_init</span> coordinate is not
on the grid.) In fact, the same effect could here be obtained by
calling the definition of class <span class="c003">point</span> with the value of the
<span class="c003">origin</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">adjusted_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =  </span><span class="id">point</span><span class="text"> ((</span><span class="id">x_init</span><span class="text"> / </span><span class="numeric">10</span><span class="text">) * </span><span class="numeric">10</span><span class="text">);;
</span></code><code class="caml-output ok">class adjusted_point : int -&gt; point
</code></pre>


</div><p>

An alternate solution would have been to define the adjustment in
a special allocation function:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">new_adjusted_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text"> ((</span><span class="id">x_init</span><span class="text"> / </span><span class="numeric">10</span><span class="text">) * </span><span class="numeric">10</span><span class="text">);;
</span></code><code class="caml-output ok">val new_adjusted_point : int -&gt; point = &lt;fun&gt;
</code></pre>


</div><p>

However, the former pattern is generally more appropriate, since
the code for adjustment is part of the definition of the class and will be
inherited.</p><p>This ability provides class constructors as can be found in other
languages. Several constructors can be defined this way to build objects of
the same class but with different initialization patterns; an
alternative is to use initializers, as described below in section
<a href="#ss%3Ainitializers">3.4</a>.</p>
<h2 class="section" id="sec28">2&nbsp;&nbsp;Immediate objects</h2>
<p>
<a id="ss:immediate-objects"></a></p><p>There is another, more direct way to create an object: create it
without going through a class.</p><p>The syntax is exactly the same as for class expressions, but the
result is a single object rather than a class. All the constructs
described in the rest of this section also apply to immediate objects.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">val p : &lt; get_x : int; move : int -&gt; unit &gt; = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 0
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">3</span><span class="text">;;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 3
</code></pre>


</div><p>Unlike classes, which cannot be defined inside an expression,
immediate objects can appear anywhere, using variables from their
environment.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">minmax</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> =
    </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> &lt; </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">min</span><span class="text"> = </span><span class="id">x</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">max</span><span class="text"> = </span><span class="id">y</span><span class="text"> </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">else</span><span class="text"> </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">min</span><span class="text"> = </span><span class="id">y</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">max</span><span class="text"> = </span><span class="id">x</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">val minmax : 'a -&gt; 'a -&gt; &lt; max : 'a; min : 'a &gt; = &lt;fun&gt;
</code></pre>


</div><p>Immediate objects have two weaknesses compared to classes: their types
are not abbreviated, and you cannot inherit from them. But these two
weaknesses can be advantages in some situations, as we will see
in sections <a href="#ss%3Areference-to-self">3.3</a> and <a href="#ss%3Aparameterized-classes">3.10</a>.</p>
<h2 class="section" id="sec29">3&nbsp;&nbsp;Reference to self</h2>
<p>
<a id="ss:reference-to-self"></a></p><p>A method or an initializer can invoke methods on self (that is,
the current object). For that, self must be explicitly bound, here to
the variable <span class="c003">s</span> (<span class="c003">s</span> could be any identifier, even though we will
often choose the name <span class="c003">self</span>.)


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">s</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_int</span><span class="text"> </span><span class="id">s</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class printable_point :
  int -&gt;
  object
    val mutable x : int
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="numeric">7</span><span class="text">;;
</span></code><code class="caml-output ok">val p : printable_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">print</span><span class="text">;;
</span></code><code class="caml-output ok">7- : unit = ()
</code></pre>


</div><p>

Dynamically, the variable <span class="c003">s</span> is bound at the invocation of a method. In
particular, when the class <span class="c003">printable_point</span> is inherited, the variable
<span class="c003">s</span> will be correctly bound to the object of the subclass.</p><p>A common problem with self is that, as its type may be extended in
subclasses, you cannot fix it in advance. Here is a simple example.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">ints</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> [];;
</span></code><code class="caml-output ok">val ints : '_weak1 list ref = {contents = []}
</code></pre>

<pre><code class="caml-input"> class my_int =
    object (self)
      method n = 1
      method register = ints := <u>self</u> :: !ints
    end ;;
</code><code class="caml-output error">Error: This expression has type &lt; n : int; register : 'a; .. &gt;
       but an expression was expected of type 'weak1
       Self type cannot escape its class
</code></pre>


</div><p>

You can ignore the first two lines of the error message. What matters
is the last one: putting self into an external reference would make it
impossible to extend it through inheritance.
We will see in section <a href="#ss%3Ausing-coercions">3.12</a> a workaround to this
problem.
Note however that, since immediate objects are not extensible, the
problem does not occur with them.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">my_int</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="numeric">1</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">register</span><span class="text"> = </span><span class="id">ints</span><span class="text"> := </span><span class="id">self</span><span class="text"> :: !</span><span class="id">ints</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">val my_int : &lt; n : int; register : unit &gt; = &lt;obj&gt;
</code></pre>


</div>
<h2 class="section" id="sec30">4&nbsp;&nbsp;Initializers</h2>
<p>
<a id="ss:initializers"></a></p><p>Let-bindings within class definitions are evaluated before the object
is constructed. It is also possible to evaluate an expression
immediately after the object has been built. Such code is written as
an anonymous hidden method called an initializer. Therefore, it can
access self and the instance variables.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">origin</span><span class="text"> = (</span><span class="id">x_init</span><span class="text"> / </span><span class="numeric">10</span><span class="text">) * </span><span class="numeric">10</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">origin</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_int</span><span class="text"> </span><span class="id">self</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">
      </span><span class="kw">initializer</span><span class="text"> </span><span class="id">print_string</span><span class="text"> </span><span class="string">"new point at "</span><span class="text">; </span><span class="id">self</span><span class="kw1">#</span><span class="id">print</span><span class="text">; </span><span class="id">print_newline</span><span class="text"> ()
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class printable_point :
  int -&gt;
  object
    val mutable x : int
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="numeric">17</span><span class="text">;;
</span></code><code class="caml-output ok">new point at 10
val p : printable_point = &lt;obj&gt;
</code></pre>


</div><p>

Initializers cannot be overridden. On the contrary, all initializers are
evaluated sequentially.
Initializers are particularly useful to enforce invariants.
Another example can be seen in section <a href="advexamples.html#ss%3Abank-accounts">6.1</a>.</p>
<h2 class="section" id="sec31">5&nbsp;&nbsp;Virtual methods</h2>
<p>
<a id="ss:virtual-methods"></a></p><p>It is possible to declare a method without actually defining it, using
the keyword <span class="c003">virtual</span>. This method will be provided later in
subclasses. A class containing virtual methods must be flagged
<span class="c003">virtual</span>, and cannot be instantiated (that is, no object of this class
can be created). It still defines type abbreviations (treating virtual methods
as other methods.)


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">abstract_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">get_x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_offset</span><span class="text"> = </span><span class="id">self</span><span class="kw1">#</span><span class="id">get_x</span><span class="text"> - </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">move</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class virtual abstract_point :
  int -&gt;
  object
    method get_offset : int
    method virtual get_x : int
    method virtual move : int -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">abstract_point</span><span class="text"> </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>Instance variables can also be declared as virtual, with the same effect
as with methods.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">abstract_point2</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class virtual abstract_point2 :
  object val mutable virtual x : int method move : int -&gt; unit end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point2</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">abstract_point2</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_offset</span><span class="text"> = </span><span class="id">x</span><span class="text"> - </span><span class="id">x_init</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point2 :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method move : int -&gt; unit
  end
</code></pre>


</div>
<h2 class="section" id="sec32">6&nbsp;&nbsp;Private methods</h2>
<p>
<a id="ss:private-methods"></a></p><p>Private methods are methods that do not appear in object interfaces.
They can only be invoked from other methods of the same object.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">restricted_point</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">private</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">bump</span><span class="text"> = </span><span class="id">self</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">1</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class restricted_point :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method private move : int -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">restricted_point</span><span class="text"> </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val p : restricted_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"> <u>p</u>#move 10 ;;
</code><code class="caml-output error">Error: This expression has type restricted_point
       It has no method move
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">bump</span><span class="text">;;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>


</div><p>

Note that this is not the same thing as private and protected methods
in Java or C++, which can be called from other objects of the same
class. This is a direct consequence of the independence between types
and classes in OCaml: two unrelated classes may produce
objects of the same type, and there is no way at the type level to
ensure that an object comes from a specific class. However a possible
encoding of friend methods is given in section <a href="#ss%3Afriends">3.17</a>.</p><p>Private methods are inherited (they are by default visible in subclasses),
unless they are hidden by signature matching, as described below.</p><p>Private methods can be made public in a subclass.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point_again</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">restricted_point</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">move</span><span class="text"> : </span><span class="numeric">_</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>

The annotation <span class="c003">virtual</span> here is only used to mention a method without
providing its definition. Since we didn’t add the <span class="c003">private</span>
annotation, this makes the method public, keeping the original
definition.</p><p>An alternative definition is


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point_again</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : &lt; </span><span class="id">move</span><span class="text"> : </span><span class="numeric">_</span><span class="text">; ..&gt; )
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">restricted_point</span><span class="text"> </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>

The constraint on self’s type is requiring a public <span class="c003">move</span> method, and
this is sufficient to override <span class="c003">private</span>.</p><p>One could think that a private method should remain private in a subclass.
However, since the method is visible in a subclass, it is always possible
to pick its code and define a method of the same name that runs that
code, so yet another (heavier) solution would be:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">point_again</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">restricted_point</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">super</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> = </span><span class="id">super</span><span class="kw1">#</span><span class="id">move</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>


</div><p>Of course, private methods can also be virtual. Then, the keywords must
appear in this order <span class="c003">method private virtual</span>.</p>
<h2 class="section" id="sec33">7&nbsp;&nbsp;Class interfaces</h2>
<p>
<a id="ss:class-interfaces"></a></p><p>Class interfaces are inferred from class definitions. They may also
be defined directly and used to restrict the type of a class. Like class
declarations, they also define a new type abbreviation.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">restricted_point_type</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">bump</span><span class="text"> : </span><span class="kw3">unit</span><span class="text">
  </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type restricted_point_type =
  object method bump : unit method get_x : int end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">fun</span><span class="text"> (</span><span class="id">x</span><span class="text"> : </span><span class="id">restricted_point_type</span><span class="text">) -&gt; </span><span class="id">x</span><span class="text">;;
</span></code><code class="caml-output ok">- : restricted_point_type -&gt; restricted_point_type = &lt;fun&gt;
</code></pre>


</div><p>

In addition to program documentation, class interfaces can be used to
constrain the type of a class. Both concrete instance variables and concrete
private methods can be hidden by a class type constraint. Public
methods and virtual members, however, cannot.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">restricted_point</span><span class="text">' </span><span class="id">x</span><span class="text"> = (</span><span class="id">restricted_point</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="id">restricted_point_type</span><span class="text">);;
</span></code><code class="caml-output ok">class restricted_point' : int -&gt; restricted_point_type
</code></pre>


</div><p>

Or, equivalently:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">restricted_point</span><span class="text">' = (</span><span class="id">restricted_point</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="id">restricted_point_type</span><span class="text">);;
</span></code><code class="caml-output ok">class restricted_point' : int -&gt; restricted_point_type
</code></pre>


</div><p>

The interface of a class can also be specified in a module
signature, and used to restrict the inferred signature of a module.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">POINT</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
    </span><span class="kw">class</span><span class="text"> </span><span class="id">restricted_point</span><span class="text">' : </span><span class="kw3">int</span><span class="text"> -&gt;
      </span><span class="kw1">object</span><span class="text">
        </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">
        </span><span class="kw">method</span><span class="text"> </span><span class="id">bump</span><span class="text"> : </span><span class="kw3">unit</span><span class="text">
      </span><span class="kw1">end</span><span class="text">
  </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type POINT =
  sig
    class restricted_point' :
      int -&gt; object method bump : unit method get_x : int end
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Point</span><span class="text"> : </span><span class="kw2">POINT</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
    </span><span class="kw">class</span><span class="text"> </span><span class="id">restricted_point</span><span class="text">' = </span><span class="id">restricted_point</span><span class="text">
  </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module Point : POINT
</code></pre>


</div>
<h2 class="section" id="sec34">8&nbsp;&nbsp;Inheritance</h2>
<p>
<a id="ss:inheritance"></a></p><p>We illustrate inheritance by defining a class of colored points that
inherits from the class of points. This class has all instance
variables and all methods of class <span class="c003">point</span>, plus a new instance
variable <span class="c003">c</span> and a new method <span class="c003">color</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">colored_point</span><span class="text"> </span><span class="id">x</span><span class="text"> (</span><span class="id">c</span><span class="text"> : </span><span class="kw3">string</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">color</span><span class="text"> = </span><span class="id">c</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class colored_point :
  int -&gt;
  string -&gt;
  object
    val c : string
    val mutable x : int
    method color : string
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text">' = </span><span class="kw1">new</span><span class="text"> </span><span class="id">colored_point</span><span class="text"> </span><span class="numeric">5</span><span class="text"> </span><span class="string">"red"</span><span class="text">;;
</span></code><code class="caml-output ok">val p' : colored_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="text">'</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">, </span><span class="id">p</span><span class="text">'</span><span class="kw1">#</span><span class="id">color</span><span class="text">;;
</span></code><code class="caml-output ok">- : int * string = (5, "red")
</code></pre>


</div><p>

A point and a colored point have incompatible types, since a point has
no method <span class="c003">color</span>. However, the function <span class="c003">get_x</span> below is a generic
function applying method <span class="c003">get_x</span> to any object <span class="c003">p</span> that has this
method (and possibly some others, which are represented by an ellipsis
in the type). Thus, it applies to both points and colored points.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">get_succ_x</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text"> + </span><span class="numeric">1</span><span class="text">;;
</span></code><code class="caml-output ok">val get_succ_x : &lt; get_x : int; .. &gt; -&gt; int = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">get_succ_x</span><span class="text"> </span><span class="id">p</span><span class="text"> + </span><span class="id">get_succ_x</span><span class="text"> </span><span class="id">p</span><span class="text">';;
</span></code><code class="caml-output ok">- : int = 8
</code></pre>


</div><p>

Methods need not be declared previously, as shown by the example:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">set_x</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="id">p</span><span class="kw1">#</span><span class="id">set_x</span><span class="text">;;
</span></code><code class="caml-output ok">val set_x : &lt; set_x : 'a; .. &gt; -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">incr</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="id">set_x</span><span class="text"> </span><span class="id">p</span><span class="text"> (</span><span class="id">get_succ_x</span><span class="text"> </span><span class="id">p</span><span class="text">);;
</span></code><code class="caml-output ok">val incr : &lt; get_x : int; set_x : int -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;
</code></pre>


</div>
<h2 class="section" id="sec35">9&nbsp;&nbsp;Multiple inheritance</h2>
<p>
<a id="ss:multiple-inheritance"></a></p><p>Multiple inheritance is allowed. Only the last definition of a method
is kept: the redefinition in a subclass of a method that was visible in
the parent class overrides the definition in the parent class.
Previous definitions of a method can be reused by binding the related
ancestor. Below, <span class="c003">super</span> is bound to the ancestor <span class="c003">printable_point</span>.
The name <span class="c003">super</span> is a pseudo value identifier that can only be used to
invoke a super-class method, as in <span class="c003">super#print</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">printable_colored_point</span><span class="text"> </span><span class="id">y</span><span class="text"> </span><span class="id">c</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">color</span><span class="text"> = </span><span class="id">c</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="id">y</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">super</span><span class="text">
      </span><span class="kw">method</span><span class="text">! </span><span class="id">print</span><span class="text"> =
        </span><span class="id">print_string</span><span class="text"> </span><span class="string">"("</span><span class="text">;
        </span><span class="id">super</span><span class="kw1">#</span><span class="id">print</span><span class="text">;
        </span><span class="id">print_string</span><span class="text"> </span><span class="string">", "</span><span class="text">;
        </span><span class="id">print_string</span><span class="text"> (</span><span class="id">self</span><span class="kw1">#</span><span class="id">color</span><span class="text">);
        </span><span class="id">print_string</span><span class="text"> </span><span class="string">")"</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class printable_colored_point :
  int -&gt;
  string -&gt;
  object
    val c : string
    val mutable x : int
    method color : string
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text">' = </span><span class="kw1">new</span><span class="text"> </span><span class="id">printable_colored_point</span><span class="text"> </span><span class="numeric">17</span><span class="text"> </span><span class="string">"red"</span><span class="text">;;
</span></code><code class="caml-output ok">new point at (10, red)
val p' : printable_colored_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="text">'</span><span class="kw1">#</span><span class="id">print</span><span class="text">;;
</span></code><code class="caml-output ok">(10, red)- : unit = ()
</code></pre>


</div><p>

A private method that has been hidden in the parent class is no longer
visible, and is thus not overridden. Since initializers are treated as
private methods, all initializers along the class hierarchy are evaluated,
in the order they are introduced.</p><p>Note that for clarity’s sake, the method <span class="c003">print</span> is explicitly marked as
overriding another definition by annotating the <span class="c003">method</span> keyword with
an exclamation mark <span class="c003">!</span>. If the method <span class="c003">print</span> were not overriding the
<span class="c003">print</span> method of <span class="c003">printable_point</span>, the compiler would raise an error:


</p><div class="caml-example toplevel">

<pre><code class="caml-input">   object
      <u>method! m = ()</u>
    end;;
</code><code class="caml-output error">Error: The method `m' has no previous definition
</code></pre>


</div><p>This explicit overriding annotation also works
for <span class="c003">val</span> and <span class="c003">inherit</span>:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">another_printable_colored_point</span><span class="text"> </span><span class="id">y</span><span class="text"> </span><span class="id">c</span><span class="text"> </span><span class="id">c</span><span class="text">' =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
    </span><span class="kw">inherit</span><span class="text"> </span><span class="id">printable_point</span><span class="text"> </span><span class="id">y</span><span class="text">
    </span><span class="kw">inherit</span><span class="text">! </span><span class="id">printable_colored_point</span><span class="text"> </span><span class="id">y</span><span class="text"> </span><span class="id">c</span><span class="text">
    </span><span class="kw">val</span><span class="text">! </span><span class="id">c</span><span class="text"> = </span><span class="id">c</span><span class="text">'
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class another_printable_colored_point :
  int -&gt;
  string -&gt;
  string -&gt;
  object
    val c : string
    val mutable x : int
    method color : string
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end
</code></pre>


</div>
<h2 class="section" id="sec36">10&nbsp;&nbsp;Parameterized classes</h2>
<p>
<a id="ss:parameterized-classes"></a></p><p>Reference cells can be implemented as objects.
The naive definition fails to typecheck:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"> <u>class oref x_init =
    object
      val mutable x = x_init
      method get = x
      method set y = x &lt;- y
    end</u>;;
</code><code class="caml-output error">Error: Some type variables are unbound in this type:
         class oref :
           'a -&gt;
           object
             val mutable x : 'a
             method get : 'a
             method set : 'a -&gt; unit
           end
       The method get has type 'a where 'a is unbound
</code></pre>


</div><p>

The reason is that at least one of the methods has a polymorphic type
(here, the type of the value stored in the reference cell), thus
either the class should be parametric, or the method type should be
constrained to a monomorphic type. A monomorphic instance of the class could
be defined by:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">oref</span><span class="text"> (</span><span class="id">x_init</span><span class="text">:</span><span class="kw3">int</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">y</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class oref :
  int -&gt;
  object val mutable x : int method get : int method set : int -&gt; unit end
</code></pre>


</div><p>

Note that since immediate objects do not define a class type, they have
no such restriction.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">new_oref</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">y</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">val new_oref : 'a -&gt; &lt; get : 'a; set : 'a -&gt; unit &gt; = &lt;fun&gt;
</code></pre>


</div><p>

On the other hand, a class for polymorphic references must explicitly
list the type parameters in its declaration. Class type parameters are
listed between <span class="c003">[</span> and <span class="c003">]</span>. The type parameters must also be
bound somewhere in the class body by a type constraint.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">oref</span><span class="text"> </span><span class="id">x_init</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = (</span><span class="id">x_init</span><span class="text"> : '</span><span class="id">a</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">y</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] oref :
  'a -&gt; object val mutable x : 'a method get : 'a method set : 'a -&gt; unit end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">r</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">oref</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="kw">in</span><span class="text"> </span><span class="id">r</span><span class="kw1">#</span><span class="id">set</span><span class="text"> </span><span class="numeric">2</span><span class="text">; (</span><span class="id">r</span><span class="kw1">#</span><span class="id">get</span><span class="text">);;
</span></code><code class="caml-output ok">- : int = 2
</code></pre>


</div><p>

The type parameter in the declaration may actually be constrained in the
body of the class definition. In the class type, the actual value of
the type parameter is displayed in the <span class="c003">constraint</span> clause.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">oref_succ</span><span class="text"> (</span><span class="id">x_init</span><span class="text">:'</span><span class="id">a</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x_init</span><span class="text"> + </span><span class="numeric">1</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="id">x</span><span class="text"> &lt;- </span><span class="id">y</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] oref_succ :
  'a -&gt;
  object
    constraint 'a = int
    val mutable x : int
    method get : int
    method set : int -&gt; unit
  end
</code></pre>


</div><p>

Let us consider a more complex example: define a circle, whose center
may be any kind of point. We put an additional type
constraint in method <span class="c003">move</span>, since no free variables must remain
unaccounted for by the class type parameters.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">circle</span><span class="text"> (</span><span class="id">c</span><span class="text"> : '</span><span class="id">a</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">center</span><span class="text"> = </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">center</span><span class="text"> = </span><span class="id">center</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set_center</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="id">center</span><span class="text"> &lt;- </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> = (</span><span class="id">center</span><span class="kw1">#</span><span class="id">move</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] circle :
  'a -&gt;
  object
    constraint 'a = &lt; move : int -&gt; unit; .. &gt;
    val mutable center : 'a
    method center : 'a
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</code></pre>


</div><p>

An alternate definition of <span class="c003">circle</span>, using a <span class="c003">constraint</span> clause in
the class definition, is shown below. The type <span class="c003">#point</span> used below in
the <span class="c003">constraint</span> clause is an abbreviation produced by the definition
of class <span class="c003">point</span>. This abbreviation unifies with the type of any
object belonging to a subclass of class <span class="c003">point</span>. It actually expands to
<span class="c003">&lt; get_x : int; move : int -&gt; unit; .. &gt;</span>. This leads to the following
alternate definition of <span class="c003">circle</span>, which has slightly stronger
constraints on its argument, as we now expect <span class="c003">center</span> to have a
method <span class="c003">get_x</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">circle</span><span class="text"> (</span><span class="id">c</span><span class="text"> : '</span><span class="id">a</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">constraint</span><span class="text"> '</span><span class="id">a</span><span class="text"> = </span><span class="kw1">#</span><span class="id">point</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">center</span><span class="text"> = </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">center</span><span class="text"> = </span><span class="id">center</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">set_center</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="id">center</span><span class="text"> &lt;- </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> = </span><span class="id">center</span><span class="kw1">#</span><span class="id">move</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] circle :
  'a -&gt;
  object
    constraint 'a = #point
    val mutable center : 'a
    method center : 'a
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</code></pre>


</div><p>

The class <span class="c003">colored_circle</span> is a specialized version of class
<span class="c003">circle</span> that requires the type of the center to unify with
<span class="c003">#colored_point</span>, and adds a method <span class="c003">color</span>. Note that when specializing a
parameterized class, the instance of type parameter must always be
explicitly given. It is again written between <span class="c003">[</span> and <span class="c003">]</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">colored_circle</span><span class="text"> </span><span class="id">c</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">constraint</span><span class="text"> '</span><span class="id">a</span><span class="text"> = </span><span class="kw1">#</span><span class="id">colored_point</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">circle</span><span class="text"> </span><span class="id">c</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">color</span><span class="text"> = </span><span class="id">center</span><span class="kw1">#</span><span class="id">color</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] colored_circle :
  'a -&gt;
  object
    constraint 'a = #colored_point
    val mutable center : 'a
    method center : 'a
    method color : string
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</code></pre>


</div>
<h2 class="section" id="sec37">11&nbsp;&nbsp;Polymorphic methods</h2>
<p>
<a id="ss:polymorphic-methods"></a></p><p>While parameterized classes may be polymorphic in their contents, they
are not enough to allow polymorphism of method use.</p><p>A classical example is defining an iterator.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text">;;
</span></code><code class="caml-output ok">- : ('a -&gt; 'b -&gt; 'a) -&gt; 'a -&gt; 'b list -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">intlist</span><span class="text"> (</span><span class="id">l</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw3">list</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">empty</span><span class="text"> = (</span><span class="id">l</span><span class="text"> = [])
      </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="id">accu</span><span class="text"> : '</span><span class="id">a</span><span class="text">) = </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] intlist :
  int list -&gt;
  object method empty : bool method fold : ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a end
</code></pre>


</div><p>

At first look, we seem to have a polymorphic iterator, however this
does not work in practice.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">l</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">intlist</span><span class="text"> [</span><span class="numeric">1</span><span class="text">; </span><span class="numeric">2</span><span class="text">; </span><span class="numeric">3</span><span class="text">];;
</span></code><code class="caml-output ok">val l : '_weak2 intlist = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">l</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">+</span><span class="id">y</span><span class="text">) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 6
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">l</span><span class="text">;;
</span></code><code class="caml-output ok">- : int intlist = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"> l#fold (fun s x -&gt; <u>s</u> ^ Int.to_string x ^ " ") "" ;;
</code><code class="caml-output error">Error: This expression has type int but an expression was expected of type
         string
</code></pre>


</div><p>

Our iterator works, as shows its first use for summation. However,
since objects themselves are not polymorphic (only their constructors
are), using the <span class="c003">fold</span> method fixes its type for this individual object.
Our next attempt to use it as a string iterator fails.</p><p>The problem here is that quantification was wrongly located: it is
not the class we want to be polymorphic, but the <span class="c003">fold</span> method.
This can be achieved by giving an explicitly polymorphic type in the
method definition.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">intlist</span><span class="text"> (</span><span class="id">l</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw3">list</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">empty</span><span class="text"> = (</span><span class="id">l</span><span class="text"> = [])
      </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> : '</span><span class="id">a</span><span class="text">. ('</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">) -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> =
        </span><span class="kw">fun</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> -&gt; </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class intlist :
  int list -&gt;
  object method empty : bool method fold : ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">l</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">intlist</span><span class="text"> [</span><span class="numeric">1</span><span class="text">; </span><span class="numeric">2</span><span class="text">; </span><span class="numeric">3</span><span class="text">];;
</span></code><code class="caml-output ok">val l : intlist = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">l</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">+</span><span class="id">y</span><span class="text">) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 6
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">l</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">s</span><span class="text"> ^ </span><span class="kw2">Int</span><span class="text">.</span><span class="id">to_string</span><span class="text"> </span><span class="id">x</span><span class="text"> ^ </span><span class="string">" "</span><span class="text">) </span><span class="string">""</span><span class="text">;;
</span></code><code class="caml-output ok">- : string = "1 2 3 "
</code></pre>


</div><p>

As you can see in the class type shown by the compiler, while
polymorphic method types must be fully explicit in class definitions
(appearing immediately after the method name), quantified type
variables can be left implicit in class descriptions. Why require types
to be explicit? The problem is that <span class="c003">(int -&gt; int -&gt; int) -&gt; int -&gt; int</span> would also be a valid type for <span class="c003">fold</span>, and it happens to be
incompatible with the polymorphic type we gave (automatic
instantiation only works for toplevel types variables, not for inner
quantifiers, where it becomes an undecidable problem.) So the compiler
cannot choose between those two types, and must be helped.</p><p>However, the type can be completely omitted in the class definition if
it is already known, through inheritance or type constraints on self.
Here is an example of method overriding.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">intlist_rev</span><span class="text"> </span><span class="id">l</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">intlist</span><span class="text"> </span><span class="id">l</span><span class="text">
      </span><span class="kw">method</span><span class="text">! </span><span class="id">fold</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> (</span><span class="kw2">List</span><span class="text">.</span><span class="id">rev</span><span class="text"> </span><span class="id">l</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div><p>

The following idiom separates description and definition.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">iterator</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> : ('</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">) -&gt; '</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">intlist</span><span class="text">' </span><span class="id">l</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">#</span><span class="id">iterator</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">empty</span><span class="text"> = (</span><span class="id">l</span><span class="text"> = [])
      </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">accu</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div><p>

Note here the <span class="c003">(self : int #iterator)</span> idiom, which ensures that this
object implements the interface <span class="c003">iterator</span>.</p><p>Polymorphic methods are called in exactly the same way as normal
methods, but you should be aware of some limitations of type
inference. Namely, a polymorphic method can only be called if its
type is known at the call site. Otherwise, the method will be assumed
to be monomorphic, and given an incompatible type.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sum</span><span class="text"> </span><span class="id">lst</span><span class="text"> = </span><span class="id">lst</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">+</span><span class="id">y</span><span class="text">) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val sum : &lt; fold : (int -&gt; int -&gt; int) -&gt; int -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"> sum <u>l</u> ;;
</code><code class="caml-output error">Error: This expression has type intlist
       but an expression was expected of type
         &lt; fold : (int -&gt; int -&gt; int) -&gt; int -&gt; 'a; .. &gt;
       Types for method fold are incompatible
</code></pre>


</div><p>

The workaround is easy: you should put a type constraint on the
parameter.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sum</span><span class="text"> (</span><span class="id">lst</span><span class="text"> : </span><span class="numeric">_</span><span class="text"> </span><span class="kw1">#</span><span class="id">iterator</span><span class="text">) = </span><span class="id">lst</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">+</span><span class="id">y</span><span class="text">) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val sum : int #iterator -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

Of course the constraint may also be an explicit method type.
Only occurrences of quantified variables are required.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sum</span><span class="text"> </span><span class="id">lst</span><span class="text"> =
    (</span><span class="id">lst</span><span class="text"> : &lt; </span><span class="id">fold</span><span class="text"> : '</span><span class="id">a</span><span class="text">. ('</span><span class="id">a</span><span class="text"> -&gt; </span><span class="numeric">_</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">) -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">; .. &gt;)</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> (+) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val sum : &lt; fold : 'a. ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a; .. &gt; -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>Another use of polymorphic methods is to allow some form of implicit
subtyping in method arguments. We have already seen in section
<a href="#ss%3Ainheritance">3.8</a> how some functions may be polymorphic in the
class of their argument. This can be extended to methods.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">point0</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type point0 = object method get_x : int end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">distance_point</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">distance</span><span class="text"> : '</span><span class="id">a</span><span class="text">. (</span><span class="kw1">#</span><span class="id">point0</span><span class="text"> </span><span class="kw1">as</span><span class="text"> '</span><span class="id">a</span><span class="text">) -&gt; </span><span class="kw3">int</span><span class="text"> =
        </span><span class="kw">fun</span><span class="text"> </span><span class="id">other</span><span class="text"> -&gt; </span><span class="id">abs</span><span class="text"> (</span><span class="id">other</span><span class="kw1">#</span><span class="id">get_x</span><span class="text"> - </span><span class="id">x</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class distance_point :
  int -&gt;
  object
    val mutable x : int
    method distance : #point0 -&gt; int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">distance_point</span><span class="text"> </span><span class="numeric">3</span><span class="text"> </span><span class="kw">in</span><span class="text">
  (</span><span class="id">p</span><span class="kw1">#</span><span class="id">distance</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="numeric">8</span><span class="text">), </span><span class="id">p</span><span class="kw1">#</span><span class="id">distance</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">colored_point</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"blue"</span><span class="text">));;
</span></code><code class="caml-output ok">- : int * int = (5, 2)
</code></pre>


</div><p>

Note here the special syntax <span class="c003">(#point0 as 'a)</span> we have to use to
quantify the extensible part of <span class="c003">#point0</span>. As for the variable binder,
it can be omitted in class specifications. If you want polymorphism
inside object field it must be quantified independently.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">multi_poly</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">m1</span><span class="text"> : '</span><span class="id">a</span><span class="text">. (&lt; </span><span class="id">n1</span><span class="text"> : '</span><span class="id">b</span><span class="text">. '</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">; .. &gt; </span><span class="kw1">as</span><span class="text"> '</span><span class="id">a</span><span class="text">) -&gt; </span><span class="numeric">_</span><span class="text"> =
        </span><span class="kw">fun</span><span class="text"> </span><span class="id">o</span><span class="text"> -&gt; </span><span class="id">o</span><span class="kw1">#</span><span class="id">n1</span><span class="text"> </span><span class="constant">true</span><span class="text">, </span><span class="id">o</span><span class="kw1">#</span><span class="id">n1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">m2</span><span class="text"> : '</span><span class="id">a</span><span class="text"> '</span><span class="id">b</span><span class="text">. (&lt; </span><span class="id">n2</span><span class="text"> : '</span><span class="id">b</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">; .. &gt; </span><span class="kw1">as</span><span class="text"> '</span><span class="id">a</span><span class="text">) -&gt; '</span><span class="id">b</span><span class="text"> -&gt; </span><span class="numeric">_</span><span class="text"> =
        </span><span class="kw">fun</span><span class="text"> </span><span class="id">o</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">o</span><span class="kw1">#</span><span class="id">n2</span><span class="text"> </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class multi_poly :
  object
    method m1 : &lt; n1 : 'b. 'b -&gt; 'b; .. &gt; -&gt; bool * string
    method m2 : &lt; n2 : 'b -&gt; bool; .. &gt; -&gt; 'b -&gt; bool
  end
</code></pre>


</div><p>

In method <span class="c003">m1</span>, <span class="c003">o</span> must be an object with at least a method <span class="c003">n1</span>,
itself polymorphic. In method <span class="c003">m2</span>, the argument of <span class="c003">n2</span> and <span class="c003">x</span> must
have the same type, which is quantified at the same level as <span class="c003">'a</span>.</p>
<h2 class="section" id="sec38">12&nbsp;&nbsp;Using coercions</h2>
<p>
<a id="ss:using-coercions"></a></p><p>Subtyping is never implicit. There are, however, two ways to perform
subtyping. The most general construction is fully explicit: both the
domain and the codomain of the type coercion must be given.</p><p>We have seen that points and colored points have incompatible types.
For instance, they cannot be mixed in the same list. However, a
colored point can be coerced to a point, hiding its <span class="c003">color</span> method:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">colored_point_to_point</span><span class="text"> </span><span class="id">cp</span><span class="text"> = (</span><span class="id">cp</span><span class="text"> : </span><span class="id">colored_point</span><span class="text"> :&gt; </span><span class="id">point</span><span class="text">);;
</span></code><code class="caml-output ok">val colored_point_to_point : colored_point -&gt; point = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="numeric">3</span><span class="text"> </span><span class="kw">and</span><span class="text"> </span><span class="id">q</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">colored_point</span><span class="text"> </span><span class="numeric">4</span><span class="text"> </span><span class="string">"blue"</span><span class="text">;;
</span></code><code class="caml-output ok">val p : point = &lt;obj&gt;
val q : colored_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">l</span><span class="text"> = [</span><span class="id">p</span><span class="text">; (</span><span class="id">colored_point_to_point</span><span class="text"> </span><span class="id">q</span><span class="text">)];;
</span></code><code class="caml-output ok">val l : point list = [&lt;obj&gt;; &lt;obj&gt;]
</code></pre>


</div><p>

An object of type <span class="c003">t</span> can be seen as an object of type <span class="c003">t'</span>
only if <span class="c003">t</span> is a subtype of <span class="c003">t'</span>. For instance, a point cannot be
seen as a colored point.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"> <u>(p : point :&gt; colored_point)</u>;;
</code><code class="caml-output error">Error: Type point = &lt; get_offset : int; get_x : int; move : int -&gt; unit &gt;
       is not a subtype of
         colored_point =
           &lt; color : string; get_offset : int; get_x : int;
             move : int -&gt; unit &gt; 
       The first object type has no method color
</code></pre>


</div><p>

Indeed, narrowing coercions without runtime checks would be unsafe.
Runtime type checks might raise exceptions, and they would require
the presence of type information at runtime, which is not the case in
the OCaml system.
For these reasons, there is no such operation available in the language.</p><p>Be aware that subtyping and inheritance are not related. Inheritance is a
syntactic relation between classes while subtyping is a semantic relation
between types. For instance, the class of colored points could have been
defined directly, without inheriting from the class of points; the type of
colored points would remain unchanged and thus still be a subtype of
points.
</p><p>The domain of a coercion can often be omitted. For instance, one can
define:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">to_point</span><span class="text"> </span><span class="id">cp</span><span class="text"> = (</span><span class="id">cp</span><span class="text"> :&gt; </span><span class="id">point</span><span class="text">);;
</span></code><code class="caml-output ok">val to_point : #point -&gt; point = &lt;fun&gt;
</code></pre>


</div><p>

In this case, the function <span class="c003">colored_point_to_point</span> is an instance of the
function <span class="c003">to_point</span>. This is not always true, however. The fully
explicit coercion is more precise and is sometimes unavoidable.
Consider, for example, the following class:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">c0</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> = {&lt; &gt;} </span><span class="kw">method</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="numeric">0</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class c0 : object ('a) method m : 'a method n : int end
</code></pre>


</div><p>

The object type <span class="c003">c0</span> is an abbreviation for <span class="c003">&lt;m : 'a; n : int&gt; as 'a</span>.
Consider now the type declaration:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c1</span><span class="text"> =  </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> : </span><span class="id">c1</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type c1 = object method m : c1 end
</code></pre>


</div><p>

The object type <span class="c003">c1</span> is an abbreviation for the type <span class="c003">&lt;m : 'a&gt; as 'a</span>.
The coercion from an object of type <span class="c003">c0</span> to an object of type <span class="c003">c1</span> is
correct:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">fun</span><span class="text"> (</span><span class="id">x</span><span class="text">:</span><span class="id">c0</span><span class="text">) -&gt; (</span><span class="id">x</span><span class="text"> : </span><span class="id">c0</span><span class="text"> :&gt; </span><span class="id">c1</span><span class="text">);;
</span></code><code class="caml-output ok">- : c0 -&gt; c1 = &lt;fun&gt;
</code></pre>


</div><p>

However, the domain of the coercion cannot always be omitted.
In that case, the solution is to use the explicit form.
Sometimes, a change in the class-type definition can also solve the problem


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c2</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> ('</span><span class="id">a</span><span class="text">) </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type c2 = object ('a) method m : 'a end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">fun</span><span class="text"> (</span><span class="id">x</span><span class="text">:</span><span class="id">c0</span><span class="text">) -&gt; (</span><span class="id">x</span><span class="text"> :&gt; </span><span class="id">c2</span><span class="text">);;
</span></code><code class="caml-output ok">- : c0 -&gt; c2 = &lt;fun&gt;
</code></pre>


</div><p>

While class types <span class="c003">c1</span> and <span class="c003">c2</span> are different, both object types
<span class="c003">c1</span> and <span class="c003">c2</span> expand to the same object type (same method names and types).
Yet, when the domain of a coercion is left implicit and its co-domain
is an abbreviation of a known class type, then the class type, rather
than the object type, is used to derive the coercion function. This
allows leaving the domain implicit in most cases when coercing form a
subclass to its superclass.
The type of a coercion can always be seen as below:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">to_c1</span><span class="text"> </span><span class="id">x</span><span class="text"> = (</span><span class="id">x</span><span class="text"> :&gt; </span><span class="id">c1</span><span class="text">);;
</span></code><code class="caml-output ok">val to_c1 : &lt; m : #c1; .. &gt; -&gt; c1 = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">to_c2</span><span class="text"> </span><span class="id">x</span><span class="text"> = (</span><span class="id">x</span><span class="text"> :&gt; </span><span class="id">c2</span><span class="text">);;
</span></code><code class="caml-output ok">val to_c2 : #c2 -&gt; c2 = &lt;fun&gt;
</code></pre>


</div><p>

Note the difference between these two coercions: in the case of <span class="c003">to_c2</span>,
the type
<span class="c003">#c2 = &lt; m : 'a; .. &gt; as 'a</span> is polymorphically recursive (according
to the explicit recursion in the class type of <span class="c003">c2</span>); hence the
success of applying this coercion to an object of class <span class="c003">c0</span>.
On the other hand, in the first case, <span class="c003">c1</span> was only expanded and
unrolled twice to obtain <span class="c003">&lt; m : &lt; m : c1; .. &gt;; .. &gt;</span> (remember <span class="c003">#c1 = &lt; m : c1; .. &gt;</span>), without introducing recursion.
You may also note that the type of <span class="c003">to_c2</span> is <span class="c003">#c2 -&gt; c2</span> while
the type of <span class="c003">to_c1</span> is more general than <span class="c003">#c1 -&gt; c1</span>. This is not always true,
since there are class types for which some instances of <span class="c003">#c</span> are not subtypes
of <span class="c003">c</span>, as explained in section&nbsp;<a href="#ss%3Abinary-methods">3.16</a>. Yet, for
parameterless classes the coercion <span class="c003">(_ :&gt; c)</span> is always more general than
<span class="c003">(_ : #c :&gt; c)</span>.
</p><p>A common problem may occur when one tries to define a coercion to a
class <span class="c003">c</span> while defining class <span class="c003">c</span>. The problem is due to the type
abbreviation not being completely defined yet, and so its subtypes are not
clearly known. Then, a coercion <span class="c003">(_ :&gt; c)</span> or <span class="c003">(_ : #c :&gt; c)</span> is taken to be
the identity function, as in


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">function</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; (</span><span class="id">x</span><span class="text"> :&gt; '</span><span class="id">a</span><span class="text">);;
</span></code><code class="caml-output ok">- : 'a -&gt; 'a = &lt;fun&gt;
</code></pre>


</div><p>

As a consequence, if the coercion is applied to <span class="c003">self</span>, as in the
following example, the type of <span class="c003">self</span> is unified with the closed type
<span class="c003">c</span> (a closed object type is an object type without ellipsis). This
would constrain the type of self be closed and is thus rejected.
Indeed, the type of self cannot be closed: this would prevent any
further extension of the class. Therefore, a type error is generated
when the unification of this type with another type would result in a
closed object type.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"> class c = object method m = 1 end
  and d = object (self)
    inherit c
    method n = 2
    method as_c = (<u>self</u> :&gt; c)
  end;;
</code><code class="caml-output error">Error: This expression cannot be coerced to type c = &lt; m : int &gt;; it has type
         &lt; as_c : c; m : int; n : int; .. &gt;
       but is here used with type c
       Self type cannot escape its class
</code></pre>


</div><p>

However, the most common instance of this problem, coercing self to
its current class, is detected as a special case by the type checker,
and properly typed.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">) </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> = (</span><span class="id">self</span><span class="text"> :&gt; </span><span class="id">c</span><span class="text">) </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class c : object method m : c end
</code></pre>


</div><p>

This allows the following idiom, keeping a list of all objects
belonging to a class or its subclasses:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">all_c</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> [];;
</span></code><code class="caml-output ok">val all_c : '_weak3 list ref = {contents = []}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> (</span><span class="id">m</span><span class="text"> : </span><span class="kw3">int</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="id">m</span><span class="text">
      </span><span class="kw">initializer</span><span class="text"> </span><span class="id">all_c</span><span class="text"> := (</span><span class="id">self</span><span class="text"> :&gt; </span><span class="id">c</span><span class="text">) :: !</span><span class="id">all_c</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class c : int -&gt; object method m : int end
</code></pre>


</div><p>

This idiom can in turn be used to retrieve an object whose type has
been weakened:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">lookup_obj</span><span class="text"> </span><span class="id">obj</span><span class="text"> = </span><span class="kw">function</span><span class="text"> [] -&gt; </span><span class="id">raise</span><span class="text"> </span><span class="kw2">Not_found</span><span class="text">
    | </span><span class="id">obj</span><span class="text">' :: </span><span class="id">l</span><span class="text"> -&gt;
       </span><span class="kw1">if</span><span class="text"> (</span><span class="id">obj</span><span class="text"> :&gt; &lt; &gt;) = (</span><span class="id">obj</span><span class="text">' :&gt; &lt; &gt;) </span><span class="kw1">then</span><span class="text"> </span><span class="id">obj</span><span class="text">' </span><span class="kw1">else</span><span class="text"> </span><span class="id">lookup_obj</span><span class="text"> </span><span class="id">obj</span><span class="text"> </span><span class="id">l</span><span class="text"> ;;
</span></code><code class="caml-output ok">val lookup_obj : &lt; .. &gt; -&gt; (&lt; .. &gt; as 'a) list -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">lookup_c</span><span class="text"> </span><span class="id">obj</span><span class="text"> = </span><span class="id">lookup_obj</span><span class="text"> </span><span class="id">obj</span><span class="text"> !</span><span class="id">all_c</span><span class="text">;;
</span></code><code class="caml-output ok">val lookup_c : &lt; .. &gt; -&gt; &lt; m : int &gt; = &lt;fun&gt;
</code></pre>


</div><p>

The type <span class="c003">&lt; m : int &gt;</span> we see here is just the expansion of <span class="c003">c</span>, due
to the use of a reference; we have succeeded in getting back an object
of type <span class="c003">c</span>.</p><p><br>
The previous coercion problem can often be avoided by first
defining the abbreviation, using a class type:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c</span><span class="text">' = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type c' = object method m : int end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> : </span><span class="id">c</span><span class="text">' = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">end</span><span class="text">
  </span><span class="kw">and</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
    </span><span class="kw">inherit</span><span class="text"> </span><span class="id">c</span><span class="text">
    </span><span class="kw">method</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="numeric">2</span><span class="text">
    </span><span class="kw">method</span><span class="text"> </span><span class="id">as_c</span><span class="text"> = (</span><span class="id">self</span><span class="text"> :&gt; </span><span class="id">c</span><span class="text">')
  </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class c : c'
and d : object method as_c : c' method m : int method n : int end
</code></pre>


</div><p>

It is also possible to use a virtual class. Inheriting from this class
simultaneously forces all methods of <span class="c003">c</span> to have the same
type as the methods of <span class="c003">c'</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">c</span><span class="text">' = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">m</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class virtual c' : object method virtual m : int end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">) </span><span class="kw">inherit</span><span class="text"> </span><span class="id">c</span><span class="text">' </span><span class="kw">method</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class c : object method m : int end
</code></pre>


</div><p>

One could think of defining the type abbreviation directly:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c</span><span class="text">' = &lt;</span><span class="id">m</span><span class="text"> : </span><span class="kw3">int</span><span class="text">&gt;;;
</span></code>
</pre>


</div><p>

However, the abbreviation <span class="c003">#c'</span> cannot be defined directly in a similar way.
It can only be defined by a class or a class-type definition.
This is because a <span class="c003">#</span>-abbreviation carries an implicit anonymous
variable <span class="c003">..</span> that cannot be explicitly named.
The closer you get to it is:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">c</span><span class="text">'</span><span class="id">_class</span><span class="text"> = '</span><span class="id">a</span><span class="text"> </span><span class="kw">constraint</span><span class="text"> '</span><span class="id">a</span><span class="text"> = &lt; </span><span class="id">m</span><span class="text"> : </span><span class="kw3">int</span><span class="text">; .. &gt;;;
</span></code>
</pre>


</div><p>

with an extra type variable capturing the open object type.</p>
<h2 class="section" id="sec39">13&nbsp;&nbsp;Functional objects</h2>
<p>
<a id="ss:functional-objects"></a></p><p>It is possible to write a version of class <span class="c003">point</span> without assignments
on the instance variables. The override construct <span class="c003">{&lt; ... &gt;}</span> returns a copy of
“self” (that is, the current object), possibly changing the value of
some instance variables.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">functional_point</span><span class="text"> </span><span class="id">y</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">y</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = {&lt; </span><span class="id">x</span><span class="text"> = </span><span class="id">x</span><span class="text"> + </span><span class="id">d</span><span class="text"> &gt;}
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move_to</span><span class="text"> </span><span class="id">x</span><span class="text"> = {&lt; </span><span class="id">x</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class functional_point :
  int -&gt;
  object ('a)
    val x : int
    method get_x : int
    method move : int -&gt; 'a
    method move_to : int -&gt; 'a
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">functional_point</span><span class="text"> </span><span class="numeric">7</span><span class="text">;;
</span></code><code class="caml-output ok">val p : functional_point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 7
</code></pre>

<pre><code class="caml-input"><span class="text"> (</span><span class="id">p</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">3</span><span class="text">)</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 10
</code></pre>

<pre><code class="caml-input"><span class="text"> (</span><span class="id">p</span><span class="kw1">#</span><span class="id">move_to</span><span class="text"> </span><span class="numeric">15</span><span class="text">)</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 15
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 7
</code></pre>


</div><p>

As with records, the form <span class="c003">{&lt; x &gt;}</span> is an elided version of
<span class="c003">{&lt; x = x &gt;}</span> which avoids the repetition of the instance variable name.
Note that the type abbreviation <span class="c003">functional_point</span> is recursive, which can
be seen in the class type of <span class="c003">functional_point</span>: the type of self is <span class="c003">'a</span>
and <span class="c003">'a</span> appears inside the type of the method <span class="c003">move</span>.</p><p>The above definition of <span class="c003">functional_point</span> is not equivalent
to the following:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">bad_functional_point</span><span class="text"> </span><span class="id">y</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">y</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">get_x</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">d</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">bad_functional_point</span><span class="text"> (</span><span class="id">x</span><span class="text">+</span><span class="id">d</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move_to</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">bad_functional_point</span><span class="text"> </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class bad_functional_point :
  int -&gt;
  object
    val x : int
    method get_x : int
    method move : int -&gt; bad_functional_point
    method move_to : int -&gt; bad_functional_point
  end
</code></pre>


</div><p>

While objects of either class will behave the same, objects of their
subclasses will be different. In a subclass of <span class="c003">bad_functional_point</span>,
the method <span class="c003">move</span> will
keep returning an object of the parent class. On the contrary, in a
subclass of <span class="c003">functional_point</span>, the method <span class="c003">move</span> will return an
object of the subclass.</p><p>Functional update is often used in conjunction with binary methods
as illustrated in section <a href="advexamples.html#module%3Astring">6.2.1</a>.</p>
<h2 class="section" id="sec40">14&nbsp;&nbsp;Cloning objects</h2>
<p>
<a id="ss:cloning-objects"></a></p><p>Objects can also be cloned, whether they are functional or imperative.
The library function <span class="c003">Oo.copy</span> makes a shallow copy of an object. That is,
it returns a new object that has the same methods and instance
variables as its argument. The
instance variables are copied but their contents are shared.
Assigning a new value to an instance variable of the copy (using a method
call) will not affect instance variables of the original, and conversely.
A deeper assignment (for example if the instance variable is a reference cell)
will of course affect both the original and the copy.</p><p>The type of <span class="c003">Oo.copy</span> is the following:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">Oo</span><span class="text">.</span><span class="id">copy</span><span class="text">;;
</span></code><code class="caml-output ok">- : (&lt; .. &gt; as 'a) -&gt; 'a = &lt;fun&gt;
</code></pre>


</div><p>

The keyword <span class="c003">as</span> in that type binds the type variable <span class="c003">'a</span> to
the object type <span class="c003">&lt; .. &gt;</span>. Therefore, <span class="c003">Oo.copy</span> takes an object with
any methods (represented by the ellipsis), and returns an object of
the same type. The type of <span class="c003">Oo.copy</span> is different from type <span class="c003">&lt; .. &gt; -&gt; &lt; .. &gt;</span> as each ellipsis represents a different set of methods.
Ellipsis actually behaves as a type variable.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">point</span><span class="text"> </span><span class="numeric">5</span><span class="text">;;
</span></code><code class="caml-output ok">val p : point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">q</span><span class="text"> = </span><span class="kw2">Oo</span><span class="text">.</span><span class="id">copy</span><span class="text"> </span><span class="id">p</span><span class="text">;;
</span></code><code class="caml-output ok">val q : point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">q</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">7</span><span class="text">; (</span><span class="id">p</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">, </span><span class="id">q</span><span class="kw1">#</span><span class="id">get_x</span><span class="text">);;
</span></code><code class="caml-output ok">- : int * int = (5, 12)
</code></pre>


</div><p>

In fact, <span class="c003">Oo.copy p</span> will behave as <span class="c003">p#copy</span> assuming that a public
method <span class="c003">copy</span> with body <span class="c003">{&lt; &gt;}</span> has been defined in the class of <span class="c003">p</span>.</p><p>Objects can be compared using the generic comparison functions <span class="c003">=</span> and <span class="c003">&lt;&gt;</span>.
Two objects are equal if and only if they are physically equal. In
particular, an object and its copy are not equal.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">q</span><span class="text"> = </span><span class="kw2">Oo</span><span class="text">.</span><span class="id">copy</span><span class="text"> </span><span class="id">p</span><span class="text">;;
</span></code><code class="caml-output ok">val q : point = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="id">q</span><span class="text">, </span><span class="id">p</span><span class="text"> = </span><span class="id">p</span><span class="text">;;
</span></code><code class="caml-output ok">- : bool * bool = (false, true)
</code></pre>


</div><p>

Other generic comparisons such as (<span class="c003">&lt;</span>, <span class="c003">&lt;=</span>, ...) can also be used on
objects. The
relation <span class="c003">&lt;</span> defines an unspecified but strict ordering on objects. The
ordering relationship between two objects is fixed once for all after the
two objects have been created and it is not affected by mutation of fields.</p><p>Cloning and override have a non empty intersection.
They are interchangeable when used within an object and without
overriding any field:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">copy</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">copy</span><span class="text"> = {&lt; &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class copy : object ('a) method copy : 'a end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">copy</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">copy</span><span class="text"> = </span><span class="kw2">Oo</span><span class="text">.</span><span class="id">copy</span><span class="text"> </span><span class="id">self</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class copy : object ('a) method copy : 'a end
</code></pre>


</div><p>

Only the override can be used to actually override fields, and
only the <span class="c003">Oo.copy</span> primitive can be used externally.</p><p>Cloning can also be used to provide facilities for saving and
restoring the state of objects.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">backup</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">mytype</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">copy</span><span class="text"> = </span><span class="kw2">None</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">save</span><span class="text"> = </span><span class="id">copy</span><span class="text"> &lt;- </span><span class="kw2">Some</span><span class="text"> {&lt; </span><span class="id">copy</span><span class="text"> = </span><span class="kw2">None</span><span class="text"> &gt;}
      </span><span class="kw">method</span><span class="text"> </span><span class="id">restore</span><span class="text"> = </span><span class="kw1">match</span><span class="text"> </span><span class="id">copy</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text"> | </span><span class="kw2">None</span><span class="text"> -&gt; </span><span class="id">self</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class backup :
  object ('a)
    val mutable copy : 'a option
    method restore : 'a
    method save : unit
  end
</code></pre>


</div><p>

The above definition will only backup one level.
The backup facility can be added to any class by using multiple inheritance.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">backup_ref</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">oref</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw">inherit</span><span class="text"> </span><span class="id">backup</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] backup_ref :
  'a -&gt;
  object ('b)
    val mutable copy : 'b option
    val mutable x : 'a
    method get : 'a
    method restore : 'b
    method save : unit
    method set : 'a -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="numeric">0</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">get</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="id">get</span><span class="text"> (</span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">restore</span><span class="text">) (</span><span class="id">n</span><span class="numeric">-1</span><span class="text">);;
</span></code><code class="caml-output ok">val get : (&lt; get : 'b; restore : 'a; .. &gt; as 'a) -&gt; int -&gt; 'b = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">backup_ref</span><span class="text"> </span><span class="numeric">0</span><span class="text">  </span><span class="kw">in</span><span class="text">
  </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">save</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="numeric">1</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">save</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="numeric">2</span><span class="text">;
  [</span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">0</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">1</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">2</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">3</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">4</span><span class="text">];;
</span></code><code class="caml-output ok">- : int list = [2; 1; 1; 1; 1]
</code></pre>


</div><p>

We can define a variant of backup that retains all copies. (We also
add a method <span class="c003">clear</span> to manually erase all copies.)


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">backup</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">mytype</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">copy</span><span class="text"> = </span><span class="kw2">None</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">save</span><span class="text"> = </span><span class="id">copy</span><span class="text"> &lt;- </span><span class="kw2">Some</span><span class="text"> {&lt; &gt;}
      </span><span class="kw">method</span><span class="text"> </span><span class="id">restore</span><span class="text"> = </span><span class="kw1">match</span><span class="text"> </span><span class="id">copy</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text"> | </span><span class="kw2">None</span><span class="text"> -&gt; </span><span class="id">self</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">clear</span><span class="text"> = </span><span class="id">copy</span><span class="text"> &lt;- </span><span class="kw2">None</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class backup :
  object ('a)
    val mutable copy : 'a option
    method clear : unit
    method restore : 'a
    method save : unit
  end
</code></pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">backup_ref</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">oref</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw">inherit</span><span class="text"> </span><span class="id">backup</span><span class="text"> </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] backup_ref :
  'a -&gt;
  object ('b)
    val mutable copy : 'b option
    val mutable x : 'a
    method clear : unit
    method get : 'a
    method restore : 'b
    method save : unit
    method set : 'a -&gt; unit
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">backup_ref</span><span class="text"> </span><span class="numeric">0</span><span class="text">  </span><span class="kw">in</span><span class="text">
  </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">save</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="numeric">1</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">save</span><span class="text">; </span><span class="id">p</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">set</span><span class="text"> </span><span class="numeric">2</span><span class="text">;
  [</span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">0</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">1</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">2</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">3</span><span class="text">; </span><span class="id">get</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="numeric">4</span><span class="text">];;
</span></code><code class="caml-output ok">- : int list = [2; 1; 0; 0; 0]
</code></pre>


</div>
<h2 class="section" id="sec41">15&nbsp;&nbsp;Recursive classes</h2>
<p>
<a id="ss:recursive-classes"></a></p><p>Recursive classes can be used to define objects whose types are
mutually recursive.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">window</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">top_widget</span><span class="text"> = (</span><span class="kw2">None</span><span class="text"> : </span><span class="id">widget</span><span class="text"> </span><span class="id">option</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">top_widget</span><span class="text"> = </span><span class="id">top_widget</span><span class="text">
    </span><span class="kw1">end</span><span class="text">
  </span><span class="kw">and</span><span class="text"> </span><span class="id">widget</span><span class="text"> (</span><span class="id">w</span><span class="text"> : </span><span class="id">window</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">window</span><span class="text"> = </span><span class="id">w</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">window</span><span class="text"> = </span><span class="id">window</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class window :
  object
    val mutable top_widget : widget option
    method top_widget : widget option
  end
and widget : window -&gt; object val window : window method window : window end
</code></pre>


</div><p>

Although their types are mutually recursive, the classes <span class="c003">widget</span> and
<span class="c003">window</span> are themselves independent.</p>
<h2 class="section" id="sec42">16&nbsp;&nbsp;Binary methods</h2>
<p>
<a id="ss:binary-methods"></a></p><p>A binary method is a method which takes an argument of the same type
as self. The class <span class="c003">comparable</span> below is a template for classes with a
binary method <span class="c003">leq</span> of type <span class="c003">'a -&gt; bool</span> where the type variable <span class="c003">'a</span>
is bound to the type of self. Therefore, <span class="c003">#comparable</span> expands to <span class="c003">&lt; leq : 'a -&gt; bool; .. &gt; as 'a</span>. We see here that the binder <span class="c003">as</span> also
allows writing recursive types.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">comparable</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="numeric">_</span><span class="text"> : '</span><span class="id">a</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">leq</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class virtual comparable : object ('a) method virtual leq : 'a -&gt; bool end
</code></pre>


</div><p>

We then define a subclass <span class="c003">money</span> of <span class="c003">comparable</span>. The class <span class="c003">money</span>
simply wraps floats as comparable objects. We will extend it below with
more operations. We have to use a type constraint on the class parameter <span class="c003">x</span>
because the primitive <span class="c003">&lt;=</span> is a polymorphic function in
OCaml. The <span class="c003">inherit</span> clause ensures that the type of objects
of this class is an instance of <span class="c003">#comparable</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">money</span><span class="text"> (</span><span class="id">x</span><span class="text"> : </span><span class="kw3">float</span><span class="text">) =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">comparable</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">value</span><span class="text"> = </span><span class="id">repr</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">leq</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="id">repr</span><span class="text"> &lt;= </span><span class="id">p</span><span class="kw1">#</span><span class="id">value</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class money :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method value : float
  end
</code></pre>


</div><p>

Note that the type <span class="c003">money</span> is not a subtype of type
<span class="c003">comparable</span>, as the self type appears in contravariant position
in the type of method <span class="c003">leq</span>.
Indeed, an object <span class="c003">m</span> of class <span class="c003">money</span> has a method <span class="c003">leq</span>
that expects an argument of type <span class="c003">money</span> since it accesses
its <span class="c003">value</span> method. Considering <span class="c003">m</span> of type <span class="c003">comparable</span> would allow a
call to method <span class="c003">leq</span> on <span class="c003">m</span> with an argument that does not have a method
<span class="c003">value</span>, which would be an error.</p><p>Similarly, the type <span class="c003">money2</span> below is not a subtype of type <span class="c003">money</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">money2</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">money</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">times</span><span class="text"> </span><span class="id">k</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">k</span><span class="text"> *. </span><span class="id">repr</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class money2 :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method times : float -&gt; 'a
    method value : float
  end
</code></pre>


</div><p>

It is however possible to define functions that manipulate objects of
type either <span class="c003">money</span> or <span class="c003">money2</span>: the function <span class="c003">min</span>
will return the minimum of any two objects whose type unifies with
<span class="c003">#comparable</span>. The type of <span class="c003">min</span> is not the same as <span class="c003">#comparable -&gt; #comparable -&gt; #comparable</span>, as the abbreviation <span class="c003">#comparable</span> hides a
type variable (an ellipsis). Each occurrence of this abbreviation
generates a new variable.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">min</span><span class="text"> (</span><span class="id">x</span><span class="text"> : </span><span class="kw1">#</span><span class="id">comparable</span><span class="text">) </span><span class="id">y</span><span class="text"> =
    </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="id">y</span><span class="text">;;
</span></code><code class="caml-output ok">val min : (#comparable as 'a) -&gt; 'a -&gt; 'a = &lt;fun&gt;
</code></pre>


</div><p>

This function can be applied to objects of type <span class="c003">money</span>
or <span class="c003">money2</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> (</span><span class="id">min</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">money</span><span class="text">  </span><span class="numeric">1.3</span><span class="text">) (</span><span class="kw1">new</span><span class="text"> </span><span class="id">money</span><span class="text"> </span><span class="numeric">3.1</span><span class="text">))</span><span class="kw1">#</span><span class="id">value</span><span class="text">;;
</span></code><code class="caml-output ok">- : float = 1.3
</code></pre>

<pre><code class="caml-input"><span class="text"> (</span><span class="id">min</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">money2</span><span class="text"> </span><span class="numeric">5.0</span><span class="text">) (</span><span class="kw1">new</span><span class="text"> </span><span class="id">money2</span><span class="text"> </span><span class="numeric">3.14</span><span class="text">))</span><span class="kw1">#</span><span class="id">value</span><span class="text">;;
</span></code><code class="caml-output ok">- : float = 3.14
</code></pre>


</div><p>More examples of binary methods can be found in sections
<a href="advexamples.html#module%3Astring">6.2.1</a> and <a href="advexamples.html#module%3Aset">6.2.3</a>.</p><p>Note the use of override for method <span class="c003">times</span>.
Writing <span class="c003">new money2 (k *. repr)</span> instead of <span class="c003">{&lt; repr = k *. repr &gt;}</span>
would not behave well with inheritance: in a subclass <span class="c003">money3</span> of <span class="c003">money2</span>
the <span class="c003">times</span> method would return an object of class <span class="c003">money2</span> but not of class
<span class="c003">money3</span> as would be expected.</p><p>The class <span class="c003">money</span> could naturally carry another binary method. Here is a
direct definition:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">money</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">a</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">value</span><span class="text"> = </span><span class="id">repr</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_float</span><span class="text"> </span><span class="id">repr</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">times</span><span class="text"> </span><span class="id">k</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">k</span><span class="text"> *. </span><span class="id">x</span><span class="text"> &gt;}
      </span><span class="kw">method</span><span class="text"> </span><span class="id">leq</span><span class="text"> (</span><span class="id">p</span><span class="text"> : '</span><span class="id">a</span><span class="text">) = </span><span class="id">repr</span><span class="text"> &lt;= </span><span class="id">p</span><span class="kw1">#</span><span class="id">value</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">plus</span><span class="text"> (</span><span class="id">p</span><span class="text"> : '</span><span class="id">a</span><span class="text">) = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text"> +. </span><span class="id">p</span><span class="kw1">#</span><span class="id">value</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class money :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method plus : 'a -&gt; 'a
    method print : unit
    method times : float -&gt; 'a
    method value : float
  end
</code></pre>


</div>
<h2 class="section" id="sec43">17&nbsp;&nbsp;Friends</h2>
<p>
<a id="ss:friends"></a></p><p>The above class <span class="c003">money</span> reveals a problem that often occurs with binary
methods. In order to interact with other objects of the same class, the
representation of <span class="c003">money</span> objects must be revealed, using a method such as
<span class="c003">value</span>. If we remove all binary methods (here <span class="c003">plus</span> and <span class="c003">leq</span>),
the representation can easily be hidden inside objects by removing the method
<span class="c003">value</span> as well. However, this is not possible as soon as some binary
method requires access to the representation of objects of the same
class (other than self).


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">safe_money</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">a</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_float</span><span class="text"> </span><span class="id">repr</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">times</span><span class="text"> </span><span class="id">k</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">k</span><span class="text"> *. </span><span class="id">x</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class safe_money :
  float -&gt;
  object ('a)
    val repr : float
    method print : unit
    method times : float -&gt; 'a
  end
</code></pre>


</div><p>

Here, the representation of the object is known only to a particular object.
To make it available to other objects of the same class, we are forced to
make it available to the whole world. However we can easily restrict the
visibility of the representation using the module system.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">MONEY</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
      </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> : </span><span class="kw3">float</span><span class="text"> -&gt;
        </span><span class="kw1">object</span><span class="text"> ('</span><span class="id">a</span><span class="text">)
          </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> : </span><span class="id">t</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">value</span><span class="text"> : </span><span class="id">t</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> : </span><span class="kw3">unit</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">times</span><span class="text"> : </span><span class="kw3">float</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">leq</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">plus</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Euro</span><span class="text"> : </span><span class="kw2">MONEY</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">float</span><span class="text">
      </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">a</span><span class="text">)
          </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">value</span><span class="text"> = </span><span class="id">repr</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_float</span><span class="text"> </span><span class="id">repr</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">times</span><span class="text"> </span><span class="id">k</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">k</span><span class="text"> *. </span><span class="id">x</span><span class="text"> &gt;}
          </span><span class="kw">method</span><span class="text"> </span><span class="id">leq</span><span class="text"> (</span><span class="id">p</span><span class="text"> : '</span><span class="id">a</span><span class="text">) = </span><span class="id">repr</span><span class="text"> &lt;= </span><span class="id">p</span><span class="kw1">#</span><span class="id">value</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">plus</span><span class="text"> (</span><span class="id">p</span><span class="text"> : '</span><span class="id">a</span><span class="text">) = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">x</span><span class="text"> +. </span><span class="id">p</span><span class="kw1">#</span><span class="id">value</span><span class="text"> &gt;}
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div><p>

Another example of friend functions may be found in section
<a href="advexamples.html#module%3Aset">6.2.3</a>. These examples occur when a group of objects (here
objects of the same class) and functions should see each others internal
representation, while their representation should be hidden from the
outside. The solution is always to define all friends in the same module,
give access to the representation and use a signature constraint to make the
representation abstract outside the module.</p>
<hr>





<span class="authors c009">(Chapter written by Jérôme Vouillon, Didier Rémy and Jacques Garrigue)</span><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>