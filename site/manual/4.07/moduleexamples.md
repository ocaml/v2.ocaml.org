<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="coreexamples.html">The core language</a></li><li class="active"><a href="moduleexamples.html">The module system</a></li><li><a href="objectexamples.html">Objects in OCaml</a></li><li><a href="lablexamples.html">Labels and variants</a></li><li><a href="polymorphism.html">Polymorphism and its limitations</a></li><li><a href="advexamples.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter" id="sec18"><span>Chapter 2</span>&nbsp;&nbsp;The module system</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.07</a></div><div class="toc_title"><a href="#">The module system</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec19">1&nbsp;&nbsp;Structures</a>
</li><li><a href="#sec20">2&nbsp;&nbsp;Signatures</a>
</li><li><a href="#sec21">3&nbsp;&nbsp;Functors</a>
</li><li><a href="#sec22">4&nbsp;&nbsp;Functors and type abstraction</a>
</li><li><a href="#sec23">5&nbsp;&nbsp;Modules and separate compilation</a>
</li></ul></nav></header>
<p> <a id="c:moduleexamples"></a>

</p><p>This chapter introduces the module system of OCaml.</p>
<h2 class="section" id="sec19">1&nbsp;&nbsp;Structures</h2>
<p>A primary motivation for modules is to package together related
definitions (such as the definitions of a data type and associated
operations over that type) and enforce a consistent naming scheme for
these definitions. This avoids running out of names or accidentally
confusing names. Such a package is called a <em>structure</em> and
is introduced by the <span class="c003">struct</span>…<span class="c003">end</span> construct, which contains an
arbitrary sequence of definitions. The structure is usually given a
name with the <span class="c003">module</span> binding. Here is for instance a structure
packaging together a type of priority queues and their operations:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">priority</span><span class="text"> = </span><span class="kw3">int</span><span class="text">
      </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text"> = </span><span class="kw2">Empty</span><span class="text"> | </span><span class="kw2">Node</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">priority</span><span class="text"> * '</span><span class="id">a</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">empty</span><span class="text"> = </span><span class="kw2">Empty</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">insert</span><span class="text"> </span><span class="id">queue</span><span class="text"> </span><span class="id">prio</span><span class="text"> </span><span class="id">elt</span><span class="text"> =
        </span><span class="kw1">match</span><span class="text"> </span><span class="id">queue</span><span class="text"> </span><span class="kw1">with</span><span class="text">
          </span><span class="kw2">Empty</span><span class="text"> -&gt; </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">)
        | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">p</span><span class="text">, </span><span class="id">e</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="id">right</span><span class="text">) -&gt;
            </span><span class="kw1">if</span><span class="text"> </span><span class="id">prio</span><span class="text"> &lt;= </span><span class="id">p</span><span class="text">
            </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="id">insert</span><span class="text"> </span><span class="id">right</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="id">e</span><span class="text">, </span><span class="id">left</span><span class="text">)
            </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">p</span><span class="text">, </span><span class="id">e</span><span class="text">, </span><span class="id">insert</span><span class="text"> </span><span class="id">right</span><span class="text"> </span><span class="id">prio</span><span class="text"> </span><span class="id">elt</span><span class="text">, </span><span class="id">left</span><span class="text">)
      </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">remove_top</span><span class="text"> = </span><span class="kw">function</span><span class="text">
          </span><span class="kw2">Empty</span><span class="text"> -&gt; </span><span class="id">raise</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text">
        | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">) -&gt; </span><span class="id">left</span><span class="text">
        | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="kw2">Empty</span><span class="text">, </span><span class="id">right</span><span class="text">) -&gt; </span><span class="id">right</span><span class="text">
        | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, (</span><span class="kw2">Node</span><span class="text">(</span><span class="id">lprio</span><span class="text">, </span><span class="id">lelt</span><span class="text">, </span><span class="numeric">_</span><span class="text">, </span><span class="numeric">_</span><span class="text">) </span><span class="kw1">as</span><span class="text"> </span><span class="id">left</span><span class="text">),
                          (</span><span class="kw2">Node</span><span class="text">(</span><span class="id">rprio</span><span class="text">, </span><span class="id">relt</span><span class="text">, </span><span class="numeric">_</span><span class="text">, </span><span class="numeric">_</span><span class="text">) </span><span class="kw1">as</span><span class="text"> </span><span class="id">right</span><span class="text">)) -&gt;
            </span><span class="kw1">if</span><span class="text"> </span><span class="id">lprio</span><span class="text"> &lt;= </span><span class="id">rprio</span><span class="text">
            </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">lprio</span><span class="text">, </span><span class="id">lelt</span><span class="text">, </span><span class="id">remove_top</span><span class="text"> </span><span class="id">left</span><span class="text">, </span><span class="id">right</span><span class="text">)
            </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Node</span><span class="text">(</span><span class="id">rprio</span><span class="text">, </span><span class="id">relt</span><span class="text">, </span><span class="id">left</span><span class="text">, </span><span class="id">remove_top</span><span class="text"> </span><span class="id">right</span><span class="text">)
      </span><span class="kw">let</span><span class="text"> </span><span class="id">extract</span><span class="text"> = </span><span class="kw">function</span><span class="text">
          </span><span class="kw2">Empty</span><span class="text"> -&gt; </span><span class="id">raise</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text">
        | </span><span class="kw2">Node</span><span class="text">(</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="numeric">_</span><span class="text">, </span><span class="numeric">_</span><span class="text">) </span><span class="kw1">as</span><span class="text"> </span><span class="id">queue</span><span class="text"> -&gt; (</span><span class="id">prio</span><span class="text">, </span><span class="id">elt</span><span class="text">, </span><span class="id">remove_top</span><span class="text"> </span><span class="id">queue</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module PrioQueue :
  sig
    type priority = int
    type 'a queue = Empty | Node of priority * 'a * 'a queue * 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; priority -&gt; 'a -&gt; 'a queue
    exception Queue_is_empty
    val remove_top : 'a queue -&gt; 'a queue
    val extract : 'a queue -&gt; priority * 'a * 'a queue
  end
</code></pre>


</div><p>

Outside the structure, its components can be referred to using the
“dot notation”, that is, identifiers qualified by a structure name.
For instance, <span class="c003">PrioQueue.insert</span> is the function <span class="c003">insert</span> defined
inside the structure <span class="c003">PrioQueue</span> and <span class="c003">PrioQueue.queue</span> is the type
<span class="c003">queue</span> defined in <span class="c003">PrioQueue</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text">.</span><span class="id">insert</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text">.</span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">;;
</span></code><code class="caml-output ok">- : string PrioQueue.queue =
PrioQueue.Node (1, "hello", PrioQueue.Empty, PrioQueue.Empty)
</code></pre>


</div><p>Another possibility is to open the module, which brings all
identifiers defined inside the module in the scope of the current
structure.</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">open</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text">;;
</span></code><code class="caml-output ok">
</code></pre>

<pre><code class="caml-input"><span class="text">   </span><span class="id">insert</span><span class="text"> </span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">;;
</span></code><code class="caml-output ok">- : string PrioQueue.queue = Node (1, "hello", Empty, Empty)
</code></pre>


</div><p>Opening a module enables lighter access to its components, at the
cost of making it harder to identify in which module a identifier
has been defined. In particular, opened modules can shadow
identifiers present in the current scope, potentially leading
to confusing errors:</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">let</span><span class="text"> </span><span class="id">empty</span><span class="text"> = []
    </span><span class="kw">open</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text">;;
</span></code><code class="caml-output ok">val empty : 'a list = []
</code></pre>

<pre><code class="caml-input">   let x = 1 :: <u>empty</u> ;;
</code><code class="caml-output error">Error: This expression has type 'a PrioQueue.queue
       but an expression was expected of type int list
</code></pre>


</div><p>A partial solution to this conundrum is to open modules locally,
making the components of the module available only in the
concerned expression. This can also make the code easier to read
– the open statement is closer to where it is used– and to refactor
– the code fragment is more self-contained.
Two constructions are available for this purpose:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">let</span><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="id">insert</span><span class="text"> </span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">;;
</span></code><code class="caml-output ok">- : string PrioQueue.queue = Node (1, "hello", Empty, Empty)
</code></pre>


</div><p>

and


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw2">PrioQueue</span><span class="text">.(</span><span class="id">insert</span><span class="text"> </span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">);;
</span></code><code class="caml-output ok">- : string PrioQueue.queue = Node (1, "hello", Empty, Empty)
</code></pre>


