package RandomNumber::Validator;

use warnings;
use strict;

# Dancer Logging
use Dancer ':syntax';

use Regexp::Common qw /number/;
use Data::FormValidator;

use Exporter;

our $VERSION   = '0.01';
our @ISA       = qw/Exporter/;
our @EXPORT    = ();
our @EXPORT_OK = qw/ validate_low_high /;

=head1 NAME RandomNumber::Validator - Validates User Input


=head1 SYNOPSIS


	use RandomNumber::Validator qw/validate_low_high/;

=cut

=head1 SUBROUTINES

=cut

=head2 validate_low_high( { low => $low , high => $high } );

 my $results = validate_low_high( { low => $low , high => $high } );

Returns a L<Data::FormValidator::Results> Object.

    if ( $results->success ) {
    	# All Params validated
	# Go ahead
    } else {
	# 
    }

Right from perldoc L<Data::FormValidator::Results>:

    # Print valid fields
    for my $f ( $results->valid() ) {
        print $f, " =  ", $results->valid( $f ), "\n";
    }


    # Print the name of missing fields
    if ( $results->has_missing ) {
    	for my $f ( $results->missing ) {
        	print $f, " is missing\n";
    	}
    }

    # Print the name of invalid fields
    if ( $results->has_invalid ) {
    	for my $f ( $results->invalid ) {
        	print $f, " is invalid: ", $results->invalid( $f ), "\n";
    	}
    }

    # Print unknown fields
    if ( $results->has_unknown ) {
    	for my $f ( $results->unknown ) {
        	print $f, " is unknown\n";
    	}
    }

=cut

sub validate_low_high {
    my $args = shift @_;
    die "Not a Hash Reference '$args'" unless ref($args) eq 'HASH';

    my $low  = $args->{low};
    my $high = $args->{high};

    {
        no warnings;    # args/values might be undefined
        debug "Low: '$low'. High: '$high'.";
    }

    my $profile = {
        filters     => ['trim'],
        required    => [qw( low high )],
        constraints => {
            low  => qr/^$RE{num}{int}$/,
            high => qr/^$RE{num}{int}$/,
        },
    };

    my $results =
      Data::FormValidator->check( { low => $low, high => $high }, $profile );

    for my $f ( $results->valid() ) {
        debug("Valid: $f");
    }
    for my $f ( $results->invalid() ) {
        debug("Invalid: $f");
    }

    return $results;
}

1;

=head1 DEPENDENCIES

=over 4

=item Exporter 

=item Dancer

=item Regexp::Common

=item Data::FormValidator

=back

=head1 BUGS AND LIMITATIONS

Please report problems to Thomas Fahle (cpan at thomas-fahle.de)

Patches are welcome.

=head1 AUTHOR

Thomas Fahle (cpan at thomas-fahle.de)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2010 Thomas Fahle (cpan at thomas-fahle.de)
All rights reserved.


This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See L<perlartistic>.  This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut

