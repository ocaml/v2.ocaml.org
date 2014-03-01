HEADACHE = headache -c _headache.conf

local: script/relative_urls
	$(MAKE) staging
	find ocaml.org -type f | while read f; do \
	  script/relative_urls --path ocaml.org "$$f"; done

production:
	$(MAKE) gen_md gen_html
	$(MAKE) syncotherfiles
	$(RM) ocaml.org/robots.txt

staging: 
	$(MAKE) gen_md gen_html SET_STAGING='-set staging'
	$(MAKE) syncotherfiles

syncotherfiles:
	rsync --exclude '*~' --exclude '*.md' --exclude '*.html' \
	  --exclude '*.cmi' --exclude '*.cmo' --exclude '*.annot' \
	  -rltHprogv site/* ocaml.org/

# List of files to build, sorted according to their source format
MD_FILES = $(patsubst site/%, ocaml.org/%, $(patsubst %.md, %.html, \
  $(shell find site -type f -name '*.md' -print)))

HTML_FILES = $(patsubst site/%, ocaml.org/%, \
  $(shell find site -type f -name '*.html' -print))

gen_md:
	@$(MAKE) -f Makefile.from_md $(MD_FILES)
gen_html:
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
	$(RM) $(TRASH)
	$(RM) $(addprefix script/, *~ *.annot *.cmo *.cmi *.cma *.cmx *.o)

include Makefile.common

.PHONY: production local staging syncotherfiles gen_md gen_html headache clean
