#!/bin/bash

for i in mpp omd find make rsync 
do
    if which $i > /dev/null
    then
        continue
    else
        echo "You don't have '$i'"
        exit 1
    fi
done

if [[ "$#" == "0" ]]
then
    echo "Usage:"
    echo "$0 site/file.md"
    echo "$0 site/file.html"
    echo "$0 site/"
    echo "$0 site/some-directory"
    exit 1
fi

IFS=
find "$@" -type f -iname '*.md' |
while read i
do
    target="$(sed -e 's/\.md$/.html/' -e 's/^site/ocaml.org/' <<< "$i")"
    mkdir -p "$(dirname "$target")"
    make -f Makefile.from_md "$target"
done

find "$@" -type f -iname '*.html' |
while read i
do
    target="$(sed -e 's/^site/ocaml.org/' <<< "$i")"
    mkdir -p "$(dirname "$target")"
    make -f Makefile.from_html "$target"
#    mpp -so '((!' -sc '!))' -son '{{!' -scn '!}}' -soc '' -scc '' -sec '' -its < "$i" > "$target"
done

# mkdir -p html-pages/pkg/docs
# rsync opamhtml/doc_loader.js html-pages/pkg/docs/opam_doc_loader.js

