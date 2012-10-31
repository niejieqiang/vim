#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-07 21:01:22
use strict;
use utf8;
use File::Spec::Functions;

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

my %c = (
    ".gitconfig" => \@gitconfig,
    ".inputrc"   => \@inputrc,
    ".profile"   => \@profile,
);

# 生成.gitconfig .inputrc .profile到C:\\DOCUME~1\\nie
for ( keys %c ) {
    my $path = catfile( $ENV{HOME}, $_ );
    open my $fh, ">", $path;
    print $fh @{ $c{$_} };
    close $fh;
}

# 修改/etc/git-complete.bash

my @data = (
    "#git-completion.bash",
    "#ls displays chinese",
    "alias ls='ls --show-control-chars --color=auto' "
);

my $file = catfile( $ENV{PROGRAMFILES}, "Git", "etc", "git-completion.bash" );
print $ENV{GIT}

open my $fh, "<", $file;
my %dup = map { chomp; $_ => 1 } <$fh>;
close $fh;

open my $fh2, ">>", $file;
for (@data) {
    print $fh2 $_ . "\n" if not exists $dup{$_};
}
close $fh2;

#修改git bash中的vim编辑器
my $gvim   = catfile( $ENV{VIMRUNTIME}, "gvim.exe" );
my $git_vi = catfile( $ENV{PROGRAMFILES}, "Git", "bin",   "vim" );
open my $fh3, "<", $git_vi;
my $text = "";
while (<$fh3>) {
    s/(?<=exec ).*?(?= "\$\@)/$gvim/;
    $text .= $_;
}
close $fh3;

open $fh3, ">", $git_vi;
print $fh3 $text;
close $fh3;

