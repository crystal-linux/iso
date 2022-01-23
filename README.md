<p align="center">
  <a href="https://getcryst.al">
    <img src="https://git.getcryst.al/crystal/branding/raw/main/icons/crystal-logo-minimal-packages.png" alt="Logo" width="150" height="150">
  </a>
</p>
<p align="center"> 
<h2 align="center"> Crystal ISO </h2>
</p>
<p align="center">
<a href="https://discord.gg/yp4xpZeAgW"><img alt="Discord" src="https://img.shields.io/discord/825473796227858482?color=blue&label=Discord&logo=Discord&logoColor=white"?link=https://discord.gg/yp4xpZeAgW&link=https://discord.gg/yp4xpZeAgW> </p></a>
<p align="center"> Build or download the Arch-based Crystal Linux iso. </p>

## Dependencies:
* `pacman-contrib`
* `archiso`
* `squashfs-tools`

## How to Build:
You will have to use Arch or Arch-Based distros to build this ISO File.
* Install Dependencies
* Go to the project folder
* Run `./build_iso.sh`
    * If you get an error about `/tmp/<something>` running out of space, reboot (to clear tmpfs), then re-run with a dir to use as temp (e.g. `./build_iso.sh FOOBAR`)
    * If you also add a second arg as in `./build_iso.sh /some/folder testing`, you'll pull from our testing repo
