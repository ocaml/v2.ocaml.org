<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="tutos_menu"><li><a href="manual003.html">The core language</a></li><li><a href="manual004.html">The module system</a></li><li class="active"><a href="manual005.html">Objects in OCaml</a></li><li><a href="manual006.html">Labels and variants</a></li><li><a href="manual007.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="tutorial"><a name="htoc18"><span>Tutorial 3</span></a>&nbsp;&nbsp;Objects in OCaml</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><ul><div class="toc_title"><a href="/docs" id="version-select">Version 4.00</a></div><li class="top"><a href="#">Top</a></li>
<li><a href="#toc18">Classes and objects</a>
</li><li><a href="#toc19">Immediate objects</a>
</li><li><a href="#toc20">Reference to self</a>
</li><li><a href="#toc21">Initializers</a>
</li><li><a href="#toc22">Virtual methods</a>
</li><li><a href="#toc23">Private methods</a>
</li><li><a href="#toc24">Class interfaces</a>
</li><li><a href="#toc25">Inheritance</a>
</li><li><a href="#toc26">Multiple inheritance</a>
</li><li><a href="#toc27">Parameterized classes</a>
</li><li><a href="#toc28">Polymorphic methods</a>
</li><li><a href="#toc29">Using coercions</a>
</li><li><a href="#toc30">Functional objects</a>
</li><li><a href="#toc31">Cloning objects</a>
</li><li><a href="#toc32">Recursive classes</a>
</li><li><a href="#toc33">Binary methods</a>
</li><li><a href="#toc34">Friends</a>
</li></ul></nav></header>
<p>
<a name="c:objectexamples"></a>
</p><p></p><p><br>
<br>
</p><p>This tutorial gives an overview of the object-oriented features of
OCaml. Note that the relation between object, class and type
in OCaml is very different from that in mainstream
object-oriented languages like Java or C++, so that you should not
assume that similar keywords mean the same thing.</p><p><a href="#ss:classes-and-objects">3.1</a> Classes and objects<br>
<a href="#ss:immediate-objects">3.2</a> Immediate objects<br>
<a href="#ss:reference-to-self">3.3</a> Reference to self<br>
<a href="#ss:initializers">3.4</a> Initializers<br>
<a href="#ss:virtual-methods">3.5</a> Virtual methods<br>
<a href="#ss:private-methods">3.6</a> Private methods<br>
<a href="#ss:class-interfaces">3.7</a> Class interfaces<br>
<a href="#ss:inheritance">3.8</a> Inheritance<br>
<a href="#ss:multiple-inheritance">3.9</a> Multiple inheritance<br>
<a href="#ss:parameterized-classes">3.10</a> Parameterized classes<br>
<a href="#ss:polymorphic-methods">3.11</a> Polymorphic methods<br>
<a href="#ss:using-coercions">3.12</a> Using coercions<br>
<a href="#ss:functional-objects">3.13</a> Functional objects<br>
<a href="#ss:cloning-objects">3.14</a> Cloning objects<br>
<a href="#ss:recursive-classes">3.15</a> Recursive classes<br>
<a href="#ss:binary-methods">3.16</a> Binary methods<br>
<a href="#ss:friends">3.17</a> Friends<br>

</p><h2 class="section"><a name="toc18"></a><a name="htoc19">1</a>&nbsp;&nbsp;Classes and objects</h2><p>

<a name="ss:classes-and-objects"></a></p><p>The class <tt>point</tt> below defines one instance variable <tt>x</tt> and two methods
<tt>get_x</tt> and <tt>move</tt>. The initial value of the instance variable is <tt>0</tt>.
The variable <tt>x</tt> is declared mutable, so the method <tt>move</tt> can change
its value.
</p><pre><font color="black">#</font><font color="#006000"> class point =
    object
      val mutable x = 0
      method get_x = x
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class point :
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</font></pre><p>We now create a new point <tt>p</tt>, instance of the <tt>point</tt> class.
</p><pre><font color="black">#</font><font color="#006000"> let p = new point;;
</font><font color="maroon">val p : point = &lt;obj&gt;
</font></pre><p>
Note that the type of <tt>p</tt> is <tt>point</tt>. This is an abbreviation
automatically defined by the class definition above. It stands for the
object type <tt>&lt;get_x : int; move : int -&gt; unit&gt;</tt>, listing the methods
of class <tt>point</tt> along with their types.</p><p>We now invoke some methods to <tt>p</tt>:
</p><pre><font color="black">#</font><font color="#006000"> p#get_x;;
<font color="maroon">- : int = 0

</font><font color="black">#</font> p#move 3;;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> p#get_x;;
</font><font color="maroon">- : int = 3
</font></pre><p>The evaluation of the body of a class only takes place at object
creation time. Therefore, in the following example, the instance
variable <tt>x</tt> is initialized to different values for two different
objects.
</p><pre><font color="black">#</font><font color="#006000"> let x0 = ref 0;;
<font color="maroon">val x0 : int ref = {contents = 0}

</font><font color="black">#</font> class point =
    object
      val mutable x = incr x0; !x0
      method get_x = x
      method move d = x &lt;- x + d
    end;;
<font color="maroon">class point :
  object val mutable x : int method get_x : int method move : int -&gt; unit end

</font><font color="black">#</font> new point#get_x;;
<font color="maroon">- : int = 1

</font><font color="black">#</font> new point#get_x;;
</font><font color="maroon">- : int = 2
</font></pre><p>The class <tt>point</tt> can also be abstracted over the initial values of
the <tt>x</tt> coordinate.
</p><pre><font color="black">#</font><font color="#006000"> class point = fun x_init -&gt;
    object
      val mutable x = x_init
      method get_x = x
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class point :
  int -&gt;
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</font></pre><p>
Like in function definitions, the definition above can be
abbreviated as:
</p><pre><font color="black">#</font><font color="#006000"> class point x_init =
    object
      val mutable x = x_init
      method get_x = x
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class point :
  int -&gt;
  object val mutable x : int method get_x : int method move : int -&gt; unit end
</font></pre><p>
An instance of the class <tt>point</tt> is now a function that expects an
initial parameter to create a point object:
</p><pre><font color="black">#</font><font color="#006000"> new point;;
<font color="maroon">- : int -&gt; point = &lt;fun&gt;

</font><font color="black">#</font> let p = new point 7;;
</font><font color="maroon">val p : point = &lt;obj&gt;
</font></pre><p>
The parameter <tt>x_init</tt> is, of course, visible in the whole body of the
definition, including methods. For instance, the method <tt>get_offset</tt>
in the class below returns the position of the object relative to its
initial position.
</p><pre><font color="black">#</font><font color="#006000"> class point x_init =
    object
      val mutable x = x_init
      method get_x = x
      method get_offset = x - x_init
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>
Expressions can be evaluated and bound before defining the object body
of the class. This is useful to enforce invariants. For instance,
points can be automatically adjusted to the nearest point on a grid,
as follows:
</p><pre><font color="black">#</font><font color="#006000"> class adjusted_point x_init =
    let origin = (x_init / 10) * 10 in
    object
      val mutable x = origin
      method get_x = x
      method get_offset = x - origin
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class adjusted_point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>
(One could also raise an exception if the <tt>x_init</tt> coordinate is not
on the grid.) In fact, the same effect could here be obtained by
calling the definition of class <tt>point</tt> with the value of the
<tt>origin</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class adjusted_point x_init =  point ((x_init / 10) * 10);;
</font><font color="maroon">class adjusted_point : int -&gt; point
</font></pre><p>
An alternate solution would have been to define the adjustment in
a special allocation function:
</p><pre><font color="black">#</font><font color="#006000"> let new_adjusted_point x_init = new point ((x_init / 10) * 10);;
</font><font color="maroon">val new_adjusted_point : int -&gt; point = &lt;fun&gt;
</font></pre><p>
However, the former pattern is generally more appropriate, since
the code for adjustment is part of the definition of the class and will be
inherited.</p><p>This ability provides class constructors as can be found in other
languages. Several constructors can be defined this way to build objects of
the same class but with different initialization patterns; an
alternative is to use initializers, as decribed below in section
<a href="#ss:initializers">3.4</a>.</p><h2 class="section"><a name="toc19"></a><a name="htoc20">2</a>&nbsp;&nbsp;Immediate objects</h2><p>

