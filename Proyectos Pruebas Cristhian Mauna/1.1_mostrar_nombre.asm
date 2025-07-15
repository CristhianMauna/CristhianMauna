.model small ; se define el modelo de memoria 
.stack 100h ;Reserva 256 bytes (100h en hexadecimal para la pila (stack), usada por el 
;sistema para llamadas, interrupciones y almacenamiento temporal 

.data ;aqui se definen las variables y cadenas de texto 
    nombre db "Cristian Daniel Mauna Ledezma$", 13, 10, 0
    id db "ID: 1002820564$", 13, 10, 0

.code ; define un segmento de código 
main: ;la sección de de código inicia aquí. maín: es la etiqueta del punto de entrada. 
    mov ax, @data ;es la direccion base del segmento de datos 
    mov ds, ax; primero se carga en Ax y luego se transfiere a Ds, porque no se puede hacer
    ; mov ds, @data directamente

    ;muestra el nombre en pantalla  
    lea dx, nombre
    mov ah, 09h 
    int 21h

    ;muestra el número de indentificación 
    lea dx, id
    mov ah, 09h
    int 21h

    ;salir del programa 
    mov ah, 4Ch;es la función DOS para terminar el programa y retornar el control al
               ;sistema operativo.
    int 21h ;ejecuta esta funcion 

end main