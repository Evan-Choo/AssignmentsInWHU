		global _main
		extern _printf

		section .text
_main:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; cx and ax, bx and dx form the 32-bit number     ;
; cx and ax for a                                 ;
; bx and dx for b                                 ;
; bp and r8w for temp                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov ax, 0
		mov cx, 0

		;print the first two number 0 and 1 first
		push ax
		push cx
		push dx
		push bx
		push r9
		push r11 ; align the stack before call
		xor r9, r9
		lea rdi, [rel output]
		mov r9w, cx
		shl r9, 16
		mov r9w, ax
		mov rsi, r9
		call _printf
		pop r11
		pop r9
		pop bx
		pop dx
		pop cx
		pop ax

		mov dx, 1
		mov bx, 0

		push ax
		push cx
		push dx
		push bx
		push r9
		push r11
		xor r9, r9
		lea rdi, [rel output]
		mov r9w, bx
		shl r9, 16
		mov r9w, dx
		mov rsi, r9
		call _printf
		pop r11
		pop r9
		pop bx
		pop dx
		pop cx
		pop ax

		;already printed 2 numbers, the rdi is then set to 2
		mov rdi, 2 ;the number of epoches

cal:
		; move b to temp and add the lower 16-bit of a and b to b
		inc rdi
		mov r8w, dx
		mov bp, bx
		add dx, ax
		; if lower 16-bit has carry
		jc withCarry

noCarry:
		add bx, cx
		jmp restore

withCarry:
		; if with carry, we need add extra 1 to bx, the higher 16-bit of b
		add bx, cx
		inc bx

restore:
		; move temp to a
		mov ax, r8w
		mov cx, bp

print:
		push ax
		push cx
		push dx
		push bx
		push r9
		push rdi
		xor r9, r9
		lea rdi, [rel output]
		mov r9w, bx
		shl r9, 16
		mov r9w, dx
		mov rsi, r9
		call _printf
		pop rdi
		pop r9
		pop bx
		pop dx
		pop cx
		pop ax

compare:
		; end when rdi equals epoch 30
		cmp rdi, epoch
		jl cal

done:
		ret

		section .bss
epoch equ 30

		section .data
output: db "%ld", 10, 0