#-*- Makefile -*-

# Makefile for PO directory in any package using GNU gettext.
# Copyright (C) 1995-1997, 2000-2006 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
#
# This file can be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU General Public
# License but which still want to provide support for the GNU gettext
# functionality.
# Please note that the actual code of GNU gettext is covered by the GNU
# General Public License and is *not* in the public domain.
#
# Origin: gettext-0.16
## Much modified by the R-core team for use in the R project.

## add other languages for the R domain to LINGUAS
## add both RGui-ll.po and RGui-ll.gmo files to RGUI_CATALOGS
RGUI_CATALOGS = \
  RGui-de.po RGui-de.gmo \
  RGui-es.po RGui-es.gmo \
  RGui-fr.po RGui-fr.gmo \
  RGui-it.po RGui-it.gmo \
  RGui-ja.po RGui-ja.gmo \
  RGui-ko.po RGui-ko.gmo \
  RGui-nn.po RGui-nn.gmo \
  RGui-pt_BR.po RGui-pt_BR.gmo \
  RGui-ru.po RGui-ru.gmo \
  RGui-tr.po RGui-tr.gmo \
  RGui-zh_CN.po RGui-zh_CN.gmo \
  RGui-zh_TW.po RGui-zh_TW.gmo


srcdir = .
top_srcdir = ..

top_builddir = ..

include $(top_builddir)/Makeconf

Rsharedir = $(DESTDIR)${rsharedir}
Rlocaledir = $(Rsharedir)/locale

mkinstalldirs = $(MKINSTALLDIRS)

GMSGFMT = :
MSGFMT = :
XGETTEXT = :
MSGMERGE = msgmerge
MSGMERGE_UPDATE = : --update
MSGINIT = msginit
MSGCONV = msgconv
MSGFILTER = msgfilter

POFILES =  en.po en_GB.po es.po fr.po de.po it.po ja.po ko.po nn.po pt_BR.po ru.po tr.po zh_CN.po zh_TW.po en@quot.po
GMOFILES =  en.gmo en_GB.gmo es.gmo fr.gmo de.gmo it.gmo ja.gmo ko.gmo nn.gmo pt_BR.gmo ru.gmo tr.gmo zh_CN.gmo zh_TW.gmo en@quot.gmo
UPDATEPOFILES =  en.po-update en_GB.po-update es.po-update fr.po-update de.po-update it.po-update ja.po-update ko.po-update nn.po-update pt_BR.po-update ru.po-update tr.po-update zh_CN.po-update zh_TW.po-update en@quot.po-update
DUMMYPOFILES =  en.nop en_GB.nop es.nop fr.nop de.nop it.nop ja.nop ko.nop nn.nop pt_BR.nop ru.nop tr.nop zh_CN.nop zh_TW.nop en@quot.nop
DISTFILES.common = README RGui.pot THANKS Makefile.in.in Makefile.win remove-potcdate.sin \
$(DISTFILES.common.extra1) $(DISTFILES.common.extra2) $(DISTFILES.common.extra3)
DISTFILES = $(DISTFILES.common) Makevars POTFILES.in $(DOMAIN).pot \
$(POFILES) $(GMOFILES) $(RGUI_CATALOGS) \
$(DISTFILES.extra1) $(DISTFILES.extra2) $(DISTFILES.extra3)

