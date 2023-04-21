.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

sentence    BYTE        100 DUP (?)
strBuff     DWORD       ?
inPrompt    BYTE        "Enter a sentence you would like to format", 0
n           DWORD       ?


.CODE
_MainProc PROC
    input   inPrompt, sentence, 100
    lea     eax, sentence
    ; find len of sentece

LEN:
    inc ecx         ; ecx = lenth of str
    inc eax         

    mov ebx, [eax]
    cmp ebx, 0      ; look for null termiantor
    jz  startLbl
    jmp LEN

startLbl:
    mov n, ecx
    mov ecx, 0
    mov ebx, 0

forLoop:
    cmp ecx, n
    jge doneLbl

    push strBuff   ;eax = strBuff             ; push param2
    push ebx       ;ebx = character to check  ; push param1
    call fctn1     ;returns formatted char already in strBuff
    
    inc ecx
    jmp forLoop


doneLbl:
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP

fctn1   PROC
        push    ebp             ; save base pointer
        mov     ebp, esp        ; establish stack frame
        push    ebx             ; save EBX









        pop     ebx             ; restore EBX
        pop     ebp             ; restore EBP
        ret                     ; return   
        



fctn1   ENDP

END                             ; end of source code