.MODEL SMALL
.RADIX 16
.STACK
;; PILA
.DATA
;;
;;
clave_capturada        db     09  dup (0)
usuario_capturado      db     06  dup (0)
espacio_leido          db     00
estado                 db     00
buffer_linea           db     0ff dup (0)
tam_liena_leida        db     00
handle_conf            dw     0000
nombre_conf            db     "PRA2.CNF", 00
;;
tam_encabezado_html    db     0c
encabezado_html        db     "<html><body>"
tam_inicializacion_tabla   db   3e
inicializacion_tabla   db     '<table border="1"><tr><td>codigo</td><td>descripcion</td></tr>'
tam_cierre_tabla       db     8
cierre_tabla           db     "</table>"
tam_footer_html        db     0e
footer_html            db     "</body></html>"
td_html                db     "<td>"
tdc_html               db     "</td>"
tr_html                db     "<tr>"
trc_html               db     "</tr>"
;; tokens
tk_creds               db     0e, "[credenciales]"
tk_nombre              db     06, "jpirir"
tk_clave               db     09, "202001800"
tk_igual               db     01, "="
tk_comillas            db     01, '"'
;;
ceros          db     2b  dup (0)
;; VARIABLES | MEMORIA RAM
numero           db   05 dup (30)
;;
usac       db    "Universidad de San Carlos de Guatemala",0a,"$"
facultad   db    "Facultad de Ingenieria",0a,"$"
curso      db    "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
nombre     db    "Nombre: Jose Manuel Ibarra Pirir",0a,"$"
carne      db    "Carnet: 202001800",0a,"$"

;; MENU PRINCIPAL
mensaje_menu_principal db "-----==Menu Principal==-----",0a,"$"
productos  db    "(P)roductos",0a,"$"
ventas     db    "(V)entas",0a,"$"
herramientas db  "(H)erramientas",0a,"$"
error_ingreso 	db "Error, ingrese una opcion valida",0a,"$"
salir_menu db "Presione (S) para salir del menu",0a,"$"
titulo_producto db  "-----==Menu Productos==-----",0a,"$"
;; MENU PRODUCTOS
mensaje_productos db "-----==Menu Productos==-----",0a,"$"
mensaje_productos_crear db "-----==Crear Producto==-----",0a,"$"
mensaje_productos_eliminar db "-----==Eliminar Producto==-----",0a,"$"
mensaje_productos_resumen db "-----==Resumen de Productos==-----",0a,"$"

;; MENU VENTAS
mensaje_ventas_registrar db "-----==Registrar Venta==-----",0a,"$"
mensaje_ventas_resumen db "-----==Resumen de Ventas==-----",0a,"$"
menu_ventas_registrar db "(R)egistrar venta",0a,"$"
menu_ventas_resumen_ventas db "(V)er resumen de ventas",0a,"$"

pedir_cod_ventas db "Ingrese el codigo del producto: ",0a,"$"


; MENU HERRAMIENTAS
mensaje_herramientas db "-----==Menu Herramientas==-----",0a,"$"
mensaje_herramientas_catalogo db "-----==Catalogo de productos==-----",0a,"$"
mensaje_herramientas_reporte_alfabetico db "-----==Reporte Alfabetico==-----",0a,"$"
mensaje_herramientas_reporte_ventas db "-----==Reporte de Ventas==-----",0a,"$"
mensaje_herramientas_prodcutos_sin_existencia db "-----==Productos sin existencia==-----",0a,"$"
menu_herramientas_catalogo db "(C)atalogo de productos completo",0a,"$"
menu_herramientas_reporte_alfabetico db "Reporte (A)lfabetico",0a,"$"
menu_herramientas_reporte_ventas db "Reporte de (V)entas",0a,"$"
menu_herramientas_productos_sin_existencia db "Productos sin (E)xistencia",0a,"$"

