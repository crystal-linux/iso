#
# ~/.bashrc
#

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  startx
fi

if [[ ! -f /etc/pacman.d/mirrorlist ]]; then
  sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
fi

# this shit makes tkinter work
xrdb -load /dev/null
xrdb -query
