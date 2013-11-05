<head>
  <title>Calling C libraries</title>
</head>
<body>

<h1>Calling C libraries</h1>

<h2><a name="Note_from_Rich"></a>Note from Rich</h2>

<p>Chapters 12 and 13 really need to be rewritten from scratch.</p>
<p>I've left them here - you can read them, but the formatting is screwy.</p>
<a name="MiniGtk"></a><h2><span>MiniGtk</span></h2>
<p class="first_para">While the structure of lablgtk outlined in <a href="introduction_to_gtk.html" class="internal" title="Introduction to Gtk">Introduction to Gtk</a> seems perhaps over-complex, it's worth considering exactly why the author chose two layers. To appreciate this, you really need to get your hands dirty and look at other ways that a Gtk wrapper might have been written. </p>
<p>To this end I played around with something I call &lt;dfn&gt;MiniGtk&lt;/dfn&gt;, intended as a simple Gtk wrapper. All MiniGtk is capable of is opening a window with a label, but after writing MiniGtk I had renewed respect for the author of lablgtk! </p>
<p>MiniGtk is also a good tutorial for people who want to write OCaml bindings around their favorite C library. If you've ever tried to write bindings for Perl or Java, you'll find doing the same for OCaml is surprisingly easy, although you do have to worry a bit about the garbage collector. </p>
<p>Let's talk first about how MiniGtk is structured: rather than using a two layered approach as with lablgtk, I wanted to implement MiniGtk using a single (object-oriented) layer. This means that MiniGtk consists of a bunch of class definitions. Methods in those classes pretty much directly translate into calls to the C <code>libgtk-1.2.so</code> library. </p>
<p>I also wanted to rationalise the module naming scheme for Gtk. So there is exactly one top-level module called (surprise!) <code>Gtk</code> and all classes are inside this module. A test program looks like this: </p>
<pre ml:content="ocaml noeval">
let win = new Gtk.window ~title:"My window" ();;
let lbl = new Gtk.label ~text:"Hello" ();;
win#add lbl;;
</pre>

<pre ml:content="ocaml noeval">
let () =
  Gtk.main ()
</pre>

<p class="first_para">I defined a single abstract type to cover all <code>GtkObject</code>s (and &quot;subclasses&quot; of this C structure). In the <code>Gtk</code> module you'll find this type definition: </p>
<pre ml:content="ocaml noeval">
type obj
</pre>

<p class="first_para">As discussed in the last chapter, this defines an abstract type of which it is impossible to create any instances. In OCaml, at least. Certain C functions are going to create instances of this type. For instance, the function which creates new labels (ie. <code>GtkLabel</code> structures) is defined this way: </p>
<pre ml:content="ocaml noeval">
external gtk_label_new : string -> obj = "gtk_label_new_c"
</pre>

<p class="first_para">This strange function definition defines an &lt;dfn&gt;external function&lt;/dfn&gt;, one coming from C. The C function is called <code>gtk_label_new_c</code>, and it takes a string and returns one of our abstract <code>obj</code> types. </p>
<p>OCaml doesn't quite let you call <em>any</em> C function yet. You need to write a little C wrapper around the library's function to translate to and from OCaml's internal types and C types. <code>gtk_label_new_c</code> (note the additional <code>_c</code>) is my wrapper around the real Gtk C function called <code>gtk_label_new</code>. Here it is. I'll explain more about it later. </p>
<pre>
CAMLprim value
gtk_label_new_c (value str)
{
  CAMLparam1 (str);
  CAMLreturn (wrap (GTK_OBJECT (
    gtk_label_new (String_val (str)))));
 }
</pre>

<p class="first_para">Before explaining this function further, I'm going to take a step back and look at the hierarchy of our Gtk classes. I've chosen to reflect the actual Gtk widget hierarchy as closely as possible. All Gtk widgets are derived from a virtual base class called <code>GtkObject</code>. In fact from this class is derived <code>GtkWidget</code> and the whole variety of Gtk widgets are derived from this. So we define our own <code>GtkObject</code> equivalent class like this (note that <code>object</code> is a reserved word in OCaml). </p>
<pre ml:content="ocaml noeval">
type obj
</pre>

<pre ml:content="ocaml noeval">
class virtual gtk_object (obj : obj) =
object (self)
  val obj = obj
  method obj = obj
end
</pre>

