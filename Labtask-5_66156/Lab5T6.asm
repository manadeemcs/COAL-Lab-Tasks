include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
mov dl,6
mov bl,2
cmp dl,bl
je move
print 'Both are not equal'
mov ah,04h
int 21h
move:
print 'Both are equal'
mov ah,04h
int 21h
main endp
end main


