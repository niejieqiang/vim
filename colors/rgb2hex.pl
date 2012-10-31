#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-20 17:14:47
use strict;
use File::Spec::Functions;

my %h;
my ( $hex_color, $red, $green, $blue, $en_color );

my $vim_rgb = catfile( $ENV{VIMRUNTIME}, "rgb.txt" );

open $fh, "<", $vim_rgb;
while (<$fh>) {
    chomp;
    next if /\!/;
    ( $red, $green, $blue, $en_color ) = split( /(?<=\w)\s+(?=\w)/, $_, 4 );
    $hex_color = sprintf( "#%02lx%02lx%02lx", $red, $green, $blue );
    $h{$en_color} = $hex_color;
}
close $fh;

for my $colorfile ( glob "*.vim" ) {
    my $text = "";
    open my $fh2, "<", $colorfile;
    while (<$fh2>) {
        for ( keys %h ) {
            s/(?<=\=)$_(?=\s+gui|\z)/$h{$_}/g;
        }
        $text .= $_;
    }
    close $fh2;

    open $fh2, ">", $colorfile;
    print $fh2 $text;
    close $fh2;
}

