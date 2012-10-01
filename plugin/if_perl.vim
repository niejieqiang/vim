command! FullPath let @+=expand('%:p')
"<==================================================
" Don't waste the PerlInterfaces in VIM
"<==================================================
if !exists("s:to_loaded")
	autocmd VimEnter * call Make_dir()
	silent vmap <c-j> <esc>:call Commenter()<cr>
	command -nargs=* -complete=file OpenFileExplorer call OpenFileExplorer(<q-args>)
	command -nargs=? -complete=file Ls call Ls(<q-args>)
	silent imap <c-k> <ESC>:call Del_whole_line()<cr>
	silent vmap <c-k> <ESC>:call Del_whole_line()<cr>
	silent nmap <c-k> :call Del_whole_line()<cr>

	let s:to_loaded= 1
	exe 'au FuncUndefined * source ' . expand('<sfile>')
	finish
endif
if has("perl")
function! Commenter()
	perl comment_region(); 
endfunction
perl <<EOF
sub comment_region{
	my $curbuf = $main::curbuf;
	my $file_extension = (split/\.|_/,$curbuf->Name())[-1];
	my %comment=(
		pl=>"\#",
		pm=>"\#",
		vimrc=>"\"",
		vim=>"\"",
		htm=>"\/\/",
		html=>"\/\/",
	);
	my ($success, $startline) = VIM::Eval('getpos("\'<")[1]');
	my ($success, $endline) = VIM::Eval('getpos("\'>")[1]');

	my @text= $curbuf->Get($startline..$endline);
	for my $item(@text){
		if (exists $comment{$file_extension}){
			if($item=~/^((?:(?:\s+))?$comment{$file_extension}+)+/){
				$item=~s/$1//;
			}
			else{
				$item=~s/^/$comment{$file_extension}/g ;
			}	
		}
		else{
			VIM::Msg("The comment notation has no defined for current buffer!","ErrorMsg");
			last;
		}
	}
	$curbuf->Set($startline, @text);
}
EOF
endif


"<==================================================
" del lines after press C-K like emacs
"<==================================================
if has("perl")
function! Del_whole_line()
	perl del_whole_line(); 
endfunction
perl <<EOF
sub del_whole_line{
 	my $curwin = $main::curwin;
    my $curbuf = $main::curbuf;
	my ($x,$y)=$curwin->Cursor;
	if ($y<1){
		$curbuf->Delete($x);
	}
	else{
		my $line=substr($curbuf->Get($x),0,$y);
		$curbuf->Set($x,$line);
	}
}
EOF
endif

"<==================================================
" list files 
"<==================================================
if has("perl")
function! Ls(...)
	perl ls();
endfunction
perl <<EOF
sub ls{
	my $args=VIM::Eval('a:1');
	my $current_dir=VIM::Eval('getcwd()');
	#		VIM::Msg($args);
	if(-e -d $args){
		&open_dir(\$args,"");
	}
	elsif(-e -f _ ){
		VIM::Msg($args);
	}
	else{
		&open_dir(\$current_dir,\$args);
	}
}
sub open_dir{
 	my $dir =shift ;
	my $pat= shift;
		opendir (my $fh,$$dir);
		for (readdir $fh){
			VIM::Msg($_) if /$$pat/;
		}
		close $fh;
}
EOF
endif
 
"<==================================================
"open in file explorer when in xp
"<==================================================
if has("perl")
function! OpenFileExplorer(...)
	perl open_explorer();
endfunction
perl <<EOF
sub open_explorer{
	my $curbuf = $main::curbuf;
	my $args = VIM::Eval('a:1');
	if($args eq ""){
		my $dir = VIM::Eval('expand("%:p:h")');
		\&check_sys(\$dir);
	}
	elsif($args eq "pwd"){
		my $dir = VIM::Eval('getcwd()');
		\&check_sys(\$dir);
	}
	else{
		if (-e $args){
			\&check_sys(\$args);
		}
		else{
			VIM::Msg("dir no found ,does it exists?","ErrorMsg");
		}
	}
}
sub check_sys{
	my $want_dir = shift ;
	if($^O=~/win32/i){
		system("start explorer $$want_dir");
	}
	elsif($^O=~/linux/i){
		system("pcmanfm $$want_dir");
	}
}
EOF
endif

if has("perl")
function! Make_dir()
	perl make_dir();
endfunction
perl <<EOF
sub make_dir{
	my $bakup=$ENV{'HOME'}."/bakup" ;
	mkdir $bakup if not -e _;
	$bakup=~s/ /\\ /g;
	VIM::SetOption("backup");
	VIM::SetOption("backupdir=$bakup");
}
EOF
endif
autocmd BufWritePre * let &backupext = strftime("_%Y_%m_%d_%H_%M_%S")

