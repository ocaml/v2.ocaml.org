<head>
<title>Introduction to Gtk</title>
</head>
<body>

<h1>Introduction to Gtk</h1>

<h2><a name="Lablgtk_and_writing_Gtk_applications"></a>
  Lablgtk and writing Gtk applications</h2>

<p><a href="http://www.gtk.org/" class="external" title="http://www.gtk.org/">Gtk+</a> is a toolkit for writing graphical applications, and <a href="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgtk.html" class="external" title="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgtk.html">lablgtk</a> is the OCaml interface for Gtk. Gtk and lablgtk are available for Unix and Windows platforms. In this tutorial I'm going to concentrate on the older but more stable Gtk version 1.2.  Gtk 2.x has some incompatibilities with Gtk 1.2, although mostly you won't notice the difference. On Windows, Gtk 1.2 has a non-native look and feel, but this is corrected in Gtk 2.x by the use of <a href="http://gtk-wimp.sourceforge.net/" class="external" title="http://gtk-wimp.sourceforge.net/">Gtk-Wimp</a> (a Windows native theme for Gtk).</p>
<p>Lablgtk makes ambitious use of advanced features of the OCaml type system. Make sure you're familiar with labelled and optional arguments and polymorphic variants (<a href="labels.html" class="internal" title="labels">labels</a>) or you won't have any idea what's going on in this chapter.  As it is, even the author of this tutorial finds ploughing through the lablgtk source code pretty hard work!</p>

<h3>Simple lablgtk program</h3>
<p>Actually, not so simple. This program has a menu with a &quot;quit&quot; option, and a button in the main area which you can press:</p>
<pre ml:content="ocaml noeval">
open GMain
open GdkKeysyms

let main () =
  let window = GWindow.window ~width:320 ~height:240
                 ~title:&quot;Simple lablgtk program&quot; () in
  let vbox = GPack.vbox ~packing:window#add () in
  window#connect#destroy ~callback:Main.quit;

  (* Menu bar *)
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu &quot;File&quot; in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item &quot;Quit&quot; ~key:_Q ~callback: Main.quit;

  (* Button *)
  let button = GButton.button ~label:&quot;Push me!&quot;
                 ~packing:vbox#add () in
  button#connect#clicked ~callback: (fun () -&gt; prerr_endline &quot;Ouch!&quot;);

  (* Display the windows and enter Gtk+ main loop *)
  window#add_accel_group accel_group;
  window#show ();
  Main.main ()

let () = main ()
</pre>

<p>Save this to a file <code>simple.ml</code> and compile it like this:</p>
<pre>
ocamlc -g -w s -I +lablgtk lablgtk.cma gtkInit.cmo simple.ml -o simple
</pre>

<p>This is what you should see when you run it:</p>
<center>
  <img src="../img/simplee29b.gif" width="327" height="277" alt="Simple lablgtk program"/></center>
<p>Let's analyse the program line by line to see what's going on.</p>
<pre ml:content="ocaml noeval">
open GMain
open GdkKeysyms
</pre>

<p><code>GMain</code> provides useful functions like the Gtk main loop, so I find it a good idea to always open this module. <code>GdkKeysyms</code> provides some key definitions, in this case <code>_Q</code> for the Ctrl + Q key combination.</p>
<pre ml:content="ocaml noeval">
  let window = GWindow.window ~width:320 ~height:240
                 ~title:&quot;Simple lablgtk program&quot; () in
  let vbox = GPack.vbox ~packing:window#add () in
  window#connect#destroy ~callback:Main.quit;
</pre>

<p>Firstly we create the toplevel window. Every Gtk program needs at least one. Notice three things: firstly <code>GWindow.window</code> is actually a helper function which creates a <code>window</code> object for you. For various reasons which we'll discuss in the intensive section at the end of this chapter, you shouldn't create lablgtk objects using <code>new <em>classname arguments...</em></code>, but instead use one of these helper functions. The helper functions are often named the same as the class which they create. Secondly lablgtk makes extensive use of the <code>~label</code> (labelled and optional arguments).  You'll get used to this quickly. Thirdly see the apparently useless <code>()</code> (unit) argument to <code>GWindow.window</code>. It's actually not useless, but the only way for OCaml to tell the difference between a partial and full function application in the presence of optional arguments.</p>
<p>A <code>vbox</code> is a vertical layout widget. It's a container which contains other widgets but isn't normally visible by itself. The <code>~packing</code> argument looks odd (indeed it is). It's just a shorthand way of writing:</p>
<pre ml:content="ocaml noeval">
  let vbox = GPack.vbox () in
  window#add vbox;
