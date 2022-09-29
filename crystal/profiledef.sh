#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="crystal-live"
iso_label="CRYS_$(date +'%Y-%m-%d')"
iso_publisher="Crystal Linux <https://getcryst.al>"
iso_application="Crystal Linux Live"
iso_version="$(date +'%Y-%m-%d')"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-b' '1M')
file_permissions=()
