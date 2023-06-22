;PROYECTO BUSCAMINAS FUNDAMENTOS DE ORGANIZACIÓN DE COMPUTADORES


;INTEGRANTES:


;Eyden Su Díaz
;Angela Aguilar Salazar
;Elder Leon Perez
;Brasly Villarebia Morales


.686
.MODEL flat,C, STDCALL

include \masm32\include\masm32rt.inc
includelib \masm32\lib\masm32.lib

INCLUDE \masm32\include\msvcrt.inc          ; crt_time, crt_srand, crt_rand, crt_printf, crt_exit
INCLUDELIB \masm32\lib\msvcrt.lib







.data

fmt db "%c ", 0                             ; Formato de impresión para caracteres


; DATOS DE PANTALLA PRINCIPAL

bienvenida db "BIENVENIDO AL BUSCAMINAS", 10
opciones db "(1) Principiante ", 10, "(2) Intermedio ", 10, "(3) Avanzado ", 10, "(4) Personalizado", 10


mensajeSeleccion db "Seleccione la dificultad (1-4): ", 0
seleccionDificultad db 50 dup(?)
seleccionInvalida db "Selección inválida.", 0


principianteOpcion db "1", 0
intermedioOpcion db "2", 0
avanzadoOpcion db "3", 0
personalizadoOpcion db "4",0

cambioLinea db 10





; DATOS DE JUEGO

preguntaJuego db "¿Que desea hacer?", 10
opcionesJuego db "(1) Excavar ", 10, "(2) Quitar Bandera", 10, "(3) Poner Bandera ", 10, "(4) Poner ?", 10

textoSelecJuego db "Seleccione:", 0
seleccionAccion db 50 dup(?)

excavar db "1", 0
quitBand db "2", 0
ponBand db "3", 0
ponPreg db "4", 0




; DATOS DE NIVEL PERSONALIZADO
; ?x?
; minas max 50% del mapa

mensajePersonalizado db "¡Bienvenido al Modo Personalizado!", 0  

alturaMensaje db "Seleccione la altura del mapa:", 0
seleccionAltura db 50 dup(?)

anchoMensaje db "Seleccione el ancho del mapa:", 0
seleccionAncho db 50 dup(?)

minasMensaje db "Seleccione la cantidad de minas:", 0
seleccionMinas db 50 dup(?)

cargando db "GENERANDO MAPA...", 0





;    DATOS DEL NIVEL PRINCIPIANTE
;    9x9
;    10 minas

maxLineaPrin = 9              ; MAX DE LARGO DE FILA
mapSizePrin = 89              ; TAMAÑO DEL MAPA

mensajePrincipiante db "Bienvenido al Modo Principiante", 0

;MAPA

matrizVisualPrincipiante db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                        db '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah

matrizLogicaPrincipiante db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0
                        db 0, 0, 0, 0, 0, 0, 0, 0, 0






;   DATOS DEL NIVEL INTERMEDIO
;   16x16
;   40 minas

maxLineaInt = 16              ; MAX DE LARGO DE FILA
mapSizeInt = 271              ; Tamaño del mapa

mensajeIntermedio db "¡Bienvenido al Modo Intermedio!", 0

;MAPA

matrizVisualIntermedio db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah

matrizLogicaIntermedio db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0





;   DATOS DEL NIVEL AVANZADO
;   16x30
;   99 minas

maxLineaAvan = 16              ; MAX DE LARGO DE FILA
mapSizeAvan = 511              ; Tamaño del mapa

mensajeAvanzado db "¡Bienvenido al Modo Avanzado!", 0

;MAPA

matrizVisualAvanzado db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah
                      db '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', '_', 0Ah

matrizLogicaAvanzado db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0



; ESPACIADO PARA VISUALIZACIÓN EN CONSOLA

espacio db " ", 10
espacio2 db " ", 10
espacio3 db " ", 10
espacio4 db " ", 0





.code

;  COLOCACIÓN DE MINAS EN EL MAPA PRINCIPIANTE
;  E IMPRESIÓN DEL MAPA

