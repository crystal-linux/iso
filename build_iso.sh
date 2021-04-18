rm -fv crystal-live-*.iso


WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp crystal/pacman.conf crystal/airootfs/etc/.
cp crystal/packages.x86_64 crystal/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist crystal/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > crystal/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . crystal
sudo rm -rf $WORKDIR

if [[ "$1" == "docker" ]]; then
    cp *.iso /output/.
fi