</pre>

<p>The two forms are, as far as I can tell, identical. The first way is a bit shorter.</p>
<p><code>window#connect#destroy ~callback:Main.quit;</code> is an example of connecting a <em>signal</em> to a function. In this case the <code>destroy</code> signal, received by the window when someone presses the &quot;X&quot; in the corner, will cause a call to <code>Main.quit ()</code> (note extra unit arg).</p>
<p>Creating the menubar and File -&gt; Quit button is straightforward enough. Notice the <code>accel_group</code> object which is used to keep track of accelerator buttons.  The <code>menubar</code> is packed first into the <code>vbox</code>:</p>
<pre ml:content="ocaml noeval">
  (* Menu bar *)
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory menubar in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu &quot;File&quot; in

  (* File menu *)
  let factory = new GMenu.factory file_menu ~accel_group in
  factory#add_item &quot;Quit&quot; ~key:_Q ~callback: Main.quit;
</pre>

<p>Next up we create the button and pack it in the <code>vbox</code>. Notice the <code>clicked</code> signal which is connected to an anonymous function:</p>
<pre ml:content="ocaml noeval">
&nbsp; (* Button *)
  let button = GButton.button ~label:&quot;Push me!&quot;
                 ~packing:vbox#add () in
  button#connect#clicked ~callback: (fun () -&gt; prerr_endline &quot;Ouch!&quot;);
</pre>

<p>This line just causes the accelerator keys (eg. Ctrl Q) to work:</p>
<pre ml:content="ocaml noeval">
  window#add_accel_group accel_group;
</pre>

<p>Finally two lines which are essential. All Gtk widgets must be &quot;shown&quot; before they will appear, by calling the <code>#show</code> method. However lablgtk, by default, automatically shows all widgets <em>except</em> toplevel windows. Thus we need to call <code>window#show ()</code> explicitly. <code>Main.main ()</code> is the Gtk main loop - the bit which runs and handles events. Gtk is event driven so everything else happens in a callback as a result of some signal received.</p>
<pre ml:content="ocaml noeval">
&nbsp; window#show ();
  Main.main ()
</pre>

<h3>Gtk tutorial</h3>
<p>Read <a href="http://www.gtk.org/tutorial1.2/" class="external" title="http://www.gtk.org/tutorial1.2/">this Gtk tutorial</a>  to find out more about Gtk. Lablgtk contains a pretty complete mapping of the Gtk+ API.</p>

<h3>Graph widget</h3>
<p>Now we're going to get a little bit more adventurous and write our own widget. This is going to be a simple graph, with a scrollbar at the bottom allowing you to scroll left and right through the data. The graph itself is going to be drawn on a Gtk drawing area widget. The Gtk drawing area is very simple, just an empty space in which you can execute your own drawing commands to draw lines, rectangles, text and so on.</p>
<p>Before starting we need to think about the overall structure of our graph widget. I'm going to have it be a vbox, with the drawing area in the top part, and the scrollbar in the bottom part. This is the overall structure of our class:</p>
<pre ml:content="ocaml noeval">
class graph ?width ?height ?packing ?show array =
  (* The initialization code will go here. *)

  object (self)
    inherit widget vbox#as_widget

    (* Methods will go here. *)

    method init =
      (* Further initialization will go here. *)
  end
</pre>

<p>To create a widget you will do:</p>
<pre ml:content="ocaml noeval">
let graph = new graph in
graph#init;
</pre>

