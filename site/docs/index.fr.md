<!-- ((! set title Docs !)) ((! set documentation !)) ((! set nobreadcrumb !)) -->

<div class="container">
    <h1>Documentation</h1>
    <div class="row">
        <section class="span6 condensed">
            <h1 class="ruled">Résumé</h1>
            <p>Ici vous trouverez des liens vers la documentation du compilateur OCaml, de l'information sur <a href="/releases/">ses versions</a> et d'autres ressources.</p>
            <p>La documentation de chaque contribution est disponible en suivant le lien sur la page d'information de la contribution. <a href="https://opam.ocaml.org/packages/">Rechercher dans la liste des contributions</a> pour trouver ce dont vous avez besoin.</p>
        </section>
        <section class="span6 condensed">
            <h1 class="ruled">Références</h1>
            <div class="row">
                <a href="/releases/latest/manual.html"
				    target="_blank" class="span3 documentation-highlight">
                    <img src="/img/manual.svg" alt="" class="svg" />
                    <img src="/img/manual.png" alt="" class="png" />
                    Le manuel d'OCaml
                </a>
                <a href="license.html" class="span3 documentation-highlight">
                    <img src="/img/license.svg" alt="" class="svg" />
                    <img src="/img/license.png" alt="" class="png" />
                    La licence d'OCaml
                </a>
            </div>
            <div class="row">
                <a href="https://opam.ocaml.org/packages/" class="span3 documentation-highlight">
                    <img src="/img/documents.svg" alt="" class="svg" />
                    <img src="/img/documents.png" alt="" class="png" />
                    Docs des contributions
                </a>
                <a href="cheat_sheets.html" class="span3 documentation-highlight">
                    <img src="/img/cheat.svg" alt="" class="svg" />
                    <img src="/img/cheat.png" alt="" class="png" />
                    Mémentos
                </a>
            </div>
        </section>
    </div>
    <div class="row">
        <section class="span6 condensed">
            <h1 class="ruled">Documentation d'OPAM</h1>
            <p>(<a href="https://opam.ocaml.org">OPAM</a>) permet de gérer l'installation de paquets sources en OCaml. Il permet l'installation de plusieurs versions du compilateur, tolère des contraintes complexes de dépendances entre les paquets et repose sur des mises à jour via un dépôt Github. La documentation sur l'utilisation d'OPAM pour installer des paquets ou créer vos propres paquets, <a href="https://opam.ocaml.org/doc/Install.html">lire ici</a>. Les paquets sont automatiquement testés lors de leur soumission et un rapport est envoyé au mainteneur. Si vous soumettez un paquet, cela vous permettra de recevoir régulièrement les résultats de tests de non-régression sur une multitude de systèmes d'exploitation et de plateformes.</p>
            <p>OPAM a été créé et est maintenu par OCamlPro, tandis qu'OCaml Labs gère le dépôt de paquets. Les rapports de bugs et suggestions pour l'outil doivent être déposés sur le <a href="https://github.com/OCaml/opam/issues">bug tracker d'OPAM</a>. Les problèmes concernant les paquets doivent être soumis sur le <a href="https://github.com/OCaml/opam-repository/issues">bug tracker du dépôt principal</a>. Les questions générales sur l'outil et les paquets peuvent être envoyées sur <a href="http://lists.ocaml.org/listinfo/platform">la liste de la plateforme OCaml</a> et les détails ou l'évolution d'OPAM peuvent être discutés sur <a href="http://lists.ocaml.org/listinfo/opam-devel">la liste OPAM-devel</a>.</p>
        </section>
        <section class="span6 condensed">
            <h1 class="ruled"><a href="/learn/books.html">Livres</a> et <a href="/docs/papers.html">articles</a></h1>
            <div class="row">
                <div class="span2 documentation-book">
                    <a href="https://realworldocaml.org">
                        <img src="/img/real-world-ocaml.jpg" alt="Real Worl OCaml book">
                    </a>
                </div>
                <div class="span2 documentation-book">
                    <a href="http://ocaml-book.com">
                        <img src="/img/OCaml_from_beginning.png" alt="OCaml from the very beginning">
                    </a>
                </div>
                <div class="span2">                    
                    <p>Il y a plusieurs excellents livres sur OCaml, dont deux nouveaux titres publiés en 2013. Ainsi, Real World OCaml est disponible <a href="https://realworldocaml.org">online</a> en anglais.</p>
                </div>
            </div>
            <footer>
            <p><a href="/learn/books.html">Voir plus de livres</a> et <a href="/docs/papers.html">articles</a></p>
            </footer>
        </section>
    </div>
    <div class="row">
        <section class="span12 condensed">
            <h1 class="ruled"><a href="/community/media.html">Vidéos</a></h1>
            <div class="row">
                    <div class="span4">
                        <p class="documentation-video">
						<iframe width="310" height="175" src="//www.youtube.com/embed/NF2WpWnB-nk?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
                        </p>
                      <p>Dans cet exposé, Mark Shinwell explique comment
                      trouver des bugs difficiles dans les programmes OCaml.
		      Cela nécessite l'utilisation du nouveau support de gdb,
		      récemment développé par OCamlPro et d'autres contributeurs.
					  (<a href="http://oud.ocaml.org/2012/slides/oud2012-paper5-slides.pdf"
                      >PDF</a>)</p>
                            </div>
                    <div class="span4">
                        <p class="documentation-video">
                            <iframe src="//player.vimeo.com/video/14317442?portrait=0&amp;color=ff9933" width="310" height="233" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                        </p>
                        <p>Exposé de Yaron Minsky à CMU présentant
le retour d'expérience de Jane Street sur l'utilisation d'OCaml comme
principal langage de développement.</p>
                    </div>
                    <div class="span4">
                        <p class="documentation-video">
                            <iframe src="//player.vimeo.com/video/6652523?portrait=0&amp;color=ff9933" width="310" height="233" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                        </p>
                        <p>Rapport d'expérience: OCaml utilisé pour une
plateforme d'analyse statique de niveau industriel, par
                        Pascal Cuoq et Julien Signoles du CEA LIST, à ICFP'2009.</p>
                    </div>
            </div>
            <footer>
                <p><a href="/community/media.html">Voir plus de vidéos</a></p>
            </footer>
        </section>
    </div>
</div>