;;;;;;;;;;;;;;;; ERRORES LEXICOS
err_cod db "Error lexico en el codigo.",0a,"$"
err_nom db "Error lexico en la descripcion.",0a,"$"

titulo_ventas   db  "-----==Menu Ventas==-----",0a,"$"

titulo_herras   db  "-----==Menu Herramientas==-----",0a,"$"
sub_herr        db  "============",0a,"$"
prompt     db    "Elija una opcion: ",0a,"$"
prompt_code      db    "Codigo: ","$"
prompt_name      db    "Nombre: ","$"
prompt_price     db    "Precio: ","$"
prompt_units     db    "Unidades: ","$"
temp       db    00,"$"
nueva_lin  db    0a,"$"
numeroA    db    0ff
numeroB    db    50
numeros    db    20, 12, 24
buffer_entrada   db  20, 00
                 db  20 dup (0)
mostrar_prod     db  "(R)esumen de productos",0a,"$"
ingresar_prod    db  "(C)rear producto",0a,"$"
borrar_prod      db  "(E)liminar producto",0a,"$"
prods_registrados db "Productos registrados:",0a,"$"
;;; temps
cod_prod_temp    db    05 dup (0)
puntero_temp     dw    0000
;; "ESTRUCTURA PRODUCTO"
cod_prod    db    05 dup (0)
cod_name    db    21 dup (0)
cod_price   db    05 dup (0)
cod_units   db    05 dup (0)
;;
;; "ESTRUCTURA VENTA"
cod_prod_venta    db    05 dup (0)
cod_units_venta   db    05 dup (0)
;;
;; numéricos
num_price   dw    0000
num_units   dw    0000
;; archivo productos
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000

;;
archivo_vents    db   "VENT.BIN",00
handle_vents     dw   0000
;;
nombre_rep1      db   "CATALG.HTM",00
handle_reps      dw   0000

;;
.CODE
.STARTUP
;; CODIGO
inicio:
		call validar_acceso
		int 03
		;; FALTA:
		;;    - Comparar cadenas obtenidas de archivo con
		;;      datos correctos.
		;;
		;; ENCABEZADO
		mov DX, offset usac
		mov AH, 09
		int 21
		mov DX, offset facultad
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
		;; Menú
		mov DX, offset mensaje_menu_principal
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
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset prompt
		mov AH, 09
		int 21
		;; LEER 1 caracter
		mov AH, 01
		int 21
		;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; AL = CARACTER LEIDO
		cmp AL, 70 ;; p minúscula ascii
		je menu_productos
		cmp AL, 76 ;; v minúscula ascii
		je menu_ventas 
		cmp AL, 68 ;; h minúscula ascii
		je menu_herramientas 

		mov DX, offset error_ingreso
		mov AH, 09
		int 21

		jmp menu_principal

menu_productos:
		mov DX, offset mensaje_productos
		mov AH, 09
		int 21

		mov DX, offset ingresar_prod
		mov AH, 09
		int 21
		mov DX, offset borrar_prod
		mov AH, 09
		int 21
		mov DX, offset mostrar_prod
		mov AH, 09
		int 21

		mov DX, offset salir_menu
		mov AH, 09
		int 21

		mov DX, offset nueva_lin
		mov AH, 09
		int 21

		mov DX, offset prompt
		mov AH, 09
		int 21

		mov AH, 01
		int 21
		;;

		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;; AL = CARACTER LEIDO
		cmp AL, 63 ;; crear
		je ingresar_producto_archivo
		cmp AL, 65 ;; eliminar
		je eliminar_producto_archivo
		cmp AL, 72 ;; mostrar
		je mostrar_productos_archivo
		cmp AL, 73
		je menu_principal

		mov DX, offset error_ingreso
		mov AH, 09
		int 21

		jmp menu_productos
		;;
ingresar_producto_archivo:
		mov DX, offset mensaje_productos_crear
		mov AH, 09
		int 21

		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;; PEDIR CODIGO
