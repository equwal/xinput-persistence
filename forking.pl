#!/usr/bin/perl
use strict;
use warnings;
my $ps = `ps -e | grep monitor\\.pl`;
if(!($ps eq '')) {
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