<p class="first_para"><code>type obj</code> defines our abstract object type, and <code>class gtk_object</code> takes one of these &quot;things&quot; as a parameter to its constructor. Recall from above that this parameter is actually the C <code>GtkObject</code> structure (in fact it's a specially wrapped pointer to this structure). </p>
<p>You can't create <code>gtk_object</code> instances directly because it's a virtual class, but if you could you'd have to construct them like this: <code>new gtk_object obj</code>. What would you pass as that <code>obj</code> parameter? You'd pass the return value of, for instance, <code>gtk_label_new</code> (go back and have a look at how that <code>external</code> function was typed). This is shown below: </p>
<pre ml:content="ocaml noeval">
(* Example code, not really part of MiniGtk! *)
class label text =
  let obj = gtk_label_new text in
  object (self)
    inherit gtk_object obj
  end
</pre>

<p class="first_para">Of course the real <code>label</code> class doesn't inherit directly from <code>gtk_object</code> as shown above, but in principle this is how it works. </p>
<p>Following the Gtk class hierarchy the only class derived directly from <code>gtk_object</code> is our <code>widget</code> class, defined like this: </p>
<pre ml:content="ocaml noeval">
external gtk_widget_show : obj -> unit = "gtk_widget_show_c"
external gtk_widget_show_all : obj -> unit = "gtk_widget_show_all_c"
</pre>

<pre ml:content="ocaml noeval">
class virtual widget ?show obj =
  object (self)
    inherit gtk_object obj
    method show = gtk_widget_show obj
    method show_all = gtk_widget_show_all obj
    initializer if show <> Some false then self#show
  end
</pre>

<p class="first_para">This class is considerably more complex. Let's look at the initialization code first: </p>
<pre ml:content="ocaml noeval">
class virtual widget ?show obj =
  object (self)
    inherit gtk_object obj
    initializer
      if show <> Some false then self#show
  end
</pre>

<p class="first_para">The <code>initializer</code> section may well be new to you. This is code which runs when an object is being created - the equivalent of a constructor in other languages. In this case we check the boolean optional <code>show</code> argument and unless the user specified it explicitly as <code>false</code> we automatically call the <code>#show</code> method. (All Gtk widgets need to be &quot;shown&quot; after being created unless you want a widget to be created but hidden). </p>
<p>The actual definition of the methods happens with the help of a couple of external functions. These are basically direct calls to the C library (well, in fact there's a tiny bit of wrapper code, but that's not functionally important). </p>
<pre ml:content="ocaml noeval">
method show = gtk_widget_show obj
method show_all = gtk_widget_show_all obj
</pre>

<p>Notice that we pass the underlying <code>GtkObject</code> to both C library calls. This makes sense because these functions are prototyped as <code>void gtk_widget_show (GtkWidget *);</code> in C (<code>GtkWidget</code> and <code>GtkObject</code> are safely used interchangably in this context). </p>
<p>I want to describe the <code>label</code> class (the real one this time!), but in between <code>widget</code> and <code>label</code> is <code>misc</code>, a generic class which describes a large class of miscellaneous widgets. This class just adds padding and alignment around a widget such as a label. Here is its definition: </p>
<pre ml:content="ocaml noeval">
let may f x =
  match x with
  | None -> ()
  | Some x -> f x
</pre>

<pre ml:content="ocaml noeval">
external gtk_misc_set_alignment :
  obj -&gt; float * float -&gt; unit = &quot;gtk_misc_set_alignment_c&quot;
external gtk_misc_set_padding :
  obj -&gt; int * int -&gt; unit = &quot;gtk_misc_set_padding_c&quot;
</pre>

<pre ml:content="ocaml noeval">
class virtual misc ?alignment ?padding ?show obj =
  object (self)
    inherit widget ?show obj
    method set_alignment = gtk_misc_set_alignment obj
    method set_padding = gtk_misc_set_padding obj
    initializer
      may (gtk_misc_set_alignment obj) alignment;
      may (gtk_misc_set_padding obj) padding
  end
</pre>

<p class="first_para">We start with a helper function called <code>may : ('a -&gt; unit) -&gt; 'a option -&gt; unit</code> which invokes its first argument on the contents of its second unless the second argument is <code>None</code>. This trick (stolen from lablgtk of course) is very useful when dealing with optional arguments as we'll see. </p>
<p>The methods in <code>misc</code> should be straightforward. What is tricky is the initialization code. First notice that we take optional <code>alignment</code> and <code>padding</code> arguments to the constructor, and we pass the optional <code>show</code> and mandatory <code>obj</code> arguments directly up to <code>widget</code>. What do we do with the optional <code>alignment</code> and <code>padding</code>? The initializer uses these: </p>
<pre ml:content="ocaml noeval">
initializer
  may (gtk_misc_set_alignment obj) alignment;
  may (gtk_misc_set_padding obj) padding 
</pre>

<p class="first_para">It's that tricky <code>may</code> function in action. <em>If</em> the user gave an <code>alignment</code> argument, then this will set the alignment on the object by calling <code>gtk_misc_set_alignment obj the_alignment</code>. But more commonly the user will omit the <code>alignment</code> argument, in which case <code>alignment</code> is <code>None</code> and this does nothing. (In effect we get Gtk's default alignment, whatever that is). A similar thing happens with the <code>padding</code>. Note there is a certain simplicity and elegance in the way this is done. </p>
<p>Now we can finally get to the <code>label</code> class, which is derived directly from <code>misc</code>: </p>
<pre ml:content="ocaml noeval">
external gtk_label_new :
    string -&gt; obj  = &quot;gtk_label_new_c&quot;
external gtk_label_set_text :
    obj -&gt; string -&gt; unit = &quot;gtk_label_set_text_c&quot;
external gtk_label_set_justify :
    obj -&gt; Justification.t -&gt; unit = &quot;gtk_label_set_justify_c&quot;
external gtk_label_set_pattern :
    obj -&gt; string -&gt; unit = &quot;gtk_label_set_pattern_c&quot;
external gtk_label_set_line_wrap :
    obj -&gt; bool -&gt; unit = &quot;gtk_label_set_line_wrap_c&quot;
</pre>

<pre ml:content="ocaml noeval">
class label ~text
  ?justify ?pattern ?line_wrap ?alignment
  ?padding ?show () =
  let obj = gtk_label_new text in
  object (self)
    inherit misc ?alignment ?padding ?show obj
    method set_text = gtk_label_set_text obj
    method set_justify = gtk_label_set_justify obj
    method set_pattern = gtk_label_set_pattern obj
    method set_line_wrap = gtk_label_set_line_wrap obj
    initializer
      may (gtk_label_set_justify obj) justify;
      may (gtk_label_set_pattern obj) pattern;
      may (gtk_label_set_line_wrap obj) line_wrap
  end
</pre>

<p class="first_para">Although this class is bigger than the ones we've looked at up til now, it's really more of the same idea, <em>except</em> that this class isn't virtual. You can create instances of this class which means it finally has to call <code>gtk_..._new</code>. This is the initialization code (we discussed this pattern above): </p>
<pre ml:content="ocaml noeval">
class label ~text ... () =
  let obj = gtk_label_new text in
  object (self)
    inherit misc ... obj
  end
</pre>

<p class="first_para">(Pop quiz: what happens if we need to define a class which is both a base class from which other classes can be derived, and is also a non-virtual class of which the user should be allowed to create instances?) </p>
<h4>Wrapping calls to C libraries</h4>
<p class="first_para">Now we'll look in more detail at actually wrapping up calls to C library functions. Here's a simple example: </p>
<pre>
/* external gtk_label_set_text :
     obj -&gt; string -&gt; unit
       = &quot;gtk_label_set_text_c&quot; */

CAMLprim value
gtk_label_set_text_c (value obj, value str)
{
  CAMLparam2 (obj, str);
  gtk_label_set_text (unwrap (GtkLabel, obj),
    String_val (str));
  CAMLreturn (Val_unit);
}
</pre>

<p class="first_para">Comparing the OCaml prototype for the external function call (in the comment) with the definition of the function we can see two things: </p>
<ul><li>The C function that OCaml calls is named <code>&quot;gtk_label_set_text_c&quot;</code>.</li>
<li>Two arguments are passed (<code>value obj</code> and <code>value str</code>) and a unit is returned.</li></ul>
<p class="first_para">Values are OCaml's internal representation of all sorts of things from simple integers through to strings and even objects. I'm not going to go into any great detail about the <code>value</code> type because it is more than adequately covered in the OCaml manual. To use <code>value</code> you need to just know what macros are available to convert between a <code>value</code> and some C type. The macros look like this: </p>
<p>&lt;dl&gt; &lt;dt&gt;<code>String_val (val)</code>&lt;/dt&gt; &lt;dd&gt; Convert from a <code>value</code> which is known to be a string to a C string (ie. <code>char *</code>). &lt;/dd&gt; &lt;dt&gt;<code>Val_unit</code>&lt;/dt&gt; &lt;dd&gt; The OCaml unit <code>()</code> as a <code>value</code>. &lt;/dd&gt; &lt;dt&gt;<code>Int_val (val)</code>&lt;/dt&gt; boolean &lt;dd&gt; Convert from a <code>value</code> which is known to be an integer to a C <code>int</code>. &lt;/dd&gt; &lt;dt&gt;<code>Val_int (i)</code>&lt;/dt&gt; &lt;dd&gt; Convert from a C integer <code>i</code> into an integer <code>value</code>. &lt;/dd&gt; &lt;dt&gt;<code>Bool_val (val)</code>&lt;/dt&gt; &lt;dd&gt; Convert from a <code>value</code> which is known to be a boolean to a C boolean (ie. an <code>int</code>). &lt;/dd&gt; &lt;dt&gt;<code>Val_bool (i)</code>&lt;/dt&gt; &lt;dd&gt; Convert from a C integer <code>i</code> into a boolean <code>value</code>. &lt;/dd&gt; &lt;/dl&gt;</p>
<p>You can guess the others or consult the manual. Note that there is no straightforward conversion from C <code>char *</code> to a value. This involves allocating memory, which is somewhat more complicated. </p>
<p>In <code>gtk_label_set_text_c</code> above, the <code>external</code> definition, plus strong typing and type inference, has already ensured that the arguments are of the correct type, so to convert <code>value str</code> to a C <code>char *</code> we called <code>String_val (str)</code>. </p>
<p>The other parts of the function are a bit stranger. To ensure that the garbage collector &quot;knows&quot; that your C function is still using <code>obj</code> and <code>str</code> while the C function is running (remember that the garbage collector might be triggered within your C function by a number of events - a callback to OCaml or using one of OCaml's allocation functions), you need to frame the function to add code to tell the garbage collector about the &quot;roots&quot; that you're using. And tell the garbage collector when you finish using those roots too, of course. This is done by framing the function within <code>CAMLparam<em>N</em></code> ... <code>CAMLreturn</code>. Hence:</p>
<pre>
CAMLparam2 (obj, str);
...
CAMLreturn (Val_unit); 
</pre>

<p class="first_para"><code>CAMLparam2</code> is a macro saying that you're using two <code>value</code> parameters. (There is another macro for annotating local <code>value</code> variables too). You need to use <code>CAMLreturn</code> instead of plain <code>return</code> which tells the GC you've finished with those roots. It might be instructive to examine what code is inlined when you write <code>CAMLparam2 (obj, str)</code>. This is the generated code (with the author's version of OCaml, so it might vary between implementations slightly): </p>
<pre>
struct caml__roots_block *caml__frame
    = local_roots;
struct caml__roots_block caml__roots_obj;

caml__roots_obj.next = local_roots;
local_roots = &amp;caml__roots_obj;
caml__roots_obj.nitems = 1;
caml__roots_obj.ntables = 2;
caml__roots_obj.tables [0] = &amp;obj;
caml__roots_obj.tables [1] = &amp;str; 
</pre>

<p class="first_para">And for <code>CAMLreturn (foo)</code>:</p>
<pre>
local_roots = caml__frame;
return (foo); 
</pre>

<p class="first_para">If you follow the code closely you'll see that <code>local_roots</code> is obviously a linked list of <code>caml__roots_block</code> structures. One (or more) of these structures is pushed onto the linked list when we enter the function, and all of these are popped back off when we leave, thus restoring <code>local_roots</code> to its previous state when we leave the function. (<em>If</em> you remembered to call <code>CAMLreturn</code> instead of <code>return</code> of course - otherwise <code>local_roots</code> will end up pointing at uninitialised data on the stack with &quot;hilarious&quot; consequences). </p>
<p>Each <code>caml__roots_block</code> structure has space for up to five <code>value</code>s (you can have multiple blocks, so this isn't a limitation). When the GC runs we can infer that it must walk through the linked list, starting at <code>local_roots</code>, and treat each <code>value</code> as a root for garbage collection purposes. The consequences of <em>not</em> declaring a <code>value</code> parameter or local <code>value</code> variable in this way would be that the garbage collector might treat that variable as unreachable memory and thus reclaim it while your function is running! </p>
<p><code>CAMLprim</code> is a Windows-only thing and so we won't talk about it ... </p>
<p>Finally there is the mysterious <code>unwrap</code> macro. This is one I wrote myself, or rather, this is one I mostly copied from lablgtk. There are two related functions, called <code>wrap</code> and <code>unwrap</code> and as you might possibly have guessed, they wrap and unwrap <code>GtkObject</code>s in OCaml <code>value</code>s. These functions establish the somewhat magical relationship between <code>GtkObject</code> and our opaque, mysterious <code>obj</code> type which we defined for OCaml (see the very first part of this chapter to remind yourself). </p>
<p>The problem is how do we wrap up (and hide) the C <code>GtkObject</code> structure in a way that we can pass it around as an opaque &quot;thing&quot; (<code>obj</code>) through our OCaml code, and hopefully pass it back later to a C function which can unwrap it and retrieve the same <code>GtkObject</code> back again? </p>
<p>In order for it to get passed to OCaml code at all, we must somehow convert it to a <code>value</code>. Luckily we can quite easily use the C API to create <code>value</code> blocks which the OCaml garbage collector <em>won't</em> examine too closely ...... </p>

</div>

</body>
