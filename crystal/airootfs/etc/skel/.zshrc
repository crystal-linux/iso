PROMPT="%n@%m %~ %# "

main() {
  clear
  pfetch
  echo "Live Credentials -"
  echo "crystal: crystal // root: crystal"
  echo
  cowsay \
    "Don't forget to set up Wi-Fi in the Settings app if required!"
}

main
