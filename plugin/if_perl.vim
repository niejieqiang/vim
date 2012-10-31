"<==================================================
" Don't waste the PerlInterfaces in VIM
"<==================================================
if !exists("s:to_loaded")
	autocmd VimEnter * call MakeDirectory()
	silent vmap <c-j> <esc>:call Commenter()<cr>
	command -nargs=* -complete=file OpenFileExplorer call OpenFileExplorer(<q-args>)
	silent imap <c-k> <ESC>:call DelWholeLine()<cr>
	silent vmap <c-k> <ESC>:call DelWholeLine()<cr>
	silent nmap <c-k> :call DelWholeLine()<cr>
	command! FullPath let @+=expand('%:p')
	autocmd BufWritePre * let &backupext = strftime("_%Y_%m_%d_%H_%M_%S")

	if has("perl")
		let my_inc = system("perl -e \"print $_,\' \'for @INC\"")
		perl push @INC,(split/ /,VIM::Eval("my_inc"));
	endif 

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
	my $buf = $main::curbuf;
	my $ft = (split/\.|_/,$buf->Name())[-1];
	my %sign=(
		pl=>"\#",
		pm=>"\#",
		vimrc=>"\"",
		vim=>"\"",
		htm=>"\/\/",
		html=>"\/\/",
	);
	my ($flag, $start) = VIM::Eval('getpos("\'<")[1]');
	my ($flag, $end) = VIM::Eval('getpos("\'>")[1]');

	my @select= $buf->Get($start..$end);
	for (@select){
		if (exists $sign{$ft}){
			if(/^((?:(?:\s+))?$sign{$ft}+)+/){
				s/$1//;
			}
			else{
				s/^/$sign{$ft}/g ;
			}	
		}
		else{
			VIM::Msg("The comment notation has no defined for current buffer!","ErrorMsg");
			last;
		}
	}
	$buf->Set($start, @select);
}
EOF
endif


"<==================================================
" del lines after press C-K like emacs
"<==================================================
if has("perl")
function! DelWholeLine()
	perl del_whole_line(); 
endfunction
perl <<EOF
sub del_whole_line{
 	my $curwin = $main::curwin;
    my $buf = $main::curbuf;
	my ($x,$y)=$curwin->Cursor;
	if ($y<1){
		$buf->Delete($x);
	}
	else{
		my $line=substr($buf->Get($x),0,$y);
		$buf->Set($x,$line);
	}
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
	my $buf = $main::curbuf;
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



"<==================================================
"	auto bakup
"<==================================================
if has("perl")
function! MakeDirectory()
	perl set_bakup();
endfunction
perl <<EOF
use File::Spec::Functions;
sub set_bakup{
	my $bak = catfile($ENV{HOME},"bakup");
	mkdir $bak if not -e _;
	$bak=~s/ /\\ /g;
	VIM::SetOption("backup");
	VIM::SetOption("backupdir=$bak");
}
EOF
endif