</div><p>

In the second form, when the body of a local open is itself delimited
by parentheses, braces or bracket, the parentheses of the local open
can be omitted. For instance,


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw2">PrioQueue</span><span class="text">.[</span><span class="id">empty</span><span class="text">] = </span><span class="kw2">PrioQueue</span><span class="text">.([</span><span class="id">empty</span><span class="text">]);;
</span></code><code class="caml-output ok">- : bool = true
</code></pre>

<pre><code class="caml-input"><span class="text">   </span><span class="kw2">PrioQueue</span><span class="text">.[|</span><span class="id">empty</span><span class="text">|] = </span><span class="kw2">PrioQueue</span><span class="text">.([|</span><span class="id">empty</span><span class="text">|]);;
</span></code><code class="caml-output ok">- : bool = true
</code></pre>

<pre><code class="caml-input"><span class="text">    </span><span class="kw2">PrioQueue</span><span class="text">.{ </span><span class="id">contents</span><span class="text"> = </span><span class="id">empty</span><span class="text"> } = </span><span class="kw2">PrioQueue</span><span class="text">.({ </span><span class="id">contents</span><span class="text"> = </span><span class="id">empty</span><span class="text"> });;
</span></code><code class="caml-output ok">- : bool = true
</code></pre>


</div><p>

