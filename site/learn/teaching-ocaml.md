# Teaching OCaml

OCaml is a high-level language that supports functional, imperative
and object-oriented programming styles. As such, it is an excellent
tool for teaching the fundamental concepts behind programming
languages, type theory and systems.

For the full description of the benefits of the OCaml language
please refer to the article on "
[Why OCaml?](https://realworldocaml.org/v1/en/html/prologue.html)".

This page is devoted to resources for people who are teaching OCaml in
a University setting. It contains a list of courses in different
Universities that use OCaml as a teaching language. It can help with
setting up a course structure as well as finding the relevant contacts
to discuss and share experiences. We also include relevant resources
such as references to commonly used textbooks, VMs and IDE guides for
setting up your preferred environment to work with OCaml. We hope that
this will make the task of shaping a programming course that uses
OCaml a slightly easier task.

**Don't worry if things do not work**! OCaml has a vibrant and rapidly
  growing community behind it that is eager to help. If you find any
  problems with any of the tutorials or something is missing please
  let us know by
  [creating an issue](https://github.com/ocaml/ocaml.org/issues/new) so we
  can help in making your experience with OCaml more pleasant. If you
  would like to add your course or other resources please also
  [create an issue](https://github.com/ocaml/ocaml.org/issues/new).


## Courses taught in OCaml

Here's a list of courses we know about that teach in OCaml. 

1. [Brown (CS-17)](http://cs.brown.edu/courses/cs017/) (along with Racket, Scala and Java)
1. [Cornell (CS3110)](http://www.cs.cornell.edu/courses/cs3110/2012sp/courseinfo.php)
1. [Harvard (CS51)](http://cs51.seas.harvard.edu)
1. [Indian Institute of Technology, Delhi (CSL 101) ](http://www.cse.iitd.ernet.in/~ssen/csl101/details.html)(along with Pascal and Java)
1. [Princeton (COS326)](http://www.cs.princeton.edu/courses/archive/fall14/cos326/)
1. [Rice University (COMP 311)](http://www.cs.rice.edu/~javaplt/311/info.html)
1. [UMass (CS691F)](http://people.cs.umass.edu/~arjun/courses/cs691f/)
1. [UPenn (CIS120) ](http://www.seas.upenn.edu/~cis120/current/)
1. [University of Birmingham (focs1112)](https://sites.google.com/site/focs1112/)
1. [University of California, San Diego (cse130-a/)](http://cseweb.ucsd.edu/classes/wi13/cse130-a/) (along with Python and Prolog)
1. [University of Cambridge (L28)](http://www.cl.cam.ac.uk/teaching/1415/L28/)
1. [University of Illinois at Urbana-Champaign (CS 421](https://courses.engr.illinois.edu/cs421/)
1. [University of Innsbruck (SS6)](http://cl-informatik.uibk.ac.at/teaching/ss06/ocaml/schedule.php)
1. [University of Maryland (CMSC 330)](http://www.cs.umd.edu/class/spring2014/cmsc330/) (along with Ruby, Prolog, Java)
1. [University of Massachusetts Amherst (CMPSCI631)](http://people.cs.umass.edu/~arjun/teaching/631/)
1. [University of Wrocław](https://international.uni.wroc.pl/en/course/functional-programming)
1. [Université Paris-Diderot (pf5)](http://www.pps.univ-paris-diderot.fr/~treinen/teaching/pf5/)
1. [Aarhus University](https://services.brics.dk/java/courseadmin/dOvs) (along with Java)

### Google map of the course

[Add your course to the map!](https://www.google.com/maps/d/edit?mid=zk8_K4G_usic.kkzYvEvqV44Q)

_(Tip: Click on the relevant layer (e.g., US,EU), search for your
University, click on the marker and click on "Add to map", fill in the
info fields and you are done!)_

<iframe src="https://www.google.com/maps/d/embed?mid=zk8_K4G_usic.kkzYvEvqV44Q" width="640" height="480"></iframe>


# Resources


## Suggested Textbooks 

<!-- Go though course pages and add books that are actually used in courses -->

This is a list of books and lecture notes that are being used for
teaching OCaml.  There is a wider list of book to choose from at For
the full list refer to
[Textbook section](http://ocaml.org/learn/books.html)

1. [Lecture notes](http://www.seas.upenn.edu/~cis120/current/notes/120notes.pdf)
   for Penn's CIS120.  Like the course, this book covers both OCaml
   and Java, and is intended for students with no programming
   background.
1. [Real World OCaml](http://shop.oreilly.com/product/0636920024743.do),
   also available [online](https://realworldocaml.org/).  Not really
   intended as a textbook, and probably not ideal as a first programming book.  But it
   has been used in a few university classes, including Harvard's CS51.
1. Jason Hickey's
   [Introduction to Objective Caml](http://files.metaprl.org/doc/ocaml-book.pdf),
   originally developed as lecture notes for Jason's course at Cal
   Tech.



## Teaching tools

This section lists some of the available tools that are or can be used in a classroom or lab.

### In the browser
<!-- Fill out this paragraph with a bit more detail. Why should ppl
look at browser versions first? -->
For a quick example of OCaml in the browser Run and explore OCaml
without installing it.

1. [IOCaml Notebooks](https://github.com/andrewray/iocaml/blob/master/README.md)
1. [A compiler from OCaml bytecode to Javascript](http://ocsigen.github.io/js_of_ocaml/)
1. [Try OCaml](http://try.ocamlpro.com/)
1. [Compile OCaml Online](http://www.compileonline.com/compile_ocaml_online.php)
1. [Codepad](http://codepad.org/)
1. [Run OCaml Code Online](https://dbgr.cc/l/ocaml)


### OCaml installation

Check out our [Install OCaml section](http://ocaml.org/docs/install.html)

Alternative guides

1. [Installation Instructions from Real World OCaml](https://github.com/realworldocaml/book/wiki/Installation-Instructions)


### VM images

This is a list of VM images that some Universities use to avoid setup
delays and provide a consistent environment.

1. [OCaml 4.01 for MAC](http://caml.inria.fr/pub/distrib/ocaml-4.01/ocaml-4.01.0-intel.dmg)
1. [Cornell's Linux VM VirtualBox image](https://cornell.app.box.com/s/acqwpvnidu5yq1osd8lb) ([more info here](http://www.cs.cornell.edu/courses/CS3110/2014sp/hw/0/ps0.pdf))
1. [Princeton's Ubuntu VirtualBox VM](http://www.cs.princeton.edu/~cos326/Ubuntu326.ova) (more info on the course's [site ](http://www.cs.princeton.edu/courses/archive/fall14/cos326/resources.php))

### IDEs and other development tools

1. EMACS with OCaml 
  * [Setting Up Your OCaml Development Environment on OS X](http://www.princeton.edu/~crmarsh/ocaml_dev_environment/)
  * [Installing Emacs with Tuareg Mode](http://www.cs.cornell.edu/courses/CS3110/2014sp/resources.php)
  * [Emacs from scratch](https://github.com/the-lambda-church/merlin/wiki/emacs-from-scratch)
1. VIM with OCaml 
  * [Intellisense for OCaml with Vim and Merlin](http://anil.recoil.org/2013/10/03/merlin-and-vim.html)
  * [Vim from scartch](https://github.com/the-lambda-church/merlin/wiki/vim-from-scratch)
1. Eclipse
  * [OcaIDE](http://www.algo-prog.info/ocaide/index.php) [[1](http://www.princeton.edu/~crmarsh/ocaml_dev_environment/)] , [[2](http://www.seas.upenn.edu/~cis120e/ocaml_setup.shtml)]
  * [OCaml Development Tools](http://ocamldt.free.fr/) (OCD)
1. [More information on using Merlin with Vim/Emacs](https://opam.ocaml.org/blog/turn-your-editor-into-an-ocaml-ide/)
1. [OCaml-Top](http://www.typerex.org/ocaml-top.html)



### Tutorials and Exercises

**University tutorials and notes**

1. [From UMass's CS691F Programming languages course](http://people.cs.umass.edu/~arjun/courses/cs691f/assignments/ocaml-tutorial.html)
1. [CSE 130: Programming Languages Course at UCSA](http://cseweb.ucsd.edu/classes/wi11/cse130/). Click on [Lectures] (http://cseweb.ucsd.edu/classes/wi11/cse130/) and [Discussion Notes] (http://cseweb.ucsd.edu/classes/wi11/cse130/). Have a look at Lec 7 (a pp presentation by Zach) for an inspiring introduction into map and fold.
1. [CS 3110 Fall 2013 :: Data Structures and Functional Programming at Cornell](http://www.cs.cornell.edu/courses/cs3110/2013fa/lecture_notes.php). The lecturing materials explain OCaml on the basis of the fundamental concepts of functional programming languages.
1. [CIS 500: Software Foundations at UPenn](http://www.seas.upenn.edu/~cis500/cis500-f05/index.html). A Software Fundations course with strong emphasis on Types. The [OCaml Tutorial] (http://www.seas.upenn.edu/~cis500/cis500-f05/resources/seas-ocaml.html) includes a gentle introduction to the OCaml interactive top-level system and compilation in OCaml.

**Other sources**

1. You can also check out the [OCaml tutorials section](http://ocaml.org/learn/tutorials/) for ideas and code.
1. Also check out the [OCaml code examples section](http://ocaml.org/learn/taste.html) and [99 Problems (solved) in OCaml](http://ocaml.org/learn/tutorials/99problems.html)
1. [OCaml Core turotials](http://mirror.ocamlcore.org/ocaml-tutorial.org/)
1. [Beginner's guide to OCaml beginner's guides.](http://blog.nullspace.io/beginners-guide-to-ocaml-beginners-guides.html)
1. [Examples and Exercises for the book "More OCaml"](https://github.com/johnwhitington/more-ocaml-exercises)
1. [A Concise Introduction to Objective Caml](http://www.csc.villanova.edu/~dmatusze/resources/ocaml/ocaml.html)
