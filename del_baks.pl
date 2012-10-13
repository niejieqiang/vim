#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-09-30 20:33:09
use strict;
use utf8;
#del baks while the number of bak files more than 15
#use diagnostics;

my %same;
for my $file ( grep { -f } glob "$ENV{HOME}\\bakup\\*" ) {
    my $prefix = ( split /_\d{4}_/, $file )[0];
    push @{ $same{$prefix} }, $file;
}

for my $orig_name ( keys %same ) {
    my @dupfiles = sort { -C $b <=> -C $a } @{ $same{$orig_name} };
	unlink splice(@dupfiles,15) if @dupfiles >15;
}

