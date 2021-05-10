#!/bin/bash

echo "Script has control"
cd /crystal
pacman -Scc --noconfirm
pacman -Sy --noconfirm
pacman -S --noconfirm pacman-contrib git archiso openssh
ls
echo "Building"
./build_iso.sh
