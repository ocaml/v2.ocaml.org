
all: script/ocamltohtml script/rss2html $(OMD_PP)
	$(MAKE) ocaml.org
	bash script/gen.bash site
	$(MAKE) syncotherfiles

preview: script/relative_urls
	$(MAKE) all
	find ocaml.org -type f | while read f; do \
	  script/relative_urls --path ocaml.org "$$f"; done

syncotherfiles:
	rsync --exclude '*.md' --exclude '*.html' -rltHprogv site/* ocaml.org/


clean:
	$(RM) -r ocaml.org *~ *.cmo *.cmi *.cma *.o
	$(RM) $(TRASH)
	$(RM) $(addprefix script/, *~ *.annot *.cmo *.cmi *.cma *.cmx *.o)

include Makefile.common

.PHONY: all preview syncotherfiles clean
