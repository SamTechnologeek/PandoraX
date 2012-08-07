#! /bin/bash
CFLAGS="-Wall -nostdlib -fno-builtin -nostartfiles -nodefaultlibs"
ASMFLAGS="-f elf -o"
LDFLAGS="-T linker.ld -o"
FORIMG="grub/stage1 grub/stage2 grub/pad kernel/kernel.bin"

# Assemble bootloader.
nasm $ASMFLAGS boot/loader.o boot/loader.s
# Compile kernel. 
gcc -o kernel/kernel.o -c kernel/kernel.c $CFLAGS
# Link the bootloader and the kernel to make a raw binary file(Using the linker script).
ld $LDFLAGS kernel/kernel.bin boot/loader.o kernel/kernel.o
# Make an '.img'.
cat $FORIMG > out.img # Here we make a .img with grub and the kernel.
exit # We exit properly from the script.