<a name="ss:immediate-objects"></a></p><p>There is another, more direct way to create an object: create it
without going through a class.</p><p>The syntax is exactly the same as for class expressions, but the
result is a single object rather than a class. All the constructs
described in the rest of this section also apply to immediate objects.
</p><pre><font color="black">#</font><font color="#006000"> let p =
    object
      val mutable x = 0
      method get_x = x
      method move d = x &lt;- x + d
    end;;
<font color="maroon">val p : &lt; get_x : int; move : int -&gt; unit &gt; = &lt;obj&gt;

</font><font color="black">#</font> p#get_x;;
<font color="maroon">- : int = 0

</font><font color="black">#</font> p#move 3;;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> p#get_x;;
</font><font color="maroon">- : int = 3
</font></pre><p>Unlike classes, which cannot be defined inside an expression,
immediate objects can appear anywhere, using variables from their
environment.
</p><pre><font color="black">#</font><font color="#006000"> let minmax x y =
    if x &lt; y then object method min = x method max = y end
    else object method min = y method max = x end;;
</font><font color="maroon">val minmax : 'a -&gt; 'a -&gt; &lt; max : 'a; min : 'a &gt; = &lt;fun&gt;
</font></pre><p>Immediate objects have two weaknesses compared to classes: their types
are not abbreviated, and you cannot inherit from them. But these two
weaknesses can be advantages in some situations, as we will see
in sections <a href="#ss:reference-to-self">3.3</a> and <a href="#ss:parameterized-classes">3.10</a>.</p><h2 class="section"><a name="toc20"></a><a name="htoc21">3</a>&nbsp;&nbsp;Reference to self</h2><p>

<a name="ss:reference-to-self"></a></p><p>A method or an initializer can send messages to self (that is,
the current object). For that, self must be explicitly bound, here to
the variable <tt>s</tt> (<tt>s</tt> could be any identifier, even though we will
often choose the name <tt>self</tt>.)
</p><pre><font color="black">#</font><font color="#006000"> class printable_point x_init =
    object (s)
      val mutable x = x_init
      method get_x = x
      method move d = x &lt;- x + d
      method print = print_int s#get_x
    end;;
<font color="maroon">class printable_point :
  int -&gt;
  object
    val mutable x : int
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end

</font><font color="black">#</font> let p = new printable_point 7;;
<font color="maroon">val p : printable_point = &lt;obj&gt;

</font><font color="black">#</font> p#print;;
</font><font color="maroon">7- : unit = ()
</font></pre><p>
Dynamically, the variable <tt>s</tt> is bound at the invocation of a method. In
particular, when the class <tt>printable_point</tt> is inherited, the variable
<tt>s</tt> will be correctly bound to the object of the subclass.</p><p>A common problem with self is that, as its type may be extended in
subclasses, you cannot fix it in advance. Here is a simple example.
</p><pre><font color="black">#</font><font color="#006000"> let ints = ref [];;
<font color="maroon">val ints : '_a list ref = {contents = []}

</font><font color="black">#</font> class my_int =
    object (self)
      method n = 1
      method register = ints := <u>self</u> :: !ints
    end;;
</font><font color="maroon">Error: This expression has type &lt; n : int; register : 'b; .. &gt; as 'a
       but an expression was expected of type 'a
       This instance of &lt; n : int; register : 'b; .. &gt; is ambiguous:
       it would escape the scope of its equation
</font></pre><p>
You can ignore the first two lines of the error message. What matters
is the last one: putting self into an external reference would make it
impossible to extend it through inheritance.
We will see in section <a href="#ss:using-coercions">3.12</a> a workaround to this
problem.
Note however that, since immediate objects are not extensible, the
problem does not occur with them.
</p><pre><font color="black">#</font><font color="#006000"> let my_int =
    object (self)
      method n = 1
      method register = ints := self :: !ints
    end;;
</font><font color="maroon">val my_int : &lt; n : int; register : unit &gt; = &lt;obj&gt;
</font></pre><h2 class="section"><a name="toc21"></a><a name="htoc22">4</a>&nbsp;&nbsp;Initializers</h2><p>

<a name="ss:initializers"></a></p><p>Let-bindings within class definitions are evaluated before the object
is constructed. It is also possible to evaluate an expression
immediately after the object has been built. Such code is written as
an anonymous hidden method called an initializer. Therefore, it can
access self and the instance variables.
</p><pre><font color="black">#</font><font color="#006000"> class printable_point x_init =
    let origin = (x_init / 10) * 10 in
    object (self)
      val mutable x = origin
      method get_x = x
      method move d = x &lt;- x + d
      method print = print_int self#get_x
      initializer print_string "new point at "; self#print; print_newline()
    end;;
<font color="maroon">class printable_point :
  int -&gt;
  object
    val mutable x : int
    method get_x : int
    method move : int -&gt; unit
    method print : unit
  end

</font><font color="black">#</font> let p = new printable_point 17;;
</font><font color="maroon">new point at 10
val p : printable_point = &lt;obj&gt;
</font></pre><p>
Initializers cannot be overridden. On the contrary, all initializers are
evaluated sequentially.
Initializers are particularly useful to enforce invariants.
Another example can be seen in section <a href="manual007.html#ss:bank-accounts">5.1</a>.</p><h2 class="section"><a name="toc22"></a><a name="htoc23">5</a>&nbsp;&nbsp;Virtual methods</h2><p>

<a name="ss:virtual-methods"></a></p><p>It is possible to declare a method without actually defining it, using
the keyword <tt>virtual</tt>. This method will be provided later in
subclasses. A class containing virtual methods must be flagged
<tt>virtual</tt>, and cannot be instantiated (that is, no object of this class
can be created). It still defines type abbreviations (treating virtual methods
as other methods.)
</p><pre><font color="black">#</font><font color="#006000"> class virtual abstract_point x_init =
    object (self)
      method virtual get_x : int
      method get_offset = self#get_x - x_init
      method virtual move : int -&gt; unit
    end;;
<font color="maroon">class virtual abstract_point :
  int -&gt;
  object
    method get_offset : int
    method virtual get_x : int
    method virtual move : int -&gt; unit
  end

</font><font color="black">#</font> class point x_init =
    object
      inherit abstract_point x_init
      val mutable x = x_init
      method get_x = x
      method move d = x &lt;- x + d
    end;;
</font><font color="maroon">class point :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>Instance variables can also be declared as virtual, with the same effect
as with methods.
</p><pre><font color="black">#</font><font color="#006000"> class virtual abstract_point2 =
    object
      val mutable virtual x : int
      method move d = x &lt;- x + d
    end;;
<font color="maroon">class virtual abstract_point2 :
  object val mutable virtual x : int method move : int -&gt; unit end

</font><font color="black">#</font> class point2 x_init =
    object
      inherit abstract_point2
      val mutable x = x_init
      method get_offset = x - x_init
    end;;
</font><font color="maroon">class point2 :
  int -&gt;
  object
    val mutable x : int
    method get_offset : int
    method move : int -&gt; unit
  end
</font></pre><h2 class="section"><a name="toc23"></a><a name="htoc24">6</a>&nbsp;&nbsp;Private methods</h2><p>

<a name="ss:private-methods"></a></p><p>Private methods are methods that do not appear in object interfaces.
They can only be invoked from other methods of the same object.
</p><pre><font color="black">#</font><font color="#006000"> class restricted_point x_init =
    object (self)
      val mutable x = x_init
      method get_x = x
      method private move d = x &lt;- x + d
      method bump = self#move 1
    end;;
