use Test::More tests => 17;
use strict;
use warnings;

diag("Load Modules");
my @subs = qw/validate_low_high/;
use_ok( 'RandomNumber::Validator', @subs );
foreach my $sub (@subs) {
    can_ok( __PACKAGE__, $sub );
}

diag("Normal Input");
my $low     = 100;
my $high    = 200;
my $results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'),  "$low is valid" );
ok( $results->valid('high'), "$high is valid" );
ok( $results->success,       "Valid Results" );

diag("Leading signs");
$low     = '-200';
$high    = '+200';
$results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'),  "$low is valid" );
ok( $results->valid('high'), "$high is valid" );
ok( $results->success,       "Valid Results" );

diag("Missing low");
$low     = undef;
$high    = '+200';
$results = validate_low_high( { low => $low, high => $high } );
isnt( $results->valid('low'), 1, "Ok: Undefined \$low is Not valid" );
ok( $results->valid('high'), "$high is valid" );
isnt( $results->success, 1, "Ok: InValid Results" );

diag("Missing high");
$low     = 50;
$high    = undef;
$results = validate_low_high( { low => $low, high => $high } );
ok( $results->valid('low'), "$low is valid" );
isnt( $results->valid('high'), 1, "OK. Undefined \$high is Not valid" );
isnt( $results->success,       1, "Ok: InValid Results" );

diag("Missing low and high");
$low     = undef;
$high    = undef;
$results = validate_low_high( { low => $low, high => $high } );
isnt( $results->valid('low'),  1, "Ok: Undefined \$low is Not valid" );
isnt( $results->valid('high'), 1, "OK. Undefined \$high is Not valid" );
isnt( $results->success,       1, "Ok: InValid Results" );

