.model small    ; Define el tamaño de los segmentos de memoria (pequeño, con un solo segmento de datos y uno de código)
.stack          ; Define el área de pila (sin tamaño especificado usa el predeterminado)

.data           ; Sección donde se declaran los datos
msg  db  'Ingrese N (1-9): $'  ; Mensaje para pedir el número al usuario
res  db  13,10,'Suma: $'       ; Mensaje de salida, con saltos de línea y retorno de carro

.code           ; Sección de código ejecutable
main:
    mov ax,@data
    mov ds,ax   ; Inicializa el registro de segmento de datos

    ; Muestra el mensaje de solicitud
    mov ah,09h
    lea dx,msg
    int 21h     ; Llama a la interrupción DOS para mostrar texto

    ; Lee el carácter ingresado por el usuario
    mov ah,01h
    int 21h     ; Lee un carácter del teclado, se guarda en AL
    sub al,30h  ; Convierte el carácter ASCII a su valor numérico (ej: '5' → 5)
    mov cl,al   ; Guarda el límite superior en CL

    xor ax,ax   ; Limpia AX (pone su valor en 0)
    mov bl,1    ; Inicializa el contador en 1

sumar:
    add ax,bx   ; Suma el valor actual de BX al acumulador AX
    inc bl      ; Incrementa el contador en 1
    cmp bl,cl   ; Compara el contador con el límite ingresado
    jbe sumar   ; Si el contador es menor o igual, repite la suma

    add al,30h  ; Convierte el resultado numérico de nuevo a carácter ASCII para mostrarlo

    ; Muestra el mensaje de resultado
    mov ah,09h
    lea dx,res
    int 21h

    ; Muestra el valor de la suma
    mov dl,al
    mov ah,02h
    int 21h     ; Muestra el carácter almacenado en DL

    ; Finaliza el programa y vuelve a DOS
    mov ah,4ch
    int 21h
end main
