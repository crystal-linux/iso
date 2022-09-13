<p align="center">
  <a href="https://getcryst.al">
    <img src="https://getcryst.al/site/assets/other/icon-iso.png" alt="Logo" width="150" height="150">
  </a>
</p>
<p align="center"> 
<h2 align="center"> Crystal ISO </h2>
</p>
<p align="center">
    <a href="https://github.com/crystal-linux/iso"><img src="https://github.com/crystal-linux/iso/actions/workflows/build.yml/badge.svg"></a><br>
    <a href="https://github.com/crystal-linux/.github/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-GPL--3.0-blue.svg" alt="License">
    <a href="https://github.com/crystal-linux/iso/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues-raw/crystal-linux/iso"></a>
    <a href="https://github.com/crystal-linux/iso/pulls"><img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr-raw/crystal-linux/iso"></a><br>
    <a href="https://discord.gg/hYJgu8K5aA"><img alt="Discord" src="https://img.shields.io/discord/825473796227858482?color=blue&label=Discord&logo=Discord&logoColor=white"> </a>
    <a href="https://github.com/axtloss"><img src="https://img.shields.io/badge/Maintainer-@axtloss-brightgreen" alt="The maintainer of this repository" href="https://github.com/axtloss"></a>
    <br>
    <a href="https://fosstodon.org/@crystal_linux"><img alt="Mastodon Follow" src="https://img.shields.io/mastodon/follow/108618426259408142?domain=https%3A%2F%2Ffosstodon.org">
    <a href="https://twitter.com/crystal_linux"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/crystal_linux"></a>
</p>

<p align="center"> Build or download the Arch-based Crystal Linux iso. </p>

## Dependencies:
* `pacman-contrib`
* `archiso`
* `squashfs-tools`

## How to Build:
You will have to use Arch or Arch-Based distros to build this ISO File.
* Install Dependencies
* Go to the project folder
* Run `./build.sh --build-iso` to build an iso image
* Or Run `./build.sh --build-bootstrap` to build a rootfs tarball    
### How to build inside of Docker or Podman:
* The container **MUST** be ran as root to build. 
  * Other than needing to be ran as root, it should function correctly. You may need to install a few more dependencies aside from the ones listed here.
  
  To enter a distrobox container as root, run `distrobox enter --root boxnamehere -- bash` 
  
  (the `-- bash` is to ensure the container opens properly. Install your host shell afterwards to get it to open using your host shell.)
