#!/usr/bin/env bash

rm -fv *.tar.xz
cp crystal/pacman.conf crystal/airootfs/etc/.
cp chrooted-bootstrap.sh chrooted.sh

if [[ "$1" == "" ]]; then
    WORKDIR=$(mktemp -d)
else
    WORKDIR="$1"
    if [[ ! -d "$WORKDIR" ]]; then
        mkdir -p "$WORKDIR"
    fi
fi

echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp

time sudo ./mkarchiso -m bootstrap -v -w $WORKDIR -o . crystal

sudo rm -rf $WORKDIR
sudo chown $USER:$USER *.iso
