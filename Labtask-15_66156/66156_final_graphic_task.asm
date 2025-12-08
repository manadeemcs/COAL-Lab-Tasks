mov al, 12h
mov ah, 0
int 10h

    
mov al, 2          
mov ah, 0ch         


; 1. WALLS & VERTICAL STRUCTURES

;########## Main House Walls #########

    ; [Main Left Wall] 
mov cx, 70          
mov dx, 100         
mov bl, 180        
call vertical_line  

    ; [Shed Left Wall] 
mov cx, 20
mov dx, 200
mov bl, 80
call vertical_line

    ; [Middle Wall] 
mov cx, 250
mov dx, 100
mov bl, 180
call vertical_line

    ; [Right Extension Wall] 
mov cx, 370
mov dx, 100
mov bl, 180
call vertical_line


; 2. HORIZONTAL STRUCTURES (ROOFS & GROUND)


;########## Right Extension Roof Lines #########

    ; [Right Extension Roof Bottom] 
mov cx, 250
mov dx, 100
mov bl, 140
call horizontal_line

    ; [Right Extension Roof Top] 
mov cx, 240
mov dx, 80
mov bl, 130
call horizontal_line

    ; [Ground Line] 
mov cx, 20
mov dx, 280 
mov bl, 250          
call horizontal_line
    
    ; [Ground Line] Extension
mov cx, 270
mov dx, 280 
mov bl, 100          
call horizontal_line
    
    ; [Left Shed] Base Line That is above Ground
mov cx, 20
mov dx, 270 
mov bl, 50         
call horizontal_line  


; 3. DIAGONAL ROOF SLOPES (EXTENSIONS)


    ; [Right Extension Roof Edge] 
mov cx, 370
mov dx, 80
mov bl, 20
call r_diagonal_line 

    ; [Shed Roof Slope] 
mov cx, 70
mov dx, 150
mov bl, 50
call diagonal_line   


; 4. CHIMNEY DETAILS


    ; [Chimney Left Vertical] 
mov cx, 220          
mov dx, 30
mov bl, 30           
call vertical_line

    ; [Chimney Right Vertical] 
mov cx, 240          
mov dx, 30
mov bl, 50           
call vertical_line

    ; [Chimney Cap Bottom] 
mov cx, 210          
mov dx, 30
mov bl, 40
call horizontal_line

    ; [Chimney Cap Left Edge] 
mov cx, 250          
mov dx, 25
mov bl, 5
call vertical_line

    ; [Chimney Cap Right Edge] 
mov cx, 210          
mov dx, 25
mov bl, 5
call vertical_line

    ; [Chimney Cap Top] 
mov cx, 210          
mov dx, 25
mov bl, 40
call horizontal_line



; 5. MAIN ROOF (TRIANGLES)


;########## Inner Roof Triangle #########

    ; [Main Roof Left Slope (Inner)] 
mov cx, 160         
mov dx, 10       
mov bl, 90           
call diagonal_line   

    ; [Main Roof Right Slope (Inner)] 
mov cx, 160
mov dx, 10
mov bl, 90
call r_diagonal_line 

;########## Outer Roof Triangle #########

    ; [Main Roof Left Slope (Outer)] 
mov cx, 160
mov dx, 0            
mov bl, 95          
call diagonal_line

    ; [Main Roof Right Slope (Outer)] 
mov cx, 160
mov dx, 0
mov bl, 95
call r_diagonal_line

;########## (Roof Edges Diagonals) #########

    ; [Left Roof Diagonal]
mov cx, 65           
mov dx, 93
mov bl, 5
call r_diagonal_line   

    ; [Right Roof Diagonal] 
mov cx, 255          
mov dx, 93
mov bl, 5
call diagonal_line   


; 6. DOOR & STEPS


;########## Door Frame #########

    ; [Door Left Jamb] 
mov cx, 130          
mov dx, 180
mov bl, 90
call vertical_line

    ; [Door Right Jamb] 
mov cx, 190          
mov dx, 180
mov bl, 90
call vertical_line

    ; [Door top] 
mov cx, 130          
mov dx, 180
mov bl, 60
call horizontal_line

;########## Steps #########

    ; [Step Top Surface]
mov cx, 120          
mov dx, 270
mov bl, 80
call horizontal_line

    ; [Step Left Riser]
mov cx, 120          
mov dx, 270
mov bl, 10
call vertical_line

    ; [Step Right Riser] 
mov cx, 200          
mov dx, 270
mov bl, 10
call vertical_line


; 7. WINDOWS


;########## Window 1 (Left) #########

    ; [Window 1 Left Frame]
mov cx, 275          
mov dx, 150
mov bl, 30           
call vertical_line   

    ; [Window 1 Right Frame]
mov cx, 305          
mov dx, 150
mov bl, 30
call vertical_line   

    ; [Window 1 Top Frame]
mov cx, 275
mov dx, 150
mov bl, 30
call horizontal_line 

    ; [Window 1 Bottom Frame]
mov cx, 275
mov dx, 180
mov bl, 30
call horizontal_line 

    ; [Window 1 Vertical Crossbar]
mov cx, 290          
mov dx, 150
mov bl, 30
call vertical_line

    ; [Window 1 Horizontal Crossbar]
mov cx, 275          
mov dx, 165
mov bl, 30
call horizontal_line

;########## Window 2 (Right) #########

    ; [Window 2 Left Frame]
mov cx, 325          
mov dx, 150
mov bl, 30
call vertical_line   

    ; [Window 2 Right Frame]
mov cx, 355          
mov dx, 150
mov bl, 30
call vertical_line   

    ; [Window 2 Top Frame]
mov cx, 325
mov dx, 150
mov bl, 30
call horizontal_line 

    ; [Window 2 Bottom Frame]
mov cx, 325
mov dx, 180
mov bl, 30
call horizontal_line 

    ; [Window 2 Vertical Crossbar]
mov cx, 340          
mov dx, 150
mov bl, 30
call vertical_line

    ; [Window 2 Horizontal Crossbar]
    mov cx, 325          
    mov dx, 165
    mov bl, 30
    call horizontal_line


; EXIT & HELPER FUNCTIONS


    ; Wait for key press before exiting 
mov ah, 00h
int 16h

    ; Return to text mode (03h)
mov ax, 0003h
int 10h

    ; Exit to DOS
mov ax, 4c00h
int 21h

;############# Functions ###########

horizontal_line: 
int 10h
inc cx
dec bl
jne horizontal_line
ret

vertical_line: 
int 10h
inc dx
dec bl
jne vertical_line
ret      

diagonal_line: 
int 10h
dec cx
inc dx
dec bl
jne diagonal_line
ret

r_diagonal_line:
int 10h
inc cx
inc dx
dec bl
jne r_diagonal_line
ret