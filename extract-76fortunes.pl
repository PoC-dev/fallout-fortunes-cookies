#!/usr/bin/perl -w

use strict;
use warnings;

# ----------------------------------------------------------------------------------------------------------------------------------

my ($line, $pre, $post);

foreach $line ( <STDIN> ) {
    # Find heading and text. Note: These entries are not necessarily related, but I'm too lazy to fix what ain't broken.
    if ( $line =~ /^==\[SeventySix\.esm\] (Wizard's Fortune #\d+)==$/ ) {
        $pre = $1;
    } elsif ( $line =~ /^&lt;font face='\$typewriter_font'' size='22'&gt;&lt;p align="center"&gt;(.*)&lt;\/font&gt;&lt;\/p&gt;$/ ) {
        $post = $1;
    }

    # If both are found.
    if ( defined($pre) && defined($post) ) {
        printf("%s: %s\n%%\n", $pre, $post);

        # Prepare for next loop iteration.
        undef($pre);
        undef($post);
    }
}

# ----------------------------------------------------------------------------------------------------------------------------------
# vim: tabstop=4 shiftwidth=4 autoindent colorcolumn=133 expandtab textwidth=132
# -EOF-          
