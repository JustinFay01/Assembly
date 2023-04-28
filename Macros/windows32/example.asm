;   Source: Mike Jipping, April 2016/2017 

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output
INCLUDE macros.h 

.STACK 4096

.DATA
prompt  BYTE    "Enter phrase", 0
string  BYTE    40 DUP (?)
notPalindrome BYTE  "This is not a palindrome", 0
palindrome    BYTE  "This is a palindrome", 0

.CODE

_MainProc PROC

        ;  Read the string from the user

        input   prompt, string, 40   

		; Find the length of the string
		mystrlen string ; Eax stores length? 

LENGTHEND:
        mov     ebx, 0
        mov     ecx, eax
        dec     ecx

CHECK: lettercheck ebx,isNotALetter1,checkUpperCase1
	   lettercheck ecx,isNotALetter2,checkUpperCase2 
		
		
COMPARE:
        cmp     al, string[ecx]
        jne     REPORTNO
        
        inc     ebx
        dec     ecx
        cmp     ebx, ecx
        jng     CHECK

        ;  Report YES!
        output  prompt, palindrome
        jmp     DONE
        
        ;  Report NO!
REPORTNO:     
        output  prompt, notPalindrome
		jmp		DONE

isNotALetter1:
		inc		ebx
		jmp		CHECK

isNotALetter2:
		dec		ecx
		jmp		CHECK

checkUpperCase1:
		cmp		al, 65
		jb		isNotALetter1
		cmp		al, 90
		ja		checkCharacter1
		jmp		COMPARE

checkUpperCase2:
		cmp		ah, 65
		jb		isNotALetter2
		cmp		ah, 90
		ja		checkCharacter2
		jmp		COMPARE

checkCharacter1:
		cmp		al, 97
		jb		isNotALetter1
		cmp		al, 122
		ja		isNotALetter1
		jmp		COMPARE

checkCharacter2:
		cmp		ah, 97
		jb		isNotALetter2
		cmp		ah, 122
		ja		isNotALetter2
		jmp		COMPARE
DONE:
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code