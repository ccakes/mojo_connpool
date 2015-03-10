package ConnPool::Main;
use Mojo::Base 'Mojolicious::Controller';

sub test {
    my $self = shift;

    my $dbh = $self->app->pool->[rand(100)];
    $self->render(text => $dbh);
}

1;
