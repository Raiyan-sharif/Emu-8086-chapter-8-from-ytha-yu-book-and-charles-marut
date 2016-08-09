.model small
.stack 100h
.data
massage_add db 10,13,'ADD: $'
massage_first db 10,13,'Input First Number: $'
massage_second db 10,13,'Input Second Number: $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,massage_first
    int 21h
    
    
    mov ah,1
    int 21h
    
    
    mov bl,al
    
    
    mov ah,9
    lea dx,massage_second
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    jmp addtwo
    
    addtwo proc
        mov al,bl
        add al,bh
        sub al,48
        mov ah,2
        mov dl,al
        int 21h
        addtwo endp
    

    

end main
    