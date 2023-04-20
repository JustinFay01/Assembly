;  Week 14 day 1 Exercise: Bubble Sort!
;
;  Mike Jipping
;  April 2019


.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

temp    DWORD   ?
string  BYTE    100 DUP (?)
numstr  BYTE    11 DUP (?), 0
prompt1 BYTE    "Unsorted List", 0
prompt2 BYTE    "Sorted List", 0
inlimit DWORD   ?

inString DWORD   100 DUP (?)
inWrd    BYTE    "Enter a word you would like to sort", 0
strBuff  BYTE    100 DUP (?)
n        DWORD    ?
minVar   BYTE    'z'
minAdd   DWORD    ?

tmp      DWORD    ?
tmpAdd   DWORD    ?

mem      DWORD    ?
tmpChar  BYTE     ?

.CODE
_MainProc PROC

;*************** Insertion Sort Code ************************
        input inWrd, inString, 100

; start by getting len of word        
        lea eax, inString

LEN:
    inc ecx         ; ecx = lenth of str
    inc eax         

    mov ebx, [eax]
    cmp ebx, 0      ; look for null termiantor
    jz  startLbl
    jmp LEN

startLbl:
    ; get start of array, len of arr = n + 1
    ;lea eax, inString   ; ecx = i
    mov n, ecx
    mov ecx, 0

forOne:
    cmp ecx, n      ; if ecx >= n jmp loadBuff
    jge loadBuff
    ;else find minimum element index
    mov eax, inString[ecx]
    cmp minVar, al
    jg  minSwap

    ;inc ecx
    ;jmp forOne

minSwap:
    mov minAdd, ecx
    mov minVar, al
    ;inc ecx
    jmp loadJ

loadJ:
    mov esi, 0
    mov esi, ecx
    inc esi

forTwo:
    cmp esi, n              ; if esi >= n jump back to forOne
    jge forOne
    mov eax, inString[esi]  ; mov char into eax
    cmp minVar, al          ; compare minVar to arr[j]
    jg upMin                ; if min > arr[j]
    ; else inc and check again
    inc esi
    jmp forTwo
  
upMin: ; minIndex = j
    mov minAdd, esi
    mov ebx, inString[esi]
    mov minVar, bl
    inc esi
    jmp forTwo
    

loadBuff:
    lea edx, strBuff
    mov eax, 0
    mov ecx, 0
    mov ebx, 0
looper:
    cmp ecx, n
    jge doneLbl

    mov  ebx, inString[ecx]
    mov  al, bl
   
    mov strBuff[ecx], al 
    inc ecx
    jmp looper

doneLbl:
;***  Print the new sorted list
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code