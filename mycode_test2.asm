org 100h
;Code for Program to convert decimal number to binary in Assembly Language
DIS MACRO STR
MOV AH,09H
LEA DX,STR
INT 21H
ENDM
jmp start   
    ; jump over data declaration                       
Msg8: db   0dh,0ah,0dh,0ah,09h,09h,"------ ENTRE YOUR CHOICE ------ ",13,10,"$" 
Msg10: db  0dh,0ah,0dh,0ah,09h,09h,"-------------------------------",0dh,0ah,"$"
Msg9: db 0dh,0ah,0dh,0ah,09h,09h,"-- ENTRE YOUR OPTION -------- $"                                                                                           
Msg7: db 09h,"***************WELCOM TO OUR CALCULATOR**************** $"
msg1: db        0dh,0ah,0dh,0ah,09h,09h,"|   1- DECIMAL                |",0dh,0ah,0dh,0ah,09h,09h,"|   2- BINARY                 |",0dh,0ah,0dh,0ah,09h,09h,"|   3- HEXADECIMAL            |",0dh,0ah,0dh,0ah,09h,09h,"|   4- EXIT                   |",0dh,0ah,"$"
msg:    db      0dh,0ah,0dh,0ah,09h,09h,"1- Add",0dh,0ah,0dh,0ah,09h,09h,"2- Mul",0dh,0ah,0dh,0ah,09h,09h,"3- Sub",0dh,0ah,0dh,0ah,09h,09h,"4- Div",0dh,0ah,0dh,0ah,09h,09h,"5- Ret",0dh,0ah,0dh,0ah,09h,09h,"0- Exit",0dh,0ah,"$"
msg2:    db      0dh,0ah,"Enter First No: $"
msg3:    db      0dh,0ah,"Enter Second No: $"
msg4:    db      0dh,0ah,"Choice Error $" 
msg5:    db      0dh,0ah,"Result is : $" 
msg6:    db      0dh,0ah ,'thank you for using the simple calculator! ',0dh,0ah,'press any key to exit... ', 0Dh,0Ah, '$'
MSG33 db 0dh,0ah,"DO YOU WANT TO SEE THE RESULT IN : ",0dh,0ah ,"$"                                                                                   
 MSG99 DB 0dh,0ah,"-------------------------------------------------------",0dh,0ah,"$"                                                                                                                                
MSG66 DB 0dh,0ah,"|  DO YOU WANT TO SEE THE NUMBER IN BINARY ?           |",0dh,0ah,"|  OR DO YOU WANT TO CONTINUE IN BINARY OPERATION...   |",0dh,0ah,"|[0]- I WANT TO GO TO BINARY OPERATION                 |",0dh,0ah,"|[1]- I WANT TO CONVERT DECIMAL NUMBER TO BINARY NUMBER|",0dh,0ah,"$"
MSG88 db 0dh,0ah,"PRESS ANY KEY PLEASE .......$"            
MSG999 db 0dh,0ah,"THE RESULT IN HEXADECIMAL :$"
MSG77 DB 0dh,0ah,"HI ...! WELCOM  TO CONVERSATION MODE $"
MSG55 db 0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,"EDITED BY : ",0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,09h,"ELAIDAT MOHAMED REDHA ",0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,09h,"AZZI ADEL",0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,09h,"ACAD -B- ",0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,09h,"GROUPE -03- ",0dh,0ah,0dh,0ah,09h,09h,09h,09h,09h,09h,"$"
CHOICE db ?
num1 dw ?
num2 dw ? 
h db  "h $"
hex dw ?
help db 0dh,0ah,0dh,0ah,09h,09h,"HELP ...",0dh,0ah,0dh,0ah,09h,09h,"[0] CONTINUE ",0dh,0ah,0dh,0ah,09h,09h,"[1] ABOUT",0dh,0ah,0dh,0ah,09h,09h,"$"
hp db 0dh,0ah,"SO IN OUR APP THE USER MUST PRESS DECIMAL ",0dh,0ah,"NUMBER IN THREE SYSTEMS ",0dh,0ah,"WHEN THE USER ENTRE TO THE MENU OF CHOICE OF SYSTEMS HE MUST CHOOSE ONE OF THEM ",0dh,0ah,"THE SAME FOR THE MENU OF OPERATIONS",0dh,0ah,"THANKS FOR ENTRE TO HELP-OPTION",0dh,0ah,"$"
strHex db 6 dup('$')
result dw 100000b
    MSG22 DB "THE RESULT IN BINARY IS : $"
    STR1 DB 20 DUP('$')
    STR2 DB 20 DUP('$')
    NO DW 2
    LINE DB 10,13,'$'
Addition1 db 0dh,0ah,"ADDITION ( NUM1 + NUM2) : $"
SUBTRACT1 db 0dh,0ah,"SUBTRACT ( NUM1 - NUM2) : $" 
MULTIPLY1 DB 0dh,0ah,"MULTIPLY (NUM1 * NUM2 ) : $"
DIVIDE1   db 0dh,0ah,"DIVIDE (NUM1 / NUM2) : $"
start:  

        mov ah,9
        mov dx, offset msg7 ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h 
        mov ah,9
        mov dx,offset help
        int 21h
        mov ah,1
        int 21h
        cmp al,30h
        je CHOIX
        cmp al,31h
        je Help1        
        CHOIX: 
        mov ah,9
        mov dx, offset msg8 ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h

        mov ah,9
        mov dx, offset msg1 ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h  
               mov ah,09h
        mov dx, offset msg10
        int 21h
        mov ah,0                       
        int 16h  ;then we will use int 16h to read a key press, to know the operation he choosed
        cmp al,31h
        je F1
        cmp al,32h
        JE F2
        CMP AL,33H
        JE F6
        cmp AL,34H
        je F3 
        
        mov ah,09h
        mov dx, offset msg4
        int 21h 
        
        jmp CHOIX 
        
        
         
        F1: 
                mov ah,9
        mov dx, offset msg9 ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h
        mov ah,9 
        
        mov dx, offset msg ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h 
        mov ah,09h
        mov dx, offset msg10
        int 21h
        mov ah,0                       
        int 16h  ;then we will use int 16h to read a key press, to know the operation he choosed 
        cmp al,31h ;the keypress will be stored in al so, we will comapre to 1 addition ..........
        je Addition
        cmp al,32h
        je Multiply
        cmp al,33h
        je Subtract
        cmp al,34h
        je Divide
        mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h
        jmp start  
        
        
        
Addition:   mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset Addition1  ;first we will display this message enter first no also using int 21h
            int 21h
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            
            
            add dx,bx
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx



            call View 
            jmp Choix
            
InputNo:    mov ah,0
            int 16h ;then we will use int 16h to read a key press     
            mov dx,0  
            mov bx,1 
            cmp al,0dh ;the keypress will be stored in al so, we will comapre to  0d which represent the enter key, to know wheter he finished entering the number or not 
            je FormNo ;if it's the enter key then this mean we already have our number stored in the stack, so we will return it back using FormNo
            sub ax,30h ;we will subtract 30 from the the value of ax to convert the value of key press from ascii to decimal
            call ViewNo ;then call ViewNo to view the key we pressed on the screen
            mov ah,0 ;we will mov 0 to ah before we push ax to the stack bec we only need the value in al
            push ax  ;push the contents of ax to the stack
            inc cx   ;we will add 1 to cx as this represent the counter for the number of digit
            jmp InputNo ;then we will jump back to input number to either take another number or press enter          
   

;we took each number separatly so we need to form our number and store in one bit for example if our number 235
FormNo:     pop ax; Take the last input from the stack  
            push dx      
            mul bx;Here we are multiplying the value of ax with the value of bx
            pop dx;After multiplication we will remove it from stack
            add dx,ax;After removing from stack add the value of dx with the value of ax
            mov ax,bx;Then set the value of bx in ax       
            mov bx,10
            push dx;push the dx value again in stack before multiplying to resist any kind of accidental effect
            mul bx;Multiply bx value by 10
            pop dx;pop the dx after multiplying
            mov bx,ax;Result of the multiplication is still stored in ax so we need to move it in bx
            dec cx;After moving the value we will decrement the digit counter value
            cmp cx,0;Check if the cx counter is 0
            jne FormNo;If the cx counter is not 0 that means we have multiple digit input and we need to run format number function again
            ret;If the cx counter is 0 that means all of our digits are fully formatted and stored in bx we just need to return the function   


       
       
