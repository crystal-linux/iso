#!/usr/bin/env bash
echo "Chrooted in the new system, running as $(whoami)"

# User setup
useradd -mG wheel crystal
usermod -c "Password // \"crystal\"" crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) crystal
usermod -p $(echo "crystal" | openssl passwd -6 -stdin) root
chsh -s /usr/bin/zsh crystal

# Desktop icon for Jade's GUI
mkdir -p /home/crystal/Desktop
cp /usr/share/applications/al.getcryst.jadegui.desktop /home/crystal/Desktop/Install.desktop

# Disable auto screen lock
mkdir -p /home/crystal/.config/autostart
echo "[Desktop Entry]
Name=Deactive lock screen
Comment=Deactive the gnome lock screen in the live session
Type=Application
Icon=nautilus
Exec=sh -c \"gsettings set org.gnome.desktop.screensaver lock-enabled false\"" > /home/crystal/.config/autostart/no-lock-screen.desktop

# Set default session to Onyx
echo "[User]
Session=onyx
Icon=/var/lib/AccountsService/icons/crystal
SystemAccount=false" > /var/lib/AccountsService/users/crystal

# Jade-GUI Autostart
cp /usr/share/applications/al.getcryst.jadegui.desktop /home/crystal/.config/autostart

# Permissions for Crystal user
chown -R crystal:crystal /home/crystal/
chmod +x /home/crystal/.config/autostart/*.desktop

# Services
systemctl enable vmtoolsd
systemctl enable vmware-vmblock-fuse
systemctl enable NetworkManager
systemctl enable reflector
systemctl enable gdm

# Mirrorlist
reflector > /etc/pacman.d/mirrorlist

# Hostname
echo "crystal-live" > /etc/hostname

# Locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

echo "Configured the system. Exiting chroot."
