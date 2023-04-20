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
    jz  forOne
    jmp LEN

forOne:

;***  Print the new sorted list
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code