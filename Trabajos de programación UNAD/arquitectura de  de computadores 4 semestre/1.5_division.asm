;Declaracion y modelo de pila 
.model small
.stack 100h
;declaracion de los datos 
.data
    mensaje1 db "Ingrese el primer digito: $"
    mensaje2 db 13, 10, "Ingrese el segundo digito (distinto de cero): $"
    resultadoMsg db 13, 10, "Resultado: $"
;Inicialización del segmento de datos 
.code
main:
    mov ax, @data ;Carga en AX la dirección base del segmento de datos.
    mov ds, ax ;DS (data segment) se actualiza para acceder correctamente a las 
               ;variables declaradas en .data.

;Mostrar mensaje y leer primer dígito
    lea dx, mensaje1
    mov ah, 09h
    int 21h

;Muestra "Ingrese el primer digito: " usando INT 21h y la función 09h (imprimir cadena hasta $).
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al
;Mostrar mensaje y leer segundo dígito
    lea dx, mensaje2 
    mov ah, 09h
    int 21h
;Muestra "Ingrese el segundo digito (distinto de cero): ".
;En esta funcion Lee el segundo dígito
;Convierte de ASCII a decimal restando 30h.
    mov ah, 01h
    int 21h
    sub al, 30h
;Realizar la división    
    mov ah, 0 ;prepara el valor completo en AX para la división (numerador).
    xchg al, bl ;intercambia AL (segundo número leído) con BL (primer número).
    div bl ;Div trabaja con registros 
    mov bl, al
;muestra el resultado 
    lea dx, resultadoMsg
    mov ah, 09h
    int 21h

    mov ah, 02h
    add bl, 30h
    mov dl, bl
    int 21h
;Finaliza el programa 
    mov ah, 4Ch
    int 21h
end main