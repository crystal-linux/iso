# CrystalISO
Build the Arch-based CrystalUX iso.

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
