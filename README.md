# Steps

1. `vagrant up`

# What It Does

Sets up a development environment for the Gameboy Advance inside of a virtual machine.

# What if I don't want to use a VM?

Okay, no problem. Do this:

1. If you aren't on an i686 system then replace the archives in `sdk/` with the right ones for your platform ([devkitARM](https://sourceforge.net/projects/devkitpro/files/devkitARM/devkitARM_r45/) and [libgba](https://sourceforge.net/projects/devkitpro/files/libgba/)).
2. `./setup.sh` to set stuff up in the `gba-kit/` directory.
3. `source ./env` to setup your PATH correctly.
4. `cd examples && make` to test the install by building the examples.
