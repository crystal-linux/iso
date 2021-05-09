rm -fv *.iso

prof="crystal"

if [[ "$1" == "" ]]; then
    printf "cli/gui : "
    read MODE
else
    MODE="$1"
fi

if [[ "$MODE" == "cli" ]]; then
    sed -i 's/gnome/#gnome/g' ${prof}/packages.x86_64
    sed -i 's/mesa/#mesa/g' ${prof}/packages.x86_64
else
    sed -i 's/DISABLED/ENABLED/g' chrooted.sh
fi

WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp ${prof}/pacman.conf ${prof}/airootfs/etc/.
cp ${prof}/packages.x86_64 ${prof}/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist ${prof}/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > ${prof}/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . ${prof}
sudo rm -rf $WORKDIR

if [[ "$MODE" == "cli" ]]; then
    sed -i 's/#gnome/gnome/g' ${prof}/packages.x86_64
    sed -i 's/#mesa/mesa/g' ${prof}/packages.x86_64
else
    sed -i 's/ENABLED/DISABLED/g' chrooted.sh
fi