<font color="maroon">class restricted_point :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method private move : int -&gt; unit
  end

</font><font color="black">#</font> let p = new restricted_point 0;;
<font color="maroon">val p : restricted_point = &lt;obj&gt;

</font><font color="black">#</font> <u>p</u>#move 10;;
<font color="maroon">Error: This expression has type restricted_point
       It has no method move

</font><font color="black">#</font> p#bump;;
</font><font color="maroon">- : unit = ()
</font></pre><p>
Note that this is not the same thing as private and protected methods
in Java or C++, which can be called from other objects of the same
class. This is a direct consequence of the independence between types
and classes in OCaml: two unrelated classes may produce
objects of the same type, and there is no way at the type level to
ensure that an object comes from a specific class. However a possible
encoding of friend methods is given in section <a href="#ss:friends">3.17</a>.</p><p>Private methods are inherited (they are by default visible in subclasses),
unless they are hidden by signature matching, as described below.</p><p>Private methods can be made public in a subclass.
</p><pre><font color="black">#</font><font color="#006000"> class point_again x =
    object (self)
      inherit restricted_point x
      method virtual move : _
    end;;
</font><font color="maroon">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>
The annotation <tt>virtual</tt> here is only used to mention a method without
providing its definition. Since we didn’t add the <tt>private</tt>
annotation, this makes the method public, keeping the original
definition.</p><p>An alternative definition is
</p><pre><font color="black">#</font><font color="#006000"> class point_again x =
    object (self : &lt; move : _; ..&gt; )
      inherit restricted_point x
    end;;
</font><font color="maroon">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>
The constraint on self’s type is requiring a public <tt>move</tt> method, and
this is sufficient to override <tt>private</tt>.</p><p>One could think that a private method should remain private in a subclass.
However, since the method is visible in a subclass, it is always possible
to pick its code and define a method of the same name that runs that
code, so yet another (heavier) solution would be:
</p><pre><font color="black">#</font><font color="#006000"> class point_again x =
    object
      inherit restricted_point x as super
      method move = super#move
    end;;
</font><font color="maroon">class point_again :
  int -&gt;
  object
    val mutable x : int
    method bump : unit
    method get_x : int
    method move : int -&gt; unit
  end
</font></pre><p>Of course, private methods can also be virtual. Then, the keywords must
appear in this order <tt>method private virtual</tt>.</p><h2 class="section"><a name="toc24"></a><a name="htoc25">7</a>&nbsp;&nbsp;Class interfaces</h2><p>

<a name="ss:class-interfaces"></a></p><p>Class interfaces are inferred from class definitions. They may also
be defined directly and used to restrict the type of a class. Like class
declarations, they also define a new type abbreviation.
</p><pre><font color="black">#</font><font color="#006000"> class type restricted_point_type =
    object
      method get_x : int
      method bump : unit
  end;;
<font color="maroon">class type restricted_point_type =
  object method bump : unit method get_x : int end

</font><font color="black">#</font> fun (x : restricted_point_type) -&gt; x;;
</font><font color="maroon">- : restricted_point_type -&gt; restricted_point_type = &lt;fun&gt;
</font></pre><p>
In addition to program documentation, class interfaces can be used to
constrain the type of a class. Both concrete instance variables and concrete
private methods can be hidden by a class type constraint. Public
methods and virtual members, however, cannot.
</p><pre><font color="black">#</font><font color="#006000"> class restricted_point' x = (restricted_point x : restricted_point_type);;
</font><font color="maroon">class restricted_point' : int -&gt; restricted_point_type
</font></pre><p>
Or, equivalently:
</p><pre><font color="black">#</font><font color="#006000"> class restricted_point' = (restricted_point : int -&gt; restricted_point_type);;
</font><font color="maroon">class restricted_point' : int -&gt; restricted_point_type
</font></pre><p>
The interface of a class can also be specified in a module
signature, and used to restrict the inferred signature of a module.
</p><pre><font color="black">#</font><font color="#006000"> module type POINT = sig
    class restricted_point' : int -&gt;
      object
        method get_x : int
        method bump : unit
      end
  end;;
<font color="maroon">module type POINT =
  sig
    class restricted_point' :
      int -&gt; object method bump : unit method get_x : int end
  end

</font><font color="black">#</font> module Point : POINT = struct
    class restricted_point' = restricted_point
  end;;
</font><font color="maroon">module Point : POINT
</font></pre><h2 class="section"><a name="toc25"></a><a name="htoc26">8</a>&nbsp;&nbsp;Inheritance</h2><p>

<a name="ss:inheritance"></a></p><p>We illustrate inheritance by defining a class of colored points that
inherits from the class of points. This class has all instance
variables and all methods of class <tt>point</tt>, plus a new instance
variable <tt>c</tt> and a new method <tt>color</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class colored_point x (c : string) =
    object
      inherit point x
      val c = c
      method color = c
    end;;
<font color="maroon">class colored_point :
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

</font><font color="black">#</font> let p' = new colored_point 5 "red";;
<font color="maroon">val p' : colored_point = &lt;obj&gt;

</font><font color="black">#</font> p'#get_x, p'#color;;
</font><font color="maroon">- : int * string = (5, "red")
</font></pre><p>
A point and a colored point have incompatible types, since a point has
no method <tt>color</tt>. However, the function <tt>get_x</tt> below is a generic
function applying method <tt>get_x</tt> to any object <tt>p</tt> that has this
method (and possibly some others, which are represented by an ellipsis
in the type). Thus, it applies to both points and colored points.
</p><pre><font color="black">#</font><font color="#006000"> let get_succ_x p = p#get_x + 1;;
<font color="maroon">val get_succ_x : &lt; get_x : int; .. &gt; -&gt; int = &lt;fun&gt;

</font><font color="black">#</font> get_succ_x p + get_succ_x p';;
</font><font color="maroon">- : int = 8
</font></pre><p>
Methods need not be declared previously, as shown by the example:
</p><pre><font color="black">#</font><font color="#006000"> let set_x p = p#set_x;;
<font color="maroon">val set_x : &lt; set_x : 'a; .. &gt; -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> let incr p = set_x p (get_succ_x p);;
</font><font color="maroon">val incr : &lt; get_x : int; set_x : int -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;
</font></pre><h2 class="section"><a name="toc26"></a><a name="htoc27">9</a>&nbsp;&nbsp;Multiple inheritance</h2><p>

