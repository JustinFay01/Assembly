; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
    outRed   DWORD      ?
    colorVal DWORD      5718773
    

.CODE
_MainProc PROC
        mov     eax, colorVal
        mov     ecx, eax
        and      ecx, 16711680
        shr     ecx, 16
        imul    ecx, 2


        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

