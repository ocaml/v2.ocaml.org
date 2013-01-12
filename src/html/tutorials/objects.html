<head>
  <title>Objects</title>
<body>

<h1>Objects</h1>

<h2><a name="Objects_and_classes"></a>Objects and classes</h2>

<p>OCaml is an object-oriented, imperative, functional programming language :-) It mixes all these paradigms and lets you use the most appropriate (or most familiar) programming paradigm for the task at hand. In this chapter I'm going to look at object-oriented programming in OCaml, but I'm also going to talk about why you might or might not want to write object-oriented programs.</p>
<p>The classic noddy example used in text books to demonstrate object-oriented programming is the stack class. This is a pretty terrible example in many ways, but I'm going to use it here to show the basics of writing object-oriented OCaml.</p>
<p>Here's some basic code to provide a stack of integers. The class is implemented using a linked list.</p>
<pre ml:content="ocaml">
  class stack_of_ints =
    object (self)
      val mutable the_list = ( [] : int list )   (* instance variable *)
      method push x =                        (* push method *)
        the_list &lt;- x :: the_list
      method pop =                           (* pop method *)
        let result = List.hd the_list in
        the_list &lt;- List.tl the_list;
        result
      method peek =                          (* peek method *)
        List.hd the_list
      method size =                          (* size method *)
        List.length the_list
    end
</pre>

<p>The basic pattern <code>class <em>name</em> = object (self) ... end</code> defines a class called <code><em>name</em></code>.</p>
<p>The class has one instance variable, which is mutable (not constant), called <code>the_list</code>. This is the underlying linked list. We initialize this (each time a <code>stack_of_ints</code> object is created) using a bit of code that you may not be familiar with. The expression <code>( [] : int list )</code> means &quot;an empty list, of type <code>int list</code>&quot;. Recall that the simple empty list <code>[]</code> has type <code>'a list</code>, meaning a list of any type. However we want a stack of <code>int</code>, not anything else, and so in this case we want to tell the type inference engine that this list isn't the general &quot;list of anything&quot; but is in fact the narrower &quot;list of <code>int</code>&quot;. The syntax <code>( <em>expression</em> : <em>type</em> )</code> means <code><em>expression</em></code> which is in fact of type <code><em>type</em></code>. This <em>isn't</em> a  general type cast, because you can't use it to overrule the type inference engine, only to narrow a general type to make it more specific. So you can't write, for example, <code>( 1 : float )</code>:</p>
<pre ml:content="ocaml">
(1 : float);;
</pre>

<p>Type safety is preserved. Back to the example ...</p>
<p>This class has four simple methods. <code>push</code> pushes an integer onto the stack. <code>pop</code> pops the top integer off the stack and returns it. Notice the <code>&lt;-</code> assignment operator used for updating our mutable instance variable. It's the same <code>&lt;-</code> assignment operator which is used for updating mutable fields in records.</p>
<p><code>peek</code> returns the top of the stack (ie. head of the list) without affecting the stack, while <code>size</code> returns the number of elements in the stack (ie. the length of the list).</p>
<p>Let's write some code to test stacks of ints. First let's create a new object. We use the familiar <code>new</code> operator:</p>
<pre ml:content="ocaml silent">
  let s = new stack_of_ints
</pre>

<p>Now we'll push and pop some elements off the stack:</p>
<pre ml:content="ocaml">
  for i = 1 to 10 do
    s#push i
  done;;
  while s#size &gt; 0 do
    Printf.printf &quot;Popped %d off the stack.\n&quot; s#pop
  done;;
</pre>

<p>Notice the syntax. <code>object#method</code> means call <code>method</code> on <code>object</code>. This is the same as <code>object.method</code> or <code>object-&gt;method</code> that you will be familiar with in imperative languages.</p>

<p>In the OCaml toplevel we can examine the types of objects and methods in more detail:</p>
<pre ml:content="ocaml">
  let s = new stack_of_ints;;
  s#push;;