View:  mov ax,dx
       mov dx,0
       div cx 
       call ViewNo
       mov bx,dx 
       mov dx,0
       mov ax,cx 
       mov cx,10
       div cx
       mov dx,bx 
       mov cx,ax
       cmp ax,0
       jne View
       ret


ViewNo:    push ax ;we will push ax and dx to the stack because we will change there values while viewing then we will pop them back from
           push dx ;the stack we will do these so, we don't affect their contents
           mov dx,ax ;we will mov the value to dx as interrupt 21h expect that the output is stored in it
           add dl,30h ;add 30 to its value to convert it back to ascii
           mov ah,2
           int 21h
           pop dx  
           pop ax
           ret
      
   
exit:   mov dx,offset msg6
        mov ah, 9
        int 21h  

        mov dx,offset msg55
        mov ah,9
        int 21h
        mov ah, 0
        int 16h

        ret
            
                       
Multiply:   mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset MULTIPLY1  ;first we will display this message enter first no also using int 21h
            int 21h
            mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,dx
            xor dx,dx
            mul bx 
            mov dx,ax
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx  

            call View 
            jmp Choix 


Subtract:   mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset SUBTRACT1  ;first we will display this message enter first no also using int 21h
            int 21h
            mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            sub bx,dx
            mov dx,bx
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View 
            jmp Choix
    
            
            
Divide:     mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset DIVIDE1  ;first we will display this message enter first no also using int 21h
            int 21h
            mov ah,9
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg3
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,bx
            mov cx,dx
            mov dx,0
            mov bx,0
            div cx
            mov bx,dx
            mov dx,ax
            push bx 
            push dx 
            mov ah,9
            mov dx, offset msg5
            int 21h
            mov cx,10000
            pop dx
            call View
            pop bx
            cmp bx,0
            je exit 
            jmp Choix
            
F3:            jmp exit