<a name="ss:multiple-inheritance"></a></p><p>Multiple inheritance is allowed. Only the last definition of a method
is kept: the redefinition in a subclass of a method that was visible in
the parent class overrides the definition in the parent class.
Previous definitions of a method can be reused by binding the related
ancestor. Below, <tt>super</tt> is bound to the ancestor <tt>printable_point</tt>.
The name <tt>super</tt> is a pseudo value identifier that can only be used to
invoke a super-class method, as in <tt>super#print</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class printable_colored_point y c =
    object (self)
      val c = c
      method color = c
      inherit printable_point y as super
      method print =
        print_string "(";
        super#print;
        print_string ", ";
        print_string (self#color);
        print_string ")"
    end;;
<font color="maroon">class printable_colored_point :
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

</font><font color="black">#</font> let p' = new printable_colored_point 17 "red";;
<font color="maroon">new point at (10, red)
val p' : printable_colored_point = &lt;obj&gt;

</font><font color="black">#</font> p'#print;;
</font><font color="maroon">(10, red)- : unit = ()
</font></pre><p>
A private method that has been hidden in the parent class is no longer
visible, and is thus not overridden. Since initializers are treated as
private methods, all initializers along the class hierarchy are evaluated,
in the order they are introduced.</p><h2 class="section"><a name="toc27"></a><a name="htoc28">10</a>&nbsp;&nbsp;Parameterized classes</h2><p>

<a name="ss:parameterized-classes"></a></p><p>Reference cells can be implemented as objects.
The naive definition fails to typecheck:
</p><pre><font color="black">#</font><font color="#006000"> class <u>ref x_init =
    object
      val mutable x = x_init
      method get = x
      method set y = x &lt;- y
    end</u>;;
</font><font color="maroon">Error: Some type variables are unbound in this type:
         class ref :
           'a -&gt;
           object
             val mutable x : 'a
             method get : 'a
             method set : 'a -&gt; unit
           end
       The method get has type 'a where 'a is unbound
</font></pre><p>
The reason is that at least one of the methods has a polymorphic type
(here, the type of the value stored in the reference cell), thus
either the class should be parametric, or the method type should be
constrained to a monomorphic type. A monomorphic instance of the class could
be defined by:
</p><pre><font color="black">#</font><font color="#006000"> class ref (x_init:int) =
    object
      val mutable x = x_init
      method get = x
      method set y = x &lt;- y
    end;;
</font><font color="maroon">class ref :
  int -&gt;
  object val mutable x : int method get : int method set : int -&gt; unit end
</font></pre><p>
Note that since immediate objects do not define a class type, they have
no such restriction.
</p><pre><font color="black">#</font><font color="#006000"> let new_ref x_init =
    object
      val mutable x = x_init
      method get = x
      method set y = x &lt;- y
    end;;
</font><font color="maroon">val new_ref : 'a -&gt; &lt; get : 'a; set : 'a -&gt; unit &gt; = &lt;fun&gt;
</font></pre><p>
On the other hand, a class for polymorphic references must explicitly
list the type parameters in its declaration. Class type parameters are
listed between <tt>[</tt> and <tt>]</tt>. The type parameters must also be
bound somewhere in the class body by a type constraint.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] ref x_init =
    object
      val mutable x = (x_init : 'a)
      method get = x
      method set y = x &lt;- y
    end;;
<font color="maroon">class ['a] ref :
  'a -&gt; object val mutable x : 'a method get : 'a method set : 'a -&gt; unit end

</font><font color="black">#</font> let r = new ref 1 in r#set 2; (r#get);;
</font><font color="maroon">- : int = 2
</font></pre><p>
The type parameter in the declaration may actually be constrained in the
body of the class definition. In the class type, the actual value of
the type parameter is displayed in the <tt>constraint</tt> clause.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] ref_succ (x_init:'a) =
    object
      val mutable x = x_init + 1
      method get = x
      method set y = x &lt;- y
    end;;
</font><font color="maroon">class ['a] ref_succ :
  'a -&gt;
  object
    constraint 'a = int
    val mutable x : int
    method get : int
    method set : int -&gt; unit
  end
</font></pre><p>
Let us consider a more complex example: define a circle, whose center
may be any kind of point. We put an additional type
constraint in method <tt>move</tt>, since no free variables must remain
unaccounted for by the class type parameters.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] circle (c : 'a) =
    object
      val mutable center = c
      method center = center
      method set_center c = center &lt;- c
      method move = (center#move : int -&gt; unit)
    end;;
</font><font color="maroon">class ['a] circle :
  'a -&gt;
  object
    constraint 'a = &lt; move : int -&gt; unit; .. &gt;
    val mutable center : 'a
    method center : 'a
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</font></pre><p>
An alternate definition of <tt>circle</tt>, using a <tt>constraint</tt> clause in
the class definition, is shown below. The type <tt>#point</tt> used below in
the <tt>constraint</tt> clause is an abbreviation produced by the definition
of class <tt>point</tt>. This abbreviation unifies with the type of any
object belonging to a subclass of class <tt>point</tt>. It actually expands to
<tt>&lt; get_x : int; move : int -&gt; unit; .. &gt;</tt>. This leads to the following
alternate definition of <tt>circle</tt>, which has slightly stronger
constraints on its argument, as we now expect <tt>center</tt> to have a
method <tt>get_x</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] circle (c : 'a) =
    object
      constraint 'a = #point
      val mutable center = c
      method center = center
      method set_center c = center &lt;- c
      method move = center#move
    end;;
</font><font color="maroon">class ['a] circle :
  'a -&gt;
  object
    constraint 'a = #point
    val mutable center : 'a
    method center : 'a
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</font></pre><p>
The class <tt>colored_circle</tt> is a specialized version of class
<tt>circle</tt> that requires the type of the center to unify with
<tt>#colored_point</tt>, and adds a method <tt>color</tt>. Note that when specializing a
parameterized class, the instance of type parameter must always be
explicitly given. It is again written between <tt>[</tt> and <tt>]</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] colored_circle c =
    object
      constraint 'a = #colored_point
      inherit ['a] circle c
      method color = center#color
    end;;
</font><font color="maroon">class ['a] colored_circle :
  'a -&gt;
  object
    constraint 'a = #colored_point
    val mutable center : 'a
    method center : 'a
    method color : string
    method move : int -&gt; unit
    method set_center : 'a -&gt; unit
  end
</font></pre><h2 class="section"><a name="toc28"></a><a name="htoc29">11</a>&nbsp;&nbsp;Polymorphic methods</h2><p>

<a name="ss:polymorphic-methods"></a></p><p>While parameterized classes may be polymorphic in their contents, they
are not enough to allow polymorphism of method use.</p><p>A classical example is defining an iterator.
</p><pre><font color="black">#</font><font color="#006000"> List.fold_left;;
<font color="maroon">- : ('a -&gt; 'b -&gt; 'a) -&gt; 'a -&gt; 'b list -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> class ['a] intlist (l : int list) =
    object
      method empty = (l = [])
      method fold f (accu : 'a) = List.fold_left f accu l
    end;;
</font><font color="maroon">class ['a] intlist :
  int list -&gt;
  object method empty : bool method fold : ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a end
</font></pre><p>
At first look, we seem to have a polymorphic iterator, however this
does not work in practice.
</p><pre><font color="black">#</font><font color="#006000"> let l = new intlist [1; 2; 3];;
<font color="maroon">val l : '_a intlist = &lt;obj&gt;

</font><font color="black">#</font> l#fold (fun x y -&gt; x+y) 0;;
<font color="maroon">- : int = 6

</font><font color="black">#</font> l;;
<font color="maroon">- : int intlist = &lt;obj&gt;

</font><font color="black">#</font> l#fold (fun s x -&gt; <u>s</u> ^ string_of_int x ^ " ") "";;
</font><font color="maroon">Error: This expression has type int but an expression was expected of type
         string
</font></pre><p>
Our iterator works, as shows its first use for summation. However,
since objects themselves are not polymorphic (only their constructors
are), using the <tt>fold</tt> method fixes its type for this individual object.
Our next attempt to use it as a string iterator fails.</p><p>The problem here is that quantification was wrongly located: it is
not the class we want to be polymorphic, but the <tt>fold</tt> method.
This can be achieved by giving an explicitly polymorphic type in the
method definition.
</p><pre><font color="black">#</font><font color="#006000"> class intlist (l : int list) =
    object
      method empty = (l = [])
      method fold : 'a. ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a =
        fun f accu -&gt; List.fold_left f accu l
    end;;
<font color="maroon">class intlist :
  int list -&gt;
  object method empty : bool method fold : ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a end

</font><font color="black">#</font> let l = new intlist [1; 2; 3];;
<font color="maroon">val l : intlist = &lt;obj&gt;

</font><font color="black">#</font> l#fold (fun x y -&gt; x+y) 0;;
<font color="maroon">- : int = 6

</font><font color="black">#</font> l#fold (fun s x -&gt; s ^ string_of_int x ^ " ") "";;
</font><font color="maroon">- : string = "1 2 3 "
</font></pre><p>
As you can see in the class type shown by the compiler, while
polymorphic method types must be fully explicit in class definitions
(appearing immediately after the method name), quantified type
variables can be left implicit in class descriptions. Why require types
to be explicit? The problem is that <tt>(int -&gt; int -&gt; int) -&gt; int -&gt; int</tt> would also be a valid type for <tt>fold</tt>, and it happens to be
incompatible with the polymorphic type we gave (automatic
instantiation only works for toplevel types variables, not for inner
quantifiers, where it becomes an undecidable problem.) So the compiler
cannot choose between those two types, and must be helped.</p><p>However, the type can be completely omitted in the class definition if
it is already known, through inheritance or type constraints on self.
Here is an example of method overriding.
</p><pre><font color="black">#</font><font color="#006000"> class intlist_rev l =
    object
      inherit intlist l
      method fold f accu = List.fold_left f accu (List.rev l)
    end;;
</font></pre><p>
The following idiom separates description and definition.
</p><pre><font color="black">#</font><font color="#006000"> class type ['a] iterator =
    object method fold : ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b end;;

  class intlist l =
    object (self : int #iterator)
      method empty = (l = [])
      method fold f accu = List.fold_left f accu l
    end;;
</font></pre><p>
Note here the <tt>(self : int #iterator)</tt> idiom, which ensures that this
object implements the interface <tt>iterator</tt>.</p><p>Polymorphic methods are called in exactly the same way as normal
methods, but you should be aware of some limitations of type
inference. Namely, a polymorphic method can only be called if its
type is known at the call site. Otherwise, the method will be assumed
to be monomorphic, and given an incompatible type.
</p><pre><font color="black">#</font><font color="#006000"> let sum lst = lst#fold (fun x y -&gt; x+y) 0;;
<font color="maroon">val sum : &lt; fold : (int -&gt; int -&gt; int) -&gt; int -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> sum <u>l</u>;;
</font><font color="maroon">Error: This expression has type intlist
       but an expression was expected of type
         &lt; fold : (int -&gt; int -&gt; int) -&gt; int -&gt; 'a; .. &gt;
       Types for method fold are incompatible
</font></pre><p>
The workaround is easy: you should put a type constraint on the
parameter.
</p><pre><font color="black">#</font><font color="#006000"> let sum (lst : _ #iterator) = lst#fold (fun x y -&gt; x+y) 0;;
</font><font color="maroon">val sum : int #iterator -&gt; int = &lt;fun&gt;
</font></pre><p>
Of course the constraint may also be an explicit method type.
Only occurences of quantified variables are required.
</p><pre><font color="black">#</font><font color="#006000"> let sum lst =
    (lst : &lt; fold : 'a. ('a -&gt; _ -&gt; 'a) -&gt; 'a -&gt; 'a; .. &gt;)#fold (+) 0;;
</font><font color="maroon">val sum : &lt; fold : 'a. ('a -&gt; int -&gt; 'a) -&gt; 'a -&gt; 'a; .. &gt; -&gt; int = &lt;fun&gt;
</font></pre><p>Another use of polymorphic methods is to allow some form of implicit
subtyping in method arguments. We have already seen in section
<a href="#ss:inheritance">3.8</a> how some functions may be polymorphic in the
class of their argument. This can be extended to methods.
</p><pre><font color="black">#</font><font color="#006000"> class type point0 = object method get_x : int end;;
<font color="maroon">class type point0 = object method get_x : int end

</font><font color="black">#</font> class distance_point x =
    object
      inherit point x
      method distance : 'a. (#point0 as 'a) -&gt; int =
        fun other -&gt; abs (other#get_x - x)
    end;;
<font color="maroon">class distance_point :
  int -&gt;
  object
    val mutable x : int
    method distance : #point0 -&gt; int
    method get_offset : int
    method get_x : int
    method move : int -&gt; unit
  end

</font><font color="black">#</font> let p = new distance_point 3 in
  (p#distance (new point 8), p#distance (new colored_point 1 "blue"));;
</font><font color="maroon">- : int * int = (5, 2)
</font></pre><p>
Note here the special syntax <tt>(#point0 as 'a)</tt> we have to use to
quantify the extensible part of <tt>#point0</tt>. As for the variable binder,
it can be omitted in class specifications. If you want polymorphism
inside object field it must be quantified independently.
</p><pre><font color="black">#</font><font color="#006000"> class multi_poly =
    object
      method m1 : 'a. (&lt; n1 : 'b. 'b -&gt; 'b; .. &gt; as 'a) -&gt; _ =
        fun o -&gt; o#n1 true, o#n1 "hello"
      method m2 : 'a 'b. (&lt; n2 : 'b -&gt; bool; .. &gt; as 'a) -&gt; 'b -&gt; _ =
        fun o x -&gt; o#n2 x
    end;;
</font><font color="maroon">class multi_poly :
  object
    method m1 : &lt; n1 : 'b. 'b -&gt; 'b; .. &gt; -&gt; bool * string
    method m2 : &lt; n2 : 'b -&gt; bool; .. &gt; -&gt; 'b -&gt; bool
  end
</font></pre><p>
In method <tt>m1</tt>, <tt>o</tt> must be an object with at least a method <tt>n1</tt>,
itself polymorphic. In method <tt>m2</tt>, the argument of <tt>n2</tt> and <tt>x</tt> must
have the same type, which is quantified at the same level as <tt>'a</tt>.</p><h2 class="section"><a name="toc29"></a><a name="htoc30">12</a>&nbsp;&nbsp;Using coercions</h2><p>

<a name="ss:using-coercions"></a></p><p>Subtyping is never implicit. There are, however, two ways to perform
subtyping. The most general construction is fully explicit: both the
domain and the codomain of the type coercion must be given.</p><p>We have seen that points and colored points have incompatible types.
For instance, they cannot be mixed in the same list. However, a
colored point can be coerced to a point, hiding its <tt>color</tt> method:
</p><pre><font color="black">#</font><font color="#006000"> let colored_point_to_point cp = (cp : colored_point :&gt; point);;
<font color="maroon">val colored_point_to_point : colored_point -&gt; point = &lt;fun&gt;

</font><font color="black">#</font> let p = new point 3 and q = new colored_point 4 "blue";;
<font color="maroon">val p : point = &lt;obj&gt;
val q : colored_point = &lt;obj&gt;

</font><font color="black">#</font> let l = [p; (colored_point_to_point q)];;
</font><font color="maroon">val l : point list = [&lt;obj&gt;; &lt;obj&gt;]
</font></pre><p>
An object of type <tt>t</tt> can be seen as an object of type <tt>t'</tt>
only if <tt>t</tt> is a subtype of <tt>t'</tt>. For instance, a point cannot be
seen as a colored point.
</p><pre><font color="black">#</font> <font color="#006000"><u>(p : point :&gt; colored_point)</u>;;
</font><font color="maroon">Error: Type point = &lt; get_offset : int; get_x : int; move : int -&gt; unit &gt;
       is not a subtype of
         colored_point =
           &lt; color : string; get_offset : int; get_x : int;
             move : int -&gt; unit &gt; 
</font></pre><p>
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
</p><pre><font color="black">#</font><font color="#006000"> let to_point cp = (cp :&gt; point);;
</font><font color="maroon">val to_point : #point -&gt; point = &lt;fun&gt;
</font></pre><p>
In this case, the function <tt>colored_point_to_point</tt> is an instance of the
function <tt>to_point</tt>. This is not always true, however. The fully
explicit coercion is more precise and is sometimes unavoidable.
Consider, for example, the following class:
</p><pre><font color="black">#</font><font color="#006000"> class c0 = object method m = {&lt; &gt;} method n = 0 end;;
</font><font color="maroon">class c0 : object ('a) method m : 'a method n : int end
</font></pre><p>
The object type <tt>c0</tt> is an abbreviation for <tt>&lt;m : 'a; n : int&gt; as 'a</tt>.
Consider now the type declaration:
</p><pre><font color="black">#</font><font color="#006000"> class type c1 =  object method m : c1 end;;
</font><font color="maroon">class type c1 = object method m : c1 end
</font></pre><p>
The object type <tt>c1</tt> is an abbreviation for the type <tt>&lt;m : 'a&gt; as 'a</tt>.
The coercion from an object of type <tt>c0</tt> to an object of type <tt>c1</tt> is
correct:
</p><pre><font color="black">#</font><font color="#006000"> fun (x:c0) -&gt; (x : c0 :&gt; c1);;
</font><font color="maroon">- : c0 -&gt; c1 = &lt;fun&gt;
</font></pre><p>
However, the domain of the coercion cannot always be omitted.
In that case, the solution is to use the explicit form.
Sometimes, a change in the class-type definition can also solve the problem
</p><pre><font color="black">#</font><font color="#006000"> class type c2 = object ('a) method m : 'a end;;
<font color="maroon">class type c2 = object ('a) method m : 'a end

</font><font color="black">#</font> fun (x:c0) -&gt; (x :&gt; c2);;
</font><font color="maroon">- : c0 -&gt; c2 = &lt;fun&gt;
</font></pre><p>
While class types <tt>c1</tt> and <tt>c2</tt> are different, both object types
<tt>c1</tt> and <tt>c2</tt> expand to the same object type (same method names and types).
Yet, when the domain of a coercion is left implicit and its co-domain
is an abbreviation of a known class type, then the class type, rather
than the object type, is used to derive the coercion function. This
allows leaving the domain implicit in most cases when coercing form a
subclass to its superclass.
The type of a coercion can always be seen as below:
</p><pre><font color="black">#</font><font color="#006000"> let to_c1 x = (x :&gt; c1);;
<font color="maroon">val to_c1 : &lt; m : #c1; .. &gt; -&gt; c1 = &lt;fun&gt;

</font><font color="black">#</font> let to_c2 x = (x :&gt; c2);;
</font><font color="maroon">val to_c2 : #c2 -&gt; c2 = &lt;fun&gt;
</font></pre><p>
Note the difference between these two coercions: in the case of <tt>to_c2</tt>,
the type
<tt>#c2 = &lt; m : 'a; .. &gt; as 'a</tt> is polymorphically recursive (according
to the explicit recursion in the class type of <tt>c2</tt>); hence the
success of applying this coercion to an object of class <tt>c0</tt>.
On the other hand, in the first case, <tt>c1</tt> was only expanded and
unrolled twice to obtain <tt>&lt; m : &lt; m : c1; .. &gt;; .. &gt;</tt> (remember <tt>#c1 = &lt; m : c1; .. &gt;</tt>), without introducing recursion.
You may also note that the type of <tt>to_c2</tt> is <tt>#c2 -&gt; c2</tt> while
the type of <tt>to_c1</tt> is more general than <tt>#c1 -&gt; c1</tt>. This is not always true,
since there are class types for which some instances of <tt>#c</tt> are not subtypes
of <tt>c</tt>, as explained in section&nbsp;<a href="#ss:binary-methods">3.16</a>. Yet, for
parameterless classes the coercion <tt>(_ :&gt; c)</tt> is always more general than
<tt>(_ : #c :&gt; c)</tt>.
</p><p>A common problem may occur when one tries to define a coercion to a
class <tt>c</tt> while defining class <tt>c</tt>. The problem is due to the type
abbreviation not being completely defined yet, and so its subtypes are not
clearly known. Then, a coercion <tt>(_ :&gt; c)</tt> or <tt>(_ : #c :&gt; c)</tt> is taken to be
the identity function, as in
</p><pre><font color="black">#</font><font color="#006000"> function x -&gt; (x :&gt; 'a);;
</font><font color="maroon">- : 'a -&gt; 'a = &lt;fun&gt;
</font></pre><p>
As a consequence, if the coercion is applied to <tt>self</tt>, as in the
following example, the type of <tt>self</tt> is unified with the closed type
<tt>c</tt> (a closed object type is an object type without ellipsis). This
would constrain the type of self be closed and is thus rejected.
Indeed, the type of self cannot be closed: this would prevent any
further extension of the class. Therefore, a type error is generated
when the unification of this type with another type would result in a
closed object type.
</p><pre><font color="black">#</font><font color="#006000"> class c = object method m = 1 end
  and d = object (self)
    inherit c
    method n = 2
    method as_c = (<u>self</u> :&gt; c)
  end;;
</font><font color="maroon">Error: This expression cannot be coerced to type c = &lt; m : int &gt;; it has type
         &lt; as_c : c; m : int; n : int; .. &gt;
       but is here used with type c
       Self type cannot be unified with a closed object type
</font></pre><p>
However, the most common instance of this problem, coercing self to
its current class, is detected as a special case by the type checker,
and properly typed.
</p><pre><font color="black">#</font><font color="#006000"> class c = object (self) method m = (self :&gt; c) end;;
</font><font color="maroon">class c : object method m : c end
</font></pre><p>
This allows the following idiom, keeping a list of all objects
belonging to a class or its subclasses:
</p><pre><font color="black">#</font><font color="#006000"> let all_c = ref [];;
<font color="maroon">val all_c : '_a list ref = {contents = []}

</font><font color="black">#</font> class c (m : int) =
    object (self)
      method m = m
      initializer all_c := (self :&gt; c) :: !all_c
    end;;
</font><font color="maroon">class c : int -&gt; object method m : int end
</font></pre><p>
This idiom can in turn be used to retrieve an object whose type has
been weakened:
</p><pre><font color="black">#</font><font color="#006000"> let rec lookup_obj obj = function [] -&gt; raise Not_found
    | obj' :: l -&gt;
       if (obj :&gt; &lt; &gt;) = (obj' :&gt; &lt; &gt;) then obj' else lookup_obj obj l ;;
<font color="maroon">val lookup_obj : &lt; .. &gt; -&gt; (&lt; .. &gt; as 'a) list -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> let lookup_c obj = lookup_obj obj !all_c;;
</font><font color="maroon">val lookup_c : &lt; .. &gt; -&gt; &lt; m : int &gt; = &lt;fun&gt;
</font></pre><p>
The type <tt>&lt; m : int &gt;</tt> we see here is just the expansion of <tt>c</tt>, due
to the use of a reference; we have succeeded in getting back an object
of type <tt>c</tt>.</p><p><br>
The previous coercion problem can often be avoided by first
defining the abbreviation, using a class type:
</p><pre><font color="black">#</font><font color="#006000"> class type c' = object method m : int end;;
<font color="maroon">class type c' = object method m : int end

</font><font color="black">#</font> class c : c' = object method m = 1 end
  and d = object (self)
    inherit c
    method n = 2
    method as_c = (self :&gt; c')
  end;;
</font><font color="maroon">class c : c'
and d : object method as_c : c' method m : int method n : int end
</font></pre><p>
It is also possible to use a virtual class. Inheriting from this class
simultaneously forces all methods of <tt>c</tt> to have the same
type as the methods of <tt>c'</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class virtual c' = object method virtual m : int end;;
<font color="maroon">class virtual c' : object method virtual m : int end

</font><font color="black">#</font> class c = object (self) inherit c' method m = 1 end;;
</font><font color="maroon">class c : object method m : int end
</font></pre><p>
One could think of defining the type abbreviation directly:
</p><pre><font color="black">#</font><font color="#006000"> type c' = &lt;m : int&gt;;;
</font></pre><p>
However, the abbreviation <tt>#c'</tt> cannot be defined directly in a similar way.
It can only be defined by a class or a class-type definition.
This is because a <tt>#</tt>-abbreviation carries an implicit anonymous
variable <tt>..</tt> that cannot be explicitly named.
The closer you get to it is:
</p><pre><font color="black">#</font><font color="#006000"> type 'a c'_class = 'a constraint 'a = &lt; m : int; .. &gt;;;
</font></pre><p>
with an extra type variable capturing the open object type.</p><h2 class="section"><a name="toc30"></a><a name="htoc31">13</a>&nbsp;&nbsp;Functional objects</h2><p>

<a name="ss:functional-objects"></a></p><p>It is possible to write a version of class <tt>point</tt> without assignments
on the instance variables. The override construct <tt>{&lt; ... &gt;}</tt> returns a copy of
“self” (that is, the current object), possibly changing the value of
some instance variables.
</p><pre><font color="black">#</font><font color="#006000"> class functional_point y =
    object
      val x = y
      method get_x = x
      method move d = {&lt; x = x + d &gt;}
    end;;
<font color="maroon">class functional_point :
  int -&gt;
  object ('a) val x : int method get_x : int method move : int -&gt; 'a end

</font><font color="black">#</font> let p = new functional_point 7;;
<font color="maroon">val p : functional_point = &lt;obj&gt;

</font><font color="black">#</font> p#get_x;;
<font color="maroon">- : int = 7

</font><font color="black">#</font> (p#move 3)#get_x;;
<font color="maroon">- : int = 10

</font><font color="black">#</font> p#get_x;;
</font><font color="maroon">- : int = 7
</font></pre><p>
Note that the type abbreviation <tt>functional_point</tt> is recursive, which can
be seen in the class type of <tt>functional_point</tt>: the type of self is <tt>'a</tt>
and <tt>'a</tt> appears inside the type of the method <tt>move</tt>.</p><p>The above definition of <tt>functional_point</tt> is not equivalent
to the following:
</p><pre><font color="black">#</font><font color="#006000"> class bad_functional_point y =
    object
      val x = y
      method get_x = x
      method move d = new bad_functional_point (x+d)
    end;;
</font><font color="maroon">class bad_functional_point :
  int -&gt;
  object
    val x : int
    method get_x : int
    method move : int -&gt; bad_functional_point
  end
</font></pre><p>
While objects of either class will behave the same, objects of their
subclasses will be different. In a subclass of <tt>bad_functional_point</tt>,
the method <tt>move</tt> will
keep returning an object of the parent class. On the contrary, in a
subclass of <tt>functional_point</tt>, the method <tt>move</tt> will return an
object of the subclass.</p><p>Functional update is often used in conjunction with binary methods
as illustrated in section <a href="manual007.html#module:string">5.2.1</a>.</p><h2 class="section"><a name="toc31"></a><a name="htoc32">14</a>&nbsp;&nbsp;Cloning objects</h2><p>

<a name="ss:cloning-objects"></a></p><p>Objects can also be cloned, whether they are functional or imperative.
The library function <tt>Oo.copy</tt> makes a shallow copy of an object. That is,
it returns a new object that has the same methods and instance
variables as its argument. The
instance variables are copied but their contents are shared.
Assigning a new value to an instance variable of the copy (using a method
call) will not affect instance variables of the original, and conversely.
A deeper assignment (for example if the instance variable is a reference cell)
will of course affect both the original and the copy.</p><p>The type of <tt>Oo.copy</tt> is the following:
</p><pre><font color="black">#</font><font color="#006000"> Oo.copy;;
</font><font color="maroon">- : (&lt; .. &gt; as 'a) -&gt; 'a = &lt;fun&gt;
</font></pre><p>
The keyword <tt>as</tt> in that type binds the type variable <tt>'a</tt> to
the object type <tt>&lt; .. &gt;</tt>. Therefore, <tt>Oo.copy</tt> takes an object with
any methods (represented by the ellipsis), and returns an object of
the same type. The type of <tt>Oo.copy</tt> is different from type <tt>&lt; .. &gt; -&gt; &lt; .. &gt;</tt> as each ellipsis represents a different set of methods.
Ellipsis actually behaves as a type variable.
</p><pre><font color="black">#</font><font color="#006000"> let p = new point 5;;
<font color="maroon">val p : point = &lt;obj&gt;

</font><font color="black">#</font> let q = Oo.copy p;;
<font color="maroon">val q : point = &lt;obj&gt;

</font><font color="black">#</font> q#move 7; (p#get_x, q#get_x);;
</font><font color="maroon">- : int * int = (5, 12)
</font></pre><p>
In fact, <tt>Oo.copy p</tt> will behave as <tt>p#copy</tt> assuming that a public
method <tt>copy</tt> with body <tt>{&lt; &gt;}</tt> has been defined in the class of <tt>p</tt>.</p><p>Objects can be compared using the generic comparison functions <tt>=</tt> and <tt>&lt;&gt;</tt>.
Two objects are equal if and only if they are physically equal. In
particular, an object and its copy are not equal.
</p><pre><font color="black">#</font><font color="#006000"> let q = Oo.copy p;;
<font color="maroon">val q : point = &lt;obj&gt;

</font><font color="black">#</font> p = q, p = p;;
</font><font color="maroon">- : bool * bool = (false, true)
</font></pre><p>
Other generic comparisons such as (<tt>&lt;</tt>, <tt>&lt;=</tt>, ...) can also be used on
objects. The
relation <tt>&lt;</tt> defines an unspecified but strict ordering on objets. The
ordering relationship between two objects is fixed once for all after the
two objects have been created and it is not affected by mutation of fields.</p><p>Cloning and override have a non empty intersection.
They are interchangeable when used within an object and without
overriding any field:
</p><pre><font color="black">#</font><font color="#006000"> class copy =
    object
      method copy = {&lt; &gt;}
    end;;
<font color="maroon">class copy : object ('a) method copy : 'a end

</font><font color="black">#</font> class copy =
    object (self)
      method copy = Oo.copy self
    end;;
</font><font color="maroon">class copy : object ('a) method copy : 'a end
</font></pre><p>
Only the override can be used to actually override fields, and
only the <tt>Oo.copy</tt> primitive can be used externally.</p><p>Cloning can also be used to provide facilities for saving and
restoring the state of objects.
</p><pre><font color="black">#</font><font color="#006000"> class backup =
    object (self : 'mytype)
      val mutable copy = None
      method save = copy &lt;- Some {&lt; copy = None &gt;}
      method restore = match copy with Some x -&gt; x | None -&gt; self
    end;;
</font><font color="maroon">class backup :
  object ('a)
    val mutable copy : 'a option
    method restore : 'a
    method save : unit
  end
</font></pre><p>
The above definition will only backup one level.
The backup facility can be added to any class by using multiple inheritance.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] backup_ref x = object inherit ['a] ref x inherit backup end;;
<font color="maroon">class ['a] backup_ref :
  'a -&gt;
  object ('b)
    val mutable copy : 'b option
    val mutable x : 'a
    method get : 'a
    method restore : 'b
    method save : unit
    method set : 'a -&gt; unit
  end

</font><font color="black">#</font> let rec get p n = if n = 0 then p # get else get (p # restore) (n-1);;
<font color="maroon">val get : (&lt; get : 'b; restore : 'a; .. &gt; as 'a) -&gt; int -&gt; 'b = &lt;fun&gt;

</font><font color="black">#</font> let p = new backup_ref 0  in
  p # save; p # set 1; p # save; p # set 2;
  [get p 0; get p 1; get p 2; get p 3; get p 4];;
</font><font color="maroon">- : int list = [2; 1; 1; 1; 1]
</font></pre><p>
We can define a variant of backup that retains all copies. (We also
add a method <tt>clear</tt> to manually erase all copies.)
</p><pre><font color="black">#</font><font color="#006000"> class backup =
    object (self : 'mytype)
      val mutable copy = None
      method save = copy &lt;- Some {&lt; &gt;}
      method restore = match copy with Some x -&gt; x | None -&gt; self
      method clear = copy &lt;- None
    end;;
</font><font color="maroon">class backup :
  object ('a)
    val mutable copy : 'a option
    method clear : unit
    method restore : 'a
    method save : unit
  end
</font></pre><pre><font color="black">#</font><font color="#006000"> class ['a] backup_ref x = object inherit ['a] ref x inherit backup end;;
<font color="maroon">class ['a] backup_ref :
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

</font><font color="black">#</font> let p = new backup_ref 0  in
  p # save; p # set 1; p # save; p # set 2;
  [get p 0; get p 1; get p 2; get p 3; get p 4];;
</font><font color="maroon">- : int list = [2; 1; 0; 0; 0]
</font></pre><h2 class="section"><a name="toc32"></a><a name="htoc33">15</a>&nbsp;&nbsp;Recursive classes</h2><p>

<a name="ss:recursive-classes"></a></p><p>Recursive classes can be used to define objects whose types are
mutually recursive.
</p><pre><font color="black">#</font><font color="#006000"> class window =
    object
      val mutable top_widget = (None : widget option)
      method top_widget = top_widget
    end
  and widget (w : window) =
    object
      val window = w
      method window = window
    end;;
</font><font color="maroon">class window :
  object
    val mutable top_widget : widget option
    method top_widget : widget option
  end
and widget : window -&gt; object val window : window method window : window end
</font></pre><p>
Although their types are mutually recursive, the classes <tt>widget</tt> and
<tt>window</tt> are themselves independent.</p><h2 class="section"><a name="toc33"></a><a name="htoc34">16</a>&nbsp;&nbsp;Binary methods</h2><p>

<a name="ss:binary-methods"></a></p><p>A binary method is a method which takes an argument of the same type
as self. The class <tt>comparable</tt> below is a template for classes with a
binary method <tt>leq</tt> of type <tt>'a -&gt; bool</tt> where the type variable <tt>'a</tt>
is bound to the type of self. Therefore, <tt>#comparable</tt> expands to <tt>&lt; leq : 'a -&gt; bool; .. &gt; as 'a</tt>. We see here that the binder <tt>as</tt> also
allows writing recursive types.
</p><pre><font color="black">#</font><font color="#006000"> class virtual comparable =
    object (_ : 'a)
      method virtual leq : 'a -&gt; bool
    end;;
</font><font color="maroon">class virtual comparable : object ('a) method virtual leq : 'a -&gt; bool end
</font></pre><p>
We then define a subclass <tt>money</tt> of <tt>comparable</tt>. The class <tt>money</tt>
simply wraps floats as comparable objects. We will extend it below with
more operations. We have to use a type constraint on the class parameter <tt>x</tt>
because the primitive <tt>&lt;=</tt> is a polymorphic function in
OCaml. The <tt>inherit</tt> clause ensures that the type of objects
of this class is an instance of <tt>#comparable</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class money (x : float) =
    object
      inherit comparable
      val repr = x
      method value = repr
      method leq p = repr &lt;= p#value
    end;;
</font><font color="maroon">class money :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method value : float
  end
</font></pre><p>
Note that the type <tt>money</tt> is not a subtype of type
<tt>comparable</tt>, as the self type appears in contravariant position
in the type of method <tt>leq</tt>.
Indeed, an object <tt>m</tt> of class <tt>money</tt> has a method <tt>leq</tt>
that expects an argument of type <tt>money</tt> since it accesses
its <tt>value</tt> method. Considering <tt>m</tt> of type <tt>comparable</tt> would allow a
call to method <tt>leq</tt> on <tt>m</tt> with an argument that does not have a method
<tt>value</tt>, which would be an error.</p><p>Similarly, the type <tt>money2</tt> below is not a subtype of type <tt>money</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class money2 x =
    object
      inherit money x
      method times k = {&lt; repr = k *. repr &gt;}
    end;;
</font><font color="maroon">class money2 :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method times : float -&gt; 'a
    method value : float
  end
</font></pre><p>
It is however possible to define functions that manipulate objects of
type either <tt>money</tt> or <tt>money2</tt>: the function <tt>min</tt>
will return the minimum of any two objects whose type unifies with
<tt>#comparable</tt>. The type of <tt>min</tt> is not the same as <tt>#comparable -&gt; #comparable -&gt; #comparable</tt>, as the abbreviation <tt>#comparable</tt> hides a
type variable (an ellipsis). Each occurrence of this abbreviation
generates a new variable.
</p><pre><font color="black">#</font><font color="#006000"> let min (x : #comparable) y =
    if x#leq y then x else y;;
</font><font color="maroon">val min : (#comparable as 'a) -&gt; 'a -&gt; 'a = &lt;fun&gt;
</font></pre><p>
This function can be applied to objects of type <tt>money</tt>
or <tt>money2</tt>.
</p><pre><font color="black">#</font><font color="#006000"> (min (new money  1.3) (new money 3.1))#value;;
<font color="maroon">- : float = 1.3

</font><font color="black">#</font> (min (new money2 5.0) (new money2 3.14))#value;;
</font><font color="maroon">- : float = 3.14
</font></pre><p>More examples of binary methods can be found in sections
<a href="manual007.html#module:string">5.2.1</a> and <a href="manual007.html#module:set">5.2.3</a>.</p><p>Note the use of override for method <tt>times</tt>.
Writing <tt>new money2 (k *. repr)</tt> instead of <tt>{&lt; repr = k *. repr &gt;}</tt>
would not behave well with inheritance: in a subclass <tt>money3</tt> of <tt>money2</tt>
the <tt>times</tt> method would return an object of class <tt>money2</tt> but not of class
<tt>money3</tt> as would be expected.</p><p>The class <tt>money</tt> could naturally carry another binary method. Here is a
direct definition:
</p><pre><font color="black">#</font><font color="#006000"> class money x =
    object (self : 'a)
      val repr = x
      method value = repr
      method print = print_float repr
      method times k = {&lt; repr = k *. x &gt;}
      method leq (p : 'a) = repr &lt;= p#value
      method plus (p : 'a) = {&lt; repr = x +. p#value &gt;}
    end;;
</font><font color="maroon">class money :
  float -&gt;
  object ('a)
    val repr : float
    method leq : 'a -&gt; bool
    method plus : 'a -&gt; 'a
    method print : unit
    method times : float -&gt; 'a
    method value : float
  end
</font></pre><h2 class="section"><a name="toc34"></a><a name="htoc35">17</a>&nbsp;&nbsp;Friends</h2><p>

<a name="ss:friends"></a></p><p>The above class <tt>money</tt> reveals a problem that often occurs with binary
methods. In order to interact with other objects of the same class, the
representation of <tt>money</tt> objects must be revealed, using a method such as
<tt>value</tt>. If we remove all binary methods (here <tt>plus</tt> and <tt>leq</tt>),
the representation can easily be hidden inside objects by removing the method
<tt>value</tt> as well. However, this is not possible as soon as some binary
method requires access to the representation of objects of the same
class (other than self).
</p><pre><font color="black">#</font><font color="#006000"> class safe_money x =
    object (self : 'a)
      val repr = x
      method print = print_float repr
      method times k = {&lt; repr = k *. x &gt;}
    end;;
</font><font color="maroon">class safe_money :
  float -&gt;
  object ('a)
    val repr : float
    method print : unit
    method times : float -&gt; 'a
  end
</font></pre><p>
Here, the representation of the object is known only to a particular object.
To make it available to other objects of the same class, we are forced to
make it available to the whole world. However we can easily restrict the
visibility of the representation using the module system.
</p><pre><font color="black">#</font><font color="#006000"> module type MONEY =
    sig
      type t
      class c : float -&gt;
        object ('a)
          val repr : t
          method value : t
          method print : unit
          method times : float -&gt; 'a
          method leq : 'a -&gt; bool
          method plus : 'a -&gt; 'a
        end
    end;;

  module Euro : MONEY =
    struct
      type t = float
      class c x =
        object (self : 'a)
          val repr = x
          method value = repr
          method print = print_float repr
          method times k = {&lt; repr = k *. x &gt;}
          method leq (p : 'a) = repr &lt;= p#value
          method plus (p : 'a) = {&lt; repr = x +. p#value &gt;}
        end
    end;;
</font></pre><p>
Another example of friend functions may be found in section
<a href="manual007.html#module:set">5.2.3</a>. These examples occur when a group of objects (here
objects of the same class) and functions should see each others internal
representation, while their representation should be hidden from the
outside. The solution is always to define all friends in the same module,
give access to the representation and use a signature constraint to make the
representation abstract outside the module.</p><hr>





<i class="authors">(Tutorial written by Jérôme Vouillon, Didier Rémy and Jacques Garrigue)</i><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>