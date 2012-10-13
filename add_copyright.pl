#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-08 07:10:46
use strict;
use File::Find;

my $copyright = "# AUTHOR : niejieqiang\n# CREATED: ";
my $file_regex = qr/\.pl/;
my $skip_if = qr/^# AUTHOR/;

# sotred file path to %h while find perl files
my %h;
find( sub { $h{$File::Find::name} = 1 if /$file_regex/ and -f; }, "." );

# skip if the file has already commented
for ( keys %h ) {
    open my $fh, "<", $_;
    while ( my $line = <$fh> ) {
        delete $h{$_} if $line =~ /$skip_if/;
    }
	close $fh;
}

# add comments after #! line.
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
