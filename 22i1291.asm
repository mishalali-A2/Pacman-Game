
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
 t4 byte "!  / (_! ! ( |___ --  ! !  ! ! (_! ! ! ! ! ",0
 t5 byte "!_!   \____!\___!     !_!  !_!\____!_! !_! ",0
    title1    byte "by: Mishal Ali       22i_1291    Sec:K",0
    nameinput byte "Enter Player: ",0
    inputname db 100 dup(?)
    player byte "Player: ",0
    play2 byte "Mishal",0
    menu     BYTE "PAC_MAN Game Menu", 0
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
    
l1maze1 BYTE "+___________________________________________________+"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ! , , , , , !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ! ",167," ",167," ",167," ",167," ",167," !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," !________ ",167," !"
        BYTE "! ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," ",167," , , , , , , , ! , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , ! , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!__________________!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , ,!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , ,! , , , , , , , , , , , , , , , ,!"
        BYTE "! _________________!, , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , ,!___! , , , , , , , ,!"
        BYTE "! , , , , , , , , , , , , , , ,!   ! , , , , , , , ,!"
        BYTE "! ________! , , , , , , , , , ,!___!, , , , , , , , !"
        BYTE "! , , , , ! , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , !_______, , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , ____________!"
        BYTE "!____!, , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!    !  , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "!    ! , , , , , , , , , , , , , , , , , , , , , , ,!"
        BYTE "!    ! , , , , , , , , , , , , , , , , , , , , , , ,!"
        BYTE "!___!, , , , , , , , , , , ,!___________ , , , , ,!"
        BYTE "! , , , , , , , , , , , , , ,!, , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , ,!, , , , , , , , , , , !"
        BYTE "+___________________________________________________+", 0 

 l3maze3 BYTE "+___________________________________________________+"
        BYTE "!_______! , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! * , , ! , , , , , , , , , , , , , , , , , , , * , !"
        BYTE "! , , , !___________! , , , , , , , , , ,!__________!"
        BYTE "! , , , , , , , , , ! , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , * , ! , , , , , , , , , , , , , , , !"
        BYTE "!___ , , , _________! , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , ! , , , , , , , , , , , , , , , * , , , , , , !"
        BYTE "! , , ! , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , !________!, , , , , , , ,!______________! , , !"
        BYTE "! , , , , , , ,!, , , , , , , ,!, , , , , , , , , , !"
        BYTE "! , , , , , * ,! , , , , * , , ! , !_______!, , , , !"
        BYTE "! , !__________!, , , , , , , , , ,!* , , ,!, , , , !"
        BYTE "! , , , , , , , , , , , , , , !____!, , ,  !, , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , ,!, , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , ,!, , , , !"
        BYTE "! , , , , , , * , , , , , , , , , , , , , ,!, , , , !"
        BYTE "!__________________!, , , , , , , , , , , , , , , , !"
        BYTE "! * , , , , , , , ,!  , , , , , , , , , * , , , , , !"
        BYTE "!____!, , , , , , ,!, , , , , , , , , , , , , , , , !"
        BYTE "!    !, , , , , , ,!________! , , , , , , , , , , , !"
        BYTE "!____!, , , , , , , , , * , , , , , , , , , , _____ !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , , , , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , !_______! , , , , , , , , , , , !______! , , ,!"
        BYTE "! , , ! , * , !____________ , , , , , ! , * ,!__ , ,!"
        BYTE "! * , ! , , , , , , , , , , , , , , , !, , , , , , ,!"
        BYTE "+___________________________________________________+", 0 

 l2maze2 BYTE "+___________________________________________________+"
        BYTE "! * , , ,!, , , , , * , , , , , , , , , 0 , , , , , !"
        BYTE "! , , 0 ,!______________! , , , , , , , , , , , , , !"
        BYTE "! , , , )!* , , , , , , !_____________! , , , , , , !"
        BYTE "! , _____!, , , , , , , ! , , , , , , ! , , , , , , !"    
        BYTE "! , , , , , , ,!\ , , , , , , /!, , , ! , !_________!"
        BYTE "! 0 , , , , , ,!,\, , , , , ,/ !, , , , , ! , , , , !"
        BYTE "! , , , , 0 , ,!, \* , , , ,/ *!, , , , , ! ( * , , !"
        BYTE "! , ! , , , , ,!( ,\ , , , /, ,!, , , , , !_____! , !"
        BYTE "! , ! , , , , ,!, , \, , ,/ , ,!, , , , , , , , ! , !"
        BYTE "! , ! , , , , ,!, , ,\___/ , , !, , , , , 0 , , ! , !"
        BYTE "! , ! , , , , ,!, , , * , , , ,!, , , , , , , , , , !"
        BYTE "! , ! , , , , ,!, , , , , , , ,!, , , , , , , , , , !"
        BYTE "! , ! , , , , ,!, , , , , , 0 ,!, , , , , , !_______!"
        BYTE "! * ! , * , , ,!, , , , , , , ,!, , , , , , ! ( , , !"    
        BYTE "! , !_____!, , , , , , , , , , , , , , , , ,! , , , !"
        BYTE "! , , , , , , , , , , , , , , , , ,_________! , , , !"
        BYTE "! , , 0 , ! , , , , , * , , , , , , , , , , , * , , !"
        BYTE "! , , , , ! , , , , , , , , , , , , , , , , , , , , !"
        BYTE "! , , , ) !______________________________!, , 0 , , !"
        BYTE "! , * , , , , 0 , , , , , ! * , , , , , ,!, , , , , !"
        BYTE "! , , , , , , , , , , , , ! , , , 0 , , ,!, , , , , !"
        BYTE "! , , , , , ,!, , , , , , ! , , , , , , ,!____! , , !"
        BYTE "! , , , , , ,!, , 0 , , , , , ______! , , * ) ! , , !"
        BYTE "! , , * , , ,!, , , , , , , , , , , ! , , , * ! , , !"
        BYTE "!____________!, , , , , , , , , , , !_________! , , !"
        BYTE "! * , , , , )!, , , , , , , , , , , , , , , , , , , !"
        BYTE "! * , , , , , , , , , , , , , , , 0 , , , , , , , , !"
        BYTE "+___________________________________________________+", 0 
    
    total_rows equ 29
    total_rows2 equ 29
    total_columns equ 53
    total_columns2 equ 53
    ONE equ 1 
    zero equ 0 
    gameend byte "CONGRADULATIONS! YOU WON :)",0

    ; Strings for CurrentScore display
    strCurrentScore BYTE "CurrentScore: ",0
    CurrentScore dw 0


     
    LivesStr BYTE "Lives: ",0
    lives BYTE 3
    
    strGameover BYTE "You Died x____x ",0

        xCord BYTE 1
    yCord BYTE 2

    
    xCoinCord BYTE 0
    yCoinCord BYTE 0

    
    inputChar BYTE ?
    one1 BYTE one
    Ghost1xCord BYTE one  
    Ghost1yCord BYTE 12  
    Ghost1route BYTE one

    Ghost2xCord BYTE 25
    Ghost2yCord BYTE 13
    Ghost2route BYTE one

    Ghost22xCord BYTE 10  
    Ghost22yCord BYTE 16   
    Ghost22route BYTE one
    
    Ghost31xCord BYTE one
    Ghost31yCord BYTE 27 
    Ghost31route BYTE one

    Ghost3xCord BYTE 21
    Ghost3yCord BYTE 18
    Ghost3route BYTE one

    Ghost33xCord BYTE one  
    Ghost33yCord BYTE 16  
    Ghost33route BYTE one


