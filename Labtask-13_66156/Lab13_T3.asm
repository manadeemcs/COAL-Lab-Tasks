mov al,13h
mov ah,0
int 10h      

mov al,1
mov cx,40
mov dx,60
mov ah,0ch
int 10h   

mov bl,100

firstline:
int 10h
inc cx
dec bl
jnz firstline

mov al,2
mov bl,100 

secondline:
int 10h   
inc dx
dec bl
jnz secondline
          
mov al,3         
mov bl,100  
  
Thirdline:
int 10h
dec cx
dec bl
jnz Thirdline

mov al,4
mov bl,100 

Fourthline:
int 10h   
dec dx
dec bl
jnz Fourthline