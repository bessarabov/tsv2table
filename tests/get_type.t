
use strict;
use warnings FATAL => 'all';
use feature qw(say);

use Cwd;
use Test::More;

my $cwd = getcwd();

require "$cwd/tsv2table";

my %tests = (
    string => [
        'asdf',
        '',
        '0.0.0',
    ],
    int => [
        '1',
        '0',
        '-1',
    ],
    float => [
        '1.0',
        '0.0',
        '-1.0',
        '1.123',
    ],
);


foreach my $expected_type (sort keys %tests) {
    foreach my $value (@{$tests{$expected_type}}) {
        my ($type) = get_type($value);
        is($type, $expected_type, "'$value' should be $expected_type");
    }
}

done_testing();
