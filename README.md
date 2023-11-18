# tsv2table

`tsv2table` is a small command-line tool that convert data in TSV format to human-readable table.

## Example

Raw output of TSV (Tab-Separated Values) data:

```
$ cat objects.tsv
Name    Diameter (km)   Mass (10^24 kg) Orbital Period (days)
Sun     1392684 1989100
Mercury 4880    0.330   88
Venus   12104   4.87    225
Earth   12742   5.97    365.25
Mars    6779    0.642   687
Ceres   939     0.939   1682
Jupiter 139820  1898    4333
Saturn  116460  568.3   10747
Uranus  50724   86.8    30589
Neptune 49244   102.0   59800
Pluto   2377    0.0146  90560
Makemake        1430            111845
Haumea  1960            103658
Eris    2326    0.167   204536
```

The same data formatted with `tsv2table`:

```
$ cat objects.tsv | tsv2table
Name     | Diameter (km) | Mass (10^24 kg) | Orbital Period (days)
------------------------------------------------------------------
Sun      |       1392684 |    1989100      |
Mercury  |          4880 |          0.330  |                 88
Venus    |         12104 |          4.87   |                225
Earth    |         12742 |          5.97   |                365.25
Mars     |          6779 |          0.642  |                687
Ceres    |           939 |          0.939  |               1682
Jupiter  |        139820 |       1898      |               4333
Saturn   |        116460 |        568.3    |              10747
Uranus   |         50724 |         86.8    |              30589
Neptune  |         49244 |        102.0    |              59800
Pluto    |          2377 |          0.0146 |              90560
Makemake |          1430 |                 |             111845
Haumea   |          1960 |                 |             103658
Eris     |          2326 |          0.167  |             204536
```

## Features

 * Data Alignment: Automatically aligns data for clear readability and presentation
 * Header Presence Detection: Intelligently detects the presence of headers in input data, enhancing table organization
 * Custom Separator: Allows users to specify the separator character(s) for parsing data, providing flexibility in handling diverse file formats

## Installation

 * Download latest `tsv2table` from [Releases](https://github.com/bessarabov/tsv2table/releases)
 * Make it executable

```
curl -L https://github.com/bessarabov/tsv2table/releases/latest/download/tsv2table -o tsv2table
chmod +x tsv2table
```

## `--help`

```
$ tsv2table --help

## Usage

    cat file.tsv | tsv2table [options]

Converts TSV data into a human-readable table.

## Options

    --header=<auto|on|off>   Specify if there is a header row in the input file.
                             Optional. Default is "auto"
    --separator=<value>      Specify the separator character (or characters).
                             Optional. Default is "\t"

    --version                Display info about version.
    --help                   Display this help message.

## --header=auto

When the `--header=auto` option is specified, a simple heuristic is applied to
detect the presence of a header. This detection is made by examining the
first and the second rows of data. If the first row contains only
string values, and the second row contains non-string values,
then it is considered that the data has a header.

## Version

dev

## Project Repository

https://github.com/bessarabov/tsv2table

```
