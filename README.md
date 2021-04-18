# PearISO
Build the (new) Arch-based pear iso.

## How to Build:
You will have to use Arch or Arch-Based distros to build this ISO File.
1. Install Dependencies
2. Go to the project folder
3. Run `./build_iso.sh`

### Dependencies:
* `pacman-contrib`
* `archiso`

Install With - `sudo pacman -Syu pacman-contrib archiso`<br />
(Syu To make sure everything else is up to date and the repos are synchronized)
### Run the Command
Go to the project folder, open a terminal and Type `./build_iso.sh`<br />
Or Open Visual Studio code and execute the script from there.
* If you get an error about `/tmp/<something>` running out of space, reboot (to clear tmpfs), then edit the `WORKDIR=...` line to a regular dir name.
    * This (could) happen because the script is written to make a temp dir in `/tmp`, which is a virtual FS that lives in RAM.
    * If it happens to many people, we can just add a commandline arg to change `WORKDIR`
