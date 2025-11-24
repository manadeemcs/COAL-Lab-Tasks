.model small
.stack 100h
.data
msg1 db 10,13, "vowels character.... $"
msg2 db 10,13, "Constant character.... $"
.code
main proc
mov ax,@data
mov ds,ax
mov ah, 1
int 21h
cmp al,'A'
je 11
cmp al,'a'
je 11
cmp al,'E'
je 11
cmp al,'e'
je 11
cmp al,'I'
je 11
cmp al,'i'
je 11
cmp al,'O'
je 11
cmp al,'o'
je 11
cmp al,'U'
je 11
cmp al,'u'
je 11
mov dx, offset msg2
mov ah,9
int 21h
jmp exit
11:
mov dx, offset msg 1
mov ah,9
int 21h
exit:
mov ah,4ch
int 21h
main endp
end main
