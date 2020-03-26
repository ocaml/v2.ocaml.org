<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="coreexamples.html">The core language</a></li><li><a href="moduleexamples.html">The module system</a></li><li><a href="objectexamples.html">Objects in OCaml</a></li><li><a href="lablexamples.html">Labels and variants</a></li><li><a href="polymorphism.html">Polymorphism and its limitations</a></li><li class="active"><a href="advexamples.html">Advanced examples with classes and modules</a></li></ul>




<h1 class="chapter" id="sec64"><span>Chapter 6</span>&nbsp;&nbsp;Advanced examples with classes and modules</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">Advanced examples with classes and modules</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="advexamples.html#sec65">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li><a href="advexamples.html#sec66">2&nbsp;&nbsp;Simple modules as classes</a>
</li><li><a href="advexamples.html#sec71">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul></nav></header>
<p>
<a id="c:advexamples"></a></p><p></p><p><br>
<br>
</p><p>In this chapter, we show some larger examples using objects, classes
and modules. We review many of the object features simultaneously on
the example of a bank account. We show how modules taken from the
standard library can be expressed as classes. Lastly, we describe a
programming pattern known as <em>virtual types</em> through the example
of window managers.</p>
<h2 class="section" id="sec65">1&nbsp;&nbsp;Extended example: bank accounts</h2>
<p>
<a id="ss:bank-accounts"></a></p><p>In this section, we illustrate most aspects of Object and inheritance
by refining, debugging, and specializing the following
initial naive definition of a simple bank account. (We reuse the
module <span class="c003">Euro</span> defined at the end of chapter&nbsp;<a href="objectexamples.html#c%3Aobjectexamples">3</a>.)


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">euro</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="kw2">Euro</span><span class="text">.</span><span class="id">c</span><span class="text">;;
</span></code><code class="caml-output ok">val euro : float -&gt; Euro.c = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">zero</span><span class="text"> = </span><span class="id">euro</span><span class="text"> </span><span class="numeric">0</span><span class="text">.;;
</span></code><code class="caml-output ok">val zero : Euro.c = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">neg</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x</span><span class="kw1">#</span><span class="id">times</span><span class="text"> (</span><span class="numeric">-1</span><span class="text">.);;
</span></code><code class="caml-output ok">val neg : &lt; times : float -&gt; 'a; .. &gt; -&gt; 'a = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">account</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">balance</span><span class="text"> = </span><span class="id">zero</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">balance</span><span class="text"> = </span><span class="id">balance</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">balance</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">plus</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">balance</span><span class="text"> </span><span class="kw1">then</span><span class="text"> (</span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">balance</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">plus</span><span class="text"> (</span><span class="id">neg</span><span class="text"> </span><span class="id">x</span><span class="text">); </span><span class="id">x</span><span class="text">) </span><span class="kw1">else</span><span class="text"> </span><span class="id">zero</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">account</span><span class="text"> </span><span class="kw">in</span><span class="text"> </span><span class="id">c</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">deposit</span><span class="text"> (</span><span class="id">euro</span><span class="text"> </span><span class="numeric">100</span><span class="text">.); </span><span class="id">c</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> (</span><span class="id">euro</span><span class="text"> </span><span class="numeric">50</span><span class="text">.);;
</span></code><code class="caml-output ok">- : Euro.c = &lt;obj&gt;
</code></pre>


</div><p>

