puts 'Ruby env-variables\n'

print '1 	

DLN_LIBRARY_PATH

Search path for dynamically loaded modules.
2 	

HOME

Directory moved to when no argument is passed to Dir::chdir. Also used by File::expand_path to expand "~".
3 	

LOGDIR

Directory moved to when no arguments are passed to Dir::chdir and environment variable HOME isn\'t set.
4 	

PATH

Search path for executing subprocesses and searching for Ruby programs with the -S option. Separate each path with a colon (semicolon in DOS and Windows).
5 	

RUBYLIB

Search path for libraries. Separate each path with a colon (semicolon in DOS and Windows).
6 	

RUBYLIB_PREFIX

Used to modify the RUBYLIB search path by replacing prefix of library path1 with path2 using the format path1;path2 or path1path2.
7 	

RUBYOPT

Command-line options passed to Ruby interpreter. Ignored in taint mode (Where $SAFE is greater than 0).
8 	

RUBYPATH

With -S option, search path for Ruby programs. Takes precedence over PATH. Ignored in taint mode (where $SAFE is greater than 0).
9 	

RUBYSHELL

Specifies shell for spawned processes. If not set, SHELL or COMSPEC are checked.'

