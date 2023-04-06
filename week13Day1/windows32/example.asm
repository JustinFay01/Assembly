; Fahrenheit to Celsius conversion
; Mike Jipping
; March 2017

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

;--------------------------------------------------------------------------------------------
; Declarations
; Note that we declare a constant in a memory location (nine) for the idiv instruction

.DATA
fahren  DWORD   ?
celsius DWORD   ?
nine    DWORD   9
ten     DWORD   10
prompt1 BYTE    "Enter the temperature in Farenheit", 0
prompt2 BYTE    "Enter tomorrows temperature in Farenheit", 0
temp2   BYTE    40 DUP (?)
temp    BYTE    40 DUP (?)
celstr  BYTE    11 DUP (?), 0
freeze  BYTE    "It's Freezing!" ,0            ; if temp is       temp < 32
cold    BYTE    "It's cold. Wear a coat!" ,0   ; if temp is 32 <= temp < 45
cool    BYTE    "It's cool out." ,0            ; if temp is 45 <= temp < 60
warm    BYTE    "This is the best weather!" ,0 ; if temp is 60 <= temp < 75
hot     BYTE    "It's summertime!"  ,0         ; if temp is       75 <= temp

hotTom  BYTE    "Tomorrow is warmer out than today.", 0
coolTom  BYTE   "Tomorrow is cooler out than today.", 0

;--------------------------------------------------------------------------------------------
; Here's the actual code.

.CODE
_MainProc PROC
        ; Input the farenheit temperature to the EAX register
        ; Both "input" and "atod" are macros
        input   prompt1, temp, 40
        atod    temp            ; convert the string starting in "temp" to integer in EAX
        mov     fahren, eax

        cmp     EAX, 32
        JL      freezeLbl ; check if freezing
        cmp     EAX, 45
        JL      coldLbl
        cmp     EAX, 60
        JL      coolLbl
        cmp     EAX, 75
        JL      warmLbl
        jmp     hotLBL

        ; now for temp comparison
backLbl: 
        input prompt2, temp2, 40
        atod  temp2 
        cmp   EAX, fahren
        JL    coolTomLbl
        JG    hotTomLbl
        

        mov     eax, 0  ; exit with return code 0
        ret

        
hotTomLbl:
        output hotTom, hotTom
        mov     eax, 0  ; exit with return code 0
        ret

coolTomLbl:
        output coolTom, coolTom
        mov     eax, 0  ; exit with return code 0
        ret
    
freezeLbl:  ; if temp is       temp < 32
        output  freeze, freeze
        jmp     backLbl

coldLbl:    ; if temp is 32 <= temp < 45
        output  cold, cold
         jmp     backLbl
coolLbl:    ; if temp is 45 <= temp < 60
        output  cool, cool
         jmp     backLbl
warmLbl:    ; if temp is 60 <= temp < 75
        output  warm, warm
         jmp     backLbl
hotLbl:     ; if temp is       75 <= temp
        output  hot, hot
        jmp     backLbl

       
_MainProc ENDP  
END                             ; end of source code
