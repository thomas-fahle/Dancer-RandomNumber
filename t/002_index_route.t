use Test::More tests => 4;
use strict;
use warnings;

# the order is important
use RandomNumber;
use Dancer::Test;

diag("Dancer Routing");
route_exists [ GET  => '/' ], '(GET) a route handler is defined for /';
route_exists [ POST => '/' ], '(POST) a route handler is defined for /';

diag("Dancer Status");
response_status_is [ 'GET' => '/' ], 200, 'response status is 200 for /';

diag("Dancer Content");
response_content_like [ GET => '/' ], qr/Random\s+Number\s+Generator/s,
  'content looks OK for /';
