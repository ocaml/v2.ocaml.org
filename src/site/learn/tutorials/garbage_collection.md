<head>
<title>Garbage Collection</title>
</head>
<body>

<h1>Garbage Collection</h1>

<h2><a name="Garbage_collection__reference_counting__explicit_allocation"></a>
  Garbage collection, reference counting, explicit allocation</h2>

<p>As with all modern languages, OCaml provides a garbage collector so that you don't need to explicitly allocate and free memory as in C/C++.</p>
<p>As JWZ writes in his <a href="http://www.jwz.org/doc/java.html" class="external" title="http://www.jwz.org/doc/java.html">&quot;Java sucks&quot; rant</a>:</p>
<p><em>First the good stuff:  Java doesn't have <code>free()</code>.  I have to admit right off that, after that, all else is gravy. That one point makes me able to forgive just about anything else, no matter how egregious. Given this one point, everything else in this document fades nearly to insignificance. <strong>But...</strong></em></p>
<p>The OCaml garbage collector is a modern hybrid generational/incremental collector which outperforms hand-allocation in most cases. Unlike the Java GC, which gives GCs a bad name, the OCaml GC doesn't allocate huge amounts of memory at start-up, nor does it appear to have arbitrary fixed limits that need to be overridden by hand.</p>
<p>Why would garbage collection be faster than explicit memory allocation as in C? It's often assumed that calling <code>free</code> costs nothing. In fact <code>free</code> is an expensive operation which involves navigating over the complex data structures used by the memory allocator. If your program calls <code>free</code> intermittently, then all of that code and data needs to be loaded into the cache, displacing your program code and data, each time you <code>free</code> a single memory allocation.  A collection strategy which frees multiple memory areas in one go (such as either a pool allocator or a GC) pays this penalty only once for multiple allocations (thus the cost per allocation is much reduced).</p>
<p>GCs also move memory areas around and compact the heap. This makes allocation easier, hence faster, and a smart GC can be written to interact well with the L1 and L2 caches.</p>
<p>Of course none of this precludes writing a very fast hand-allocator, but it's considerably harder work than most programmers realise.</p>
<p>OCaml's garbage collector has two heaps, the <strong>minor heap</strong> and the <strong>major heap</strong>.  This recognises a general principle: Most objects are small and allocated frequently and then immediately freed. These objects go into the minor heap first, which is GCed frequently.  Only some objects are long lasting. These objects get promoted from the minor heap to the major heap after some time, and the major heap is only collected infrequently.</p>
<p>The OCaml GC is synchronous.  It doesn't run in a separate thread, and it can only get called during an allocation request.</p>
<h3>GC vs. reference counting</h3>
<p>Perl has a form of garbage collection, but it uses a simple scheme called <strong>reference counting</strong>. Simply put, each Perl object keeps a count of the number of other objects pointing (referencing) itself. When the count falls to zero, nothing is pointing at this object, and so the object can be freed.</p>
<p>Reference counting is not considered as serious garbage collection by computer scientists, yet it has one big practical advantage over full garbage collectors. With reference counting, you can avoid many explicit calls to <code>close</code>/<code>closedir</code> in code. For example:</p>
<pre>
foreach (@files)
{
  my $io = new IO::File &quot;&lt; $_&quot; or die;
  # read from $io
}
</pre>

<p>This Perl code iterates over a list of <code>@files</code>, opening and reading each one. There is no need to close the <code>$io</code> file handle at the end of the loop. Because Perl uses reference counting, as soon as we reach the end of the loop, the <code>$io</code> variable goes out of scope, so the reference count on the file object goes to zero, and it is immediately freed (ie. closed).</p>
<p>Consider the equivalent OCaml code:</p>
<pre ml:content="ocaml noeval">
let read_file filename =
  let chan = open_in filename in
  (* read from chan *) in
List.iter read_file files
</pre>

<p>Calls to <code>read_file</code> open the file but don't close it. Because OCaml uses a full garbage collector <code>chan</code> isn't collected until some time later when the minor heap becomes full.  In addition, <strong>OCaml will not close the channel when it collects the handle's memory</strong>.  So this program would eventually run out of file descriptors.</p>
<p>You need to be aware of this when writing OCaml code which uses files or directories or any other heavyweight object with complex finalisation.</p>
<p>To be fair to full garbage collection, I should mention the disadvantages of reference counting schemes:</p>
<ul><li>Each object needs to store a reference count. In other words there's a word overhead for every object. Programs use more memory, and are consequently slower because they are more likely to fill up the cache or spill into swap.</li>
<li>Reference counting is expensive - every time you manipulate pointers to an object you need to update and check the reference count. Pointer manipulation is frequent, so this slows your program and bloats the code size of compiled code.</li>
<li>They cannot collect so-called circular, or self-referential structures. I've programmed in many languages in many years and can't recall ever having created one of these.</li>
<li>Graph algorithms, of course, violate the previous assumption. Don't try to implement the TSP in Perl!</li></ul>
<a name="The_Gc_module"></a><h2><span>The Gc module</span></h2>
<p>The <code>Gc</code> module contains some useful functions for querying and calling the garbage collector from OCaml programs.</p>
<p>Here is a program which runs and then prints out GC statistics just before quitting:</p>
<pre ml:content="ocaml noeval">
let rec iterate r x_init i =
  if i = 1 then x_init
  else
    let x = iterate r x_init (i-1) in
    r *. x *. (1.0 -. x)

