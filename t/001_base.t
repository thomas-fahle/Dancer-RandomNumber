use Test::More tests => 8;
use strict;
use warnings;

diag("Load Modules");
use_ok 'Data::FormValidator';
use_ok 'Regexp::Common';
use_ok 'Math::Random';

use_ok 'RandomNumber';

my @subs = qw/random_number /;
use_ok 'RandomNumber::Generator', @subs;
foreach my $sub (@subs) {
    can_ok( __PACKAGE__, $sub );
}

@subs = qw/validate_low_high/;
use_ok 'RandomNumber::Validator', @subs;
foreach my $sub (@subs) {
    can_ok( __PACKAGE__, $sub );
}

