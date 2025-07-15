.model small
.stack 100h
;declaración de los datos
.data
    mensaje1 db "Ingrese el primer digito: $"
    mensaje2 db 13, 10, "Ingrese el segundo digito: $"
    resultadoMsg db 13, 10, "Resultado: $"

;Inicio del código 
.code
main:
    mov ax, @data ;Carga la dirección del segmento de datos en AX.
    mov ds, ax ;Luego lo transfiere a DS, que se necesita para acceder a las variables 
               ;definidas en .data.

;Mostrar mensaje y leer primer dígito
    lea dx, mensaje1
    mov ah, 09h
    int 21h

;Muestra el mensaje "Ingrese el primer digito: " usando AH=09h (imprimir cadena) con INT 21h.
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

;Mostrar mensaje y leer segundo dígito
    lea dx, mensaje2
    mov ah, 09h
    int 21h
;Muestra el mensaje "Ingrese el segundo digito: ".
    mov ah, 01h
    int 21h
    sub al, 30h
    mov al, bl
    mul al
    mov bl, al
;Muestra el resultado 
    lea dx, resultadoMsg
    mov ah, 09h
    int 21h

    mov ah, 02h
    add bl, 30h ;convierte el número de nuevo a carácter ASCII para mostrarlo (por ejemplo, 8 → '8').
    mov dl, bl ;mueve el carácter a DL.
    int 21h
;Finalizar el programa 
    mov ah, 4Ch
    int 21h
end main