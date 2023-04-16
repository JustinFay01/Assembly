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
strLen          DWORD   ?

.CODE
_MainProc PROC

;  Read the string from the user

        input   prompt, string, 40  
        lea     eax,    string
        mov     ebx,    [eax]
        cmp     ebx, 0
        jz      COMPARE

;  Find the length of the string
LEN:
    inc ecx         ; ecx = lenth of str
    inc eax

    mov ebx, [eax]
    cmp ebx, 0      ; look for null termiantor
    jz  COMPARE
    jmp LEN

COMPARE:
;  Now we have the length of the string.  Let's analyze the front 
;  of the string and the end of the string.
    mov     strLen, ecx
    dec     strLen            ; set strLen to be one less than the null terminatior

    lea     ecx, string       ; reset ecx for start of array 
    mov     ebx, strLen       ; Store length of array in ebx
    add     ebx, ecx          ; add length of array and starting point in memory of array                           
                              ; use ebx for end of array
looper:
    ; ESI for I values and EDI for J values
    mov     al, [ecx]       
    mov     dl, [ebx]

    cmp     al, dl        ; if any are not equal jump to no
    jnz     REPORTNO
        
    
    inc     ecx                 ; i++ j--
    dec     ebx     
    cmp     ecx, ebx
    jnle    REPORTYES           ; if i > j 
    jnz     looper              ; else if ecx and ebx (i and j) are not equal continue loop otherwise report yes 
    

REPORTYES:
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