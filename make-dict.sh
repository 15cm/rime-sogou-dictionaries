#!/bin/bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <regexp for sogou dictionaries>
Please read the code of $0 for usage :)
The script makes a sogou dictionary in rime format for luna_pinyin by:
1. Crawl all sogou |scel| dictionaries.
2. Filter them by |fd| with the regexp parameter.
3. Merge them into a single text file."
  exit 1
fi

deps=(
  fd
  parallel
  python2
)

for dep in ${deps[@]}; do
  if ! which > /dev/null 2>&1; then
    echo "Missing dependency: ${dep}"
    exit 1
  fi
done

./00-crawl.sh
./01-filter-and-convert.sh
./02-merge.sh