.code

l3BoundaryFinder PROC
   
    mov al, dl      
    mov ah,0
    
    
    mov bl, total_columns  
    mov bh,0
    mul bl
    movsx bx, dh   
    
    ;add the values
    mov One1,ONE
    add ax, bx     
    mov One1,ONE 
    mov al, l2maze2[eax]
       

  
    cmp al, '!'
    je  HurdleLocated
    cmp al, '_'
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

l3BoundaryFinder ENDP

l2BoundaryFinder PROC
   
    mov al, dl      
    mov ah,0
    
    
    mov bl, total_columns  
    mov bh,0
    mul bl
    movsx bx, dh   
    
    ;add the values
    mov One1,1
    add ax, bx     
    mov One1,1 
    mov al, l3maze3[eax]
           
    cmp al, '!'
    je  HurdleLocated
    cmp al, '_'
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
l2BoundaryFinder ENDP

l1BoundaryFinder PROC
    mov eax,0 
    mov ebx,0
    cmp levelatm,ONE
    je maze11
    mov One1,1
    cmp levelatm,2
    je maze12
    mov One1,1
    cmp levelatm,3
    je maze13
    mov One1,1
    
    maze12: 
    mov One1,1
    call l2BoundaryFinder
    ret

    maze13: 
    mov One1,1
    call l3BoundaryFinder
    ret
    
    maze11:
    
    mov al, dl      
    mov ah,0
    
    
    mov bl, total_columns  
    mov bh,0
    mul bl
    movsx bx, dh   
    
    ;add the values
    mov One1,1
    add ax, bx     
    mov One1,1 
    mov al, l1maze1[eax]

  
    cmp al, '!'
    je  HurdleLocated
    cmp al, '_'
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

