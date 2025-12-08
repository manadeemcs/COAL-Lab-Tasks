
name "snake"

org     100h

;going to start label
jmp     start

;this si the data section

s_size  equ     7

; the snake coordinates
; (from head to tail)
; low byte is left, high byte
; is top - [top, left]
snake dw s_size dup(0)

tail    dw      ?

; directions vios keys for left,right,up and down...
left    equ     4bh
right   equ     4dh
up      equ     48h
down    equ     50h

;current snake direction is right
cur_dir db      right

wait_time dw    0

;welcome messege and rules of the game
msg1 	db "=========== Snake Game ===========", 0dh,0ah
	db "                                  ", 0dh,0ah
	db "=================Rules================", 0dh,0ah

	db "Eat EveryThing in the Screen and Clear the Screen.", 0dh,0ah, 0ah
	
	db "Press UP ARROW to Go UPWORD", 0dh,0ah
	db "Press DOWN ARROW to Go DOWNWORD", 0dh,0ah, 0ah
	
	db "Press LEFT ARROW to Go LEFT", 0dh,0ah	
	db "Press RIGHT ARROW to Go RIGHT", 0dh,0ah, 0ah
	
	db "======================================", 0dh,0ah, 0ah
	db "Press ESC to EXIT the Game", 0dh,0ah
	db "======================================", 0dh,0ah, 0ah
	db "Press ANY KEY to START the Game...$"
	
msg2 db ""
	 db "This is a snake game, COAL project",0dh,0ah
	 db " made by Muhammad Abdullah 66156",0dh,0ah
	 db " the goal is to eat the screen and clear the screen ", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah	
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................", 0dh,0ah
	 db "..................................................$"	

;code section starts from here-

start:

; Printing the welcome msg....
mov dx, offset msg1 ; It gets the msg1 in data section and moves it to dx register 
;this two lines are to print the msg 
mov bl,2
mov ah,9
int 10h
int 21h 


; waiting for any key to start.... 
;this is an interrupt command where ah holds the BIOS scan code.
;and al holds the ascii code.
mov ah, 00h
int 16h   


;to clear the sceen we use this interrupt command
	mov ax, 03H
	int 10H

;printing the game background which the user have to clean.
mov dx, offset msg2; It gets the msg2 in data section and moves it to dx register 
mov ah, 9 
int 21h 	
	

;hiding the cursor blinking text cursor....
;this is an interrupt command where ch and cl indicates cursor satrt line
;and bottom cursor line respectively.
mov     ah, 1
mov     ch,2bh
mov     cl,0bh
int     10h           


game_loop:


;showing the new head of the snake...
mov     dx, snake[0]

;setting cursor possition where dh indicates row and dl column...
mov     ah, 02h
int     10h

;printing * at the location we set the cursor...
mov     al, '*' ;character to display
mov     ah, 09h
;bl defines the attribute,means which color you want
;for each color there is a representative code.like for green 2,red 4 and yelllow e.
mov     bl, 0ch 
mov     cx, 1  ; number of time to write the character
int     10h

;saving the tail
mov     ax, snake[s_size * 2 - 2];setting the tail
mov     tail, ax;saving the tail

call    move_snake


;========hiding old tail==========
mov     dx, tail

; set cursor at the tail..
mov     ah, 02h
int     10h

; printing ' ' at the tail,means hiding the tail..
mov     al, ' '
mov     ah, 09h
mov     bl, 0eh ;indicates attribute. to know detail go to line 130
mov     cx, 1   ;number of times to write the character
int     10h



check_for_key:

;=======checking if any command user gives...
;after executing this interrupt 
;it saves the bios scan code in ah and ascii code in al
mov     ah, 01h
int     16h
jz      no_key ;jump if zero,means if ZF=1 then it will jump otherwise not.

;if yes then which key? saves the ascii code in al..
mov     ah, 00h
int     16h
;dis user press esc??
cmp     al, 1bh    ; 
je      stop_game  ;
;setting the cursor...
mov     cur_dir, ah

no_key:



; this interrupt is about getting the system time...
; get the  number of clock ticks..
;returns CX:DX = number of clock ticks since midnight.
mov     ah, 00h
int     1ah
;comparing the given time with wait_time
cmp     dx, wait_time
jb      check_for_key;Jump if first operand is Below second operand.if CF=1 then it will jump.
add     dx, 4
mov     wait_time, dx



;GAME LOOP
jmp     game_loop


stop_game:

;showing cursor back..
mov     ah, 1
mov     ch, 0bh
mov     cl, 0bh
int     10h

ret

; ***** Movement Procedure *****

; Operation for moving the snake
; Create new head 
; Clear the tail(old tail) 
; [last part (tail)]-> goes away
; [part i] -> [part i+1]
; ....

move_snake proc near

  ; set es to bios info segment  
mov     ax, 40h
mov     es, ax

  ; Identifing the snake tail position
  ; point di to tail
  mov   di, s_size * 2 - 2
  
  ; moving the whole snake
  ; Loop for moving each star in its next one position
  ; By removing last star and add star in directed position
  mov   cx, s_size-1
move_array:       
  mov   ax, snake[di-2]
  mov   snake[di], ax
  sub   di, 2
  loop  move_array

   ; user given option is compared here
   ; Jump according to the given instruction
   ; otherwise just move straight
cmp     cur_dir, left
  je    move_left
cmp     cur_dir, right
  je    move_right
cmp     cur_dir, up
  je    move_up
cmp     cur_dir, down
  je    move_down

jmp     stop_move       ; when no instruction is given

 ; Operation if user Press LEFT ARROW
 ; moving the snake one step left
 ; if it is last then move it to the right side of the display
move_left:
  mov   al, b.snake[0]
  dec   al
  mov   b.snake[0], al
  cmp   al, -1
  jne   stop_move       
  mov   al, es:[4ah]    ; col number.
  dec   al
  mov   b.snake[0], al  ; return to right.
  jmp   stop_move

  ; Operation if user Press RIGHT ARROW
  ; moving the snake one step right
 ; if it is last then move it to the left side of the display
move_right:
  mov   al, b.snake[0]
  inc   al
  mov   b.snake[0], al
  cmp   al, es:[4ah]    ; col number.   
  jb    stop_move
  mov   b.snake[0], 0   ; return to left.
  jmp   stop_move

  ; Operation if user Press UPWORD ARROW
  ; moving the snake one step upword
 ; if it is last then move it to the bottom side of the display
move_up:
  mov   al, b.snake[1]
  dec   al
  mov   b.snake[1], al
  cmp   al, -1
  jne   stop_move
  mov   al, es:[84h]    ; row number -1.
  mov   b.snake[1], al  ; return to bottom.
  jmp   stop_move

  ; Operation if user Press DOWNWORD ARROW
  ; moving the snake one step downword
 ; if it is last then move it to the top side of the display
move_down:
  mov   al, b.snake[1]
  inc   al
  mov   b.snake[1], al
  cmp   al, es:[84h]    ; row number -1.
  jbe   stop_move
  mov   b.snake[1], 0   ; return to top.
  jmp   stop_move

   ;this is to return to the main proc
stop_move:
  ret
move_snake endp