POTFILES = \
     ../src/appl/binning.c \
     ../src/appl/pretty.c \
     ../src/appl/rcont.c \
     ../src/appl/strsignif.c \
     ../src/gnuwin32/dynload.c \
     ../src/gnuwin32/extra.c \
     ../src/gnuwin32/rui.c \
     ../src/gnuwin32/run.c \
     ../src/gnuwin32/shext.c \
     ../src/gnuwin32/sys-win32.c \
     ../src/gnuwin32/system.c \
     ../src/include/Errormsg.h \
     ../src/main/CConverters.c \
     ../src/main/CommandLineArgs.c \
     ../src/main/RNG.c \
     ../src/main/Rdynload.c \
     ../src/main/Rstrptime.h \
     ../src/main/Rmain.c \
     ../src/main/agrep.c \
     ../src/main/apply.c \
     ../src/main/arithmetic.c \
     ../src/main/array.c \
     ../src/main/attrib.c \
     ../src/main/base.c \
     ../src/main/bind.c \
     ../src/main/builtin.c \
     ../src/main/character.c \
     ../src/main/coerce.c \
     ../src/main/colors.c \
     ../src/main/complex.c \
     ../src/main/connections.c \
     ../src/main/context.c \
     ../src/main/cov.c \
     ../src/main/cum.c \
     ../src/main/datetime.c \
     ../src/main/dcf.c \
     ../src/main/debug.c \
     ../src/main/deparse.c \
     ../src/main/deriv.c \
     ../src/main/devices.c \
     ../src/main/dotcode.c \
     ../src/main/dounzip.c \
     ../src/main/dstruct.c \
     ../src/main/duplicate.c \
     ../src/main/engine.c \
     ../src/main/envir.c \
     ../src/main/errors.c \
     ../src/main/eval.c \
     ../src/main/format.c \
     ../src/main/fourier.c \
     ../src/main/gevents.c \
     ../src/main/gram-ex.c \
     ../src/main/gram.y \
     ../src/main/graphics.c \
     ../src/main/grep.c \
     ../src/main/internet.c \
     ../src/main/iosupport.c \
     ../src/main/lapack.c \
     ../src/main/list.c \
     ../src/main/localecharset.c \
     ../src/main/logic.c \
     ../src/main/main.c \
     ../src/main/mapply.c \
     ../src/main/match.c \
     ../src/main/memory.c \
     ../src/main/mkdtemp.c \
     ../src/main/model.c \
     ../src/main/names.c \
     ../src/main/objects.c \
     ../src/main/optim.c \
     ../src/main/optimize.c \
     ../src/main/options.c \
     ../src/main/par-common.c \
     ../src/main/par.c \
     ../src/main/paste.c \
     ../src/main/platform.c \
     ../src/main/plot.c \
     ../src/main/plot3d.c \
     ../src/main/plotmath.c \
     ../src/main/print.c \
     ../src/main/printarray.c \
     ../src/main/qsort-body.c \
     ../src/main/qsort.c \
     ../src/main/random.c \
     ../src/main/registration.c \
     ../src/main/relop.c \
     ../src/main/rlocale.c \
     ../src/main/saveload.c \
     ../src/main/scan.c \
     ../src/main/seq.c \
     ../src/main/serialize.c \
     ../src/main/sort.c \
     ../src/main/source.c \
     ../src/main/split.c \
     ../src/main/sprintf.c \
     ../src/main/startup.c \
     ../src/main/subassign.c \
     ../src/main/subscript.c \
     ../src/main/subset.c \
     ../src/main/summary.c \
     ../src/main/sysutils.c \
     ../src/main/unique.c \
     ../src/main/util.c \
     ../src/main/version.c \
     ../src/main/vfonts.c \
     ../src/main/xspline.c \
     ../src/modules/internet/internet.c \
     ../src/modules/internet/nanoftp.c \
     ../src/modules/internet/nanohttp.c \
     ../src/modules/internet/sockconn.c \
     ../src/modules/lapack/Lapack.c \
     ../src/modules/X11/devX11.c \
     ../src/nmath/bessel_i.c \
     ../src/nmath/bessel_j.c \
     ../src/nmath/bessel_k.c \
     ../src/nmath/bessel_y.c \
     ../src/nmath/nmath.h \
     ../src/nmath/pnchisq.c \
     ../src/nmath/polygamma.c \
     ../src/nmath/rhyper.c \
     ../src/nmath/rmultinom.c \
     ../src/nmath/signrank.c \
     ../src/nmath/snorm.c \
     ../src/nmath/wilcox.c \
     ../src/unix/dynload.c \
     ../src/unix/edit.c \
     ../src/unix/sys-std.c \
     ../src/unix/sys-unix.c \
     ../src/unix/system.c \
     ../src/unix/X11.c

