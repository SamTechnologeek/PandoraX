#! /bin/bash
CFLAGS="-Wall -nostdlib -fno-builtin -nostartfiles -nodefaultlibs"
ASMFLAGS="-f elf -o"
LDFLAGS="-T linker.ld -o"
FORIMG="grub/stage1 grub/stage2 grub/pad kernel/kernel.bin"
BUILD="build"

# Assemble bootloader.
echo "* Assembling bootloader *"
nasm $ASMFLAGS $BUILD/loader.o boot/loader.s
echo "** Assembled bootloader **"
# Compile kernel. 
echo "* Generating object file of kernel.c *"
gcc -c -Iinclude/ kernel/kernel.c -o $BUILD/kernel.o  $CFLAGS
echo "** Object file generated from kernel.c **"
# Compile console.c
echo "* Generating object file from console.c *"
gcc -c -Iinclude/ include/sys/console.c -o $BUILD/console.o $CFLAGS
echo "** Object file generated from console.c **"
# Join 'C' files
echo "* Compiling kernel *"
gcc -c $BUILD/kernel.o $BUILD/console.o -o $BUILD/kernel.o
echo "** Compiled kernel **"
# Link the bootloader and the kernel to make a raw binary file(Using the linker script).
echo "* Linking bootloader and kernel *"
ld $LDFLAGS kernel/kernel.bin $BUILD/loader.o $BUILD/kernel.o 
echo "** Linked bootloader and kernel **"
# Make an '.img'.
echo "* Generating out.img *"
cat $FORIMG > out.img # Here we make a .img with grub and the kernel.
echo "** Generated out.img **"
echo "Exiting."
exit # We exit properly from the script.
