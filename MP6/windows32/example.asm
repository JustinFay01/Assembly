; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
inOne   DWORD   ?
outFact DWORD   ?
temp    DWORD   40 DUP (?)
prompt1 BYTE    "Enter a number", 0


.CODE
_MainProc PROC
        input   prompt1, temp, 40      ; read ASCII characters
        atod    temp          ; convert to integer
        mov     ecx, eax    ; store in memory
        mov     eax, 1
        jmp     whileLbl

whileLbl:
        mul     ecx
        dec     ecx
        jnz     whileLbl

        dtoa    outFact, eax
        output  outFact, outFact
        mov     eax, 0  ; exit with return code 0
        ret

_MainProc ENDP
END                             ; end of source code

