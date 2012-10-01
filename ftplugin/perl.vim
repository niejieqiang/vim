let perl_fold_blocks=1
let perl_include_pod = 1 
let perl_extended_vars = 1
let perl_no_scope_in_variables = 1
"let perl_string_as_statement =1
if has("win32")
	set dict=$VIM/vimfiles/dict/perl.dict
else
	set dict=~/.vim/dict/perl.dict
endif
set iskeyword+=:
nmap <S-cr> :!perl % 
imap <S-cr> :!perl % 

if has("win32")
	command! Ta silent !perl C:\PROGRA~1\Vim\vim73\tools\pltags.pl *.pl
else
	command! Ta silent !perl /usr/share/Vim/vim73/tools/pltags.pl *.pl
endif