<p>Note the two-stage initialization process. This is actually an unfortunate hack. You'll see why it's necessary once we start to fill in the code. Perhaps a reader can suggest a way around this?</p>
<p>The <code>inherit widget vbox#as_widget</code> is interesting. You'll have to read the section below entited <em>Structure of lablgtk</em> to understand it fully, but basically it causes a graph to be a subclass of widget.</p>
<p>Let's have a look at the initialization code in more detail. </p>
<pre ml:content="ocaml noeval">
class graph ?width ?height ?packing ?show array =
  (* Constants. *)
  let page_size = 10 in            (* Number of bars on &quot;page&quot;. *)
  let max_y = 10 in                (* Maximum on Y scale. *)

  (* Number of data points. *)
  let array_size = Array.length array in

  (* Create the containing vbox. *)
  let vbox = GPack.vbox ?width ?height ?packing ?show () in

  (* Create the drawing area. *)
  let da = GMisc.drawing_area ~packing:vbox#add () in
  let drawable = lazy (new GDraw.drawable da#misc#window) in

  (* Create the scrollbar. *)
  let adjustment = GData.adjustment
                     ~lower:0. ~upper:(float_of_int (array_size-1))
                     ~step_incr:1. ~page_incr:(float_of_int page_size) () in
  let scrollbar =
    GRange.scrollbar `HORIZONTAL ~adjustment ~packing:vbox#pack () in

  object (self)
    inherit widget vbox#as_widget

    (* Methods will go here. *)

    method private repaint () =
      (* Repaint the widget. See below. *)

    method init =
      da#event#connect#expose
        ~callback:(fun _ -&gt; self#repaint (); false);
      adjustment#connect#value_changed
        ~callback:(fun _ -&gt; self#repaint ())

  end
</pre>

<p>The let-bindings before the start of <code>object</code> define constants such as <code>page_size</code>, but also create the Gtk objects like vbox, drawing area, scrollbar and adjustment. (An adjustment is an abstract object which records the position of a scrollbar. Notice how in the <code>init</code> method we attach a signal to the adjustment so that when the scrollbar moves (ie. adjustment changes) we repaint the whole widget.) The private <code>repaint</code> method is where the action is, as it were. That method will actually be responsible for drawing the graph, axes, title and so on.</p>
<p>We'll see that in just a moment, but let's concentrate on the simpler methods of the object first:</p>
<pre ml:content="ocaml noeval">
  object (self)
    inherit widget vbox#as_widget

    (* The title of the graph. *)
    val mutable title = &quot;no title&quot;
    method set_title t = title &lt;- t
    method title = title

    (* ... *)
  end
</pre>

<p>The object is going to contain a mutable member, the title, and two methods to <code>set_title</code> and get <code>title</code>.</p>
<p>Now we come to the repaint method, which is the guts of the widget. This draws the graph in the drawing area:</p>
<pre ml:content="ocaml noeval">
&nbsp;   (* Repaint the widget. *)
    method private repaint () =
      let drawable = Lazy.force drawable in
      let (width, height) = drawable#size in
      drawable#set_background `WHITE;
      drawable#set_foreground `WHITE;
      drawable#rectangle ~x:0 ~y:0 ~width ~height ~filled:true ();
      drawable#set_foreground `BLACK;

      (* Draw the title. *)
      draw_text drawable font `Centre (width/2, 20) title;

      (* Draw the axes. *)
      drawable#line ~x:40 ~y:(height-40) ~x:(width-40) ~y:(height-40);
      drawable#line ~x:40 ~y:(height-40) ~x:40 ~y:40;

      (* Which part of the data to display? first .. first+page_size-1 *)
      let first_bar = int_of_float adjustment#value in
      let data = Array.sub array first_bar page_size in
      let bar_width = (width - 80) / page_size in

      (* Compute function mapping graph (x, y) to screen coordinates. *)
      let map (x,y) =
        (40 + x * bar_width, height-40 - y * (height-80) / max_y)  in

      (* Draw the axes scales. *)
      draw_text drawable font `Right (40, height-40) &quot;0&quot;;
      draw_text drawable font `Right (40, 40) (string_of_int max_y);
      for i = 0 to page_size-1 do
        let x = 40 + i * bar_width + bar_width/2 in
        let y = height-35 in
        let v = first_bar + i in
        draw_text drawable font `Centre (x, y) (string_of_int v)
      done;

      (* Draw the data. *)
      for i = 0 to page_size-1 do
        let (ll_x,ll_y) = map (i, data.(i)) in
        let (tr_x,tr_y) = map (i+1, 0) in
        draw_rectangle drawable &quot;red&quot; (ll_x, ll_y) (tr_x, tr_y)
      done
</pre>

<p>Apart from the calculation of screen coordinates from graph coordinates, the <code>repaint</code> method is essentially very simple. The Gtk drawing area contains a <code>drawable</code> object, and we use methods on this object such as <code>drawable#line</code> plus some helper functions which I haven't reproduced here to draw in the drawing area. It's really just a matter of calculating what to draw, where. Notice how we freely access let-bindings made before <code>object (self)</code>, eg. <code>page_size</code>, <code>drawable</code>, <code>adjustment</code>. These let-bindings are available in any method in the object.</p>
<p>The complete code for the graph is available in &lt;a href=&quot;graph.ml&quot;&gt;graph.ml&lt;/a&gt; and &lt;a href=&quot;test.ml&quot;&gt;test.ml&lt;/a&gt;. Compile it using:</p>
<pre>
ocamlc -g -w s -I +lablgtk lablgtk.cma gtkInit.cmo graph.ml test.ml -o graphtest
</pre>

<p>Here is a screenshot:</p>
<p>&lt;img src=&quot;graphtest.gif&quot; width=&quot;648&quot; height=&quot;508&quot; alt=&quot;Screenshot&quot;/&gt;</p>


<h3>Structure of lablgtk</h3>
<p>The lablgtk library has two layers, which I'm going to call the <em>module layer</em> and the <em>object-oriented layer</em> (plus some ancillary library modules which we'll also talk about). The layers are arranged like this in relation to your code:</p>
    <table class="structure_table">
      <tr><td colspan="2"> Your code </td></tr>
      <tr><td> Object-oriented layer </td> <td>eg. gButton.ml</td></tr>
      <tr><td> Module layer </td> <td>eg. gtkButton.ml<br/>ml_gtkbutton.c</td></tr>
      <tr><td colspan="2"> Gtk+ library (or DLL on Windows) </td></tr>
    </table>
