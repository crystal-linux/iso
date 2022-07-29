#!/usr/bin/env bash
rm -fv *.iso

if [[ "$1" == "" ]]; then
    WORKDIR=$(mktemp -d)
else
    WORKDIR="$1"
    if [[ ! -d "$WORKDIR" ]]; then
        mkdir -p "$WORKDIR"
    fi
fi

# Copy pacman config to the airootfs
cp crystal/pacman.conf crystal/.
cp crystal/packages.x86_64 crystal/.

echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp

time sudo ./mkarchiso -v -w $WORKDIR -o . crystal

sudo rm -rf $WORKDIR
sudo chown $USER:$USER *.iso
