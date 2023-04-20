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
min      BYTE     'z'
tmp      BYTE      ?
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
    lea eax, inString   ; ecx = i
    mov n, ecx
    mov ecx, 0

forOne: ; Find the minimum element in unsorted array
    cmp ecx, n
    jge  doneLbl    ; if ecx < n jmp done
    ;else find smallest element
    mov bl, [ecx+eax]
    cmp min, bl     ; if min > bl jmp new min
    jg  newMin
    jmp setJ        ; update j with i + 1

    
forTwo:
    cmp edi, n      ; edi = j
    jge forOne
    mov edx, [eax+edi] ; strArray[j]
    cmp dl, min
    jl  swapLbl     ; if dl < min jmp swap
    inc edi         ; else j++
    jmp forTwo        

swapLbl:
    mov tmp, dl ; tmp = arr[j]
    mov dl,     ; min
    

setJ:
    mov edi, ecx    ; set edi = j = i (ecx)
    inc edi         ; i+1 (edi++)
    jmp forTwo      ;Start innerLoop

newMin:
    mov min, bl
    inc ecx
    jmp setJ     ; update j with i + 1

doneLbl:
;***  Print the new sorted list
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code