.model small
.stack 100h
.data
    vowelMsg db 'You entered Vowel$'
    numMsg db 'You entered Numeric Value$'
    alphaMsg db 'You entered Alphabet$'
    specialMsg db 'You Entered Special Symbol$'
    invalidMsg db 'Please Enter a valid value$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    mov bl, al

    cmp bl, 'A'
    je print_vowel
    cmp bl, 'E'
    je print_vowel
    cmp bl, 'I'
    je print_vowel
    cmp bl, 'O'
    je print_vowel
    cmp bl, 'U'
    je print_vowel
    cmp bl, 'a'
    je print_vowel
    cmp bl, 'e'
    je print_vowel
    cmp bl, 'i'
    je print_vowel
    cmp bl, 'o'
    je print_vowel
    cmp bl, 'u'
    je print_vowel

    cmp bl, '0'
    jb check_alpha
    cmp bl, '9'
    jbe print_num

check_alpha:
    cmp bl, 'A'
    jb check_special
    cmp bl, 'Z'
    jbe print_alpha
    cmp bl, 'a'
    jb check_special
    cmp bl, 'z'
    jbe print_alpha

check_special:
    cmp bl, 33
    jb print_invalid
    cmp bl, 47
    jbe print_special
    cmp bl, 58
    jb print_invalid
    cmp bl, 64
    jbe print_special
    cmp bl, 91
    jb print_invalid
    cmp bl, 96
    jbe print_special
    cmp bl, 123
    jb print_invalid
    cmp bl, 126
    jbe print_special

print_invalid:
    mov ah, 9
    mov dx, offset invalidMsg
    int 21h
    jmp exit

print_vowel:
    mov ah, 9
    mov dx, offset vowelMsg
    int 21h
    jmp exit

print_num:
    mov ah, 9
    mov dx, offset numMsg
    int 21h
    jmp exit

print_alpha:
    mov ah, 9
    mov dx, offset alphaMsg
    int 21h
    jmp exit

print_special:
    mov ah, 9
    mov dx, offset specialMsg
    int 21h
    jmp exit

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
