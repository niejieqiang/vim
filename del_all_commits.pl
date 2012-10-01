#!perl -w 
# AUTHOR: niejieqiang
# CREATED: 2012-05-06 10:45:35
use strict;
use File::Path qw(rmtree);

my $remote_name="vim";
my $username="niejieqiang";

system("git config --global core.autocrlf false");
rmtree("\.git");
system("git init");
system("git add .");
system("git commit -m 'Initial commit'");
system("git remote add $remote_name git\@github.com:$username/$remote_name.git");
system("git push -u --force $remote_name master");
