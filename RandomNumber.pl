#!/usr/bin/perl
use warnings;
use strict;
use Dancer;
load_app 'RandomNumber';
dance;
# Added use strict and warnings to make 
# PerlCritic happy.
# strict and warnings are enabled by Dancer automatically
