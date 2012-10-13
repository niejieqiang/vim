#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-20 17:14:47
use strict;

my $vim_rgb = "C:\\PROGRA~1\\Vim\\vim73\\rgb.txt";

#my $darkerdesert = "darkerdesert.vim";
my $vim_colors="C:\\PROGRA~1\\Vim\\vimfiles\\bundle\\darkerdesert\\colors\\*" ;
my $hex_color;
my ( $red, $green, $blue, $en_color );
my %h;

open $fh, "<", $vim_rgb;
while (<$fh>) {
    chomp;
    next if /\!/;
    ( $red, $green, $blue, $en_color ) = split( /(?<=\w)\s+(?=\w)/, $_, 4 );
    $hex_color = sprintf( "#%02lx%02lx%02lx", $red, $green, $blue );
    $h{$en_color} = $hex_color;
}
close $fh;

for my $colorfile ( glob $vim_colors) {
    my $text = "";
    open my $fh2, "<", $colorfile;
    while (<$fh2>) {
        for my $key ( keys %h ) {
            s/(?<=\=)$key(?=\s+gui|\z)/$h{$key}/g;
        }
        $text .= $_;
    }
    close $fh2;

    open $fh2, ">", $colorfile;
    print $fh2 $text;
    close $fh2;
}

