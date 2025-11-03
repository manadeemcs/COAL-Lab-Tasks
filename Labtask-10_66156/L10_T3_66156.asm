org 100h
.data
a db 01100001b      

.code
mov ax, @data
mov ds, ax
mov bl, a
and bl, 11011111b   