INCLUDE Irvine32.inc
includelib Winmm.lib


.data

soundtrack db 'playing-pac-man-6783.wav',0
gameoversnd db 'mixkit-arcade-retro-game-over-213.wav',0

PlaySound   PROTO,
   pszSound:PTR BYTE,
   hmod:DWORD,
   fdwSound:DWORD

 t1 byte " ____                  __  __              ",0
 t2 byte "!  _ \ ____  ___      !  \/  ! ____ ____   ",0
 t3 byte "! !_) / _  !/ __!     ! !\/! !/ _  !  _ \  ",0
 t4 byte "!  _/ (_! ! (_ ---- ! !  ! ! (_! ! ! ! ! ",0
 t5 byte "!_!   \____!\___!     !_!  !_!\____!_! !_! ",0
    title1    byte "by: Mishal Ali       22i-1291    Sec:K",0
    nameinput byte "Enter Player: ",0
    inputname db 100 dup(?)
    player byte "Player: ",0
    play2 byte "Mishal",0
    menu     BYTE "PAC-MAN Game Menu", 0
    menuopt1   BYTE "1. Begin To Play", 0
    menuopt2   BYTE "2. Instructions", 0
    menuopt3   BYTE "3. Exit", 0

    instruct   byte "INSTRUCTIONS", 0
    instruct1    BYTE "1. Use the keys 'w', 'a', 's', and 'd' to move your pacman up, left,down and right respectively.", 0
    instruct11   Byte "2. Avoid the walls and ghosts to win.",0
    instruct12  byte "3.Yahoooo!",0
    instruct13   byte "Press any key to Start!",0

    pausedgame BYTE   "Game PAUSED!", 0
    unpausedgame BYTE "              ", 0

    strLevels byte "Level: ",0
    levelatm byte 1
    maze2Display byte 0    ;no overDisplaying 
    maze3Display byte 0   
    
 l1maze1 BYTE "+---------------------------------------------------+"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ! , , , , , !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ! ",167," ",167," ",167," ",167," ",167," !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," !-------- ",167," !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," , , , , , , , ! , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , ! , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!------------------!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , ,!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , ,! , , , , , , , , , , , , , , , ,!"
        BYTE "! -----------------!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , ,!---! , , , , , , , ,!"
        BYTE "! , , , , , , , , , , , , , , ,!   ! , , , , , , , ,!"
        BYTE "! --------! , , , , , , , , , ,!---!, , , , , , , , !"
        BYTE "! , , , , ! , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , !-------, , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , ------------!"
        BYTE "!----!, , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!    !  , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!    ! , , , , , , , , , , , , , , , , , , , , , , ,!"
        BYTE "!    ! , , , , , , , , , , , , , , , , , , , , , , ,!"
        BYTE "!----!, , , , , , , , , , , ,!------------ , , , , ,!"
        BYTE "! , , , , , , , , , , , , , ,!, , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , ,!, , , , , , , , , , , !"
        BYTE "+---------------------------------------------------+", 0 

 l3maze3 BYTE "+---------------------------------------------------+"
        BYTE "!-------! , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! * , , ! , , , , , , , , , , , , , , , , , , , * , !"
        BYTE "! , , , !-----------! , , , , , , , , , ,!----------!"
        BYTE "! , , , , , , , , , ! , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , * , ! , , , , , , , , , , , , , , , !"
        BYTE "!--- , , , ---------! , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , ! , , , , , , , , , , , , , , , * , , , , , , !"
        BYTE "! , , ! , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , !--------!, , , , , , , ,!--------------! , , !"
        BYTE "! , , , , , , ,!, , , , , , , ,!, , , , , , , , , , !"
        BYTE "! , , , , , * ,! , , , , * , , ! , !-------!, , , , !"
        BYTE "! , !----------!, , , , , , , , , ,!* , , ,!, , , , !"
        BYTE "! , , , , , , , , , , , , , , !----!, , ,  !, , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , ,!, , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , ,!, , , , !"
        BYTE "! , , , , , , * , , , , , , , , , , , , , ,!, , , , !"
        BYTE "!------------------!, , , , , , , , , , , , , , , , !"
        BYTE "! * , , , , , , , ,!  , , , , , , , , , * , , , , , !"
        BYTE "!----!, , , , , , ,!, , , , , , , , , , , , , , , , !"
        BYTE "!    !, , , , , , ,!--------! , , , , , , , , , , , !"
        BYTE "!----!, , , , , , , , , * , , , , , , , , , , ----- !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , !-------! , , , , , , , , , , , !------! , , ,!"
        BYTE "! , , ! , * , !------------ , , , , , ! , * ,!-- , ,!"
        BYTE "! * , ! , , , , , , , , , , , , , , , !, , , , , , ,!"
        BYTE "+---------------------------------------------------+", 0 

 l2maze2 BYTE "+---------------------------------------------------+"
        BYTE "! * , , ,!, , , , , * , , , , , , , , , 0 , , , , , !"
        BYTE "! , , 0 ,!--------------! , , , , , , , , , , , , , !"
        BYTE "! , , , )!* , , , , , , !-------------! , , , , , , !"
        BYTE "! , -----!, , , , , , , ! , , , , , , ! , , , , , , !"    
        BYTE "! , , , , , , ,!\ , , , , , , /!, , , ! , !---------!"
        BYTE "! 0 , , , , , ,!,\, , , , , ,/ !, , , , , ! , , , , !"
        BYTE "! , , , , 0 , ,!, \* , , , ,/ *!, , , , , ! ( * , , !"
        BYTE "! , ! , , , , ,!( ,\ , , , /, ,!, , , , , !-----! , !"
        BYTE "! , ! , , , , ,!, , \, , ,/ , ,!, , , , , , , , ! , !"
        BYTE "! , ! , , , , ,!, , ,\---/ , , !, , , , , 0 , , ! , !"
        BYTE "! , ! , , , , ,!, , , * , , , ,!, , , , , , , , , , !"
        BYTE "! , ! , , , , ,!, , , , , , , ,!, , , , , , , , , , !"
        BYTE "! , ! , , , , ,!, , , , , , 0 ,!, , , , , , !-------!"
        BYTE "! * ! , * , , ,!, , , , , , , ,!, , , , , , ! ( , , !"    
        BYTE "! , !-----!, , , , , , , , , , , , , , , , ,! , , , !"
        BYTE "! , , , , , , , , , , , , , , , , ,---------! , , , !"
        BYTE "! , , 0 , ! , , , , , * , , , , , , , , , , , * , , !"
        BYTE "! , , , , ! , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , ) !------------------------------!, , 0 , , !"
        BYTE "! , * , , , , 0 , , , , , ! * , , , , , ,!, , , , , !"
        BYTE "! , , , , , , , , , , , , ! , , , 0 , , ,!, , , , , !"
        BYTE "! , , , , , ,!, , , , , , ! , , , , , , ,!----! , , !"
        BYTE "! , , , , , ,!, , 0 , , , , , ------! , , * ) ! , , !"
        BYTE "! , , * , , ,!, , , , , , , , , , , ! , , , * ! , , !"
        BYTE "!------------!, , , , , , , , , , , !---------! , , !"
        BYTE "! * , , , , )!, , , , , , , , , , , , , , , , , , , !"
        BYTE "! * , , , , , , , , , , , , , , , 0 , , , , , , , , !"
        BYTE "+---------------------------------------------------+", 0 

    total_rows equ 29
    total_columns equ 53
    ONE equ 1 
    zero equ 0 
    gameend byte "CONGRADULATIONS! YOU WON :)",0

    ; Strings for CurrentScore display
    strCurrentScore BYTE "CurrentScore: ",0
    CurrentScore dw 0


    ;lives 
    LivesStr BYTE "Lives: ",0
    str1Lives BYTE "           ",0
    lives BYTE 3
    strGameover BYTE "You Died x____x ",0

    ; Player position
    xPos BYTE 1
    yPos BYTE 2

    ; Coin position
    xCoinPos BYTE 1
    yCoinPos BYTE 3

    ; User input character
    inputChar BYTE ?
    one1 byte 1 
    Ghost1xPos BYTE 1   
    Ghost1yPos BYTE 12  
    Ghost1route BYTE 1 

    Ghost2xPos BYTE 25
    Ghost2yPos BYTE 13
    Ghost2route BYTE 1 

    Ghost22xPos BYTE 10  
    Ghost22yPos BYTE 16   
    Ghost22route BYTE 1 
    
    Ghost31xPos BYTE 1 
    Ghost31yPos BYTE 27 
    Ghost31route BYTE 1 

    Ghost3xPos BYTE 21
    Ghost3yPos BYTE 18
    Ghost3route BYTE 1 

    Ghost33xPos BYTE 1   
    Ghost33yPos BYTE 16  
    Ghost33route BYTE 1 


