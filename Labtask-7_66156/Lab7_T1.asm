;task 1
mov ax, 5
mov bx, 2
mov cx, ax
jmp calculate
modify:
sub ax, bx
mov dx, ax
jmp finish
calculate:
add ax, bx
jmp modify
finish: