#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-09-30 20:33:10
use strict;
use utf8;
use File::Find;

find(sub{
		system("piconv -f cp936 -t utf8 $_ >utf8_$_") if -f -T;
	},".");
