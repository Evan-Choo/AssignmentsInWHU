 		global _main
		extern _printf
		extern _puts

		section .text
_main:
		mov r9, 2                ; keep track of the current number, according to definition, primes starts at 2
		mov r10, 2				 ; keep track of the divisor. The divisor starts at 2.

isPrime:
		mov rdx, 0				 ; move 0 to the upper 64-bit of the dividend
		mov rax, r9			     ; move the current number to the register that holds the lower 64-bit of dividend
		div r10 				 ; perform r9/r10 and the remainder is stored in rdx
		;inc r10					 ; increase the divisor by 1
		cmp rdx, 0				 ; compare the register that holds the remainder to 0
		je zero					 ; if equal, jump to zero
		jmp notZero   			 ; jump to not zero if the remainder is not 0

zero:
		cmp r9, r10				 ; compare the current number to the current divisor
		;mov r10, 2 				 ; restore the divisor to 2
		je printPrime		 	 ; if they are equal, print the prime
		jmp isMax				 ; determine whether the r9 reaches the max number

notZero:
		inc r10
		jmp isPrime

printPrime:
		push r11
		push r12
		push r9
		lea rdi, [rel answer]
		mov rsi, r9
		call _printf
		pop r9
		pop r12
		pop r11

isMax:
		cmp r9, maxNumber		 ; if they are not equal, then compare the current number with the max number
		;inc r9					 ; increase the current number by 1
		jl increase 			 ; if the current number is less or equal to the max number, jump to isPrime
		jmp done 				 ; the current number is over maxNumber, jump to done

increase:
		inc r9
		mov r10, 2
		jmp isPrime

done:
		ret

		section .bss
maxNumber equ 100 		 ; this is the max number we need to determine

		section .data
answer: db "%ld", 10, 0			 ; print the prime number
