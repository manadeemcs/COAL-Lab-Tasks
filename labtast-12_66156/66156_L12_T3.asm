.model small
.stack 100h

.data
digits db '0123456789', '$'
alphabets db 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', '$'
msg_num db 13,10, 'You entered a NUMBER$', 13,10, '$'
msg_alpha db 13,10, 'You entered a LETTER$', 13,10, '$'
msg_special db 13,10, 'You entered a SPECIAL SYMBOL$', 13,10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    mov bl, al

    lea si, digits
check_digit:
    mov al, [si]
    cmp al, '$'
    je check_alpha
    cmp bl, al
    je is_number
    inc si
    jmp check_digit

check_alpha:
    lea si, alphabets
next_alpha:
    mov al, [si]
    cmp al, '$'
    je special_symbol
    cmp bl, al
    je is_letter
    inc si
    jmp next_alpha

is_number:
    lea dx, msg_num
    mov ah, 9
    int 21h
    jmp exit

is_letter:
    lea dx, msg_alpha
    mov ah, 9
    int 21h
    jmp exit

special_symbol:
    lea dx, msg_special
    mov ah, 9
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main
