FROM ocaml/opam:debian-10-ocaml-4.10
RUN git -C /home/opam/opam-repository pull origin master && git -C /home/opam/opam-repository checkout c1952fb63c5a89c8c4230aac0360884518d72d91 && opam update -u -y
WORKDIR /home/opam/src
RUN sudo chown opam /home/opam/src
COPY --chown=opam *.opam /home/opam/src
RUN opam pin add -n -k path ocamlorg /home/opam/src/
RUN opam depext ocamlorg
RUN opam install -y --deps-only ocamlorg
COPY --chown=opam . /home/opam/src
RUN opam exec -- make production
