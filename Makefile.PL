use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

eval {
	require Text::Metaphone;
};

print <<CHANGE_WARN if $Text::Metaphone::VERSION < 1.00;

NOTE:  There have been API changes between this version and any
older than version 1.00!  Also, the metaphone algorithm has been
modified.  Please read the Changes file if you are upgrading from
a version of Text::Metaphone older than 1.00.

CHANGE_WARN


print <<FIX_WARN if($Text::Metaphone::VERSION >= 1.00 && $Text::Metaphone::VERSION <= 1.94);

NOTE: Bugs fixed in this version alter the way Text::Metaphone encodes
certain words.  If you have stored metaphone encodings using your
older version of T::M, please re-encode them with this new version.
Please read the Changes file for details.

FIX_WARN


WriteMakefile(
    'NAME'	=> 'Text::Metaphone',
    'VERSION_FROM' => 'Metaphone.pm', # finds $VERSION
#    'LIBS'	=> [''],   # e.g., '-lm' 
#    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
#    'INC'	=> '',     # e.g., '-I/usr/include/other' 
    'C'         => ['metaphone_c.c my_memory.c'],
    'OBJECT'    => 'metaphone_c.o my_memory.o Metaphone.o',
    'dist'      => {COMPRESS => 'gzip -9',
		    SUFFIX   => '.gz',
                    DIST_DEFAULT => 'all tardist',
		   },
#CCFLAGS => '-Dbool=char -DHAS_BOOL -I/usr/local/include -Wall -pedantic',
#OPTIMIZE => '-g',
);

sub MY::postamble {
'
metaphone_c.o: mytypes.h myconsts.h my_memory.o metachar.h metaphone.h metaphone_c.c

my_memory.o: mytypes.h myconsts.h my_memory.c my_memory.h
'
}





