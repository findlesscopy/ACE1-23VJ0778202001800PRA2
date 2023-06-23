.MODEL SMALL
.RADIX 16
.STACK
;; PILA
.DATA
;; VARIABLES | MEMORIA RAM

;; ENCABEZADO
usac       db    "Universidad de San Carlos de Guatemala",0a,"$"
facultad   db    "Facultad de Ingenieria",0a,"$"
vacaciones db    "Escuela de vacaciones",0a,"$"
curso      db    "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
nombre     db    "Nombre: Jose Manuel Ibarra Pirir",0a,"$"
carne      db    "Carnet: 202001800",0a,"$"

;; UTILS 
nueva_lin  db    0a,"$"
ingreso_opcion db "Ingrese una opcion: ",0a,"$"
error_ingreso 	db "Error, ingrese una opcion valida",0a,"$"
salir_menu db "Presione (S) para salir del menu",0a,"$"

;; MENU PRINCIPAL
mensaje_menu_principal db "-----==Menu Principal==-----",0a,"$"
menu_principal_productos 	db "(P)roductos",0a,"$"
menu_principal_ventas   	db "(V)entas",0a,"$"
menu_principal_herramientas db "(H)erramientas",0a,"$"

;; MENU PRODUCTOS
mensaje_productos db "-----==Menu Productos==-----",0a,"$"
mensaje_productos_crear db "-----==Crear Producto==-----",0a,"$"
mensaje_productos_eliminar db "-----==Eliminar Producto==-----",0a,"$"
mensaje_productos_resumen db "-----==Resumen de Productos==-----",0a,"$"
menu_productos_crear db "(C)rear producto",0a,"$"
menu_productos_eliminar db "(E)liminar producto",0a,"$"
menu_productos_resumen db "(R)esumen de productos",0a,"$"

;; MENU VENTAS
mensaje_ventas db "-----==Menu Ventas==-----",0a,"$"
mensaje_ventas_registrar db "-----==Registrar Venta==-----",0a,"$"
mensaje_ventas_resumen db "-----==Resumen de Ventas==-----",0a,"$"
menu_ventas_registrar db "(R)egistrar venta",0a,"$"
menu_ventas_resumen_ventas db "(V)er resumen de ventas",0a,"$"

;; MENU HERRAMIENTAS
mensaje_herramientas db "-----==Menu Herramientas==-----",0a,"$"
mensaje_herramientas_catalogo db "-----==Catalogo de productos==-----",0a,"$"
mensaje_herramientas_reporte_alfabetico db "-----==Reporte Alfabetico==-----",0a,"$"
mensaje_herramientas_reporte_ventas db "-----==Reporte de Ventas==-----",0a,"$"
mensaje_herramientas_prodcutos_sin_existencia db "-----==Productos sin existencia==-----",0a,"$"
menu_herramientas_catalogo db "(C)atalogo de productos completo",0a,"$"
menu_herramientas_reporte_alfabetico db "Reporte (A)lfabetico",0a,"$"
menu_herramientas_reporte_ventas db "Reporte de (V)entas",0a,"$"
menu_herramientas_productos_sin_existencia db "Productos sin (E)xistencia",0a,"$"
;; archivo productos
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000
;;
.CODE
.STARTUP
;; CODIGO
inicio:
		;; ENCABEZADO
		mov DX, offset usac
		mov AH, 09
		int 21
		mov DX, offset facultad
		mov AH, 09
		int 21
		mov DX, offset vacaciones
		mov AH, 09
		int 21
		mov DX, offset curso
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset nombre
		mov AH, 09
		int 21
		mov DX, offset carne
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
menu_principal:
		mov DX, offset mensaje_menu_principal
		mov AH, 09
		int 21
		mov DX, offset menu_principal_productos
		mov AH, 09
		int 21
		mov DX, offset menu_principal_ventas
		mov AH, 09
		int 21
		mov DX, offset menu_principal_herramientas
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset ingreso_opcion
		mov AH, 09
		int 21
		;; INGRESO DE OPCION
		mov AH, 01
		int 21 ;; AL = Caracter ingresado
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; COMPARACION
		cmp AL, 70
		je menu_productos
		cmp AL, 76
		je menu_ventas
		cmp AL, 68
		je menu_herramientas
		;; FIN

		mov DX, offset error_ingreso
		mov AH, 09
		int 21
		
		jmp menu_principal


