mov ax,4h
mov bx,3h
cmp ax,bx
jg abc
mov cx,bx
hlt
abc:
mov cx,ax
hlt