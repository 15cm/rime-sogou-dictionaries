#!/bin/bash
set -e

fd '\.txt$' rime_dicts | parallel -j 1 'cat {} >> tmp-luna_pinyin.sogou.dict.yaml'
cat <<EOF > luna_pinyin.sogou.dict.yaml
---
name: luna_pinyin.sogou
version: "$(date)"
sort: by_weight
use_preset_vocabulary: true
...

EOF
sort tmp-luna_pinyin.sogou.dict.yaml | uniq >> luna_pinyin.sogou.dict.yaml
rm tmp-luna_pinyin.sogou.dict.yaml
