.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

sentence    BYTE        100 DUP (?)
strBuff     BYTE        100 DUP (?)
inPrompt    BYTE        "Enter a sentence you would like to format", 0
n           DWORD       ?


.CODE
_MainProc PROC
    input   inPrompt, sentence, 100
    ; find len of sentece




    push strBuff    ; push param2
    push sentence   ; push param1
    call fctn1
    

        
loadBuff:
    lea edx, strBuff
    mov eax, 0
    mov ecx, 0
    mov ebx, 0
looper:
    ;cmp ecx, 
    jge doneLbl

    ;mov  bl, inString[ecx]
    mov  al, bl
   
    ;mov strBuff[ecx], al 
    inc ecx
    jmp looper

doneLbl:
;***  Print the new formatted list
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