We now refine this definition with a method to compute interest.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">account_with_interests</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">account</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">private</span><span class="text"> </span><span class="id">interest</span><span class="text"> = </span><span class="id">self</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">deposit</span><span class="text"> (</span><span class="id">self</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">balance</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">times</span><span class="text"> </span><span class="numeric">0.03</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class account_with_interests :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method private interest : unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</code></pre>


</div><p>

We make the method <span class="c003">interest</span> private, since clearly it should not be
called freely from the outside. Here, it is only made accessible to subclasses
that will manage monthly or yearly updates of the account.</p><p>We should soon fix a bug in the current definition: the deposit method can
be used for withdrawing money by depositing negative amounts. We can
fix this directly:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">safe_account</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">account</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">zero</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">balance</span><span class="kw1">#</span><span class="id">plus</span><span class="text"> </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class safe_account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</code></pre>


</div><p>

However, the bug might be fixed more safely by the following definition:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">safe_account</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">account</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">unsafe</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw1">if</span><span class="text"> </span><span class="id">zero</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">unsafe</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text">
        </span><span class="kw1">else</span><span class="text"> </span><span class="id">raise</span><span class="text"> (</span><span class="kw2">Invalid_argument</span><span class="text"> </span><span class="string">"deposit"</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class safe_account :
  object
    val mutable balance : Euro.c
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</code></pre>


</div><p>

In particular, this does not require the knowledge of the implementation of
the method <span class="c003">deposit</span>.</p><p>To keep track of operations, we extend the class with a mutable field
<span class="c003">history</span> and a private method <span class="c003">trace</span> to add an operation in the
log. Then each method to be traced is redefined.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">operation</span><span class="text"> = </span><span class="kw2">Deposit</span><span class="text"> </span><span class="kw">of</span><span class="text"> '</span><span class="id">a</span><span class="text"> | </span><span class="kw2">Retrieval</span><span class="text"> </span><span class="kw">of</span><span class="text"> '</span><span class="id">a</span><span class="text">;;
</span></code><code class="caml-output ok">type 'a operation = Deposit of 'a | Retrieval of 'a
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">account_with_history</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">safe_account</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">super</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">history</span><span class="text"> = []
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">private</span><span class="text"> </span><span class="id">trace</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">history</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text"> :: </span><span class="id">history</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">self</span><span class="kw1">#</span><span class="id">trace</span><span class="text"> (</span><span class="kw2">Deposit</span><span class="text"> </span><span class="id">x</span><span class="text">);  </span><span class="id">super</span><span class="kw1">#</span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">self</span><span class="kw1">#</span><span class="id">trace</span><span class="text"> (</span><span class="kw2">Retrieval</span><span class="text"> </span><span class="id">x</span><span class="text">); </span><span class="id">super</span><span class="kw1">#</span><span class="id">withdraw</span><span class="text"> </span><span class="id">x</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">history</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">rev</span><span class="text"> </span><span class="id">history</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class account_with_history :
  object
    val mutable balance : Euro.c
    val mutable history : Euro.c operation list
    method balance : Euro.c
    method deposit : Euro.c -&gt; unit
    method history : Euro.c operation list
    method private trace : Euro.c operation -&gt; unit
    method withdraw : Euro.c -&gt; Euro.c
  end
</code></pre>


</div><p>

One may wish to open an account and simultaneously deposit some initial
amount. Although the initial implementation did not address this
requirement, it can be achieved by using an initializer.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">account_with_deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">account_with_history</span><span class="text">
      </span><span class="kw">initializer</span><span class="text"> </span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class account_with_deposit :
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
</code></pre>


</div><p>

A better alternative is:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">account_with_deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> </span><span class="id">account_with_history</span><span class="text">
      </span><span class="kw">initializer</span><span class="text"> </span><span class="id">self</span><span class="kw1">#</span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class account_with_deposit :
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
</code></pre>


</div><p>

Indeed, the latter is safer since the call to <span class="c003">deposit</span> will automatically
benefit from safety checks and from the trace.
Let’s test it:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">ccp</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">account_with_deposit</span><span class="text"> (</span><span class="id">euro</span><span class="text"> </span><span class="numeric">100</span><span class="text">.) </span><span class="kw">in</span><span class="text">
  </span><span class="kw">let</span><span class="text"> </span><span class="id">_balance</span><span class="text"> = </span><span class="id">ccp</span><span class="kw1">#</span><span class="id">withdraw</span><span class="text"> (</span><span class="id">euro</span><span class="text"> </span><span class="numeric">50</span><span class="text">.) </span><span class="kw">in</span><span class="text">
  </span><span class="id">ccp</span><span class="kw1">#</span><span class="id">history</span><span class="text">;;
</span></code><code class="caml-output ok">- : Euro.c operation list = [Deposit &lt;obj&gt;; Retrieval &lt;obj&gt;]
</code></pre>


</div><p>

Closing an account can be done with the following polymorphic function:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">close</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="id">c</span><span class="kw1">#</span><span class="id">withdraw</span><span class="text"> </span><span class="id">c</span><span class="kw1">#</span><span class="id">balance</span><span class="text">;;
</span></code><code class="caml-output ok">val close : &lt; balance : 'a; withdraw : 'a -&gt; 'b; .. &gt; -&gt; 'b = &lt;fun&gt;
</code></pre>


</div><p>

Of course, this applies to all sorts of accounts.</p><p>Finally, we gather several versions of the account into a module <span class="c003">Account</span>
abstracted over some currency.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">today</span><span class="text"> () = (</span><span class="numeric">01</span><span class="text">,</span><span class="numeric">01</span><span class="text">,</span><span class="numeric">2000</span><span class="text">) </span><span class="comment">(* an approximation *)</span><span class="text">
  </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Account</span><span class="text"> (</span><span class="kw2">M</span><span class="text">:</span><span class="kw2">MONEY</span><span class="text">) =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="kw2">M</span><span class="text">.</span><span class="id">c</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="kw2">M</span><span class="text">.</span><span class="id">c</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="id">zero</span><span class="text"> = </span><span class="id">m</span><span class="text"> </span><span class="numeric">0</span><span class="text">.

      </span><span class="kw">class</span><span class="text"> </span><span class="id">bank</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
          </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">balance</span><span class="text"> = </span><span class="id">zero</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">balance</span><span class="text"> = </span><span class="id">balance</span><span class="text">
          </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">history</span><span class="text"> = []
          </span><span class="kw">method</span><span class="text"> </span><span class="kw">private</span><span class="text"> </span><span class="id">trace</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">history</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text">::</span><span class="id">history</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> =
            </span><span class="id">self</span><span class="kw1">#</span><span class="id">trace</span><span class="text"> (</span><span class="kw2">Deposit</span><span class="text"> </span><span class="id">x</span><span class="text">);
            </span><span class="kw1">if</span><span class="text"> </span><span class="id">zero</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">balance</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">plus</span><span class="text"> </span><span class="id">x</span><span class="text">
            </span><span class="kw1">else</span><span class="text"> </span><span class="id">raise</span><span class="text"> (</span><span class="kw2">Invalid_argument</span><span class="text"> </span><span class="string">"deposit"</span><span class="text">)
          </span><span class="kw">method</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> </span><span class="id">x</span><span class="text"> =
            </span><span class="kw1">if</span><span class="text"> </span><span class="id">x</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">balance</span><span class="text"> </span><span class="kw1">then</span><span class="text">
              (</span><span class="id">balance</span><span class="text"> &lt;- </span><span class="id">balance</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">plus</span><span class="text"> (</span><span class="id">neg</span><span class="text"> </span><span class="id">x</span><span class="text">); </span><span class="id">self</span><span class="kw1">#</span><span class="id">trace</span><span class="text"> (</span><span class="kw2">Retrieval</span><span class="text"> </span><span class="id">x</span><span class="text">); </span><span class="id">x</span><span class="text">)
            </span><span class="kw1">else</span><span class="text"> </span><span class="id">zero</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">history</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">rev</span><span class="text"> </span><span class="id">history</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">client_view</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> : </span><span class="id">m</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">history</span><span class="text"> : </span><span class="id">m</span><span class="text"> </span><span class="id">operation</span><span class="text"> </span><span class="kw3">list</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> : </span><span class="id">m</span><span class="text"> -&gt; </span><span class="id">m</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">balance</span><span class="text"> : </span><span class="id">m</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">check_client</span><span class="text"> </span><span class="id">x</span><span class="text"> =
        </span><span class="kw">let</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> (</span><span class="id">m</span><span class="text"> </span><span class="numeric">100</span><span class="text">.)</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">x</span><span class="text">
        </span><span class="kw1">else</span><span class="text"> </span><span class="id">raise</span><span class="text"> (</span><span class="kw2">Failure</span><span class="text"> </span><span class="string">"Insufficient initial deposit"</span><span class="text">) </span><span class="kw">in</span><span class="text">
        </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
          </span><span class="kw">initializer</span><span class="text"> </span><span class="id">self</span><span class="kw1">#</span><span class="id">deposit</span><span class="text"> </span><span class="id">y</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">deposit</span><span class="text">: </span><span class="id">m</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Client</span><span class="text"> (</span><span class="kw2">B</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">bank</span><span class="text"> : </span><span class="id">client_view</span><span class="text"> </span><span class="kw1">end</span><span class="text">) =
        </span><span class="kw1">struct</span><span class="text">
          </span><span class="kw">class</span><span class="text"> </span><span class="id">account</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="id">client_view</span><span class="text"> =
            </span><span class="kw1">object</span><span class="text">
              </span><span class="kw">inherit</span><span class="text"> </span><span class="kw2">B</span><span class="text">.</span><span class="id">bank</span><span class="text">
              </span><span class="kw">inherit</span><span class="text"> </span><span class="id">check_client</span><span class="text"> </span><span class="id">x</span><span class="text">
            </span><span class="kw1">end</span><span class="text">

          </span><span class="kw">let</span><span class="text"> </span><span class="id">discount</span><span class="text"> </span><span class="id">x</span><span class="text"> =
            </span><span class="kw">let</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">account</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw">in</span><span class="text">
            </span><span class="kw1">if</span><span class="text"> </span><span class="id">today</span><span class="text">() &lt; (</span><span class="numeric">1998</span><span class="text">,</span><span class="numeric">10</span><span class="text">,</span><span class="numeric">30</span><span class="text">) </span><span class="kw1">then</span><span class="text"> </span><span class="id">c</span><span class="text"> </span><span class="kw1">#</span><span class="text"> </span><span class="id">deposit</span><span class="text"> (</span><span class="id">m</span><span class="text"> </span><span class="numeric">100</span><span class="text">.); </span><span class="id">c</span><span class="text">
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div><p>

This shows the use of modules to group several class definitions that can in
fact be thought of as a single unit. This unit would be provided by a bank
for both internal and external uses.
This is implemented as a functor that abstracts over the currency so that
the same code can be used to provide accounts in different currencies.</p><p>The class <span class="c003">bank</span> is the <em>real</em> implementation of the bank account (it
could have been inlined). This is the one that will be used for further
extensions, refinements, etc. Conversely, the client will only be given the client view.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Euro_account</span><span class="text"> = </span><span class="kw2">Account</span><span class="text">(</span><span class="kw2">Euro</span><span class="text">);;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Client</span><span class="text"> = </span><span class="kw2">Euro_account</span><span class="text">.</span><span class="kw2">Client</span><span class="text"> (</span><span class="kw2">Euro_account</span><span class="text">);;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw1">new</span><span class="text"> </span><span class="kw2">Client</span><span class="text">.</span><span class="id">account</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="kw2">Euro</span><span class="text">.</span><span class="id">c</span><span class="text"> </span><span class="numeric">100</span><span class="text">.);;
</span></code>
</pre>


</div><p>

Hence, the clients do not have direct access to the <span class="c003">balance</span>, nor the
<span class="c003">history</span> of their own accounts. Their only way to change their balance is
to deposit or withdraw money. It is important to give the clients
a class and not just the ability to create accounts (such as the
promotional <span class="c003">discount</span> account), so that they can
personalize their account.
For instance, a client may refine the <span class="c003">deposit</span> and <span class="c003">withdraw</span> methods
so as to do his own financial bookkeeping, automatically. On the
other hand, the function <span class="c003">discount</span> is given as such, with no
possibility for further personalization.</p><p>It is important to provide the client’s view as a functor
<span class="c003">Client</span> so that client accounts can still be built after a possible
specialization of the <span class="c003">bank</span>.
The functor <span class="c003">Client</span> may remain unchanged and be passed
the new definition to initialize a client’s view of the extended account.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Investment_account</span><span class="text"> (</span><span class="kw2">M</span><span class="text"> : </span><span class="kw2">MONEY</span><span class="text">) =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="kw2">M</span><span class="text">.</span><span class="id">c</span><span class="text">
      </span><span class="kw">module</span><span class="text"> </span><span class="kw2">A</span><span class="text"> = </span><span class="kw2">Account</span><span class="text">(</span><span class="kw2">M</span><span class="text">)

      </span><span class="kw">class</span><span class="text"> </span><span class="id">bank</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text">
          </span><span class="kw">inherit</span><span class="text"> </span><span class="kw2">A</span><span class="text">.</span><span class="id">bank</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">super</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text"> =
            </span><span class="kw1">if</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="kw2">M</span><span class="text">.</span><span class="id">c</span><span class="text"> </span><span class="numeric">1000</span><span class="text">.)</span><span class="kw1">#</span><span class="id">leq</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">then</span><span class="text">
              </span><span class="id">print_string</span><span class="text"> </span><span class="string">"Would you like to invest?"</span><span class="text">;
            </span><span class="id">super</span><span class="kw1">#</span><span class="id">deposit</span><span class="text"> </span><span class="id">x</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Client</span><span class="text"> = </span><span class="kw2">A</span><span class="text">.</span><span class="kw2">Client</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div><p>

The functor <span class="c003">Client</span> may also be redefined when some new features of the
account can be given to the client.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Internet_account</span><span class="text"> (</span><span class="kw2">M</span><span class="text"> : </span><span class="kw2">MONEY</span><span class="text">) =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">type</span><span class="text"> </span><span class="id">m</span><span class="text"> = </span><span class="kw2">M</span><span class="text">.</span><span class="id">c</span><span class="text">
      </span><span class="kw">module</span><span class="text"> </span><span class="kw2">A</span><span class="text"> = </span><span class="kw2">Account</span><span class="text">(</span><span class="kw2">M</span><span class="text">)

      </span><span class="kw">class</span><span class="text"> </span><span class="id">bank</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text">
          </span><span class="kw">inherit</span><span class="text"> </span><span class="kw2">A</span><span class="text">.</span><span class="id">bank</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">mail</span><span class="text"> </span><span class="id">s</span><span class="text"> = </span><span class="id">print_string</span><span class="text"> </span><span class="id">s</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">client_view</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">deposit</span><span class="text"> : </span><span class="id">m</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">history</span><span class="text"> : </span><span class="id">m</span><span class="text"> </span><span class="id">operation</span><span class="text"> </span><span class="kw3">list</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">withdraw</span><span class="text"> : </span><span class="id">m</span><span class="text"> -&gt; </span><span class="id">m</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">balance</span><span class="text"> : </span><span class="id">m</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">mail</span><span class="text"> : </span><span class="kw3">string</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
        </span><span class="kw1">end</span><span class="text">

      </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Client</span><span class="text"> (</span><span class="kw2">B</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">bank</span><span class="text"> : </span><span class="id">client_view</span><span class="text"> </span><span class="kw1">end</span><span class="text">) =
        </span><span class="kw1">struct</span><span class="text">
          </span><span class="kw">class</span><span class="text"> </span><span class="id">account</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="id">client_view</span><span class="text"> =
            </span><span class="kw1">object</span><span class="text">
              </span><span class="kw">inherit</span><span class="text"> </span><span class="kw2">B</span><span class="text">.</span><span class="id">bank</span><span class="text">
              </span><span class="kw">inherit</span><span class="text"> </span><span class="kw2">A</span><span class="text">.</span><span class="id">check_client</span><span class="text"> </span><span class="id">x</span><span class="text">
            </span><span class="kw1">end</span><span class="text">
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div>
<h2 class="section" id="sec66">2&nbsp;&nbsp;Simple modules as classes</h2>
<p>
<a id="ss:modules-as-classes"></a></p><p>One may wonder whether it is possible to treat primitive types such as
integers and strings as objects. Although this is usually uninteresting
for integers or strings, there may be some situations where
this is desirable. The class <span class="c003">money</span> above is such an example.
We show here how to do it for strings.</p>
<h3 class="subsection" id="sec67">2.1&nbsp;&nbsp;Strings</h3>
<p>
<a id="module:string"></a></p><p>A naive definition of strings as objects could be:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">ostring</span><span class="text"> </span><span class="id">s</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">get</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">n</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_string</span><span class="text"> </span><span class="id">s</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">escaped</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">ostring</span><span class="text"> (</span><span class="kw2">String</span><span class="text">.</span><span class="id">escaped</span><span class="text"> </span><span class="id">s</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ostring :
  string -&gt;
  object
    method escaped : ostring
    method get : int -&gt; char
    method print : unit
  end
</code></pre>


</div><p>

However, the method <span class="c003">escaped</span> returns an object of the class <span class="c003">ostring</span>,
and not an object of the current class. Hence, if the class is further
extended, the method <span class="c003">escaped</span> will only return an object of the parent
class.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">sub_string</span><span class="text"> </span><span class="id">s</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
       </span><span class="kw">inherit</span><span class="text"> </span><span class="id">ostring</span><span class="text"> </span><span class="id">s</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">sub</span><span class="text"> </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">sub_string</span><span class="text"> (</span><span class="kw2">String</span><span class="text">.</span><span class="id">sub</span><span class="text"> </span><span class="id">s</span><span class="text">  </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class sub_string :
  string -&gt;
  object
    method escaped : ostring
    method get : int -&gt; char
    method print : unit
    method sub : int -&gt; int -&gt; sub_string
  end
</code></pre>


</div><p>

As seen in section <a href="objectexamples.html#ss%3Abinary-methods">3.16</a>, the solution is to use
functional update instead. We need to create an instance variable
containing the representation <span class="c003">s</span> of the string.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">better_string</span><span class="text"> </span><span class="id">s</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
       </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">s</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">get</span><span class="text"> </span><span class="id">repr</span><span class="text"> </span><span class="id">n</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_string</span><span class="text"> </span><span class="id">repr</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">escaped</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">escaped</span><span class="text"> </span><span class="id">repr</span><span class="text"> &gt;}
       </span><span class="kw">method</span><span class="text"> </span><span class="id">sub</span><span class="text"> </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">sub</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class better_string :
  string -&gt;
  object ('a)
    val repr : string
    method escaped : 'a
    method get : int -&gt; char
    method print : unit
    method sub : int -&gt; int -&gt; 'a
  end
</code></pre>


</div><p>

As shown in the inferred type, the methods <span class="c003">escaped</span> and <span class="c003">sub</span> now return
objects of the same type as the one of the class.</p><p>Another difficulty is the implementation of the method <span class="c003">concat</span>.
In order to concatenate a string with another string of the same class,
one must be able to access the instance variable externally. Thus, a method
<span class="c003">repr</span> returning s must be defined. Here is the correct definition of
strings:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">ostring</span><span class="text"> </span><span class="id">s</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text"> : '</span><span class="id">mytype</span><span class="text">)
       </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">s</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">repr</span><span class="text"> = </span><span class="id">repr</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">get</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">get</span><span class="text"> </span><span class="id">repr</span><span class="text"> </span><span class="id">n</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="id">print_string</span><span class="text"> </span><span class="id">repr</span><span class="text">
       </span><span class="kw">method</span><span class="text"> </span><span class="id">escaped</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">escaped</span><span class="text"> </span><span class="id">repr</span><span class="text"> &gt;}
       </span><span class="kw">method</span><span class="text"> </span><span class="id">sub</span><span class="text"> </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="kw2">String</span><span class="text">.</span><span class="id">sub</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">start</span><span class="text"> </span><span class="id">len</span><span class="text"> &gt;}
       </span><span class="kw">method</span><span class="text"> </span><span class="id">concat</span><span class="text"> (</span><span class="id">t</span><span class="text"> : '</span><span class="id">mytype</span><span class="text">) = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">repr</span><span class="text"> ^ </span><span class="id">t</span><span class="kw1">#</span><span class="id">repr</span><span class="text"> &gt;}
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ostring :
  string -&gt;
  object ('a)
    val repr : string
    method concat : 'a -&gt; 'a
    method escaped : 'a
    method get : int -&gt; char
    method print : unit
    method repr : string
    method sub : int -&gt; int -&gt; 'a
  end
</code></pre>


</div><p>

Another constructor of the class string can be defined to return a new
string of a given length:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="id">cstring</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="id">ostring</span><span class="text"> (</span><span class="kw2">String</span><span class="text">.</span><span class="id">make</span><span class="text"> </span><span class="id">n</span><span class="text"> </span><span class="string">' '</span><span class="text">);;
</span></code><code class="caml-output ok">class cstring : int -&gt; ostring
</code></pre>


</div><p>

Here, exposing the representation of strings is probably harmless. We do
could also hide the representation of strings as we hid the currency in the
class <span class="c003">money</span> of section&nbsp;<a href="objectexamples.html#ss%3Afriends">3.17</a>.</p>
<h4 class="subsubsection" id="sec68">Stacks</h4>
<p>
<a id="module:stack"></a></p><p>There is sometimes an alternative between using modules or classes for
parametric data types.
Indeed, there are situations when the two approaches are quite similar.
For instance, a stack can be straightforwardly implemented as a class:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">Empty</span><span class="text">;;
</span></code><code class="caml-output ok">exception Empty
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">stack</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">l</span><span class="text"> = ([] : '</span><span class="id">a</span><span class="text"> </span><span class="kw3">list</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">push</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">l</span><span class="text"> &lt;- </span><span class="id">x</span><span class="text">::</span><span class="id">l</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">pop</span><span class="text"> = </span><span class="kw1">match</span><span class="text"> </span><span class="id">l</span><span class="text"> </span><span class="kw1">with</span><span class="text"> [] -&gt; </span><span class="id">raise</span><span class="text"> </span><span class="kw2">Empty</span><span class="text"> | </span><span class="id">a</span><span class="text">::</span><span class="id">l</span><span class="text">' -&gt; </span><span class="id">l</span><span class="text"> &lt;- </span><span class="id">l</span><span class="text">'; </span><span class="id">a</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">clear</span><span class="text"> = </span><span class="id">l</span><span class="text"> &lt;- []
      </span><span class="kw">method</span><span class="text"> </span><span class="id">length</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">length</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] stack :
  object
    val mutable l : 'a list
    method clear : unit
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</code></pre>


</div><p>

However, writing a method for iterating over a stack is more
problematic. A method <span class="c003">fold</span> would have type
<span class="c003">('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b</span>. Here <span class="c003">'a</span> is the parameter of the stack.
The parameter <span class="c003">'b</span> is not related to the class <span class="c003">'a stack</span> but to the
argument that will be passed to the method <span class="c003">fold</span>.
A naive approach is to make <span class="c003">'b</span> an extra parameter of class <span class="c003">stack</span>:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">stack2</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">stack</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="id">x</span><span class="text"> : '</span><span class="id">b</span><span class="text">) = </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a, 'b] stack2 :
  object
    val mutable l : 'a list
    method clear : unit
    method fold : ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</code></pre>


</div><p>

However, the method <span class="c003">fold</span> of a given object can only be
applied to functions that all have the same type:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">s</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">stack2</span><span class="text">;;
</span></code><code class="caml-output ok">val s : ('_weak1, '_weak2) stack2 = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">s</span><span class="kw1">#</span><span class="id">fold</span><span class="text"> ( + ) </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">- : int = 0
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">s</span><span class="text">;;
</span></code><code class="caml-output ok">- : (int, int) stack2 = &lt;obj&gt;
</code></pre>


</div><p>

A better solution is to use polymorphic methods, which were
introduced in OCaml version 3.05. Polymorphic methods makes
it possible to treat the type variable <span class="c003">'b</span> in the type of <span class="c003">fold</span> as
universally quantified, giving <span class="c003">fold</span> the polymorphic type
<span class="c003">Forall 'b. ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b</span>.
An explicit type declaration on the method <span class="c003">fold</span> is required, since
the type checker cannot infer the polymorphic type by itself.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">stack3</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">stack</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">fold</span><span class="text"> : '</span><span class="id">b</span><span class="text">. ('</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">) -&gt; '</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">
                  = </span><span class="kw">fun</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_left</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">l</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] stack3 :
  object
    val mutable l : 'a list
    method clear : unit
    method fold : ('b -&gt; 'a -&gt; 'b) -&gt; 'b -&gt; 'b
    method length : int
    method pop : 'a
    method push : 'a -&gt; unit
  end
</code></pre>


</div>
<h3 class="subsection" id="sec69">2.2&nbsp;&nbsp;Hashtbl</h3>
<p>
<a id="module:hashtbl"></a></p><p>A simplified version of object-oriented hash tables should have the
following class type.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">type</span><span class="text"> ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">hash_table</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">find</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">add</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class type ['a, 'b] hash_table =
  object method add : 'a -&gt; 'b -&gt; unit method find : 'a -&gt; 'b end
</code></pre>


</div><p>

A simple implementation, which is quite reasonable for small hash tables is
to use an association list:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">small_hashtbl</span><span class="text"> : ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">hash_table</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">table</span><span class="text"> = []
      </span><span class="kw">method</span><span class="text"> </span><span class="id">find</span><span class="text"> </span><span class="id">key</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">assoc</span><span class="text"> </span><span class="id">key</span><span class="text"> </span><span class="id">table</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">add</span><span class="text"> </span><span class="id">key</span><span class="text"> </span><span class="id">valeur</span><span class="text"> = </span><span class="id">table</span><span class="text"> &lt;- (</span><span class="id">key</span><span class="text">, </span><span class="id">valeur</span><span class="text">) :: </span><span class="id">table</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a, 'b] small_hashtbl : ['a, 'b] hash_table
</code></pre>


</div><p>

A better implementation, and one that scales up better, is to use a
true hash table… whose elements are small hash tables!


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">hashtbl</span><span class="text"> </span><span class="id">size</span><span class="text"> : ['</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">] </span><span class="id">hash_table</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="id">table</span><span class="text"> = </span><span class="kw2">Array</span><span class="text">.</span><span class="id">init</span><span class="text"> </span><span class="id">size</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">i</span><span class="text"> -&gt; </span><span class="kw1">new</span><span class="text"> </span><span class="id">small_hashtbl</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">private</span><span class="text"> </span><span class="id">hash</span><span class="text"> </span><span class="id">key</span><span class="text"> =
        (</span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">hash</span><span class="text"> </span><span class="id">key</span><span class="text">) </span><span class="kw1">mod</span><span class="text"> (</span><span class="kw2">Array</span><span class="text">.</span><span class="id">length</span><span class="text"> </span><span class="id">table</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">find</span><span class="text"> </span><span class="id">key</span><span class="text"> = </span><span class="id">table</span><span class="text">.(</span><span class="id">self</span><span class="kw1">#</span><span class="id">hash</span><span class="text"> </span><span class="id">key</span><span class="text">) </span><span class="kw1">#</span><span class="text"> </span><span class="id">find</span><span class="text"> </span><span class="id">key</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">add</span><span class="text"> </span><span class="id">key</span><span class="text"> = </span><span class="id">table</span><span class="text">.(</span><span class="id">self</span><span class="kw1">#</span><span class="id">hash</span><span class="text"> </span><span class="id">key</span><span class="text">) </span><span class="kw1">#</span><span class="text"> </span><span class="id">add</span><span class="text"> </span><span class="id">key</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a, 'b] hashtbl : int -&gt; ['a, 'b] hash_table
</code></pre>


</div>
<h3 class="subsection" id="sec70">2.3&nbsp;&nbsp;Sets</h3>
<p>
<a id="module:set"></a></p><p>Implementing sets leads to another difficulty. Indeed, the method
<span class="c003">union</span> needs to be able to access the internal representation of
another object of the same class.</p><p>This is another instance of friend functions as seen in section
<a href="objectexamples.html#ss%3Afriends">3.17</a>. Indeed, this is the same mechanism used in the module
<span class="c003">Set</span> in the absence of objects.</p><p>In the object-oriented version of sets, we only need to add an additional
method <span class="c003">tag</span> to return the representation of a set. Since sets are
parametric in the type of elements, the method <span class="c003">tag</span> has a parametric type
<span class="c003">'a tag</span>, concrete within
the module definition but abstract in its signature.
From outside, it will then be guaranteed that two objects with a method <span class="c003">tag</span>
of the same type will share the same representation.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">SET</span><span class="text"> =
    </span><span class="kw1">sig</span><span class="text">
      </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">tag</span><span class="text">
      </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">c</span><span class="text"> :
        </span><span class="kw1">object</span><span class="text"> ('</span><span class="id">b</span><span class="text">)
          </span><span class="kw">method</span><span class="text"> </span><span class="id">is_empty</span><span class="text"> : </span><span class="kw3">bool</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">mem</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">bool</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">add</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">union</span><span class="text"> : '</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">iter</span><span class="text"> : ('</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">) -&gt; </span><span class="kw3">unit</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">tag</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">tag</span><span class="text">
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Set</span><span class="text"> : </span><span class="kw2">SET</span><span class="text"> =
    </span><span class="kw1">struct</span><span class="text">
      </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">merge</span><span class="text"> </span><span class="id">l1</span><span class="text"> </span><span class="id">l2</span><span class="text"> =
        </span><span class="kw1">match</span><span class="text"> </span><span class="id">l1</span><span class="text"> </span><span class="kw1">with</span><span class="text">
          [] -&gt; </span><span class="id">l2</span><span class="text">
        | </span><span class="id">h1</span><span class="text"> :: </span><span class="id">t1</span><span class="text"> -&gt;
            </span><span class="kw1">match</span><span class="text"> </span><span class="id">l2</span><span class="text"> </span><span class="kw1">with</span><span class="text">
              [] -&gt; </span><span class="id">l1</span><span class="text">
            | </span><span class="id">h2</span><span class="text"> :: </span><span class="id">t2</span><span class="text"> -&gt;
                </span><span class="kw1">if</span><span class="text"> </span><span class="id">h1</span><span class="text"> &lt; </span><span class="id">h2</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">h1</span><span class="text"> :: </span><span class="id">merge</span><span class="text"> </span><span class="id">t1</span><span class="text"> </span><span class="id">l2</span><span class="text">
                </span><span class="kw1">else</span><span class="text"> </span><span class="kw1">if</span><span class="text"> </span><span class="id">h1</span><span class="text"> &gt; </span><span class="id">h2</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">h2</span><span class="text"> :: </span><span class="id">merge</span><span class="text"> </span><span class="id">l1</span><span class="text"> </span><span class="id">t2</span><span class="text">
                </span><span class="kw1">else</span><span class="text"> </span><span class="id">merge</span><span class="text"> </span><span class="id">t1</span><span class="text"> </span><span class="id">l2</span><span class="text">
      </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">tag</span><span class="text"> = '</span><span class="id">a</span><span class="text"> </span><span class="kw3">list</span><span class="text">
      </span><span class="kw">class</span><span class="text"> ['</span><span class="id">a</span><span class="text">] </span><span class="id">c</span><span class="text"> =
        </span><span class="kw1">object</span><span class="text"> (</span><span class="numeric">_</span><span class="text"> : '</span><span class="id">b</span><span class="text">)
          </span><span class="kw">val</span><span class="text"> </span><span class="id">repr</span><span class="text"> = ([] : '</span><span class="id">a</span><span class="text"> </span><span class="kw3">list</span><span class="text">)
          </span><span class="kw">method</span><span class="text"> </span><span class="id">is_empty</span><span class="text"> = (</span><span class="id">repr</span><span class="text"> = [])
          </span><span class="kw">method</span><span class="text"> </span><span class="id">mem</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw2">List</span><span class="text">.</span><span class="id">exists</span><span class="text"> (( = ) </span><span class="id">x</span><span class="text">) </span><span class="id">repr</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">add</span><span class="text"> </span><span class="id">x</span><span class="text"> = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">merge</span><span class="text"> [</span><span class="id">x</span><span class="text">] </span><span class="id">repr</span><span class="text"> &gt;}
          </span><span class="kw">method</span><span class="text"> </span><span class="id">union</span><span class="text"> (</span><span class="id">s</span><span class="text"> : '</span><span class="id">b</span><span class="text">) = {&lt; </span><span class="id">repr</span><span class="text"> = </span><span class="id">merge</span><span class="text"> </span><span class="id">repr</span><span class="text"> </span><span class="id">s</span><span class="kw1">#</span><span class="id">tag</span><span class="text"> &gt;}
          </span><span class="kw">method</span><span class="text"> </span><span class="id">iter</span><span class="text"> (</span><span class="id">f</span><span class="text"> : '</span><span class="id">a</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">) = </span><span class="kw2">List</span><span class="text">.</span><span class="id">iter</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">repr</span><span class="text">
          </span><span class="kw">method</span><span class="text"> </span><span class="id">tag</span><span class="text"> = </span><span class="id">repr</span><span class="text">
        </span><span class="kw1">end</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code>
</pre>


</div>
<h2 class="section" id="sec71">3&nbsp;&nbsp;The subject/observer pattern</h2>
<p>
<a id="ss:subject-observer"></a></p><p>The following example, known as the subject/observer pattern, is often
presented in the literature as a difficult inheritance problem with
inter-connected classes.
The general pattern amounts to the definition a pair of two
classes that recursively interact with one another.</p><p>The class <span class="c003">observer</span> has a distinguished method <span class="c003">notify</span> that requires
two arguments, a subject and an event to execute an action.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> ['</span><span class="id">subject</span><span class="text">, '</span><span class="id">event</span><span class="text">] </span><span class="id">observer</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="kw">virtual</span><span class="text"> </span><span class="id">notify</span><span class="text"> : '</span><span class="id">subject</span><span class="text"> -&gt;  '</span><span class="id">event</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class virtual ['subject, 'event] observer :
  object method virtual notify : 'subject -&gt; 'event -&gt; unit end
</code></pre>


</div><p>

The class <span class="c003">subject</span> remembers a list of observers in an instance variable,
and has a distinguished method <span class="c003">notify_observers</span> to broadcast the message
<span class="c003">notify</span> to all observers with a particular event <span class="c003">e</span>.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">observer</span><span class="text">, '</span><span class="id">event</span><span class="text">] </span><span class="id">subject</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">observers</span><span class="text"> = ([]:'</span><span class="id">observer</span><span class="text"> </span><span class="kw3">list</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">add_observer</span><span class="text"> </span><span class="id">obs</span><span class="text"> = </span><span class="id">observers</span><span class="text"> &lt;- (</span><span class="id">obs</span><span class="text"> :: </span><span class="id">observers</span><span class="text">)
      </span><span class="kw">method</span><span class="text"> </span><span class="id">notify_observers</span><span class="text"> (</span><span class="id">e</span><span class="text"> : '</span><span class="id">event</span><span class="text">) =
          </span><span class="kw2">List</span><span class="text">.</span><span class="id">iter</span><span class="text"> (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">x</span><span class="kw1">#</span><span class="id">notify</span><span class="text"> </span><span class="id">self</span><span class="text"> </span><span class="id">e</span><span class="text">) </span><span class="id">observers</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a, 'event] subject :
  object ('b)
    constraint 'a = &lt; notify : 'b -&gt; 'event -&gt; unit; .. &gt;
    val mutable observers : 'a list
    method add_observer : 'a -&gt; unit
    method notify_observers : 'event -&gt; unit
  end
</code></pre>


</div><p>

The difficulty usually lies in defining instances of the pattern above
by inheritance. This can be done in a natural and obvious manner in
OCaml, as shown on the following example manipulating windows.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">event</span><span class="text"> = </span><span class="kw2">Raise</span><span class="text"> | </span><span class="kw2">Resize</span><span class="text"> | </span><span class="kw2">Move</span><span class="text">;;
</span></code><code class="caml-output ok">type event = Raise | Resize | Move
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">string_of_event</span><span class="text"> = </span><span class="kw">function</span><span class="text">
      </span><span class="kw2">Raise</span><span class="text"> -&gt; </span><span class="string">"Raise"</span><span class="text"> | </span><span class="kw2">Resize</span><span class="text"> -&gt; </span><span class="string">"Resize"</span><span class="text"> | </span><span class="kw2">Move</span><span class="text"> -&gt; </span><span class="string">"Move"</span><span class="text">;;
</span></code><code class="caml-output ok">val string_of_event : event -&gt; string = &lt;fun&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">count</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> </span><span class="numeric">0</span><span class="text">;;
</span></code><code class="caml-output ok">val count : int ref = {contents = 0}
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">observer</span><span class="text">] </span><span class="id">window_subject</span><span class="text"> =
    </span><span class="kw">let</span><span class="text"> </span><span class="id">id</span><span class="text"> = </span><span class="id">count</span><span class="text"> := </span><span class="id">succ</span><span class="text"> !</span><span class="id">count</span><span class="text">; !</span><span class="id">count</span><span class="text"> </span><span class="kw">in</span><span class="text">
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">observer</span><span class="text">, </span><span class="id">event</span><span class="text">] </span><span class="id">subject</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">position</span><span class="text"> = </span><span class="numeric">0</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">identity</span><span class="text"> = </span><span class="id">id</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">move</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">position</span><span class="text"> &lt;- </span><span class="id">position</span><span class="text"> + </span><span class="id">x</span><span class="text">; </span><span class="id">self</span><span class="kw1">#</span><span class="id">notify_observers</span><span class="text"> </span><span class="kw2">Move</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">draw</span><span class="text"> = </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">printf</span><span class="text"> </span><span class="string">"{Position = %d}\n"</span><span class="text">  </span><span class="id">position</span><span class="text">;
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] window_subject :
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
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">subject</span><span class="text">] </span><span class="id">window_observer</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">subject</span><span class="text">, </span><span class="id">event</span><span class="text">] </span><span class="id">observer</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">notify</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">e</span><span class="text"> = </span><span class="id">s</span><span class="kw1">#</span><span class="id">draw</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] window_observer :
  object
    constraint 'a = &lt; draw : unit; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</code></pre>


</div><p>

As can be expected, the type of <span class="c003">window</span> is recursive.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">window</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">window_subject</span><span class="text">;;
</span></code><code class="caml-output ok">val window : &lt; notify : 'a -&gt; event -&gt; unit; _.. &gt; window_subject as 'a =
  &lt;obj&gt;
</code></pre>


</div><p>

However, the two classes of <span class="c003">window_subject</span> and <span class="c003">window_observer</span> are not
mutually recursive.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">window_observer</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">window_observer</span><span class="text">;;
</span></code><code class="caml-output ok">val window_observer : &lt; draw : unit; _.. &gt; window_observer = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">window</span><span class="kw1">#</span><span class="id">add_observer</span><span class="text"> </span><span class="id">window_observer</span><span class="text">;;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">window</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">1</span><span class="text">;;
</span></code><code class="caml-output ok">{Position = 1}
- : unit = ()
</code></pre>


</div><p>Classes <span class="c003">window_observer</span> and <span class="c003">window_subject</span> can still be extended by
inheritance. For instance, one may enrich the <span class="c003">subject</span> with new
behaviors and refine the behavior of the observer.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">observer</span><span class="text">] </span><span class="id">richer_window_subject</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text"> (</span><span class="id">self</span><span class="text">)
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">observer</span><span class="text">] </span><span class="id">window_subject</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">size</span><span class="text"> = </span><span class="numeric">1</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">resize</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">size</span><span class="text"> &lt;- </span><span class="id">size</span><span class="text"> + </span><span class="id">x</span><span class="text">; </span><span class="id">self</span><span class="kw1">#</span><span class="id">notify_observers</span><span class="text"> </span><span class="kw2">Resize</span><span class="text">
      </span><span class="kw">val</span><span class="text"> </span><span class="kw">mutable</span><span class="text"> </span><span class="id">top</span><span class="text"> = </span><span class="constant">false</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">raise</span><span class="text"> = </span><span class="id">top</span><span class="text"> &lt;- </span><span class="constant">true</span><span class="text">; </span><span class="id">self</span><span class="kw1">#</span><span class="id">notify_observers</span><span class="text"> </span><span class="kw2">Raise</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">draw</span><span class="text"> = </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">printf</span><span class="text"> </span><span class="string">"{Position = %d; Size = %d}\n"</span><span class="text">  </span><span class="id">position</span><span class="text"> </span><span class="id">size</span><span class="text">;
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] richer_window_subject :
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
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">subject</span><span class="text">] </span><span class="id">richer_window_observer</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">subject</span><span class="text">] </span><span class="id">window_observer</span><span class="text"> </span><span class="kw1">as</span><span class="text"> </span><span class="id">super</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">notify</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">e</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">e</span><span class="text"> &lt;&gt; </span><span class="kw2">Raise</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="id">s</span><span class="kw1">#</span><span class="id">raise</span><span class="text">; </span><span class="id">super</span><span class="kw1">#</span><span class="id">notify</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">e</span><span class="text">
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] richer_window_observer :
  object
    constraint 'a = &lt; draw : unit; raise : unit; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</code></pre>


</div><p>

We can also create a different kind of observer:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">class</span><span class="text"> ['</span><span class="id">subject</span><span class="text">] </span><span class="id">trace_observer</span><span class="text"> =
    </span><span class="kw1">object</span><span class="text">
      </span><span class="kw">inherit</span><span class="text"> ['</span><span class="id">subject</span><span class="text">, </span><span class="id">event</span><span class="text">] </span><span class="id">observer</span><span class="text">
      </span><span class="kw">method</span><span class="text"> </span><span class="id">notify</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">e</span><span class="text"> =
        </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">printf</span><span class="text">
          </span><span class="string">"&lt;Window %d &lt;== %s&gt;\n"</span><span class="text"> </span><span class="id">s</span><span class="kw1">#</span><span class="id">identity</span><span class="text"> (</span><span class="id">string_of_event</span><span class="text"> </span><span class="id">e</span><span class="text">)
    </span><span class="kw1">end</span><span class="text">;;
</span></code><code class="caml-output ok">class ['a] trace_observer :
  object
    constraint 'a = &lt; identity : int; .. &gt;
    method notify : 'a -&gt; event -&gt; unit
  end
</code></pre>


</div><p>

and attach several observers to the same object:


</p><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">window</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">richer_window_subject</span><span class="text">;;
</span></code><code class="caml-output ok">val window :
  &lt; notify : 'a -&gt; event -&gt; unit; _.. &gt; richer_window_subject as 'a = &lt;obj&gt;
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">window</span><span class="kw1">#</span><span class="id">add_observer</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">richer_window_observer</span><span class="text">);;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">window</span><span class="kw1">#</span><span class="id">add_observer</span><span class="text"> (</span><span class="kw1">new</span><span class="text"> </span><span class="id">trace_observer</span><span class="text">);;
</span></code><code class="caml-output ok">- : unit = ()
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="id">window</span><span class="kw1">#</span><span class="id">move</span><span class="text"> </span><span class="numeric">1</span><span class="text">; </span><span class="id">window</span><span class="kw1">#</span><span class="id">resize</span><span class="text"> </span><span class="numeric">2</span><span class="text">;;
</span></code><code class="caml-output ok">&lt;Window 1 &lt;== Move&gt;
&lt;Window 1 &lt;== Raise&gt;
{Position = 1; Size = 1}
{Position = 1; Size = 1}
&lt;Window 1 &lt;== Resize&gt;
&lt;Window 1 &lt;== Raise&gt;
{Position = 1; Size = 3}
{Position = 1; Size = 3}
- : unit = ()
</code></pre>


</div>
<hr>





<span class="authors c009">(Chapter written by Didier Rémy)</span><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>