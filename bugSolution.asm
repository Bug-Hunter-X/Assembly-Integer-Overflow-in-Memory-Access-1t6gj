; Check for potential overflow before memory access
mov eax, esi
imul eax, 4 ; Multiply esi by 4
jo overflow_handler ; Jump to handler if overflow occurs

add eax, ebx ; Add ebx
add eax, 0x10 ; Add 0x10

; Check if the address is within valid memory range
cmp eax, valid_memory_start ; Compare with start of valid memory
jnge memory_error ; Jump to error if less than or equal to start
cmp eax, valid_memory_end ; Compare with end of valid memory
jnle memory_error ; Jump to error if greater than or equal to end

mov eax, [eax] ; Access memory safely
jmp end

overflow_handler:
; Handle integer overflow (e.g., log error, exit)
mov eax, -1 ; Set error code
jmp end

memory_error:
; Handle memory access violation (e.g., log error, exit)
mov eax, -2 ; Set error code

end:
; ...rest of the code...