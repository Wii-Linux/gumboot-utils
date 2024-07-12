# Wii Linux Gumboot Utilities

This repository contains multiple utilities for the Wii Linux bootloader, known as [Gumboot](https://github.com/neagix/gumboot).  
These utilities try to mirror similarly named utilities by [GRUB](https://www.gnu.org/software/grub/), the standard bootloader for x86-based Linux PCs.  

The utilities included in this package are as follows.

## gumboot-mkconfig

A clone of GNU GRUB's `grub-mkconfig`.  It takes the same[^1] arguments, and behaves in the same way.  
It generates a `gumboot.lst` based on the config options specified in `/etc/default/gumboot`, and `/etc/gumboot.d`.  

If no arguments are passed, it will print the config to stdout, and log messages to stderr.
If you pass `-o`, it will write to the file path that follows.

## update-gumboot

A clone of Debian's `update-grub` helper script.  
It makes it possible to update your Gumboot config file without needing to memorize the path, or the command line arguments.  
Instead, you can simply run `update-gumboot` as root, and it handles everything.

## gumboot-install

A clone of GNU GRUB's `grub-install`.  It takes a few of the same[^1] arguments, and should generally behave in a similar way.  
It takes an install path, which is a critical difference from GRUB's version, which instead takes an install device.  
If you accidentally pass `gumboot-install` a block device, it will print a warning, and attempt to figure out where you really wanted to install to.  
It will do this by searching your mounted filesystems for the block device that you've provided.  
If found, it will install to the path where the block device is mounted.  

Note that `gumboot-install` will install Gumboot, as well as it's associated fork of [MINI](https://github.com/neagix/mini) directly.  
It **will overwrite** any existing `gumboot/gumboot.elf`, `bootmii/armboot.bin`, and `bootmii/gui.elf`
It will not update `bootmii/ppcboot.elf`.

Note as well that `gumboot-install`, like `grub-install`, does not generate a configuration file.


### Notes

[^1]: Long options (e.g. `--output=/some_file.cfg`) are not supported due to limitations of the builtin `getopt` in POSIX `sh`.
