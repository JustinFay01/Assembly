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
        
; ///////////////////CHANGE CAPITAL TO LOWER CASE ///////////////////////
toLowerCase:
    mov ebx,[eax]       ; Get char
    cmp ebx, 0          ; Check if char is null terminator
    jz  COMPARE             ; if so jump to compare

    ; check if the value is upper case
    cmp bl, 'A'    ; check A
    jge checkZ      ; if str[i] >= 'A'
    jmp incLbl      ; else increment and restart

checkZ: ; check Z
    cmp bl, 'Z'
    jle changeCase  ; if it is <= Z then change chase
    jmp incLbl

changeCase: ; str[i] >= A && str[i] <= Z
    add bl, 32
    mov [eax], bl
    jmp incLbl

incLbl:
    inc ecx
    inc eax
    jmp toLowerCase
; /////////////////////// CAPITAL IS NOW LOWERCASE ////////////////////////

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
    ;  ECX for I values and EDI for J values
skipI:    ; check if i is a letter
    mov     al, [ecx]        ; move new value
    cmp     al, 'a'         
    jge     checkZforI      ; if str[i] >= 'a' check if it is less than z
    inc     ecx              ; else inc ecx and check again
    jmp     skipI

skipJ:    ; check if j is a letter
    mov     dl, [ebx]      ; load new value
    cmp     dl, 'a'       
    jge     checkZforJ     ; if str[j] >= a check if it is less than z
    inc     ebx            ; else inc ebx and try again
    jmp     skipJ          

doneSkip:    
    cmp     al, dl        ; if any are not equal jump to no
    jnz     REPORTNO
    
    inc     ecx                 ; i++ j--
    dec     ebx     
    cmp     ecx, ebx
    jge    REPORTYES           ; if i >= j 
    jnz     looper              ; else if ecx and ebx (i and j) are not equal continue loop otherwise report yes 

checkZforI:
    cmp al, 'z' 
    jle skipJ   ; if stir[i] <= z, its a letter jump to skip j
    inc ecx
    jmp skipI   ; else jmp back to skip i to see if the next val is letter

checkZforJ:
    cmp dl, 'z'
    jle doneSkip ; if str[j] <= z, its a letter jump to check if str[i] == str[j]
    inc ebx
    jmp skipJ    ; else jmp back to skip j to see if next val is a letter

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