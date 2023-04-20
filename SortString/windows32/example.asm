;  Week 14 day 1 Exercise: Bubble Sort!
;
;  Mike Jipping
;  April 2019


.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

temp    DWORD   ?
string  BYTE    100 DUP (?)
numstr  BYTE    11 DUP (?), 0
prompt1 BYTE    "Unsorted List", 0
prompt2 BYTE    "Sorted List", 0
inlimit DWORD   ?

inString DWORD   100 DUP (?)
inWrd    BYTE    "Enter a word you would like to sort", 0
strBuff  BYTE    100 DUP (?)
n        DWORD    ?
minVar   BYTE    'z'
minAdd   DWORD    ?
tmp      DWORD    ?
tmpAdd   DWORD    ?
mem      DWORD    ?
tmpChar  BYTE     ?

.CODE
_MainProc PROC

;*************** Insertion Sort Code ************************
        input inWrd, inString, 100

; start by getting len of word        
        lea eax, inString

LEN:
    inc ecx         ; ecx = lenth of str
    inc eax         

    mov ebx, [eax]
    cmp ebx, 0      ; look for null termiantor
    jz  startLbl
    jmp LEN

startLbl:
    ; get start of array, len of arr = n + 1
    lea eax, inString   ; ecx = i
    mov n, ecx
    mov ecx, 0

forOne: ; Find the minimum element in unsorted array
    cmp ecx, n
    jge  doneLbl    ; if ecx < n jmp done
    ;else find smallest element
    mov bl, [ecx+eax]
    cmp minVar, bl     ; if min > bl jmp new min
    jg  newMin
    jmp setJ        ; update j with i + 1
    
  
forTwo:
    cmp edi, n
    jge swapLbl  ;if edi >= n jmp forOme
    
    mov bh, [eax+edi]   ; store the val of arr[j] in bh
    mov tmp, eax        ; mov start of arr into tmp
    mov al, minVar      ; mov minAdd into eax
    cmp bh, al          ; compare arr[j] and arr[min]
    mov eax, tmp        ; mov tmp back into eax

    jl  upJ     
    inc edi
    jmp forTwo

upJ:
    mov esi, eax
    add esi, edi
    mov minAdd, esi
   
    mov esi, 0
    inc edi
    jmp forTwo

swapLbl:
    mov esi, minAdd
    mov ebx, [esi]
    mov tmp, ebx    ; succesfully stores arr[min] in temp

    mov esi, eax    
    add esi, ecx   

    mov ebx, esi   ; ebx = i
    mov eax, [ebx]
    mov tmpChar, al ; tmpChar = array[i]

    mov ebx, minAdd ; ebx = min element address
    mov eax, 0
    mov al, tmpChar
    mov [ebx], eax  ; store arr[i] in arr[min]
    ; Successfully stores arr[i] in arr[min]
    
    lea eax, inString
    mov esi, eax    
    add esi, ecx  ;esx = i

    mov ebx, 0
    mov ebx, tmp
    mov [esi], bl 

    
    mov esi, 0
    mov ebx, 0
    inc ecx
    jmp forOne
    

newMin:
    mov minVar, bl      ; min character = arr[i]

    mov esi, eax
    add esi, ecx         ; min address = location in mem
   
    mov minAdd, esi     ; store in minAdd
    mov esi, 0
    ;inc ecx             ; inc   
    jmp setJ          ; restart
    
setJ:
    mov edi, ecx    ; set edi = j = i (ecx)
    inc edi         ; i+1 (edi++)
    jmp forTwo      ;Start innerLoop



doneLbl:
       mov ecx, 0
       lea eax, inString
       lea ebx, strBuff

whileLbl:
    cmp ecx, n
    jge helpLbl
    mov esi, [eax+ecx]
    dtoa edx, esi
    mov [ebx+ecx], edx
    jmp whileLbl

    
helpLbl:
;***  Print the new sorted list
        output  strBuff, strBuff
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code