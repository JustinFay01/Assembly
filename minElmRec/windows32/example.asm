; A solution for Week 15 day 2: find array minimum recursively
;
; Justin Fay
; April 2017

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

; Declarations.  Note that we just declare an initialized array of integers.
.DATA
resultp BYTE    "The minimum in that array is", 0
resulta BYTE    10 DUP (?)
array   DWORD   5, 20, 10, 34, 100, 2400, 2, -7, 3, -5, 4

.CODE
_MainProc PROC

        ; Load up the parameters
        mov     eax, 0   
        push    eax   
        mov     eax, 11
        push    eax    
		lea     eax, array
		push    eax  

        ; Now make the call
		mov     eax, [eax]
        call    findmin  

        ; Return: adjust the stack (throw away the parameters), print, quit.
        add     esp, 12     ; discard two of the parameters  

        dtoa    resulta, eax		
        output  resultp, resulta
              
quit:   mov     eax, 0      ; exit with return code 0
        ret
_MainProc   ENDP        

findmin	PROC

; FILL IN CODE HERE!!!
        push    ebp             ; save base pointer
        mov     ebp, esp        ; establish stack frame
        push    ebx             ; i 
        push    ecx             ; length of array
        push    edx             ; location of array

        mov     ebx, dword ptr [ebp + 16] ; --> ebp + 16 is the First Param which is the index
        mov     edx, dword ptr [ebp + 8]  ; --> ebp + 8 gets third param which is closest and passed the return val
        mov     ecx, dword ptr [ebp + 12] ; --> ebp + 12 is the Second Param which is the len of arr

        cmp ebx, ecx
        jge doneLbl
        


doneLbl:
        
        mov    eax, [edx + ebx*4]
        pop     edx
        pop     ecx
        pop     ebx
        pop     ebp             ; restore EBP
        ret                      ; return      
		
findmin ENDP

END                             ; end of source code
