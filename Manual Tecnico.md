# **Práctica 2**
### Universidad de San Carlos de Guatemala
### Facultad de Ingeniería
### Escuela de Ciencias y Sistemas
### Arquitectura de Computadores y Ensambladores 1
### Sección N
<br></br>

## **Manual Técnico**
<br></br>

| Nombre | Carnet | 
| --- | --- |
| José Manuel Ibarra Pirir | 202001800 |
----
# **Descripción General**

Este proyecto consiste en desarrollar un programa en lenguaje ensamblador para la arquitectura x86 de Intel. El lenguaje ensamblador, también conocido como Assembly, es un lenguaje de bajo nivel que permite escribir programas que interactúan directamente con el hardware de la computadora. El lenguaje ensamblador se utiliza típicamente para tareas de bajo nivel, como la programación de dispositivos de entrada/salida, controladores de dispositivos, sistemas operativos y aplicaciones de tiempo real.

El proyecto se desarrollará en el contexto de la plataforma Microsoft Windows y se utilizará el conjunto de instrucciones x86 de Intel. El objetivo del programa es procesar una lista de números enteros y mostrar por pantalla su suma, su media y su valor máximo.

A continuación se presentará una descripción técnica del código en lenguaje ensamblador.
# **Descripción Técnica**

# main.asm

El archivo `main.asm` contiene el punto de entrada del programa y es responsable de inicializar las variables y llamar a las funciones principales del programa. El lenguaje utilizado es MASM (Microsoft Macro Assembler), que es un lenguaje de bajo nivel utilizado para escribir programas en lenguaje de máquina.

La sección ".data" del archivo contiene las variables globales utilizadas por el programa, que se dividen en diferentes categorías: variables de hoja de cálculo, cadenas de caracteres, variables de entrada, variables de archivo y variables de rango.

La sección ".code" contiene el código del programa, que se inicia con la etiqueta "startup" y finaliza con la etiqueta "end". El programa comienza mostrando un mensaje inicial en pantalla y espera a que el usuario presione la tecla Enter. A continuación, se muestra la hoja de cálculo en pantalla y se solicita al usuario que ingrese una operación. Si el usuario ingresa una operación válida, se llama a la función correspondiente en el archivo de ensamblador correspondiente. Si el usuario ingresa "SALIR", el programa termina y muestra un mensaje de despedida en pantalla.

```
.MODEL SMALL
.RADIX 16
.STACK
.DATA
```