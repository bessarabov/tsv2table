use Test::Whitespaces {

    dirs => [
        '.github/',
        't/',
    ],

    files => [
        'README.md',
    ],

    ignore => [
        qr{/t/data/},
    ],

};
