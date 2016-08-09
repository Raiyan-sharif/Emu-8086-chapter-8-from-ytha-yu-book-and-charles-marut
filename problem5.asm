.MODEL SMALL
 .STACK 100H
 
 .DATA
   msg1   DB 'Enter the binary number : $'
   msg2   DB 10,13,'The 100 random numbers are :',0DH,0AH,'$'
   again      DB 10,13,'Invalid Number. Try Again : $'
   blank     DB  '    $'
 
   COUNTER_1  DB  25
   COUNTER_2  DB  ?
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                 
     MOV DS, AX
 
     LEA DX,msg1              
     MOV AH, 9
     INT 21H
 
     CALL READ                    
 
     PUSH AX                      
 
     LEA DX, msg2             
     MOV AH, 9
     INT 21H
 
     POP AX                      
 
     LOOP_1:                     
       MOV COUNTER_2, 4           
 
     LOOP_2:                   
         PUSH AX               
 
         LEA DX, blank         
         MOV AH, 9                 
         INT 21H                   
 
         POP AX                
 
         CALL RANDOM           
         CALL WRITE            
 
         DEC COUNTER_2         
         CMP COUNTER_2, 0      
         JNE LOOP_2             
 
         DEC COUNTER_1            
         CMP COUNTER_1, 0          
         JNE LOOP_1                
 
      MOV AH, 4CH                  
      INT 21H
   MAIN ENDP
 
 
 READ PROC
 
   JMP START                     
 
   RE:                        
 
   LEA DX, again               
   MOV AH, 9
   INT 21H
 
   START:                     
 
   MOV CX, 16                 
   XOR BX, BX                  
   MOV AH, 1                   
 
   INPUT:                      
     INT 21H                   
 
     CMP AL, 0DH               
     JE END                    
 
     CMP AL, 30H               
     JL RE                    
 
     CMP AL, 31H              
     JG RE                    
 
     AND AL, 0FH              
     SHL BX, 1                
     OR  BL, AL               
   LOOP INPUT                 
 
   END:                       
 
   CMP BX, 0                   
   JLE RE                     
 
   MOV AX, BX                    
 
   RET                            
 READ ENDP
 
 
 
 WRITE PROC
 
 
   PUSH AX                        
 
   MOV BX, AX                    
 
   MOV CX, 16                    
   MOV AH, 2                    
 
   OUTPUT:                     
     SHL BX, 1                 
     JC ONE                    
     MOV DL, 30H                 
     JMP DISPLAY               
 
     ONE:                      
       MOV DL, 31H               
 
     DISPLAY:                  
       INT 21H                   
   LOOP OUTPUT                 
 
   POP AX                       
 
   RET                         
 WRITE ENDP 
 
 
 
 RANDOM PROC
 
 
   SHL AX, 1                
   XOR DX, DX                    
 
   TEST AX, 8000H                
   JNE FIFTEEN_BIT              
   JMP SKIP_1                  
 
   FIFTEEN_BIT:                  
   MOV DH, 1                     
 
   SKIP_1:                     
 
   TEST AX, 4000H             
   JNE FOURTEEN_BIT            
   JMP SKIP_2                    
 
   FOURTEEN_BIT:                
   MOV DL, 1                      
 
   SKIP_2:                      
 
   XOR DH, DL                    
   AND AX, 0FFFEH                
   OR AL, DH                   
   AND AX, 7FFFH                  
 
   RET                      
 RANDOM ENDP
 
 
 END MAIN