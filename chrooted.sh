#!/bin/bash

# This file is run via mkarchiso while chrooted as the new system
echo "chrooted in the new system, running as $(whoami)"

echo "CrystalLive" > /etc/hostname
#reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
echo "sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist" >> /usr/bin/mirrorsetup
chmod +x /usr/bin/mirrorsetup
# We don't add crystal until here so that our packages which change
# /etc/skel have been installed already
useradd -m crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) root
chsh -s $(which zsh) crystal
if [[ -d /etc/crystal/bootopts ]]; then
    chmod +x /etc/crystal/bootopts/*
fi

chown -R crystal:crystal /home/crystal/
chmod +x /home/crystal/.xinitrc

systemctl enable NetworkManager

# IDK if we even *should* auto-set the theme
#sudo -u crystal lookandfeeltool -a org.kde.breezedark.desktop

# i'm tired ok
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/bin/amethyst /usr/bin/ame
echo "Configured the system. Exiting chroot."
