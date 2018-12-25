		global _main
		extern _printf

		section .text
_main:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; These registers are used to hold the ;
		; column of each queen on each row     ;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov r8, 0
		mov r9, 0
		mov r10, 0
		mov r11, 0
		mov r12, 0
		mov r13, 0
		mov r14, 0
		mov r15, 0

		mov rax, 0 ; rax for current row

findPlace:
		cmp rax, 8
		je printPlace
		jmp initializeRecursion

printPlace:
		; print each number of r8 to r15
		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel delimiter]
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r8
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r9
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r10
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r11
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r12
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r13
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel output]
		mov rsi, r14
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		push r8
		push r9
		push r10
		push r11
		push r12
		push r13
		push r14
		push r15
		push rax
		push rdx
		push rbx
		lea rdi, [rel lastOutput]
		mov rsi, r15
		call _printf
		pop rbx
		pop rdx
		pop rax
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8

		jmp done

		;curRow-rax
		;curNum-rdx
		;rbx-i
		;rcx-flag
		;r8~r15-queenCol[i]

initializeRecursion:
		mov rdx, 0 ; rdx stands for current number of the column of the queen
		jmp recursion

; if there is no place, increase rdx and continue search
increaseRdx:
		inc rdx
		jmp recursion

recursion:
		cmp rdx, 8
		je done
		call hasPlaceInit
		cmp rcx, 0
		je increaseRdx

		; rax stands for the current row, assign the correspoding register 
		cmp rax, 0
		je assign0

		cmp rax, 1
		je assign1

		cmp rax, 2
		je assign2

		cmp rax, 3
		je assign3

		cmp rax, 4
		je assign4

		cmp rax, 5
		je assign5

		cmp rax, 6
		je assign6

		cmp rax, 7
		je assign7

		assign0:
				mov r8, rdx
				jmp saveContext
		assign1:
				mov r9, rdx
				jmp saveContext
		assign2:
				mov r10, rdx
				jmp saveContext
		assign3:
				mov r11, rdx
				jmp saveContext
		assign4:
				mov r12, rdx
				jmp saveContext
		assign5:
				mov r13, rdx
				jmp saveContext
		assign6:
				mov r14, rdx
				jmp saveContext
		assign7:
				mov r15, rdx
				jmp saveContext

		saveContext:
				; save context to begin recursion
				push rax ; current row
				push rdx ; current number
				inc rax
				call findPlace
				pop rdx
				pop rax
				jmp increaseRdx



hasPlaceInit:
		mov rbx, 0 ; rbx stands for i
		mov rcx, 1 ; the flag indicating whether a certain number can be placed here
		
hasPlace:
		cmp rbx, rax
		je done
		
		cmp rbx, 0
		je comp0

		cmp rbx, 1
		je comp1

		cmp rbx, 2
		je comp2

		cmp rbx, 3
		je comp3

		cmp rbx, 4
		je comp4

		cmp rbx, 5
		je comp5

		cmp rbx, 6
		je comp6

		cmp rbx, 7
		je comp7

		;curRow-rax
		;curNum-rdx
		;rbx-i
		;rcx-flag
		;r8~r15-queenCol[i]
		comp0:
				cmp rdx, r8
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r8
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r8
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind

		comp1:
				cmp rdx, r9
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r9
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r9
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp2:
				cmp rdx, r10
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r10
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r10
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp3:
				cmp rdx, r11
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r11
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r11
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp4:
				cmp rdx, r12
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r12
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r12
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp5:
				cmp rdx, r13
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r13
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r13
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp6:
				cmp rdx, r14
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r14
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r14
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind
		comp7:
				cmp rdx, r15
				je noPlace
				
				push rbx
				push rdx
				sub rbx, rax
				sub rdx, r15
				cmp rbx, rdx
				pop rdx
				pop rbx
				je noPlace

				push rax
				push rdx
				sub rax, rbx
				sub rdx, r15
				cmp rax, rdx
				pop rdx
				pop rax
				je noPlace

				jmp continueFind

		continueFind:
				inc rbx
				jmp hasPlace

noPlace:
		mov rcx, 0
		jmp done
		
done:
		ret

		section .bss

		section .data
delimiter: db "=============", 10, 0
output: db "%llu ", 0
lastOutput: db "%llu", 10, 0