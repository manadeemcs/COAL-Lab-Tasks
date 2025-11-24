org 100h

.model small
.stack 100h

.data


.code
main proc
    mov al, 2
    mov bl, 3
    mul bl         

   

    mov dx, ax
    add dx, 48
    mov ah, 2
    int 21h

   

    mov ah, 4Ch
    int 21h
main endp
end main
