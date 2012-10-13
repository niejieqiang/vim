#!perl -lw
use strict;

# AUTHOR: niejieqiang

die "Need a file args!" if @ARGV == 0;

my $dict = "perl.dict";

open my $fh, "<", $dict;
my %h = map { $_ => 1 } <$fh>;
close $fh;

open my $fh2, "<",  $ARGV[0];
open my $fh3, ">>", $dict;
while (<$fh2>) {
    print $fh3 $_ if not exists $h{$_};
}
close $fh3;
close $fh2;
