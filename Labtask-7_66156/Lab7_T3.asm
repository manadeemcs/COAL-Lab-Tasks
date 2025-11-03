;task 3
mov ax, 10
mov bx, 3
mov dx, 0
jmp division
done:
mov cx, ax
mov ax, dx
jmp end
division:
sub ax, bx
inc dx
cmp ax, bx
jge division
jmp done
end: