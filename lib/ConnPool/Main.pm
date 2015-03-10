package ConnPool::Main;
use Mojo::Base 'Mojolicious::Controller';

my $VERSION = "0.9";

use JSON;

sub test {
    my $self = shift;

    my $dbh = $self->app->pool->[rand(100)];
    $self->render(text => $dbh);
}

1;
