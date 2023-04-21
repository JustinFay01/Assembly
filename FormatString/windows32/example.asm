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
    lea esi, strBuff

forLoop:
    cmp ecx, n
    jge doneLbl

    mov bl, sentence[ecx]

    push esi       ;esi = strBuff location in mem   ; push param2
    push ebx       ;ebx = character to check        ; push param1
    call fctn1     ;returns formatted char already in strBuff
    
    inc ecx
    jmp forLoop


doneLbl:
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP


; Func needs to check if string is upper or lower case
; Change accordingly 
; return the change in the correct indec of strBuff

fctn1   PROC
        push    ebp             ; save base pointer
        mov     ebp, esp        ; establish stack frame
        lea     eax, strBuff
        
        ; first check ecx
        cmp ecx, 0
        jz  chkLowera   ; if 0 jmp to check if lower case

        ; else ; chk upperA (CHARACTER STORED IN BL(EBX))
        cmp bl, 'A' ; if bl >= A
        jge chkUpperZ  ; jmp to check upperZ
        jmp addBuff    ; else jmp to just add it (special char)
        
              

chkLowera: ; checks if bl >= 'a'
    cmp bl, 'a'
    jge chkLowerz
    jmp addBuff

chkLowerz:  ; checks if bl <= 'z', if so change bl to UpperCase and jmp add bl to Buff
    cmp bl, 'z' 
    jg addBuff ;if bl > z then its not a letter and move on

    ;else move to upper case
     sub bl, 32 
     jmp addBuff

chkUpperZ: ; checks if n; <= 'Z', if so change bl toLowerCase nad jmp add bl to Buff
    cmp bl, 'Z'
    jg addBuff

    add bl, 32
    jmp addBuff

addBuff:    ; add bl to buff 
    mov  [esi + ecx], bl

        pop     ebp             ; restore EBP
        ret                     ; return   

fctn1   ENDP

END                             ; end of source code