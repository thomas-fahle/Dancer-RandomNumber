use Test::More;

# Dancer imports use strict
eval 'use Test::Perl::Critic (-exclude => "RequireUseStrict")';

plan skip_all => 'Test::Perl::Critic required for testing PBP compliance' if $@;

plan skip_all =>
q($ENV{'do_perl_critic_tests'} must be true to run these 'development only' tests)
  if !$ENV{'do_perl_critic_tests'};

Test::Perl::Critic::all_critic_ok();

