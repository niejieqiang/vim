#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-20 17:14:47
use strict;

my $vim_rgb = "C:\\PROGRA~1\\Vim\\vim73\\rgb.txt";

#my $darkerdesert = "darkerdesert.vim";

my $hex_color;
my ( $red, $green, $blue, $en_color );

my %hex_descript;

open FH, "<", $vim_rgb;
while (<FH>) {
    chomp;
    next if /\!/;
    ( $red, $green, $blue, $en_color ) = split( /(?<=\w)\s+(?=\w)/, $_, 4 );
    $hex_color = sprintf( "#%02lx%02lx%02lx", $red, $green, $blue );
    $hex_descript{$en_color} = $hex_color;
}
close FH;

for my $colorfile ( glob "C:\\PROGRA~1\\Vim\\vimfiles\\bundle\\darkerdesert\\colors\\*" )
{
    my $text = "";
    open HEX, "<", $colorfile;
    while (<HEX>) {
        for my $key ( keys %hex_descript ) {
            s/\=\K$key(?=\s+gui|\z)/$hex_descript{$key}/g;
        }
        $text .= $_;
    }
    close HEX;

    open HEX, ">", $colorfile;
    print HEX $text;
    close HEX;
	$text="";
}