F2:    
    
    mov dx,offset MSG99
    mov ah,9
    int 21h
    mov dx,offset MSG66
    mov ah,9
    int 21h    
    mov dx,offset MSG99
    mov ah,9
    int 21h 
    mov dx,offset msg88
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    cmp al,30h
    je CONTINUE
    cmp al,31h
    je F5
    mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h         
   
        CONTINUE:
      
        mov ah,9
        mov dx, offset msg9 ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h
            
             mov ah,9
        mov dx, offset msg ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h
        mov ah,0                       
        int 16h  ;then we will use int 16h to read a key press, to know the operation he choosed 
        cmp al,31h ;the keypress will be stored in al so, we will comapre to 1 addition ..........
        je Add
        cmp al,32h
        je Mul
        cmp al,33h
        je Sub
        cmp al,34h
        je Div 
        cmp al,35h
        je RETURN
        cmp al,30h
        je exit 
        mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h 
        Add:
        
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset Addition1  ;first we will display this message enter first no also using int 21h
            int 21h
            
            
            LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx
            pop AX
         mov num1,ax
         push ax
         
         
                 
         
         
      
         LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg3  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx
                 pop AX 
                 mov num2,ax
                 
                 
                  
            mov ax,num2
            add ax,num1 
           
        
         
        
               
         
         MOV BH,00
         MOV BL,2
      L11:DIV BL
         ADD AH,'0'
         MOV BYTE PTR[SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE L11

         MOV CL,BH
         LEA SI,STR1
         LEA DI,STR2
         MOV CH,00
         ADD SI,CX
         DEC SI
         
      L22:MOV AH,BYTE PTR[SI]
         MOV BYTE PTR[DI],AH
         DEC SI
         INC DI
         LOOP L22
          
         DIS LINE
         DIS MSG22
         DIS STR2  
         jmp CHOIX
          
         Sub:
            
            mov ah,9  
            mov dx, offset SUBTRACT1  
            int 21h
            
            
            LEA SI,STR1
            mov ah,9  
            mov dx, offset msg2 
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
      
         LEA SI,STR1
            mov ah,9  
            mov dx, offset msg3  
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  
            push dx
                 pop AX 
        
         
             mov bx,num1
             sub bx,ax
             mov ax,bx 
           
        
         
        
               
         
         MOV BH,00
         MOV BL,2
      L21:DIV BL
         ADD AH,'0'
         MOV BYTE PTR[SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE L21

         MOV CL,BH
         LEA SI,STR1
         LEA DI,STR2
         MOV CH,00
         ADD SI,CX
         DEC SI
         
      L222:MOV AH,BYTE PTR[SI]
         MOV BYTE PTR[DI],AH
         DEC SI
         INC DI
         LOOP L222
          
         DIS LINE
         DIS MSG22
         DIS STR2  
         jmp CHOIX
                  
            
            Mul:      
            mov ah,9  
            mov dx, offset MULTIPLY1  
            int 21h
            
            
            LEA SI,STR1
            mov ah,9  
            mov dx, offset msg2  
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
      
         LEA SI,STR1
            mov ah,9  
            mov dx, offset msg3  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx
                 pop AX 
        
         
            mov bx,num1
            mul bx
           
        
         
        
               
         
         MOV BH,00
         MOV BL,2
      L31:DIV BL
         ADD AH,'0'
         MOV BYTE PTR[SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE L31

         MOV CL,BH
         LEA SI,STR1
         LEA DI,STR2
         MOV CH,00
         ADD SI,CX
         DEC SI
         
      L3:MOV AH,BYTE PTR[SI]
         MOV BYTE PTR[DI],AH
         DEC SI
         INC DI
         LOOP L3
          
         DIS LINE
         DIS MSG22
         DIS STR2  
         jmp CHOIX
         
         Div:
             
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset DIVIDE1  ;first we will display this message enter first no also using int 21h
            int 21h
            
            
            LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
      
         LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg3  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx
                 pop AX 
         
            mov num2,ax
            mov ax,num1
            xor dx,dx  
            cmp num2,0
            je RETURN
            div num2
             MOV BH,00
         MOV BL,2
      L41:DIV BL
         ADD AH,'0'
         MOV BYTE PTR[SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE L41

         MOV CL,BH
         LEA SI,STR1
         LEA DI,STR2
         MOV CH,00
         ADD SI,CX
         DEC SI
         
      L4:MOV AH,BYTE PTR[SI]
         MOV BYTE PTR[DI],AH
         DEC SI
         INC DI
         LOOP L4
          
         DIS LINE
         DIS MSG22
         DIS STR2
         jmp CHOIX   
    
            
         RETURN:
         jmp choix 
F5:     
    mov dx,offset MSG77
    mov ah,9
    int 21h
      
        LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
      
          MOV BH,00
         MOV BL,2
      L61:DIV BL
         ADD AH,'0'
         MOV BYTE PTR[SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE L61

         MOV CL,BH
         LEA SI,STR1
         LEA DI,STR2
         MOV CH,00
         ADD SI,CX
         DEC SI
         
      L6:MOV AH,BYTE PTR[SI]
         MOV BYTE PTR[DI],AH
         DEC SI
         INC DI
         LOOP L6
          
         DIS LINE
         DIS MSG22
         DIS STR2
         jmp CHOIX 
      
F6:
     
              
            
            
                 mov ah,9
        mov dx, offset msg ;first we will display hte first message from which he can choose the operation using int 21h
        int 21h
        mov ah,0                       
        int 16h  ;then we will use int 16h to read a key press, to know the operation he choosed 
        cmp al,31h ;the keypress will be stored in al so, we will comapre to 1 addition ..........
        je Add1
        cmp al,32h
        je Mul3
        cmp al,33h
        je Sub2
        cmp al,34h
        je Div4 
        cmp al,35h
        je RETURN
        cmp al,30h
        je exit 
        mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h 
        jmp Choix
        Add1:
                        mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset Addition1  ;first we will display this message enter first no also using int 21h
            int 21h
            LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
         xor ah,ah
         mov ax,num1  
             LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg3  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 
         
         pop AX
           mov num2,ax
                 
                 
                 
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset Addition1  ;first we will display this message enter first no also using int 21h
            int 21h
            
            mov ax,num2
            add ax,num1
         
         mov hex,ax
         mov cx,4   
         DIS LINE
         mov ah,9
         mov dx,offset MSG999
         int 21h
         mov si,offset strHex
         
         HextoAscii1:
         rol hex,4
         mov dx,hex
         and dl,0fh
         add dl,30h
         cmp dl,39h
         jle skip1
         add dl,7
         skip1:
         mov [si],dl
         inc si
         loop HextoAscii1
         mov ah,09h
         lea dx,strHex
         int 21h
         mov ah,9
         mov dx,offset h
         int 21h
         jmp Choix
         sub2: 
                     mov ah,9  
            mov dx, offset SUBTRACT1  
            int 21h
         LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
         xor ah,ah
         mov ax,num1  
             LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 
         
         pop AX
           mov num2,ax
                 
                 
                 
         mov ax,num2
          sub num1,ax
          mov ax,num1 
          mov hex,ax
         mov cx,4   
         DIS LINE
                  mov ah,9
         mov dx,offset MSG999
         int 21h
         mov si,offset strHex
         
         HextoAscii2:
         rol hex,4
         mov dx,hex
         and dl,0fh
         add dl,30h
         cmp dl,39h
         jle skip2
         add dl,7
         skip2:
         mov [si],dl
         inc si
         loop HextoAscii2
         mov ah,09h
         lea dx,strHex
         int 21h
                  mov ah,9
         mov dx,offset h
         int 21h 
         jmp Choix
         mul3:     
         mov ah,9  
            mov dx, offset MULTIPLY1  
            int 21h
         LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
         xor ah,ah
         mov ax,num1  
             LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 
         
         pop AX
           mov num2,ax
                 
                 
                 
         mov ax,num2
         mul num1
         mov hex,ax
         mov cx,4   
         DIS LINE         
         mov ah,9
         mov dx,offset MSG999
         int 21h
         mov si,offset strHex
         
         HextoAscii3:
         rol hex,4
         mov dx,hex
         and dl,0fh
         add dl,30h
         cmp dl,39h
         jle skip3
         add dl,7
         skip3:
         mov [si],dl
         inc si
         loop HextoAscii3
         mov ah,09h
         lea dx,strHex
         int 21h 
                  mov ah,9
         mov dx,offset h
         int 21h
         jmp Choix
         div4:
         mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset DIVIDE1  ;first we will display this message enter first no also using int 21h
            int 21h 
         LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 mov num1,ax
         
         pop AX
         mov num1,ax
         xor ah,ah
         mov ax,num1  
             LEA SI,STR1
            mov ah,9  ;then let us handle the case of addition operation
            mov dx, offset msg2  ;first we will display this message enter first no also using int 21h
            int 21h
            mov cx,0 ;we will call InputNo to handle our input as we will take each number seprately
            call InputNo  ;first we will move to cx 0 because we will increment on it later in InputNo
            push dx

         
                 
         
         pop AX
           mov num2,ax
                 
                 
                 
           mov num2,ax
            mov ax,num1
            xor dx,dx  
            cmp num2,0
            je RETURN
            div num2
              mov hex,ax
         mov cx,4   
         DIS LINE
                  mov ah,9
         mov dx,offset MSG999
         int 21h
         mov si,offset strHex
         
         HextoAscii4:
         rol hex,4
         mov dx,hex
         and dl,0fh
         add dl,30h
         cmp dl,39h
         jle skip4
         add dl,7
         skip4:
         mov [si],dl
         inc si
         loop HextoAscii4
         mov ah,09h
         lea dx,strHex
         int 21h
                  mov ah,9
         mov dx,offset h
         int 21h
         jmp Choix
      
         help1:
         mov dx,offset hp
         mov ah,9
         int 21h
         je CHOIX
         
      
         MOV AH,4CH
         INT 21H 
         
jmp CHOIX

