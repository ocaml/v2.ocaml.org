<title>Comparison of Standard Containers</title>
<body>

<div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc 2 2"></div>
    </div>

    
<h1><span>Comparison of Standard Containers</span></h1>

<p>This is a rough comparison of the different container types that are provided by the OCaml language or by the OCaml standard library. In each case, n is the number of valid elements in the container.</p>

<p>Note that the big-O cost given for some operations reflects the current implementation but is not guaranteed by the official documentation. Hopefully it will not become worse. Anyway, if you want more details, you should read the documentation about each of the modules. Often, it is also instructive to read the corresponding implementation.</p>

<p>See also: <a href="standard_library_examples.html" class="internal" title="Standard Library Examples">Standard Library Examples</a></p>

<h2><a name="Lists">Lists: immutable singly-linked lists</a></h2>

<p>Adding an element always creates a new list l from an element x and list tl. tl remains unchanged, but it is not copied either.</p>

<ul>
<li>"adding" an element: O(1), cons operator (::)</li>
<li>length: O(n), function List.length</li>
<li>accessing cell i: O(i)</li>
<li>finding an element: O(n)</li>
</ul>
  
<p>Well-suited for: IO, pattern-matching</p>

<p>Not very efficient for: random access, indexed elements</p>

<h2><a name="Arrays">Arrays and strings: mutable vectors</a></h2>

<p>Arrays and strings are very similar. Strings are specialized in storing chars (bytes), have some convenient syntax and store them compactly.</p>

<ul>
<li>"adding" an element: O(n)</li>
<li>length: O(1), function Array.length</li>
<li>accessing cell i: O(1)</li>
<li>finding an element: O(n)</li>
</ul>

<p>Well-suited for sets of elements of known size, access by numeric index, in-place modification. Basic arrays and strings have a fixed length. For extensible strings, the standard Buffer type can be used (see below).</p>

<h2><a name="Set_and_Map">Set and Map: immutable trees</a></h2>

<p>Like lists, these are immutable and they may share some subtrees. They are a good solution for keeping older versions of sets of items.</p>

<ul>
<li>"adding" an element: O(log n)</li>
<li>returning the number of elements: O(n)</li>
<li>finding an element: O(log n)</li>
</ul>

<p>Sets and maps are very useful in compilation and meta-programming, but in other situations hash tables are often more appropriate (see below).</p>

<h2><a name="Hashtbl">Hashtbl: automatically growing hash tables</a></h2>

<p>Ocaml hash tables are mutable data structures, which are a good solution for storing (key, data) pairs in one single place.</p>

<ul>
<li>adding an element: O(1) if the initial size of the table is larger than the number of elements it contains; O(log n) on average if n elements have been added in a table which is initially much smaller than n.</li>
<li>returning the number of elements: O(1)</li>
<li>finding an element: O(1)</li>
</ul>

<h2><a name="Buffer">Buffer: extensible strings</a></h2>

<p>Buffers provide an efficient way to accumulate a sequence of bytes in a single place. They are mutable.</p>

<ul>
<li>adding a char: O(1) if the buffer is big enough, or O(log n) on average if the initial size of the buffer was much smaller than the number of bytes n.</li>
<li>adding a string of k chars: O(k * "adding a char")</li>
<li>length: O(1)</li>
<li>accessing cell i: O(1)</li>
</ul>

<h2><a name="Queue">Queue</a></h2>

<p>OCaml queues are mutable first-in-first-out (FIFO) data structures.</p>

<ul>
<li>adding an element: O(1)</li>
<li>taking an element: O(1)</li>
<li>length: O(1)</li>
</ul>

<h2><a name="Stack">Stack</a></h2>

<p>OCaml stacks are mutable last-in-first-out (LIFO) data structures. They are just like lists, except that they are mutable, i.e. adding an element doesn't create a new stack but simply adds it to the stack.</p>

<ul>
<li>adding an element: O(1)</li>
<li>taking an element: O(1)</li>
<li>length: O(n)</li>
</ul>

</body>
