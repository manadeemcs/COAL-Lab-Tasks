org 0x100 ; Set the origin (starting address) of the code to 0x100 (hexadecimal)
mov ax, 4 ; Move the value 4 into the AX register
mov bx, 4 ; Move the value 4 into the BX register 
cmp ax, bx; Compare the value in AX (which is 4) with the value in BX (which is 4)
jz move   ; Jump to the 'move' label if the comparison result is zero (AX == BX)
jnz exit  ; Jump to the 'exit' label if the comparison result is not zero (AX != BX) 
move:     ; Label 'move' - executed if AX == BX (jump from jz)
mov dx, 3 ; Move the value 3 into the DX register
exit:     ; Label 'exit' - executed after the program ends or from jnz
mov ax, 0x4c00 ; Set AX to 0x4c00 (DOS dunction code for program termination)
int 0x21  ; Iterrupt 0x21 (DOS system call) with function 0x4c to terminate the program