
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

        if (-e $test_dir . '/cmd_and_expected_output') {
            my $cmd_and_expected_output = path($test_dir . '/cmd_and_expected_output')->slurp();
            my ($cmd, $expected_output) = split /\n/, $cmd_and_expected_output, 2;

            if ($cmd =~ /\$ (.*)/) {
                $cmd = $1;

                if ($cmd =~ /'/) {
                    die "Symbol ' can't be used in cmd ($test_dir)";
                }

                my $full_cmd = "cd $test_dir; DIR=$cwd TEST_DIR=$test_dir TSV2TABLE=$cwd/tsv2table/tsv2table sh -c '$cmd'";
                my $output = `$full_cmd`;

                if ($ENV{FIX}) {
                    path($test_dir . '/cmd_and_expected_output')->spew('$ ' . $cmd . "\n" . $output);
                    fail("Fixing cmd_and_expected_output in $dir");
                } else {
                    eq_or_diff(
                        '$ ' . $cmd . "\n" . $output,
                        '$ ' . $cmd . "\n" . $expected_output,
                        $dir,
                    );
                }
            } else {
                diag("Invalid format for cmd in $test_dir/cmd_and_expected_output Expected it to start with '\$ '");
                fail();
            }

        } else {
            fail('No file ' . $test_dir . '/cmd_and_expected_output');
        }
    }

    done_testing();
}
main();
