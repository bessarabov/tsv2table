use Test::Whitespaces {

    dirs => [
        '.github/',
        'tests/',
    ],

    files => [
        'README.md',
        'tsv2table',
    ],

    ignore => [
        qr{/tests/data/},
    ],

};