pedir_de_nuevo_codigo:
		mov DX, offset prompt_code
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_codigo
		cmp AL, 05
		jb  aceptar_tam_cod  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod:
		mov SI, offset cod_prod
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo:	
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21

verificar_codigo:
		;; verificar si esta en el tango de A-Z y 0-9
		mov SI, offset cod_prod
		mov CX, 5

verificar_num_codigo:
		mov AL, [SI]
		cmp AL, 30
		jb error_lexico_cod
		cmp AL, 39
		ja verificar_char_codigo

		inc SI
		loop verificar_num_codigo

		jmp pedir_de_nuevo_codigo

verificar_char_codigo:
		cmp AL, 41
		jb error_lexico_cod
		cmp AL, 5a
		ja error_lexico_cod

		inc SI
		loop verificar_char_codigo

		jmp pedir_de_nuevo_nombre

error_lexico_cod: 
		mov DX, offset err_cod
		mov AH, 09
		int 21

		jmp pedir_de_nuevo_codigo

		;;; PEDIR NOMBRE
pedir_de_nuevo_nombre:
		mov DX, offset prompt_name
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_nombre
		cmp AL, 20
		jb  aceptar_tam_nom
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_nombre
		;;; mover al campo codigo en la estructura producto
aceptar_tam_nom:
		mov SI, offset cod_name
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_nombre:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
pedir_de_nuevo_precio:
		mov DX, offset prompt_price
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_precio
		cmp AL, 06  ;; tamaño máximo del campo
		jb  aceptar_tam_precio ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_precio
		;;; mover al campo codigo en la estructura producto
aceptar_tam_precio:
		mov SI, offset cod_price
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_precio:	
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_precio  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov DI, offset cod_price
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_price], AX
		;;
		mov DI, offset cod_price
		mov CX, 0005
		call memset
		;;
pedir_de_nuevo_unidades:
		mov DX, offset prompt_units
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_unidades
		cmp AL, 06  ;; tamaño máximo del campo
		jb  aceptar_tam_unidades ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_unidades
		;;; mover al campo codigo en la estructura producto
aceptar_tam_unidades:
		mov SI, offset cod_units
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_unidades:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_unidades  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;
		mov DI, offset cod_units
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_units], AX
		;;
		mov DI, offset cod_units
		mov CX, 0005
		call memset
		;; finalizó pedir datos de producto
		;;
		;;
		;;
		;;
		;; GUARDAR EN ARCHIVO
		;; probar abrirlo normal
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;; si no lo cremos
		jc  crear_archivo_prod
		;; si abre escribimos
		jmp guardar_handle_prod
crear_archivo_prod:
		mov CX, 0000
		mov DX, offset archivo_prods
		mov AH, 3c
		int 21
		;; archivo abierto
guardar_handle_prod:
		;; guardamos handle
		mov [handle_prods], AX
		;; obtener handle
		mov BX, [handle_prods]
		;; vamos al final del archivo
		mov CX, 00
		mov DX, 00
		mov AL, 02
		mov AH, 42
		int 21
		;; escribir el producto en el archivo
		;; escribí los dos primeros campos
		mov CX, 26
		mov DX, offset cod_prod
		mov AH, 40
		int 21
		;; escribo los otros dos
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 40
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21
		;;
		jmp menu_productos

mostrar_productos_archivo:
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
ciclo_mostrar:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 0026     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 0000
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar
		;; producto en estructura
		call imprimir_estructura
		jmp ciclo_mostrar
		;;
fin_mostrar:
		jmp menu_productos

eliminar_producto_archivo:
		mov DX, 0000
		mov [puntero_temp], DX
		
pedir_de_nuevo_codigo2:
		mov DX, offset prompt_code
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_codigo2
		cmp AL, 05
		jb  aceptar_tam_cod2  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo2
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod2:
		mov SI, offset cod_prod_temp
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo2:	
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo2  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov AL, 02              ;;;<<<<<  lectura/escritura
		mov DX, offset archivo_prods
		mov AH, 3d
		int 21
		mov [handle_prods], AX
		;;; TODO: revisar si existe