.code

l3collisioncheck PROC
    mov ax,zero
    mov al, dl     
    
    mov bx,zero
    mov bl, total_columns  

    mul bl
    movsx bx, dh    
    add ax, bx     
    mov al, l2maze2[eax]           

  
    cmp al, '!'
    je  HurdleLocated
    cmp al, '-'
    je  HurdleLocated
    cmp al, '+'
    je  HurdleLocated
    cmp al, '\'
    je  HurdleLocated
    cmp al, '/'
    je  HurdleLocated
     cmp al, '*'
    je  plusoneCurrentScore
    cmp al, '('
    je teleport1
    cmp al, ')'
    je teleport1
    cmp al, '0'
    je HurdleLocated

    ; Wall collision not found
    mov ah, ONE
    ret

HurdleLocated:
    mov ah,zero
    ret

plusoneCurrentScore:
mov ah,2
ret


teleport1:
mov ah,3
ret

l3collisioncheck ENDP

l2collisioncheck PROC
    mov ax,zero
    
    mov al, dl      
    mov bx,zero
    mov bl, total_columns  
    mul bl
    movsx bx, dh   
    add ax, bx      
    mov al, l3maze3[eax]           
    cmp al, '!'
    je  HurdleLocated
    cmp al, '-'
    je  HurdleLocated
    cmp al, '+'
    je  HurdleLocated
     cmp al, '\'
    je  HurdleLocated
    cmp al, '/'
    je  HurdleLocated
    cmp al, '*'
    je  plusoneCurrentScore

    ; Wall collision not found
    mov ah, 1
    ret

