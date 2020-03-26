<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<font size="7">The OCaml system<br>
 release 4.00<br>
</font><font size="5">Documentation and user’s manual<br>
</font><font size="4">Xavier Leroy,<br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon<br>
 July&nbsp;26, 2012<br>
 &nbsp;
</font><font size="3">Copyright © 2012 Institut National de
Recherche en Informatique et en Automatique
</font></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr size="2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="manual002.html#start-section">Foreword</a>
</li><li class="top"><a href="manual044.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



<h1 class="chapter">Index of keywords</h1><p></p><table cellspacing="6" cellpadding="0"><tbody><tr><td valign="top" align="left"><ul class="indexenv"><li class="li-indexenv">
<tt>and</tt>, see <i><tt>let</tt>, <tt>type</tt>, <tt>class</tt></i>, <a href="manual017.html#@manual.kwd84">6.9.2</a>, <a href="manual017.html#@manual.kwd109">6.9.3</a>, <a href="manual017.html#@manual.kwd113">6.9.4</a>, <a href="manual017.html#@manual.kwd117">6.9.5</a>
</li><li class="li-indexenv"><tt>as</tt>, <a href="types.html#@manual.kwd2">6.4</a>, <a href="types.html#@manual.kwd3">6.4</a>, <a href="types.html#@manual.kwd4">6.4</a>, <a href="patterns.html#@manual.kwd5">6.6</a>, <a href="patterns.html#@manual.kwd6">6.6</a>, <a href="patterns.html#@manual.kwd7">6.6</a>, <a href="manual017.html#@manual.kwd86">6.9.2</a>, <a href="manual017.html#@manual.kwd95">6.9.2</a>
</li><li class="li-indexenv"><tt>assert</tt>, <a href="manual021.html#@manual.kwd173">7.5</a>
<br>
<br>
</li><li class="li-indexenv"><tt>begin</tt>, <a href="expr.html#@manual.kwd27">6.7</a>, <a href="expr.html#@manual.kwd39">6.7.1</a>
<br>
<br>
</li><li class="li-indexenv"><tt>class</tt>, <a href="manual017.html#@manual.kwd108">6.9.3</a>, <a href="manual017.html#@manual.kwd112">6.9.4</a>, <a href="manual017.html#@manual.kwd115">6.9.5</a>, <a href="manual018.html#@manual.kwd127">6.10</a>, <a href="manual018.html#@manual.kwd137">6.10.2</a>, <a href="manual018.html#@manual.kwd138">6.10.2</a>, <a href="manual019.html#@manual.kwd154">6.11</a>, <a href="manual019.html#@manual.kwd164">6.11.2</a>, <a href="manual019.html#@manual.kwd165">6.11.2</a>
</li><li class="li-indexenv"><tt>constraint</tt>, <a href="manual016.html#@manual.kwd55">6.8.1</a>, <a href="manual016.html#@manual.kwd57">6.8.1</a>, <a href="manual017.html#@manual.kwd67">6.9.1</a>, <a href="manual017.html#@manual.kwd77">6.9.1</a>, <a href="manual017.html#@manual.kwd92">6.9.2</a>, <a href="manual017.html#@manual.kwd106">6.9.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>do</tt>, see <i><tt>while</tt>, <tt>for</tt></i>
</li><li class="li-indexenv"><tt>done</tt>, see <i><tt>while</tt>, <tt>for</tt></i>
</li><li class="li-indexenv"><tt>downto</tt>, see <tt><i>for</i></tt>
<br>
<br>
</li><li class="li-indexenv"><tt>else</tt>, see <tt><i>if</i></tt>
</li><li class="li-indexenv"><tt>end</tt>, <a href="expr.html#@manual.kwd28">6.7</a>, <a href="expr.html#@manual.kwd40">6.7.1</a>, <a href="manual017.html#@manual.kwd60">6.9.1</a>, <a href="manual017.html#@manual.kwd79">6.9.2</a>, <a href="manual018.html#@manual.kwd120">6.10</a>, <a href="manual018.html#@manual.kwd132">6.10.2</a>, <a href="manual019.html#@manual.kwd148">6.11</a>, <a href="manual019.html#@manual.kwd159">6.11.2</a>
</li><li class="li-indexenv"><tt>exception</tt>, <a href="manual016.html#@manual.kwd58">6.8.2</a>, <a href="manual018.html#@manual.kwd126">6.10</a>, <a href="manual018.html#@manual.kwd136">6.10.2</a>, <a href="manual019.html#@manual.kwd153">6.11</a>, <a href="manual019.html#@manual.kwd163">6.11.2</a>
</li><li class="li-indexenv"><tt>external</tt>, <a href="manual018.html#@manual.kwd124">6.10</a>, <a href="manual018.html#@manual.kwd134">6.10.2</a>, <a href="manual019.html#@manual.kwd151">6.11</a>, <a href="manual019.html#@manual.kwd161">6.11.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>false</tt>, <a href="manual011.html#@manual.kwd0">6.3</a>
</li><li class="li-indexenv"><tt>for</tt>, <a href="expr.html#@manual.kwd20">6.7</a>, <a href="expr.html#@manual.kwd49">6.7.2</a>
</li><li class="li-indexenv"><tt>fun</tt>, <a href="expr.html#@manual.kwd14">6.7</a>, <a href="expr.html#@manual.kwd34">6.7</a>, <a href="expr.html#@manual.kwd42">6.7.1</a>, <a href="manual017.html#@manual.kwd80">6.9.2</a>, <a href="manual021.html#@manual.kwd185">7.13</a>
</li><li class="li-indexenv"><tt>function</tt>, <a href="expr.html#@manual.kwd13">6.7</a>, <a href="expr.html#@manual.kwd35">6.7</a>, <a href="expr.html#@manual.kwd41">6.7.1</a>
</li><li class="li-indexenv"><tt>functor</tt>, <a href="manual018.html#@manual.kwd121">6.10</a>, <a href="manual018.html#@manual.kwd145">6.10.3</a>, <a href="manual019.html#@manual.kwd149">6.11</a>, <a href="manual019.html#@manual.kwd172">6.11.3</a>
<br>
<br>
</li><li class="li-indexenv"><tt>if</tt>, <a href="expr.html#@manual.kwd23">6.7</a>, <a href="expr.html#@manual.kwd33">6.7</a>, <a href="expr.html#@manual.kwd45">6.7.2</a>
</li><li class="li-indexenv"><tt>in</tt>, see <tt><i>let</i></tt>, <a href="manual017.html#@manual.kwd83">6.9.2</a>
</li><li class="li-indexenv"><tt>include</tt>, <a href="manual018.html#@manual.kwd130">6.10</a>, <a href="manual018.html#@manual.kwd144">6.10.2</a>, <a href="manual019.html#@manual.kwd157">6.11</a>, <a href="manual019.html#@manual.kwd171">6.11.2</a>, <a href="manual021.html#@manual.kwd191">7.15</a>
</li><li class="li-indexenv"><tt>inherit</tt>, <a href="manual017.html#@manual.kwd61">6.9.1</a>, <a href="manual017.html#@manual.kwd68">6.9.1</a>, <a href="manual017.html#@manual.kwd85">6.9.2</a>, <a href="manual017.html#@manual.kwd94">6.9.2</a>
</li><li class="li-indexenv"><tt>inherit!</tt>, <a href="manual021.html#@manual.kwd197">7.17</a>
</li><li class="li-indexenv"><tt>initializer</tt>, <a href="manual017.html#@manual.kwd93">6.9.2</a>, <a href="manual017.html#@manual.kwd107">6.9.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>lazy</tt>, <a href="manual021.html#@manual.kwd174">7.6</a>
</li><li class="li-indexenv"><tt>let</tt>, <a href="expr.html#@manual.kwd11">6.7</a>, <a href="expr.html#@manual.kwd38">6.7</a>, <a href="expr.html#@manual.kwd44">6.7.1</a>, <a href="manual017.html#@manual.kwd81">6.9.2</a>, <a href="manual019.html#@manual.kwd150">6.11</a>, <a href="manual019.html#@manual.kwd160">6.11.2</a>, <a href="manual021.html#@manual.kwd175">7.7</a>, <a href="manual021.html#@manual.kwd181">7.10</a>, <a href="manual021.html#@manual.kwd183">7.12</a>
<br>
<br>
</li></ul></td><td valign="top" align="left"><ul class="indexenv"><li class="li-indexenv"><tt>match</tt>, <a href="expr.html#@manual.kwd26">6.7</a>, <a href="expr.html#@manual.kwd36">6.7</a>, <a href="expr.html#@manual.kwd46">6.7.2</a>, <a href="manual021.html#@manual.kwd199">7.18</a>
</li><li class="li-indexenv"><tt>method</tt>, <a href="manual017.html#@manual.kwd64">6.9.1</a>, <a href="manual017.html#@manual.kwd72">6.9.1</a>, <a href="manual017.html#@manual.kwd75">6.9.1</a>, <a href="manual017.html#@manual.kwd89">6.9.2</a>, <a href="manual017.html#@manual.kwd101">6.9.2</a>, <a href="manual017.html#@manual.kwd104">6.9.2</a>
</li><li class="li-indexenv"><tt>method!</tt>, <a href="manual021.html#@manual.kwd195">7.17</a>
</li><li class="li-indexenv"><tt>module</tt>, <a href="manual018.html#@manual.kwd128">6.10</a>, <a href="manual018.html#@manual.kwd140">6.10.2</a>, <a href="manual018.html#@manual.kwd142">6.10.2</a>, <a href="manual019.html#@manual.kwd155">6.11</a>, <a href="manual019.html#@manual.kwd167">6.11.2</a>, <a href="manual019.html#@manual.kwd169">6.11.2</a>, <a href="manual021.html#@manual.kwd176">7.7</a>, <a href="manual021.html#@manual.kwd177">7.8</a>, <a href="manual021.html#@manual.kwd186">7.14</a>, <a href="manual021.html#@manual.kwd189">7.15</a>, <a href="manual021.html#@manual.kwd193">7.16</a>
</li><li class="li-indexenv"><tt>mutable</tt>, <a href="manual016.html#@manual.kwd54">6.8.1</a>, <a href="manual016.html#@manual.kwd56">6.8.1</a>, <a href="manual017.html#@manual.kwd63">6.9.1</a>, <a href="manual017.html#@manual.kwd70">6.9.1</a>, <a href="manual017.html#@manual.kwd88">6.9.2</a>, <a href="manual017.html#@manual.kwd97">6.9.2</a>, <a href="manual017.html#@manual.kwd100">6.9.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>new</tt>, <a href="expr.html#@manual.kwd30">6.7</a>, <a href="expr.html#@manual.kwd51">6.7.5</a>
<br>
<br>
</li><li class="li-indexenv"><tt>object</tt>, <a href="expr.html#@manual.kwd31">6.7</a>, <a href="expr.html#@manual.kwd52">6.7.5</a>, <a href="manual017.html#@manual.kwd59">6.9.1</a>, <a href="manual017.html#@manual.kwd78">6.9.2</a>
</li><li class="li-indexenv"><tt>of</tt>, see <i><tt>type</tt>, <tt>exception</tt></i>
</li><li class="li-indexenv"><tt>open</tt>, <a href="manual018.html#@manual.kwd129">6.10</a>, <a href="manual018.html#@manual.kwd143">6.10.2</a>, <a href="manual019.html#@manual.kwd156">6.11</a>, <a href="manual019.html#@manual.kwd170">6.11.2</a>, <a href="manual021.html#@manual.kwd182">7.10</a>
</li><li class="li-indexenv"><tt>or</tt>, <a href="expr.html#@manual.kwd25">6.7</a>, <a href="expr.html#@manual.kwd32">6.7</a>, <a href="expr.html#@manual.kwd47">6.7.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>private</tt>, <a href="manual017.html#@manual.kwd65">6.9.1</a>, <a href="manual017.html#@manual.kwd73">6.9.1</a>, <a href="manual017.html#@manual.kwd76">6.9.1</a>, <a href="manual017.html#@manual.kwd90">6.9.2</a>, <a href="manual017.html#@manual.kwd102">6.9.2</a>, <a href="manual017.html#@manual.kwd105">6.9.2</a>, <a href="manual021.html#@manual.kwd179">7.9</a>, <a href="manual021.html#@manual.kwd180">7.9.3</a>
<br>
<br>
</li><li class="li-indexenv"><tt>rec</tt>, see <tt><i>let</i></tt>, <a href="manual017.html#@manual.kwd82">6.9.2</a>, <a href="manual021.html#@manual.kwd178">7.8</a>
<br>
<br>
</li><li class="li-indexenv"><tt>sig</tt>, <a href="manual018.html#@manual.kwd119">6.10</a>, <a href="manual018.html#@manual.kwd131">6.10.2</a>
</li><li class="li-indexenv"><tt>struct</tt>, <a href="manual019.html#@manual.kwd147">6.11</a>, <a href="manual019.html#@manual.kwd158">6.11.2</a>
<br>
<br>
</li><li class="li-indexenv"><tt>then</tt>, see <tt><i>if</i></tt>
</li><li class="li-indexenv"><tt>to</tt>, see <tt><i>for</i></tt>
</li><li class="li-indexenv"><tt>true</tt>, <a href="manual011.html#@manual.kwd1">6.3</a>
</li><li class="li-indexenv"><tt>try</tt>, <a href="expr.html#@manual.kwd12">6.7</a>, <a href="expr.html#@manual.kwd37">6.7</a>, <a href="expr.html#@manual.kwd50">6.7.2</a>
</li><li class="li-indexenv"><tt>type</tt>, <a href="manual016.html#@manual.kwd53">6.8.1</a>, <a href="manual017.html#@manual.kwd116">6.9.5</a>, <a href="manual018.html#@manual.kwd125">6.10</a>, <a href="manual018.html#@manual.kwd135">6.10.2</a>, <a href="manual018.html#@manual.kwd139">6.10.2</a>, <a href="manual018.html#@manual.kwd141">6.10.2</a>, <a href="manual019.html#@manual.kwd152">6.11</a>, <a href="manual019.html#@manual.kwd162">6.11.2</a>, <a href="manual019.html#@manual.kwd166">6.11.2</a>, <a href="manual019.html#@manual.kwd168">6.11.2</a>, <a href="manual021.html#@manual.kwd184">7.13</a>, <a href="manual021.html#@manual.kwd190">7.15</a>, <a href="manual021.html#@manual.kwd194">7.16</a>, <a href="manual021.html#@manual.kwd198">7.18</a>
<br>
<br>
</li><li class="li-indexenv"><tt>val</tt>, <a href="manual017.html#@manual.kwd62">6.9.1</a>, <a href="manual017.html#@manual.kwd69">6.9.1</a>, <a href="manual017.html#@manual.kwd87">6.9.2</a>, <a href="manual017.html#@manual.kwd96">6.9.2</a>, <a href="manual017.html#@manual.kwd99">6.9.2</a>, <a href="manual018.html#@manual.kwd123">6.10</a>, <a href="manual018.html#@manual.kwd133">6.10.2</a>, <a href="manual021.html#@manual.kwd187">7.14</a>
</li><li class="li-indexenv"><tt>val!</tt>, <a href="manual021.html#@manual.kwd196">7.17</a>
</li><li class="li-indexenv"><tt>virtual</tt>, <a href="manual017.html#@manual.kwd66">6.9.1</a>, <a href="manual017.html#@manual.kwd71">6.9.1</a>, <a href="manual017.html#@manual.kwd74">6.9.1</a>, <a href="manual017.html#@manual.kwd91">6.9.2</a>, <a href="manual017.html#@manual.kwd98">6.9.2</a>, <a href="manual017.html#@manual.kwd103">6.9.2</a>, <a href="manual017.html#@manual.kwd110">6.9.3</a>, <a href="manual017.html#@manual.kwd111">6.9.3</a>, <a href="manual017.html#@manual.kwd114">6.9.4</a>, <a href="manual017.html#@manual.kwd118">6.9.5</a>
<br>
<br>
</li><li class="li-indexenv"><tt>when</tt>, <a href="expr.html#@manual.kwd29">6.7</a>, <a href="expr.html#@manual.kwd43">6.7.1</a>
</li><li class="li-indexenv"><tt>while</tt>, <a href="expr.html#@manual.kwd48">6.7.2</a>
</li><li class="li-indexenv"><tt>with</tt>, see <i><tt>match</tt>, <tt>try</tt></i>, <a href="manual018.html#@manual.kwd122">6.10</a>, <a href="manual018.html#@manual.kwd146">6.10.4</a>, <a href="manual021.html#@manual.kwd188">7.14</a>, <a href="manual021.html#@manual.kwd192">7.16</a>
</li></ul></td></tr>
</tbody></table>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>