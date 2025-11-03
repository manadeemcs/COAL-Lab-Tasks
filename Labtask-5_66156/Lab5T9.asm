org 100h         ;Set the origin (starting address) of the code to Øx180, as required by CoM files
mov ax,3         ; Move the value 3 into the AX register
cmp ax,6         ; Compare the value in AX (which is 3) with 6
js add           ;Jump to 'add' label if the result of comparison is "less than" (signed comparisom)
jns exit         ;Jump to 'exit' label if if the the result of comparison is "not negative" (AX >= 0) comparison) 
add:             ;Label 'add'- this is the target of the 'js' jump if AX 6 
mov ax,2         ;Move the value 2 into AX register (this is executed if AX ( 6) 
exit:            ; Label 'exit'- this is the target of the 'jns' jump if AX > or after the 'add' block
mov ax,0x4c00    ;Set AX to Øx4C00 (this is a DOS function code to terminate the program) 
int 0x21         ; Call interrupt Øx21, which ch is is a DOS systen call to terminate the program



