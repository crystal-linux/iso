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

if [[ "$2" == "testing" ]]; then
    cp pacman.testing crystal/pacman.conf
else
    cp pacman.def crystal/pacman.conf
fi

# idk if this would've happened automatically?
cp crystal/pacman.conf crystal/airootfs/etc/.
cp crystal/packages.x86_64 crystal/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist crystal/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . crystal
sudo rm -rf $WORKDIR
sudo chown $USER:$USER *.iso