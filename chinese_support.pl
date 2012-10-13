#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-07 21:01:22
use strict;
use utf8;
use open ":encoding(gbk)", ":std";

my @gitconfig = <<GIT_CONFIG;
#.gitconfig
[core]
    pager = less -q
[gui]
     encoding = utf-8
[i18n]
     commitencoding = utf-8
[svn]
     pathnameencoding = utf-8
GIT_CONFIG

my @inputrc = <<INPUTRC;
#使得能输入中文		 
#inputrc
set output-meta on set convert-meta off
#turn bell off
set bell-style none
INPUTRC

my @profile = <<PROFILE ;
export LESSCHARSET=iso8859
PROFILE

my %content = (
	"\\.gitconfig"=>\@gitconfig,
	"\\.inputrc"=>\@inputrc,
	"\\.profile"=>\@profile,
);

# 生成.gitconfig .inputrc .profile到C:\\DOCUME~1\\nie
for my $cfg (keys %content) {
    open my $fh, ">", $ENV{'HOMEPATH'}.$cfg;
	print $fh @{$content{$cfg}};
}
#close $fh;

# 修改/etc/git-complete.bash
my @insert =<<GIT_COMPLETE ;
#git-completion.bash
#ls displays chinese
alias ls='ls --show-control-chars --color=auto' 
GIT_COMPLETE

my $to_modified =$ENV{'PROGRAMFILES'} . "\\Git\\etc\\git-completion.bash"; 
open my $git_bash, "<", $to_modified;
my %check_dup= map{$_,1}<$git_bash>;
close $git_bash;

open $git_bash, ">>", $to_modified;
for (@insert) {
    print $git_bash $_ if !$check_dup{$_};
}
close $git_bash;

#修改git bash中的vim编辑器
my $gvim_path = qq{C:\\\\PROGRA~1\\\\Vim\\\\vim73\\\\gvim.exe };
my $git_vi=qq{C:\\PROGRA~1\\Git\\bin\\vim};

open my $vim,"<",$git_vi;
my $text="";
while (<$vim>) {
	s/exec \K.*(?= "\$\@)/$gvim_path/g if /vi/;
	$text.=$_;
}
close $vim;

open $vim,">",$git_vi;
print $vim $text;
close $vim;
