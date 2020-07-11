	DEVICE ZXSPECTRUM48

	org $7FFF			;set the program counter to a specific address (decimal 32767)

StartProg:
	
	ld hl, 22528		;set register hl to value 22528
	ld a, 12			;set accumlator to 12

loop:	
	ld b, 16			;set register b to 16
	
row1:
	ld (hl), 0			;set memory address specified in register hl to 0
	inc hl				;increase register hl by 1
	ld (hl), 127		;set memory address specified in register hl to 127
	inc hl				;increase register hl by 1
	djnz row1			;decreases b and jumps to row1 if not zero

	ld b, 16			;set register b to 16

row2:
	ld (hl), 127		;set memory address specified in register hl to 127
	inc hl				;increase register hl by 1
	ld (hl), 0  		;set memory address specified in register hl to 0
	inc hl				;increase register hl by 1
	djnz row2			;decreases b and jumps to row2 if not zero
	dec a 				;decrease register a by 1
	jp nz, loop			;jumps to loop if register a not zero
	ret 				;pops the top of the stack into the program counter

	SAVETAP "second.tap", StartProg
	SHELLEXEC "fuse -g 2x second.tap"