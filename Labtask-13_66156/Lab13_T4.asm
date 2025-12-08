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

mov bl,100 

secondline:
int 10h   
inc dx
dec bl
jnz secondline

mov bl,100  
  
Thirdline:
int 10h
dec cx
dec bl
jnz Thirdline

mov bl,100 

Fourthline:
int 10h   
dec dx
dec bl
jnz Fourthline

mov al,2
mov cx,70
mov dx,90
mov ah,0ch
int 10h   

mov bl,100

Fifthline:
int 10h
inc cx
dec bl
jnz Fifthline

mov bl,100 

Sixthline:
int 10h   
inc dx
dec bl
jnz Sixthline
  
mov bl,100  
  
Seventhline:
int 10h
dec cx
dec bl
jnz Seventhline

mov bl,100 

Eighthline:
int 10h   
dec dx
dec bl
jnz Eighthline

mov cx,40
mov dx,60
mov ah,0ch
int 10h

mov bl,30

First_diagonal_line:
int 10h
inc cx 
inc dx
dec bl
jnz First_diagonal_line    

mov cx,140
mov dx,60
mov ah,0ch
int 10h 

mov bl,30

Second_diagonal_line:
int 10h
inc cx 
inc dx
dec bl
jnz Second_diagonal_line   


mov cx,140
mov dx,160
mov ah,0ch
int 10h  

mov bl,30

Third_diagonal_line:
int 10h
inc cx 
inc dx
dec bl
jnz Third_diagonal_line 

mov cx,40
mov dx,160
mov ah,0ch
int 10h  

mov bl,30

Fourth_diagonal_line:
int 10h
inc cx 
inc dx
dec bl
jnz Fourth_diagonal_line