HurdleLocated:
    mov ah,zero
    ret

plusoneCurrentScore:
mov ah,2
ret
l2collisioncheck ENDP

l1collisioncheck PROC
    cmp levelatm,ONE
    je level1
    cmp levelatm,2
    je level2
    cmp levelatm,3
    je level3

    LEVEL2: 
    call l2collisioncheck
    ret

    LEVEL3: 
    call l3collisioncheck
    ret
    
    level1:
    mov ax,zero
    mov al, dl      
    
    mov bx,zero
    mov bl, total_columns  

    mul bl
    movsx bx, dh    
    add ax, bx      
    mov al, l1maze1[eax]

  
    cmp al, '!'
    je  HurdleLocated
    cmp al, '-'
    je  HurdleLocated
    cmp al, '+'
    je  HurdleLocated
    cmp al, '\'
    je  HurdleLocated
    cmp al, '/'
    je  HurdleLocated
   

    ;no collision
    mov ah, ONE
    ret

HurdleLocated:
    mov ah,zero
    ret

l1collisioncheck ENDP

main PROC
    
  call ClearScreen

    call mainscreen
    call ReadChar

    call ClearScreen
    call ShowMenu

   
    call ReadChar

    ; Check user input 
    cmp al, '1'
    je StartGame
    cmp al, '2'
    je ShowInstructions
    cmp al, '3'
    je exitGame

ShowInstructions:  
   mov eax, red
   call SetTextColor
   call ClearScreen
    
    mov dl,40
    mov dh,4
    call Gotoxy
    mov edx, OFFSET instruct
    call WriteString
    
    mov dl,4
    mov dh,8
    call Gotoxy
    mov edx, OFFSET instruct1
    call WriteString
    
    mov dl,4
    mov dh,9
    call Gotoxy
    mov edx, OFFSET instruct11
    call WriteString
    
    mov dl,4
    mov dh,10
    call Gotoxy
    mov edx, OFFSET instruct12
    call WriteString
   
    mov dl,4
    mov dh,12
    call Gotoxy
    mov edx, OFFSET instruct13
    call WriteString
    call crlf
    
    call ReadChar
    call ClearScreen
    cmp one1,1

    je StartGame



