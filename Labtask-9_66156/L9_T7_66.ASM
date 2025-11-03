dosseg
.model small
.stack 100h
.data
.code
main proc
mov bx,5
l1:
push cx
mov cx,bx

l2:
mov dl,'*'
mov ah,2
int 21h

loop l2
mov dl,10
mov ah,2
int 21h

mov dl,13
mov ah,2
int 21h

dec bl
pop cx
cmp bl,0
jne l1

mov ah,4ch
int 21h
main endp
end main
