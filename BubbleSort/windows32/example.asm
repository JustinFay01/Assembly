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
testStr DWORD   10 DUP (?), 0
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
        jecxz   doneLbl             ; if itz zero just stop 
       
        mov     i, ebx              ; i becomes index


        mov     n, LENGTHOF array
        mov     ecx, 0              ; reset ecx to 0 so we can coutn with it
        sub     n, 1                ; make it n -1
        cmp     n, 0                ; check if length of array is 0 
        je      doneLbl             ; if the length is 0 the array is sorted

        jmp     forOne              ; jmp to outer for loop

doneLbl:
    ret

forOne:
      cmp   ecx, n  ; compare ecx and n (-1) 
      je    doneLbl ; if equal done

      ; print value of arr
      mov   ebx, i 
      mov   eax, [ebx]          ; EAX HOLDS [i] OF ARRAY 

                                ; Set new j value


     
      mov   esi, 4              ; INCREMENT i 
      add   i, esi 


      
      inc    ecx
      jmp    forOne
      ; else
      
    
      ret
forTwo:

SwapLbl:



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