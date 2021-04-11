<!-- ((! set title OCaml Platform !)) ((! set platform !)) -->
<!-- ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>The OCaml Platform</h1>
    <div class="row">
        <div id="platform-logo" class="span6">
            <iframe title="State of the OCaml Platform 2020" width="100%" height="315" src="https://www.youtube-nocookie.com/embed/E8T_4zqWmq8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <p>This talk was given in the broader context of the <a href="/meetings/ocaml/2020/">OCaml 2020 Workshop</a>.</p>
        </div>
        <section id="platform-leader" class="span6">
            <p>The <strong>OCaml Platform</strong> represents the best way for developers, both new and old, to write software in OCaml. It combines the core OCaml compiler with a coherent set of tools, documentation, libraries and testing resources. </p>
            <p>Each element of the platform lives at a different point in the lifecycle of being a Platform tool:</p>
            <ol>
                <li><em>Incubation</em>: New tools that fill a gap in the ecosystem but are not quite ready for wide-scale release and adoption.</li>
                <li><em>Active</em>: The work-horse tools that are used daily with strong backwards compatibility guarantees from the community.</li>
                <li><em>Sustain</em>: Tools that will not likely see any major feature added but can be used reliably even if not being actively developed.</li>
                <li><em>Deprecate</em>: Tools that are gradually being phased out of use with clear paths to better workflows.</li>
            </ol>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1 class="ruled">Active</h1>
            <ul class="news-feed">
                <li>
                    <article>
                        <h1><a href="https://opam.ocaml.org/" target="_blank" rel="noopener">Opam</a></h1>
                        <p>A source-based OCaml package manager</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/dune" target="_blank" rel="noopener">Dune</a></h1>
                        <p>A build tool that has been widely adopted in the OCaml ecosystem</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml-ppx/ppxlib" target="_blank" rel="noopener">Ppxlib</a></h1>
                        <p>A collection of useful tools for writing PPX libraries</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml-community/utop" target="_blank" rel="noopener">UTOP</a></h1>
                        <p>OCaml's Universal Top Level</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml-opam/opam-publish" target="_blank" rel="noopener">Opam-publish</a></h1>
                        <p>A tool for publishing packages to the opam repository</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/merlin" target="_blank" rel="noopener">Merlin</a></h1>
                        <p>Context sensitive completion for OCaml in Vim and Emacs</p>
                    </article>
                </li>
            </ul>
        </section>
        <section class="span6 condensed">
            <h1 class="ruled">Incubate</h1>
            <ul class="news-feed">
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/odoc" target="_blank" rel="noopener">Odoc</a></h1>
                        <p>Documentation generator for OCaml</p>
                    </article>
                </li>   
                <li>
                    <article>
                        <h1><a href="https://github.com/realworldocaml/mdx" target="_blank" rel="noopener">Mdx</a></h1>
                        <p>Executable code blocks in your markdown</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/ocaml-lsp" target="_blank" rel="noopener">Lsp-server</a></h1>
                        <p>an OCaml implementation of the Language Server Protocol (LSP)</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml-ppx/ocamlformat" target="_blank" rel="noopener">OCamlformat</a></h1>
                        <p>Enforcing styles on an OCaml project</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocamllabs/dune-release" target="_blank" rel="noopener">Dune-release</a></h1>
                        <p>A CLI tool for easier packaging and publishing with opam, dune and Github</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/yomimono/ocaml-bun" target="_blank" rel="noopener">Bun</a></h1>
                        <p>A CLI tool making fuzz testing easier</p>
                    </article>
                </li>
            </ul>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1 class="ruled">Sustain</h1>
            <ul class="news-feed">
                <li>
                    <article>
                        <h1><a href="https://github.com/OCamlPro/ocp-indent" target="_blank" rel="noopener">Ocp-indent</a></h1>
                        <p>An indentation tool for OCaml</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml-ppx/ocaml-migrate-parsetree" target="_blank" rel="noopener">Omp</a></h1>
                        <p>A conversion tool for major version of the OCaml parsetree</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/ocamlbuild" target="_blank" rel="noopener">OCamlbuild</a></h1>
                        <p>A build tool for OCaml programs</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/ocamlfind" target="_blank" rel="noopener">OCamlfind</a></h1>
                        <p>A library manager for OCaml packages</p>
                    </article>
                </li>
            </ul>
        </section>
        <section class="span6 condensed">
            <h1 class="ruled">Deprecate</h1>
            <ul class="news-feed">
                <li>
                    <article>
                        <h1><a href="https://github.com/ocaml/oasis" target="_blank" rel="noopener">Oasis</a></h1>
                        <p>A build tool for OCaml programs</p>
                    </article>
                </li>
                <li>
                    <article>
                        <h1><a href="https://github.com/camlp4/camlp4" target="_blank" rel="noopener">Camlp4</a></h1>
                        <p>A tool for writing extensible parsers</p>
                    </article>
                </li>
            </ul>
        </section>
    </div>
</div>

