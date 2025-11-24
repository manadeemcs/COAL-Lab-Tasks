.MODEL SMALL
.STACK 100H
.DATA
    COLOR EQU 11         

.CODE

PUT_PIXEL MACRO
    MOV AH, 0CH
    MOV AL, COLOR
    INT 10H
ENDM

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 12H
    INT 10H

    CALL DRAW_TABLE_TOP
    CALL DRAW_TABLE_LEGS

    CALL DRAW_BED_HEADBOARD
    CALL DRAW_BED_MATTRESS
    CALL DRAW_BED_LEGS

    MOV AH, 00H
    INT 16H

    MOV AX, 03H
    INT 10H

    MOV AH, 4CH
    INT 21H
MAIN ENDP

DRAW_TABLE_TOP PROC
    
    MOV SI, 200     
    MOV DI, 260     
    MOV BX, 70     
    MOV BP, 230    
    
    MOV CX, 5       

TABLE_LOOP:
    PUSH CX

    MOV CX, BX
    MOV DX, SI
T_TOP:
    PUT_PIXEL
    INC CX
    CMP CX, BP
    JLE T_TOP

    MOV AX, DI
    SUB AX, SI      
    
    MOV CX, BP
    SUB CX, AX      
    PUSH CX         
    
    MOV CX, BX
    SUB CX, AX      
    
    POP AX         
    
    PUSH BX         
    MOV BX, AX      
    
    MOV DX, DI     
T_BOT:
    PUT_PIXEL      
    INC CX
    CMP CX, BX     
    JLE T_BOT
    
    POP BX          

    MOV CX, BX     
    MOV DX, SI      
T_LEFT:
    PUT_PIXEL
    DEC CX        
    INC DX         
    CMP DX, DI
    JLE T_LEFT

    MOV CX, BP     
    MOV DX, SI      
T_RIGHT:
    PUT_PIXEL
    DEC CX      
    INC DX         
    CMP DX, DI
    JLE T_RIGHT

    ADD SI, 6       
    SUB DI, 6       
    ADD BX, 6       
    SUB BP, 6       
    
    POP CX
    DEC CX
    JNZ TABLE_LOOP
    RET
DRAW_TABLE_TOP ENDP

DRAW_TABLE_LEGS PROC
  
    MOV BX, 10      
    MOV SI, 260     
    MOV DI, 340     
    CALL DRAW_ONE_TABLE_LEG

    MOV BX, 160     
    MOV SI, 260     
    MOV DI, 340     
    CALL DRAW_ONE_TABLE_LEG

    MOV BX, 220     
    MOV SI, 200     
    MOV DI, 280     
    CALL DRAW_ONE_TABLE_LEG
    
    MOV BX, 70      
    MOV SI, 260     
    MOV DI, 280     
    CALL DRAW_ONE_TABLE_LEG

    RET
DRAW_TABLE_LEGS ENDP

DRAW_ONE_TABLE_LEG PROC
    PUSH BX
    PUSH SI
    PUSH DI
    PUSH CX
    PUSH DX
    PUSH BP         

    MOV CX, BX
    MOV DX, SI
DTL_V1:
    PUT_PIXEL
    INC DX
    CMP DX, DI
    JLE DTL_V1

    MOV CX, BX
    ADD CX, 10      
    MOV DX, SI
DTL_V2:
    PUT_PIXEL
    INC DX
    CMP DX, DI
    JLE DTL_V2


    MOV CX, BX      
    MOV DX, DI      
    MOV BP, 5       
DTL_VT1:
    PUT_PIXEL
    INC CX
    INC DX
    DEC BP
    JNZ DTL_VT1

    MOV CX, BX
    ADD CX, 10      
    MOV DX, DI      
    MOV BP, 5
DTL_VT2:
    PUT_PIXEL
    DEC CX
    INC DX
    DEC BP
    JNZ DTL_VT2

    POP BP
    POP DX
    POP CX
    POP DI
    POP SI
    POP BX
    RET
DRAW_ONE_TABLE_LEG ENDP

DRAW_BED_HEADBOARD PROC
    MOV SI, 100     
    MOV DI, 220     
    MOV BX, 350     
    MOV BP, 470    
    
    MOV CX, 5

B_HEAD_LOOP:
    PUSH CX
    
    MOV CX, BX
    MOV DX, SI
BH_TOP:
    PUT_PIXEL
    INC CX
    CMP CX, BP
    JLE BH_TOP

    MOV CX, BX
    MOV DX, DI
BH_BOT:
    PUT_PIXEL
    INC CX
    CMP CX, BP
    JLE BH_BOT

    MOV CX, BX
    MOV DX, SI
BH_LEFT:
    PUT_PIXEL
    INC DX
    CMP DX, DI
    JLE BH_LEFT

    MOV CX, BP
    MOV DX, SI
BH_RIGHT:
    PUT_PIXEL
    INC DX
    CMP DX, DI
    JLE BH_RIGHT

    ADD SI, 10
    SUB DI, 10
    ADD BX, 10
    SUB BP, 10
    
    POP CX
    DEC CX
    JNZ B_HEAD_LOOP
    RET
DRAW_BED_HEADBOARD ENDP

DRAW_BED_MATTRESS PROC

    MOV CX, 350
    MOV DX, 220
BM_L_DIAG:
    PUT_PIXEL
    DEC CX
    INC DX
    CMP DX, 320
    JLE BM_L_DIAG

    
    MOV CX, 470
    MOV DX, 220
BM_R_DIAG:
    PUT_PIXEL
    DEC CX
    INC DX
    CMP DX, 320
    JLE BM_R_DIAG

    
    MOV CX, 250
    MOV DX, 320
BM_FRONT:
    PUT_PIXEL
    INC CX
    CMP CX, 370
    JLE BM_FRONT
    RET
DRAW_BED_MATTRESS ENDP

DRAW_BED_LEGS PROC
    MOV BX, 400

    
    MOV CX, 250
    MOV DX, 320
BL_FL1:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_FL1
    
    MOV CX, 260
    MOV DX, 320
BL_FL2:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_FL2
    
    MOV CX, 250
    MOV DX, 400
BL_FL3:
    PUT_PIXEL
    INC CX
    CMP CX, 260
    JLE BL_FL3

   
    MOV CX, 370
    MOV DX, 320
BL_FR1:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_FR1
    
    MOV CX, 360
    MOV DX, 320
BL_FR2:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_FR2
    
    MOV CX, 360
    MOV DX, 400
BL_FR3:
    PUT_PIXEL
    INC CX
    CMP CX, 370
    JLE BL_FR3

    MOV BX, 300
    MOV CX, 470
    MOV DX, 220
BL_BR1:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_BR1
    
    MOV CX, 460
    MOV DX, 220
BL_BR2:
    PUT_PIXEL
    INC DX
    CMP DX, BX
    JLE BL_BR2
    
    MOV CX, 460
    MOV DX, 300
BL_BR3:
    PUT_PIXEL
    INC CX
    CMP CX, 470
    JLE BL_BR3

    RET
DRAW_BED_LEGS ENDP

END MAIN