minasPosicionPrincipiante PROC
    push ebp
    mov ebp, esp

    mov ecx, 10                   ; Inicializa el contador de minas restantes
    mov edx, ecx                  ; Copia el contador de minas en edx

generar_minaPrin:
    ; Genera una posición aleatoria dentro de la matriz
    call crt_rand                 ; EAX = rand()
    mov ecx, mapSizePrin
    div ecx                       ; EDX:EAX/ECX -> EAX remainder EDX
    mov esi, edx                  ; Obtiene el resto (posición aleatoria)

    ; Verifica si la posición ya contiene una mina
    mov al, byte ptr matrizLogicaPrincipiante[esi]
    cmp al, 0
    jne generar_minaPrin          ; Si la posición ya contiene una mina, genera una nueva

    ; Coloca una mina en la posición seleccionada
    mov byte ptr matrizVisualPrincipiante[esi], 'B'
    mov byte ptr matrizLogicaPrincipiante[esi], 1

    dec edx                       ; Decrementa el contador de minas restantes

    cmp edx, 0                    ; Si se colocaron todas las bombas finalizar
    je minasPrincipianteSalida
    loopnz generar_minaPrin       ; Repite el proceso hasta que se coloquen todas las minas

    pop ebp
    ret
    minasPrincipianteSalida:
    pop ebp
    ret
minasPosicionPrincipiante ENDP

mapaImpresoPrincipiante PROC
    sub esp, 8                                 ; Reserva espacio para los argumentos de C

    ; srand( time (NULL) )
    mov DWORD PTR [esp], 0
    call crt_time                              ; EAX = time(0)
    mov [esp], eax 
    call crt_srand                             ; srand (EAX)

    call minasPosicionPrincipiante             ; Genera las posiciones de las minas

    ; Imprime la matriz visual
    mov ebx, mapSizePrin
    mov esi, 0
    mov ecx, 0                                 ; Contador de caracteres en la fila actual
    LL1:
        push ebx
        push esi
        movzx eax, byte ptr matrizVisualPrincipiante[esi]
        push eax
        push OFFSET fmt
        call crt_printf                            ; printf (fmt,eax)
        add esp, 16
        inc esi
        inc ecx                                    ; Incrementa el contador de caracteres en la fila actual
        cmp ecx, maxLineaPrin                      ; Comprueba si se ha alcanzado el máximo de caracteres por fila
        je CambioLinea                             ; Si se ha alcanzado el máximo de caracteres, salta a CambioLinea
        jmp LL2

    CambioLinea:

        push OFFSET fmt
        push offset cambioLinea
        call crt_printf                           ; print para cambiar de linea
        mov ecx, 0                                ; Reinicia el contador de caracteres en la fila actual

    LL2:
        dec ebx
        jnz LL1

call principiante_Aux
mapaImpresoPrincipiante ENDP






;  COLOCACIÓN DE MINAS EN EL MAPA INTERMEDIO
;  E IMPRESIÓN DEL MAPA

minasPosicionIntermedio:
    push ebp
    mov ebp, esp

    mov ecx, 40                       ; Inicializa el contador de minas restantes
    mov edx, ecx                      ; Copia el contador de minas en edx

generar_minaInter:
    ; Genera una posición aleatoria dentro de la matriz
    call crt_rand                     ; EAX = rand()
    mov ecx, mapSizeInt
    div ecx                           ; EDX:EAX/ECX -> EAX remainder EDX
    mov esi, edx                      ; Obtiene el resto (posición aleatoria)

    ; Verifica si la posición ya contiene una mina
    mov al, byte ptr matrizLogicaIntermedio[esi]
    cmp al, 0
    jne generar_minaInter             ; Si la posición ya contiene una mina, genera una nueva

    ; Coloca una mina en la posición seleccionada
    mov byte ptr matrizVisualIntermedio[esi], 'B'
    mov byte ptr matrizLogicaIntermedio[esi], 1

    dec edx                           ; Decrementa el contador de minas restantes

    cmp edx, 0
    je minasIntermedioSalida
    loopnz generar_minaInter          ; Repite el proceso hasta que se coloquen todas las minas

    pop ebp
    ret
    minasIntermedioSalida:
    pop ebp
    ret