becomes


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw2">PrioQueue</span><span class="text">.[</span><span class="id">insert</span><span class="text"> </span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">];;
</span></code><code class="caml-output ok">- : string PrioQueue.queue list = [Node (1, "hello", Empty, Empty)]
</code></pre>


</div><p>It is also possible to copy the components of a module inside
another module by using an <span class="c003">include</span> statement. This can be
particularly useful to extend existing modules. As an illustration,
we could add functions that returns an optional value rather than
an exception when the priority queue is empty.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">PrioQueueOpt</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">include</span><span class="text"> </span><span class="kw2">PrioQueue</span><span class="text">

      </span><span class="kw">let</span><span class="text"> </span><span class="id">remove_top_opt</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw1">try</span><span class="text"> </span><span class="kw2">Some</span><span class="text">(</span><span class="id">remove_top</span><span class="text"> </span><span class="id">x</span><span class="text">) </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">

      </span><span class="kw">let</span><span class="text"> </span><span class="id">extract_opt</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw1">try</span><span class="text"> </span><span class="kw2">Some</span><span class="text">(</span><span class="id">extract</span><span class="text"> </span><span class="id">x</span><span class="text">) </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module PrioQueueOpt :
  sig
    type priority = int
    type 'a queue =
      'a PrioQueue.queue =
        Empty
      | Node of priority * 'a * 'a queue * 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; priority -&gt; 'a -&gt; 'a queue
    exception Queue_is_empty
    val remove_top : 'a queue -&gt; 'a queue
    val extract : 'a queue -&gt; priority * 'a * 'a queue
    val remove_top_opt : 'a queue -&gt; 'a queue option
    val extract_opt : 'a queue -&gt; (priority * 'a * 'a queue) option
  end
</code></pre>


</div>
<h2 class="section" id="sec20">2&nbsp;&nbsp;Signatures</h2>
<p>Signatures are interfaces for structures. A signature specifies
which components of a structure are accessible from the outside, and
with which type. It can be used to hide some components of a structure
(e.g. local function definitions) or export some components with a
restricted type. For instance, the signature below specifies the three
priority queue operations <span class="c003">empty</span>, <span class="c003">insert</span> and <span class="c003">extract</span>, but not the
auxiliary function <span class="c003">remove_top</span>. Similarly, it makes the <span class="c003">queue</span> type
abstract (by not providing its actual representation as a concrete type).


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">PRIOQUEUE</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">priority</span><span class="text"> = </span><span class="kw3">int</span><span class="text">         </span><span class="comment">(* still concrete *)</span><span class="text">
      </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">               </span><span class="comment">(* now abstract *)</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">empty</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">insert</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">extract</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> * '</span><span class="id">a</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">
      </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">Queue_is_empty</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type PRIOQUEUE =
  sig
    type priority = int
    type 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; int -&gt; 'a -&gt; 'a queue
    val extract : 'a queue -&gt; int * 'a * 'a queue
    exception Queue_is_empty
  end
