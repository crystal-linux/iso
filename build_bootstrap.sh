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

if [[ -f aur-pkgs ]]; then
    if [[ ! -d repo ]]; then
        mkdir repo
        mkdir temp
        for pkg in "$(cat aur-pkgs)"; do
            pushd temp
            git clone https://aur.archlinux.org/$pkg.git
            pushd $pkg
            makepkg -sf --skippgpcheck
            cp *.pkg.tar.zst ../../repo/.
            popd
            popd
        done
        rm -rf temp/
        pushd repo
        repo-add aur.db.tar.gz *.pkg.tar.*
        MP=$(pwd)
        popd

        echo >> crystal/packages.x86_64
        for pkg in "$(cat aur-pkgs)"; do
            echo "${pkg}" >> crystal/packages.x86_64
        done

    fi

        echo "[aur]" >> crystal/pacman.conf
        echo "SigLevel = Never" >> crystal/pacman.conf
        echo "Server = file://${MP}" >> crystal/pacman.conf

fi

# idk if this would've happened automatically?
cp crystal/pacman.conf crystal/airootfs/etc/.
cp crystal/packages.x86_64 crystal/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist crystal/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp
cp chrooted-bootstrp.sh chrooted.sh
time sudo ./mkarchiso -m bootstrap -v -w $WORKDIR -o . crystal
sudo rm -rf $WORKDIR
sudo chown $USER:$USER *.iso