l1BoundaryFinder ENDP

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
        cmp CurrentScore,30
        jnl WalkToLTwo
        cmp CurrentScore,80
        jg WalkToLThree
        cmp CurrentScore,150
        jg FinshGame
        cmp one1,1
        je moveon2 

        WalkToLTwo:
        cmp CurrentScore, 80
        jg WalkToLThree
        
        
        mov levelatm,2
        cmp one1,1
        je moveon2 

        WalkToLThree:
        cmp CurrentScore,150
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
        call l1GhostWalkY
        jmp movetoGame
    
        Displaymazetwo:
        call mazelevel2 
        call l3GhostWalkY
        call l33GhostWalkY
        cmp one1,1
        je movetoGame

        Displaymazethree:
        call mazelevel3
        call l31GhostWalkY
        call l2GhostWalkY
        call l22GhostWalkY
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
        mov bl, xCord
        cmp bl, xCoinCord
        jne notCollecting
        mov bl, yCord
        cmp bl, yCoinCord
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
        mov one1,1
        call pausescreen
        mov one1,1
        jmp gameloop

    moveUp:
        call ClearPlayer
        sub yCord,1
        
        mov one1,1
        
        mov dh,xCord
        mov dl,yCord
        call l1BoundaryFinder
        mov one1,1
        cmp ah, zero
        je reverseup
        mov one1,1
        cmp ah,2
        je plusone
        mov one1,1
        cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        cmp one1,1
        je gameLoop

        reverseup:
        add yCord ,one   ;return
        mov one1,1
        call DisplayPlayer
        mov one1,1
        cmp one1,1 
        je gameLoop

    moveDown:
        call ClearPlayer
        add yCord,ONE
        
        
        mov one1,1
        
        mov dh,xCord
        mov dl,yCord
        call l1BoundaryFinder
        mov one1,1
        cmp ah, zero
        je reversedown
        mov one1,1
        cmp ah,2
        je plusone
        mov one1,1
        cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        cmp one1,1
        je gameLoop

        reversedown:
        dec yCord    ;return
        call DisplayPlayer
         
        jmp gameLoop

    Go_Left:
        call ClearPlayer
        dec xCord
        
        
        mov one1,1
        
        mov dh,xCord
        mov dl,yCord
        call l1BoundaryFinder
        mov one1,1
        cmp ah, zero
        je reverseleft
        mov one1,1
        cmp ah,2
        je plusone
        mov one1,1
        cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        cmp one1,1
        je gameLoop

        reverseleft:
            inc xCord    ;return
            call DisplayPlayer
             
            jmp gameLoop

    GO_RIGHT:
        call ClearPlayer
        add xCord,1
        
        
        mov one1,1
        
        mov dh,xCord
        mov dl,yCord
        call l1BoundaryFinder
        mov one1,1
        cmp ah, zero
        je reverseright
        mov one1,1
        cmp ah,2
        je plusone
        mov one1,1
        cmp ah,3
        je teleportation1
        

        call DisplayPlayer
        cmp one1,1
        je gameLoop
        reverseright:
            dec xCord    ;return
            call DisplayPlayer
             
            jmp gameLoop

    jmp gameLoop

plusone:
add CurrentScore,2
jmp notCollecting

teleportation1:
 mov eax, total_rows -2     
  call RandomRange
  mov yCord, al

 mov eax, total_columns-2   
 call RandomRange
    mov xCord, al

    call ClearPlayer
    call DisplayPlayer
   
jmp gameLoop


exitGame:
    exit
main ENDP


ClearScreen PROC
    mov eax, 0 
    call EraseDisplay
    ret
