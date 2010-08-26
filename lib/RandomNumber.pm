package RandomNumber;
use strict;
use warnings;

use Dancer ':syntax';

use RandomNumber::Generator qw/random_number/;
use RandomNumber::Validator qw/validate_low_high/;

our $VERSION = '0.1';

=head1 NAME RandomNumber - Dancer WebApp


=head1 SYNOPSIS


        use RandomNumber::Validator qw/validate_low_high/;

=cut

=head1 SUBROUTINES

Our subroutines are route handlers.

=cut

=head2 get /

handles get requests to the frontpage (/)

=cut


get '/' => sub {
    template 'index';
};

=head2 post /

handles post requests to the frontpage (/)

=cut

post '/' => sub {
    my $high = params->{high};
    my $low  = params->{low};

    my $results = validate_low_high( { low => $low , high => $high } );

    my $missing_low  = not defined( $results->valid('low') );
    my $missing_high = not defined( $results->valid('high') );

    my $random = undef;

    if ( $results->success() ) {
        $random = random_number( $low, $high );
    }

    template 'index',
      {
        random       => $random,
        low          => $low,
        high         => $high,
        missing_low  => $missing_low,
        missing_high => $missing_high,
      };
};

true;

__END__

=head1 DEPENDENCIES

=over 4

=item Dancer

=item Template

=item Math::Random

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
