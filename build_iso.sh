rm -fv crystal-live-*.iso


WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp pear/pacman.conf pear/airootfs/etc/.
cp pear/packages.x86_64 pear/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist pear/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > pear/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . crystal
sudo rm -rf $WORKDIR

if [[ "$1" == "docker" ]]; then
    cp *.iso /output/.
fi