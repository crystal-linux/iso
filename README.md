<p align="center">
  <a href="https://github.com/crystalux-project/branding">
    <img src="https://raw.githubusercontent.com/crystalux-project/branding/main/crystalux-logo-minimal-iso.png" alt="Logo" width="150" height="150">
  </a>
</p>
<p align="center"> 
<h2 align="center"> Crystal ISO </h2>
</p>
<p align="center">
<img src=https://img.shields.io/github/stars/crystalux-project/iso?style=for-the-badge&logo=appveyor&color=blue />
<img src=https://img.shields.io/github/forks/crystalux-project/iso?style=for-the-badge&logo=appveyor&color=blue />
<img src=https://img.shields.io/github/issues/crystalux-project/iso?style=for-the-badge&logo=appveyor&color=informational />
<img src=https://img.shields.io/github/issues-pr/crystalux-project/iso?style=for-the-badge&logo=appveyor&color=informational />
<p align="center"> Build the Arch-based CrystalUX iso. </p>

## How to Build:
You will have to use Arch or Arch-Based distros to build this ISO File.
* Install Dependencies
* Go to the project folder
* Run `./build_iso.sh`
    * If you get an error about `/tmp/<something>` running out of space, reboot (to clear tmpfs), then re-run with a dir to use as temp (e.g. `./build_iso.sh FOOBAR`)

### Dependencies:
* `pacman-contrib`
* `archiso`
* `github-cli`
