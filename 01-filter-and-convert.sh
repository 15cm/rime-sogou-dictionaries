#!/bin/bash
set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <regexp for sogou dictionaries>"
  exit 1
fi

mkdir -p rime_dicts
fd "$1" ./ThesaurusSpider/SougouThesaurusSpider/sogou_dicts_chinese | parallel '[ ! -f ./rime_dict/{/.}.yaml ] && ./imewlconverter/ImeWlConverterCmd -os:linux -i:scel {} -o:rime ./rime_dicts/{/.}.txt'
