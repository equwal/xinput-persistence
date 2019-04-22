#/usr/bin/perl
use strict;
use warnings;
open my $com, '<', 'commands.conf';
for(<$com>) {
    my $f = fork();
    if (defined $f) {
        print;
        `$_`;
    }
}
