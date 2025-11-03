dosseg
.model small
.stack 100h
.data
array db 100 dup('$')
.code
main proc
mov ax,@data
mov ds,ax
mov si,offset array
l1:
mov ah,1
int 21h
cmp al,13

je program
mov [si],al
inc si

jmp l1
program:
mov dx,offset array
mov ah,9

int 21h
mov ah,4ch
int 21h
main endp
end main
