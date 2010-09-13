#!perl 
use strict;
use warnings;
use Test::More;

BEGIN {
    eval { use Test::Script; };
    if ( $@ ) {
        plan( skip_all => "Install Test::Script to enable these tests");
    }

}

plan( tests => 1 );

script_compiles( 'RandomNumber.pl', 'Main script compiles' );




