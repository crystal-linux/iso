#!/usr/bin/env bash
echo "Chrooted in the new system, running as $(whoami)"

# Services
systemctl enable NetworkManager
systemctl enable mirrorlist
systemctl enable gdm

# Hostname and Locale
echo "crystal-live" > /etc/hostname
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Configured the system. Exiting chroot."
