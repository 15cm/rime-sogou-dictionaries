#!/bin/bash
set -e

imewlconverter_version=2.7.0

rm -rf imewlconverter
mkdir -p imewlconverter
curl -L https://github.com/studyzy/imewlconverter/releases/download/v${imewlconverter_version}/imewlconverter_Linux_Mac.tar.gz | tar xvz -C imewlconverter
