; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

prompt          BYTE    "Enter phrase", 0
string          BYTE    40 DUP (?)
resulta BYTE    10 DUP (?)

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

COMPARE: ; ******** Call Recursive Fun ***********
    






        ; Return: adjust the stack (throw away the parameters), print, quit.
        add     esp, 12     ; discard two of the parameters  

        dtoa    resulta, eax		
        output  resulta, resulta
              
quit:   mov     eax, 0      ; exit with return code 0
        ret



_MainProc ENDP

isPal	PROC

; FILL IN CODE HERE!!!
        push    ebp             ; save base pointer
        mov     ebp, esp        ; establish stack frame
        push    ebx             ; i 
        push    ecx             ; j (length of array - 1)
        push    edx             ; location of array

        mov     ebx, dword ptr [ebp + 16] ; --> ebp + 16 is the First Param which is the index
        mov     edx, dword ptr [ebp + 8]  ; --> ebp + 8 gets third param which is closest and passed the return val
        mov     ecx, dword ptr [ebp + 12] ; --> ebp + 12 is the Second Param which is the len of arr

        cmp     ebx, ecx
        jge     doneLbl
        
        ; RECURSIVE CALL
        inc     ebx                     ; inc ebx
        mov     eax, [edx + ebx*4]      ; load new val of array
        push    ebx
        push    ecx
        push    edx
        call isPal

        ; Clear params for recursive call
        add esp, 12 
        cmp [edx + ebx*4], eax
        jl  retCurr
        jmp doneLbl

retCurr:
        mov eax, [edx + ebx*4]
        jmp doneLbl
    

doneLbl:
        pop     edx
        pop     ecx
        pop     ebx
        pop     ebp             ; restore EBP
        ret                      ; return      
		
isPal ENDP

END                             ; end of source code

