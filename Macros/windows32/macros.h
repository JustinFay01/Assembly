.586
mystrlen MACRO string
		mov eax, 0
		lea ecx, string

LEN : cmp string[eax], 0

		je mLENGTHEND
		inc eax
		jmp LEN

mLENGTHEND :
ENDM

lettercheck MACRO reg, notLbl, jumpLbl
		mov		al, string[reg]
		cmp		al, 48
		jb      notLbl
		cmp		al, 57
		ja		jumpLbl

ENDM