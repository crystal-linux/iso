#!/bin/bash

if [[ "$1" == "" ]]; then
    printf "Filename: "
    read FN
else
    FN="$1"
fi

scp $FN crystalux@salyut.one:public_html/isos/.
#ssh crystalux@salyut.one "ln -sf public_html/isos/$FN public_html/isos/latest"