; Función para imprimir el mapa en el nivel Intermedio
mapaImpresoIntermedio PROC
    sub esp, 8                                ; Reserva espacio para los argumentos de C

    ; srand( time (NULL) )
    mov DWORD PTR [esp], 0
    call crt_time                             ; EAX = time(0)
    mov [esp], eax
    call crt_srand                            ; srand (EAX)

    call minasPosicionIntermedio              ; Genera las posiciones de las minas

    ; Imprime la matriz visual
    mov ebx, mapSizeInt
    mov esi, 0
    mov ecx, 0                                ; Contador de caracteres en la fila actual
    LL1_intermedio:
    push ebx
    push esi
    movzx eax, byte ptr matrizVisualIntermedio[esi]
    push eax
    push OFFSET fmt
    call crt_printf                           ; printf (fmt,eax)
    add esp, 16
    inc esi
    inc ecx                                   ; Incrementa el contador de caracteres en la fila actual
    cmp ecx, maxLineaInt                      ; Comprueba si se ha alcanzado el máximo de caracteres por fila
    je CambioLinea_intermedio                 ; Si se ha alcanzado el máximo de caracteres, salta a CambioLinea
    jmp LL2_intermedio

    CambioLinea_intermedio:

    push OFFSET fmt
    push offset cambioLinea
    call crt_printf                           ; print para cambiar de linea
    mov ecx, 0                                ; Reinicia el contador de caracteres en la fila actual

    LL2_intermedio:
    dec ebx
    jnz LL1_intermedio
call intermedio_Aux
mapaImpresoIntermedio ENDP








;  COLOCACIÓN DE MINAS EN EL MAPA AVANZADO
;  E IMPRESIÓN DEL MAPA

minasPosicionAvanzado:
    push ebp
    mov ebp, esp

    mov ecx, 99                       ; Inicializa el contador de minas restantes
    mov edx, ecx                      ; Copia el contador de minas en edx

generar_minaAvanzado:
    ; Genera una posición aleatoria dentro de la matriz
    call crt_rand                     ; EAX = rand()
    mov ecx, mapSizeAvan 
    div ecx                           ; EDX:EAX/ECX -> EAX remainder EDX
    mov esi, edx                      ; Obtiene el resto (posición aleatoria)

    ; Verifica si la posición ya contiene una mina
    mov al, byte ptr matrizLogicaAvanzado[esi]
    cmp al, 0
    jne generar_minaAvanzado          ; Si la posición ya contiene una mina, genera una nueva

    ; Coloca una mina en la posición seleccionada
    mov byte ptr matrizVisualAvanzado[esi], 'B'
    mov byte ptr matrizLogicaAvanzado[esi], 1

    dec edx                           ; Decrementa el contador de minas restantes

    cmp edx, 0
    je minasAvanzadoSalida
    loopnz generar_minaAvanzado       ; Repite el proceso hasta que se coloquen todas las minas

    pop ebp
    ret
    minasAvanzadoSalida:
    pop ebp
    ret

; Función para imprimir el mapa en el nivel Avanzado
mapaImpresoAvanzado PROC
    sub esp, 8                                ; Reserva espacio para los argumentos de C

    ; srand( time (NULL) )
    mov DWORD PTR [esp], 0
    call crt_time                             ; EAX = time(0)
    mov [esp], eax
    call crt_srand                            ; srand (EAX)

    call minasPosicionAvanzado                ; Genera las posiciones de las minas

    ; Imprime la matriz visual
    mov ebx, mapSizeAvan
    mov esi, 0
    mov ecx, 0                                ; Contador de caracteres en la fila actual
    LL1_avanzado:
    push ebx
    push esi
    movzx eax, byte ptr matrizVisualAvanzado[esi]
    push eax
    push OFFSET fmt
    call crt_printf                           ; printf (fmt,eax)
    add esp, 16
    inc esi
    inc ecx                                   ; Incrementa el contador de caracteres en la fila actual
    cmp ecx, maxLineaAvan                     ; Comprueba si se ha alcanzado el máximo de caracteres por fila
    je CambioLinea_avanzado                   ; Si se ha alcanzado el máximo de caracteres, salta a CambioLinea
    jmp LL2_avanzado

    CambioLinea_avanzado:

    push OFFSET fmt
    push offset cambioLinea
    call crt_printf                           ; print para el cambio de linea
    mov ecx, 0                                ; Reinicia el contador de caracteres en la fila actual

    LL2_avanzado:
    dec ebx
    jnz LL1_avanzado

