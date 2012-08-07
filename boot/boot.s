; PandoraX OS boot loader
; Developed by Samuel Domínguez
; PandoraX OS is under the BSD license

ORG 0x07c0

global loader 			; Make loader visible for the linker script.
extern kmain 			; Make the kernel init visible for the boot.s.

section .text
	
	STACKSIZE equ 0x4000 	; 16kb stack

start:
	mov esp, stack + STACKSIZE ; Setup stack
	mov si, greet		   ;*****************;
	call print_str		   ;*Print messages.*;
	mov si, msg		   ;*****************;
	call print_str
	call kmain		;Call kernel

print_str:			;print string function
	mov ah, 0x0E
	.loop:
	lodsb
	cmp al, 0
	je .exit
	int 10h
	jmp .loop
	.exit:
	ret

section .data			;Initialized data
	greet db "Welcome to PandoraX OS! - ",0
	msg db "Calling kernel.........",0
section .bss			;Uninitialized data
	
stack:	resb STACKSIZE

	times 510- ($-$$) db 0
	dw 0xAA55
