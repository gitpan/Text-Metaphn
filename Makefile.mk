# This Makefile is for the Text::Metaphone extension to perl.
#
# It was generated automatically by MakeMaker version
# 1.95 (Revision: ) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#	ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker Parameters:

#	C => [q[metaphone_c.c my_memory.c]]
#	NAME => q[Text::Metaphone]
#	OBJECT => q[metaphone_c.o my_memory.o Metaphone.o]
#	VERSION_FROM => q[Metaphone.pm]
#	dist => { DIST_DEFAULT=>q[all tardist], COMPRESS=>q[gzip -9], SUFFIX=>q[.gz] }

# --- MakeMaker constants section:
NAME = Text::Metaphone
DISTNAME = Text-Metaphone
NAME_SYM = Text_Metaphone
VERSION = 1.95
VERSION_SYM = 1_95
XS_VERSION = 1.95
INST_LIB = ::::lib
INST_ARCHLIB = ::::lib
PERL_LIB = ::::lib
PERL_SRC = ::::
PERL = ::::miniperl
FULLPERL = ::::perl
SOURCE =  metaphone_c.c my_memory.c Metaphone.c

MODULES = Metaphone.pm


.INCLUDE : $(PERL_SRC)BuildRules.mk


# FULLEXT = Pathname for extension directory (eg DBD:Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT.
# ROOTEXT = Directory part of FULLEXT (eg DBD)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = Text:Metaphone
BASEEXT = Metaphone
ROOTEXT = Text:

# Handy lists of source code files:
XS_FILES= Metaphone.xs
C_FILES = metaphone_c.c my_memory.c
H_FILES = metachar.h \
	metaphone.h \
	my_memory.h \
	myconsts.h \
	mytypes.h


.INCLUDE : $(PERL_SRC)ext:ExtBuildRules.mk


# --- MakeMaker dlsyms section:

dynamic :: Metaphone.exp


Metaphone.exp: Makefile.PL
	$(PERL) "-I$(PERL_LIB)" -e 'use ExtUtils::Mksymlists; Mksymlists("NAME" => "Text::Metaphone", "DL_FUNCS" => {  }, "DL_VARS" => []);'


# --- MakeMaker dynamic section:

all :: dynamic

install :: do_install_dynamic

install_dynamic :: do_install_dynamic


# --- MakeMaker static section:

all :: static

install :: do_install_static

install_static :: do_install_static


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean ::
	$(RM_RF) Metaphone.c
	$(MV) Makefile.mk Makefile.mk.old


# --- MakeMaker realclean section:

# Delete temporary files (via clean) and also delete installed files
realclean purge ::  clean
	$(RM_RF) Makefile.mk Makefile.mk.old


# --- MakeMaker postamble section:

metaphone_c.o: mytypes.h myconsts.h my_memory.o metachar.h metaphone.h metaphone_c.c

my_memory.o: mytypes.h myconsts.h my_memory.c my_memory.h


# --- MakeMaker rulez section:

install install_static install_dynamic :: 
	$(PERL_SRC)PerlInstall -l $(PERL_LIB)
	$(PERL_SRC)PerlInstall -l "Bird:MacPerl Ä:site_perl:"

.INCLUDE : $(PERL_SRC)BulkBuildRules.mk


# End.
