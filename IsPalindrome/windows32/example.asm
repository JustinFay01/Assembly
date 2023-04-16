;   Detect palindromes
;   Mike Jipping, April 2016

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

prompt          BYTE    "Enter phrase", 0
string          BYTE    40 DUP (?)
notPalindrome   BYTE    "This is not a palindrome", 0
palindrome      BYTE    "This is a palindrome", 0
;length          DWORD   ?

.CODE

_MainProc PROC

;  Read the string from the user

        input   prompt, string, 40  
        lea     eax,    string
        mov     ebx,    [eax]
        cmp     ebx, 0
        jz      LENDONE

;  Find the length of the string
LEN:
    inc ecx
    inc eax

    mov ebx, [eax]
    cmp ebx, 0
    jz  LENDONE
    jmp LEN

LENDONE:
;  Now we have the length of the string.  Let's analyze the front 
;  of the string and the end of the string.
    mov     length, ecx




;  Report YES!
        output  prompt, palindrome
		jmp     DONE
		
;  Report NO!


    
REPORTNO:     
        output  prompt, notPalindrome

DONE:
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code