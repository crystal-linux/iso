#!/bin/bash

# This file is run via mkarchiso while chrooted as the new system
echo "chrooted in the new system, running as $(whoami)"

echo "crystal-live" > /etc/hostname
echo "reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist" >> /usr/bin/mirrorsetup
chmod +x /usr/bin/mirrorsetup

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
echo "live credentials -"
echo "crystal:crystal // root:crystal"
echo
alias nmtui="nmtui && source .zshrc"
cowsay "don't forget to set up wifi in the settings app if required."
if [[ -z "\$DISPLAY" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "crystal-obsidian"
    gsettings set org.gnome.desktop.interface icon-theme "crystal-obsidian-icons"
    gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/crystal/extended logo.png"
    startx
fi
EOF

cat >> /home/crystal/.xinitrc << EOF
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec budgie-desktop
EOF

echo "zsh" > /home/crystal/.bashrc

mkdir -p /home/crystal/Desktop
cp /usr/share/applications/Jade.desktop /home/crystal/Desktop/Install.desktop
chown -R crystal:crystal /home/crystal/

systemctl enable NetworkManager

# i'm tired ok
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Configured the system. Exiting chroot."