<p>In theory you only need to interact with the object-oriented layer, and the theory is indeed true for trivial programs. However for practical purposes you will need to understand how the library is built up from these layers (and why).</p>

<h4>Gtk objects</h4>
<p>We'll start with the peculiarities of Gtk itself. This library is written in C and uses macros and &quot;clever&quot; hacks to (a) present an OO-ish interface and (b) perform simple garbage collection through reference counting. Part of the reason why lablgtk uses quite a complex model is to cater for the implementation of Gtk itself.</p>
<p>All &quot;objects&quot; in the Gtk library (I'll call them objects, but in reality they're C <code>struct</code>s) are &quot;derived&quot; from <code>GtkObject</code>. This means that an object such as a button contains within its <code>struct</code> a <code>struct _GtkObject</code>. This &quot;base class&quot; contains, amongst other things, a reference count which is used to provide simple garbage collection.</p>
<p>Of course, the above is all in the context of a C library for C programmers. OCaml has other mechanisms for OO and contains an advanced garbage collector. How does lablgtk unify the two?</p>
<p>Lablgtk starts with this type definition (in module <code>Gtk</code>):</p>
<pre>
type 'a obj;;
</pre>

<p>On the face of it, this is a <em>very</em> strange type definition. It defines a polymorphic type called <code>obj</code> (polymorphic because you can create, say, <code>int obj</code>, etc.). But it doesn't actually define a way of creating these objects! [Recall that a normal type definition might be something like this:</p>
<pre ml:content="ocaml">
type 'a obj = Something of 'a
</pre>

<p>which gives you a very definite way to create, say, an <code>int obj</code>:</p>
<pre ml:content="ocaml">
Something 1
</pre>

<p>But our strange, bare definition just says:</p>
<pre ml:content="ocaml noeval">
type 'a obj;;
</pre>

