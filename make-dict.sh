#!/bin/bash
set -e

deps=(
  fd
  parallel
  python2
  dotnet
)

for dep in ${deps[@]}; do
  if ! which $dep > /dev/null 2>&1; then
    echo "Missing dependency: ${dep}"
    exit 1
  fi
done

if [ $# -ne 1 ]; then
  echo "Usage: $0 <regexp for sogou dictionaries>
Recommend executing '\d\d.*sh' separately. Please read the code of $0 for details.
The script makes a sogou dictionary in rime format for luna_pinyin by:
1. Crawl all sogou |scel| dictionaries.
2. Filter them by |fd| with the regexp parameter.
3. Merge them into a single text file."
  exit 1
fi

./00-crawl.sh
./01-filter-and-convert.sh
./02-merge.sh
