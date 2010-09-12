#!/usr/bin/perl
use strict;
use warnings;

use Dancer;

get '/' => sub {
  return "Hello Frontpage!" ;
};

get '/hello/:name' => sub {
  return "Hello there " . params->{name};
};

dance;

