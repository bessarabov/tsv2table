use strict;
use warnings FATAL => 'all';

use Cwd qw(cwd);
use Path::Tiny;

use Test::Differences;
use Test::More;
use Data::Dumper;

sub main {
    my $file_name = cwd() . '/README.md';
    my $content = path($file_name)->slurp();

    if ($content =~ /```\n(\$ tsv2table --help.*)```/ms) {

        my $help_in_readme = $1;

        pass('Found help section in README.md');

        my $cmd = "./tsv2table --help";
        my $output = `$cmd`;

        my $full = "\$ tsv2table --help\n$output";

        if ($ENV{FIX}) {
            fail("Fixing help section in README.md");

            $content =~ s/```\n(\$ tsv2table --help.*)```/```\n$full```/ms;
            path($file_name)->spew($content);
        } else {
            eq_or_diff(
                $full,
                $help_in_readme,
                'Ouput of tsv2table --help is the same as written in README.md'
            );
        }

    } else {
        fail('Found help section in README.md');
    }

    done_testing();

}
main();
