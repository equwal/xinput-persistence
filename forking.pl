#!/usr/bin/perl
use strict;
use warnings;
my $ps = `ps -eo pid,cmd | grep monitor\\.pl`;
if(!($ps eq '')) {
    $ps =~ /(^[0-9]+)/;
    my $pid = $1;
    print "Monitor already running at pid $pid. Try \$ ps -eo pid,cmd | grep $pid\n";
} else {
    my $pwd = $ARGV[0];
    open my $com, '<', "$pwd/commands.conf";
    for(<$com>) {
        my $f = fork();
        if (defined $f) {
            print;
            chomp;
            `$_`;
        }
    }
    while(1){;}
}
