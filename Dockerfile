FROM ocaml/opam
RUN git -C /home/opam/opam-repository pull && opam update -u -y
COPY . /home/opam/src
RUN sudo chown -R opam /home/opam/src
RUN opam pin add -n ocaml.org /home/opam/src
RUN opam depext -u ocaml.org
RUN opam install -j 4 -y -v --deps-only ocaml.org
RUN opam install -y -v ocaml.org