</pre>

<p><code>s</code> is an opaque object. The implementation (ie. the list) is hidden from callers.</p>

<h3>Polymorphic classes</h3>
<p>A stack of integers is good, but what about a stack that can store any type? (Not a single stack that can store a mixture of types, but multiple stacks each storing objects of any single type). As with <code>'a list</code>, we can define <code>'a stack</code>:</p>
<pre ml:content="ocaml">
  class ['a] stack =
    object (self)
      val mutable list = ( [] : 'a list )    (* instance variable *)
      method push x =                        (* push method *)
        list &lt;- x :: list
      method pop =                           (* pop method *)
        let result = List.hd list in
        list &lt;- List.tl list;
        result
      method peek =                          (* peek method *)
        List.hd list
      method size =                          (* size method *)
        List.length list
    end
</pre>

<p>The <code>class ['a] stack</code> doesn't really define just one class, but a whole &quot;class of classes&quot;, one for every possible type (ie. an infinitely large number of classes!) Let's try and use our <code>'a stack</code> class. In this instance we create a stack and push a floating point number onto the stack. Notice the type of the stack:</p>
<pre ml:content="ocaml">
let s = new stack;;
s#push 1.0;;
s;;
</pre>

<p>This stack is now a <code>float stack</code>, and only floating point numbers may be pushed and popped from this stack. (For an explanation of the <code>'_a</code> notation, see the <a href="http://caml.inria.fr/FAQ/FAQ_EXPERT-eng.html" class="external" title="http://caml.inria.fr/FAQ/FAQ_EXPERT-eng.html">OCaml expert FAQ</a> ; link replaced by <a href="http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html" class="external" title="http://caml.inria.fr/pub/old_caml_site/FAQ/FAQ_EXPERT-eng.html">OCaml expert FAQ</a>). Let's demonstrate the type-safety of our new <code>float stack</code>:</p>
<pre ml:content="ocaml">
s#push 3.0;;
s#pop;;
s#pop;;
s#push &quot;a string&quot;;;
</pre>

<p>We can define polymorphic functions which can operate on any type of stack. Our first attempt is this one:</p>
<pre ml:content="ocaml">
  let drain_stack s =
    while s#size &gt; 0 do
      ignore (s#pop)
    done
</pre>

<p>Notice the type of <code>drain_stack</code>. Cleverly - perhaps <em>too</em> cleverly - OCaml's type inference engine has worked out that <code>drain_stack</code> works on <em>any</em> object which has <code>pop</code> and <code>size</code> methods! So if we defined another, entirely separate class which happened to contain <code>pop</code> and <code>size</code> methods with suitable type signatures, then we might accidentally call <code>drain_stack</code> on objects of that other type.</p>
<p>We can force OCaml to be more specific and only allow <code>drain_stack</code> to be called on <code>'a stack</code>s by narrowing the type of the <code>s</code> argument, like this:</p>
<pre ml:content="ocaml">
  let drain_stack (s : 'a stack) =
    while s#size &gt; 0 do
      ignore (s#pop)
    done
</pre>

<h3>Inheritance, virtual classes, initializers</h3>
<p>I've noticed programmers in Java tend to overuse inheritance, possibly because it's the only reasonable way of extending code in that language. A much better and more general way to extend code is usually to use hooks (cf. Apache's module API). Nevertheless in certain narrow areas inheritance can be useful, and the most important of these is in writing GUI widget libraries.</p>
<p>Let's consider an imaginary OCaml widget library similar to Java's Swing. We will define buttons and labels with the following class hierarchy:</p>
<pre>
widget  (superclass for all widgets)
  |
  +----&gt; container  (any widget that can contain other widgets)
  |        |
  |        +----&gt; button
  |
  +-------------&gt; label
</pre>

<p>(Notice that a <code>button</code> is a <code>container</code> because it can contain either a label or an image, depending on what is displayed on the button).</p>
<p><code>widget</code> is the virtual superclass for all widgets. I want every widget to have a name (just a string) which is constant over the life of that widget. This was my first attempt:</p>
<pre ml:content="ocaml">
  class virtual widget name =
    object (self)
      method get_name =
        name
      method virtual repaint : unit
    end
</pre>

<p>Oops! I forgot that OCaml cannot infer the type of <code>name</code> so will assume that it is <code>'a</code>. But that defines a polymorphic class, and I didn't declare the class as polymorphic (<code>class ['a] widget</code>). I need to narrow the type of <code>name</code> like this:</p>
<pre ml:content="ocaml">
  class virtual widget (name : string) =
    object (self)
      method get_name =
        name
      method virtual repaint : unit
    end
</pre>

<p>Now there are several new things going on in this code. Firstly the class contains an <strong>initializer</strong>. This is an argument to the class (<code>name</code>) which you can think of as exactly the equivalent of an argument to a constructor in, eg., Java:</p>
<pre>
public class Widget
{
  public Widget (String name)
  {
    ...
  }
}
</pre>

<p>In OCaml a constructor constructs the whole class, it's not just a specially named function, so we write the arguments as if they are arguments to the class:</p>
<pre ml:content="ocaml noeval">
class foo arg1 arg2 ... =
</pre>

<p>Secondly the class contains a virtual method, and thus the whole class is marked as virtual. The virtual method is our <code>repaint</code> method. We need to tell OCaml it's virtual (<code>method virtual</code>), <em>and</em> we need to tell OCaml the type of the method. Because the method doesn't contain any code, OCaml can't use type inference to automatically work out the type for you, so you need to tell it the type. In this case the method just returns <code>unit</code>. If your class contains any virtual methods (even just inherited ones) then you need to specify the whole class as virtual by using <code>class virtual ...</code>.</p>
<p>As in C++ and Java, virtual classes cannot be directly instantiated using <code>new</code>:</p>
<pre ml:content="ocaml">
let w = new widget &quot;my widget&quot;
</pre>

<p>Now my <code>container</code> class is more interesting. It must inherit from <code>widget</code> and have the mechanics for storing the list of contained widgets. Here is my simple implementation for <code>container</code>:</p>
<pre ml:content="ocaml">
  class virtual container name =
    object (self)
      inherit widget name
      val mutable widgets = ( [] : widget list )
      method add w =
        widgets &lt;- w :: widgets
      method get_widgets =
        widgets
      method repaint =
        List.iter (fun w -&gt; w#repaint) widgets
    end
</pre>

<p>Notes:</p>
<ol><li>The <code>container</code> class is marked as virtual. It doesn't contain any virtual methods, but in this case I just want to prevent people creating containers directly.</li>
<li>The <code>container</code> class has a <code>name</code> argument which is passed directly up when constructing the <code>widget</code>.</li>
<li><code>inherit widget name</code> means that the <code>container</code> inherits from <code>widget</code>, and it passes the <code>name</code> argument to the constructor for <code>widget</code>.</li>
<li>My <code>container</code> contains a mutable list of widgets and methods to <code>add</code> a widget to this list and <code>get_widgets</code> (return the list of widgets).</li>
<li>The list of widgets returned by <code>get_widgets</code> cannot be modified by code outside the class. The reason for this is somewhat subtle, but basically comes down to the fact that OCaml's linked lists are immutable. Let's imagine that someone wrote this code:</li></ol>
<pre ml:content="ocaml noeval">
let list = container#get_widgets in
x :: list
</pre>

<p>Would this modify the private internal representation of my <code>container</code> class, by prepending <code>x</code> to the list of widgets? No it wouldn't. The private variable <code>widgets</code> would be unaffected by this or any other change attempted by the outside code. This means, for example, that you could change the internal representation to use an array at some later date, and no code outside the class would need to be changed.</p>
<p>Last, but not least, we have implemented the previously virtual <code>repaint</code> function so that <code>container#repaint</code> will repaint all of the contained widgets. Notice I use <code>List.iter</code> to iterate over the list, and I also use a probably unfamiliar anonymous function expression:</p>
<pre ml:content="ocaml noeval">
(fun w -&gt; w#repaint)
</pre>

<p>which defines an anonymous function with one argument <code>w</code> that just calls <code>w#repaint</code> (the <code>repaint</code> method on widget <code>w</code>).</p>
<p>In this instance our <code>button</code> class is simple (rather unrealistically simple in fact, but nevermind that):</p>
<pre ml:content="ocaml">
  type button_state = Released | Pressed;;

  class button ?callback name =
    object (self)
      inherit container name as super
      val mutable state = Released
      method press =
        state &lt;- Pressed;
        match callback with
        | None -&gt; ()
        | Some f -&gt; f ()
      method release =
        state &lt;- Released
      method repaint =
        super#repaint;
        print_endline (&quot;Button being repainted, state is &quot; ^
                       (match state with
                        | Pressed -&gt; &quot;Pressed&quot;
                        | Released -&gt; &quot;Released&quot;))
    end
</pre>

<p>Notes:</p>
<ol><li>This function has an optional argument (see the previous chapter) which is used to pass in the optional callback function. The callback is called when the button is pressed.</li>
<li>The expression <code>inherit container name as super</code> names the superclass <code>super</code>. I use this in the <code>repaint</code> method: <code>super#repaint</code>. This expressly calls the superclass method.</li>
<li>Pressing the button (calling <code>button#press</code> in this rather simplistic code) sets the state of the button to <code>Pressed</code> and calls the callback function, if one was defined. Notice that the <code>callback</code> variable is either <code>None</code> or <code>Some f</code>, in other words it has type <code>(unit -&gt; unit) option</code>. Reread the previous chapter if you are unsure about this.</li>
<li>Notice a strange thing about the <code>callback</code> variable. It's defined as an argument to the class, but any method can see and use it. In other words, the variable is supplied when the object is constructed, but persists over the lifetime of the object.</li>
<li>The <code>repaint</code> method has been implemented. It calls the superclass (to repaint the container), then repaints the button, displaying the current  state of the button.</li></ol>
<p>Before defining our <code>label</code> class, let's play with the <code>button</code> class in the OCaml toplevel:</p>
<pre ml:content="ocaml">
  let b = new button ~callback:(fun () -&gt; print_endline &quot;Ouch!&quot;) &quot;button&quot;;;
b#repaint;;
  b#press;;
  b#repaint;;
  b#release;;
</pre>

<p>Here's our comparatively trivial <code>label</code> class:</p>
<pre ml:content="ocaml">
  class label name text =
    object (self)
      inherit widget name
      method repaint =
        print_endline (&quot;Label: &quot; ^ text)
    end;;
</pre>

<p>Let's create a label which says &quot;Press me!&quot; and add it to the button:</p>
<pre ml:content="ocaml">
let l = new label &quot;label&quot; &quot;Press me!&quot;;;
b#add l;;
b#repaint;;
</pre>

<h3>A note about <code>self</code></h3>
<p>In all the examples above we defined classes using the general pattern:</p>
<pre ml:content="ocaml noeval">
class name =
  object (self)
    (* ... *)
  end;;
</pre>

<p>I didn't explain the reference to <code>self</code>. In fact this names the object, allowing you to call methods in the same class or pass the object to functions outside the class. In other words, it's exactly the same as <code>this</code> in C++/Java and <code>$self</code> in Perl. You may completely omit the <code>(self)</code> part if you don't need to refer to yourself - indeed in all the examples above we could have done exactly that. However, I would advise you to leave it in there because you never know when you might modify the class and require the reference to <code>self</code>. There is no penalty for having it.</p>

<h3>Inheritance and coercions</h3>
<pre ml:content="ocaml">
let b = new button &quot;button&quot;;;
let l = new label &quot;label&quot; &quot;Press me!&quot;;;
[b; l];;
</pre>

<p>I created a button <code>b</code> and a label <code>l</code> and I tried to create a list containing both, but I got an error. Yet <code>b</code> and <code>l</code> are both <code>widget</code>s, so why can't I  put them into the same list? Perhaps OCaml can't guess that I want a <code>widget list</code>? Let's try telling it:</p>
<pre ml:content="ocaml">
let wl = ([] : widget list);;
let wl = b :: wl;;
</pre>

<p>It turns out that OCaml doesn't coerce subclasses to the type of the superclass by default, but you can tell it to by using the <code>:&gt;</code> (coercion) operator:</p>
<pre ml:content="ocaml">
let wl = (b :&gt; widget) :: wl;;
let wl = (l :&gt; widget) :: wl;;
</pre>

<p>The expression <code>(b :&gt; widget)</code> means &quot;coerce the button <code>b</code> to have type <code>widget</code>&quot;. Type-safety is preserved because it is possible to tell completely at compile time whether the coercion will succeed.</p>
<p>Actually, coercions are somewhat more subtle than described above, and so I urge you to read the manual to find out the full details.</p>
<p>The <code>container#add</code> method defined above is actually incorrect, and fails if you try to add widgets of different types into a <code>container</code>. A coercion would fix this.</p>
<p>Is it possible to coerce from a superclass (eg. <code>widget</code>) to a subclass (eg. <code>button</code>)? The answer, perhaps surprisingly, is NO! Coercing in this direction is <em>unsafe</em>. You might try to coerce a <code>widget</code> which is in fact a <code>label</code>, not a <code>button</code>.</p>
<p>The problem of coercing from a superclass to a subclass will be familiar to Java programmers. In Java the container types contain <code>Object</code>s, and when you extract an object from a container you must cast it back to its original type. This can cause runtime <code>ClassCastException</code>s. OCaml's strong type system has the specific goal of eliminating runtime type errors, and this is why this sort of coercion is not permitted.</p>
<p>Polymorphism and functional programming should remove most of the need to coerce from superclasses to subclasses. Java's container classes store <code>Object</code>s because Java (at time of writing) lacks generics (&quot;templates&quot; in C++ or polymorphism in OCaml).  This is a fault in the Java language - a pretty fundamental fault in fact - which will hopefully be fixed in Java 1.5. In OCaml it's so simple to define polymorphic types like <code>'a list</code> or <code>'a stack</code> that Java-like programming just wouldn't be required. Having said that, if you do extensive OO programming in OCaml then I'm pretty sure you'll come up with a case where this type of coercion would actually be darned useful. Perhaps for this reason it's enough to say that you might try implementing solutions functionally first, and in an OO style only in the few problem domains where it really makes sense.</p>
<p>[Yamagata Yoriyuki writes that type-safe downcasts are possible. Advanced users should see: <a href="http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html" class="external" title="http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html">http://caml.inria.fr/pub/ml-archives/caml-list/2002/05/a6520926c4eac029206a31d6aa22f967.fr.html</a> , that leads to <a href="http://remi.vanicat.free.fr/ocaml/hweak/" class="external" title="http://remi.vanicat.free.fr/ocaml/hweak/">hweak</a> (old: http://caml.inria.fr/archives/200205/msg00397.html]</p>

<h3>The <code>Oo</code> module and comparing objects</h3>
<p>The <code>Oo</code> module contains a few useful functions for OO programming.</p>
<p><code>Oo.copy</code> makes a shallow copy of an object. <code>Oo.id <em>object</em></code> returns a unique identifying number for each object (a unique number across all classes).</p>
<p><code>=</code> and <code>&lt;&gt;</code> can be used to compare objects for <em>physical</em> equality (an object and its copy are not physically identical). You can also use <code>&lt;</code> etc. which provides an ordering of objects based apparently on their IDs.</p>
<a name="Objects_without_class"></a><h2><span>Objects without class</span></h2>
<p>Here we examine how to use objects pretty much like records, without necessarily using classes.</p>

<h3>Immediate objects and object types</h3>
<p>Objects can be used instead of records, and have some nice properties that can make them preferrable to records in some cases. We saw that the canonical way of creating objects is to first define a class, and use this class to create individual objects. This can be cumbersome in some situations since class definitions are more than a type definition and cannot be defined recursively with types. However, objects have a type that is very analog to a record type, and it can be used in type definitions. In addition, objects can be created without a class. They are called <em>immediate objects</em>. Here is the definition of an immediate object:</p>
<pre ml:content="ocaml">
  let o =
    object 
      val mutable n = 0 
      method incr = n &lt;- n + 1
      method get = n          
    end
</pre>

<p>This object has a type, which is defined by its public methods only. Values are not visible and neither are private methods (not shown). Unlike records, such a type does not need to be predefined explicitely, but doing so can make things clearer. We can do it like this:</p>
<pre ml:content="ocaml">
  type counter = &lt; get : int;  incr : unit &gt;
</pre>

<p>Compare with an equivalent record type definition:</p>
<pre ml:content="ocaml">
  type counter_r = { get : unit -&gt; int;
                     incr : unit -&gt; unit }
</pre>

<p>The implementation of a record working like our object would be:</p>
<pre ml:content="ocaml">
  let r =
    let n = ref 0 in
    { get = (fun () -&gt; !n);
      incr = (fun () -&gt; incr n) }
</pre>

<p>In terms of functionality, both the object and the record are similar, but each solution has its own advantages:</p>
<ul><li><strong>speed</strong>: slightly faster field access in records</li>
<li><strong>field names</strong>: it is inconvenient to manipulate records of different types when some fields are named identically but it's not a problem with objects</li>
<li><strong>subtyping</strong>: it is impossible to coerce the type of a record to a type with less fields. That is however possible with objects, so objects of different kinds that share some methods can be mixed in a data structure where only their common methods are visible (see next section)</li>
<li><strong>type definitions</strong>: there is no need to define an object type in advance, so it lightens the dependency contraints between modules</li></ul>
<h3>Class types vs. just types</h3>
<p>Beware of the confusion between <em>class types</em> and object <em>types</em>. A <em>class type</em> is not a data <em>type</em>, normally referred to as <em>type</em> in the OCaml jargon. An object <em>type</em> is a kind of data <em>type</em>, just like a record type or a tuple.</p>
<p>When a class is defined, both a <em>class type</em> and an object <em>type</em> of the same name are defined:</p>
<pre ml:content="ocaml">
  class t =      
    object
      val x = 0
      method get = x
   end
</pre>
<p><code>object val x : int method get : int end</code> is a class type.</p>

<p>In this example, <code>t</code> is also the type of objects that this class would create. Objects that derive from different classes or no class at all (immediate objects) can be mixed together as long as they have the same type:</p>
<pre ml:content="ocaml">
let x = object method get = 123 end;;
let l = [ new t; x ];;
</pre>

<p>Mixing objects that share a common subtype can be done, but requires explicit type coercion using the <code>:&gt;</code> operator:</p>
<pre ml:content="ocaml">
let x = object method get = 123 end;;
let y = object method get = 80 method special = &quot;hello&quot; end;;
let l = [ x; y ];;
let l = [ x; (y :&gt; t) ];;
</pre>

<a name="More_objects"></a><h2><span>More objects</span></h2>
<p>The OCaml manual, chapter 3, contains the canonical reference for objects and classes. Amongst the things which I have not covered here, but which are covered in the manual, are:</p>
<ul><li>private methods</li>
<li>complex constructors</li>
<li>interfaces</li>
<li>multiple inheritance</li>
<li>polymorphic methods</li>
<li>more detail about coercions</li>
<li>functional objects</li>
<li>more detail about cloning objects</li>
<li>mutually recursive classes</li>
<li>binary methods</li>
<li>friends</li></ul>

</div>

</body>
