use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'RandomNumber',
    AUTHOR       => q{YOUR NAME <youremail@example.com>},
    VERSION_FROM => 'lib/RandomNumber.pm',
    ABSTRACT     => 'YOUR APPLICATION ABSTRACT',
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Test::More'          => 0,
        'YAML'                => 0,
        'Dancer'              => 1.1805,
        'Math::Random'        => 0,
	    'Template'            => 0,
        'Data::FormValidator' => 0,
        'Regexp::Common'      => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'RandomNumber-*' },
);
