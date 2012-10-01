#!perl -w
use strict;
use File::Find;

find(sub{
		system("perl -pi -e 's/\r//g' $_") if -f -T;
	},".");
