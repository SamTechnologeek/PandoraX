#!/bin/bash

harddisk_image="pandorax.img"
qemu_cmdline="qemu-system-i386"

# run QEMU
$qemu_cmdline -hda "$harddisk_image"
 
echo