ClearScreen ENDP


mazelevel1 PROC
    mov dx,zero   ; col

    Displayraw:
        inc one1 
        mov dh, 0   ; reset col
        dec one1

    Displaycolumn:
        
        call l1BoundaryFinder; return char in al
         
        call WriteChar

        add dh,one  ; next column
        cmp dh, total_columns 
        jb Displaycolumn 
        mov one1,1
        call crlf 
        mov one1,1
        add dl,one1
        cmp dl, total_rows
        jb Displayraw  

        ret
mazelevel1 ENDP

mazelevel2 PROC
    cmp maze2Display,ONE
    je DontDisplaying
    
    call EraseDisplay
    mov maze2Display,ONE     ;so doesntDisplay again 
    mov dx,zero
    call crlf
    
    Displayraw:
        inc one1 
        mov dh, 0   ; reset col
        dec one1

    Displaycolumn:
        
        call l2BoundaryFinder; return char in al
         
        call WriteChar

        add dh,one  ; next column
        cmp dh, total_columns 
        jb Displaycolumn 
        mov one1,1
        call crlf 
        mov one1,1
        add dl,one1
        mov one1,1
        cmp dl, total_rows
        jb Displayraw  
        call Displaycoin
        DontDisplaying:
        ret

mazelevel2 ENDP

mazelevel3 PROC
    mov one1,1
     cmp maze3Display,ONE
     je DontDisplaying

    
    call EraseDisplay
    mov maze3Display,ONE 
    mov dx,zero 
    call crlf
    Displayraw:
        inc one1 
        mov dh, 0   ; reset col
        dec one1

    Displaycolumn:
        
        call l3BoundaryFinder; return char in al
         
        call WriteChar

        add dh,one  ; next column
        cmp dh, total_columns 
        jb Displaycolumn 
        mov one1,1
        call crlf 
        mov one1,1
        add dl,one1
        cmp dl, total_rows
        jb Displayraw  
        call DisplayCoin
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
    ; Display player at (xCord, yCord)
    mov eax, green
    call SetTextColor
    mov dl, xCord
    mov dh, yCord
    call Gotoxy
    mov al, "C"
    call WriteChar
    ret
DisplayPlayer ENDP

ClearPlayer PROC
    ; Clear player's current Cordition
    mov dl, xCord
    mov dh, yCord
    call Gotoxy
    mov al, " "
    call WriteChar
    ret
ClearPlayer ENDP
EraseDisplay proc
call clrscr
EraseDisplay endp
DisplayCoin PROC
    ; Display coin at (xCoinCord, yCoinCord)
    mov eax, yellow
    call SetTextColor
    mov dl, xCoinCord
    mov dh, yCoinCord
    call Gotoxy
    mov al, "$"
    call WriteChar
    ret
DisplayCoin ENDP

CreateRandomCoin PROC
 
    mov eax, total_rows -2     
    call RandomRange
    mov yCoinCord, al
    mov bl,Ghost1yCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost2yCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost22yCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost3yCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost33yCord
    cmp bl,al
    je Clearcoin
    mov bl,Ghost31yCord
    cmp bl,al
    je Clearcoin

    mov eax, total_columns-2   
    call RandomRange
    mov xCoinCord, al
    mov bl,Ghost1xCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost2xCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost22xCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost3xCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost33xCord
    cmp bl,al
    je Clearcoin
     mov bl,Ghost31xCord
    cmp bl,al
    je Clearcoin
    
    ;collision of coin n wall 
    mov dl,yCoinCord
    mov dh,xCoinCord
    call l1BoundaryFinder   
    cmp ah, 0
    je Clearcoin
    ;collision of coin n wall 
    mov dl,yCoinCord
    mov dh,xCoinCord
    call l2BoundaryFinder   
    cmp ah, 0
    je Clearcoin
     ;collision of coin n wall 
    mov dl,yCoinCord
    mov dh,xCoinCord
    call l3BoundaryFinder   
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
    mov dl, Ghost1xCord
    mov dh, Ghost1yCord
    call Gotoxy
    mov al, "G"
    mov one1,1
    call WriteChar
    mov eax, cyan
    call SetTextColor

    mov one1,1
    ret
DisplayGhosty1 ENDP

