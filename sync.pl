#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-10-06 21:03:08
use strict;
use File::Find;
use File::Copy qw(copy);
use File::Path qw(make_path);

my $from="d:/perl/";
my $to="d:/sync/perl/";

find(\&wanted,$from);

sub wanted {
	if (-f) {
		my $old = $File::Find::name;
		my $destination= $File::Find::name;
		$destination=~s/$from/$to/;
		if (not -e $destination){
			$destination=~s/\/[^\/]*?$//;
			make_path $destination;
			copy $old,$destination;
		}
	}
}

