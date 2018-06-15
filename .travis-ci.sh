#!/bin/sh

set -ex

export OPAMYES=1

# $HOME/.opam is cached, hence always present.
if [ -f "$HOME/.opam/config" ]; then
    opam update || UPDATE_FAILED="yes"
    opam upgrade || UPGRADE_FAILED="yes"
    if [ -n "$UPDATE_FAILED" ] || [ -n "$UPGRADE_FAILED" ]; then
        # Something went wrong, restart from scratch
        rm -rf "$HOME/.opam/"
        opam init
    fi
else
    opam init
fi

if [ -n "${OPAM_SWITCH}" ]; then
    opam switch "$OPAM_SWITCH"
fi
eval "$(opam config env)"

make deps
RC=$?
if [ $RC -ne 0 ]; then
    # Try again after updating the environment (bin path)
    eval "$(opam config env)"
    make deps
fi

export OCAMLRUNPARAM=b
make -j 2
