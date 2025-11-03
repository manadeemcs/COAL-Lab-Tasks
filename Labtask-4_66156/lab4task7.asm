org 100h

mov ah, 1
int 21h
sub al, '0'
mov bl, al

mov ah, 1
int 21h
sub al, '0'

add bl, al

add bl, '0'
mov dl, bl
mov ah, 2
int 21h

mov ah, 4Ch
int 21h