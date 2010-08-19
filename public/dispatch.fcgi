#!/opt/perl5.12.1/bin/perl
use Plack::Handler::FCGI;

my $app = do('/home/tf/projects/Dancer/RandomNumber/app.psgi');
my $server = Plack::Handler::FCGI->new(nproc  => 5, detach => 1);
$server->run($app);
