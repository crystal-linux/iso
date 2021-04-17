rm -fv pearos-live-*.iso

"""
fallocate -l800M sysroot.img
loopdev=$(sudo losetup -Pf --show sysroot.img)
sudo mkfs.ext4 ${loopdev}
sysrootwork=$(mktemp -d)
sudo mount ${loopdev} $sysrootwork
sudo pacstrap ${sysrootwork} $(cat sysrootpkgs)
sudo umount ${sysrootwork}
mv sysroot.img pear/airootfs/.
"""

WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp pear/pacman.conf pear/airootfs/etc/.
cp pear/packages.x86_64 pear/airootfs/etc/packages.x86_64
cp /etc/pacman.d/mirrorlist pear/airootfs/etc/pacman.d/.
echo "Built on $(date +"%D @ %T EST")" > pear/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . pear
sudo rm -rf $WORKDIR

if [[ "$1" == "docker" ]]; then
    cp *.iso /output/.
fi