let () =
  Random.self_init ();
  Graphics.open_graph &quot; 640x480&quot;
  for x = 0 to 640 do
    let r = 4.0 *. (float_of_int x) /. 640.0 in
    for i = 0 to 39 do
      let x_init = Random.float 1.0 in
      let x_final = iterate r x_init 500 in
      let y = int_of_float (x_final *. 480.) in
      Graphics.plot x y
    done
  done;
  read_line ();
  Gc.print_stat stdout
</pre>

<p>Here is what it printed out for me:</p>
<pre>
minor_words: 115926165          # Total number of words allocated
promoted_words: 31217           # Promoted from minor -&gt; major
major_words: 31902              # Large objects allocated in major directly
minor_collections: 3538         # Number of minor heap collections
major_collections: 39           # Number of major heap collections
heap_words: 63488               # Size of the heap, in words = approx. 256K
heap_chunks: 1
top_heap_words: 63488
live_words: 2694
live_blocks: 733
free_words: 60794
free_blocks: 4
largest_free: 31586
fragments: 0
compactions: 0
</pre>

<p>We can see that minor heap collections are approximately 100 times more frequent than major heap collections (in this example, not necessarily in general). Over the lifetime of the program, an astonishing 440 MB of memory was allocated, although of course most of that would have been immediately freed in a minor collection. Only about 128K was promoted to long-term storage on the major heap, and about another 128K consisted of large objects which would have been allocated directly onto the major heap.</p>
<p>We can instruct the GC to print out debugging messages when one of several events happen (eg. on every major collection). Try adding the following code to the example above near the beginning:</p>
<pre ml:content="ocaml noeval">
Gc.set { (Gc.get ()) with Gc.verbose = 0x01 }
</pre>