StartGame:
INVOKE PlaySound, OFFSET soundtrack, NULL, 11

 mov eax,blue 
 call SetTextColor   
    
    call ClearScreen
    call mazelevel1
   
    call DisplayPlayer
    call CreateRandomCoin
    call DisplayCoin

    call Randomize


    ; Main game loop
    gameLoop:
    
        checklevel:
        cmp CurrentScore,5
        jg ProceedToLTwo
        cmp CurrentScore,15
        jg ProceedToLThree
        cmp CurrentScore,30
        jg FinshGame
        cmp one1,1
        je moveon2 

        ProceedToLTwo:
        cmp CurrentScore, 15
        jg ProceedToLThree
        
        
        mov levelatm,2
        cmp one1,1
        je moveon2 

        ProceedToLThree:
        cmp CurrentScore,30
        jg FinshGame

        mov levelatm,3
        cmp one1,1
        je moveon2 
        
        moveon2:
        cmp levelatm,ONE
        je Displaymazeone
        cmp levelatm,2
        je Displaymazetwo
        cmp levelatm,3
        je Displaymazethree
       
        Displaymazeone:
        call l1GhostproceedY
        jmp movetoGame
    
        Displaymazetwo:
        call mazelevel2 
        call l3GhostproceedY
        call l33GhostproceedY
        cmp one1,1
        je movetoGame

        Displaymazethree:
        call mazelevel3
        call l31GhostproceedY
        call l2GhostproceedY
        call l22GhostproceedY
        cmp one1,1
        je movetoGame
        
       FinshGame:
        call ClearScreen
        mov eax, green
        call SetTextColor
        mov dl,50
        mov dh,1
        call Gotoxy
        mov edx, offset gameend
        call WriteString 
        mov dl,50
        mov dh,8
        call Gotoxy
        mov edx, offset strCurrentScore
        call WriteString
        movzx eax, CurrentScore
        call WriteInt
         loop1:
         call ReadChar
        cmp al, "p"
        je exitGame


        movetoGame:
        ;coin collection
        mov bl, xPos
        cmp bl, xCoinPos
        jne notCollecting
        mov bl, yPos
        cmp bl, yCoinPos
        jne notCollecting
        ; Player is intersecting coin
        add CurrentScore, 5
        call CreateRandomCoin
        call DisplayCoin
        notCollecting:

        ; Set text color to white on black for player and coin
        mov eax, white+(black * 16)
        call SetTextColor

        

         ; Display lives 
        mov dl, 60
        mov dh, 7
        call Gotoxy
        mov edx, OFFSET LivesStr
        call WriteString
        mov al, lives
        call WriteInt
        ; Display CurrentScore
        mov dl, 60
        mov dh, 5
        call Gotoxy
        mov edx, OFFSET strCurrentScore
        call WriteString
        movzx eax, CurrentScore
        call WriteInt
        ;Display levels
        mov dl,60
        mov dh,9
        call Gotoxy
        mov edx, offset strLevels
        call  WriteString
        mov al, levelatm
        call WriteInt

        ; Get user key input
        call ReadChar
        mov inputChar, al

        ; Exit game if user types 'x'
        cmp inputChar, "x"
        je exitGame

        ; Player movement based on input
        cmp inputChar, "w"
        je moveUp

        cmp inputChar, "s"
        je moveDown

        cmp inputChar, "a"
        je Go_Left

        cmp inputChar, "d"
        je GO_RIGHT

        cmp inputChar, "p"
        jne PauseMenu

    PauseMenu:
        
        call pausescreen
        

    moveUp:
        call ClearPlayer
        dec yPos
        
        
        mov dx,zero
        mov dl,yPos
        mov dh,xPos
        call l1collisioncheck
        cmp ah, 0
        je reverseup
        cmp ah,2
        je plusone
        cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        cmp one1,1
        je gameLoop

        reverseup:
        inc yPos    ;return
        call DisplayPlayer
        cmp one1,1 
        je gameLoop

    moveDown:
        call ClearPlayer
        add yPos,ONE
        
        mov dx,zero
        mov dl,yPos
        mov dh,xPos
        call l1collisioncheck 
        cmp ah, 0
        je reversedown
        cmp ah,2
        je plusone
         cmp ah,3
        je teleportation1
       

        call DisplayPlayer
        cmp one1,1
        je gameLoop

        reversedown:
        dec yPos    ;return
        call DisplayPlayer
         
        jmp gameLoop

    Go_Left:
        call ClearPlayer
        dec xPos
        
        mov dx,zero
        mov dl,yPos
        mov dh,xPos
        call l1collisioncheck
        cmp ah, 0
        je reverseleft
         cmp ah,2
        je plusone
         cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        
        jmp gameLoop

        reverseleft:
            inc xPos    ;return
            call DisplayPlayer
             
            jmp gameLoop

    GO_RIGHT:
        call ClearPlayer
        inc xPos
        
        mov dx,zero
        mov dl,yPos
        mov dh,xPos
        call l1collisioncheck
        cmp ah, 0
        je reverseright
         cmp ah,2
        je plusone
         cmp ah,3
        je teleportation1
       
        call DisplayPlayer
        
        jmp gameLoop
        reverseright:
            dec xPos    ;return
            call DisplayPlayer
             
            jmp gameLoop

    jmp gameLoop

