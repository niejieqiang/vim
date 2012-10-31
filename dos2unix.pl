#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-09-30 20:33:09
use strict;
use File::Find;

find(
    sub {
        if ( -f -T ) {
            my $txt = "";
            open my $fh, "<", $_;
            while (my $line=<$fh>) {
                $line=~s/\r//g;
                $txt .= $line;
            }
            close $fh;

            open $fh, ">", $_;
            print $fh $txt;
            close $fh;
        }
    },
    "."
);
