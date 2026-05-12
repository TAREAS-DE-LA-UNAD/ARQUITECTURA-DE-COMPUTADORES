.model small
.stack
.data
msg db 'Numero (0-9): $'
res db 13,10,'Binario: $'

.code
main:
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg
    int 21h                ; Pedir número

    mov ah,01h
    int 21h                ; Leer número
    sub al,30h             ; Convertir ASCII a valor

    mov bl,2               ; Divisor (base binaria)
    mov cx,4               ; 4 bits para números 0-9

convert:
    xor dx,dx              ; Limpiar DX
    div bl                 ; AX / 2 → AL=cociente, DX=residuo
    push dx                ; Guardar residuo (bit)
    loop convert           ; Repetir

    mov ah,09h
    lea dx,res
    int 21h                ; Mostrar "Binario"

    mov cx,4
print:
    pop dx                 ; Recuperar bit
    add dl,30h             ; Convertir a ASCII
    mov ah,02h
    int 21h                ; Mostrar bit
    loop print

    mov ah,4ch
    int 21h
end main