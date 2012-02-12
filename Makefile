PKGNAME	    = $(shell oasis query name)
PKGVERSION  = $(shell oasis query version)
PKG_TARBALL = $(PKGNAME)-$(PKGVERSION).tar.gz

WEB = forge.ocamlcore.org:/home/groups/ocamlweb/htdocs/

DISTFILES   = AUTHORS.txt INSTALL.txt README.txt _oasis \
  Makefile myocamlbuild.ml setup.ml config.ml _tags \
  $(wildward *.html)

.PHONY: all byte native configure doc install uninstall reinstall upload-doc

all: native
	./build.native
	cp -a src/html/css/ en/
	cp -a src/html/img/ en/

byte native setup.log: configure
	ocaml setup.ml -build

configure: setup.data
setup.data: setup.ml
	ocaml $< -configure

setup.ml: _oasis
	oasis setup

doc install uninstall reinstall: setup.log
	ocaml setup.ml -$@

upload-doc: doc
	scp -C -r _build/API.docdir/ $(WEB)

.PHONY: upload
upload: all
	scp -C -r en/ $(WEB)

# Make a tarball
.PHONY: dist tar
dist tar: $(DISTFILES)
	mkdir $(PKGNAME)-$(PKGVERSION)
	cp --parents -r $(DISTFILES) $(PKGNAME)-$(PKGVERSION)/
	tar -zcvf $(PKG_TARBALL) $(PKGNAME)-$(PKGVERSION)
	rm -rf $(PKGNAME)-$(PKGVERSION)


.PHONY: svn
svn:
	bzr push svn+ssh://scm.ocamlcore.org/svnroot/ocamlweb/template

.PHONY: clean distclean
clean::
	ocaml setup.ml -clean
	$(RM) $(PKG_TARBALL)

distclean:
	ocaml setup.ml -distclean
	$(RM) $(wildcard *.ba[0-9] *.bak *~ *.odocl)