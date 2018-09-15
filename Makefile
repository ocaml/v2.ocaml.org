HEADACHE = headache -c _headache.conf
LATEST = 4.07

local: script/relative_urls
	$(MAKE) staging SET_STAGING='-set staging'
	find ocaml.org -type f | while read f; do \
	  script/relative_urls --path ocaml.org "$$f"; done

production: pre-build
	$(MAKE) gen_md gen_html
	$(MAKE) syncotherfiles
	$(MAKE) copymanual
	$(RM) ocaml.org/robots.txt

staging: pre-build
	$(MAKE) gen_md gen_html SET_STAGING='-set staging'
	$(MAKE) syncotherfiles
	$(MAKE) copymanual

syncotherfiles:
	rsync --exclude '*~' --exclude '*.md' --exclude '*.html' \
	  --exclude '*.cmi' --exclude '*.cmo' --exclude '*.annot' \
	  -rltHprogv site/* ocaml.org/
	if test -d ../ocaml.org-media; then \
	 rsync --exclude '*~' --exclude '*.md' \
	  --exclude '*.cmi' --exclude '*.cmo' --exclude '*.annot' \
	  -rltHprogv ../ocaml.org-media/* ocaml.org/ ; fi

copymanual:
	rsync -rltHprogv site/manual/* ocaml.org/manual/
	if [ -e ocaml.org/manual/latest ]; then \
	rm -f ocaml.org/manual/latest ; \
	fi
	(cd ocaml.org/manual/ && ln -s $(LATEST) latest)

deps:
	opam pin add ocamlorg . --no-action --yes --kind=path
	opam install ocamlorg --deps-only

# This target is PHONY (see end) because we don't want to enumerate
# all the dependents that invalidate the resulting
# opam.ocaml.org/template.xhtml for fear of that enumeration being
# incomplete or falling out of date. That is, we treat ocaml.org's
# page generation process as a black box here and suffer no noticeable
# performance degradation.
opam.ocaml.org_template:
	$(MAKE) -f Makefile.opam.ocaml.org

# List of files to build, sorted according to their source format
MD_FILES = $(patsubst site/%, ocaml.org/%, $(patsubst %.md, %.html, \
  $(shell find site -type f -name '*.md' -print)))

HTML_FILES = $(patsubst site/%, ocaml.org/%, \
  $(shell find site -type f -name '*.html' -print))

feed: ocaml.org/feed.xml ocaml.org/opml.xml
ocaml.org/feed.xml: script/rss2html
	mkdir -p $(basename $@)
	./$< -n 50 --aggregate $@
ocaml.org/opml.xml: script/rss2html ocaml.org/feed.xml
	mkdir -p $(basename $@)
	./$< --opml $@


gen_md: feed
	@$(MAKE) -f Makefile.from_md $(MD_FILES)
gen_html: feed
	@$(MAKE) -f Makefile.from_html $(HTML_FILES)

headache:
	find site/ \! -name '*.js' \! -name '*.css' -type f \
	  | xargs $(HEADACHE) -h _header_content
	find script/ -type f \! -perm /0100 \
	  | xargs $(HEADACHE) -h _header_scripts
	find Makefile* -type f \
	  | xargs $(HEADACHE) -h _header_scripts
	find site/ -name '*.css' -type f \
	  | xargs $(HEADACHE) -h _header_design


clean:
	$(RM) -r ocaml.org *~ *.cmo *.cmi *.cma *.o
	$(RM) opam.ocaml.org/template.xhtml
	$(RM) $(TRASH)
	$(RM) $(addprefix script/, *~ *.annot *.cmo *.cmi *.cma *.cmx *.o)

include Makefile.common

.PHONY: production local staging opam.ocaml.org_template \
	syncotherfiles deps feed gen_md gen_html headache clean
