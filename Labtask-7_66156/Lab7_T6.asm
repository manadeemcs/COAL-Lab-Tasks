;task 6

mov ax, 0
mov bx, 1
mov cx, 7
jmp fibonacci
stop:
mov dx, bx
hlt
fibonacci:
mov si, ax
mov ax,bx
add bx,si
dec cx
jnz fibonacci
jmp stop

