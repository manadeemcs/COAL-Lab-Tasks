include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
mov dl,2
mov bl,1
cmp dl,bl
jg move
mov ax,5
int 21h
move:
mov ax,3
int 21h
main endp
end main