CATALOGS =  en.gmo en_GB.gmo es.gmo fr.gmo de.gmo it.gmo ja.gmo ko.gmo nn.gmo pt_BR.gmo ru.gmo tr.gmo zh_CN.gmo zh_TW.gmo en@quot.gmo

# Makevars gets inserted here. (Don't remove this line!)
# -*-Makefile-*- variables for PO directory in any package using GNU gettext.

# Usually the message domain is the same as the package name.
DOMAIN = $(PACKAGE)

# These two variables depend on the location of this directory.
subdir = po
top_builddir = ..

# These options get passed to xgettext.
XGETTEXT_OPTIONS = --keyword=_ --keyword=N_

# This is the copyright holder that gets inserted into the header of the
# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
# package.  (Note that the msgstr strings, extracted from the package's
# sources, belong to the copyright holder of the package.)  Translators are
# expected to transfer the copyright for their translations to this person
# or entity, or to disclaim their copyright.  The empty string stands for
# the public domain; in this case the translators are expected to disclaim
# their copyright.
COPYRIGHT_HOLDER = The R Foundation

# This is the email address or URL to which the translators shall report
# bugs in the untranslated strings:
# - Strings which are not entire sentences, see the maintainer guidelines
#   in the GNU gettext documentation, section 'Preparing Strings'.
# - Strings which use unclear terms or require additional context to be
#   understood.
# - Strings which make invalid assumptions about notation of date, time or
#   money.
# - Pluralisation problems.
# - Incorrect English spelling.
# - Incorrect formatting.
# It can be your email address, or a mailing list address where translators
# can write to without being subscribed, or the URL of a web page through
# which the translators can contact you.
MSGID_BUGS_ADDRESS = bugs@R-project.org

# This is the list of locale categories, beyond LC_MESSAGES, for which the
# message catalogs shall be used.  It is usually empty.
EXTRA_LOCALE_CATEGORIES =

.SUFFIXES:
.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update .pkg-update

.po.mo:
	@echo "$(MSGFMT) -c -o $@ $<"; \
	$(MSGFMT) -c -o t-$@ $< && mv t-$@ $@

.po.gmo:
	@lang=`echo $* | sed -e 's,.*/,,'`; \
	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics -o $${lang}.gmo $${lang}.po"; \
	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo

.sin.sed:
	@sed -e '/^#/d' $< > t-$@
	@mv t-$@ $@

all: all-yes


R: 
	@$(MAKE) install Rsharedir=${top_builddir}/share

all-yes: stamp-po
all-no:

# stamp-po is a timestamp denoting the last time at which the CATALOGS have
# been loosely updated. Its purpose is that when a developer or translator
# checks out the package via CVS, and the $(DOMAIN).pot file is not in CVS,
# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but subsequent
# invocations of "make" will do nothing. This timestamp would not be necessary
# if updating the $(CATALOGS) would always touch them; however, the rule for
# $(POFILES) has been designed to not touch files that don't need to be
# changed.
stamp-po: $(srcdir)/$(DOMAIN).pot
	@test ! -f $(srcdir)/$(DOMAIN).pot || \
	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
	  echo "touch stamp-po" && \
	  echo timestamp > stamp-poT && \
	  mv stamp-poT stamp-po; \
	}

# Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
# otherwise packages like GCC can not be built if only parts of the source
# have been downloaded.

# This target rebuilds $(DOMAIN).pot; it is an expensive operation.
# Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
$(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' = '@'PACKAGE_BUGREPORT'@'; then \
	  msgid_bugs_address='$(MSGID_BUGS_ADDRESS)'; \
	else \
	  msgid_bugs_address='$(PACKAGE_BUGREPORT)'; \
	fi; \
	$(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
	  --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) \
	  --files-from=$(srcdir)/POTFILES.in \
	  --copyright-holder='$(COPYRIGHT_HOLDER)' \
	  --msgid-bugs-address="$$msgid_bugs_address"
	test ! -f $(DOMAIN).po || { \
	  if test -f $(srcdir)/$(DOMAIN).pot; then \
	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
	    if cmp $(DOMAIN).1po $(DOMAIN).2po >/dev/null 2>&1; then \
	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(DOMAIN).po; \
	    else \
	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(srcdir)/$(DOMAIN).pot && \
	      mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
	    fi; \
	  else \
	    mv $(DOMAIN).po $(srcdir)/$(DOMAIN).pot; \
	  fi; \
	}

