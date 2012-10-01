#!perl -w
# AUTHOR: niejieqiang
# CREATED: 2012-05-08 07:10:46
# usage: perl add_copyright.pl $dir $min_depth $max_depth
use strict;
use utf8;
use File::Find;

my $error="need 3 args: [dir] [min_depth] [max_depth]\n" ;
die $error if @ARGV!=3;

my ( $min_depth, $max_depth ) = ( $ARGV[1],$ARGV[3] );
my %set = (
    preprocess => \&preprocess,
    wanted     => \&wanted,
    no_chdir   => 1
);
find( \%set,$ARGV[0] );

my %hash;
my @pl_files;
$hash{$_}=1 for @pl_files;
for my $item (@pl_files) {
	open IN,"<",$item;
	while (<IN>) {
		delete $hash{$item} if /^# AUTHOR\K/;
	}
}
close IN;

@pl_files=keys %hash;

my $copyright = "# AUTHOR : niejieqiang\n# CREATED: ";
my $text="";

for my $file (@pl_files) {
    open FH, "<", $file;
    my $ctime = &get_ctime( \$file );
    while (<FH>) {
        if (/^\#\!/) {
            $_ .= $copyright . $ctime;
        }
        $text .= $_;
    }
	close FH;

	open FH, ">", $file;
	print FH $text;
	close FH;
	$text="";
}

sub preprocess {
    my $depth = $_ =~ tr/\///;
    return @_ if $depth < $max_depth;
    return grep { not -d } @_ if ( $depth == $max_depth );
    return;
}

sub wanted {
    my $depth = $_ =~ tr/\///;
    return if $depth < $min_depth;
    push @pl_files, $_ if /\.pl$/;
}

sub get_ctime {
	my $file=shift ;
    my $ctime    = ( stat $$file )[10];
    my @date     = localtime $ctime;
    my $formater = "%u-%02u-%02u %02u:%02u:%02u\n";
    return sprintf $formater,
      $date[5] + 1900, $date[4] + 1, @date[3, 2, 1, 0];
}
