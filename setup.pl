#!perl -lw
# AUTHOR: niejieqiang
# CREATED: 2012-05-04 20:18:50
# copy dlls to each correct dir if xp
# copy fonts  to fonts dir if unix
use strict;
use File::Copy qw(copy);
use File::Path;

if ( $^O =~ /win32/i ) {
	for my $dll(glob"dlls/*"){
		copy $dll, $ENV{'VIMRUNTIME'};
	}
}
else {
    my $font      = "fonts/Courier\ New.ttf";
    my $fonts_dir = "~/.fonts/";
    copy( $font, $fonts_dir ) ;
    system("sudo fc-cache -fv");
}