DisplayGhostyTwo PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost2xCord
    mov one1,1
    mov dh, Ghost2yCord
    call Gotoxy
    mov one1,1
    mov al, "G"
    call WriteChar
    mov one1,1

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyTwo ENDP

DisplayGhostyTwo2 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost22xCord
    mov dh, Ghost22yCord
    mov one1,1
    mov one1,1
    call Gotoxy
    mov al, "G"
    mov one1,1
    call WriteChar
    mov one1,1
    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyTwo2 ENDP

DisplayGhostyThree PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost3xCord
    mov dh, Ghost3yCord
    mov one1,1
    call Gotoxy
    mov al, "G"
    call WriteChar
    mov one1,1
    mov eax, cyan
    call SetTextColor
    mov one1,1
    ret
DisplayGhostyThree ENDP

DisplayGhostyThree3 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost33xCord
    mov dh, Ghost33yCord
    call Gotoxy
    mov one1,1
    mov al, "G"
    call WriteChar
    mov one1,1
    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyThree3 ENDP

DisplayGhostyThree1 PROC
    
    mov eax, cyan
    call SetTextColor
    mov dl, Ghost31xCord
    mov one1,1
    mov one1,1
    mov dh, Ghost31yCord
    call Gotoxy
    mov al, "G"
    call WriteChar
    mov one1,1

    mov eax, cyan
    call SetTextColor
    ret
DisplayGhostyThree1 ENDP

ClearGhosty PROC
    ;reset Cord
    mov dl, Ghost1xCord
    mov dh, Ghost1yCord
    call Gotoxy
   mov one1,1
   mov al, " "
   call WriteChar
    ret
ClearGhosty ENDP

ClearGhostyTwo PROC
  ;reset Cord
    mov dl, Ghost2xCord
   mov dh, Ghost2yCord
   mov one1,1
   call Gotoxy
   mov al, " "
   call WriteChar
    ret
ClearGhostyTwo ENDP

ClearGhostyTwo2 PROC
  ;reset Cord
    mov dl, Ghost22xCord
    mov dh, Ghost22yCord
    call Gotoxy
    mov one1,1
   
   mov al, " "
   call WriteChar
    ret
ClearGhostyTwo2 ENDP

ClearGhostyThree PROC
  ;reset Cord
    mov dl, Ghost3xCord
    mov dh, Ghost3yCord
    call Gotoxy
   mov one1,1
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree ENDP

ClearGhostyThree3 PROC
  ;reset Cord
   mov dl, Ghost33xCord
   mov dh, Ghost33yCord
   mov one1,1
   call Gotoxy
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree3 ENDP

ClearGhostyThree1 PROC
  ;reset Cord
    mov dl, Ghost31xCord
    mov dh, Ghost31yCord
    call Gotoxy
   mov one1,1
   mov one1,1
   mov al, " "
   call WriteChar
    ret
ClearGhostyThree1 ENDP


livesClear PROC
    dec lives
    cmp lives, 0
    jbe gameup
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

l1GhostWalkY PROC
    
    
    mov dl, Ghost1yCord  
    mov dh, Ghost1xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        ADD ghost1xcord,one
        
        
        mov dl,Ghost1yCord
        mov dh,Ghost1xCord
        call l1BoundaryFinder
        cmp ah, 0   
        je routetleft
        
        call DisplayGhosty1
        
        ret

    Go_Left:
        sub Ghost1xCord,ONE
      
        
        mov dl,Ghost1yCord
        mov dh,Ghost1xCord
        call l1BoundaryFinder
        cmp ah, 0   
        je routetright
        call DisplayGhosty1
        
        ret

        routetright:
        inc Ghost1xCord 
        xor cl,ONE 
        mov Ghost1route,cl
        call DisplayGhosty1
        
        ret

        routetleft:
        SUB GHOST1XCORD,ONE 

        xor cl,ONE 

        mov Ghost1route,cl
        call DisplayGhosty1
        
        ret

l1GhostWalkY ENDP 