plusone:
add CurrentScore,2
jmp notCollecting

teleportation1:
 mov eax, total_rows -2     
  call RandomRange
  mov yPos, al

 mov eax, total_columns-2   
 call RandomRange
    mov xPos, al

    call ClearPlayer
    call DisplayPlayer
   
jmp gameLoop


exitGame:
    exit
main ENDP


ClearScreen PROC
    mov eax, 0 
    call Clrscr
    ret
ClearScreen ENDP


mazelevel1 PROC
    mov dx,zero   ; col

    Displayraw:
        mov dh, 0   ; reset col

    Displaycolumn:
        
        call l1collisioncheck; return char in al
         
        call WriteChar

        inc dh  ; next column
        cmp dh, total_columns 
        jl Displaycolumn 

        call crlf 
        inc dl
        cmp dl, total_rows
        jl Displayraw  

        ret
mazelevel1 ENDP

mazelevel2 PROC
    cmp maze2Display,ONE
    je DontDisplaying
    
    call clrscr
    mov maze2Display,ONE     ;so doesntDisplay again 
    mov dx,zero
    
    Displayraw:
        mov dh, 0  
    Displaycolumn:
        call l2collisioncheck
        call WriteChar
      
      inc dh  ; \ next column
        cmp dh, total_columns 
        jl Displaycolumn  
        call crlf    ; next row
        inc dl
        cmp dl, total_rows
        jl Displayraw  ; Jump if less than total_rows
        call DisplayCoin
        ret
        DontDisplaying:
        ret

mazelevel2 ENDP

