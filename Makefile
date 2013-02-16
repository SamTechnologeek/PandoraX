BUILD=build
CFLAGS=-Wall -nostdlib -fno-builtin -nostartfiles -nodefaultlibs
ASMFLAGS=-f elf -o
LDFLAGS=-T linker.ld -o
FORIMG=grub/stage1 grub/stage2 grub/pad $(BUILD)/kernel.bin


all: pandorax

pandorax: loader.o console.o kernel.o
	ld $(LDFLAGS) $(BUILD)/kernel.bin $(BUILD)/loader.o $(BUILD)/kernel.o $(BUILD)/console.o 

loader.o: boot/loader.s
	nasm $(ASMFLAGS) $(BUILD)/loader.o boot/loader.s

console.o: include/sys/console.h lib/console.c
	gcc -c -Iinclude/ lib/console.c -o $(BUILD)/console.o $(CFLAGS)

kernel.o: kernel/kernel.c include/sys/console.h
	gcc -c -Iinclude/ kernel/kernel.c -o $(BUILD)/kernel.o $(CFLAGS)

image: $(BUILD)/kernel.bin
	cat $(FORIMG) > out.img 

clean:
	rm $(BUILD)/console.o
	rm $(BUILD)/kernel.o
	rm $(BUILD)/loader.o
	rm $(BUILD)/kernel.bin