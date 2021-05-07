#!/bin/bash
# This file is run via mkarchiso while chrooted as the new system
echo "We're in the new system. :)"
echo "Performing minor tweaks"
sed -i 's/Arch Linux/CrystalUX/g' /etc/issue
sed -i 's/Arch Linux/CrystalUX/g' /etc/arch-release
sed -i 's/Arch Linux/CrystalUX/g' /etc/os-release
sed -i 's/Arch Linux/CrystalUX/g' /usr/lib/os-release
echo "CrystalLive" > /etc/hostname
#reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
echo "sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist" >> /usr/bin/mirrorsetup
chmod +x /usr/bin/mirrorsetup
# We don't add crystal until here so that our packages which change
# /etc/skel have been installed already
/usr/bin/useradd -m crystal
/usr/bin/usermod -p $(echo "crystal" | openssl passwd -6 -stdin) crystal
/usr/bin/usermod -p $(echo "crystal" | openssl passwd -6 -stdin) root
/usr/bin/chmod +x /home/crystal/.xinitrc
echo "menu" >> /home/crystal/.bashrc
chmod +x /etc/crystal/bootopts/*
systemctl enable gdm
sed -i 's/#en_US.UTF\-8 UTF\-8/#en_US.UTF\-8 UTF\-8/g' /etc/locale-gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Configured the system user. Exiting chroot."