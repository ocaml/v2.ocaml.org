
export OPAMYES=1

# $HOME/.opam is cached, hence always present.
if [ -f "$HOME/.opam/config" ]; then
    opam update
    opam upgrade --yes
else
    opam init
fi

if [ -n "${OPAM_SWITCH}" ]; then
    opam switch ${OPAM_SWITCH}
fi
eval `opam config env`

make deps

export OCAMLRUNPARAM=b
make -j 2
