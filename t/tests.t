
use strict;
use warnings FATAL => 'all';

use Cwd qw(cwd);
use Path::Tiny;

use Test::Differences;
use Test::More;

sub main {

    my $cwd = cwd();

    foreach my $dir (glob 't/data/*') {
        my $test_dir = $cwd . '/' . $dir;

        my $output = `cd $test_dir; DIR=$cwd TEST_DIR=$test_dir TSV2TABLE=$cwd/tsv2table/tsv2table sh ./cmd`;

        if ($ENV{FIX}) {
            path($test_dir . '/expected_output')->spew($output);
            fail("Fixing expected_output for $dir");
        } else {
            my $expected_output = path($test_dir . '/expected_output')->slurp();
            eq_or_diff(
                $output,
                $expected_output,
                $dir,
            );
        }
    }

    done_testing();
}
main();
