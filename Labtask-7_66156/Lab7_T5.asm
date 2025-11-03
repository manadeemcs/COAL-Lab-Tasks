;task 5
mov ax, 9
mov bx, ax
dec bx
jmp check
process:
dec ax
add cx, ax
check:
cmp ax, 0
jg process
mov dx, cx


