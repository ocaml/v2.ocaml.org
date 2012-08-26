# auto-generated ml/mli files
AUTOFILES = src/lib/OCamlWeb_Main.ml \
            src/lib/OCamlWeb_Main.mli

WWW = www
UPLOAD = forge.ocamlcore.org:/home/groups/ocamlweb/htdocs/

# build the website
.PHONY: web
web: build
	./build.native
	cp -a src/html/css $(WWW)
	cp -a src/html/js $(WWW)
	cp -a src/html/ext/bootstrap/css/*.css $(WWW)/css/
	cp -a src/html/ext/bootstrap/js $(WWW)/
	cp -a src/html/ext/*.js $(WWW)/js/
	cp -a src/html/img $(WWW)
	cp -a src/html/ext/bootstrap/img/*.png $(WWW)/img/

setup.data: src/lib/OCamlWeb_Main.html \
  src/lib/OCamlWeb_Main.html.ml src/lib/OCamlWeb_Main.html.mli

src/lib/OCamlWeb_Main.ml src/lib/OCamlWeb_Main.mli: src/lib/OCamlWeb_Main.html src/lib/OCamlWeb_Main.html.ml src/lib/OCamlWeb_Main.html.mli
	cd src/lib; weberizer_compile OCamlWeb_Main.html

build: src/lib/OCamlWeb_Main.ml src/lib/OCamlWeb_Main.mli

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

.PHONY: upload publish
publish upload: web
	scp -C -r $(WWW) $(UPLOAD)