mazelevel3 PROC
     cmp maze3Display,ONE
     je DontDisplaying

    
    call clrscr
    mov maze3Display,ONE 
    mov dx,zero  
    Displayraw:
        mov dh, 0  
    Displaycolumn:
        call l3collisioncheck
        call WriteChar
        INC dh  ; Move to the next column
        cmp dh, total_columns  ; Compare the current column (dh) with the total columns (total_columns
        jl Displaycolumn  ; Jump if less than total_columns
        call Crlf ; Move to the next row
        inc dl
        cmp dl, total_rows
        jl Displayraw  ; Jump if less than total_rows
        call DisplayCoin
        ret
    DontDisplaying:
        ret
mazelevel3 ENDP

mainscreen PROC
    mov eax, red 
    call SetTextColor

    mov dl, 39 
    mov dh,ONE
    call Gotoxy
    mov edx, OFFSET t1
    call WriteString
    mov dl, 39 
    mov dh,2
    call Gotoxy
    mov edx, OFFSET t2
    call WriteString
     mov dl, 39 
    mov dh,3
    call Gotoxy
    mov edx, OFFSET t3
    call WriteString
     mov dl, 39 
    mov dh,4
    call Gotoxy
    mov edx, OFFSET t4
    call WriteString
      mov dl, 39 
    mov dh,5
    call Gotoxy
    mov edx, OFFSET t5
    call WriteString
    mov dl,42
    mov dh, 6
    call Gotoxy
    mov edx, OFFSET title1
    call WriteString

    mov dl,45
    mov dh,15
    call Gotoxy
    mov edx, offset nameinput
    call WriteString
    mov edx, offset inputname
    mov ecx, 100
    call ReadString

    ret
mainscreen ENDP

ShowMenu PROC
    mov eax, red 
    call SetTextColor
  
    mov dl, 45 
    mov dh,ONE
    call Gotoxy
    mov edx, OFFSET menu
    call WriteString
    mov dl, 4
    mov dh,7
    call Gotoxy
    mov edx, OFFSET menuopt1
    call WriteString
   mov dl, 4 
    mov dh,8
    call Gotoxy
    mov edx, OFFSET menuopt2
    call WriteString
     mov dl, 4
    mov dh,9
    call Gotoxy
    mov edx, OFFSET menuopt3
    call WriteString

  
    ret
ShowMenu ENDP



pausescreen PROC
    mov dl, 60
    mov dh, 20
    call Gotoxy
    mov edx, OFFSET pausedgame
    call WriteString
     menuLoop:
        call ReadChar
        
        jmp startGame
        
    startGame:
        mov dl, 60
        mov dh, 20
        call Gotoxy
        mov edx, OFFSET unpausedgame
        call WriteString
        ret
pausescreen ENDP


DisplayPlayer PROC
    ; Display player at (xPos, yPos)
    mov eax, green
    call SetTextColor
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, "C"
    call WriteChar
    ret
DisplayPlayer ENDP

ClearPlayer PROC
    ; Clear player's current position
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, " "
    call WriteChar
    ret
ClearPlayer ENDP

DisplayCoin PROC
    ; Display coin at (xCoinPos, yCoinPos)
    mov eax, yellow
    call SetTextColor
    mov dl, xCoinPos
    mov dh, yCoinPos
    call Gotoxy
    mov al, "$"
    call WriteChar
    ret
DisplayCoin ENDP

CreateRandomCoin PROC
 
    mov eax, total_rows -2     
    call RandomRange
    mov yCoinPos, al
    mov bl,Ghost1yPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost2yPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost22yPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost3yPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost33yPos
    cmp bl,al
    je Clearcoin
    mov bl,Ghost31yPos
    cmp bl,al
    je Clearcoin

    mov eax, total_columns-2   
    call RandomRange
    mov xCoinPos, al
    mov bl,Ghost1xPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost2xPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost22xPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost3xPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost33xPos
    cmp bl,al
    je Clearcoin
     mov bl,Ghost31xPos
    cmp bl,al
    je Clearcoin
    
    ;collision of coin n wall 
    mov dl,yCoinPos
    mov dh,xCoinPos
    call l1collisioncheck   
    cmp ah, 0
    je Clearcoin
    ret

Clearcoin:
    call CreateRandomCoin  ;recursive 
    ret
    
CreateRandomCoin ENDP


DisplayGhosty1 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost1xPos
    mov dh, Ghost1yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhosty1 ENDP

DisplayGhostyTwo PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost2xPos
    mov dh, Ghost2yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyTwo ENDP

DisplayGhostyTwo2 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost22xPos
    mov dh, Ghost22yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyTwo2 ENDP

DisplayGhostyThree PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost3xPos
    mov dh, Ghost3yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyThree ENDP

DisplayGhostyThree3 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost33xPos
    mov dh, Ghost33yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyThree3 ENDP

DisplayGhostyThree1 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost31xPos
    mov dh, Ghost31yPos
    call Gotoxy
    mov al, "E"
    call WriteChar

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyThree1 ENDP

ClearGhosty PROC
  ;reset pos
    mov dl, Ghost1xPos
    mov dh, Ghost1yPos
    call Gotoxy
   
   mov al, " "
   call WriteChar
    ret
ClearGhosty ENDP

ClearGhostyTwo PROC
  ;reset pos
    mov dl, Ghost2xPos
   mov dh, Ghost2yPos
   call Gotoxy
   mov al, " "
   call WriteChar
    ret
ClearGhostyTwo ENDP

ClearGhostyTwo2 PROC
  ;reset pos
    mov dl, Ghost22xPos
    mov dh, Ghost22yPos
    call Gotoxy
   
   mov al, " "
   call WriteChar
    ret
ClearGhostyTwo2 ENDP

ClearGhostyThree PROC
  ;reset pos
    mov dl, Ghost3xPos
    mov dh, Ghost3yPos
    call Gotoxy
   
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree ENDP

ClearGhostyThree3 PROC
  ;reset pos
   mov dl, Ghost33xPos
   mov dh, Ghost33yPos
   call Gotoxy
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree3 ENDP

ClearGhostyThree1 PROC
  ;reset pos
    mov dl, Ghost31xPos
    mov dh, Ghost31yPos
    call Gotoxy
   
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree1 ENDP


livesClear PROC
    dec lives
    cmp lives, 0
    jle gameup
    ret

gameup:
 

    INVOKE PlaySound, OFFSET gameoversnd, NULL, 11

  call ClearScreen
  mov eax, red
  call SetTextColor
  
  mov dl,50
  mov dh,ONE
   call Gotoxy
  mov edx, offset strgameover
  call WriteString

  mov dl,50
  mov dh,6
  call Gotoxy
  mov edx, offset player
  call WriteString
  mov dl,60
  mov dh,6
  call Gotoxy
  mov edx, offset play2
  call WriteString

  mov dl,50
  mov dh,8
  call Gotoxy
  mov edx, offset strCurrentScore
  call WriteString
  movzx eax, CurrentScore
  call WriteInt

    
    loop1:
        call ReadChar
        cmp al, "p"
        je exitgame
        loop loop1 
   
   exitgame:
    exit
livesClear ENDP

l1GhostproceedY PROC
    
    
    mov dl, Ghost1yPos  
    mov dh, Ghost1xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhosty  
                 
     mov cl,Ghost1route
     cmp cl,zero
     je GO_RIGHT  
     jg Go_Left   
     
     GO_RIGHT:
        inc Ghost1xPos  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost1yPos
        mov dh,Ghost1xPos
        call l1collisioncheck
        cmp ah, 0   ;hurdle found
        je routetleft
        
        call DisplayGhosty1
        
        ret

    Go_Left:
        sub Ghost1xPos,1
      
        mov dx,zero
        mov dl,Ghost1yPos
        mov dh,Ghost1xPos
        call l1collisioncheck
        cmp ah, 0   ; hurdle found
        je routetright
        call DisplayGhosty1
        
        ret

        routetright:
        inc Ghost1xPos 
        xor cl,ONE 
        mov Ghost1route,cl
        call DisplayGhosty1
        
        ret

        routetleft:
        dec Ghost1xPos 
        xor cl,ONE 
        mov Ghost1route,cl
        call DisplayGhosty1
        
        ret

l1GhostproceedY ENDP 

l2GhostproceedY PROC
    
    
    mov dl, Ghost2yPos  
    mov dh, Ghost2xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhostyTwo  
                 
     mov cl,Ghost2route
     cmp cl,zero
     je Moveup  
     jg Movedown  
     
     Moveup:
        inc Ghost2yPos  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost2yPos
        mov dh,Ghost2xPos
        call l3collisioncheck
        cmp ah, 0   ;hurdle found
        je routetdown
        
        call DisplayGhostyTwo
        
        ret

    Movedown:
        dec Ghost2yPos
      
        mov dx,zero
        mov dl,Ghost2yPos
        mov dh,Ghost2xPos
        call l3collisioncheck
        cmp ah, 0   ; hurdle found
        je routetup
        call DisplayGhostyTwo
        
        ret

        routetup:
        inc Ghost2yPos 
        xor cl,ONE 
        mov Ghost2route,cl
        call DisplayGhostyTwo
        
        ret

        routetdown:
        dec Ghost2yPos 
        xor cl,ONE 
        mov Ghost2route,cl
        call DisplayGhostyTwo
        
        ret

l2GhostproceedY ENDP

l22GhostproceedY PROC
    
    
    mov dl, Ghost22yPos  
    mov dh, Ghost22xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhostyTwo2  
                 
     mov cl,Ghost22route
     cmp cl,zero
     je GO_RIGHT  
     jg Go_Left   
     
     GO_RIGHT:
        inc Ghost22xPos  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost22yPos
        mov dh,Ghost22xPos
        call l3collisioncheck
        cmp ah, 0   ;hurdle found
        je routetleft
        
        call DisplayGhostyTwo2
        
        ret

    Go_Left:
        dec Ghost22xPos
      
        mov dx,zero
        mov dl,Ghost22yPos
        mov dh,Ghost22xPos
        call l3collisioncheck
        cmp ah, 0   ; hurdle found
        je routetright
        call DisplayGhostyTwo2
        
        ret

        routetright:
        inc Ghost22xPos 
        xor cl,ONE 
        mov Ghost22route,cl
        call DisplayGhostyTwo2
        
        ret

        routetleft:
        dec Ghost22xPos 
        xor cl,ONE 
        mov Ghost22route,cl
        call DisplayGhostyTwo2
        
        ret

l22GhostproceedY ENDP 

l3GhostproceedY PROC
    
    
    mov dl, Ghost3yPos  
    mov dh, Ghost3xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhostyThree  
                 
     mov cl,Ghost3route
     cmp cl,zero
     je Moveup  
     jg Movedown  
     
     Moveup:
        inc Ghost3yPos  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost3yPos
        mov dh,Ghost3xPos
        call l2collisioncheck
        cmp ah, 0   ;hurdle found
        je routetdown
        
        call DisplayGhostyThree
        
        ret

    Movedown:
        dec Ghost3yPos
      
        mov dx,zero
        mov dl,Ghost3yPos
        mov dh,Ghost3xPos
        call l2collisioncheck
        cmp ah, 0   ; hurdle found
        je routetup
        call DisplayGhostyThree
        
        ret

        routetup:
        inc Ghost3yPos 
        xor cl,ONE 
        mov Ghost3route,cl
        call DisplayGhostyThree
        
        ret

        routetdown:
        dec Ghost3yPos 
        xor cl,ONE 
        mov Ghost3route,cl
        call DisplayGhostyThree
        
        ret

l3GhostproceedY ENDP

l33GhostproceedY PROC
    
    
    mov dl, Ghost33yPos  
    mov dh, Ghost33xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhostyThree3
                 
     mov cl,Ghost33route
     cmp cl,zero
     je GO_RIGHT  
     jg Go_Left   
     
     GO_RIGHT:
        inc Ghost33xPos  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost33yPos
        mov dh,Ghost33xPos
        call l2collisioncheck
        cmp ah, 0   ;hurdle found
        je routetleft
        
        call DisplayGhostyThree3
        
        ret

    Go_Left:
        dec Ghost33xPos
      
        mov dx,zero
        mov dl,Ghost33yPos
        mov dh,Ghost33xPos
        call l2collisioncheck
        cmp ah, 0   ; hurdle found
        je routetright
        call DisplayGhostyThree3
        
        ret

        routetright:
        inc Ghost33xPos 
        xor cl,ONE 
        mov Ghost33route,cl
        call DisplayGhostyThree3
        
        ret

        routetleft:
        dec Ghost33xPos 
        xor cl,ONE 
        mov Ghost33route,cl
        call DisplayGhostyThree3
        
        ret

l33GhostproceedY ENDP 

l31GhostproceedY PROC
    
    
    mov dl, Ghost31yPos  
    mov dh, Ghost31xPos 
    mov cl, yPos        
    mov ch, xPos        
    cmp cx, dx         
    jne collidednot    
    cmp ch, dh         
    jne collidednot    
    call livesClear
   
   collidednot:
    

  
     call ClearGhostyThree1
                 
     mov cl,Ghost31route
     cmp cl,zero
     je GO_RIGHT  
     jg Go_Left   
     
     GO_RIGHT:
        add Ghost31xPos,ONE  
        ;check for hurdle
        mov dx,zero
        mov dl,Ghost31yPos
        mov dh,Ghost31xPos
        call l3collisioncheck
        cmp ah, 0   ;hurdle found
        je routetleft
        
        call DisplayGhostyThree1
        
        ret

    Go_Left:
        dec Ghost31xPos
      
        mov dx,zero
        mov dl,Ghost31yPos
        mov dh,Ghost31xPos
        call l3collisioncheck
        cmp ah, 0   ; hurdle found
        je routetright
        call DisplayGhostyThree1
        
        ret

        routetright:
        inc Ghost31xPos 
        xor cl,ONE 
        mov Ghost31route,cl
        call DisplayGhostyThree1
        
        ret

        routetleft:
        dec Ghost31xPos 
        xor cl,ONE 
        mov Ghost31route,cl
        call DisplayGhostyThree1
        
        ret
l31GhostproceedY endp
    
end main 