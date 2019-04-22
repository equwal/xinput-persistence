#!/usr/bin/perl
use warnings;
use strict;
open my $udev, '-|', qw(udevadm monitor);
my $xname;
my $devname;
for(@ARGV) {
    $_ = shift @ARGV;
    if($_ eq '-n') {
        $xname = shift @ARGV;
    }
    if($_ eq '-d') {
        $devname = shift @ARGV;
    }
}
while (<$udev>) {
    my ($source, $ts, $action, $dev, $sys) = split;
    print;
    if ($action eq 'add' and $dev =~ /usb/) {
        my $xlist = `xinput`;
        $xlist =~ /DeathAdder Elite\W+id=(.*?)\W+/;
        `xinput set-prop $1 153 0.114285, 0.000000, 0.000000, 0.000000, 0.114285, 0.000000, 0.000000, 0.000000, 1.000000`
    }
}
# Add this udev rule to automatically run this script when mouse is connected.
# ACTION=="add", RUN+="/usr/bin/mouseset"
# to file /etc/udev/rules.d/100-usb.rules