</code></pre>


</div><p>

Restricting the <span class="c003">PrioQueue</span> structure by this signature results in
another view of the <span class="c003">PrioQueue</span> structure where the <span class="c003">remove_top</span>
function is not accessible and the actual representation of priority
queues is hidden:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">AbstractPrioQueue</span><span class="text"> = (</span><span class="kw2">PrioQueue</span><span class="text"> : </span><span class="kw2">PRIOQUEUE</span><span class="text">);;
</span></code><code class="caml-output ok">module AbstractPrioQueue : PRIOQUEUE
</code></pre>

<pre><code class="caml-input"> <u>AbstractPrioQueue.remove_top</u> ;;
</code><code class="caml-output error">Error: Unbound value AbstractPrioQueue.remove_top
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">AbstractPrioQueue</span><span class="text">.</span><span class="id">insert</span><span class="text"> </span><span class="kw2">AbstractPrioQueue</span><span class="text">.</span><span class="id">empty</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="string">"hello"</span><span class="text">;;
</span></code><code class="caml-output ok">- : string AbstractPrioQueue.queue = &lt;abstr&gt;
</code></pre>


</div><p>

The restriction can also be performed during the definition of the
structure, as in
</p><pre>module PrioQueue = (struct ... end : PRIOQUEUE);;
</pre><p>An alternate syntax is provided for the above:
</p><pre>module PrioQueue : PRIOQUEUE = struct ... end;;
</pre><p>
Like for modules, it is possible to include a signature to copy
its components inside the current signature. For instance, we
can extend the PRIOQUEUE signature with the <span class="c003">extract_opt</span>
function:</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">PRIOQUEUE_WITH_OPT</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">include</span><span class="text"> </span><span class="kw2">PRIOQUEUE</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">extract_opt</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text"> -&gt; (</span><span class="kw3">int</span><span class="text"> * '</span><span class="id">a</span><span class="text"> * '</span><span class="id">a</span><span class="text"> </span><span class="id">queue</span><span class="text">) </span><span class="id">option</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type PRIOQUEUE_WITH_OPT =
  sig
    type priority = int
    type 'a queue
    val empty : 'a queue
    val insert : 'a queue -&gt; int -&gt; 'a -&gt; 'a queue
    val extract : 'a queue -&gt; int * 'a * 'a queue
    exception Queue_is_empty
    val extract_opt : 'a queue -&gt; (int * 'a * 'a queue) option
  end
</code></pre>


