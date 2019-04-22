#!/usr/bin/perl
use warnings;
use strict;
my $xname;
my $devname;
my $comm1;
my $comm2;
my $act;
while($#ARGV > 0) {
    $_ = shift @ARGV;
    if($_ eq '-n') {
        $xname = shift @ARGV;
    }
    elsif($_ eq '-d') {
        $devname = shift @ARGV;
    }
    elsif($_ eq '-c1') {
        $comm1 = shift @ARGV;
    }
    elsif($_ eq '-c2') {
        $comm2 = shift @ARGV;
    }
    elsif($_ eq '-a') {
        $act = shift @ARGV;
    } else {
        print "unexpected argument\n";
    }
}
open my $udev, '-|', qw(udevadm monitor);
while (<$udev>) {
    my ($source, $ts, $action, $dev, $sys) = split;
    if (defined($action) and ($action eq $act and ($dev =~ /usb/))) {
        my $comm = $comm1;
        if(defined $comm2){
            my $xlist = `xinput`;
            $xlist =~ /$xname\W+id=(.*?)\W+/;
            $comm = $comm1 . $1 . $comm2;
        }
        print $comm;
         `$comm`;
    }
}
