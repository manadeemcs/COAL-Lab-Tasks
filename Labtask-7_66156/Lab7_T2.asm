;task 2
mov ax, 0
mov bx, 8
mov cx, 1
jmp loop_start
increment:
inc ax
add cx, ax
loop_start:
cmp  ax, bx
jl increment
