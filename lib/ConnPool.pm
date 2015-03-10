package ConnPool;
use Mojo::Base 'Mojolicious';

# This is called once, the first time $self->app->pool is called
has pool => sub {
    my $self = shift;

    say "[DEBUG] POOLIN' UP DAWG!";

    my $conn_pool = [];

    # Plugins are loaded here so grab some values from the config file
    foreach my $i (1..$self->app->config->{pool_size}) {
        # Push onto an array. I thought I'd come up with a reason this wouldn't work but apparently not
        # Simple to test.. it works.

        # MEGA::DB object goes here
        push @$conn_pool, $i;
    }

    # Return the object
    return $conn_pool;
};

sub startup {
    my $self = shift;

    $self->plugin('Config', file => sprintf('%s/../connpool.conf', $FindBin::Bin));

    my $r = $self->routes;
    $r->get('/test')->to('main#test');
}

1;
