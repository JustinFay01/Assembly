;  Week 14 day 1 Exercise: Bubble Sort!
;
;  Mike Jipping
;  April 2019


.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
array   DWORD   10, 30, 20, 100, 90, 30, 9, 40, 35, 0
temp    DWORD   ?
string  BYTE    100 DUP (?)
numstr  BYTE    11 DUP (?), 0
prompt1 BYTE    "Unsorted List", 0
prompt2 BYTE    "Sorted List", 0
inlimit DWORD   ?

.CODE
_MainProc PROC

;***  Print the original, unsorted list

        ; ECX holds the address of the string being built
        lea	   ecx, string

        ; EBX will hold the address of the current item in the array
        lea    ebx, array

        ; Look for the 0 at the end of the list
out1:   mov    eax, [ebx]
        cmp    al, 0
        je     outputstring

        ; Convert the number to a series of characters
        dtoa   numstr, eax

        ; Copy the characters to the string being build
        lea    edx, numstr
while1: mov     eax, [edx]
        cmp     al, 0
        jne     movechar
        add     ebx,4
        jmp     out1
movechar:
        mov     [ecx], eax      ; Move the character
        inc     edx             ; Increment counters
        inc     ecx
        jmp     while1

        ; Now output the string.
outputstring:
        output  prompt1, string


;*** Now launch into the Bubble Sort

;***************  ADD BUBBLE SORT CODE HERE


;***  Print the new sorted list

display2:
        ; ECX holds the address of the string being built
        lea	   ecx, string

        ; EBX will hold the address of the current item in the array
        lea    ebx, array

        ; Look for the 0 at the end of the list
out2:   mov    eax, [ebx]
        cmp    al, 0
        je     outputstring2

        ; Convert the number to a series of characters
        dtoa   numstr, eax

        ; Copy the characters to the string being build
        lea    edx, numstr
while2: mov     eax, [edx]
        cmp     al, 0
        jne     movechar2
        add     ebx,4
        jmp     out2
movechar2:
        mov     [ecx], eax      ; Move the character
        inc     edx             ; Increment counters
        inc     ecx
        jmp     while2

        ; Now output the string.
outputstring2:
        output  prompt1, string

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code