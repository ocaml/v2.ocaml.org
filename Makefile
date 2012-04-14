# auto-generated ml/mli files
AUTOFILES = src/lib/OCamlWeb_Main.ml \
            src/lib/OCamlWeb_Main.mli

WWW = www
LANGS = en fr de es it ja

# build the website
web: build
	./build.native
	cp -a src/html/css $(WWW)
	cp -a src/html/ext/bootstrap/css/*.css $(WWW)/css/
	cp -a src/html/ext/bootstrap/js $(WWW)/
	cp -a src/html/img $(WWW)
	@echo -n "Create symlinks for languages:"
	@for l in $(filter-out en, $(LANGS)); do \
	  if test -d $(WWW)/$$l; then \
	    echo -n " $$l"; \
	    test -e $(WWW)/$$l/css || ln -s ../css $(WWW)/$$l/css; \
	    test -e $(WWW)/$$l/js || ln -s ../js $(WWW)/$$l/js; \
	    test -e $(WWW)/$$l/img || ln -s ../img $(WWW)/$$l/img; \
	  fi; \
	done
	@echo

setup.data: src/lib/OCamlWeb_Main.html \
  src/lib/OCamlWeb_Main.html.ml src/lib/OCamlWeb_Main.html.mli

# OASIS_START
# DO NOT EDIT (digest: bc1e05bfc8b39b664f29dae8dbd3ebbb)

SETUP = ocaml setup.ml

build: setup.data
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

test: setup.data build
	$(SETUP) -test $(TESTFLAGS)

all: 
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

uninstall: setup.data
	$(SETUP) -uninstall $(UNINSTALLFLAGS)

reinstall: setup.data
	$(SETUP) -reinstall $(REINSTALLFLAGS)

clean: 
	$(SETUP) -clean $(CLEANFLAGS)

distclean: 
	$(SETUP) -distclean $(DISTCLEANFLAGS)

setup.data:
	$(SETUP) -configure $(CONFIGUREFLAGS)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

# OASIS_STOP

# delete everything that is auto-generated
.PHONY: fresh
fresh: distclean
	$(RM) -r $(WWW)
	$(RM) $(AUTOFILES)
