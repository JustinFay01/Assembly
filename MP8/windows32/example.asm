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
resulta         BYTE    10 DUP (?)
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

COMPARE: ; ******** Call Recursive Fun ***********
;  Now we have the length of the string.  Let's analyze the front 
;  of the string and the end of the string.

        mov     strLen, ecx
        dec     strLen            ; set strLen to be one less than the null terminatior        

        ; *******Start recursive call*********
        mov     eax, 0
        push    eax             ; push i
        mov     eax, strLen     
        push    eax             ; push j (length of arr - 1)
        lea     eax, string
        push    eax             ; push starting address

        call isPal
        ; Return: adjust the stack (throw away the parameters), print, quit.
        add     esp, 12     ; discard two of the parameters  

        dtoa    resulta, eax		
        output  resulta, resulta
              
quit:   mov     eax, 0      ; exit with return code 0
        ret



_MainProc ENDP

isPal	PROC
        push    ebp             ; save base pointer
        mov     ebp, esp        ; establish stack frame
        push    edi             ; i 
        push    esi             ; j (length of array - 1)
        push    edx             ; location of array
      
        ; local variables for comparison
        push   ebx              ; Represent arr[i]

        mov     edi, dword ptr [ebp + 16] ; --> ebp + 16 is the First Param which is the index
        mov     esi, dword ptr [ebp + 12] ; --> ebp + 12 is the Second Param which is the len of arr
        mov     edx, dword ptr [ebp + 8]  ; --> ebp + 8 gets third param which is closest and passed the return val

        cmp     edi, esi        ; if i > j done
        jg      doneLbl


        mov    bl, [edx+edi]
        cmp    bl, [edx+esi]
        jnz    notPal           ; if arr[i] != arr[j] return 0

       ; else make recursive call
       inc edi  ; i++
       dec esi  ; j--

       pop ebx  ; pop local variable which is the current char

       push edi ; push i
       push esi ; push j
       push edx ; push local in mem of arr

       call isPal  ; recursive call
       add esp, 12 ; clear params


       pop     edx
       pop     esi
       pop     ebx
       pop     ebp 

       ret

doneLbl:
       pop     ebx
       pop     edx
       pop     esi
       pop     ebx
       pop     ebp 

       mov eax, 1      ; return 1
       ret
		

notPal:
        
       pop     ebx
       pop     edx
       pop     esi
       pop     ebx
       pop     ebp 

       mov eax, 0       ; return 0
       ret
		
isPal ENDP

END                             ; end of source code