<p>(We haven't seen the <code>{ <em>expression</em> with <em>field = value</em> }</code> form before, but it should be mostly obvious what it does). The above code anyway causes the GC to print a message at the start of every major collection.</p>

<a name="Finalisation_and_the_Weak_module"></a><h2><span>Finalisation and the Weak module</span></h2>

<p>We can write a function called a <strong>finaliser</strong> which is called when an object is about to be freed by the GC.</p>
<p>The <code>Weak</code> module lets us create so-called weak pointers. A <strong>weak pointer</strong> is best defined by comparing it to a &quot;normal pointer&quot;. When we have an ordinary OCaml object, we reference that object through a name (eg. <code>let name = ... in</code>) or through another object. The garbage collector sees that we have a reference to that object and won't collect it. That's what you might call a &quot;normal pointer&quot;. If, however, you hold a weak pointer or weak reference to an object, then you hint to the garbage collector that it may collect the object at any time. (Not necessarily that it <em>will</em> collect the object). Some time later, when you come to examine the object, you can either turn your weak pointer into a normal pointer, or else you can be informed that the GC did actually collect the object.</p>
<p>Finalisation and weak pointers can be used together to implement an in-memory object database cache. Let's imagine that we have a very large number of large user records in a file on disk. This is far too much data to be loaded into memory all at once, and anyway other programs might access the data on the disk, so we need to lock individual records when we hold copies of them in memory.</p>
<p>The <em>public</em> interface to our &quot;in-memory object database cache&quot; is going to be just two functions:</p>
<pre ml:content="ocaml noeval">
type record = { mutable name : string; mutable address : string }

val get_record : int -&gt; record
val sync_records : unit -&gt; unit
</pre>

<p>The <code>get_record</code> call is the only call that most programs will need to make. It gets the n<sup>th</sup> record either out of the cache or from disk and returns it. The program can then read and/or update the <code>record.name</code> and <code>record.address</code> fields. The program then just literally forgets about the record! Behind the scenes, finalisation is going to write the record back out to disk at some later point in time.</p>
<p>The <code>sync_records</code> function can also be called by user programs. This function synchronises the disk copy and in-memory copies of all records.</p>
<p>OCaml doesn't currently run finalisers at exit. However you can easily force it to by adding the following command to your code. This command causes a full major GC cycle on exit:</p>
<pre ml:content="ocaml noeval">
at_exit Gc.full_major
</pre>

<p>Our code is also going to implement a cache of recently accessed records using the <code>Weak</code> module. The advantage of using the <code>Weak</code> module rather than hand-rolling our own code is two-fold: Firstly the garbage collector has a global view of memory requirements for the whole program, and so is in a better position to decide when to shrink the cache. Secondly our code will be much simpler.</p>
<p>For our example, we're going to use a very simple format for the file of users' records. The file is just a list of user records, each user record having a fixed size of 256 bytes. Each user record has just two fields (padded with spaces if necessary), the name field (64 bytes) and the address field (192 bytes). Before a record can be loaded into memory, the program must acquire an exclusive lock on the record. After the in-memory copy is written back out to the file, the program must release the lock.  Here is some code to define the on-disk format and some low-level functions to read, write, lock and unlock records:</p>
<pre ml:content="ocaml noeval">
open Unix

(* On-disk format. *)
let record_size = 256
let name_size = 64
let addr_size = 192

(* Low-level load/save records to file. *)
let seek_record n fd =
  lseek fd (n * record_size) SEEK_SET

let write_record record n fd =
  seek_record n fd;
  write fd record.name 0 name_size;
  write fd record.address 0 addr_size

let read_record record n fd =
  seek_record n fd;
  read fd record.name 0 name_size;
  read fd record.address 0 addr_size

(* Lock/unlock the nth record in a file. *)
let lock_record n fd =
  seek_record n fd;
  lockf fd F_LOCK record_size

let unlock_record n fd =
  seek_record n fd;
  lockf fd F_ULOCK record_size
</pre>

<p>We also need a function to create new, empty in-memory <code>record</code> objects:</p>
<pre ml:content="ocaml noeval">
(* Create a new, empty record. *)
let new_record () =
  { name = (String.make name_size ' ');
    address = (String.make addr_size ' ') }
</pre>

<p>Because this is a really simple program, we're going to fix the number of records in advance:</p>
<pre ml:content="ocaml noeval">
(* Total number of records. *)
let nr_records = 10000

(* On-disk file. *)
let diskfile = openfile &quot;users.bin&quot; [ O_RDWR ] 0
</pre>

<p>Download <a href="../img/users.bin.gz">users.bin.gz</a> and decompress it before running the program.</p>
<p>Our cache of records is very simple:</p>
<pre ml:content="ocaml noeval">
(* Cache of records. *)
let cache = Weak.create nr_records
</pre>

<p>The <code>get_record</code> function is very short and basically composed of two halves. We grab the record from the cache. If the cache gives us <code>None</code>, then that either means that we haven't loaded this record from the cache yet, or else it has been written out to disk (finalised) and dropped from the cache. If the cache gives us <code>Some record</code> then we just return <code>record</code> (this promotes the weak pointer to the record to a normal pointer).</p>
<pre ml:content="ocaml noeval">
open Printf

(* The finaliser function. *)
let finaliser n record =
  printf &quot;*** objcache: finalising record %d\n&quot; n;
  write_record record n diskfile;
  unlock_record n diskfile

(* Get a record from the cache or off disk. *)
let get_record n =
  match Weak.get cache n with
  | Some record -&gt;
      printf &quot;*** objcache: fetching record %d from memory cache\n&quot; n;
      record
  | None -&gt;
      printf &quot;*** objcache: loading record %d from disk\n&quot; n;
      let record = new_record () in
      Gc.finalise (finaliser n) record;
      lock_record n diskfile;
      read_record record n diskfile;
      Weak.set cache n (Some record);
      record
</pre>

<p>The <code>sync_records</code> function is even easier. First of all it empties the cache by replacing all the weak pointers with <code>None</code>.  This now means that the garbage collector <em>can</em> collect and finalise all of those records. But it doesn't necessarily mean that the GC <em>will</em> collect the records straightaway (in fact it's not likely that it will), so to force the GC to collect the records immediately, we also invoke a major cycle:</p>
<pre ml:content="ocaml noeval">
(* Synchronise all records. *)
let sync_records () =
  Weak.fill cache 0 nr_records None;
  Gc.full_major ()
</pre>

<p>Finally we have some test code. I won't reproduce the test code, but you can download the complete program and test code <a href="_file/objcache.ml">objcache.ml</a>, and compile it with:</p>
<pre>
ocamlc -w s unix.cma objcache.ml -o objcache
</pre>

<a name="Exercises"></a><h2><span>Exercises</span></h2>
<p>Here are some ways to extend the example above, in approximately increasing order of difficulty:</p>
<ol><li>Implement the record as an <strong>object</strong>, and allow it to transparently pad/unpad strings. You will need to provide methods to set and get the name and address fields (four public methods in all). Hide as much of the implementation (file access, locking) code in the class as possible.</li>
<li>Extend the program so that it acquires a <strong>read lock</strong> on getting the record, but upgrades this to a <strong>write lock</strong> just before the user updates any field.</li>
<li>Support a <strong>variable number of records</strong> and add a function to create a new record (in the file). [Tip: OCaml has support for weak hashtables.]</li>
<li>Add support for <strong>variable-length records</strong>.</li>
<li>Make the underlying file representation a <strong>DBM-style hash</strong>.</li>
<li>Provide a general-purpose cache fronting a &quot;users&quot; table in your choice of <strong>relational database</strong> (with locking).</li></ol>

</div>

</body>