</div>
<h2 class="section" id="sec21">3&nbsp;&nbsp;Functors</h2>
<p>Functors are “functions” from modules to modules. Functors let you create
parameterized modules and then provide other modules as parameter(s) to get
a specific implementation. For instance, a <span class="c003">Set</span> module implementing sets
as sorted lists could be parameterized to work with any module that provides
an element type and a comparison function <span class="c003">compare</span> (such as <span class="c003">OrderedString</span>):</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">comparison</span><span class="text"> = </span><span class="kw2">Less</span><span class="text"> | </span><span class="kw2">Equal</span><span class="text"> | </span><span class="kw2">Greater</span><span class="text">;;
</span></code><code class="caml-output ok">type comparison = Less | Equal | Greater
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">ORDERED_TYPE</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">compare</span><span class="text">: </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">comparison</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type ORDERED_TYPE = sig type t val compare : t -&gt; t -&gt; comparison end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Set</span><span class="text"> =
    </span><span class="kw">functor</span><span class="text"> (</span><span class="kw2">Elt</span><span class="text">: </span><span class="kw2">ORDERED_TYPE</span><span class="text">) -&gt;
      </span><span class="kw1">struct</span><span class="text">
        </span><span class="kw">type</span><span class="text"> </span><span class="id">element</span><span class="text"> = </span><span class="kw2">Elt</span><span class="text">.</span><span class="id">t</span><span class="text">
        </span><span class="kw">type</span><span class="text"> </span><span class="id">set</span><span class="text"> = </span><span class="id">element</span><span class="text"> </span><span class="kw3">list</span><span class="text">
        </span><span class="kw">let</span><span class="text"> </span><span class="id">empty</span><span class="text"> = []
        </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">add</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">s</span><span class="text"> =
          </span><span class="kw1">match</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="kw1">with</span><span class="text">
            [] -&gt; [</span><span class="id">x</span><span class="text">]
          | </span><span class="id">hd</span><span class="text">::</span><span class="id">tl</span><span class="text"> -&gt;
             </span><span class="kw1">match</span><span class="text"> </span><span class="kw2">Elt</span><span class="text">.</span><span class="id">compare</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">hd</span><span class="text"> </span><span class="kw1">with</span><span class="text">
               </span><span class="kw2">Equal</span><span class="text">   -&gt; </span><span class="id">s</span><span class="text">         </span><span class="comment">(* x is already in s *)</span><span class="text">
             | </span><span class="kw2">Less</span><span class="text">    -&gt; </span><span class="id">x</span><span class="text"> :: </span><span class="id">s</span><span class="text">    </span><span class="comment">(* x is smaller than all elements of s *)</span><span class="text">
             | </span><span class="kw2">Greater</span><span class="text"> -&gt; </span><span class="id">hd</span><span class="text"> :: </span><span class="id">add</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">tl</span><span class="text">
        </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">member</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">s</span><span class="text"> =
          </span><span class="kw1">match</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="kw1">with</span><span class="text">
            [] -&gt; </span><span class="constant">false</span><span class="text">
          | </span><span class="id">hd</span><span class="text">::</span><span class="id">tl</span><span class="text"> -&gt;
              </span><span class="kw1">match</span><span class="text"> </span><span class="kw2">Elt</span><span class="text">.</span><span class="id">compare</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">hd</span><span class="text"> </span><span class="kw1">with</span><span class="text">
                </span><span class="kw2">Equal</span><span class="text">   -&gt; </span><span class="constant">true</span><span class="text">     </span><span class="comment">(* x belongs to s *)</span><span class="text">
              | </span><span class="kw2">Less</span><span class="text">    -&gt; </span><span class="constant">false</span><span class="text">    </span><span class="comment">(* x is smaller than all elements of s *)</span><span class="text">
              | </span><span class="kw2">Greater</span><span class="text"> -&gt; </span><span class="id">member</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">tl</span><span class="text">
      </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module Set :
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set = element list
      val empty : 'a list
      val add : Elt.t -&gt; Elt.t list -&gt; Elt.t list
      val member : Elt.t -&gt; Elt.t list -&gt; bool
    end
</code></pre>


</div><p>

By applying the <span class="c003">Set</span> functor to a structure implementing an ordered
type, we obtain set operations for this type:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">OrderedString</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">string</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Equal</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="text"> &lt; </span><span class="id">y</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Less</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Greater</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module OrderedString :
  sig type t = string val compare : 'a -&gt; 'a -&gt; comparison end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">StringSet</span><span class="text"> = </span><span class="kw2">Set</span><span class="text">(</span><span class="kw2">OrderedString</span><span class="text">);;
</span></code><code class="caml-output ok">module StringSet :
  sig
    type element = OrderedString.t
    type set = element list
    val empty : 'a list
    val add : OrderedString.t -&gt; OrderedString.t list -&gt; OrderedString.t list
    val member : OrderedString.t -&gt; OrderedString.t list -&gt; bool
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">StringSet</span><span class="text">.</span><span class="id">member</span><span class="text"> </span><span class="string">"bar"</span><span class="text"> (</span><span class="kw2">StringSet</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="string">"foo"</span><span class="text"> </span><span class="kw2">StringSet</span><span class="text">.</span><span class="id">empty</span><span class="text">);;
</span></code><code class="caml-output ok">- : bool = false
</code></pre>


