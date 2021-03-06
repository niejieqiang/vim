﻿#!/usr/bin/perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-04-10 07:31:43
use strict;
use File::Path;
use File::Copy qw(copy);

my $remote_name="vim";
my $email="niejieqiang\@qq.com";
my $username = "niejieqiang";
my $vimrc = "../.vimrc" ;

copy $vimrc,"./" if -e _;

system("git config --global user.name '$username'");
system("git config --global user.email '$email'");
system("git commit --amend --reset-author");

# add files to repo
system("git add .");

# del files in repo permanent
for (`git checkout`) {
	if (/^M\s+|^A\s+/) {
		 s/^M\s+/git add /g; 
		 s/^A\s+/git add /g;
		system $_;
	}
	else{
		s/^D\s+/git rm -r /g;
		system $_;
		my $del_name=(split/\s+/)[1];
		system( "git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch $del_name' --prune-empty --all  HEAD");
	}
}

system("git commit -m r");

system("git remote add $remote_name git\@github.com:$username/$remote_name.git");
system("git push -u $remote_name master --force");
rmtree(" .git/refs/original/");
system("git reflog expire --expire=now --all");
system("git gc --aggressive --prune=now");

