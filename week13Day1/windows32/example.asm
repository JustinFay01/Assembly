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
temp    BYTE    40 DUP (?)
celstr  BYTE    11 DUP (?), 0
freeze  BYTE    "It's Freezing!" ,0            ; if temp is       temp < 32
cold    BYTE    "It's cold. Wear a coat!" ,0   ; if temp is 32 <= temp < 45
cool    BYTE    "It's cool out." ,0            ; if temp is 45 <= temp < 60
warm    BYTE    "This is the best weather!" ,0 ; if temp is 60 <= temp < 75
hot     BYTE    "It's summertime!"  ,0         ; if temp is       75 <= temp

;--------------------------------------------------------------------------------------------
; Here's the actual code.

.CODE
_MainProc PROC
        ; Input the farenheit temperature to the EAX register
        ; Both "input" and "atod" are macros
        input   prompt1, temp, 40
        atod    temp            ; convert the string starting in "temp" to integer in EAX
        mov     fahren, eax


        output  freeze, freeze ; output 

        ; Done! Return
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code
