dosseg
.model small
.stack 100h
.data
msg1 db 'Enter a single digit (0-9):  $'
msg2 db 13,10, 'The number is Even $'
msg3 db 13,10, 'The number is Odd $'
.code
main proc

mov ax,@data
mov ds,ax

mov dx,OFFSET msg1
mov ah,09h
int 21h

move ah,01h
int 21h
sub al,'0'
mov bl,al


mov ax,bx
xor dx,dx
mov cl,2
div cl

cmp ah,0
jz is_even

is_odd:
mov dx,OFFSET msgOdd
mov ah, 09h
int 21h
jmp end_prog

is_even:
mov dx,OFFSET msgEven
mov ah,09h
int 21h

mov ah,4ch
int 21h
main endp
end main
