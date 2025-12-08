.MODEL SMALL
.STACK 100h

.DATA
    
    name_buffer_struct  DB 31, 0, 31 DUP(' ') 
    id_buffer_struct    DB 11, 0, 11 DUP(' ')
    
    prompt_name         DB 0DH, 0AH, 'Enter Name (Max 30 chars): ', '$'
    prompt_id           DB 0DH, 0AH, 'Enter SapID (Max 10 chars): ', '$'
    
    separator_msg       DB 0DH, 0AH, '*******************', 0DH, 0AH, '$'
    
    output_name_prefix  DB 0DH, 0AH, 'Name: ', '$'
    output_id_prefix    DB 0DH, 0AH, 'SapID: ', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
        
    LEA DX, prompt_name
    MOV AH, 09h
    INT 21h
        
    LEA DX, name_buffer_struct
    MOV AH, 0Ah 
    INT 21h
   
    LEA DX, prompt_id
    MOV AH, 09h
    INT 21h
      
    LEA DX, id_buffer_struct
    MOV AH, 0Ah 
    INT 21h
  
    PUSH CX  
    PUSH SI  
       
    MOV BL, name_buffer_struct + 1  
    MOV BH, 0                       
    LEA SI, name_buffer_struct + 2  
    ADD SI, BX                      
    MOV BYTE PTR [SI], '$'          
        
    MOV BL, id_buffer_struct + 1    
    MOV BH, 0
    LEA SI, id_buffer_struct + 2    
    ADD SI, BX                      
    MOV BYTE PTR [SI], '$'          
    
    POP SI
    POP CX 
    
    CALL print_info 
       
    LEA DX, separator_msg
    MOV AH, 09h
    INT 21h
    
    CALL print_info 
    
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

print_info PROC
    PUSH AX
    PUSH DX
    
    LEA DX, output_name_prefix
    MOV AH, 09h
    INT 21h
    
    
    LEA DX, name_buffer_struct + 2
    MOV AH, 09h
    INT 21h

    
    LEA DX, output_id_prefix
    MOV AH, 09h
    INT 21h
    
    
    LEA DX, id_buffer_struct + 2
    MOV AH, 09h
    INT 21h
    
    POP DX
    POP AX
    RET
print_info ENDP

END MAIN