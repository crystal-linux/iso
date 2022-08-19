#!/usr/bin/env bash
echo "Chrooted in the new system, running as $(whoami)"

# Fix pacman config being put in / instead of /etc
mv /pacman.conf /etc/pacman.conf

# Mirrorlist
reflector > /etc/pacman.d/mirrorlist

# Hostname
echo "crystal-live" > /etc/hostname

# Locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen


echo "Configured the system. Exiting chroot."
