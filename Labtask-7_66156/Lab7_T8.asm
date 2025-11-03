;task 8
MOV AX, 0F0F0H ;No flags are affected
ADD AL, 0FH    ;CF=0 AF=0 ZF=0 SF=1 PF=1 OF=1
ADD AH, 0F0H   ;CF=1, AF=0, ZF=0, SF=1, PF=0, OF=1
ADD AX, 0F0F0H ;CF=1, AF=1, ZF=0, SF=1, PF=0, OF=1