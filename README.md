# uk_sponsors.sh

A dirt simple bash script for printing the list of companies licensed to sponsor
Tier 2 and Tier 5 Visas.

## Usage

```
./uk_sponsors.sh
```

Prints the list of sponsors. Use other unix tools to filter the output, eg `grep`.

## Docker Usage

```
docker run wamilton/uk_sponsors.sh
```

If you want to speed things up, consider sharing a volume into /tmp so that the
pdf doesn't have to be downloaded each time.

## Details

Uses `wget`, `xidel` and `pdftohtml` to grab the regularly updated pdf linked
from [here][1] and pull out the left column of the messy table and print it.

A nicer implementation could do more work to transform the table into
a non-messy table and print decent column output, and perhaps store things in
sqlite or similar with a list of their pdf publication dates. I am not using
this tool to find companies to which to apply, but to decide whether to apply to
a company I'm already considering, so I really just need to know whether a given
company is on the list.

[1]:
https://www.gov.uk/government/publications/register-of-licensed-sponsors-workers
"UK Register of Licensed Sponsors"
