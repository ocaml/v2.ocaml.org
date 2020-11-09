<!-- ((! set title OCaml Platform !)) ((! set platform !)) -->
<!-- ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>The OCaml Platform</h1>
    <div class="row">
        <div id="platform-logo" class="span6">
            <iframe title="State of the OCaml Platform 2020" width="100%" height="315" src="https://www.youtube-nocookie.com/embed/E8T_4zqWmq8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <section id="platform-leader" class="span6">
            <p>The <strong>OCaml Platform</strong> represents the best way for developers, both new and old, to write software in OCaml. It combines the core OCaml compiler with a coherent set of tools, documentation, libraries and testing resources. It’s a project led by the <a href="/community/support.html">OCaml Labs</a> group in Cambridge, working closely with <a href="/community/support.html">OCaml-Pro</a> in France, and the requirements of the Platform are being guided by the industrial OCaml Consortium.</p>
            <p>Each element of the platform lives at a different point in the lifecycle of being a Platform tool:</p>
            <ol>
                <li><em>Incubation</em>: New tools that fill a gap in the ecosystem but are not quite ready for wide-scale release and adoption.</li>
                <li><em>Active</em>: The work-horse tools that are used daily with strong backwards compatibility guarentees from the community.</li>
                <li><em>Sustain</em>: Tools that will not likely see any major feature added but can be used reliably even if not being actively developed.</li>
                <li><em>Deprecate</em>: Tools that are gradually being phased out of use with clear paths to better workflows.</li>
            </ol>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Incubate</h1>
            <ol>
                <li><em>Mdx</em>: executable code blocks in your markdown</li>
                <li><em>Lsp-Server</em>: an OCaml implementation of the Language Server Protocol (LSP)</li>
                <li><em>OCamlformat</em>: enforcing formatting styles to an OCaml project</li>
                <li><em>Dune-release</em>: a CLI tool for easier packaging and publishing.</li>
                <li><em>Bun</em>: a CLI tool for helping fuzz testing commands.</li>
                <li><em>Dune-release</em>: a CLI tool for easier packaging and publishing.</li>
            </ol>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Active</h1>
            <ol>
                <li><em>Dune</em>: a build tool that has been widely adopted in the OCaml world</li>
                <li><em>Ppxlib</em>: a collection of useful tools for writing PPX libraries</li>
                <li><em>UTOP</em>: OCaml's Universal Toplevel.</li>
                <li><em>Opam-publish</em>: a tool for publishing packages to the opam repository</li>
                <li><em>Merlin</em>: brining IDE features to editors like Vim and Emacs.</li>
                <li><em>Dune-release</em>: a CLI tool for easier packaging and publishing.</li>
            </ol>
        </section>
        <section class="span4 condensed">
            <h1 class="ruled">Sustain</h1>
            <ol>
                <li><em>Ocp-indent</em>:  an indentation tool for OCaml</li>
                <li><em>Omp</em>: a conversion tool for OCaml parsetrees between major versions</li>
                <li><em>OCamlbuild</em>: a build tool for OCaml programs</li>
                <li><em>OCamlfind</em>: a library manager for OCaml packages</li>
            </ol>
        </section>
    </div>
    <div class="row">
        <section class="span4 condensed">
            <h1 class="ruled">Room to grow</h1>
            <p>The OCaml Platform makes it quick and easy to be productive as it provides a set of well tested, and well documented packages that work on a range of supported platforms.  Growing beyond those packages is trivially simple as OPAM allows you to easily access multiple versions of hundreds of packages, all of which have test information available and news feeds.  The  OCaml Platform represents the best way for developers, both new and old, to write software in OCaml.</p>
        </section>
        <section class="span8 condensed">
            <h1>Packages</h1>
        ((! input template/front_package.mpp !))
        </section>
    </div>
</div>

