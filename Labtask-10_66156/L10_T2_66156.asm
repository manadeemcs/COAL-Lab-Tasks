org 100h
.data
a db 01000001b
.code
mov ax,@data
mov ds,ax
mov bl,a
or  bl, 00100000b