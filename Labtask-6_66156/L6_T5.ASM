dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,26
mov dl,65
L1:
mov ah,2
int 21h
inc dl
Loop L1
mov dl,13
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h

mov cx,26
mov dl,97
L2:
mov ah,2
int 21h
inc dl
Loop L2

mov ah,4ch
int 21h
main endp
end main