<p>How do we create objects of this type? The answer is that we don't. Instances of type <code>'a obj</code> are <code>GtkObject</code> structures (actually, more likely they are &quot;subclasses&quot; of <code>GtkObject</code>), and they are created by the C library. What precisely happens is that the C functions in the Gtk+ library are wrapped up by C functions which are called from OCaml. These functions look like this:</p>
<pre>
CAMLprim value
ml_gtk_toggle_button_new (value unit)
{
  return Val_GtkObject_sink ((GtkObject *) gtk_toggle_button_new ());
}
</pre>

<p><code>Val_GtkObject_sink</code> is a very complex little function which wraps up the <code>GtkObject</code> returned from the Gtk+ library function <code>gtk_toggle_button_new ()</code> in something that OCaml's garbage collector can understand. The same function also deals with Gtk's reference counting.</p>
<pre>
static void ml_final_GtkObject_sink (value val) {
  if (Field(val,1))
    gtk_object_unref ((GtkObject*)Field(val,1));
}

value Val_GtkObject_sink (GtkObject *p) {
  value ret;
  if (!p) ml_raise_null_pointer ();
  ret = alloc_final (2, ml_final_GtkObject_sink, 20, 1000);
  initialize (&amp;Field(ret,1), (value) p);
  gtk_object_ref_and_sink(p);
  return ret;
}
</pre>
<p>OCaml code calls <code>ml_gtk_toggle_button_new</code> directly to create objects of type <code>'a obj</code>.  Module <code>GtkButton</code> is in lablgtk's module layer and it contains an inner module called <code>GtkButton.ToggleButton</code> containing a function defined as:</p>
<pre ml:content="ocaml noeval">
module ToggleButton = struct
  external toggle_button_create : unit -&gt; toggle_button obj
      = &quot;ml_gtk_toggle_button_new&quot;
  external toggle_button_create_with_label : string -&gt; toggle_button obj
      = &quot;ml_gtk_toggle_button_new_with_label&quot;
  let create_toggle ?label () =
    match label with
    | None -&gt; toggle_button_create ()
    | Some label -&gt; toggle_button_create_with_label label
end
</pre>

<p>You can call these functions directly to see what they return:</p>
<pre>
# GtkButton.ToggleButton.toggle_button_create ();;
- : Gtk.toggle_button Gtk.obj = &lt;abstr&gt;
# GtkButton.ToggleButton.create_toggle ~label:&quot;Push me!&quot; ();;
- : Gtk.toggle_button Gtk.obj = &lt;abstr&gt;
</pre>

