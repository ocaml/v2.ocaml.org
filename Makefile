
local: script/relative_urls
	$(MAKE) staging
	find ocaml.org -type f | while read f; do \
	  script/relative_urls --path ocaml.org "$$f"; done

production: script/ocamltohtml script/rss2html
	$(MAKE) ocaml.org
	bash script/gen.bash production site
	$(MAKE) syncotherfiles
	$(RM) ocaml.org/robots.txt

staging: script/ocamltohtml script/rss2html
	$(MAKE) ocaml.org
	bash script/gen.bash staging site
	$(MAKE) syncotherfiles

syncotherfiles:
	rsync --exclude '*~' --exclude '*.md' --exclude '*.html' \
	  -rltHprogv site/* ocaml.org/


clean:
	$(RM) -r ocaml.org *~ *.cmo *.cmi *.cma *.o
	$(RM) $(TRASH)
	$(RM) $(addprefix script/, *~ *.annot *.cmo *.cmi *.cma *.cmx *.o)

include Makefile.common

.PHONY: production local staging syncotherfiles clean
