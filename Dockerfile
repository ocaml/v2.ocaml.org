FROM ocaml/opam:debian-12-ocaml-4.14 as build
RUN git -C /home/opam/opam-repository pull origin master && git -C /home/opam/opam-repository checkout 9b068e43042a758c4f1b3c131f310ab756c4e439 && opam update -u -y
WORKDIR /home/opam/src
RUN sudo chown opam /home/opam/src
COPY --chown=opam *.opam /home/opam/src
RUN opam pin add -n -k path ocamlorg /home/opam/src/
RUN opam depext ocamlorg
RUN opam install -y --deps-only ocamlorg
COPY --chown=opam . /home/opam/src
RUN opam exec -- make production
