use Test::Whitespaces {

    dirs => [
        '.github/',
        't/',
    ],

    files => [
        'README.md',
        'tsv2table',
    ],

    ignore => [
        qr{/t/data/},
    ],

};
