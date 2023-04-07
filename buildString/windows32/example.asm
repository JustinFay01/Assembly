; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

strbuff BYTE   32 DUP (?)
str1    BYTE    "Justin", 0
str2    BYTE    " is ", 0
str3    BYTE     "cool",0


string  BYTE    40 DUP (?)
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        
        lea edx, strbuff ; get address for start of buffer

        lea ebx, str1   ; Get address of string one
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

str2Lbl:
        lea ebx, str2   ; Get address of string two
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

str3Lbl:
        lea ebx, str3   ; Get address of string three
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 
doneLbl:
        output  strbuff, strbuff      ; output buff
        mov     eax, 0  ; exit with return code 0
        ret

whatjmpLbl:
    inc cx         ;inc cx first time
    cmp cx, 1      
    je  str2lbl    ; if cx is one jmp to label 2 (second value of array of three strings)
    cmp cx, 2
    je  str3lbl     ; else if cx is two jmp to label 3
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

