#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-08 07:10:46
use strict;
use File::Find;

# stored file path to %h while find perl files
my %h;
find( sub { $h{$File::Find::name} = 1 if /\.pl/ and -f; }, "." );

# skip if the file has already add copyright
for ( keys %h ) {
    open my $fh, "<", $_;
    while ( my $line = <$fh> ) {
        delete $h{$_} if $line =~ /^# AUTHOR/;
    }
	close $fh;
}

# add copyright after #! line.
my $copyright = "# AUTHOR : niejieqiang\n# CREATED: ";
for my $file ( keys %h ) {
	my $text      = "";
    open my $fh2, "<", $file;
    my $ctime = &get_ctime( \$file );
    while (<$fh2>) {
        if (/^\#\!/) {
            $_ .= $copyright . $ctime;
        }
        $text .= $_;
    }
    close $fh2;

    open $fh2, ">", $file;
    print $fh2 $text;
    close $fh2;
}

# get file created time 
sub get_ctime {
    my $file     = shift;
    my $ctime    = ( stat $$file )[10];
    my @date     = localtime $ctime;
    my $formater = "%u-%02u-%02u %02u:%02u:%02u\n";
    return sprintf $formater,
      $date[5] + 1900, $date[4] + 1, @date[ 3, 2, 1, 0 ];
}
