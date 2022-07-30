#!/bin/bash

echo "inject.sh started."

echo "Chrooting to $1, and running chrooted.sh"
cp chrooted.sh ${1}/.
cp crystal/pacman.conf ${1}/.
chmod +x ${1}/chrooted.sh
arch-chroot $1 /bin/bash -c ./chrooted.sh
rm ${1}/chrooted.sh

echo "inject.sh completed."
