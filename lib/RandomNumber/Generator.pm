package RandomNumber::Generator;

use warnings;
use strict;

use Math::Random qw/:all/;

# Dancer Logging
use Dancer ':syntax';

use Exporter;

our $VERSION   = '0.01';
our @ISA       = qw/Exporter/;
our @EXPORT    = ();
our @EXPORT_OK = qw/ random_number /;

=head1 NAME RandomNumber::Generator - Generates Random Numbers


=head1 SYNOPSIS


	use RandomNumber::Generator qw/random_number/;

=cut

=head1 SUBROUTINES

=cut

=head2 random_number( $min , $max);


Returns a random number in the range $min .. $max or a String
with an Error-Message if out of range (2147483561).

	my $min = -100;
	my $max = 500;
	my $random_number = random_number($min,$max);

Throws warnings and errors from Math::Random. 

=cut

sub random_number {
    my $low  = shift @_;
    my $high = shift @_;

    {
        no warnings;
        debug "Low: '$low'";
        debug "High: '$high'";
    }

    if ( $low > $high ) {

        # Swap values
        ( $low, $high ) = ( $high, $low );
        debug "Swapping High and Low";
        debug "New Low: '$low'";
        debug "New High: '$high'";
    }

    if ( $high - $low > 2147483561 ) {
        warning "Out of range '$low':'$high'";

        # Return a String
        return "Fehler: Bereich zu gross (max 2147483561)";
    }

# When called in an array context, returns an array of $n integer deviates generated
# from a uniform($low, $high)  distribution on the integers. When called in a scalar context,
# generates and returns only one such deviate as a scalar, regardless of the value of $n.
    my $n = 1;
    my $random_number = random_uniform_integer( $n, $low, $high );
    debug "Random_Number: <$random_number>";
    return $random_number;
}

1;

=head1 DEPENDENCIES

=over 4

=item Exporter 

=item Math::Random

=item Dancer

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

