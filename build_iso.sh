#!/usr/bin/env bash

rm -fv *.iso
cp crystal/pacman.conf crystal/airootfs/etc/.

if [[ "$1" == "" ]]; then
    WORKDIR=$(mktemp -d)
else
    WORKDIR="$1"
    if [[ ! -d "$WORKDIR" ]]; then
        mkdir -p "$WORKDIR"
    fi
fi

echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp

time sudo ./mkarchiso -v -w $WORKDIR -o . crystal

sudo rm -rf $WORKDIR
sudo chown $USER:$USER *.iso