ciclo_encontrar:
		mov BX, [handle_prods]
		mov CX, 26
		mov DX, offset cod_prod
		moV AH, 3f
		int 21
		mov BX, [handle_prods]
		mov CX, 4
		mov DX, offset num_price
		moV AH, 3f
		int 21
		cmp AX, 0000   ;; se acaba cuando el archivo se termina
		je finalizar_borrar
		mov DX, [puntero_temp]
		add DX, 2a
		mov [puntero_temp], DX
		;;; verificar si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_encontrar
		;;; verificar el código
		mov SI, offset cod_prod_temp
		mov DI, offset cod_prod
		mov CX, 0005
		call cadenas_iguales
		;;;; <<
		cmp DL, 0ff
		je borrar_encontrado
		jmp ciclo_encontrar
borrar_encontrado:
		mov DX, [puntero_temp]
		sub DX, 2a
		mov CX, 0000
		mov BX, [handle_prods]
		mov AL, 00
		mov AH, 42
		int 21
		;;; puntero posicionado
		mov CX, 2a
		mov DX, offset ceros
		mov AH, 40
		int 21
finalizar_borrar:
		mov BX, [handle_prods]
		mov AH, 3e
		int 21
		jmp menu_productos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
menu_ventas:
		mov DX, offset titulo_ventas
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
		mov DX, offset prompt
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

ventas_registrar_msg:
		mov DX, offset mensaje_ventas_registrar
		mov AH, 09
		int 21	

		mov DX, offset nueva_lin
		mov AH, 09
		int 21

ventas_registrar:
		mov DX, offset prompt_code
		mov AH, 09
		int 21

		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21

		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  ventas_registrar
		cmp AL, 05  ;; tamaño máximo del campo
		jb  aceptar_tam_cod_venta ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp ventas_registrar

aceptar_tam_cod_venta:
		mov SI, offset cod_prod_venta
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI 

copiar_codigo_ventas:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo_ventas  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21

pedir_de_nuevo_unidades_ventas:
		mov DX, offset prompt_units
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_unidades_ventas
		cmp AL, 06  ;; tamaño máximo del campo
		jb  aceptar_tam_unidades_vents ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_unidades_ventas
		;;; mover al campo codigo en la estructura producto
aceptar_tam_unidades_vents:
		mov SI, offset cod_units_venta
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_unidades_vents:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_unidades_vents  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;
		mov DI, offset cod_units_venta
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_units], AX
		;;
		mov DI, offset cod_units_venta
		mov CX, 0005
		call memset
		;; finalizó pedir datos de producto
		;;
		;;
		;;
		;;
		;; GUARDAR EN ARCHIVO
		;; probar abrirlo normal
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_vents
		int 21
		;; si no lo cremos
		jc  crear_archivo_vents
		;; si abre escribimos
		jmp guardar_handle_vents

crear_archivo_vents:
		mov CX, 0000
		mov DX, offset archivo_vents
		mov AH, 3c
		int 21

guardar_handle_vents:

		;; guardamos handle
		mov [handle_vents], AX
		;; obtener handle
		mov BX, [handle_vents]
		;; vamos al final del archivo
		mov CX, 00
		mov DX, 00
		mov AL, 02
		mov AH, 42
		int 21
		;; escribir el producto en el archivo
		;; escribí los dos primeros campos
		mov CX, 26
		mov DX, offset cod_prod_venta
		mov AH, 40
		int 21
		;; escribo los otros dos
		mov CX, 0004
		mov DX, offset cod_units_venta
		mov AH, 40
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21
		;;
		jmp menu_ventas

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
		mov DX, offset prompt
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
		je generar_catalogo
		cmp AL, 61
		je fin
		cmp AL, 76
		je fin
		cmp AL, 65
		je fin
		cmp AL, 73
		je menu_principal
		;; FIN

		mov DX, offset error_ingreso
		mov AH, 09
		int 21
		
		jmp menu_herramientas