RGui.pot-update: remove-potcdate.sed
	(cd $(top_srcdir)/src/gnuwin32; $(XGETTEXT) --default-domain=RGui \
	  --keyword= --keyword=G_ --keyword=GN_ \
	  --add-comments=TRANSLATORS: \
	  --copyright-holder='$(COPYRIGHT_HOLDER)' \
	  --msgid-bugs-address='$(MSGID_BUGS_ADDRESS)' \
	   -o - console.c dataentry.c editor.c extra.c pager.c preferences.c rui.c \
	    system.c \
	    ../extra/graphapp/clipboard.c ../extra/graphapp/dialogs.c \
	    ../extra/graphapp/gmenus.c \
	    ../extra/graphapp/metafile.c ../extra/graphapp/printer.c \
	    ../library/grDevices/src/devWindows.c) \
	  > RGui.po
	test ! -f RGui.po || { \
	  if test -f $(srcdir)/RGui.pot; then \
	    sed -f remove-potcdate.sed < $(srcdir)/RGui.pot > RGui.1po && \
	    sed -f remove-potcdate.sed < RGui.po > RGui.2po && \
	    if cmp RGui.1po RGui.2po >/dev/null 2>&1; then \
	      rm -f RGui.1po RGui.2po RGui.po; \
	    else \
	      rm -f RGui.1po RGui.2po $(srcdir)/RGui.pot && \
	      mv RGui.po $(srcdir)/RGui.pot; \
	    fi; \
	  else \
	    mv RGui.po $(srcdir)/RGui.pot; \
	  fi; \
	}

# This rule has no dependencies: we don't need to update $(DOMAIN).pot at
# every "make" invocation, only create it when it is missing.
# Only "make $(DOMAIN).pot-update" or "make update-po" will force an update.
$(srcdir)/$(DOMAIN).pot:
	$(MAKE) $(DOMAIN).pot-update

# This target rebuilds a PO file if $(DOMAIN).pot has changed.
# Note that a PO file is not touched if it doesn't need to be changed.
$(POFILES): $(srcdir)/$(DOMAIN).pot
	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
	if test -f "$(srcdir)/$${lang}.po"; then \
	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN).pot"; \
	  cd $(srcdir) && $(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN).pot; \
	else \
	  $(MAKE) $${lang}.po-create; \
	fi


