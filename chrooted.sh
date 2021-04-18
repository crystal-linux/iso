#!/bin/bash
# This file is run via mkarchiso while chrooted as the new system
echo "We're in the new system. :)"
echo "Performing minor tweaks"
sed -i 's/Arch/CrystalUX/g' /etc/issue
sed -i 's/Arch/CrystalUX/g' /etc/arch-release
sed -i 's/Arch/CrystalUX/g' /etc/os-release
echo "CrystalLive" > /etc/hostname
#reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
echo "sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist" >> /usr/bin/mirrorsetup
chmod +x /usr/bin/mirrorsetup
# We don't add carly until here so that our packages which change
# /etc/skel have been installed already
/usr/bin/useradd -m carly
/usr/bin/usermod -p $(echo "pear" | openssl passwd -6 -stdin) carly
/usr/bin/usermod -p $(echo "pear" | openssl passwd -6 -stdin) root
/usr/bin/chmod +x /home/carly/.xinitrc
echo "Configured the 'carly' user. Exiting chroot."

cat >> .bashrc << EOF
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  startx
fi

if [[ ! -f /etc/pacman.d/mirrorlist ]]; then
  sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
fi
EOF