#!perl -w
# AUTHOR : niejieqiang
# CREATED: 2012-09-30 20:33:09
use strict;
use File::Find;

find(sub{
		system("perl -pi -e 's/\r//g' $_") if -f -T;
	},".");
