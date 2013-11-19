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

if [[ "$#" < "2" ]]
then
    echo "Usage:"
    echo "$0 (staging | production) site/file.md"
    echo "$0 (staging | production) site/file.html"
    echo "$0 (staging | production) site/"
    echo "$0 (staging | production) site/some-directory"
    exit 1
fi

IFS=
find "$2" -iname '*.md' |
while read i
do
    target="$(sed -e 's/\.md$/.html/' -e 's/^site/ocaml.org/' <<< "$i")"
    mkdir -p "$(dirname "$target")"
    case "$1" in
        "staging")
            make -f Makefile.from_md SET_STAGING='-set staging' "$target"
            ;;
        "production")
            make -f Makefile.from_md "$target"
            ;;
    esac
done

find "$2" -iname '*.html' |
while read i
do
    target="$(sed -e 's/^site/ocaml.org/' <<< "$i")"
    mkdir -p "$(dirname "$target")"
    case "$1" in
        "staging")
            make -f Makefile.from_html SET_STAGING='-set staging' "$target"
            ;;
        "production")
            make -f Makefile.from_html "$target"
            ;;
    esac
#    mpp -so '((!' -sc '!))' -son '{{!' -scn '!}}' -soc '' -scc '' -sec '' -its < "$i" > "$target"
done

# mkdir -p html-pages/pkg/docs
# rsync opamhtml/doc_loader.js html-pages/pkg/docs/opam_doc_loader.js

