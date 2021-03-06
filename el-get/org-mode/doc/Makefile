.SUFFIXES:	# we don't need default suffix rules
ifeq ($(MAKELEVEL), 0)
  $(error This make needs to be started as a sub-make from the toplevel directory.)
endif
.PHONY:		all info html pdf card manual guide install \
		clean cleanall clean-install

all:		$(ORG_MAKE_DOC)

info:		org

html:		org.html

pdf:		org.pdf orgguide.pdf

card:		orgcard.pdf orgcard_letter.pdf orgguide.pdf

manual guide::
	-$(RMR) $@
	$(MKDIR) $@
manual::	org.texi org-version.inc
	$(TEXI2HTML) -o $@ $<
	../UTILITIES/mansplit.pl $@/*
guide::		orgguide.texi org-version.inc
	$(TEXI2HTML) -o $@ $<
	../UTILITIES/guidesplit.pl $@/*

org-version.inc:	org.texi
	@echo "org-version: $(ORGVERSION) ($(GITVERSION))"
	@echo "@c automatically generated, do not edit"  > org-version.inc
	@echo "@set VERSION $(ORGVERSION) ($(GITVERSION))" >> org-version.inc
	@echo "@set DATE $(DATE)" >> org-version.inc

install:	org
	if [ ! -d $(DESTDIR)$(infodir) ]; then $(MKDIR) $(DESTDIR)$(infodir); else true; fi ;
	$(CP) org $(DESTDIR)$(infodir)
	$(INSTALL_INFO) --infodir=$(DESTDIR)$(infodir) org

clean:
	$(RM) org *.pdf *.html *_letter.tex org-version.inc \
	      *.aux *.cp *.cps *.dvi *.fn *.fns *.ky *.kys *.pg *.pgs \
	      *.toc *.tp *.tps *.vr *.vrs *.log *.html *.ps
cleanall:	clean
	$(RMR) guide manual

clean-install:
	$(RM) $(DESTDIR)$(infodir)/org*
	$(INSTALL_INFO) --infodir=$(DESTDIR)$(infodir) --remove org

.SUFFIXES:	.texi .tex .txt _letter.tex

%:		%.texi org-version.inc
	$(MAKEINFO) --no-split $< -o $@

%.pdf:		LC_ALL=C	# work around a bug in texi2dvi
%.pdf:		LANG=C		# work around a bug in texi2dvi
%.pdf:		%.texi org-version.inc
	$(TEXI2PDF) $<
%.pdf:		%.tex
	PDFLATEX=$(PDFTEX) $(TEXI2PDF) $<

%.html:		%.texi org-version.inc
	$(TEXI2HTML) --no-split -o $@ $<
	../UTILITIES/manfull.pl $@

%.txt:		%.tex
	perl ../UTILITIES/orgcard2txt.pl $< > $@

%_letter.tex:	%.tex
	$(BATCH) \
	  --eval '(add-to-list '"'"'load-path "../lisp")' \
	  --eval '(load "org-compat.el")' \
	  --eval '(load "../UTILITIES/org-fixup.el")' \
	  --eval '(org-make-letterformat "$(<F)" "$(@F)")'
