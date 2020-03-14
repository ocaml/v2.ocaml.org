<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual003.html">The core language</a></li><li><a href="manual004.html">The module system</a></li><li><a href="manual005.html">Objects in OCaml</a></li><li><a href="manual006.html">Labels and variants</a></li><li class="active"><a href="manual007.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter"><a name="htoc43"><span>Chapter 5</span></a>&nbsp;&nbsp;Advanced examples with classes and modules</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Advanced examples with classes and modules</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc37">Extended example: bank accounts</a>
</li><li><a href="#toc38">Simple modules as classes</a>
</li><li><a href="#toc39">The subject/observer pattern</a>
</li></ul></nav></header>
<p>

<a name="c:advexamples"></a></p><p></p><p><br>
<br>
</p><p>In this chapter, we show some larger examples using objects, classes
and modules. We review many of the object features simultaneously on
the example of a bank account. We show how modules taken from the
standard library can be expressed as classes. Lastly, we describe a
programming pattern know of as <em>virtual types</em> through the example
of window managers.</p><h2 class="section"><a name="toc37"></a><a name="htoc44">1</a>&nbsp;&nbsp;Extended example: bank accounts</h2><p>

<a name="ss:bank-accounts"></a></p><p>In this section, we illustrate most aspects of Object and inheritance
by refining, debugging, and specializing the following
initial naive definition of a simple bank account. (We reuse the
module <tt>Euro</tt> defined at the end of chapter&nbsp;<a href="manual005.html#c:objectexamples">3</a>.)
</p><pre><font color="black">#</font><font color="#006000"> let euro = new Euro.c;;
<font color="maroon">val euro : float -&gt; Euro.c = &lt;fun&gt;

</font><font color="black">#</font> let zero = euro 0.;;
<font color="maroon">val zero : Euro.c = &lt;obj&gt;

</font><font color="black">#</font> let neg x = x#times (-1.);;
<font color="maroon">val neg : &lt; times : float -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;

</font><font color="black">#</font> class account =
    object
      val mutable balance = zero
      method balance = balance
      method deposit x = balance &lt;- balance # plus x
      method withdraw x =
        if x#leq balance then (balance &lt;- balance # plus (neg x); x) else zero
    end;;
<font color="maroon">class account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end

</font><font color="black">#</font> let c = new account in c # deposit (euro 100.); c # withdraw (euro 50.);;
</font><font color="maroon">- : Euro.c = &lt;obj&gt;
</font></pre><p>
We now refine this definition with a method to compute interest.
</p><pre><font color="black">#</font><font color="#006000"> class account_with_interests =
    object (self)
      inherit account
      method private interest = self # deposit (self # balance # times 0.03)
    end;;
</font><font color="maroon">class account_with_interests :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method private interest : unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
We make the method <tt>interest</tt> private, since clearly it should not be
called freely from the outside. Here, it is only made accessible to subclasses
that will manage monthly or yearly updates of the account.</p><p>We should soon fix a bug in the current definition: the deposit method can
be used for withdrawing money by depositing negative amounts. We can
fix this directly:
</p><pre><font color="black">#</font><font color="#006000"> class safe_account =
    object
      inherit account
      method deposit x = if zero#leq x then balance &lt;- balance#plus x
    end;;
</font><font color="maroon">class safe_account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
However, the bug might be fixed more safely by the following definition:
</p><pre><font color="black">#</font><font color="#006000"> class safe_account =
    object
      inherit account as unsafe
      method deposit x =
        if zero#leq x then unsafe # deposit x
        else raise (Invalid_argument "deposit")
    end;;
</font><font color="maroon">class safe_account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
In particular, this does not require the knowledge of the implementation of
the method <tt>deposit</tt>.</p><p>To keep track of operations, we extend the class with a mutable field
<tt>history</tt> and a private method <tt>trace</tt> to add an operation in the
log. Then each method to be traced is redefined.
</p><pre><font color="black">#</font><font color="#006000"> type 'a operation = Deposit of 'a | Retrieval of 'a;;
<font color="maroon">type 'a operation = Deposit of 'a | Retrieval of 'a

