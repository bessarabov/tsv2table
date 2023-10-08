# tsv2table

```
$ tsv2table --help

## Usage

    cat file.tsv | tsv2table [options]

Converts tsv data into a human-readable table.

## Options

    --header=<auto|on|off>   Specify if there is a header row in the input file.
                             Optional. Default is "auto"
    --separator=<value>      Specify the separator character (or characters).
                             Optional. Default is "\t"

    --help                   Display this help message.

## --header=auto

When the `--header=auto` option is specified, a simple heuristic is applied to
detect the presence of a header. This detection is made by examining the
first and the second rows of data. If the first row contains only
string values, and the second row contains non-string values,
then it is considered that the data has a header.

## Project Repository

https://github.com/bessarabov/tsv2table

```
