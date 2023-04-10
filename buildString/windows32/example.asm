; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

strbuff BYTE   32 DUP (?)   ;Buffer for combined strings

inOne       DWORD    ? 
inTwo       DWORD    ?
inOneStr    DWORD    ?
inTwoStr    DWORD    ?
str1        BYTE     " is less than ", 0
str2        BYTE     " is greater than ", 0
str3        BYTE     " is equal to ",0

temp        DWORD    40 DUP (?)
prompt1     BYTE    "Enter a number", 0         ; First prompt
prompt2     BYTE    "Enter another number", 0   ; Second prompt

.CODE
_MainProc PROC
        input   prompt1, temp, 40
        mov     eax, temp
        mov     inOneStr, eax 
        atod    temp 
        mov     inOne, eax

        input   prompt2, temp, 40
        mov     eax, temp
        mov     inTwoStr, eax 
        atod    temp 
        mov     inTwo, eax

        lea edx, strbuff ; get address for start of buffer

        lea ebx, inOneStr   ; Get address of first number
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

cmpLbl:
       mov eax, inOne
       cmp eax, inTwo
       jl       ltLbl
       jg      gtLbl
       je       eLbl

ltLbl:
        lea ebx, str1   ; Get address of string three
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

gtLbl:
        lea ebx, str2   ; Get address of string three
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

eLbl:
        lea ebx, str3   ; Get address of string three
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 


inTwoLbl:
        lea ebx, inTwoStr
        mov eax, [ebx]
        jmp whileLbl
doneLbl:
        output  strbuff, strbuff      ; output buff
        mov     eax, 0  ; exit with return code 0
        ret

whatjmpLbl:
    inc cx          ; inc cx first time
    cmp cx, 1      
    je  cmpLbl     ; if cx is one jmp to label 2 (second value of array of three strings)

    cmp cx, 2
    je  inTwoLbl     ; else if cx is two jmp to label 3
    jmp doneLbl     ; else output

whileLbl:  
    cmp al, 0       ; If AL register != 0 j
    je  whatjmpLbl  ; check which lbl we need to jmp to      
                      
    mov [edx], al       ; store in buffer
    inc edx             ; inc where to write inside of the buffer
    inc ebx             ; increment address
    mov eax, [ebx]      ; grab next charcter of string
    jmp whileLbl
    
_MainProc ENDP
END                             ; end of source code

