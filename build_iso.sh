rm -fv *.iso

if [[ "$1" == "" ]]; then
    printf "Profile: "
    read prof
else
    prof=$1
fi

WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp ${prof}/pacman.conf ${prof}/airootfs/etc/.
cp ${prof}/packages.x86_64 ${prof}/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist ${prof}/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > ${prof}/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . ${prof}
sudo rm -rf $WORKDIR