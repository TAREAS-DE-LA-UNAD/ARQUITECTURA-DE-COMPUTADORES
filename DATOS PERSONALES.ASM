;========================================================
; Programa: Mostrar datos del estudiante
; Compatible con MASM / TASM
; Uso de interrupciones INT 21H
;========================================================

.MODEL SMALL              ; Modelo de memoria pequeño
.STACK 100H               ; Reserva espacio para la pila

.DATA                     ; Inicio del segmento de datos

linea      DB "=========================================$"
; Cadena decorativa terminada en $

titulo     DB "       DATOS DEL ESTUDIANTE       $"
; Título principal mostrado en pantalla

espacio    DB " $"
; Variable de espacio (no obligatoria)

nombreMsg  DB "Nombre : Hollman Daniel Adame$"
; Cadena que contiene el nombre del estudiante

carreraMsg DB "Carrera: Ingenieria de Sistemas$"
; Cadena que contiene la carrera del estudiante

salto      DB 13,10,"$"
; Salto de línea:
; 13 = retorno de carro
; 10 = nueva línea

.CODE                     ; Inicio del segmento de código

MAIN PROC                 ; Inicio del procedimiento principal

    ;------------------------------------
    ; Inicializar el segmento de datos
    ;------------------------------------

    MOV AX, @DATA         ; Cargar dirección del segmento de datos
    MOV DS, AX            ; Mover dirección a DS

    ;------------------------------------
    ; Mostrar línea decorativa superior
    ;------------------------------------

    LEA DX, linea         ; Cargar dirección de la cadena "linea"
    MOV AH, 09H           ; Función 09H de INT 21H -> mostrar cadena
    INT 21H               ; Llamar interrupción DOS

    ;------------------------------------
    ; Mostrar salto de línea
    ;------------------------------------

    LEA DX, salto         ; Cargar dirección del salto de línea
    MOV AH, 09H           ; Función para imprimir texto
    INT 21H               ; Ejecutar interrupción

    ;------------------------------------
    ; Mostrar título
    ;------------------------------------

    LEA DX, titulo        ; Cargar dirección del título
    MOV AH, 09H           ; Función de impresión
    INT 21H               ; Mostrar título

    ;------------------------------------
    ; Mostrar salto de línea
    ;------------------------------------

    LEA DX, salto         ; Dirección del salto
    MOV AH, 09H           ; Función imprimir
    INT 21H               ; Ejecutar impresión

    ;------------------------------------
    ; Mostrar segunda línea decorativa
    ;------------------------------------

    LEA DX, linea         ; Dirección de la línea decorativa
    MOV AH, 09H           ; Función imprimir cadena
    INT 21H               ; Mostrar línea

    ;------------------------------------
    ; Mostrar doble salto de línea
    ;------------------------------------

    LEA DX, salto         ; Primer salto
    MOV AH, 09H
    INT 21H

    LEA DX, salto         ; Segundo salto
    MOV AH, 09H
    INT 21H

    ;------------------------------------
    ; Mostrar nombre del estudiante
    ;------------------------------------

    LEA DX, nombreMsg     ; Dirección del nombre
    MOV AH, 09H           ; Función imprimir cadena
    INT 21H               ; Mostrar nombre

    ;------------------------------------
    ; Salto de línea
    ;------------------------------------

    LEA DX, salto         ; Dirección del salto
    MOV AH, 09H
    INT 21H

    ;------------------------------------
    ; Mostrar carrera del estudiante
    ;------------------------------------

    LEA DX, carreraMsg    ; Dirección de la carrera
    MOV AH, 09H           ; Función imprimir
    INT 21H               ; Mostrar carrera

    ;------------------------------------
    ; Doble salto de línea
    ;------------------------------------

    LEA DX, salto         ; Primer salto
    MOV AH, 09H
    INT 21H

    LEA DX, salto         ; Segundo salto
    MOV AH, 09H
    INT 21H

    ;------------------------------------
    ; Mostrar línea decorativa final
    ;------------------------------------

    LEA DX, linea         ; Dirección de línea decorativa
    MOV AH, 09H           ; Función imprimir cadena
    INT 21H

    ;------------------------------------
    ; Finalizar programa
    ;------------------------------------

    MOV AH, 4CH           ; Función 4CH -> terminar programa
    INT 21H               ; Regresar al sistema operativo DOS

MAIN ENDP                 ; Fin del procedimiento principal

END MAIN                  ; Fin del programa