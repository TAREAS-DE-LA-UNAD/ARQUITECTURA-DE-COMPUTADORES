.model small              ; Modelo de memoria pequeño
.stack                    ; Segmento de pila
.data                     ; Segmento de datos

msg1 db 'Ingrese primer numero (0-9): $'        
msg2 db 13,10,'Ingrese segundo numero (0-9): $' 
msg3 db 13,10,'Operacion (+,-,*,/): $'          
res db 13,10,'Resultado: $'                     

num1 db ?                ; Variable para el primer número
num2 db ?                ; Variable para el segundo número
op db ?                  ; Variable para el operador

.code
main:
    mov ax,@data         ; Cargar dirección del segmento de datos
    mov ds,ax            ; Inicializar DS

    ; ===== PEDIR PRIMER NÚMERO =====
    mov ah,09h           ; Función para imprimir texto
    lea dx,msg1
    int 21h

    mov ah,01h           ; Leer un carácter del teclado
    int 21h
    sub al,30h           ; Convertir de ASCII a número
    mov num1,al          ; Guardar en num1

    ; ===== PEDIR SEGUNDO NÚMERO =====
    mov ah,09h
    lea dx,msg2
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov num2,al

    ; ===== PEDIR OPERACIÓN =====
    mov ah,09h
    lea dx,msg3
    int 21h

    mov ah,01h
    int 21h
    mov op,al            ; Guardar operador (+,-,*,/)

    ; ===== PREPARAR DATOS =====
    mov al,num1          ; AL = num1
    mov bl,num2          ; BL = num2

    ; ===== EVALUAR OPERACIÓN =====
    cmp op,'+'           
    je suma
    cmp op,'-'           
    je resta
    cmp op,'*'
    je multi
    cmp op,'/'
    je divi

    ; Si no es ninguna operación válida, termina
    jmp salir

; ===== SUMA =====
suma:
    add al,bl            ; AL = AL + BL
    jmp mostrar

; ===== RESTA =====
resta:
    sub al,bl            ; AL = AL - BL
    jmp mostrar

; ===== MULTIPLICACIÓN =====
multi:
    mul bl               ; AL = AL * BL (resultado en AX)
    jmp mostrar

; ===== DIVISIÓN =====
divi:
    xor ah,ah            ; limpiar AH antes de dividir
    div bl               ; AL = AL / BL
    jmp mostrar

; ===== MOSTRAR RESULTADO =====
mostrar:
    add al,30h           ; Convertir resultado a ASCII

    mov ah,09h
    lea dx,res
    int 21h              ; Mostrar "Resultado:"

    mov dl,al            ; Pasar resultado a DL
    mov ah,02h           ; Función imprimir carácter
    int 21h              ; Mostrar número

; ===== SALIDA =====
salir:
    mov ah,4ch           ; Terminar programa
    int 21h

end main