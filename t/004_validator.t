use Test::More tests => 21;
use strict;
use warnings;

my @subs = qw/validate_low_high/;
use_ok( 'RandomNumber::Validator', @subs );
foreach my $sub (@subs) {
    can_ok( __PACKAGE__, $sub );
}

my $low     = 100;
my $high    = 200;
my $results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'),  "$low is valid" );
ok( $results->valid('high'), "$high is valid" );
ok( $results->success,       "Valid Results" );

$low     = '-200';
$high    = '+200';
$results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'),  "$low is valid" );
ok( $results->valid('high'), "$high is valid" );
ok( $results->success,       "Valid Results" );

$low     = undef;
$high    = '+200';
$results = validate_low_high( { low => $low, high => $high } );
isnt( $results->valid('low'), 1, "Ok: Undefined \$low is Not valid" );
ok( $results->valid('high'), "$high is valid" );
isnt( $results->success, 1, "Ok: InValid Results" );

$low     = 50;
$high    = undef;
$results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'), "$low is valid" );
isnt( $results->valid('high'), 1, "OK. Undefined \$high is Not valid" );
isnt( $results->success,       1, "Ok: InValid Results" );

$low     = undef;
$high    = undef;
$results = validate_low_high( { low => $low, high => $high } );
isnt( $results->valid('low'),  1, "Ok: Undefined \$low is Not valid" );
isnt( $results->valid('high'), 1, "OK. Undefined \$high is Not valid" );
isnt( $results->success,       1, "Ok: InValid Results" );

$low     = 'ABC';
$high    = 'CDE';
$results = validate_low_high( { low => $low, high => $high } );
isnt( $results->valid('low'),  1, "Ok: $low is Not valid" );
isnt( $results->valid('high'), 1, "OK. $high is Not valid" );
isnt( $results->success,       1, "Ok: InValid Results" );

SKIP: {
    eval { use Test::Exception };
    skip 'Test::Exception not installed', 1 if $@;
    $low     = undef;
    $high    = undef;
    # Not a Hash-Reference
    dies_ok { $results = validate_low_high(  low => $low, high => $high  ) } 'Not a Hash Reference';
}