generar_catalogo:
		mov AH, 3c
		mov CX, 0000
		mov DX, offset nombre_rep1
		int 21
		mov [handle_reps], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [tam_encabezado_html]
		mov DX, offset encabezado_html
		int 21
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_inicializacion_tabla]
		mov DX, offset inicializacion_tabla
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
ciclo_mostrar_rep1:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 26     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 00
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar_rep1
		;; producto en estructura
		call imprimir_estructura_html
		jmp ciclo_mostrar_rep1
		;;
fin_mostrar_rep1:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		;;
		mov AH, 3e
		int 21
		jmp menu_principal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; imprimir_estructura - ...
;; ENTRADAS:
;; SALIDAS:
;;     o Impresión de estructura
imprimir_estructura:
		mov DI, offset cod_name
ciclo_poner_dolar_1:
		mov AL, [DI]
		cmp AL, 00
		je poner_dolar_1
		inc DI
		jmp ciclo_poner_dolar_1
poner_dolar_1:
		mov AL, 24  ;; dólar
		mov [DI], AL
		;; imprimir normal
		mov DX, offset cod_name
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov AX, [num_price]
		call numAcadena
		;; [numero] tengo la cadena convertida
		mov BX, 0001
		mov CX, 0005
		mov DX, offset numero
		mov AH, 40
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		ret

;;; ENTRADA:
;;    BX -> handle
imprimir_estructura_html:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;;
		mov DX, offset cod_prod
		mov SI, 0000
ciclo_escribir_codigo:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_desc
		cmp SI, 0006
		je escribir_desc
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_codigo
escribir_desc:
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;;
		mov DX, offset cod_name
		mov SI, 0000
ciclo_escribir_desc:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je cerrar_tags
		cmp SI, 0026
		je cerrar_tags
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_desc
		;;
cerrar_tags:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
		;;
		ret


;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;
;
;
;;[31][32][33][00][00]
;;     ^
;;     |
;;     ----- DI
;;;;
;;AX = 0
;;10 * AX + *1*  = 1
;;;;
;;AX = 1
;;10 * AX + 2  = 12
;;;;
;;AX = 12
;;10 * AX + 3  = 123
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;; numAcadena
;; ENTRADA:
;;     AX -> número a convertir    
;; SALIDA:
;;    [numero] -> numero convertido en cadena
;;AX = 1500
;;CX = AX  <<<<<<<<<<<
;;[31][30][30][30][30]
;;                  ^
numAcadena:
		mov CX, 0005
		mov DI, offset numero
ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero
		add DI, 0004
		;;
ciclo_convertirAcadena:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito_primera_vez
		loop ciclo_convertirAcadena
		jmp retorno_convertirAcadena
aumentar_siguiente_digito_primera_vez:
		push DI
aumentar_siguiente_digito:
		mov BL, 30     ; poner en '0' el actual
		mov [DI], BL
		dec DI         ; puntero a la cadena
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito
		pop DI         ; se recupera DI
		loop ciclo_convertirAcadena
retorno_convertirAcadena:
		ret

;; memset
;; ENTRADA:
;;    DI -> dirección de la cadena
;;    CX -> tamaño de la cadena
memset:
ciclo_memset:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo_memset
		ret

;; cadenas_iguales -
;; ENTRADA:
;;    SI -> dirección a cadena 1
;;    DI -> dirección a cadena 2
;;    CX -> tamaño máximo
;; SALIDA:
;;    DL -> 00 si no son iguales

;;         0ff si si lo son
cadenas_iguales:
ciclo_cadenas_iguales:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo_cadenas_iguales
		;;;;; <<<
		mov DL, 0ff
		ret
no_son_iguales:	mov DL, 00
		ret

