.model small
.stack 100h
.data
massageodd db 10,13,'ODD: $'
massageeven db 10,13,'EVEN: $'


.code

    main proc
     
       mov ax,@data
       mov ds,ax
       
       mov cx,100
    MAINEX:
       mov ax,cx
       sub ax,48
       cmp cx,0
       je Exit
       ror ax,1
       jc ODD
       jmp EVEN
    ODD:
       mov ah,9
       lea dx,massageodd
       int 21h
       mov dx,cx
       mov ah,2
       int 21h
       dec cx
       jmp MAINEX
    EVEN:
       mov ah,9
       lea dx,massageeven
       int 21h
       mov dx,cx
       mov ah,2
       int 21h
       dec cx
       jmp MAINEX
       
    Exit:
        mov ah,4ch
        int 21h
        main endp
    end main
           