l2GhostWalkY PROC
    
    
    mov dl, Ghost2yCord  
    mov dh, Ghost2xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        inc Ghost2yCord  
        
        
        mov dl,Ghost2yCord
        mov dh,Ghost2xCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetdown
        
        call DisplayGhostyTwo
        
        ret

    Movedown:
        dec Ghost2yCord
      
        
        mov dl,Ghost2yCord
        mov dh,Ghost2xCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetup
        call DisplayGhostyTwo
        
        ret

        routetup:
        inc Ghost2yCord 
        xor cl,ONE 
        mov Ghost2route,cl
        call DisplayGhostyTwo
        
        ret

        routetdown:
        dec Ghost2yCord 
        xor cl,ONE 
        mov Ghost2route,cl
        call DisplayGhostyTwo
        
        ret

l2GhostWalkY ENDP

l22GhostWalkY PROC
    
    
    mov dl, Ghost22yCord  
    mov dh, Ghost22xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        inc Ghost22xCord  
        
        
        mov dl,Ghost22yCord
        mov dh,Ghost22xCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetleft
        
        call DisplayGhostyTwo2
        
        ret

    Go_Left:
        dec Ghost22xCord
      
        
        mov dl,Ghost22yCord
        mov dh,Ghost22xCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetright
        call DisplayGhostyTwo2
        
        ret

        routetright:
        inc Ghost22xCord 
        xor cl,ONE 
        mov Ghost22route,cl
        call DisplayGhostyTwo2
        
        ret

        routetleft:
        dec Ghost22xCord 
        xor cl,ONE 
        mov Ghost22route,cl
        call DisplayGhostyTwo2
        
        ret

l22GhostWalkY ENDP 

l3GhostWalkY PROC
    
    
    mov dl, Ghost3yCord  
    mov dh, Ghost3xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        inc Ghost3yCord  
        
        
        mov dl,Ghost3yCord
        mov dh,Ghost3xCord
        call l2BoundaryFinder
        cmp ah, 0   
        je routetdown
        
        call DisplayGhostyThree
        
        ret

    Movedown:
        dec Ghost3yCord
      
        
        mov dl,Ghost3yCord
        mov dh,Ghost3xCord
        call l2BoundaryFinder
        cmp ah, 0   
        je routetup
        call DisplayGhostyThree
        
        ret

        routetup:
        inc Ghost3yCord 
        xor cl,ONE 
        mov Ghost3route,cl
        call DisplayGhostyThree
        
        ret

        routetdown:
        dec Ghost3yCord 
        xor cl,ONE 
        mov Ghost3route,cl
        call DisplayGhostyThree
        
        ret

l3GhostWalkY ENDP

l33GhostWalkY PROC
    
    
    mov dl, Ghost33yCord  
    mov dh, Ghost33xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        inc Ghost33xCord  
        
        
        mov dl,Ghost33yCord
        mov dh,Ghost33xCord
        call l2BoundaryFinder
        cmp ah, 0   
        je routetleft
        
        call DisplayGhostyThree3
        
        ret

    Go_Left:
        dec Ghost33xCord
      
        
        mov dl,Ghost33yCord
        mov dh,Ghost33xCord
        call l2BoundaryFinder
        cmp ah, 0   
        je routetright
        call DisplayGhostyThree3
        
        ret

        routetright:
        inc Ghost33xCord 
        xor cl,ONE 
        mov Ghost33route,cl
        call DisplayGhostyThree3
        
        ret

        routetleft:
        dec Ghost33xCord 
        xor cl,ONE 
        mov Ghost33route,cl
        call DisplayGhostyThree3
        
        ret

l33GhostWalkY ENDP 

l31GhostWalkY PROC
    
    
    mov dl, Ghost31yCord  
    mov dh, Ghost31xCord 
    mov cl, yCord        
    mov ch, xCord        
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
        add Ghost31xCord,ONE  
        mov one1,1
        
        call l3BoundaryFinder
        mov dh,Ghost31xCord
        mov dl,Ghost31yCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetleft
        
        call DisplayGhostyThree1
        
        ret

    Go_Left:
        dec Ghost31xCord
      
        
        mov dl,Ghost31yCord
        mov dh,Ghost31xCord
        call l3BoundaryFinder
        cmp ah, 0   
        je routetright
        call DisplayGhostyThree1
        
        ret

        routetright:
        inc Ghost31xCord 
        xor cl,ONE 
        mov Ghost31route,cl
        call DisplayGhostyThree1
        
        ret

        routetleft:
        dec Ghost31xCord 
        xor cl,ONE 
        mov Ghost31route,cl
        call DisplayGhostyThree1
        
        ret
l31GhostWalkY endp
    
end main