<p>Notice the return type: <code>toggle_button obj</code> (ie. a definite instance of the polymorphic type <code>'a obj</code>). What is <code>toggle_button</code>? It's a type (think <code>'a list</code> vs. <code>int list</code>) defined like this (in module <code>Gtk</code>):</p>
<pre ml:content="ocaml noeval">
type widget = [`base|`widget]
type container = [widget|`container]
type button = [container|`button]
type toggle_button = [button|`toggle]
</pre>

<p>Hence the full type written out is:</p>
<pre ml:content="ocaml noeval">
type toggle_button = [`base|`widget|`container|`button|`toggle]
</pre>

<p>(These are polymorphic variants - see &lt;a href=&quot;../ch7/&quot;&gt;Chapter 7&lt;/a&gt; if you don't remember them).</p>
<p>If you check the Gtk class hierarchy you'll see that the list of variants closely (but not exactly) matches the classes. A Gtk toggle button is-a Gtk button, Gtk container is-a Gtk widget, etc.</p>

<h4>Object-oriented layer</h4>
<p>Now let's look at the object-oriented layer interface to the toggle button, so we can see how <code>'a obj</code> comes into play. The <code>GButton</code> module defines a class for toggle buttons, but unusually you don't directly create instances of this class using <code>new toggle_button</code> (or similar). Instead a function is provided which generates instances for you. Here it is, simplified somewhat:</p>
<pre ml:content="ocaml noeval">
let toggle_button ?label ?border_width ?width ?height () =
  let w = ToggleButton.create_toggle ?label () in
  Container.set w ?border_width ?width ?height;
  new toggle_button w
</pre>

<p>Recall that <code>w</code> has the abstract type <code>[`base|`widget|`container|`button|`toggle] obj</code>, and it wraps up the actual <code>GtkObject</code> allocated by the C library.</p>
<p>A toggle button is-a container, and the next thing we do is call <code>Container.set</code> to set some properties in the base class. Here is where the polymorphic variants become interesting. What is the type of <code>Container.set</code>?</p>
<pre ml:content="ocaml noeval">
# GtkBase.Container.set;;
- : ?border_width:int -&gt;
    ?width:int -&gt; ?height:int -&gt; [&gt; `container | `widget] Gtk.obj -&gt; unit
= &lt;fun&gt;
</pre>

<p><code>Container.set</code> is expecting an argument of type <code>[&gt;`container|`widget] obj</code>. Recall from our discussion of polymorphic variants that <code>[&gt;`container|`widget]</code> means &quot;a variant which contains <em>at least</em> <code>`container</code> and <code>`widget</code>, and possibly other things too&quot;. Now go back and compare with the definition of <code>toggle_button</code> type above.</p>
<p>So <code>w</code> of type <code>[`base|`widget|`container|`button|`toggle] obj</code> is compatible with the call to <code>Container.set</code>, expecting <code>[&gt;`container|`widget] obj</code>.</p>
<p>Finally our function actually creates the class, passing the widget <code>w</code> as the parameter to the class. The class is defined like this (simplified):</p>
<pre ml:content="ocaml noeval">
class toggle_button w = object
  inherit button w
  method connect = new toggle_button_signals obj
  method active = ToggleButton.get_active obj
  method set_active = ToggleButton.set_active obj
  method set_draw_indicator = ToggleButton.set_mode obj
end
</pre>

<p>The base class for all objects is <code>GObj.gtkobj</code> defined as:</p>
<pre ml:content="ocaml noeval">
class gtkobj w = object
  val obj = w
  method destroy () = Object.destroy w
  method get_id = Object.get_id w
end
</pre>

<p>So all classes, including <code>toggle_button</code>, have access to their underlying object (the <code>GtkObject</code> allocated in C) through the <code>obj</code> member, and have <code>#destroy</code> and <code>#get_id</code> methods. All classes derived from <code>widget</code> have a public <code>#as_widget</code> method which returns the underlying object (sadly there is no equivalent for <code>gtkobj</code>, although this doesn't matter so much since almost all interesting classes are widgets).</p>
<p>Let's try the OO interface for toggle buttons:</p>
<pre ml:content="ocaml noeval">
          (* call the toggle_button function *)
# let b = GButton.toggle_button ~label:&quot;Push me!&quot; ();;
          (* note: returns object from toggle_button class *)
val b : GButton.toggle_button = &lt;obj&gt;
# b#as_widget;;
          (* note: returns a widget obj == [`base|`widget] obj *)
- : Gtk.widget Gtk.obj = &lt;abstr&gt;
</pre>

<h4>Downcasts</h4>
<p>Gtk is dynamically typed, and this means you can &lt;dfn&gt;downcast&lt;/dfn&gt;, for example, a widget into a toggle button. Gtk requires downcasting in some instances: for example you can pack widgets into containers, but if you try and retrieve them out of the container, all you get is a list of widgets.  The original type of the widgets is lost. Assuming you know that a widget is really, say, a button, then Gtk requires you to downcast the widget to a button in order to use the button-like features.</p>
<p>Such an operation is normally illegal in OCaml because OCaml is strongly typed at compile time and downcasting is unsafe. The widget might or might not actually be a toggle button.  Lablgtk allows downcasting, and provides another mechanism for casting which avoids the explicit downcast. Whichever way you do it, you may get a runtime exception if you cast to the wrong type.</p>
<p>The simplest downcast is just to unwrap the <code>'a obj</code> (<code>GtkObject</code>) from one class and wrap it in another class. Here we take the children out of a table widget, which we happen to know are actually all vboxes, unwrap each one from the <code>widget</code> class and rewrap in a <code>GPack.box</code> class.  (Example due to Jacques Garrigue.)</p>
<pre ml:content="ocaml noeval">
let vbox_of_widget widget =
  let obj = GtkPack.Box.cast widget#as_widget in
  new GPack.box obj

let vboxes = List.iter vbox_of_widget table#children
</pre>

<p>The terminology might be a little bit confusing here because the <code>#as_widget</code> method returns the internal <code>GtkObject</code> of type <code>'a obj</code>.</p>
<p><code>GtkPack.Box.cast</code> does the actual unsafe downcast. Downcasts can always fail at runtime, and in the case above the <code>Cannot_cast</code> exception could be thrown. You should be prepared to deal with this - unfortunately it's a program bug which cannot be picked up at compile time.</p>
<p>The other method for doing this avoids the explicit downcast, but can still throw an exception indicating a program bug at runtime. The strategy here is to remember what objects we put into the container separately, and when we take them out try to match them up. We use the <code>GUtil.memo</code> class for this:</p>
<pre ml:content="ocaml noeval">
class ['a] memo () = object
  constraint 'a = #widget
  val tbl = Hashtbl.create 7
  method add (obj : 'a) =
    Hashtbl.add tbl obj#get_id obj
  method find (obj : widget) = Hashtbl.find tbl obj#get_id
  method remove (obj : widget) = Hashtbl.remove tbl obj#get_id
end
</pre>

<p>(The constraint essentially says that <code>'a</code> must be a widget, or some subclass of widget).</p>
<p>Here is an example of using a memo. First we will create a top-level window, a container (vbox) to go inside this, and a button:</p>
<pre ml:content="ocaml noeval">
# let w = GWindow.window ();;
val w : GWindow.window = &lt;obj&gt;
# let c = GPack.vbox ~packing:w#add ();;
val c : GPack.box = &lt;obj&gt;
# let b = GButton.button ~label:&quot;Push me!&quot; ();;
val b : GButton.button = &lt;obj&gt;
</pre>

<p>Before we pack the button into the container, let's create a memo to remember the real object. Notice how the type of the memo is refined as soon as the button is added:</p>
<pre ml:content="ocaml noeval">
# let m = new GUtil.memo ();;
val m : _#GObj.widget GUtil.memo = &lt;obj&gt;
# m#add b;;
- : unit = ()
# m;;
- : GButton.button GUtil.memo = &lt;obj&gt;
</pre>

<p>Now we can add the button to the container, remembering to upcast it to a widget first of course:</p>
<pre ml:content="ocaml noeval">
# c#add (b :&gt; GObj.widget);;
- : unit = ()
</pre>

<p>The method <code>#children</code> returns a list of widgets. Not much use to us:</p>
<pre ml:content="ocaml noeval">
# c#children;;
- : GObj.widget list = [&lt;obj&gt;]
</pre>

<p>But we can use our memo to map these widgets to the original button objects:</p>
<pre ml:content="ocaml noeval">
# List.map (fun w -&gt; m#find w) c#children;;
- : GButton.button list = [&lt;obj&gt;]
</pre>

<p>Remember that this is still dynamic casting, and so unsafe. In this case the memo will throw a <code>Not_found</code> exception if the widget cannot be mapped:</p>
<pre ml:content="ocaml noeval">
# let b2 = GButton.button ~label:&quot;Don't push me!&quot; ();;
val b2 : GButton.button = &lt;obj&gt;
# c#add (b2 :&gt; GObj.widget);;
- : unit = ()
# List.map (fun w -&gt; m#find w) c#children;;
Exception: Not_found.
</pre>

<h3>Structure of lablgtk — summary</h3>
<ul><li><code>GtkObject</code>s allocated by the C library are wrapped up in opaque <code>'a obj</code> abstract types.</li>
<li>The module layer is flat (not OO) but uses polymorphic variants to simulate a class hierarchy.</li>
<li>The module layer handles Gtk's reference counting for you transparently. </li>
<li>Classes in the OO layer store the opaque <code>GtkObject</code> in a member called <code>obj</code>, and perform operations through the module layer, usually passing <code>obj</code> as the first parameter. </li>
<li>Helper functions are provided to create instances of classes.</li>
<li>Lablgtk provides two ways to perform downcasting, but this doesn't change the fact that downcasting is unsafe and can throw exceptions at runtime.</li></ul>
<p>&lt;a href=&quot;../ch13/&quot;&gt;Chapter 13&lt;/a&gt; continues with a discussion of wrapping up external C libraries. We look at another way to wrap up Gtk.</p>

</div>

</body>