</font><font color="black">#</font> class account_with_history =
    object (self)
      inherit safe_account as super
      val mutable history = []
      method private trace x = history &lt;- x :: history
      method deposit x = self#trace (Deposit x);  super#deposit x
      method withdraw x = self#trace (Retrieval x); super#withdraw x
      method history = List.rev history
    end;;
</font><font color="maroon">class account_with_history :
  object
    val mutable balance : Euro.c
    val mutable history : Euro.c operation list
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method history : Euro.c operation list
    method private trace : Euro.c operation -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
One may wish to open an account and simultaneously deposit some initial
amount. Although the initial implementation did not address this
requirement, it can be achieved by using an initializer.
</p><pre><font color="black">#</font><font color="#006000"> class account_with_deposit x =
    object
      inherit account_with_history
      initializer balance &lt;- x
    end;;
</font><font color="maroon">class account_with_deposit :
  Euro.c -&gt;
  object
    val mutable balance : Euro.c
    val mutable history : Euro.c operation list
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method history : Euro.c operation list
    method private trace : Euro.c operation -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
A better alternative is:
</p><pre><font color="black">#</font><font color="#006000"> class account_with_deposit x =
    object (self)
      inherit account_with_history
      initializer self#deposit x
    end;;
</font><font color="maroon">class account_with_deposit :
  Euro.c -&gt;
  object
    val mutable balance : Euro.c
    val mutable history : Euro.c operation list
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method history : Euro.c operation list
    method private trace : Euro.c operation -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</font></pre><p>
Indeed, the latter is safer since the call to <tt>deposit</tt> will automatically
benefit from safety checks and from the trace.
Let’s test it:
</p><pre><font color="black">#</font><font color="#006000"> let ccp = new account_with_deposit (euro 100.) in
  let _balance = ccp#withdraw (euro 50.) in
  ccp#history;;
