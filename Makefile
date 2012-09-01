# auto-generated files, deleted by distclean
AUTOFILES = src/lib/OCamlWeb_Main.ml \
            src/lib/OCamlWeb_Main.mli \
            setup.ml

# build the website
WWW = www
.PHONY: web
web: build
	if [ -x ./build.native ]; then ./build.native; else ./build.byte; fi
	cp -a src/html/css $(WWW)
	cp -a src/html/js $(WWW)
	cp -a src/html/ext/bootstrap/css/*.css $(WWW)/css/
	cp -a src/html/ext/bootstrap/js $(WWW)/
	cp -a src/html/ext/*.js $(WWW)/js/
	cp -a src/html/img $(WWW)
	cp -a src/html/ext/bootstrap/img/*.png $(WWW)/img/

src/lib/OCamlWeb_Main.ml src/lib/OCamlWeb_Main.mli: src/lib/OCamlWeb_Main.html src/lib/OCamlWeb_Main.html.ml src/lib/OCamlWeb_Main.html.mli
	cd src/lib; weberizer_compile OCamlWeb_Main.html

setup.ml: _oasis
	oasis setup -setup-update dynamic

SETUP = ocaml setup.ml

setup.data: setup.ml src/lib/OCamlWeb_Main.html src/lib/OCamlWeb_Main.html.ml src/lib/OCamlWeb_Main.html.mli
	$(SETUP) -configure $(CONFIGUREFLAGS)

configure: setup.data

build: setup.data src/lib/OCamlWeb_Main.ml src/lib/OCamlWeb_Main.mli
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

test: setup.data build
	$(SETUP) -test $(TESTFLAGS)

all: setup.ml
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

uninstall: setup.data
	$(SETUP) -uninstall $(UNINSTALLFLAGS)

reinstall: setup.data
	$(SETUP) -reinstall $(REINSTALLFLAGS)

clean: setup.ml
	$(SETUP) -clean $(CLEANFLAGS)

distclean: setup.ml
	$(SETUP) -distclean $(DISTCLEANFLAGS)
	$(RM) -r $(WWW)
	$(RM) $(AUTOFILES)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

# publish the site to the development site
DEVSITE = forge.ocamlcore.org:/home/groups/ocamlweb/htdocs/
.PHONY: dev-upload dev-publish
dev-publish dev-upload: web
	scp -C -r $(WWW) $(UPLOAD)