menu_productos:
		mov DX, offset mensaje_productos
		mov AH, 09
		int 21

		mov DX, offset menu_productos_crear
		mov AH, 09
		int 21
		mov DX, offset menu_productos_eliminar
		mov AH, 09
		int 21
		mov DX, offset menu_productos_resumen
		mov AH, 09
		int 21
		mov DX, offset salir_menu
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset ingreso_opcion
		mov AH, 09
		int 21

		;; INGRESO DE OPCION
		mov AH, 01
		int 21 ;; AL = Caracter ingresado
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; COMPARACION
		cmp AL, 63
		je productos_crear
		cmp AL, 65
		je productos_eliminar
		cmp AL, 72
		je productos_resumen
		cmp AL, 73
		je menu_principal
		;; FIN

		mov DX, offset error_ingreso
		mov AH, 09
		int 21
		
		jmp menu_productos

productos_crear:
		mov DX, offset mensaje_productos_crear
		mov AH, 09
		int 21

		jmp fin

productos_eliminar:
		mov DX, offset mensaje_productos_eliminar
		mov AH, 09
		int 21

		jmp fin

productos_resumen:
		mov DX, offset mensaje_productos_resumen
		mov AH, 09
		int 21

		jmp fin

menu_ventas:
		mov DX, offset mensaje_ventas
		mov AH, 09
		int 21

		mov DX, offset menu_ventas_registrar
		mov AH, 09
		int 21
		mov DX, offset menu_ventas_resumen_ventas
		mov AH, 09
		int 21
		mov DX, offset salir_menu
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset ingreso_opcion
		mov AH, 09
		int 21

		;; INGRESO DE OPCION
		mov AH, 01
		int 21 ;; AL = Caracter ingresado
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; COMPARACION
		cmp AL, 72
		je ventas_registrar
		cmp AL, 76
		je ventas_resumen
		cmp AL, 73
		je menu_principal
		;; FIN

		mov DX, offset error_ingreso
		mov AH, 09
		int 21
		
		jmp menu_ventas

ventas_registrar:
		mov DX, offset mensaje_ventas_registrar
		mov AH, 09
		int 21

		jmp fin
ventas_resumen:
		mov DX, offset mensaje_ventas_resumen
		mov AH, 09
		int 21

		jmp fin

menu_herramientas:
		mov DX, offset mensaje_herramientas
		mov AH, 09
		int 21

		mov DX, offset menu_herramientas_catalogo
		mov AH, 09
		int 21
		mov DX, offset menu_herramientas_reporte_alfabetico
		mov AH, 09
		int 21
		mov DX, offset menu_herramientas_reporte_ventas
		mov AH, 09
		int 21
		mov DX, offset menu_herramientas_productos_sin_existencia
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset ingreso_opcion
		mov AH, 09
		int 21

		;; INGRESO DE OPCION
		mov AH, 01
		int 21 ;; AL = Caracter ingresado
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; COMPARACION
		cmp AL, 63
		je herramientas_catalogo
		cmp AL, 61
		je herramientas_alfabetico
		cmp AL, 76
		je herramientas_ventas
		cmp AL, 65
		je herramientas_sin_existencia
		cmp AL, 73
		je menu_principal
		;; FIN

		mov DX, offset error_ingreso
		mov AH, 09
		int 21
		
		jmp menu_herramientas

herramientas_catalogo:
		mov DX, offset mensaje_herramientas_catalogo
		mov AH, 09
		int 21

		jmp fin

herramientas_alfabetico:
		mov DX, offset mensaje_herramientas_reporte_alfabetico
		mov AH, 09
		int 21

		jmp fin

herramientas_ventas:
		mov DX, offset mensaje_herramientas_reporte_ventas
		mov AH, 09
		int 21

		jmp fin

herramientas_sin_existencia:
		mov DX, offset mensaje_herramientas_prodcutos_sin_existencia
		mov AH, 09
		int 21

		jmp fin

fin:
.EXIT
END
