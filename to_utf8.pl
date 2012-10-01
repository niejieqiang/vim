#!perl -w
use strict;
use utf8;
use File::Find;

find(sub{
		system("piconv -f cp936 -t utf8 $_ >utf8_$_") if -f -T;
	},".");
