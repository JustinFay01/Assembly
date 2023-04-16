;   Detect palindromes
;   Mike Jipping, April 2016

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

prompt  BYTE    "Enter phrase", 0
string  BYTE    40 DUP (?)
notPalindrome BYTE  "This is not a palindrome", 0
palindrome    BYTE  "This is a palindrome", 0
length  DWORD   ?

.CODE

_MainProc PROC

;  Read the string from the user

        input   prompt, string, 40   

;  Find the length of the string

;;;;;;;;;; PUT CODE HERE

;  Now we have the length of the string.  Let's analyze the front 
;  of the string and the end of the string.

;;;;;;;;;; COMPARE THE FRONT TO THE END
;;;;;;;;;; JMP TO YES if it is a palindrome
;;;;;;;;;; JMP TO NO if it is not a palindrome

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