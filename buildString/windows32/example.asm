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
        
        lea edx, strbuff ; get address fpr start pf n
        lea ebx, str1   ; Get address of string one
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

str2Lbl:
        lea ebx, str2   ; Get address of string one
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 

str3Lbl:
        lea ebx, str3   ; Get address of string one
        mov eax, [ebx]  ; Store
        jmp whileLbl    ; jmp to label 
doneLbl:
        output  strbuff, strbuff      ; output label and sum
        mov     eax, 0  ; exit with return code 0
        ret



whileLbl:  
    cmp al, 0       ; If AL register != 0 j
    je  doneLbl          
    
                    
    mov [edx], al       ; store in buffer
    inc edx
    inc ebx             ; increment address
    mov eax, [ebx]      ; grab next charcter of string
    jmp whileLbl

                                    ; jmp to cx position
                    ; if cx == 1 
                        ;jmp 1
                    ; if cx == 2
                        ; jmp 2
    
_MainProc ENDP
END                             ; end of source code

