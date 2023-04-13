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

n       DWORD   ?
i       DWORD   0
j       DWORD   0
tmp     DWORD   0
tmp2    DWORD   0

t1      DWORD   0
t2      DWORD   0


testStr DWORD   10 DUP (?), 0
four    DWORD   4
lim     DWORD   ?
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

;***************  ADD BUBBLE SORT CODE HERE ************************

        lea     ebx, array          ; Grab first value of array
        mov     ecx, [ebx]          ; Load its value into eax
        ;jecxz   display2            ; if itz zero just stop 
       
        mov     i, ebx              ; i becomes index
        mov     j, ebx              ; j becomes index as well


        mov     n, LENGTHOF array
        mov     ecx, 0              ; reset ecx to 0 so we can coutn with it
        sub     n, 1                ; make it n -1
        cmp     n, 0                ; check if length of array is 0 
        ;je      display2             ; if the length is 0 the array is sorted

        jmp     forOne              ; jmp to outer for loop

forOne:
      cmp   ecx, n  ; compare ecx and n (-1) 
      je    display2 ; if equal done

      ; print value of arr
      mov   ebx, i              ; ECX = counter for for loop 1 
      mov   esi, [ebx]          ; ESI HOLDS [i] OF ARRAY 

      mov   ebx, n              ; Use ebx as temp register to find new limit for the inner for loop
      sub   ebx, ecx
      mov   lim, ebx

      lea   ebx, array          ; j is now the start of the array
      mov   j, ebx
      mov   ebx, 0 

          
      add   i, 4              ; INCREMENT i 
      inc    ecx

      jmp forTwo

    
forTwo:
      cmp   ebx, lim            ; EBX = counter for for loop 2
      jge    forOne

      mov   eax, j              ; current location in mem
      mov   edi, [eax]          ; EDI HOLDS [j] OF ARRAY 
      cmp   edi, [eax+4]        ; if array[j] > array[j+1] jmp swap 

  
      jg    swapLbl             ; jg swap

      ; ELSE
      add   j, 4                ; inc j (+4)
      inc   ebx     
      jmp forTwo                ; restart loop

; Arr = 10, 30, 20, 100, 90, 30, 9, 40, 35, 0

swapLbl:
       mov esi, [eax+4]

       
       mov [eax], esi
       mov [eax+4], edi
       

       add j, 4
       inc ebx
       jmp forTwo
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
        output  prompt2, string

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code