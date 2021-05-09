# CrystalISO
Build the Arch-based CrystalUX iso.

## How to Build:
You will have to use Arch or Arch-Based distros to build this ISO File.
1. Install Dependencies
2. Go to the project folder
3. Run `./build_iso.sh`

### Dependencies:
* `pacman-contrib`
* `archiso`

### Run the Command
* `./build_iso.sh`
* If you get an error about `/tmp/<something>` running out of space, reboot (to clear tmpfs), then re-run with a dir to use as temp (e.g. `./build_iso.sh FOOBAR`)
