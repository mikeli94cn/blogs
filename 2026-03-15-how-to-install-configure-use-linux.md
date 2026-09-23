## how to install configure use linux
### install
### configure
### use
1- how to batch modify file names using a shell
to batch modify file names using a shell, you can use built-in commands like 
'mv' with loops, or specialized tools like 'rename' and 'mmv'.
#### rename
the rename command (specifically the perl-based version) uses perl-compatible
regular expressions (PCRE) to perform batch file renaming.
1. basic syntax
the standard syntax: rename [options] 's/pattern/replacement' files
- s: stands for "substitute"
- pattern: the regular expression to search for
- replacement: the new string to replace it with
- files: the list of files to process (often using wildcards like * ).
1. common regualr expression examples
- replace first occurence:
rename 's/old/new' *
- replace all occurences (global)
rename 's/old/new/g' *
- change case (transliteration):
rename 'y/A-Z/a-z/' * (convert all files to lowercase)
- add a prefix
rename 's/^/prefix_/' *
- remove an extension
rename 's/\.bak$//' *.bak

1. using capture gourps
you can "capture" parts of the original filename using parentheses () and reuse
them in the replacement using $1, $2, etc.
  - example: swap a name and a number (e.g. file123.txt to 123file.txt)
  - rename 's/([a-z]+)([0-9]+)/$2$1' *
1. important options
- dry run (-n) : highly recommended. it shows what would be renamed without
making actual changes.
rename -n 's/old/new' *
- verbose (-v): list every file that was successfully renamed.
1. troubleshooting installation
- ubuntu/debian: sudo apt install rename
- fedora/redhat: sudo dnf install prename
- arch linux: sudo pacman -S perl-rename
