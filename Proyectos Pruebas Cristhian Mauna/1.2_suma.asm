.model small ;se usa un modelo de memoria con un solo segmento de datos y uno de 
             ;código, de hasta 64 KB cada uno.
.stack 100h ; reserva 256 bytes para la pila.

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
;Muestra el primer mensaje 
    lea dx, mensaje1
    mov ah, 09h
    int 21h
;lee el primer digito 
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al
;en esta funcion muestra el segundo mensaje y lee el segundo dígito 
    lea dx, mensaje2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    add bl, al
;muestra el mensaje y el resultado 
    lea dx, resultadoMsg
    mov ah, 09h
    int 21h

    mov ah, 02h
    add bl, 30h
    mov dl, bl
    int 21h
;Termina el programa 
    mov ah, 4Ch ;función de DOS para terminar el programa.
    int 21h ;devuelve el control al sistema operativo.
end main