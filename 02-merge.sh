#!/bin/bash
set -e

cat <<EOF > luna_pinyin.sogou.dict.yaml
---
name: luna_pinyin.sogou
version: "$(date)"
sot: by_weight
use_preset_vocabulary: true
...

EOF
fd '\.txt$' rime_dicts | parallel -j 1 'cat {} >> luna_pinyin.sogou.dict.yaml'
