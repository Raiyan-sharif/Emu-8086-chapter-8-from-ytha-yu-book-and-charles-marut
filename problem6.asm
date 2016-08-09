    .MODEL SMALL
    .STACK 100H
    .DATA 
     
     
     
            M2 DB 10,13,'ERROR! PARENTHESIS MISMATCH$'
     
            M3 DB 10,13,'INPUT AGAIN',10,13,'$'
     
            N1 DB 10,13,'$'
     
            M4 DB 10,13,'EXPRESSION IS CORRECT!$'
     
    .CODE
     
     
        MAIN PROC
     
     
            MOV AX,@DATA
            MOV DS,AX
     
     
            INPUT:
     
                MOV AH,1
                INT 21H
     
                MOV BL,AL
     
                CMP BL,0DH
     
                JE EXIT
     
                CMP BL,28H
                JE PUSHIN
     
                CMP BL,7BH
                JE PUSHIN
     
                CMP BL,5BH
                JE PUSHIN
     
                CMP BL,29H
                JE POPOUT1
     
                CMP BL,7DH
                JE POPOUT2
     
                CMP BL,5DH
                JE POPOUT3
     
                JMP INPUT                
     
     
            PUSHIN:
     
                PUSH BX
     
                JMP INPUT 
     
     
            POPOUT1:
     
                XOR DX,DX
     
                POP DX
     
                CMP DX,28H
     
                JE INPUT
     
                JNE ERROR
     
     
            POPOUT2:
     
                XOR DX,DX
     
                POP DX
     
                CMP DL,7BH
     
                JE INPUT
     
                JNE ERROR
     
     
            POPOUT3:
     
                XOR DX,DX
     
                POP DX
     
                CMP DL,5BH
     
                JE INPUT
     
                JNE ERROR
     
     
            ERROR: 
     
                XOR DX,DX
     
                LEA DX,M2
     
                MOV AH,9
     
                INT 21H
     
                LEA DX,N1
     
                INT 21H
     
                LEA DX,M3
     
                INT 21H
     
                JMP INPUT
     
     
     
             EXIT:
     
     
                LEA DX,M4
     
                MOV AH,9
     
                INT 21H
     
                MOV AH,4CH
     
                INT 21H
            main endp
end main    

