#!/bin/bash
set -e

cat <<EOF > luna_pinyin.sougou.dict.yaml
---
name: luna_pinyin.sougou
version: "$(date)"
sort: by_weight
use_preset_vocabulary: true
...

EOF
fd '\.txt$' rime_dicts | parallel -j 1 'cat {} >> luna_pinyin.sougou.dict.yaml'
