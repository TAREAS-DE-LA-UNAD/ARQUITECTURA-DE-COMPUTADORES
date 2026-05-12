.model small
.stack 100h
.data
    msg db 'Contador:',13,10,'$'

.code
main:
    mov ax,@data
    mov ds,ax

    ; Mostrar mensaje inicial
    mov ah,09h
    lea dx,msg
    int 21h

    mov cx,9        ; Vamos a contar 9 veces (del 1 al 9)
    mov bl,31h      ; BL guardará nuestro número ('1')

loop1:
    ; 1. Imprimir el número
    mov ah,02h
    mov dl,bl       ; Movemos el contador a DL para imprimirlo
    int 21h

    ; 2. Imprimir salto de línea (13 y 10)
    mov dl,13       ; Retorno de carro
    int 21h
    mov dl,10       ; Salto de línea
    int 21h

    ; 3. Preparar siguiente iteración
    inc bl          ; Incrementamos el contador en BL (no se pierde)
    loop loop1

    ; Salida al DOS
    mov ah,4ch
    int 21h
end main