validar_acceso:
		;; abrir archivo de configuración
		mov AH, 3d
		mov AL, 00
		mov DX, offset nombre_conf
		int 21
		mov [handle_conf], AX
		;; analizarlo
ciclo_lineaXlinea:
		mov DI, offset buffer_linea
		mov AL, 00
		mov [tam_liena_leida], AL
ciclo_obtener_linea:
		mov AH, 3f
		mov BX, [handle_conf]
		mov CX, 0001
		mov DX, DI
		int 21
		cmp CX, 0000
		je fin_leer_linea
		mov AL, [DI]
		cmp AL, 0a
		je fin_leer_linea
		mov AL, [tam_liena_leida]
		inc AL
		mov [tam_liena_leida], AL
		inc DI
		jmp ciclo_obtener_linea
fin_leer_linea:
		mov AL, [tam_liena_leida]
		mov AL, 00
		cmp [estado], AL   ;; verificar la cadena credenciales
		je verificar_cadena_credenciales
		mov AL, 01
		cmp [estado], AL   ;; obtener campo
		je obtener_campo_conf
		mov AL, 02
		cmp [estado], AL   ;; obtener campo
		je obtener_campo_conf
		jmp retorno_exitoso
verificar_cadena_credenciales:
		cmp CX, 0000
		je retorno_fallido
		mov CH, 00
		mov CL, [tk_creds]
		mov SI, offset tk_creds
		inc SI
		mov DI, offset buffer_linea
		call cadenas_iguales
		cmp DL, 0ff
		je si_hay_creds
		jmp retorno_fallido
si_hay_creds:
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
		;;
obtener_campo_conf:
		cmp CX, 0000
		je retorno_fallido
		mov CH, 00
		mov CL, [tk_nombre]
		mov SI, offset tk_nombre
		inc SI
		mov DI, offset buffer_linea
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_usuario
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov CH, 00
		mov CL, [tk_clave]
		mov SI, offset tk_clave
		inc SI
		mov DI, offset buffer_linea
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_clave
		jmp retorno_fallido
obtener_valor_usuario:
ciclo_espacios1:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne ver_si_es_igual
		inc DI
		jmp ciclo_espacios1
ver_si_es_igual:
		mov CH, 00
		mov CL, [tk_igual]
		mov SI, offset tk_igual
		inc SI
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_cadena_usuario
		jmp retorno_fallido
obtener_valor_cadena_usuario:
ciclo_espacios2:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne capturar_usuario
		inc DI
		jmp ciclo_espacios2
capturar_usuario:
		mov CX, 0006    ;; TAMAÑO DEL USUARIO: 6 caracteres
		mov SI, offset usuario_capturado
ciclo_cap_usuario:
		inc DI
		inc SI
		mov AL, [DI]
		mov [SI], AL
		loop ciclo_cap_usuario
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
obtener_valor_clave:
ciclo_espacios3:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne ver_si_es_igual2
		inc DI
		jmp ciclo_espacios3
ver_si_es_igual2:
		mov CH, 00
		mov CL, [tk_igual]
		mov SI, offset tk_igual
		inc SI
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_cadena_clave
		jmp retorno_fallido
obtener_valor_cadena_clave:
ciclo_espacios4:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne capturar_clave
		inc DI
		jmp ciclo_espacios4
capturar_clave:
		mov CX, 0009    ;; TAMAÑO DE LA CLAVE: 9 caracteres
		mov SI, offset clave_capturada
ciclo_cap_clave:
		inc DI
		inc SI
		mov AL, [DI]
		mov [SI], AL
		loop ciclo_cap_clave
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
		;; ver si el nombre de campo es "usuario"
		;;      trabajo con la línea
		;; comparar nombre
		;; comparar clave
		;; si son correctos devolver en DL = 0ff
		;; si no son correctos devolver en DL = 00
retorno_fallido:
		mov DL, 00
		ret
retorno_exitoso:
		mov DL, 0ff
		ret
fin:
.EXIT
END
