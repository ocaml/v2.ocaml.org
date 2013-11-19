
production: script/ocamltohtml script/rss2html
	$(MAKE) ocaml.org
	bash script/gen.bash site
	$(MAKE) syncotherfiles

preview: script/relative_urls
	$(MAKE) production
	find ocaml.org -type f | while read f; do \
	  script/relative_urls --path ocaml.org "$$f"; done

syncotherfiles:
	rsync --exclude '*.md' --exclude '*.html' -rltHprogv site/* ocaml.org/


clean:
	$(RM) -r ocaml.org *~ *.cmo *.cmi *.cma *.o
	$(RM) template/front_code_snippet.html
	$(RM) $(addprefix script/, *~ *.cmo *.cmi *.cma *.o)

include Makefile.common

.PHONY: production preview syncotherfiles clean
