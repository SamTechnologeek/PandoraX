CFLAGS=-Wall -nostdlib -fno-builtin -nostartfiles -nodefaultlibs
ASMFLAGS=-f elf -o
LDFLAGS=-T linker.ld -o
FORIMG=grub/stage1 grub/stage2 grub/pad kernel/kernel.bin
BUILD=build

all:
	nasm $(ASMFLAGS) $(BUILD)/loader.o boot/loader.s	
	gcc -c -Iinclude include/sys/console.c -o $(BUILD)/console.o  $(CFLAGS)
	gcc -c -Iinclude kernel/kernel.c -o $(BUILD)/kern.o $(CFLAGS)
	ld $(LDFLAGS) kernel/kernel.bin $(BUILD)/console.o $(BUILD)/kern.o $(BUILD)/loader.o
	cat $(FORIMG) > out.img