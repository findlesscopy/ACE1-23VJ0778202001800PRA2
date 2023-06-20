.MODEL SMALL
.RADIX 16
.STACK
.DATA
;; VARIABLES | MEMORIA RAM
nuevalinea db 0a,"$"
elegiropcion db "Elija una opcion: ",0a,"$"
temp db 00,"$"

cadena db "Hola Mundo","$"
usac db "Universidad de San Carlos de Guatemala",0a,"$"
facultad db "Facultad de Ingenieria",0a,"$"
curso db "Arquitectura de Computadoras y Ensambladores",0a,"$"
nombre db "Jose Manuel Ibarra Pirir",0a,"$"
carnet db "202001800",0a,"$"

;Opciones del menu
menu db "Menu",0a,"$"
productos db "(P)roductos",0a,"$"
ventas db "(V)entas",0a,"$"
herramientas db "(H)erramientas",0a,"$"
menu_productos_prompt db "Menu Productos",0a,"$"
menu_ventas_prompt db "Menu Ventas",0a,"$"
menu_herramientas_prompt db "Menu Herramientas",0a,"$"

; Opciones de Productos


.CODE

.STARTUP
;;CODIGO
inicio:
    ;;Encabezado
    mov DX, offset usac 
    mov AH, 09
    int 21

    mov DX, offset facultad 
    mov AH, 09
    int 21

    mov DX, offset curso 
    mov AH, 09
    int 21

    mov DX, offset nombre 
    mov AH, 09
    int 21

    mov DX, offset carnet 
    mov AH, 09
    int 21

    ;Salto de linea  
    mov DX, offset nuevalinea 
    mov AH, 09
    int 21

    mov DX, offset nuevalinea 
    mov AH, 09
    int 21
    ; Menú
    mov DX, offset menu 
    mov AH, 09
    int 21

    mov DX, offset productos 
    mov AH, 09
    int 21 

    mov DX, offset ventas 
    mov AH, 09
    int 21

    mov DX, offset herramientas 
    mov AH, 09
    int 21

    ;Salto de linea
    mov DX, offset nuevalinea 
    mov AH, 09
    int 21

    ;Elegir opcion
    mov DX, offset elegiropcion
    mov AH, 09
    int 21

    mov AH, 08
    int 21
    ;; AL = CARACTER LEIDO SEGÚN LA INTERRUCIÓN

    cmp AL, 70 ;; Compara con p minus
    je menu_productos

    cmp AL, 76 ;; Compara con v minus
    je menu_ventas

    cmp AL, 68 ;; Compara con h minus
    je menu_herramientas


menu_productos:
    mov DX, offset menu_productos_prompt 
    mov AH, 09
    int 21
    jmp fin
menu_ventas:   
    mov DX, offset menu_ventas_prompt 
    mov AH, 09
    int 21
    jmp fin
menu_herramientas:
    mov DX, offset menu_herramientas_prompt 
    mov AH, 09
    int 21
    jmp fin

fin:

.EXIT
END

