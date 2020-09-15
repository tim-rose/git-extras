MD_SRC = README.md
#
# Makefile --Build rules for "git-extras": some customisations on git
#
#
language = sh nroff markdown

SH_SRC = git-hist.sh git-new-branch.sh git-rm-branch.sh git-sync.sh \
    git-url.sh

include makeshift.mk

install:	install-all
uninstall:	uninstall-all
