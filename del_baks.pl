#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-09-30 20:33:09
#del baks while the number of bak files more than 10
#use diagnostics;
use strict;
use File::Spec;
use Benchmark qw(timethese);

my $limit = 10;
my %same;
my $bak_dir= File::Spec->catfile($ENV{HOME},"bakup");

for ( grep { -f } glob $ENV{HOME}."/bakup") {
	print;
}

#chdir $bak_dir;
#for ( grep { -f } glob "*") {
#    my $prefix = ( split /_\d{4}_/)[0];
#    push @{ $same{$prefix} }, $_;
#}
#
#for ( keys %same ) {
#    my @dupfiles = sort { -C $b <=> -C $a } @{ $same{$_} };
#	unlink splice(@dupfiles,$limit) if @dupfiles >$limit;
#}
#
