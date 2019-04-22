#!/usr/bin/perl
use strict;
use warnings;

`cp monitor.pl /usr/bin/monitor.pl`;
`cp forking.pl /usr/bin/forking.pl`;
open my $monitor, '>', 'monitor';
my $pwd = `pwd`;
print $monitor "#!/bin/bash\nforking.pl $pwd\n";
`cp monitor /usr/bin/monitor`;
