#! /bin/bash
CFLAGS="-Wall -nostdlib -fno-builtin -nostartfiles -nodefaultlibs"
ASMFLAGS="-f elf -o"
LDFLAGS="-T linker.ld -o"
FORIMG="grub/stage1 grub/stage2 grub/pad kernel/kernel.bin"
BUILDDIR="build"

# Assemble bootloader.
nasm $ASMFLAGS $BUILD/loader.o boot/loader.s
# Compile kernel. 
gcc kernel/kernel.c -c -o $BUILD/kernel.o  $CFLAGS
# Compile console.c
gcc kernel/include/sys/console.c -c -o $BUILD/console.o $CFLAGS
# Link the bootloader and the kernel to make a raw binary file(Using the linker script).
ld $LDFLAGS kernel/kernel.bin $BUILD/loader.o $BUILD/kernel.o $BUILD/console.o
# Make an '.img'.
cat $FORIMG > out.img # Here we make a .img with grub and the kernel.
exit # We exit properly from the script.