call avanzado_Aux
mapaImpresoAvanzado ENDP




;   INICIO DEL JUEGO
; MENSAJES DE BIENVENIDA, OPCIONES, SELECCIÓN

start:

    push offset bienvenida
    call StdOut

    push 50
    push offset seleccionDificultad
    call StdIn

    push offset seleccionDificultad
    push offset principianteOpcion
    call crt__stricmp                ; COMPARA AMBOS STRING QUE SE MOVIERON A LA MEMORIA

    cmp eax, 0                       ; SI SON IDENTICOS (0) ENTRAR AL MENU DE INTERMEDIO, SINO CONTINUA
    je principiante
    jne auxInt


; FUNCIONES PARA COMPARACIÓN DE SELECCIÓN
; Dependiendo de que haya escrito el usuario en el input llevará a un nivel o mensaje de error

auxInt:
    push offset seleccionDificultad
    push offset intermedioOpcion
    call crt__stricmp                  

    cmp eax, 0
    je intermedio
    jne auxAva

auxAva:
    push offset seleccionDificultad
    push offset avanzadoOpcion
    call crt__stricmp

    cmp eax, 0
    je avanzado
    jne auxPer

auxPer:
    push offset seleccionDificultad
    push offset personalizadoOpcion
    call crt__stricmp

    cmp eax, 0
    je personalizado
    jne error



;   MENSAJE DE ERROR

error:
    
    push offset espacio
    call StdOut
    
    push offset seleccionInvalida
    call StdOut
    
    push offset espacio
    call StdOut
    call start





;FUNCIONES DE NIVELES
; Estas funciones crean el mapa y luego preguntan al usuario que desea hacer





; FUNCION DE NIVEL PRINCIPIANTE

principiante:
    
    push offset mensajePrincipiante
    call StdOut

    push offset espacio
    call StdOut

    call mapaImpresoPrincipiante

principiante_Aux:

    push offset espacio2
    call StdOut
    
    push offset preguntaJuego
    call StdOut

    push 50
    push offset seleccionAccion
    call StdIn

    ;          push offset seleccionAccion
    ;          push offset excavar
    ;          call crt__stricmp

    ;          cmp eax, 0
    ;          je cambioExc

    push 0
    call ExitProcess





; FUNCION DE NIVEL INTERMEDIO

intermedio:
    
    push offset mensajeIntermedio
    call StdOut

    push offset espacio
    call StdOut

    call mapaImpresoIntermedio

intermedio_Aux:

    push offset espacio2
    call StdOut
    
    push offset preguntaJuego
    call StdOut

    push 50
    push offset seleccionAccion
    call StdIn
    
    push 0
    call ExitProcess


; FUNCION DE NIVEL AVANZADO

avanzado:
    
    push offset mensajeAvanzado
    call StdOut

    push offset espacio
    call StdOut

    call mapaImpresoAvanzado

avanzado_Aux:
    push offset espacio2
    call StdOut
    
    push offset preguntaJuego
    call StdOut

    push 50
    push offset seleccionAccion
    call StdIn
    
    push 0
    call ExitProcess




; FUNCION DE NIVEL PERSONALIZADO

personalizado:
    
    push offset mensajePersonalizado
    call StdOut

    push offset espacio3
    call StdOut
    
    push offset alturaMensaje
    call StdOut

    push 50
    push offset seleccionAltura
    call StdIn

    push offset anchoMensaje
    call StdOut
    
    push 50
    push offset seleccionAncho
    call StdIn

    push offset minasMensaje
    call StdOut
    
    push 50
    push offset seleccionMinas
    call StdIn

    push offset espacio
    call StdOut

personalizado_Aux:

    push offset cargando
    call StdOut

end start