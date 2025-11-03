dosseg
.model small
.stack 100h
.data
.code
main proc

mov cx,10
mov dl,48

L1:
mov ah,2
int 21h
inc dl
Loop L1

mov dl,13
mov ah,2
int 21h
mov dl,10
int 21h

mov cx,5
mov dl,48

Leven:
mov ah,2
int 21h
add dl,2
Loop Leven

mov dl,13
mov ah,2
int 21h
mov dl,10
int 21h

mov cx,5
mov dl,49

Lodd:
mov ah,2
int 21h
add dl,2
Loop Lodd

mov ah,4ch
int 21h
main endp
end main