install: install-exec install-data
install-exec:
install-data: install-data-yes
install-data-no:
install-data-yes:
	@$(mkinstalldirs) $(Rsharedir)
	@catalogs='$(CATALOGS)'; \
	echo "installing translations:"; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
	  dir=$(Rlocaledir)/$$lang/LC_MESSAGES; \
	  $(mkinstalldirs) $$dir; \
	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
	  $(INSTALL_DATA) $$realcat $$dir/$(DOMAIN).mo; \
	  echo "  $$lang"; \
	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
	    if test -n "$$lc"; then \
	      if (cd $(Rlocaledir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
	        link=`cd $(Rlocaledir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
	        mv $(Rlocaledir)/$$lang/$$lc $(Rlocaledir)/$$lang/$$lc.old; \
	        mkdir $(Rlocaledir)/$$lang/$$lc; \
	        (cd $(Rlocaledir)/$$lang/$$lc.old && \
	         for file in *; do \
	           if test -f $$file; then \
	             ln -s ../$$link/$$file $(Rlocaledir)/$$lang/$$lc/$$file; \
	           fi; \
	         done); \
	        rm -f $(Rlocaledir)/$$lang/$$lc.old; \
	      else \
	        if test -d $(Rlocaledir)/$$lang/$$lc; then \
	          :; \
	        else \
	          rm -f $(Rlocaledir)/$$lang/$$lc; \
	          mkdir $(Rlocaledir)/$$lang/$$lc; \
	        fi; \
	      fi; \
	      rm -f $(Rlocaledir)/$$lang/$$lc/$(DOMAIN).mo; \
	      ln -s ../LC_MESSAGES/$(DOMAIN).mo $(Rlocaledir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
	      ln $(Rlocaledir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(Rlocaledir)/$$lang/$$lc/$(DOMAIN).mo 2>/dev/null || \
	      cp -p $(Rlocaledir)/$$lang/LC_MESSAGES/$(DOMAIN).mo $(Rlocaledir)/$$lang/$$lc/$(DOMAIN).mo; \
	      echo "  $$lang"; \
	    fi; \
	  done; \
	done

install-strip: install

installdirs: installdirs-exec installdirs-data
installdirs-exec:
installdirs-data: installdirs-data-yes
installdirs-data-no:
installdirs-data-yes:
	$(mkinstalldirs) $(Rsharedir)
	@catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
	  dir=$(Rlocaledir)/$$lang/LC_MESSAGES; \
	  $(mkinstalldirs) $$dir; \
	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
	    if test -n "$$lc"; then \
	      if (cd $(Rlocaledir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
	        link=`cd $(Rlocaledir)/$$lang && LC_ALL=C ls -l -d $$lc | sed -e 's/^.* -> //'`; \
	        mv $(Rlocaledir)/$$lang/$$lc $(Rlocaledir)/$$lang/$$lc.old; \
	        mkdir $(Rlocaledir)/$$lang/$$lc; \
	        (cd $(Rlocaledir)/$$lang/$$lc.old && \
	         for file in *; do \
	           if test -f $$file; then \
	             ln -s ../$$link/$$file $(Rlocaledir)/$$lang/$$lc/$$file; \
	           fi; \
	         done); \
	        rm -f $(Rlocaledir)/$$lang/$$lc.old; \
	      else \
	        if test -d $(Rlocaledir)/$$lang/$$lc; then \
	          :; \
	        else \
	          rm -f $(Rlocaledir)/$$lang/$$lc; \
	          mkdir $(Rlocaledir)/$$lang/$$lc; \
	        fi; \
	      fi; \
	    fi; \
	  done; \
	done

# Define this as empty until I found a useful application.
installcheck:

uninstall: uninstall-exec uninstall-data
uninstall-exec:
uninstall-data: uninstall-data-yes
uninstall-data-no:
uninstall-data-yes:
	@catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
	  for lc in LC_MESSAGES $(EXTRA_LOCALE_CATEGORIES); do \
	    rm -f $(Rlocaledir)/$$lang/$$lc/$(DOMAIN).mo; \
	  done; \
	done

check: all

info dvi ps pdf html tags TAGS ctags CTAGS ID:

mostlyclean:
	@rm -f remove-potcdate.sed
	@rm -f stamp-poT
	@rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
	@rm -fr *.o

clean: mostlyclean

distclean: clean
	@rm -f Makefile Makefile.in POTFILES *.mo

maintainer-clean: distclean
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."
	rm -f stamp-po $(GMOFILES)

distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
dist distdir:
#	$(MAKE) update-po
	@$(MAKE) dist2
# This is a separate target because 'update-po' must be executed before.
dist2: # $(DISTFILES)
	@dists="$(DISTFILES)"; \
	if test -f $(srcdir)/LINGUAS; then dists="$$dists LINGUAS"; fi; \
	for file in $$dists; do \
	  if test -f $$file; then \
	    cp -p $$file $(distdir) || exit 1; \
	  else \
	    cp -p $(srcdir)/$$file $(distdir) || exit 1; \
	  fi; \
	done

update-po: Makefile
	$(MAKE) $(DOMAIN).pot-update
	test -z "$(UPDATEPOFILES)" || $(MAKE) $(UPDATEPOFILES)
	$(MAKE) update-gmo

## NB datasets does not have any po, tcltk has src but no tcltk.pot
R_PKGS_PO = base compiler grDevices graphics grid methods splines stats stats4 tcltk tools utils

update-pkg-po: Makefile remove-potcdate.sed en@quot.insert-header
	@for pkg in $(R_PKGS_PO); do \
	  $(MAKE) pkg-update PKG=$${pkg}; \
	done

R_EXE = $(top_builddir)/bin/R --vanilla

## default for 'make update-pkg-po', overridden by end users.
PKGDIR = $(top_srcdir)/src/library/$(PKG)

## use as 'make pkg-update PKG=foo PKGDIR=/path/to/foo'
pkg-update: remove-potcdate.sed en@quot.insert-header
	@pkg=$(PKG); \
	tmpdir=`pwd`; \
	src=`(cd $(PKGDIR) && pwd)`; \
	psrc=$${src}/po; \
	cdcmd="cd $${src}/po"; \
	if test -f $${src}/po/$${pkg}.pot; then \
	  echo $(ECHO_N) "updating $${pkg}.pot $(ECHO_C)"; \
	  (cd $${src}/src; $(XGETTEXT) \
	   --keyword=_ --keyword=N_ \
	   --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) \
	   --copyright-holder='$(COPYRIGHT_HOLDER)' \
	   --msgid-bugs-address='$(MSGID_BUGS_ADDRESS)' \
	   -o - `LC_COLLATE=C ls *.c`) > $${pkg}.po ; \
	    sed -f remove-potcdate.sed < $${src}/po/$${pkg}.pot > $${pkg}.1po && \
	    sed -f remove-potcdate.sed < $${pkg}.po > $${pkg}.2po && \
	    if cmp $${pkg}.1po $${pkg}.2po >/dev/null 2>&1; then \
	      rm -f $${pkg}.1po $${pkg}.2po $${pkg}.po; \
	    else \
	      rm -f $${pkg}.1po $${pkg}.2po $${src}/po/$${pkg}.pot && \
	      mv $${pkg}.po $${src}/po/$${pkg}.pot; \
	    fi; \
	  echo "and translations"; \
	  trs=`$${cdcmd} && ls *.po 2> /dev/null`; \
	  trs=`echo $${trs} | sed -e 's/R-[^.]*\.po//g' -e s/en@quot.po//`; \
	  if test -n "$${trs}"; then \
	    for tr in $${trs}; do \
	      lang=`echo $${tr} | sed -e 's/^R-//' -e 's/.po$$//'`; \
	      echo $(ECHO_N) "  $$lang:$(ECHO_C)"; \
	      ($${cdcmd} && $(MSGMERGE_UPDATE) $${tr} $${pkg}.pot); \
	      mkdir -p $${src}/inst/po/$$lang/LC_MESSAGES; \
	      ($${cdcmd} && $(MSGFMT) -c --statistics -o ../inst/po/$$lang/LC_MESSAGES/$${pkg}.mo $${tr}) ; \
	    done; \
	  fi ; \
	  lang=en@quot; \
	  echo $(ECHO_N) "  $$lang:$(ECHO_C)"; \
	  LC_ALL=C; export LC_ALL; \
	  cd $(srcdir); \
	  if $(MSGINIT) -i $${psrc}/$${pkg}.pot --no-translator -l en -o - 2>/dev/null | sed -f $$tmpdir/$$lang.insert-header | sed -e s/PACKAGE/R/ -e s/VERSION/$(VERSION)/ | $(MSGCONV) -t UTF-8 | $(MSGFILTER) sed -f $(srcdir)/quot.sed 2>/dev/null > $$tmpdir/$$lang.new.po; then \
	    if cmp $${psrc}/$$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
	      rm -f $$tmpdir/$$lang.new.po; \
	    else \
	      if mv -f $$tmpdir/$$lang.new.po $${psrc}/$$lang.po; then \
		:; \
	      else \
		echo "creation of $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
		exit 1; \
	      fi; \
	    fi; \
	    mkdir -p $${src}/inst/po/$$lang/LC_MESSAGES; \
	    ($${cdcmd} && $(MSGFMT) -c -o ../inst/po/$$lang/LC_MESSAGES/$${pkg}.mo $$lang.po) ; \
	    echo " done."; \
	  else \
	    echo "creation of $$lang.po failed!" 1>&2; \
	    rm -f $$tmpdir/$$lang.new.po; \
	  fi ; \
	fi ; \
	cd $$tmpdir; \
	if test -f "$${src}/po/R-$${pkg}.pot"; then \
	  echo $(ECHO_N) "updating R-$${pkg}.pot $(ECHO_C)"; \
        else \
	  echo $(ECHO_N) "creating R-$${pkg}.pot $(ECHO_C)"; \
	  touch "$${src}/po/R-$${pkg}.pot"; \
	fi ; \
	echo "tools::xgettext2pot('$${src}', 'R-$${pkg}.po')" \
	  | R_DEFAULT_PACKAGES= LC_COLLATE=C $(R_EXE) --slave > /dev/null; \
	sed -f remove-potcdate.sed < $${src}/po/R-$${pkg}.pot > R-$${pkg}.1po && \
	sed -f remove-potcdate.sed < R-$${pkg}.po > R-$${pkg}.2po && \
	if cmp R-$${pkg}.1po R-$${pkg}.2po >/dev/null 2>&1; then \
	  rm -f R-$${pkg}.1po R-$${pkg}.2po R-$${pkg}.po; \
	else \
	  rm -f R-$${pkg}.1po R-$${pkg}.2po $${src}/po/R-$${pkg}.pot && \
	  mv R-$${pkg}.po $${src}/po/R-$${pkg}.pot; \
	fi ; \
	echo "and translations"; \
	trs=`$${cdcmd} && ls R-*.po 2> /dev/null`; \
	trs=`echo $${trs} | sed -e s/R-en@quot.po//`; \
	if test -n "$${trs}"; then \
	  for tr in $${trs}; do \
	    lang=`echo $${tr} | sed -e 's/^R-//' -e 's/.po$$//'`; \
	    echo $(ECHO_N) "  $$lang:$(ECHO_C)"; \
	    ($${cdcmd} && $(MSGMERGE_UPDATE) $${tr} R-$${pkg}.pot); \
	    mkdir -p $${src}/inst/po/$$lang/LC_MESSAGES; \
	    ($${cdcmd} && $(MSGFMT) -c --statistics -o ../inst/po/$$lang/LC_MESSAGES/R-$${pkg}.mo $${tr}) ; \
	  done; \
	fi ; \
	lang=en@quot; \
	echo $(ECHO_N) "  $$lang:$(ECHO_C)"; \
	LC_ALL=C; export LC_ALL; \
	cd $(srcdir); \
	if $(MSGINIT) -i $${psrc}/R-$${pkg}.pot --no-translator -l en -o - 2>/dev/null | sed -f $$tmpdir/$$lang.insert-header | sed -e s/PACKAGE/R/ -e s/VERSION/$(VERSION)/ | $(MSGCONV) -t UTF-8 | $(MSGFILTER) sed -f $(srcdir)/quot.sed 2>/dev/null > $$tmpdir/R-$$lang.new.po; then \
	  if cmp $${psrc}/R-$$lang.po $$tmpdir/R-$$lang.new.po >/dev/null 2>&1; then \
	    rm -f $$tmpdir/R-$$lang.new.po; \
	  else \
	    if mv -f $$tmpdir/R-$$lang.new.po $${psrc}/R-$$lang.po; then \
	      :; \
	    else \
	      echo "creation of R-$$lang.po failed: cannot move $$tmpdir/R-$$lang.new.po to R-$$lang.po" 1>&2; \
	      exit 1; \
	    fi; \
	  fi; \
	  mkdir -p $${src}/inst/po/$$lang/LC_MESSAGES; \
	  ($${cdcmd} && $(MSGFMT) -c -o ../inst/po/$$lang/LC_MESSAGES/R-$${pkg}.mo R-$$lang.po) ; \
	  echo " done."; \
	else \
	  echo "creation of R-$$lang.po failed!" 1>&2; \
	  rm -f $$tmpdir/R-$$lang.new.po; \
	fi

# General rule for creating PO files.

.nop.po-create:
	@lang=`echo $@ | sed -e 's/\.po-create$$//'`; \
	echo "File $$lang.po does not exist. If you are a translator, you can create it through 'msginit'." 1>&2; \
	exit 1

# General rule for updating PO files.

.nop.po-update:
	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
	tmpdir=`pwd`; \
	echo "$$lang:"; \
	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
	echo "$${cdcmd}$(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
	cd $(srcdir); \
	if $(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$tmpdir/$$lang.new.po; then \
	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
	    rm -f $$tmpdir/$$lang.new.po; \
	  else \
	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
	      :; \
	    else \
	      echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
	      exit 1; \
	    fi; \
	  fi; \
	else \
	  echo "msgmerge for $$lang.po failed!" 1>&2; \
	  rm -f $$tmpdir/$$lang.new.po; \
	fi

$(DUMMYPOFILES):

update-gmo: Makefile $(GMOFILES)
	@:

Makefile: Makefile.in.in $(top_builddir)/config.status POTFILES.in LINGUAS
	@cd $(top_builddir) \
	  && CONFIG_FILES=$(subdir)/$@.in CONFIG_HEADERS= \
	       $(SHELL) ./config.status

update-RGui: Makefile remove-potcdate.sed RGui.pot-update
	@trs=`cd $(srcdir) && ls RGui-*.po 2> /dev/null`; \
	if test -n "$${trs}"; then \
	  for tr in $${trs}; do \
	    lang=`echo $${tr} | sed -e 's/^RGui-//' -e 's/\.po$$//'`; \
	    out=`echo $${tr} | sed -e 's/\.po$$/.gmo/'`; \
	    echo $(ECHO_N) "  $$lang:$(ECHO_C)"; \
	    (cd $(srcdir) && $(MSGMERGE_UPDATE) $${tr} RGui.pot); \
	    (cd $(srcdir) && $(MSGFMT) -c --statistics -o $${out} $${tr}) ; \
	  done; \
	fi




force:

# Tell versions [3.59,3.63) of GNU make not to export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
# Special -*- Makefile -*- rules for English message catalogs
# with quotation marks.

DISTFILES.common.extra1 = quot.sed boldquot.sed en@quot.header en@boldquot.header insert-header.sin Rules-quot

.SUFFIXES: .insert-header .po-update-en

en@quot.po-create:
	$(MAKE) en@quot.po-update
en@boldquot.po-create:
	$(MAKE) en@boldquot.po-update

en@quot.po-update: en@quot.po-update-en
en@boldquot.po-update: en@boldquot.po-update-en

.insert-header.po-update-en:
	@lang=`echo $@ | sed -e 's/\.po-update-en$$//'`; \
	if test "$(PACKAGE)" = "gettext"; then PATH=`pwd`/../src:$$PATH; GETTEXTLIBDIR=`cd $(top_srcdir)/src && pwd`; export GETTEXTLIBDIR; fi; \
	tmpdir=`pwd`; \
	echo "$$lang:"; \
	ll=`echo $$lang | sed -e 's/@.*//'`; \
	LC_ALL=C; export LC_ALL; \
	cd $(srcdir); \
	if $(MSGINIT) -i $(DOMAIN).pot --no-translator -l $$ll -o - 2>/dev/null | sed -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8 | $(MSGFILTER) sed -f `echo $$lang | sed -e 's/.*@//'`.sed 2>/dev/null > $$tmpdir/$$lang.new.po; then \
	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
	    rm -f $$tmpdir/$$lang.new.po; \
	  else \
	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
	      :; \
	    else \
	      echo "creation of $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
	      exit 1; \
	    fi; \
	  fi; \
	else \
	  echo "creation of $$lang.po failed!" 1>&2; \
	  rm -f $$tmpdir/$$lang.new.po; \
	fi

en@quot.insert-header: insert-header.sin
	@sed -e '/^#/d' -e 's/HEADER/en@quot.header/g' $(srcdir)/insert-header.sin > en@quot.insert-header

en@boldquot.insert-header: insert-header.sin
	@sed -e '/^#/d' -e 's/HEADER/en@boldquot.header/g' $(srcdir)/insert-header.sin > en@boldquot.insert-header

mostlyclean: mostlyclean-quot
mostlyclean-quot:
	@rm -f *.insert-header
