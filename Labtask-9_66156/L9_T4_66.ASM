dosseg
.model small
.stack 100h
.data
string db 'abdullah'
.code
main proc
mov ax,@data
mov ds,ax
mov si,offset string
mov cx,3
L1:
mov bx, [si]
push bx
inc si
loop L1
mov cx,3
L2:
pop dx
mov ah,2
int 21h
Loop L2

mov ah,4ch
int 21h
main endp
end main

