.model small ;
.stack 100h

;declaración de los datos
.data
    mensaje1 db "Ingrese el primer digito: $"
    mensaje2 db 13, 10, "Ingrese el segundo digito: $"
    resultadoMsg db 13, 10, "Resultado: $"
;Inicio del programa     
.code
main:
    mov ax, @data
    mov ds, ax
; Muestra el mensaje y lee el primer dígito 
    lea dx, mensaje1 ;carga la dirección del mensaje.
    mov ah, 09h ; imprime la cadena que está en DX (hasta el $).
    int 21h

    mov ah, 01h ;espera a que el usuario presione un carácter.
    int 21h
    sub al, 30h ;convierte de carácter ASCII a valor numérico (5).
    mov bl, al ;guarda ese número en BL (primer operando).

;muestra el mensaje y lee el segundo dígito 
    lea dx, mensaje2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    sub bl, al
;Muestra el resultado 
    lea dx, resultadoMsg
    mov ah, 09h
    int 21h

    mov ah, 02h
    add bl, 30h ;convierte el número de vuelta a ASCII para mostrarlo
    mov dl, bl ;el carácter a mostrar va en DL.
    int 21h
; salir del programa 
    mov ah, 4Ch
    int 21h
end main