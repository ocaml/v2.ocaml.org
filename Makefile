# auto-generated files, deleted by distclean
AUTOFILES = src/lib/main.ml \
            src/lib/main.mli \
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
	cp -a src/html/CNAME $(WWW)/

src/lib/main.ml src/lib/main.mli: src/lib/main.html src/lib/main.html.ml src/lib/main.html.mli
	cd src/lib; weberizer main.html

setup.ml: _oasis
	oasis setup -setup-update dynamic

SETUP = ocaml setup.ml

setup.data: setup.ml src/lib/main.html src/lib/main.html.ml src/lib/main.html.mli
	$(SETUP) -configure $(CONFIGUREFLAGS)

configure: setup.data

build: setup.data src/lib/main.ml src/lib/main.mli
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
	make
	commit=`git log -1 --pretty=format:%H`; \
	temp=`mktemp -d temp-gh-pages.XXXXX`; \
	git clone git@github.com:ocaml/ocaml.org.git $$temp -b gh-pages && \
	rsync -av --delete --exclude=.git www/ $$temp && \
	cd $$temp && \
	git add . && \
	git commit -a -m "publish $$commit" && \
	git push && \
	cd .. && \
	rm -rf $$temp

.PHONY: build doc test all install uninstall reinstall clean distclean configure publish
