.model small
.stack 100h
.data
n1 db 10,13,'$'
.code

    main proc
        mov ax,@data
        mov ds,ax
        mov cx,0
        
        
    pushin:
        mov ah,1  ; USER INPUT
        int 21h
        mov bl,al
        push bx   ;pushing data in stack through bx
        inc cx
        cmp bl,13
        je newline
        jmp pushin
    newline:
        lea dx,n1
        mov ah,9
        int 21h
        mov ah,2
    popout:
        pop dx
        int 21h
        loop popout
    Exit:
        mov ah,4ch
        int 21h
        main endp
    end main
           