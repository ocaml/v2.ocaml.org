<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>Success Stories</title>
  </head>
  <body>
    <h1>Success Stories</h1>

    <div class="pull-right hero-unit" style="margin-left: 1em" >
      <em>Table of contents</em>
      <div ml:replace="toc"></div>
    </div>

    <h2><a name="jane-street"></a>Jane Street</h2>
    <div>
      <a href="img/jane-street.jpg">
        <img src="img/jane-street.jpg" alt="Jane Street" width="243px"
             class="pull-left" style="padding: 1ex 2ex 2ex 0;" />
      </a>

      <p>Jane Street is a quantitative proprietary trading firm with a
      unique focus on technology and collaborative problem solving.
      Our business requires us to consume, analyze, and respond to an
      enormous amount of data from multiple sources in real time.  On
      our busiest days, we trade over 200 million equity shares in the
      US alone.</p>

      <p>We view software as a way to maximize the potential of the
      people who work here, and so we invest heavily in building
      systems to do just that. Almost all of these systems are written
      in OCaml: from statistical research code operating over
      terabytes of data to systems-administration tools to our
      real-time trading infrastructure.</p>

      <p>Our trading crosses multiple exchanges, regulatory regimes,
      asset classes and time zones. The complexity and dynamism of our
      business are two of the reasons we use OCaml. It helps us to
      quickly adapt to changing market conditions, and go from
      prototypes to production systems with less effort. Moreover,
      OCaml’s type system acts as a rich and well-integrated set of
      static analysis tools that help improve the quality of our code,
      catching bugs at the earliest possible stage.  Billions of
      dollars of transactions flow through our systems every day, so
      getting it right matters.</p>
    </div>

    <h2><a name="unison"></a>The Unison File Synchronizer</h2>

    <div>
      <a href="http://caml.inria.fr/about/successes-images/unison.jpg"
         ><img src="http://caml.inria.fr/about/successes-images/unison-thumb.jpg"
	       alt="Screenshot" title="Screenshot of Unison's main window"
	       class="pull-left" style="padding: 1ex 2ex 2ex 0;"></a>

      <p>
        <a href="http://www.cis.upenn.edu/%7Ebcpierce/unison/">Unison</a>
        is a popular file-synchronization tool for Windows and most
        flavors of Unix. It allows two replicas of a collection of
        files and directories to be stored on different hosts (or
        different disks on the same host), modified separately, and
        then brought up to date by propagating the changes in each
        replica to the other.  Unlike simple mirroring or backup
        utilities, Unison can deal with updates to both replicas:
        updates that do not conflict are propagated automatically and
        conflicting updates are detected and displayed.  Unison is
        also resilient to failure: it is careful to leave the replicas
        and its own private structures in a sensible state at all
        times, even in case of abnormal termination or communication
        failures.
      </p>

      <p>
        <em><a href="http://www.cis.upenn.edu/%7Ebcpierce/"
               shape="rect">Benjamin C. Pierce</a> (University of Pennsylvania),
          Unison project leader, says:</em>

        &#8220;I think Unison is a very clear success for OCaml &#8211; in
        particular, for the extreme portability and overall excellent
        engineering of the compiler and runtime system.  OCaml's strong static
        typing, in combination with its powerful module system, helped us
        organize a large and intricate codebase with a high degree of
        encapsulation.  This has allowed us to maintain a high level of
        robustness through years of work by many different programmers.  In
        fact, Unison may be unique among large OCaml projects in having been
        <em>translated</em> from Java to OCaml midway through its development.
        Moving to OCaml was like a breath of fresh air.&#8221;
      </p>
    </div>

    <h2><a name="mldonkey"></a>The MLdonkey peer-to-peer client</h2>
    <div>
      <a href="http://caml.inria.fr/about/successes-images/mldonkey.jpg"
         ><img src="http://caml.inria.fr/about/successes-images/mldonkey-thumb.jpg"
	       alt="Screenshot" title="Screenshot of one of MLdonkey's windows"
	       class="pull-left" style="padding: 1ex 2ex 2ex 0;"></a>

      <p><a href="http://mldonkey.sourceforge.net/Main_Page">MLdonkey</a> is a
        multi-platform multi-networks peer-to-peer client. It was the
        first open-source client to access the eDonkey network.  Today,
        MLdonkey supports several other large networks, among which
        Overnet, Bittorrent, Gnutella, Gnutella2, Fasttrack, Soulseek,
        Direct-Connect, and Opennap. Searches can be conducted over
        several networks concurrently; files are downloaded from and
        uploaded to multiple peers concurrently.</p>

      <p><em>An MLdonkey developer says:</em>

        &#8220;Early in 2002, we decided to use OCaml to program a network
        application in the emerging world of peer-to-peer systems. The
        result of our work, MLdonkey, has surpassed our hopes: MLdonkey is
        currently the most popular peer-to-peer file-sharing client
        according to <a href="http://freshmeat.net/"
		        >freshmeat.net</a>, with about 10,000 daily
        users. Moreover, MLdonkey is the only client able to connect to
        several peer-to-peer networks, to download and share files. It
        works as a daemon, running unattended on the computer, and can be
        controlled remotely using a choice of three different kinds of
        interfaces: GTK, web and telnet.&#8221;
      </p>
    </div>


    <h2><a name="lexifi"></a>LexiFi's Modeling Language for Finance</h2>
    <div>
      <a href="http://caml.inria.fr/about/successes-images/lexifi.png"
         ><img src="http://caml.inria.fr/about/successes-images/lexifi-thumb.png"
	       alt="Screenshot" title="A report produced by LexiFi software"
	       class="pull-left" style="padding: 1ex 2ex 2ex 0;"></a>

      <p>Developed by the
        company <a href="http://www.lexifi.com/" >LexiFi</a>, the
        Modeling Language for Finance (MLFi) is the first formal
        language that accurately describes the most sophisticated
        capital market, credit, and investment products. MLFi is
        implemented as an extension of OCaml.</p>

      <p>MLFi users derive two important benefits from a functional
        programming approach. First, the declarative formalism of functional
        programming languages is well suited for <em>specifying</em> complex
        data structures and algorithms. Second, functional programming
        languages have strong
        <em>list processing</em> capabilities. Lists play a central role in
        finance where they are used extensively to define contract
        event and payment schedules.
      </p>

      <p>In addition, MLFi provides crucial business integration
        capabilities inherited from OCaml and related tools and libraries.
        This enables users, for example, to interoperate with C and Java
        programs, manipulate XML schemas and documents, and interface with
        SQL databases.
      </p>

      <p>Data models and object models aiming to encapsulate the
        definitions and behavior of financial instruments were developed by
        the banking industry over the past two decades, but face inherent
        limitations that OCaml helped overcome.
      </p>

      <p>LexiFi's approach to modeling complex financial contracts
        received an academic award in 2000, and the MLFi implementation was
        elected &#8220;Software Product of the Year 2001&#8221; by the
        magazine <em>Risk</em>, the leading financial trading and risk
        management publication. MLFi-based solutions are gaining growing
        acceptance throughout Europe and are contributing to spread the use
        of OCaml in the financial services industry.
      </p>
    </div>


    <h2><a name="coq"></a>The Coq Proof Assistant</h2>

    <div>
      <a href="http://caml.inria.fr/about/successes-images/coq.jpg"
         ><img src="http://caml.inria.fr/about/successes-images/coq-thumb.jpg"
	       alt="Screenshot"
	       title="Screenshot of Coq's integrated development environment"
	       class="pull-left" style="padding: 1ex 2ex 2ex 0;"></a>


      <p><em><a href="http://www.lri.fr/%7Efilliatr/">Jean-Christophe
            Filliâtre</a> (CNRS), a Coq developer, says:</em> &#8220;The
        <a href="http://coq.inria.fr/">Coq</a> tool is a
        system for manipulating formal mathematical proofs; a proof
        carried out in Coq is mechanically verified by the machine.  In
        addition to its applications in mathematics, Coq also allows
        certifying the correctness of computer programs.&#8221;</p>
      <p>&#8220;From the Coq standpoint, OCaml is attractive on multiple
        grounds. First, the OCaml language is perfectly suited for
        symbolic manipulations, which are of paramount importance in a
        proof assistant. Furthermore, OCaml's type system, and
        particularly its notion of abstract type, allow securely
        encapsulating Coq's critical code base, which guarantees the
        logical consistency of the whole system. Last, OCaml's strong
        type system <em>de facto</em> grants Coq's code a high level of
        quality: errors such as &#8220;segmentation faults&#8221; cannot
        occur during execution, which is indispensable for a tool whose
        primary goal is precisely rigor.&#8221;</p>
    </div>

    <h2><a name="astree"></a>The ASTRÉE Static Analyzer</h2>

    <div>
      <a href="http://www.airbus.com/product/a330_a340_backgrounder.asp"
         ><img src="http://caml.inria.fr/about/successes-images/astree.gif"
	       alt="A340"
	       title="ASTRÉE has been used to certify the Airbus A340 flight control software"
	       class="pull-left" style="padding: 1ex 2ex 2ex 0;"></a>

      <p><em><a href="http://www-verimag.imag.fr/~monniaux/"
	        >David Monniaux</a> (CNRS), member of the ASTRÉE
          project, says:</em>
        &#8220;<a href="http://www.astree.ens.fr/">ASTRÉE</a> is
        a <em>static analyzer</em> based
        on <a href="http://www.di.ens.fr/%7Ecousot/aiintro.shtml"
	      ><em>abstract interpretation</em></a> that aims at
        proving the absence of runtime errors in safety-critical
        software written in a subset of the C programming
        language.&#8221;
      </p>
      <p>&#8220;Automatically analyzing programs for exactly checking
        properties such as the absence of runtime errors is impossible
        in general, for mathematical reasons. Static analysis by
        abstract interpretation works around this impossibility and
        proves program properties by over-approximating the possible
        behaviors of the program: it is possible to design pessimistic
        approximations that, in practice, allow proving the desired
        property on a wide range of software.&#8221;
      </p>
      <p>&#8220;So far, ASTRÉE has proved the absence of runtime errors in
        the primary control software of
        the <a href="http://www.airbus.com/product/a330_a340_backgrounder.asp"
	       >Airbus A340 family</a>. This would be impossible
        by <em>software testing</em>, for testing only considers a
        limited <em>subset</em> of the test cases, while abstract
        interpretation considers a <em>superset</em> of all possible
        outcomes of the system.&#8221;
      </p>
      <p>&#8220;<a href="http://www.astree.ens.fr/">ASTRÉE</a> is written
        in OCaml and is about 44000 lines long (plus external
        libraries). We needed a language with good performance (speed
        and memory usage) on reasonable equipment, easy support for
        advanced data structures, and type and memory safety. OCaml also
        allows for modular, clear and compact source code and makes it
        easy to work with recursive structures such as syntax
        trees.&#8221;</p>
    </div>

    <h2><a name="slam"></a>SLAM</h2>
    <div>
      <p>The <a href="http://research.microsoft.com/en-us/projects/slam/"
	        >SLAM</a>
        project originated in Microsoft Research in early 2000. Its goal
        was to automatically check that a C program correctly uses the
        interface to an external library. The project used and extended
        ideas from symbolic model checking, program analysis and theorem
        proving in novel ways to address this problem. The SLAM analysis
        engine forms the core of a new tool called Static Driver Verifier
        (SDV) that systematically analyzes the source code of Windows
        device drivers against a set of rules that define what it means
        for a device driver to properly interact with the Windows
        operating system kernel.
      </p>
      <p><em>In technical report
          <a href="http://research.microsoft.com/apps/pubs/default.aspx?id=70038"
	     >MSR-TR-2004-08</a>, T.Ball, B.Cook, V.Levin
          and S.K.Rajamani, the SLAM developers, write:</em>

        &#8220;The Right Tools for the Job: We developed SLAM using Inria's
        OCaml functional programming language. The expressiveness of
        this language and robustness of its implementation provided a
        great productivity boost.&#8221;
      </p>
    </div>

    <h2><a name="fftw"></a>FFTW</h2>
    <div>
      <p><a href="http://www.fftw.org/">FFTW</a> is a
        <a href="http://www.fftw.org/benchfft/" >very fast</a> C library
        for computing Discrete Fourier Transforms (DFT). It uses a
        powerful symbolic optimizer written in OCaml which, given an
        integer N, generates highly optimized C code to compute DFTs of
        size N. FFTW was awarded the 1999
        <a href="http://www.mcs.anl.gov/research/opportunities/wilkinsonprize/3rd-1999.php"
           >Wilkinson prize</a> for numerical software.
      </p>

      <p>Benchmarks, performed on on a variety of platforms, show that
        FFTW's performance is typically superior to that of other publicly
        available DFT software, and is even competitive with vendor-tuned
        codes. In contrast to vendor-tuned codes, however, FFTW's
        performance is portable: the same program will perform well on
        most architectures without modification. Hence the name,
        &#8220;FFTW,&#8221; which stands for the somewhat whimsical title
        of &#8220;Fastest Fourier Transform in the West.&#8221;
      </p>
    </div>

    <h2><a name="liquidsoap"></a>Liquidsoap</h2>
    <div>
      <p><a href="http://liquidsoap.fm/">Liquidsoap</a> is clearly
        well established in the (internet) radio industry. Liquidsoap
        is well known as a tool with unique abilities, and has lots of
        users including big commercial ones.  It is not developed as a
        business, but companies develop services or software on top of
        it. For example, Sourcefabric develops and sells Airtime on
        top of Liquidsoap.
      </p>
    </div>

  </body>
</html>