</div>
<h2 class="section" id="sec22">4&nbsp;&nbsp;Functors and type abstraction</h2>
<p>As in the <span class="c003">PrioQueue</span> example, it would be good style to hide the
actual implementation of the type <span class="c003">set</span>, so that users of the
structure will not rely on sets being lists, and we can switch later
to another, more efficient representation of sets without breaking
their code. This can be achieved by restricting <span class="c003">Set</span> by a suitable
functor signature:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">SETFUNCTOR</span><span class="text"> =
    </span><span class="kw">functor</span><span class="text"> (</span><span class="kw2">Elt</span><span class="text">: </span><span class="kw2">ORDERED_TYPE</span><span class="text">) -&gt;
      </span><span class="kw1">sig</span><span class="text">
        </span><span class="kw">type</span><span class="text"> </span><span class="id">element</span><span class="text"> = </span><span class="kw2">Elt</span><span class="text">.</span><span class="id">t</span><span class="text">      </span><span class="comment">(* concrete *)</span><span class="text">
        </span><span class="kw">type</span><span class="text"> </span><span class="id">set</span><span class="text">                  </span><span class="comment">(* abstract *)</span><span class="text">
        </span><span class="kw">val</span><span class="text"> </span><span class="id">empty</span><span class="text"> : </span><span class="id">set</span><span class="text">
        </span><span class="kw">val</span><span class="text"> </span><span class="id">add</span><span class="text"> : </span><span class="id">element</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text">
        </span><span class="kw">val</span><span class="text"> </span><span class="id">member</span><span class="text"> : </span><span class="id">element</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">
      </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type SETFUNCTOR =
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set
      val empty : set
      val add : element -&gt; set -&gt; set
      val member : element -&gt; set -&gt; bool
    end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">AbstractSet</span><span class="text"> = (</span><span class="kw2">Set</span><span class="text"> : </span><span class="kw2">SETFUNCTOR</span><span class="text">);;