</font><font color="maroon">- : Euro.c operation list = [Deposit &lt;obj&gt;; Retrieval &lt;obj&gt;]
</font></pre><p>
Closing an account can be done with the following polymorphic function:
</p><pre><font color="black">#</font><font color="#006000"> let close c = c#withdraw (c#balance);;
</font><font color="maroon">val close : &lt; balance : 'a; withdraw : 'a -&gt; 'b; .. &gt; -&gt; 'b = &lt;fun&gt;
</font></pre><p>
Of course, this applies to all sorts of accounts.</p><p>Finally, we gather several versions of the account into a module <tt>Account</tt>
abstracted over some currency.
</p><pre><font color="black">#</font><font color="#006000"> let today () = (01,01,2000) (* an approximation *)
  module Account (M:MONEY) =
    struct
      type m = M.c
      let m = new M.c
      let zero = m 0.

      class bank =
        object (self)
          val mutable balance = zero
          method balance = balance
          val mutable history = []
          method private trace x = history &lt;- x::history
          method deposit x =
            self#trace (Deposit x);
            if zero#leq x then balance &lt;- balance # plus x
            else raise (Invalid_argument "deposit")
          method withdraw x =
            if x#leq balance then
              (balance &lt;- balance # plus (neg x); self#trace (Retrieval x); x)
            else zero
          method history = List.rev history
        end

      class type client_view =
        object
          method deposit : m -&gt; unit
          method history : m operation list
          method withdraw : m -&gt; m
          method balance : m
        end

      class virtual check_client x =
        let y = if (m 100.)#leq x then x
        else raise (Failure "Insufficient initial deposit") in
        object (self) initializer <u>self#deposit</u> y end

      module Client (B : sig class bank : client_view end) =
        struct
          class account x : client_view =
            object
              inherit B.bank
              inherit check_client x
            end

          let discount x =
            let c = new account x in
            if today() &lt; (1998,10,30) then c # deposit (m 100.); c
        end
    end;;
</font></pre><p>
This shows the use of modules to group several class definitions that can in
fact be thought of as a single unit. This unit would be provided by a bank
for both internal and external uses.
This is implemented as a functor that abstracts over the currency so that
the same code can be used to provide accounts in different currencies.</p><p>The class <tt>bank</tt> is the <em>real</em> implementation of the bank account (it
could have been inlined). This is the one that will be used for further
extensions, refinements, etc. Conversely, the client will only be given the client view.
</p><pre><font color="black">#</font><font color="#006000"> module Euro_account = Account(Euro);;

  module Client = Euro_account.Client (Euro_account);;

  new Client.account (new Euro.c 100.);;
</font></pre><p>
Hence, the clients do not have direct access to the <tt>balance</tt>, nor the
<tt>history</tt> of their own accounts. Their only way to change their balance is
to deposit or withdraw money. It is important to give the clients
a class and not just the ability to create accounts (such as the
promotional <tt>discount</tt> account), so that they can
personalize their account.
For instance, a client may refine the <tt>deposit</tt> and <tt>withdraw</tt> methods
so as to do his own financial bookkeeping, automatically. On the
other hand, the function <tt>discount</tt> is given as such, with no
possibility for further personalization.</p><p>It is important to provide the client’s view as a functor
<tt>Client</tt> so that client accounts can still be built after a possible
specialization of the <tt>bank</tt>.
The functor <tt>Client</tt> may remain unchanged and be passed
the new definition to initialize a client’s view of the extended account.
</p><pre><font color="black">#</font><font color="#006000"> module Investment_account (M : MONEY) =
    struct
      type m = M.c
      module A = Account(M)

      class bank =
        object
          inherit A.bank as super
          method deposit x =
            if (new M.c 1000.)#leq x then
              print_string "Would you like to invest?";
            super#deposit x
        end

      module Client = A.Client
    end;;
</font></pre><p>
The functor <tt>Client</tt> may also be redefined when some new features of the
account can be given to the client.
</p><pre><font color="black">#</font><font color="#006000"> module Internet_account (M : MONEY) =
    struct
      type m = M.c
      module A = Account(M)

      class bank =
        object
          inherit A.bank
          method mail s = print_string s
        end

      class type client_view =
        object
          method deposit : m -&gt; unit
          method history : m operation list
          method withdraw : m -&gt; m
          method balance : m
          method mail : string -&gt; unit
        end

      module Client (B : sig class bank : client_view end) =
        struct
          class account x : client_view =
            object
              inherit B.bank
              inherit A.check_client x
            end
        end
    end;;
</font></pre><h2 class="section"><a name="toc38"></a><a name="htoc45">2</a>&nbsp;&nbsp;Simple modules as classes</h2><p>

<a name="ss:modules-as-classes"></a></p><p>One may wonder whether it is possible to treat primitive types such as
integers and strings as objects. Although this is usually uninteresting
for integers or strings, there may be some situations where
this is desirable. The class <tt>money</tt> above is such an example.
We show here how to do it for strings.</p><h3 class="subsection"><a name="htoc46">5.2.1</a>&nbsp;&nbsp;Strings</h3><p>
<a name="module:string"></a></p><p>A naive definition of strings as objects could be:
</p><pre><font color="black">#</font><font color="#006000"> class ostring s =
    object
       method get n = String.get s n
       method set n c = String.set s n c
       method print = print_string s
       method copy = new ostring (String.copy s)
    end;;
</font><font color="maroon">class ostring :
  string -&gt;
  object
    method copy : ostring
    method get : int -&gt; char
    method print : unit
    method set : int -&gt; char -&gt; unit
  end
</font></pre><p>
However, the method <tt>copy</tt> returns an object of the class <tt>ostring</tt>,
and not an objet of the current class. Hence, if the class is further
extended, the method <tt>copy</tt> will only return an object of the parent
class.
</p><pre><font color="black">#</font><font color="#006000"> class sub_string s =
    object
       inherit ostring s
       method sub start len = new sub_string (String.sub s  start len)
    end;;
</font><font color="maroon">class sub_string :
  string -&gt;
  object
    method copy : ostring
    method get : int -&gt; char
    method print : unit
    method set : int -&gt; char -&gt; unit
    method sub : int -&gt; int -&gt; sub_string
  end
</font></pre><p>
As seen in section <a href="manual005.html#ss:binary-methods">3.16</a>, the solution is to use
functional update instead. We need to create an instance variable
containing the representation <tt>s</tt> of the string.
</p><pre><font color="black">#</font><font color="#006000"> class better_string s =
    object
       val repr = s
       method get n = String.get repr n
       method set n c = String.set repr n c
       method print = print_string repr
       method copy = {&lt; repr = String.copy repr &gt;}
       method sub start len = {&lt; repr = String.sub s  start len &gt;}
    end;;
</font><font color="maroon">class better_string :
  string -&gt;
  object ('a)
    val repr : string
    method copy : 'a
    method get : int -&gt; char
    method print : unit
    method set : int -&gt; char -&gt; unit
    method sub : int -&gt; int -&gt; 'a
  end
</font></pre><p>
As shown in the inferred type, the methods <tt>copy</tt> and <tt>sub</tt> now return
objects of the same type as the one of the class.</p><p>Another difficulty is the implementation of the method <tt>concat</tt>.
In order to concatenate a string with another string of the same class,
one must be able to access the instance variable externally. Thus, a method
<tt>repr</tt> returning s must be defined. Here is the correct definition of
strings:
</p><pre><font color="black">#</font><font color="#006000"> class ostring s =
    object (self : 'mytype)
       val repr = s
       method repr = repr
       method get n = String.get repr n
       method set n c = String.set repr n c
       method print = print_string repr
       method copy = {&lt; repr = String.copy repr &gt;}
       method sub start len = {&lt; repr = String.sub s start len &gt;}
       method concat (t : 'mytype) = {&lt; repr = repr ^ t#repr &gt;}
    end;;
</font><font color="maroon">class ostring :
  string -&gt;
  object ('a)
    val repr : string
    method concat : 'a -&gt; 'a
    method copy : 'a
    method get : int -&gt; char
    method print : unit
    method repr : string
    method set : int -&gt; char -&gt; unit
    method sub : int -&gt; int -&gt; 'a
  end
</font></pre><p>
Another constructor of the class string can be defined to return an
uninitialized string of a given length:
</p><pre><font color="black">#</font><font color="#006000"> class cstring n = ostring (String.create n);;
</font><font color="maroon">class cstring : int -&gt; ostring
</font></pre><p>
Here, exposing the representation of strings is probably harmless. We do
could also hide the representation of strings as we hid the currency in the
class <tt>money</tt> of section&nbsp;<a href="manual005.html#ss:friends">3.17</a>.</p><h4 class="subsubsection">Stacks</h4><p>
<a name="module:stack"></a></p><p>There is sometimes an alternative between using modules or classes for
parametric data types.
Indeed, there are situations when the two approaches are quite similar.
For instance, a stack can be straightforwardly implemented as a class:
</p><pre><font color="black">#</font><font color="#006000"> exception Empty;;
<font color="maroon">exception Empty

</font><font color="black">#</font> class ['a] stack =
    object
      val mutable l = ([] : 'a list)
      method push x = l &lt;- x::l
      method pop = match l with [] -&gt; raise Empty | a::l' -&gt; l &lt;- l'; a
      method clear = l &lt;- []
      method length = List.length l
    end;;
</font><font color="maroon">class ['a] stack :
  object
    val mutable l : 'a list
    method clear : unit
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</font></pre><p>
However, writing a method for iterating over a stack is more
problematic. A method <tt>fold</tt> would have type
<tt>('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b</tt>. Here <tt>'a</tt> is the parameter of the stack.
The parameter <tt>'b</tt> is not related to the class <tt>'a stack</tt> but to the
argument that will be passed to the method <tt>fold</tt>.
A naive approach is to make <tt>'b</tt> an extra parameter of class <tt>stack</tt>:
</p><pre><font color="black">#</font><font color="#006000"> class ['a, 'b] stack2 =
    object
      inherit ['a] stack
      method fold f (x : 'b) = List.fold_left f x l
    end;;
</font><font color="maroon">class ['a, 'b] stack2 :
  object
    val mutable l : 'a list
    method clear : unit
    method fold : ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</font></pre><p>
However, the method <tt>fold</tt> of a given object can only be
applied to functions that all have the same type:
</p><pre><font color="black">#</font><font color="#006000"> let s = new stack2;;
<font color="maroon">val s : ('_a, '_b) stack2 = &lt;obj&gt;

</font><font color="black">#</font> s#fold (+) 0;;
<font color="maroon">- : int = 0

</font><font color="black">#</font> s;;
</font><font color="maroon">- : (int, int) stack2 = &lt;obj&gt;
</font></pre><p>
A better solution is to use polymorphic methods, which were
introduced in OCaml version 3.05. Polymorphic methods makes
it possible to treat the type variable <tt>'b</tt> in the type of <tt>fold</tt> as
universally quantified, giving <tt>fold</tt> the polymorphic type
<tt>Forall 'b. ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b</tt>.
An explicit type declaration on the method <tt>fold</tt> is required, since
the type checker cannot infer the polymorphic type by itself.
</p><pre><font color="black">#</font><font color="#006000"> class ['a] stack3 =
    object
      inherit ['a] stack
      method fold : 'b. ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b
                  = fun f x -&gt; List.fold_left f x l
    end;;
</font><font color="maroon">class ['a] stack3 :
  object
    val mutable l : 'a list
    method clear : unit
    method fold : ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</font></pre><h3 class="subsection"><a name="htoc47">5.2.2</a>&nbsp;&nbsp;Hashtbl</h3><p>
<a name="module:hashtbl"></a></p><p>A simplified version of object-oriented hash tables should have the
following class type.
</p><pre><font color="black">#</font><font color="#006000"> class type ['a, 'b] hash_table =
    object
      method find : 'a -&gt; 'b
      method add : 'a -&gt; 'b -&gt; unit
    end;;
</font><font color="maroon">class type ['a, 'b] hash_table =
  object method add : 'a -&gt; 'b -&gt; unit method find : 'a -&gt; 'b end
</font></pre><p>
A simple implementation, which is quite reasonable for small hastables is
to use an association list:
</p><pre><font color="black">#</font><font color="#006000"> class ['a, 'b] small_hashtbl : ['a, 'b] hash_table =
    object
      val mutable table = []
      method find key = List.assoc key table
      method add key valeur = table &lt;- (key, valeur) :: table
    end;;
</font><font color="maroon">class ['a, 'b] small_hashtbl : ['a, 'b] hash_table
</font></pre><p>
A better implementation, and one that scales up better, is to use a
true hash tables… whose elements are small hash tables!
</p><pre><font color="black">#</font><font color="#006000"> class ['a, 'b] hashtbl size : ['a, 'b] hash_table =
    object (self)
      val table = Array.init size (fun i -&gt; new small_hashtbl)
      method private hash key =
        (Hashtbl.hash key) mod (Array.length table)
      method find key = table.(self#hash key) # find key
      method add key = table.(self#hash key) # add key
    end;;
</font><font color="maroon">class ['a, 'b] hashtbl : int -&gt; ['a, 'b] hash_table
</font></pre><h3 class="subsection"><a name="htoc48">5.2.3</a>&nbsp;&nbsp;Sets</h3><p>
<a name="module:set"></a></p><p>Implementing sets leads to another difficulty. Indeed, the method
<tt>union</tt> needs to be able to access the internal representation of
another object of the same class.</p><p>This is another instance of friend functions as seen in section
<a href="manual005.html#ss:friends">3.17</a>. Indeed, this is the same mechanism used in the module
<tt>Set</tt> in the absence of objects.</p><p>In the object-oriented version of sets, we only need to add an additional
method <tt>tag</tt> to return the representation of a set. Since sets are
parametric in the type of elements, the method <tt>tag</tt> has a parametric type
<tt>'a tag</tt>, concrete within
the module definition but abstract in its signature.
From outside, it will then be guaranteed that two objects with a method <tt>tag</tt>
of the same type will share the same representation.
</p><pre><font color="black">#</font><font color="#006000"> module type SET =
    sig
      type 'a tag
      class ['a] c :
        object ('b)
          method is_empty : bool
          method mem : 'a -&gt; bool
          method add : 'a -&gt; 'b
          method union : 'b -&gt; 'b
          method iter : ('a -&gt; unit) -&gt; unit
          method tag : 'a tag
        end
    end;;

  module Set : SET =
    struct
      let rec merge l1 l2 =
        match l1 with
          [] -&gt; l2
        | h1 :: t1 -&gt;
            match l2 with
              [] -&gt; l1
            | h2 :: t2 -&gt;
                if h1 &lt; h2 then h1 :: merge t1 l2
                else if h1 &gt; h2 then h2 :: merge l1 t2
                else merge t1 l2
      type 'a tag = 'a list
      class ['a] c =
        object (_ : 'b)
          val repr = ([] : 'a list)
          method is_empty = (repr = [])
          method mem x = List.exists ((=) x) repr
          method add x = {&lt; repr = merge [x] repr &gt;}
          method union (s : 'b) = {&lt; repr = merge repr s#tag &gt;}
          method iter (f : 'a -&gt; unit) = List.iter f repr
          method tag = repr
        end
    end;;
</font></pre><h2 class="section"><a name="toc39"></a><a name="htoc49">3</a>&nbsp;&nbsp;The subject/observer pattern</h2><p>

<a name="ss:subject-observer"></a></p><p>The following example, known as the subject/observer pattern, is often
presented in the literature as a difficult inheritance problem with
inter-connected classes.
The general pattern amounts to the definition a pair of two
classes that recursively interact with one another.</p><p>The class <tt>observer</tt> has a distinguished method <tt>notify</tt> that requires
two arguments, a subject and an event to execute an action.
</p><pre><font color="black">#</font><font color="#006000"> class virtual ['subject, 'event] observer =
    object
      method virtual notify : 'subject -&gt;  'event -&gt; unit
    end;;
</font><font color="maroon">class virtual ['subject, 'event] observer :
  object method virtual notify : 'subject -&gt; 'event -&gt; unit end
</font></pre><p>
The class <tt>subject</tt> remembers a list of observers in an instance variable,
and has a distinguished method <tt>notify_observers</tt> to broadcast the message
<tt>notify</tt> to all observers with a particular event <tt>e</tt>.
</p><pre><font color="black">#</font><font color="#006000"> class ['observer, 'event] subject =
    object (self)
      val mutable observers = ([]:'observer list)
      method add_observer obs = observers &lt;- (obs :: observers)
      method notify_observers (e : 'event) =
          List.iter (fun x -&gt; x#notify self e) observers
    end;;
</font><font color="maroon">class ['a, 'event] subject :
  object ('b)
    constraint 'a = &lt; notify : 'b -&gt; 'event -&gt; unit; .. &gt;
    val mutable observers : 'a list
    method add_observer : 'a -&gt; unit
    method notify_observers : 'event -&gt; unit
  end
</font></pre><p>
The difficulty usually lies in defining instances of the pattern above
by inheritance. This can be done in a natural and obvious manner in
OCaml, as shown on the following example manipulating windows.
</p><pre><font color="black">#</font><font color="#006000"> type event = Raise | Resize | Move;;
<font color="maroon">type event = Raise | Resize | Move

</font><font color="black">#</font> let string_of_event = function
      Raise -&gt; "Raise" | Resize -&gt; "Resize" | Move -&gt; "Move";;
<font color="maroon">val string_of_event : event -&gt; string = &lt;fun&gt;

</font><font color="black">#</font> let count = ref 0;;
<font color="maroon">val count : int ref = {contents = 0}

</font><font color="black">#</font> class ['observer] window_subject =
    let id = count := succ !count; !count in
    object (self)
      inherit ['observer, event] subject
      val mutable position = 0
      method identity = id
      method move x = position &lt;- position + x; self#notify_observers Move
      method draw = Printf.printf "{Position = %d}\n"  position;
    end;;
<font color="maroon">class ['a] window_subject :
  object ('b)
    constraint 'a = &lt; notify : 'b -&gt; event -&gt; unit; .. &gt;
    val mutable observers : 'a list
    val mutable position : int
    method add_observer : 'a -&gt; unit
    method draw : unit
    method identity : int
    method move : int -&gt; unit
    method notify_observers : event -&gt; unit
  end

</font><font color="black">#</font> class ['subject] window_observer =
    object
      inherit ['subject, event] observer
      method notify s e = s#draw
    end;;
</font><font color="maroon">class ['a] window_observer :
  object
    constraint 'a = &lt; draw : unit; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</font></pre><p>
As can be expected, the type of <tt>window</tt> is recursive.
</p><pre><font color="black">#</font><font color="#006000"> let window = new window_subject;;
</font><font color="maroon">val window : &lt; notify : 'a -&gt; event -&gt; unit; _.. &gt; window_subject as 'a =
  &lt;obj&gt;
</font></pre><p>
However, the two classes of <tt>window_subject</tt> and <tt>window_observer</tt> are not
mutually recursive.
</p><pre><font color="black">#</font><font color="#006000"> let window_observer = new window_observer;;
<font color="maroon">val window_observer : &lt; draw : unit; _.. &gt; window_observer = &lt;obj&gt;

</font><font color="black">#</font> window#add_observer window_observer;;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> window#move 1;;
</font><font color="maroon">{Position = 1}
- : unit = ()
</font></pre><p>Classes <tt>window_observer</tt> and <tt>window_subject</tt> can still be extended by
inheritance. For instance, one may enrich the <tt>subject</tt> with new
behaviors and refine the behavior of the observer.
</p><pre><font color="black">#</font><font color="#006000"> class ['observer] richer_window_subject =
    object (self)
      inherit ['observer] window_subject
      val mutable size = 1
      method resize x = size &lt;- size + x; self#notify_observers Resize
      val mutable top = false
      method raise = top &lt;- true; self#notify_observers Raise
      method draw = Printf.printf "{Position = %d; Size = %d}\n"  position size;
    end;;
<font color="maroon">class ['a] richer_window_subject :
  object ('b)
    constraint 'a = &lt; notify : 'b -&gt; event -&gt; unit; .. &gt;
    val mutable observers : 'a list
    val mutable position : int
    val mutable size : int
    val mutable top : bool
    method add_observer : 'a -&gt; unit
    method draw : unit
    method identity : int
    method move : int -&gt; unit
    method notify_observers : event -&gt; unit
    method raise : unit
    method resize : int -&gt; unit
  end

</font><font color="black">#</font> class ['subject] richer_window_observer =
    object
      inherit ['subject] window_observer as super
      method notify s e = if e &lt;&gt; Raise then s#raise; super#notify s e
    end;;
</font><font color="maroon">class ['a] richer_window_observer :
  object
    constraint 'a = &lt; draw : unit; raise : unit; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</font></pre><p>
We can also create a different kind of observer:
</p><pre><font color="black">#</font><font color="#006000"> class ['subject] trace_observer =
    object
      inherit ['subject, event] observer
      method notify s e =
        Printf.printf
          "&lt;Window %d &lt;== %s&gt;\n" s#identity (string_of_event e)
    end;;
</font><font color="maroon">class ['a] trace_observer :
  object
    constraint 'a = &lt; identity : int; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</font></pre><p>
and attach several observers to the same object:
</p><pre><font color="black">#</font><font color="#006000"> let window = new richer_window_subject;;
<font color="maroon">val window :
  &lt; notify : 'a -&gt; event -&gt; unit; _.. &gt; richer_window_subject as 'a = &lt;obj&gt;

</font><font color="black">#</font> window#add_observer (new richer_window_observer);;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> window#add_observer (new trace_observer);;
<font color="maroon">- : unit = ()

</font><font color="black">#</font> window#move 1; window#resize 2;;
</font><font color="maroon">&lt;Window 1 &lt;== Move&gt;
&lt;Window 1 &lt;== Raise&gt;
{Position = 1; Size = 1}
{Position = 1; Size = 1}
&lt;Window 1 &lt;== Resize&gt;
&lt;Window 1 &lt;== Raise&gt;
{Position = 1; Size = 3}
{Position = 1; Size = 3}
- : unit = ()
</font></pre><hr>





<i class="authors">(Chapter written by Didier Rémy)</i><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>