#!/bin/bash

# This file is run via mkarchiso while chrooted as the new system
echo "chrooted in the new system, running as $(whoami)"

echo "CrystalLive" > /etc/hostname
echo "reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist" >> /usr/bin/mirrorsetup
chmod +x /usr/bin/mirrorsetup

cp /pacman.conf /etc/pacman.conf

# We don't add crystal until here so that our packages which change
# /etc/skel have been installed already
useradd -m crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) root
chsh -s /usr/bin/zsh crystal

cat >> /home/crystal/.zshrc << EOF
PROMPT="%n@%m %~ %# "
alias paste="nc termbin.com 9999"
clear
pfetch
EOF

echo "zsh" > /home/crystal/.bashrc

chown -R crystal:crystal /home/crystal/
systemctl enable NetworkManager

# i'm tired ok
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Configured the system. Exiting chroot."