</span></code><code class="caml-output ok">module AbstractSet : SETFUNCTOR
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">AbstractStringSet</span><span class="text"> = </span><span class="kw2">AbstractSet</span><span class="text">(</span><span class="kw2">OrderedString</span><span class="text">);;
</span></code><code class="caml-output ok">module AbstractStringSet :
  sig
    type element = OrderedString.t
    type set = AbstractSet(OrderedString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw2">AbstractStringSet</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="string">"gee"</span><span class="text"> </span><span class="kw2">AbstractStringSet</span><span class="text">.</span><span class="id">empty</span><span class="text">;;
</span></code><code class="caml-output ok">- : AbstractStringSet.set = &lt;abstr&gt;
</code></pre>


</div><p>In an attempt to write the type constraint above more elegantly,
one may wish to name the signature of the structure
returned by the functor, then use that signature in the constraint:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">SET</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">element</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">set</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">empty</span><span class="text"> : </span><span class="id">set</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">add</span><span class="text"> : </span><span class="id">element</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="id">member</span><span class="text"> : </span><span class="id">element</span><span class="text"> -&gt; </span><span class="id">set</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module type SET =
  sig
    type element
    type set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">WrongSet</span><span class="text"> = (</span><span class="kw2">Set</span><span class="text"> : </span><span class="kw">functor</span><span class="text">(</span><span class="kw2">Elt</span><span class="text">: </span><span class="kw2">ORDERED_TYPE</span><span class="text">) -&gt; </span><span class="kw2">SET</span><span class="text">);;
</span></code><code class="caml-output ok">module WrongSet : functor (Elt : ORDERED_TYPE) -&gt; SET
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">WrongStringSet</span><span class="text"> = </span><span class="kw2">WrongSet</span><span class="text">(</span><span class="kw2">OrderedString</span><span class="text">);;
</span></code><code class="caml-output ok">module WrongStringSet :
  sig
    type element = WrongSet(OrderedString).element
    type set = WrongSet(OrderedString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end
</code></pre>

<pre><code class="caml-input"> WrongStringSet.add <u>"gee"</u> WrongStringSet.empty ;;
</code><code class="caml-output error">Error: This expression has type string but an expression was expected of type
         WrongStringSet.element = WrongSet(OrderedString).element
</code></pre>


</div><p>

The problem here is that <span class="c003">SET</span> specifies the type <span class="c003">element</span>
abstractly, so that the type equality between <span class="c003">element</span> in the result
of the functor and <span class="c003">t</span> in its argument is forgotten. Consequently,
<span class="c003">WrongStringSet.element</span> is not the same type as <span class="c003">string</span>, and the
operations of <span class="c003">WrongStringSet</span> cannot be applied to strings.
As demonstrated above, it is important that the type <span class="c003">element</span> in the
signature <span class="c003">SET</span> be declared equal to <span class="c003">Elt.t</span>; unfortunately, this is
impossible above since <span class="c003">SET</span> is defined in a context where <span class="c003">Elt</span> does
not exist. To overcome this difficulty, OCaml provides a
<span class="c003">with type</span> construct over signatures that allows enriching a signature
with extra type equalities:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">AbstractSet2</span><span class="text"> =
    (</span><span class="kw2">Set</span><span class="text"> : </span><span class="kw">functor</span><span class="text">(</span><span class="kw2">Elt</span><span class="text">: </span><span class="kw2">ORDERED_TYPE</span><span class="text">) -&gt; (</span><span class="kw2">SET</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">element</span><span class="text"> = </span><span class="kw2">Elt</span><span class="text">.</span><span class="id">t</span><span class="text">));;
</span></code><code class="caml-output ok">module AbstractSet2 :
  functor (Elt : ORDERED_TYPE) -&gt;
    sig
      type element = Elt.t
      type set
      val empty : set
      val add : element -&gt; set -&gt; set
      val member : element -&gt; set -&gt; bool
    end
</code></pre>


</div><p>As in the case of simple structures, an alternate syntax is provided
for defining functors and restricting their result:
</p><pre>module AbstractSet2(Elt: ORDERED_TYPE) : (SET with type element = Elt.t) =
  struct ... end;;
</pre><p>
Abstracting a type component in a functor result is a powerful
technique that provides a high degree of type safety, as we now
illustrate. Consider an ordering over character strings that is
different from the standard ordering implemented in the
<span class="c003">OrderedString</span> structure. For instance, we compare strings without
distinguishing upper and lower case.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">NoCaseString</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">string</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text"> </span><span class="id">s1</span><span class="text"> </span><span class="id">s2</span><span class="text"> =
        </span><span class="kw2">OrderedString</span><span class="text">.</span><span class="id">compare</span><span class="text"> (</span><span class="kw2">String</span><span class="text">.</span><span class="id">lowercase_ascii</span><span class="text"> </span><span class="id">s1</span><span class="text">) (</span><span class="kw2">String</span><span class="text">.</span><span class="id">lowercase_ascii</span><span class="text"> </span><span class="id">s2</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">module NoCaseString :
  sig type t = string val compare : string -&gt; string -&gt; comparison end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">NoCaseStringSet</span><span class="text"> = </span><span class="kw2">AbstractSet</span><span class="text">(</span><span class="kw2">NoCaseString</span><span class="text">);;
</span></code><code class="caml-output ok">module NoCaseStringSet :
  sig
    type element = NoCaseString.t
    type set = AbstractSet(NoCaseString).set
    val empty : set
    val add : element -&gt; set -&gt; set
    val member : element -&gt; set -&gt; bool
  end
</code></pre>

<pre><code class="caml-input"> NoCaseStringSet.add "FOO" <u>AbstractStringSet.empty</u> ;;
</code><code class="caml-output error">Error: This expression has type
         AbstractStringSet.set = AbstractSet(OrderedString).set
       but an expression was expected of type
         NoCaseStringSet.set = AbstractSet(NoCaseString).set
</code></pre>


</div><p>

Note that the two types <span class="c003">AbstractStringSet.set</span> and
<span class="c003">NoCaseStringSet.set</span> are not compatible, and values of these
two types do not match. This is the correct behavior: even though both
set types contain elements of the same type (strings), they are built
upon different orderings of that type, and different invariants need
to be maintained by the operations (being strictly increasing for the
standard ordering and for the case-insensitive ordering). Applying
operations from <span class="c003">AbstractStringSet</span> to values of type
<span class="c003">NoCaseStringSet.set</span> could give incorrect results, or build
lists that violate the invariants of <span class="c003">NoCaseStringSet</span>.</p>
<h2 class="section" id="sec23">5&nbsp;&nbsp;Modules and separate compilation</h2>
<p>All examples of modules so far have been given in the context of the
interactive system. However, modules are most useful for large,
batch-compiled programs. For these programs, it is a practical
necessity to split the source into several files, called compilation
units, that can be compiled separately, thus minimizing recompilation
after changes.</p><p>In OCaml, compilation units are special cases of structures
and signatures, and the relationship between the units can be
explained easily in terms of the module system. A compilation unit <span class="c009">A</span>
comprises two files:
</p><ul class="itemize"><li class="li-itemize">
the implementation file <span class="c009">A</span><span class="c003">.ml</span>, which contains a sequence
of definitions, analogous to the inside of a <span class="c003">struct</span>…<span class="c003">end</span>
construct;
</li><li class="li-itemize">the interface file <span class="c009">A</span><span class="c003">.mli</span>, which contains a sequence of
specifications, analogous to the inside of a <span class="c003">sig</span>…<span class="c003">end</span>
construct.
</li></ul><p>
These two files together define a structure named <span class="c009">A</span> as if
the following definition was entered at top-level:
</p><pre>module <span class="c009">A</span>: sig (* contents of file <span class="c009">A</span>.mli *) end
        = struct (* contents of file <span class="c009">A</span>.ml *) end;;
</pre><p>
The files that define the compilation units can be compiled separately
using the <span class="c003">ocamlc -c</span> command (the <span class="c003">-c</span> option means “compile only, do
not try to link”); this produces compiled interface files (with
extension <span class="c003">.cmi</span>) and compiled object code files (with extension
<span class="c003">.cmo</span>). When all units have been compiled, their <span class="c003">.cmo</span> files are
linked together using the <span class="c003">ocamlc</span> command. For instance, the following
commands compile and link a program composed of two compilation units
<span class="c003">Aux</span> and <span class="c003">Main</span>:
</p><pre>$ ocamlc -c Aux.mli                     # produces aux.cmi
$ ocamlc -c Aux.ml                      # produces aux.cmo
$ ocamlc -c Main.mli                    # produces main.cmi
$ ocamlc -c Main.ml                     # produces main.cmo
$ ocamlc -o theprogram Aux.cmo Main.cmo
</pre><p>The program behaves exactly as if the following phrases were entered
at top-level:
</p><pre>module Aux: sig (* contents of Aux.mli *) end
          = struct (* contents of Aux.ml *) end;;
module Main: sig (* contents of Main.mli *) end
           = struct (* contents of Main.ml *) end;;
</pre><p>
In particular, <span class="c003">Main</span> can refer to <span class="c003">Aux</span>: the definitions and
declarations contained in <span class="c003">Main.ml</span> and <span class="c003">Main.mli</span> can refer to
definition in <span class="c003">Aux.ml</span>, using the <span class="c003">Aux.</span><span class="c009">ident</span> notation, provided
these definitions are exported in <span class="c003">Aux.mli</span>.</p><p>The order in which the <span class="c003">.cmo</span> files are given to <span class="c003">ocamlc</span> during the
linking phase determines the order in which the module definitions
occur. Hence, in the example above, <span class="c003">Aux</span> appears first and <span class="c003">Main</span> can
refer to it, but <span class="c003">Aux</span> cannot refer to <span class="c003">Main</span>.</p><p>Note that only top-level structures can be mapped to
separately-compiled files, but neither functors nor module types.
However, all module-class objects can appear as components of a
structure, so the solution is to put the functor or module type
inside a structure, which can then be mapped to a file.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>