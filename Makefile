# auto-generated files, deleted by distclean
AUTOFILES = src/lib/ocamlorg.ml \
            src/lib/ocamlorg.mli \
            setup.ml

# build the website
WWW = www
.PHONY: web web-stop-on-error post-build
web: build
	if [ -x ./build.native ]; then ./build.native; else ./build.byte; fi
	$(MAKE) post-build

web-stop-on-error: build
	if [ -x ./build.native ]; then ./build.native --stop-on-error; \
	else ./build.byte --stop-on-error; fi
	$(MAKE) post-build

post-build:
	cp -a src/html/css $(WWW)
	cp -a src/html/js $(WWW)
	cp -a src/html/ext/bootstrap/css/*.css $(WWW)/css/
	cp -a src/html/ext/bootstrap/js $(WWW)/
	cp -a src/html/ext/*.js $(WWW)/js/
	cp -a src/html/img $(WWW)
	cp -a src/html/ext/bootstrap/img/*.png $(WWW)/img/
	cp -a src/html/CNAME $(WWW)/

src/lib/ocamlorg.ml src/lib/ocamlorg.mli: src/lib/ocamlorg.html src/lib/ocamlorg.html.ml src/lib/ocamlorg.html.mli
	cd src/lib; weberizer ocamlorg.html

setup.ml: _oasis
	oasis setup -setup-update dynamic

SETUP = ocaml setup.ml

setup.data: setup.ml src/lib/ocamlorg.html src/lib/ocamlorg.html.ml src/lib/ocamlorg.html.mli
	$(SETUP) -configure $(CONFIGUREFLAGS)

configure: setup.data

build: setup.data src/lib/ocamlorg.ml src/lib/ocamlorg.mli
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

publish:
	git checkout publish
	git pull
	$(MAKE) web-stop-on-error
	commit=`git log -1 --pretty=format:%H`; \
	temp=`mktemp -d temp-gh-pages.XXXXX`; \
	git clone git@github.com:ocaml/ocaml.org.git $$temp -b gh-pages && \
	rsync -av --delete --exclude=.git www/ $$temp && \
	cd $$temp && \
	git add --all . && \
	git commit -a -m "publish $$commit" && \
	git push && \
	cd .. && \
	rm -rf $$temp

.PHONY: build doc test all install uninstall reinstall clean distclean configure publish
