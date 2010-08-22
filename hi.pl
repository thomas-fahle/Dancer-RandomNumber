#!/opt/perl5.12.1/bin/perl

use Dancer;

get '/' => sub {
  return "Hello Frontpage!" ;
};

get '/hello/:name' => sub {
  return "Hello there " . params->{name};
};

dance;

