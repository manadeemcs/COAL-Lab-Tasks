.model small
.stack 100h

.data
Name_msg db 'Abdullah$'
SapID_msg db '66156$'
Course_msg db 'COAL$'

.code 

newline proc
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    ret
newline endp
        
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,09
    mov dx, offset Name_msg
    int 21h
    
    call newline
    mov ah,09
    mov dx, offset SapID_msg
    int 21h
    
    call newline
    mov ah,09
    mov dx, offset Course_msg
    int 21h   
    
    mov ah,4ch
    int 21h

main endp         
end main         

